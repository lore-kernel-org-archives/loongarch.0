Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BF73E009D
	for <loongarch@lists.linux.dev>; Tue, 26 May 2026 11:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779794348; cv=none; b=KTPdzG7ntkx5rwxyXMbT5Fi3A704a40iH1eUKr6JGgxtYs3HjfzmtCJZQpA/TnFoNbiQg8wcUldi9UWQwpAaiS9e/3txppM2a8ipPEEbGK40QVM2h2DIRW+S9Xio3Oo49fhto6Wm/DKJRO8qdAOl2ozVQWNavOViS3EOP3teJzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779794348; c=relaxed/simple;
	bh=Yw7LUtktRaEFt+vreWXVEMWX8Um7IR25pUQPARczxlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qw2Aa5dLttugF+1QgzJLvbI8ftGTeqffjj3gYiWtpIppw1YvIQ5tWCNdM97N+VNOfyCufram7mzeeCNaeIC0yJ1yAODPsreUtlqeVC5kk620NGR7c5SzGkIqGuqtwSry3NwQUwOlftyNSzizwykr5OESdC7xApt7SaJuJLnWyeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: b15fa3a658f411f1aa26b74ffac11d73-20260526
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_TRUSTED
	SA_EXISTED, SN_TRUSTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS
	DMARC_NOPASS, CIE_BAD, CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS
	GTI_RG_INFO, GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:85b2d1fb-8014-4d48-8c49-69edd4b2d47d,IP:20,
	URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:15
X-CID-INFO: VERSION:1.3.12,REQID:85b2d1fb-8014-4d48-8c49-69edd4b2d47d,IP:20,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:15
X-CID-META: VersionHash:e7bac3a,CLOUDID:e4b671e5448a762e37a371c778c6387c,BulkI
	D:260526191902N02LT82B,BulkQuantity:0,Recheck:0,SF:17|19|38|66|78|81|82|10
	2|127|865|898,TC:nil,Content:0|15|50,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bu
	lk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:
	0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b15fa3a658f411f1aa26b74ffac11d73-20260526
X-User: cuitao@kylinos.cn
Received: from ctao-book.. [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <cuitao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1490401619; Tue, 26 May 2026 19:18:59 +0800
From: Tao Cui <cuitao@kylinos.cn>
To: maobibo@loongson.cn,
	zhaotianrui@loongson.cn,
	chenhuacai@kernel.org,
	loongarch@lists.linux.dev
Cc: kernel@xen0n.name,
	Tao Cui <cuitao@kylinos.cn>
Subject: [PATCH 3/4] LoongArch: KVM: Implement guest-side PV TLB flush
Date: Tue, 26 May 2026 19:18:36 +0800
Message-ID: <20260526111837.2090768-4-cuitao@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526111837.2090768-1-cuitao@kylinos.cn>
References: <20260526111837.2090768-1-cuitao@kylinos.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the guest-side implementation of PV TLB flush for LoongArch KVM
guests, complementing the host-side support added in the previous commit.

When running as a KVM guest, remote TLB flushes are optimized by
avoiding IPIs to preempted vCPUs:

- kvm_flush_tlb_mask() checks each target vCPU's steal-time
  preempted flag. If a vCPU is preempted, it atomically sets
  KVM_VCPU_FLUSH_TLB in the shared preempted byte via cmpxchg
  and removes that CPU from the IPI mask.
- Only non-preempted vCPUs receive IPIs via on_each_cpu_mask().
- When the host schedules a deferred-flush vCPU back in, it
  invalidates the VPID and flushes the TLB automatically.

All six SMP TLB flush functions (flush_tlb_all, flush_tlb_mm,
flush_tlb_range, flush_tlb_kernel_range, flush_tlb_page,
flush_tlb_one) are updated to use the PV path when the static
key pv_tlb_flush_key is enabled.

The feature is gated by KVM_FEATURE_PV_TLB_FLUSH and requires
KVM_FEATURE_STEAL_TIME (for the shared memory page). Per-CPU
cpumask buffers are allocated via arch_initcall.

Signed-off-by: Tao Cui <cuitao@kylinos.cn>
---
 arch/loongarch/include/asm/kvm_para.h |  8 +++++
 arch/loongarch/include/asm/paravirt.h | 21 ++++++++++++
 arch/loongarch/kernel/paravirt.c      | 47 +++++++++++++++++++++++++++
 arch/loongarch/kernel/smp.c           | 30 +++++++++++++----
 4 files changed, 100 insertions(+), 6 deletions(-)

diff --git a/arch/loongarch/include/asm/kvm_para.h b/arch/loongarch/include/asm/kvm_para.h
index 28e3fa3b4c0e..7956aeff2436 100644
--- a/arch/loongarch/include/asm/kvm_para.h
+++ b/arch/loongarch/include/asm/kvm_para.h
@@ -187,4 +187,12 @@ static inline bool kvm_check_and_clear_guest_paused(void)
 	return false;
 }
 
+static inline bool kvm_pv_tlb_flush_supported(void)
+{
+	unsigned int feat = kvm_arch_para_features();
+
+	return (feat & (1U << KVM_FEATURE_PV_TLB_FLUSH)) &&
+	       (feat & (1U << KVM_FEATURE_STEAL_TIME));
+}
+
 #endif /* _ASM_LOONGARCH_KVM_PARA_H */
diff --git a/arch/loongarch/include/asm/paravirt.h b/arch/loongarch/include/asm/paravirt.h
index acae1c5e5f88..6ce62b555a5d 100644
--- a/arch/loongarch/include/asm/paravirt.h
+++ b/arch/loongarch/include/asm/paravirt.h
@@ -5,15 +5,26 @@
 #ifdef CONFIG_PARAVIRT
 
 #include <linux/jump_label.h>
+#include <linux/cpumask.h>
+#include <linux/smp.h>
 
 DECLARE_STATIC_KEY_FALSE(virt_preempt_key);
 DECLARE_STATIC_KEY_FALSE(virt_spin_lock_key);
+DECLARE_STATIC_KEY_FALSE(pv_tlb_flush_key);
 DECLARE_PER_CPU(struct kvm_steal_time, steal_time);
 
 int __init pv_ipi_init(void);
 int __init pv_time_init(void);
 int __init pv_spinlock_init(void);
 
+void kvm_flush_tlb_mask(const struct cpumask *cpumask,
+			smp_call_func_t func, void *info);
+
+static inline bool pv_tlb_flush_enabled(void)
+{
+	return static_branch_unlikely(&pv_tlb_flush_key);
+}
+
 #else
 
 static inline int pv_ipi_init(void)
@@ -31,5 +42,15 @@ static inline int pv_spinlock_init(void)
 	return 0;
 }
 
+static inline bool pv_tlb_flush_enabled(void)
+{
+	return false;
+}
+
+static inline void kvm_flush_tlb_mask(const struct cpumask *cpumask,
+				       smp_call_func_t func, void *info)
+{
+}
+
 #endif // CONFIG_PARAVIRT
 #endif
diff --git a/arch/loongarch/kernel/paravirt.c b/arch/loongarch/kernel/paravirt.c
index 10821cce554c..934015970179 100644
--- a/arch/loongarch/kernel/paravirt.c
+++ b/arch/loongarch/kernel/paravirt.c
@@ -12,7 +12,9 @@
 static int has_steal_clock;
 DEFINE_STATIC_KEY_FALSE(virt_preempt_key);
 DEFINE_STATIC_KEY_FALSE(virt_spin_lock_key);
+DEFINE_STATIC_KEY_FALSE(pv_tlb_flush_key);
 DEFINE_PER_CPU(struct kvm_steal_time, steal_time) __aligned(64);
+static DEFINE_PER_CPU(cpumask_var_t, __pv_cpu_mask);
 
 static bool steal_acc = true;
 
@@ -208,6 +210,51 @@ int __init pv_ipi_init(void)
 	return 0;
 }
 
+#ifdef CONFIG_SMP
+void kvm_flush_tlb_mask(const struct cpumask *cpumask,
+			       smp_call_func_t func, void *info)
+{
+	int cpu;
+	struct kvm_steal_time *src;
+	struct cpumask *flushmask = this_cpu_cpumask_var_ptr(__pv_cpu_mask);
+
+	cpumask_copy(flushmask, cpumask);
+
+	for_each_cpu(cpu, flushmask) {
+		src = &per_cpu(steal_time, cpu);
+		if (READ_ONCE(src->preempted) & KVM_VCPU_PREEMPTED) {
+			u8 old = READ_ONCE(src->preempted);
+
+			if (try_cmpxchg(&src->preempted, &old,
+					old | KVM_VCPU_FLUSH_TLB))
+				__cpumask_clear_cpu(cpu, flushmask);
+		}
+	}
+
+	on_each_cpu_mask(flushmask, func, info, 1);
+}
+
+static int __init pv_tlb_flush_init(void)
+{
+	int cpu;
+
+	if (!kvm_pv_tlb_flush_supported())
+		return 0;
+
+	for_each_possible_cpu(cpu) {
+		if (!zalloc_cpumask_var_node(per_cpu_ptr(&__pv_cpu_mask, cpu),
+					    GFP_KERNEL, cpu_to_node(cpu)))
+			return -ENOMEM;
+	}
+
+	static_branch_enable(&pv_tlb_flush_key);
+	pr_info("KVM setup pv remote TLB flush\n");
+
+	return 0;
+}
+arch_initcall(pv_tlb_flush_init);
+#endif
+
 static int pv_enable_steal_time(void)
 {
 	int cpu = smp_processor_id();
diff --git a/arch/loongarch/kernel/smp.c b/arch/loongarch/kernel/smp.c
index 64a048f1b880..174391de8926 100644
--- a/arch/loongarch/kernel/smp.c
+++ b/arch/loongarch/kernel/smp.c
@@ -727,7 +727,10 @@ static void flush_tlb_all_ipi(void *info)
 
 void flush_tlb_all(void)
 {
-	on_each_cpu(flush_tlb_all_ipi, NULL, 1);
+	if (pv_tlb_flush_enabled())
+		kvm_flush_tlb_mask(cpu_online_mask, flush_tlb_all_ipi, NULL);
+	else
+		on_each_cpu(flush_tlb_all_ipi, NULL, 1);
 }
 
 static void flush_tlb_mm_ipi(void *mm)
@@ -743,7 +746,10 @@ void flush_tlb_mm(struct mm_struct *mm)
 	preempt_disable();
 
 	if ((atomic_read(&mm->mm_users) != 1) || (current->mm != mm)) {
-		on_each_cpu_mask(mm_cpumask(mm), flush_tlb_mm_ipi, mm, 1);
+		if (pv_tlb_flush_enabled())
+			kvm_flush_tlb_mask(mm_cpumask(mm), flush_tlb_mm_ipi, mm);
+		else
+			on_each_cpu_mask(mm_cpumask(mm), flush_tlb_mm_ipi, mm, 1);
 	} else {
 		unsigned int cpu;
 
@@ -782,7 +788,10 @@ void flush_tlb_range(struct vm_area_struct *vma, unsigned long start, unsigned l
 			.addr2 = end,
 		};
 
-		on_each_cpu_mask(mm_cpumask(mm), flush_tlb_range_ipi, &fd, 1);
+		if (pv_tlb_flush_enabled())
+			kvm_flush_tlb_mask(mm_cpumask(mm), flush_tlb_range_ipi, &fd);
+		else
+			on_each_cpu_mask(mm_cpumask(mm), flush_tlb_range_ipi, &fd, 1);
 	} else {
 		unsigned int cpu;
 
@@ -809,7 +818,10 @@ void flush_tlb_kernel_range(unsigned long start, unsigned long end)
 		.addr2 = end,
 	};
 
-	on_each_cpu(flush_tlb_kernel_range_ipi, &fd, 1);
+	if (pv_tlb_flush_enabled())
+		kvm_flush_tlb_mask(cpu_online_mask, flush_tlb_kernel_range_ipi, &fd);
+	else
+		on_each_cpu(flush_tlb_kernel_range_ipi, &fd, 1);
 }
 
 static void flush_tlb_page_ipi(void *info)
@@ -828,7 +840,10 @@ void flush_tlb_page(struct vm_area_struct *vma, unsigned long page)
 			.addr1 = page,
 		};
 
-		on_each_cpu_mask(mm_cpumask(vma->vm_mm), flush_tlb_page_ipi, &fd, 1);
+		if (pv_tlb_flush_enabled())
+			kvm_flush_tlb_mask(mm_cpumask(vma->vm_mm), flush_tlb_page_ipi, &fd);
+		else
+			on_each_cpu_mask(mm_cpumask(vma->vm_mm), flush_tlb_page_ipi, &fd, 1);
 	} else {
 		unsigned int cpu;
 
@@ -851,6 +866,9 @@ static void flush_tlb_one_ipi(void *info)
 
 void flush_tlb_one(unsigned long vaddr)
 {
-	on_each_cpu(flush_tlb_one_ipi, (void *)vaddr, 1);
+	if (pv_tlb_flush_enabled())
+		kvm_flush_tlb_mask(cpu_online_mask, flush_tlb_one_ipi, (void *)vaddr);
+	else
+		on_each_cpu(flush_tlb_one_ipi, (void *)vaddr, 1);
 }
 EXPORT_SYMBOL(flush_tlb_one);
-- 
2.43.0

