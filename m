Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15619390CAE
	for <loongarch@lists.linux.dev>; Mon, 30 Mar 2026 03:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774843126; cv=none; b=DYLyH0RI46KNUHdF4M3lubLINois5ggY3CHW/lkRKg2YqG1wQiChGmpwCXR0yndsmAlr67Rjh7JmFhcPBlRA4wKu2BmRLUjCN+HwlF/62AILM7tj7nQujhLXqgVMU3I/N3WCJU9G3/eXWIY09J2eQUFIQJXsavLrwn73/Qp7oRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774843126; c=relaxed/simple;
	bh=YtpjlH7StWwQFlesx8SN9c2wzYgTTE48IW9v3EblGLw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A3nXpBhKmhLtIPbrzzuVZO3bP2oufJNjSVFwRBao8Rc8VtEQ81bh9Qr7uKEZV5RYw/355O/GzoVtVpDSzYGEmqjfb1w8E/Ikln2YXWp7mz/vvUWTUhXywb6K/p6e/X7JpGAobhLKfZgQC4d8q7rB+ckD82X7nFOTnB+Y7DuvXc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8Dx_8Ps9MlpQtIfAA--.25317S3;
	Mon, 30 Mar 2026 11:58:36 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowJCx_8Lq9MlpwXFgAA--.53173S4;
	Mon, 30 Mar 2026 11:58:35 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: kernel@xen0n.name,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/6] LoongArch: KVM: Enable FPU with max VM supported FPU type
Date: Mon, 30 Mar 2026 11:58:28 +0800
Message-Id: <20260330035832.2204720-3-maobibo@loongson.cn>
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
X-CM-TRANSID:qMiowJCx_8Lq9MlpwXFgAA--.53173S4
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

There are three FPU type FPU/LSX/LASX representing FPU64, FPU128 and
FPU256, and now lazy FPU method is used with FPU enabling. There are
three different HW FPU exception code with different FPU type.

The exising method is to enable specified FPU type with responding
FPU exeception. Supposing application uses FPU64 and FPU256, there
will be FPU256 exception when FPU256 type is used.

Here enable FPU with VM supported type directly, it can avoid unnecessary
FPU exception in future if further FPU type is used.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/include/asm/kvm_host.h |  1 -
 arch/loongarch/kvm/exit.c             |  9 ++-------
 arch/loongarch/kvm/vcpu.c             | 19 +++++--------------
 3 files changed, 7 insertions(+), 22 deletions(-)

diff --git a/arch/loongarch/include/asm/kvm_host.h b/arch/loongarch/include/asm/kvm_host.h
index 035e698309d0..7cd883a8281f 100644
--- a/arch/loongarch/include/asm/kvm_host.h
+++ b/arch/loongarch/include/asm/kvm_host.h
@@ -203,7 +203,6 @@ struct kvm_vcpu_arch {
 
 	/* Which auxiliary state is loaded (KVM_LARCH_*) */
 	unsigned int aux_inuse;
-	unsigned int aux_ldtype;
 
 	/* FPU state */
 	struct loongarch_fpu fpu FPU_ALIGN;
diff --git a/arch/loongarch/kvm/exit.c b/arch/loongarch/kvm/exit.c
index 3e06a66a90f8..ddc3f4cc510b 100644
--- a/arch/loongarch/kvm/exit.c
+++ b/arch/loongarch/kvm/exit.c
@@ -754,7 +754,6 @@ static int kvm_handle_fpu_disabled(struct kvm_vcpu *vcpu, int ecode)
 		return RESUME_HOST;
 	}
 
-	vcpu->arch.aux_ldtype = KVM_LARCH_FPU;
 	kvm_make_request(KVM_REQ_AUX_LOAD, vcpu);
 
 	return RESUME_GUEST;
@@ -795,10 +794,8 @@ static int kvm_handle_lsx_disabled(struct kvm_vcpu *vcpu, int ecode)
 {
 	if (!kvm_guest_has_lsx(&vcpu->arch))
 		kvm_queue_exception(vcpu, EXCCODE_INE, 0);
-	else {
-		vcpu->arch.aux_ldtype = KVM_LARCH_LSX;
+	else
 		kvm_make_request(KVM_REQ_AUX_LOAD, vcpu);
-	}
 
 	return RESUME_GUEST;
 }
@@ -815,10 +812,8 @@ static int kvm_handle_lasx_disabled(struct kvm_vcpu *vcpu, int ecode)
 {
 	if (!kvm_guest_has_lasx(&vcpu->arch))
 		kvm_queue_exception(vcpu, EXCCODE_INE, 0);
-	else {
-		vcpu->arch.aux_ldtype = KVM_LARCH_LASX;
+	else
 		kvm_make_request(KVM_REQ_AUX_LOAD, vcpu);
-	}
 
 	return RESUME_GUEST;
 }
diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
index 2f2c1cbe127c..144e26e1ed68 100644
--- a/arch/loongarch/kvm/vcpu.c
+++ b/arch/loongarch/kvm/vcpu.c
@@ -239,21 +239,12 @@ static void kvm_late_check_requests(struct kvm_vcpu *vcpu)
 		}
 
 	if (kvm_check_request(KVM_REQ_AUX_LOAD, vcpu)) {
-		switch (vcpu->arch.aux_ldtype) {
-		case KVM_LARCH_FPU:
-			kvm_own_fpu(vcpu);
-			break;
-		case KVM_LARCH_LSX:
-			kvm_own_lsx(vcpu);
-			break;
-		case KVM_LARCH_LASX:
+		if (kvm_guest_has_lasx(&vcpu->arch))
 			kvm_own_lasx(vcpu);
-			break;
-		default:
-			break;
-		}
-
-		vcpu->arch.aux_ldtype = 0;
+		else if (kvm_guest_has_lsx(&vcpu->arch))
+			kvm_own_lsx(vcpu);
+		else
+			kvm_own_fpu(vcpu);
 	}
 
 	if (kvm_check_request(KVM_REQ_LBT_LOAD, vcpu))
-- 
2.39.3

