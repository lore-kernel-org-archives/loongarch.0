Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CA7B166F1B
	for <loongarch@lists.linux.dev>; Wed, 13 Nov 2024 03:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731467855; cv=none; b=hfK1aMiBZoEnghffHEz2CjpV1lZBmy/MbGiQGc3Y75SfyWpef2DA62DUyEiIlEJ9SyHTdqb7ML3QHDE+1ecb6WfqcsyMPoXtVLzGExkj3llr8FJOB6MTFFAZvPeITHtlmTcsDAI3UjXKUP+nMktVG8aS5xkKhrWUy6BsdVj2Tm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731467855; c=relaxed/simple;
	bh=R7jYZqx7GSLjqcCUIxjDjiNRq78ObURiNWfb3mXRxaI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hkbLTldw3LAwACx4W8NMsoLGcI7tADCZ4pKwaGYhD6oIT/4+AsDLLmv+grKv/6dDA/iLeycrLt+8vT6EyxTtfgURLGUlfWupI78+bwSIClACAGasECK3JdthdWm4Os+Vr2HIMKUdwR/InUTtmwXRVwZ4+PyTWoxsa5imnfp6K1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8DxmeFLGjRnWX08AA--.56250S3;
	Wed, 13 Nov 2024 11:17:31 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowMAxDEdHGjRnX4VTAA--.14727S6;
	Wed, 13 Nov 2024 11:17:30 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC 4/5] LoongArch: KVM: Add remote tlb flushing support
Date: Wed, 13 Nov 2024 11:17:26 +0800
Message-Id: <20241113031727.2815628-5-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20241113031727.2815628-1-maobibo@loongson.cn>
References: <20241113031727.2815628-1-maobibo@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMAxDEdHGjRnX4VTAA--.14727S6
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

With remote tlb flushing, vpid index stays unchanged and only vmid
index is updated, since remote tlb flushing is to flush TLBs relative
GPA --> HPA.

For flushing method, cpumask tlb_flush_pending is added and set for
all possible CPUs. When vCPUs is sched on the physical CPU, vmid is
updated and cpumask for this physical CPU is cleared.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/include/asm/kvm_host.h |  3 +++
 arch/loongarch/kvm/main.c             |  3 +++
 arch/loongarch/kvm/mmu.c              | 17 +++++++++++++++++
 arch/loongarch/kvm/vcpu.c             |  7 ++++++-
 4 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/include/asm/kvm_host.h b/arch/loongarch/include/asm/kvm_host.h
index 725d9c4e1965..8f4b4b9a4e3c 100644
--- a/arch/loongarch/include/asm/kvm_host.h
+++ b/arch/loongarch/include/asm/kvm_host.h
@@ -117,6 +117,7 @@ struct kvm_arch {
 	unsigned long pv_features;
 
 	s64 time_offset;
+	cpumask_t tlb_flush_pending;
 	unsigned long vmid[NR_CPUS];
 	struct kvm_context __percpu *vmcs;
 };
@@ -317,6 +318,8 @@ static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {}
 static inline void kvm_arch_vcpu_block_finish(struct kvm_vcpu *vcpu) {}
 static inline void kvm_arch_free_memslot(struct kvm *kvm, struct kvm_memory_slot *slot) {}
 void kvm_check_vpid(struct kvm_vcpu *vcpu);
+#define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS
+int kvm_arch_flush_remote_tlbs(struct kvm *kvm);
 enum hrtimer_restart kvm_swtimer_wakeup(struct hrtimer *timer);
 void kvm_arch_flush_remote_tlbs_memslot(struct kvm *kvm, const struct kvm_memory_slot *memslot);
 void kvm_init_vmcs(struct kvm *kvm);
diff --git a/arch/loongarch/kvm/main.c b/arch/loongarch/kvm/main.c
index 367653b49a35..f89d1df885d7 100644
--- a/arch/loongarch/kvm/main.c
+++ b/arch/loongarch/kvm/main.c
@@ -292,6 +292,9 @@ static void __kvm_check_vmid(struct kvm_vcpu *vcpu)
 
 	cpu = smp_processor_id();
 	context = per_cpu_ptr(vcpu->kvm->arch.vmcs, cpu);
+	if (cpumask_test_and_clear_cpu(cpu, &vcpu->kvm->arch.tlb_flush_pending))
+		vcpu->kvm->arch.vmid[cpu] = 0;
+
 
 	/*
 	 * Check if our vmid is of an older version
diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
index 28681dfb4b85..763021cf829d 100644
--- a/arch/loongarch/kvm/mmu.c
+++ b/arch/loongarch/kvm/mmu.c
@@ -947,6 +947,23 @@ void kvm_arch_sync_dirty_log(struct kvm *kvm, struct kvm_memory_slot *memslot)
 {
 }
 
+/*
+ * kvm_arch_flush_remote_tlbs() - flush all VM TLB entries
+ * @kvm:        pointer to kvm structure.
+ */
+int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
+{
+	/*
+	 * Queue a TLB invalidation for each CPU to perform on next
+	 * vcpu loading
+	 */
+	if (cpu_has_guestid)
+		cpumask_setall(&kvm->arch.tlb_flush_pending);
+
+	/* Return 1 continue to send ipi to running vCPUs */
+	return 1;
+}
+
 void kvm_arch_flush_remote_tlbs_memslot(struct kvm *kvm,
 					const struct kvm_memory_slot *memslot)
 {
diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
index 174734a23d0a..703f5f2fbb31 100644
--- a/arch/loongarch/kvm/vcpu.c
+++ b/arch/loongarch/kvm/vcpu.c
@@ -208,7 +208,12 @@ static int kvm_check_requests(struct kvm_vcpu *vcpu)
 		return RESUME_GUEST;
 
 	if (kvm_check_request(KVM_REQ_TLB_FLUSH, vcpu))
-		vcpu->arch.vpid = 0;  /* Drop vpid for this vCPU */
+		/*
+		 * vpid need the same with vmid if vpid is not separated
+		 * with vmid
+		 */
+		if (!cpu_has_guestid)
+			vcpu->arch.vpid = 0;
 
 	if (kvm_dirty_ring_check_request(vcpu))
 		return RESUME_HOST;
-- 
2.39.3

