Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F36981A23B1
	for <loongarch@lists.linux.dev>; Thu, 24 Apr 2025 06:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745476735; cv=none; b=rIHwMsEAIvrmniv0oM13YqaG2hrmKZbFI3IJ8LhuQmQlrWVSuvJFw0kNWywS5mG+F7hoh+Am4iu1hjQgA0KwF3YjIjEXWRmstXCxvgFWKkf0B/5elEB5LChjF/W5B6KdfPBuHJszUoIhLaobkTxNQixQyVC4Ep7O9wbknR3oge8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745476735; c=relaxed/simple;
	bh=6DfyKxy4Irk863tKGrYcyu34xpRr1zF/UCKKSkYi7bA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=s0ECrIDlVH+TZd1f32l8mAIhzIDoggrqROeMpDuMb/OsOiIw3aC862Sq3ZeUn8+t7A00xRNI50aFZXB0XR+o0WUc/cB2aFGR5Upn5hf9r/p6eV2kIxFL0y3BltNfZi1d2Q8HeVHtYMsoGl9tPWocnRP5XDtEzhu59sjUyMwPG94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8DxWOF53Aloqh7FAA--.64001S3;
	Thu, 24 Apr 2025 14:38:49 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowMDxH+V23AlouhaTAA--.39561S2;
	Thu, 24 Apr 2025 14:38:48 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] LoongArch: KVM: Fully clear some registers when VM reboot
Date: Thu, 24 Apr 2025 14:38:46 +0800
Message-Id: <20250424063846.3927992-1-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMDxH+V23AlouhaTAA--.39561S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Some registers such as LOONGARCH_CSR_ESTAT and LOONGARCH_CSR_GINTC
are partly cleared with function _kvm_set_csr(). This comes from hardware
specification, some bits are read only in VM mode, and however it can be
written in host mode. So it is partly cleared in VM mode, and can be fully
cleared in host mode.

These read only bits show pending interrupt or exception status. When VM
reset, the read-only bits should be cleared, otherwise vCPU will receive
unknown interrupts in boot stage.

Here registers LOONGARCH_CSR_ESTAT/LOONGARCH_CSR_GINTC are fully cleared
in ioctl KVM_REG_LOONGARCH_VCPU_RESET vCPU reset path.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/kvm/vcpu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
index 8e427b379661..80b2316d6f58 100644
--- a/arch/loongarch/kvm/vcpu.c
+++ b/arch/loongarch/kvm/vcpu.c
@@ -902,6 +902,14 @@ static int kvm_set_one_reg(struct kvm_vcpu *vcpu,
 			vcpu->arch.st.guest_addr = 0;
 			memset(&vcpu->arch.irq_pending, 0, sizeof(vcpu->arch.irq_pending));
 			memset(&vcpu->arch.irq_clear, 0, sizeof(vcpu->arch.irq_clear));
+
+			/*
+			 * When vCPU reset, clear the ESTAT and GINTC registers
+			 * And the other CSR registers are cleared with function
+			 * _kvm_set_csr().
+			 */
+			kvm_write_sw_gcsr(vcpu->arch.csr, LOONGARCH_CSR_GINTC, 0);
+			kvm_write_sw_gcsr(vcpu->arch.csr, LOONGARCH_CSR_ESTAT, 0);
 			break;
 		default:
 			ret = -EINVAL;

base-commit: 9d7a0577c9db35c4cc52db90bc415ea248446472
-- 
2.39.3

