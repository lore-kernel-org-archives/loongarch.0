Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7766D17B502
	for <loongarch@lists.linux.dev>; Fri,  7 Feb 2025 03:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738898807; cv=none; b=u3CH+HU/mbW0Uyl6D6bL93Xh5yiBFAq/ky2klznLMWukR3FJ324ff9wgtPoW1lMBKbpKnL2M/FkPKQv5NcWhwLpZ+prRjSn6ppkfMoswirW5QP+Lw7QjX44SQ5vrjtj6AOECeYk5nOWbxcRg9BgPaL87HlzPQKx9UgSGJLGyt8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738898807; c=relaxed/simple;
	bh=02FGwJ1b4L+Qmh0mt8jK4ZSLOxYlbCsmrNC1feJZQn4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M+q2yncibkKqN1n0PqhhNfS/0YD24tGINwDjI0Pg39uxufaask4RYS8r8S2Yl1eSSCK0IAvXd4KBM2zz27EI+tG0pqXPySaSB21f56OCJfUabtESsuugwY0Ey0TtKN4OLmHvAGnW2X76d+OjAJL2aGCxB0Pu77olD7giTc66xDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8DxvnNrfaVnPTFuAA--.28986S3;
	Fri, 07 Feb 2025 11:26:35 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowMDx_MRqfaVn0JsDAA--.12326S4;
	Fri, 07 Feb 2025 11:26:35 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Tianrui Zhao <zhaotianrui@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] LoongArch: KVM: Remove duplicated cache attribute setting
Date: Fri,  7 Feb 2025 11:26:33 +0800
Message-Id: <20250207032634.2333300-3-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20250207032634.2333300-1-maobibo@loongson.cn>
References: <20250207032634.2333300-1-maobibo@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMDx_MRqfaVn0JsDAA--.12326S4
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Cache attribute comes from GPA->HPA secondary mmu page table and is
configured when kvm is enabled. It is the same for all VMs, remove
duplicated cache attribute setting on vCPU context switch.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/kvm/vcpu.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
index fb72095c8077..20f941af3e9e 100644
--- a/arch/loongarch/kvm/vcpu.c
+++ b/arch/loongarch/kvm/vcpu.c
@@ -1548,9 +1548,6 @@ static int _kvm_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 
 	/* Restore timer state regardless */
 	kvm_restore_timer(vcpu);
-
-	/* Control guest page CCA attribute */
-	change_csr_gcfg(CSR_GCFG_MATC_MASK, CSR_GCFG_MATC_ROOT);
 	kvm_make_request(KVM_REQ_STEAL_UPDATE, vcpu);
 
 	/* Restore hardware PMU CSRs */
-- 
2.39.3

