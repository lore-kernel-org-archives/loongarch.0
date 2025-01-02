Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9074FA95E
	for <loongarch@lists.linux.dev>; Thu,  2 Jan 2025 08:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735806995; cv=none; b=dqFR4xxCjJONrflGR/h+hJ4r2qOuB9m5F/sfLD1tubFdDBD41XFdauLFTxI+jkEXSo5r08z4uOYtmRgvEBiZH6l5CpDRzdJLAM/EhwS2czkNmmC7FV/Rq0eD6ieCf4Wmclsbt35T3hEiY5ZlfpdoIk/nR+2BELhehuXKuO74ZgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735806995; c=relaxed/simple;
	bh=Pkpd7eOAunjh+Elg26FVESWDLKs9H48QA/g2bjfo42Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bOWBe9fJ6elHR17NJUl0KA3sZtL9R/ufe3Wp2lPn82syQdWB4Z7HulzUfbRv84biHdl8IZak58lr0NWwX+9kcdN8HR+JhfUTjfjZYMo7AcCCGE9wGiSpkn9I/fu6svyoRj0QOZAQicI5wwOFKwHWY14EG6Hlz0dxKrMHppyNoDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8DxWOEKUHZnjjBdAA--.51934S3;
	Thu, 02 Jan 2025 16:36:26 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowMDx_8cKUHZn3DURAA--.16175S2;
	Thu, 02 Jan 2025 16:36:26 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Tianrui Zhao <zhaotianrui@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] LoongArch: KVM: Clear LLBCTL if secondary mmu mapping is changed
Date: Thu,  2 Jan 2025 16:36:25 +0800
Message-Id: <20250102083625.2577378-1-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMDx_8cKUHZn3DURAA--.16175S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Register LLBCTL is separated CSR register from host, host exception
eret instruction will clear host LLBCTL CSR register, guest
exception will clear guest LLBCTL CSR register.

VCPU0 atomic64_fetch_add_unless     VCPU1 atomic64_fetch_add_unless
     ll.d    %[p],  %[c]
     beq     %[p],  %[u], 1f
Here secondary mmu mapping is changed, host hpa page is replaced
with new page. And VCPU1 executed atomic instruction on new
page.
                                       ll.d    %[p],  %[c]
                                       beq     %[p],  %[u], 1f
                                       add.d   %[rc], %[p], %[a]
                                       sc.d    %[rc], %[c]
     add.d   %[rc], %[p], %[a]
     sc.d    %[rc], %[c]
LLBCTL is set on VCPU0 and it represents the memory is not modified
bt other VCPUs, sc.d will modify the memory directly.

Here clear guest LLBCTL_WCLLB register when mapping is the changed.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/kvm/main.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/loongarch/kvm/main.c b/arch/loongarch/kvm/main.c
index 396fed2665a5..7566fa85f8e7 100644
--- a/arch/loongarch/kvm/main.c
+++ b/arch/loongarch/kvm/main.c
@@ -245,6 +245,24 @@ void kvm_check_vpid(struct kvm_vcpu *vcpu)
 		trace_kvm_vpid_change(vcpu, vcpu->arch.vpid);
 		vcpu->cpu = cpu;
 		kvm_clear_request(KVM_REQ_TLB_FLUSH_GPA, vcpu);
+
+		/*
+		 * LLBCTL is separated CSR register from host, general exception
+		 * eret instruction in host mode clears host LLBCTL register,
+		 * and clears guest register in guest mode. eret in refill
+		 * exception does not clear LLBCTL register.
+		 *
+		 * When second mmu mapping is changed, guest OS does not know
+		 * even if the content is changed after mapping is changed
+		 *
+		 * Here clear guest LLBCTL register when mapping is changed,
+		 * else if mapping is changed when guest is executing
+		 * LL/SC pair, LL loads with old address and set LLBCTL flag,
+		 * SC checks LLBCTL flag and store new address successfully
+		 * since LLBCTL_WCLLB is on, even if memory with new address is
+		 * changed on other VCPUs.
+		 */
+		set_gcsr_llbctl(CSR_LLBCTL_WCLLB);
 	}
 
 	/* Restore GSTAT(0x50).vpid */

base-commit: fc033cf25e612e840e545f8d5ad2edd6ba613ed5
-- 
2.39.3

