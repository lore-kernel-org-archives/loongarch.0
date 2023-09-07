Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF58710E4
	for <loongarch@lists.linux.dev>; Thu,  7 Sep 2023 06:27:42 +0000 (UTC)
Received: from loongson.cn (unknown [10.2.9.158])
	by gateway (Coremail) with SMTP id _____8AxqOhbbflkkh4hAA--.29915S3;
	Thu, 07 Sep 2023 14:27:40 +0800 (CST)
Received: from kvm-1-158.loongson.cn (unknown [10.2.9.158])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxTSNbbflkQiVwAA--.53642S2;
	Thu, 07 Sep 2023 14:27:39 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Andrew Morton <akpm@linux-foundation.org>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] LoongArch: Add tlb_flush_threshold for tlb flush range
Date: Thu,  7 Sep 2023 14:27:39 +0800
Message-Id: <20230907062739.2853408-1-maobibo@loongson.cn>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8AxTSNbbflkQiVwAA--.53642S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW3Gr4DXr45Kw43Wr1Utw1DJwc_yoW7XrW5pr
	sa9w45trs5Gr93XrWftryFgrn8Jr1kK3Waga1aqFySvr43tr17urWkKa4rAFy5Xa93GrWf
	ur9Iqr1aqFZ5J3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Fb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	AVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v2
	6r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
	CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF
	0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
	AIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2
	KfnxnUUI43ZEXa7IU8CzuJUUUUU==

There is calculation in function flush_tlb_range to decide flush tlb
entries one by one or flush the whole tlbs. Instead the calculation can be
done during cpu probe stage rather than runtime flush period.

This patch adds percpu variable tlb_flush_threshold during cpu probe
stage, and removes unused percpu variabled like tlbsizemtlb,
tlbsizestlbsets/tlbsizestlbways etc.

Also this patch fixes function __update_hugetlb, it should be
effective for CONFIG_TRANSPARENT_HUGEPAGE also.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/include/asm/cpu-info.h |  4 +---
 arch/loongarch/kernel/cpu-probe.c     | 31 ++++++++++++++++-----------
 arch/loongarch/mm/tlb.c               | 11 +++-------
 3 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/arch/loongarch/include/asm/cpu-info.h b/arch/loongarch/include/asm/cpu-info.h
index 900589cb159d..523827216c1b 100644
--- a/arch/loongarch/include/asm/cpu-info.h
+++ b/arch/loongarch/include/asm/cpu-info.h
@@ -47,9 +47,7 @@ struct cpuinfo_loongarch {
 	unsigned int		cputype;
 	int			isa_level;
 	int			tlbsize;
-	int			tlbsizemtlb;
-	int			tlbsizestlbsets;
-	int			tlbsizestlbways;
+	int			tlb_flush_threshold;
 	int			cache_leaves_present; /* number of cache_leaves[] elements */
 	struct cache_desc	cache_leaves[CACHE_LEAVES_MAX];
 	int			core;   /* physical core number in package */
diff --git a/arch/loongarch/kernel/cpu-probe.c b/arch/loongarch/kernel/cpu-probe.c
index e925579c7a71..ffa0a1b1ae29 100644
--- a/arch/loongarch/kernel/cpu-probe.c
+++ b/arch/loongarch/kernel/cpu-probe.c
@@ -88,7 +88,7 @@ static void set_isa(struct cpuinfo_loongarch *c, unsigned int isa)
 
 static void cpu_probe_common(struct cpuinfo_loongarch *c)
 {
-	unsigned int config;
+	unsigned int config, stlbsets, stlbways, mtlbs;
 	unsigned long asid_mask;
 
 	c->options = LOONGARCH_CPU_CPUCFG | LOONGARCH_CPU_CSR |
@@ -173,28 +173,35 @@ static void cpu_probe_common(struct cpuinfo_loongarch *c)
 	c->ksave_mask &= ~(EXC_KSAVE_MASK | PERCPU_KSAVE_MASK | KVM_KSAVE_MASK);
 
 	config = read_csr_prcfg3();
+	stlbsets = 0;
+	c->tlbsize = 0;
 	switch (config & CSR_CONF3_TLBTYPE) {
 	case 0:
-		c->tlbsizemtlb = 0;
-		c->tlbsizestlbsets = 0;
-		c->tlbsizestlbways = 0;
+		mtlbs = 0;
+		stlbsets = 0;
+		stlbways = 0;
 		c->tlbsize = 0;
 		break;
 	case 1:
-		c->tlbsizemtlb = ((config & CSR_CONF3_MTLBSIZE) >> CSR_CONF3_MTLBSIZE_SHIFT) + 1;
-		c->tlbsizestlbsets = 0;
-		c->tlbsizestlbways = 0;
-		c->tlbsize = c->tlbsizemtlb + c->tlbsizestlbsets * c->tlbsizestlbways;
+		mtlbs = ((config & CSR_CONF3_MTLBSIZE) >> CSR_CONF3_MTLBSIZE_SHIFT) + 1;
+		stlbsets = 0;
+		stlbways = 0;
+		c->tlbsize = mtlbs + stlbsets * stlbways;
 		break;
 	case 2:
-		c->tlbsizemtlb = ((config & CSR_CONF3_MTLBSIZE) >> CSR_CONF3_MTLBSIZE_SHIFT) + 1;
-		c->tlbsizestlbsets = 1 << ((config & CSR_CONF3_STLBIDX) >> CSR_CONF3_STLBIDX_SHIFT);
-		c->tlbsizestlbways = ((config & CSR_CONF3_STLBWAYS) >> CSR_CONF3_STLBWAYS_SHIFT) + 1;
-		c->tlbsize = c->tlbsizemtlb + c->tlbsizestlbsets * c->tlbsizestlbways;
+		mtlbs = ((config & CSR_CONF3_MTLBSIZE) >> CSR_CONF3_MTLBSIZE_SHIFT) + 1;
+		stlbsets = 1 << ((config & CSR_CONF3_STLBIDX) >> CSR_CONF3_STLBIDX_SHIFT);
+		stlbways = ((config & CSR_CONF3_STLBWAYS) >> CSR_CONF3_STLBWAYS_SHIFT) + 1;
+		c->tlbsize = mtlbs + stlbsets * stlbways;
 		break;
 	default:
 		pr_warn("Warning: unknown TLB type\n");
 	}
+
+	if (stlbsets)
+		c->tlb_flush_threshold = c->tlbsize / 8;
+	else
+		c->tlb_flush_threshold = c->tlbsize / 2;
 }
 
 #define MAX_NAME_LEN	32
diff --git a/arch/loongarch/mm/tlb.c b/arch/loongarch/mm/tlb.c
index eb8572e201ea..d87627cb9e29 100644
--- a/arch/loongarch/mm/tlb.c
+++ b/arch/loongarch/mm/tlb.c
@@ -66,9 +66,7 @@ void local_flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
 		start = round_down(start, PAGE_SIZE << 1);
 		end = round_up(end, PAGE_SIZE << 1);
 		size = (end - start) >> (PAGE_SHIFT + 1);
-		if (size <= (current_cpu_data.tlbsizestlbsets ?
-			     current_cpu_data.tlbsize / 8 :
-			     current_cpu_data.tlbsize / 2)) {
+		if (size <= current_cpu_data.tlb_flush_threshold) {
 			int asid = cpu_asid(cpu, mm);
 
 			while (start < end) {
@@ -91,10 +89,7 @@ void local_flush_tlb_kernel_range(unsigned long start, unsigned long end)
 	local_irq_save(flags);
 	size = (end - start + (PAGE_SIZE - 1)) >> PAGE_SHIFT;
 	size = (size + 1) >> 1;
-	if (size <= (current_cpu_data.tlbsizestlbsets ?
-		     current_cpu_data.tlbsize / 8 :
-		     current_cpu_data.tlbsize / 2)) {
-
+	if (size <= current_cpu_data.tlb_flush_threshold) {
 		start &= (PAGE_MASK << 1);
 		end += ((PAGE_SIZE << 1) - 1);
 		end &= (PAGE_MASK << 1);
@@ -136,7 +131,7 @@ void local_flush_tlb_one(unsigned long page)
 
 static void __update_hugetlb(struct vm_area_struct *vma, unsigned long address, pte_t *ptep)
 {
-#ifdef CONFIG_HUGETLB_PAGE
+#if defined(CONFIG_HUGETLB_PAGE) || defined(CONFIG_TRANSPARENT_HUGEPAGE)
 	int idx;
 	unsigned long lo;
 	unsigned long flags;

base-commit: 744a759492b5c57ff24a6e8aabe47b17ad8ee964
-- 
2.27.0

