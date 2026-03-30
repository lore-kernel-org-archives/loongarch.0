Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBCC93947B8
	for <loongarch@lists.linux.dev>; Mon, 30 Mar 2026 03:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774843128; cv=none; b=lTgFtz3Sx9BzvRXj7odl3P0nm2rJJtSB4hBqnrlMMm9b/dJ5iuioFtfWh46ZbhxemYiC02MT/e93PNAOQ3TSSB1N104XWXMGocJ7hFnyHfwOXzhqGBRXZBgPoVqnKzF+g7d0MrOXyCYPw0LcT0uxaW69TnodtaRuvsKrF+xhR+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774843128; c=relaxed/simple;
	bh=T0a4jKfMxPO27EU8Nd2EIEU7SOWH2R6MvU9taMXL91w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lIhUIfEhwu6QIELUtnerKKRcbIlZWt8qBZOO1GShJLgw5rcjr0bHpk4uNgZH1woJnd8g7FBGUGALKDmnYcwnryMlRnC5uCZz9+SLE8q50LudfhtOSpDG+icxmZKiwHVWRXaCX0YAQ87ldjelWpJXRmGZS7l7B/D0quT6aLL7tcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8Bx36vv9MlpTtIfAA--.31390S3;
	Mon, 30 Mar 2026 11:58:39 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowJAx28Hu9MlpxHFgAA--.51612S3;
	Mon, 30 Mar 2026 11:58:38 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: kernel@xen0n.name,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] LoongArch: KVM: Use vm_guest_has_fpu API in kvm_lose_fpu()
Date: Mon, 30 Mar 2026 11:58:31 +0800
Message-Id: <20260330035832.2204720-6-maobibo@loongson.cn>
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
X-CM-TRANSID:qMiowJAx28Hu9MlpxHFgAA--.51612S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

In kvm_lose_fpu() FPU state will save in vcpu::arch::fpu, its FPU
state comes from vcpu->arch.aux_inuse. Instead existing API
vm_guest_has_xxx() can be used also, and bit KVM_LARCH_LASX and
KVM_LARCH_LSX in arch.aux_inuse can be removed.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/kvm/vcpu.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
index 8c3d6e1a5ed2..920f3101ed3d 100644
--- a/arch/loongarch/kvm/vcpu.c
+++ b/arch/loongarch/kvm/vcpu.c
@@ -1418,24 +1418,27 @@ int kvm_own_lasx(struct kvm_vcpu *vcpu)
 /* Save context and disable FPU */
 void kvm_lose_fpu(struct kvm_vcpu *vcpu)
 {
+	if (!(vcpu->arch.aux_inuse & KVM_LARCH_FPU))
+		return;
+
 	preempt_disable();
 
 	kvm_check_fcsr_alive(vcpu);
-	if (vcpu->arch.aux_inuse & KVM_LARCH_LASX) {
+	if (kvm_guest_has_lasx(&vcpu->arch)) {
 		kvm_save_lasx(&vcpu->arch.fpu);
 		vcpu->arch.aux_inuse &= ~(KVM_LARCH_LSX | KVM_LARCH_FPU | KVM_LARCH_LASX);
 		trace_kvm_aux(vcpu, KVM_TRACE_AUX_SAVE, KVM_TRACE_AUX_LASX);
 
 		/* Disable LASX & LSX & FPU */
 		clear_csr_euen(CSR_EUEN_FPEN | CSR_EUEN_LSXEN | CSR_EUEN_LASXEN);
-	} else if (vcpu->arch.aux_inuse & KVM_LARCH_LSX) {
+	} else if (kvm_guest_has_lsx(&vcpu->arch)) {
 		kvm_save_lsx(&vcpu->arch.fpu);
 		vcpu->arch.aux_inuse &= ~(KVM_LARCH_LSX | KVM_LARCH_FPU);
 		trace_kvm_aux(vcpu, KVM_TRACE_AUX_SAVE, KVM_TRACE_AUX_LSX);
 
 		/* Disable LSX & FPU */
 		clear_csr_euen(CSR_EUEN_FPEN | CSR_EUEN_LSXEN);
-	} else if (vcpu->arch.aux_inuse & KVM_LARCH_FPU) {
+	} else {
 		kvm_save_fpu(&vcpu->arch.fpu);
 		vcpu->arch.aux_inuse &= ~KVM_LARCH_FPU;
 		trace_kvm_aux(vcpu, KVM_TRACE_AUX_SAVE, KVM_TRACE_AUX_FPU);
-- 
2.39.3

