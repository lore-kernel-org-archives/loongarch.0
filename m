Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1813D3939C1
	for <loongarch@lists.linux.dev>; Mon, 30 Mar 2026 04:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774843209; cv=none; b=VMO/hOYkZU4EF0lJ8+dt6vNkmtgh8RImJiv+/nT934t2j5yIvFoFKH+SoyYFmIXoGMrTv6JETTRDFW605qBUhz+Qx6AJVfJ2MbPJ2Z2t/HaDt2BMcTyZWrf/uGScHBaSUn0EX08sshntyyJc5gggsbuyChXOogw2zwhE4Ln+pG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774843209; c=relaxed/simple;
	bh=HU529NctrH2zE06G/mq3hAziuZ3YwbmpXuJQwTlb3d8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p9+wCng9RUZtvOEtblnQjZufB7GpWCTMPdzowMoIgIUAzwzoEfA5ODlqX4kY2JxtPK4M2MAX7Syf0N1grRefu//EirVnP0jLv4tJE5kFq8oBu1ku08Dq5TY6MkDdyEHcF0vSbT7IUcBbL1ZP1GOPTWZCLZrr09kY0661e5d//8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8Dx_6vv9MlpUdIfAA--.31402S3;
	Mon, 30 Mar 2026 11:58:39 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowJAx28Hu9MlpxHFgAA--.51612S4;
	Mon, 30 Mar 2026 11:58:39 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: kernel@xen0n.name,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] LoongArch: KVM: Remove KVM_LARCH_LASX and KVM_LARCH_LSX
Date: Mon, 30 Mar 2026 11:58:32 +0800
Message-Id: <20260330035832.2204720-7-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20260330035832.2204720-1-maobibo@loongson.cn>
References: <20260330035832.2204720-1-maobibo@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAx28Hu9MlpxHFgAA--.51612S4
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Bit KVM_LARCH_LASX and KVM_LARCH_LSX represents whether LASX/LSX is
enabled. Instead combination of KVM_LARCH_FPU and kvm_guest_has_lasx()
has the same effect.

Here remove KVM_LARCH_LASX and KVM_LARCH_LSX, make the logic simpler.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/include/asm/kvm_host.h | 2 --
 arch/loongarch/kvm/vcpu.c             | 8 +++-----
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/arch/loongarch/include/asm/kvm_host.h b/arch/loongarch/include/asm/kvm_host.h
index 9e0568c3c7f9..4a481589ddb2 100644
--- a/arch/loongarch/include/asm/kvm_host.h
+++ b/arch/loongarch/include/asm/kvm_host.h
@@ -157,8 +157,6 @@ enum emulation_result {
 };
 
 #define KVM_LARCH_FPU		(0x1 << 0)
-#define KVM_LARCH_LSX		(0x1 << 1)
-#define KVM_LARCH_LASX		(0x1 << 2)
 #define KVM_LARCH_LBT		(0x1 << 3)
 #define KVM_LARCH_PMU		(0x1 << 4)
 #define KVM_LARCH_SWCSR_LATEST	(0x1 << 5)
diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
index 920f3101ed3d..9a8f026275a5 100644
--- a/arch/loongarch/kvm/vcpu.c
+++ b/arch/loongarch/kvm/vcpu.c
@@ -1393,7 +1393,7 @@ int kvm_own_lsx(struct kvm_vcpu *vcpu)
 	kvm_restore_lsx(&vcpu->arch.fpu);
 
 	trace_kvm_aux(vcpu, KVM_TRACE_AUX_RESTORE, KVM_TRACE_AUX_LSX);
-	vcpu->arch.aux_inuse |= KVM_LARCH_LSX | KVM_LARCH_FPU;
+	vcpu->arch.aux_inuse |= KVM_LARCH_FPU;
 
 	return 0;
 }
@@ -1409,7 +1409,7 @@ int kvm_own_lasx(struct kvm_vcpu *vcpu)
 	kvm_restore_lasx(&vcpu->arch.fpu);
 
 	trace_kvm_aux(vcpu, KVM_TRACE_AUX_RESTORE, KVM_TRACE_AUX_LASX);
-	vcpu->arch.aux_inuse |= KVM_LARCH_LASX | KVM_LARCH_LSX | KVM_LARCH_FPU;
+	vcpu->arch.aux_inuse |= KVM_LARCH_FPU;
 
 	return 0;
 }
@@ -1426,26 +1426,24 @@ void kvm_lose_fpu(struct kvm_vcpu *vcpu)
 	kvm_check_fcsr_alive(vcpu);
 	if (kvm_guest_has_lasx(&vcpu->arch)) {
 		kvm_save_lasx(&vcpu->arch.fpu);
-		vcpu->arch.aux_inuse &= ~(KVM_LARCH_LSX | KVM_LARCH_FPU | KVM_LARCH_LASX);
 		trace_kvm_aux(vcpu, KVM_TRACE_AUX_SAVE, KVM_TRACE_AUX_LASX);
 
 		/* Disable LASX & LSX & FPU */
 		clear_csr_euen(CSR_EUEN_FPEN | CSR_EUEN_LSXEN | CSR_EUEN_LASXEN);
 	} else if (kvm_guest_has_lsx(&vcpu->arch)) {
 		kvm_save_lsx(&vcpu->arch.fpu);
-		vcpu->arch.aux_inuse &= ~(KVM_LARCH_LSX | KVM_LARCH_FPU);
 		trace_kvm_aux(vcpu, KVM_TRACE_AUX_SAVE, KVM_TRACE_AUX_LSX);
 
 		/* Disable LSX & FPU */
 		clear_csr_euen(CSR_EUEN_FPEN | CSR_EUEN_LSXEN);
 	} else {
 		kvm_save_fpu(&vcpu->arch.fpu);
-		vcpu->arch.aux_inuse &= ~KVM_LARCH_FPU;
 		trace_kvm_aux(vcpu, KVM_TRACE_AUX_SAVE, KVM_TRACE_AUX_FPU);
 
 		/* Disable FPU */
 		clear_csr_euen(CSR_EUEN_FPEN);
 	}
+	vcpu->arch.aux_inuse &= ~KVM_LARCH_FPU;
 	kvm_lose_lbt(vcpu);
 
 	preempt_enable();
-- 
2.39.3

