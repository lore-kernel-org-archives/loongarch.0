Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A82C3090D9
	for <loongarch@lists.linux.dev>; Mon, 11 May 2026 06:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778482324; cv=none; b=LclkgRYTApLv9KpdbKYoGYtzFDetH25IQKx8D2TAlJHJkYXv226oN4YxlSrBh8LpF32PEruFKawpP6cb5Iz0zxVMb7s0SHBvoZ5QkWNt4E0C9cpge/KD/GnM+iN8MelTGmCkXGFt4J5nmEbcx5puuuiUe0adQFvohJfWluj9oVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778482324; c=relaxed/simple;
	bh=yySU/2VefMU+3RTLM6qWKdRgl0f7r5AnAooo3KhZsh4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Lq4wKN+gC4zVQ/hqWWX6MIxtmGiQ+8SYmwI/rtPz2zgwuez5c7Eq+489NC4noQ5FiR14/LC5SLwn88YJ/dsAxaQfr11ZRqQ+w6R4K9ku0GOhKyk3AU7jVo1H10/Of20h4D0dHRjk2CVruOg3Ni7DC5yppfz9NsQgjS0Y3XBFh8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8Cx3emRfAFq9IwIAA--.26286S3;
	Mon, 11 May 2026 14:52:01 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowJAxHMKQfAFqB+h+AA--.43621S3;
	Mon, 11 May 2026 14:52:00 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: kernel@xen0n.name,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] LoongArch: KVM: Simple interrupt status acquire interface
Date: Mon, 11 May 2026 14:51:46 +0800
Message-Id: <20260511065146.680650-6-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20260511065146.680650-1-maobibo@loongson.cn>
References: <20260511065146.680650-1-maobibo@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxHMKQfAFqB+h+AA--.43621S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

When VM is migrating, interrupts status are stored in software CSR estat
register, also new injected interrupts are cached in
vcpu::arch::irq_pending.

With interrupt statuc acquire interface, there is expensive vcpu_load()
and vcpu_put() function call to sync cached vcpu::arch::irq_pending.
Here new internal API kvm_vcpu_sync_intr() is added to sync cached
pending irq to software CSR estat register.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/include/asm/kvm_vcpu.h |  1 +
 arch/loongarch/kvm/interrupt.c        | 42 +++++++++++++++++++++++++++
 arch/loongarch/kvm/vcpu.c             | 22 +++++++-------
 3 files changed, 54 insertions(+), 11 deletions(-)

diff --git a/arch/loongarch/include/asm/kvm_vcpu.h b/arch/loongarch/include/asm/kvm_vcpu.h
index e504c3822e6f..a6e8bdf631ae 100644
--- a/arch/loongarch/include/asm/kvm_vcpu.h
+++ b/arch/loongarch/include/asm/kvm_vcpu.h
@@ -54,6 +54,7 @@ int  kvm_emu_idle(struct kvm_vcpu *vcpu);
 int  kvm_pending_timer(struct kvm_vcpu *vcpu);
 int  kvm_handle_fault(struct kvm_vcpu *vcpu, int fault);
 void kvm_deliver_intr(struct kvm_vcpu *vcpu);
+void kvm_vcpu_sync_intr(struct kvm_vcpu *vcpu);
 void kvm_deliver_exception(struct kvm_vcpu *vcpu);
 
 void kvm_own_fpu(struct kvm_vcpu *vcpu);
diff --git a/arch/loongarch/kvm/interrupt.c b/arch/loongarch/kvm/interrupt.c
index 380aabb3d4d0..24925c238a65 100644
--- a/arch/loongarch/kvm/interrupt.c
+++ b/arch/loongarch/kvm/interrupt.c
@@ -71,6 +71,48 @@ void kvm_deliver_intr(struct kvm_vcpu *vcpu)
 	}
 }
 
+void kvm_vcpu_sync_intr(struct kvm_vcpu *vcpu)
+{
+	struct loongarch_csrs *csr = vcpu->arch.csr;
+	unsigned long mask, val;
+
+	if (!csr)
+		return;
+
+	mask = READ_ONCE(vcpu->arch.irq_clear);
+	if (mask) {
+		mask = xchg_relaxed(&vcpu->arch.irq_clear, 0);
+
+		/*
+		 * sync cached irq_clear to sw state
+		 *
+		 * When VM is migrated to other physical machines or
+		 * snapshot is created, cached irq pending state should
+		 * be synced
+		 */
+		val = kvm_read_sw_gcsr(csr, LOONGARCH_CSR_ESTAT);
+		val &= ~(mask & KVM_ESTAT_IRQ_MASK);
+		kvm_write_sw_gcsr(csr, LOONGARCH_CSR_ESTAT, val);
+
+		val = kvm_read_sw_gcsr(csr, LOONGARCH_CSR_GINTC);
+		val &= ~((mask >> 2) & KVM_GINTC_IRQ_MASK);
+		kvm_write_sw_gcsr(csr, LOONGARCH_CSR_GINTC, val);
+	}
+
+	mask = READ_ONCE(vcpu->arch.irq_pending);
+	if (mask) {
+		mask = xchg_relaxed(&vcpu->arch.irq_pending, 0);
+		/* sync cached irq_pending to sw state */
+		val = kvm_read_sw_gcsr(csr, LOONGARCH_CSR_ESTAT);
+		val |= (mask & KVM_ESTAT_IRQ_MASK);
+		kvm_write_sw_gcsr(csr, LOONGARCH_CSR_ESTAT, val);
+
+		val = kvm_read_sw_gcsr(csr, LOONGARCH_CSR_GINTC);
+		val |= (mask >> 2) & KVM_GINTC_IRQ_MASK;
+		kvm_write_sw_gcsr(csr, LOONGARCH_CSR_GINTC, val);
+	}
+}
+
 int kvm_pending_timer(struct kvm_vcpu *vcpu)
 {
 	return test_bit(INT_TI, &vcpu->arch.irq_pending);
diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
index e28084c49e68..2c8bda939dc9 100644
--- a/arch/loongarch/kvm/vcpu.c
+++ b/arch/loongarch/kvm/vcpu.c
@@ -610,18 +610,11 @@ static int _kvm_getcsr(struct kvm_vcpu *vcpu, unsigned int id, u64 *val)
 
 	if (id == LOONGARCH_CSR_ESTAT) {
 		preempt_disable();
-		vcpu_load(vcpu);
-		/*
-		 * Sync pending interrupts into ESTAT so that interrupt
-		 * remains during VM migration stage
-		 */
-		kvm_deliver_intr(vcpu);
-		vcpu->arch.aux_inuse &= ~KVM_LARCH_SWCSR_LATEST;
-		vcpu_put(vcpu);
+		kvm_vcpu_sync_intr(vcpu);
 		preempt_enable();
 
 		/* ESTAT IP0~IP7 get from GINTC */
-		gintc = kvm_read_sw_gcsr(csr, LOONGARCH_CSR_GINTC) & 0xff;
+		gintc = kvm_read_sw_gcsr(csr, LOONGARCH_CSR_GINTC) & KVM_GINTC_IRQ_MASK;
 		*val = kvm_read_sw_gcsr(csr, LOONGARCH_CSR_ESTAT) | (gintc << 2);
 		return 0;
 	}
@@ -1635,6 +1628,15 @@ static int _kvm_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 
 	/* Restore timer state regardless */
 	kvm_restore_timer(vcpu);
+
+	/*
+	 * Restore Root.GINTC from unused Guest.GINTC register
+	 *
+	 * SW state about LOONGARCH_CSR_GINTC is updated with get_csr()
+	 * ioctl command only and without set_csr(). Update HW state
+	 * from changed SW state.
+	 */
+	write_csr_gintc(csr->csrs[LOONGARCH_CSR_GINTC]);
 	kvm_make_request(KVM_REQ_STEAL_UPDATE, vcpu);
 
 	/* Don't bother restoring registers multiple times unless necessary */
@@ -1697,8 +1699,6 @@ static int _kvm_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 		kvm_restore_hw_gcsr(csr, LOONGARCH_CSR_ISR3);
 	}
 
-	/* Restore Root.GINTC from unused Guest.GINTC register */
-	write_csr_gintc(csr->csrs[LOONGARCH_CSR_GINTC]);
 	write_csr_gstat(csr->csrs[LOONGARCH_CSR_GSTAT]);
 
 	/*
-- 
2.39.3

