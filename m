Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69EA02D1303
	for <loongarch@lists.linux.dev>; Tue, 26 May 2026 12:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779799993; cv=none; b=G3GrzLsRMBLO5OBAw9R3965/N530jjfHB76N87U/1wOBEcOyNDHfXM+R6Tk2L8cFTqWrrDjxpYnKMEBCdekDpmEZvrbZ7CdYfVz5LtwES/d0QkeqWpaRhx2l4IG80JkKszRUNeru+sRhYib0SlWy/RxS2v3+OAWC2D7NJeG8BiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779799993; c=relaxed/simple;
	bh=AiEVm5E86Hgwhs2FlN6CBUirFybgc1DvnzdIK6J01do=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hCIKzZXfyzGQ3ROiXZkRPTEfZ4m1IRZ8hJ5ovsoXUH5PSvidXgGGWsnLo9LzYoLhIHUOuGxBVSP9QQhuOxShpnxbWzGPabrllQIf2Q4MZjEDeCT4snFHkTuWTSCY39KtavVKs0Y/jGlg30T7IQtDtL5NMUkHd9LDrROZq7ZDpHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8BxT+qvlxVqK2gNAA--.37766S3;
	Tue, 26 May 2026 20:53:03 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowJBxpsCulxVqb5iRAA--.44615S3;
	Tue, 26 May 2026 20:53:03 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: kernel@xen0n.name,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 5/6] LoongArch: KVM: Add valid bit check when set ESTAT CSR register
Date: Tue, 26 May 2026 20:52:54 +0800
Message-Id: <20260526125256.2511876-6-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20260526125256.2511876-1-maobibo@loongson.cn>
References: <20260526125256.2511876-1-maobibo@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxpsCulxVqb5iRAA--.44615S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

When set ESTAT CSR register in function _kvm_setcsr(), valid bit check
is added here. Also interrupt CPU_AVEC is checked by msgint feature.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/kvm/vcpu.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
index ebd432da3ca4..3c6726e00531 100644
--- a/arch/loongarch/kvm/vcpu.c
+++ b/arch/loongarch/kvm/vcpu.c
@@ -602,7 +602,7 @@ struct kvm_vcpu *kvm_get_vcpu_by_cpuid(struct kvm *kvm, int cpuid)
 
 static int _kvm_getcsr(struct kvm_vcpu *vcpu, unsigned int id, u64 *val)
 {
-	unsigned long gintc;
+	unsigned long gintc, estat;
 	struct loongarch_csrs *csr = vcpu->arch.csr;
 
 	if (get_gcsr_flag(id) & INVALID_GCSR)
@@ -621,8 +621,9 @@ static int _kvm_getcsr(struct kvm_vcpu *vcpu, unsigned int id, u64 *val)
 		preempt_enable();
 
 		/* ESTAT IP0~IP7 get from GINTC */
-		gintc = kvm_read_sw_gcsr(csr, LOONGARCH_CSR_GINTC) & 0xff;
-		*val = kvm_read_sw_gcsr(csr, LOONGARCH_CSR_ESTAT) | (gintc << 2);
+		gintc = kvm_read_sw_gcsr(csr, LOONGARCH_CSR_GINTC) & KVM_GINTC_IRQ_MASK;
+		estat = kvm_read_sw_gcsr(csr, LOONGARCH_CSR_ESTAT) & ~KVM_ESTAT_HWI_MASK;
+		*val = estat | (gintc << GINTC_VIP_DELTA);
 		return 0;
 	}
 
@@ -637,7 +638,8 @@ static int _kvm_getcsr(struct kvm_vcpu *vcpu, unsigned int id, u64 *val)
 
 static int _kvm_setcsr(struct kvm_vcpu *vcpu, unsigned int id, u64 val)
 {
-	int ret = 0, gintc;
+	int ret = 0;
+	unsigned long gintc, estat;
 	struct loongarch_csrs *csr = vcpu->arch.csr;
 
 	if (get_gcsr_flag(id) & INVALID_GCSR)
@@ -648,11 +650,16 @@ static int _kvm_setcsr(struct kvm_vcpu *vcpu, unsigned int id, u64 val)
 
 	if (id == LOONGARCH_CSR_ESTAT) {
 		/* ESTAT IP0~IP7 inject through GINTC */
-		gintc = (val >> 2) & 0xff;
-		kvm_set_sw_gcsr(csr, LOONGARCH_CSR_GINTC, gintc);
-
-		gintc = val & ~(0xffUL << 2);
-		kvm_set_sw_gcsr(csr, LOONGARCH_CSR_ESTAT, gintc);
+		gintc = kvm_read_sw_gcsr(csr, LOONGARCH_CSR_GINTC) & ~KVM_GINTC_IRQ_MASK;
+		gintc |= (val >> GINTC_VIP_DELTA) & KVM_GINTC_IRQ_MASK;
+		kvm_write_sw_gcsr(csr, LOONGARCH_CSR_GINTC, gintc);
+
+		/* only set valid ESTAT bits */
+		estat = val & ~KVM_ESTAT_HWI_MASK;
+		estat &= CSR_ESTAT_IS | CSR_ESTAT_EXC | CSR_ESTAT_ESUBCODE;
+		if (!kvm_guest_has_msgint(&vcpu->arch))
+			estat &= ~CPU_AVEC;
+		kvm_write_sw_gcsr(csr, LOONGARCH_CSR_ESTAT, estat);
 
 		return ret;
 	}
-- 
2.39.3

