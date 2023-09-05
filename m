Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3825363
	for <loongarch@lists.linux.dev>; Tue,  5 Sep 2023 04:50:30 +0000 (UTC)
Received: from loongson.cn (unknown [10.2.9.158])
	by gateway (Coremail) with SMTP id _____8AxJugcs_ZkgVQfAA--.4274S3;
	Tue, 05 Sep 2023 12:48:29 +0800 (CST)
Received: from kvm-1-158.loongson.cn (unknown [10.2.9.158])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxfSMcs_ZkF1psAA--.16709S2;
	Tue, 05 Sep 2023 12:48:28 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Andrew Morton <akpm@linux-foundation.org>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] LoongArch: Clear invalid tlb when set huge page PTE entry
Date: Tue,  5 Sep 2023 12:48:28 +0800
Message-Id: <20230905044828.1460721-1-maobibo@loongson.cn>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxfSMcs_ZkF1psAA--.16709S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxWr1fZrWxCr1UtrWxCw1xJFc_yoW5Aw13pF
	9xC3Z5Xr4fGr9ayr9ayr4q9F43JFn7K3y2gF93Jay8AFnxWr15Wr97J39xZa4UX395W3yf
	W3yagr1DWF1DXwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9jb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_
	JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
	xGrwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWU
	XVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
	vEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2Kfnx
	nUUI43ZEXa7IU88Ma5UUUUU==

For LoongArch machines where hardware page table walk is not
support, if hugetlb pte entry is invalid, invalid tlb with normal
page will be filled and triggers page fault exception from HW.

During page fault handling, current thread maybe migrates to other
CPUs and set huge page pte entry. And if the thread migrates to
the old CPU, stale tlb with normal page exists still, there will
be confliction. So the invalid tlb need be flushed when set  huge
page pte entry like set_huge_pte_at and set_pmd_at function.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/include/asm/hugetlb.h |  4 ++++
 arch/loongarch/mm/pgtable.c          |  8 +++++++-
 arch/loongarch/mm/tlb.c              | 17 +++++++++++++++++
 3 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/include/asm/hugetlb.h b/arch/loongarch/include/asm/hugetlb.h
index aa44b3fe43dd..62cd7528a07f 100644
--- a/arch/loongarch/include/asm/hugetlb.h
+++ b/arch/loongarch/include/asm/hugetlb.h
@@ -59,6 +59,10 @@ static inline int huge_pte_none(pte_t pte)
 	return !val || (val == (unsigned long)invalid_pte_table);
 }
 
+#define __HAVE_ARCH_HUGE_SET_HUGE_PTE_AT
+extern void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
+				pte_t *ptep, pte_t pte);
+
 #define __HAVE_ARCH_HUGE_PTEP_SET_ACCESS_FLAGS
 static inline int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 					     unsigned long addr,
diff --git a/arch/loongarch/mm/pgtable.c b/arch/loongarch/mm/pgtable.c
index b14343e211b6..dfae34484f43 100644
--- a/arch/loongarch/mm/pgtable.c
+++ b/arch/loongarch/mm/pgtable.c
@@ -116,8 +116,14 @@ pmd_t mk_pmd(struct page *page, pgprot_t prot)
 void set_pmd_at(struct mm_struct *mm, unsigned long addr,
 		pmd_t *pmdp, pmd_t pmd)
 {
+	/*
+	 * The similar with function set_huge_pte_at
+	 * Need flush invalid normal page pte if hw ptw is not supported
+	 */
+	if (!cpu_has_ptw && pmd_none(*pmdp))
+		flush_tlb_mm(mm);
+
 	*pmdp = pmd;
-	flush_tlb_all();
 }
 
 void __init pagetable_init(void)
diff --git a/arch/loongarch/mm/tlb.c b/arch/loongarch/mm/tlb.c
index eb8572e201ea..ef7a89a98982 100644
--- a/arch/loongarch/mm/tlb.c
+++ b/arch/loongarch/mm/tlb.c
@@ -201,6 +201,23 @@ void __update_tlb(struct vm_area_struct *vma, unsigned long address, pte_t *ptep
 	local_irq_restore(flags);
 }
 
+void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
+		pte_t *ptep, pte_t pte)
+{
+	/*
+	 * If huge pte entry is none, tlb entry with normal page size is filled
+	 * for machines which does not support hardware page walking.
+	 *
+	 * Thread maybe migrates to other CPUs after page fault happends and
+	 * migrates back again after hugepage pte is set, tlbs with normal page
+	 * about invalid_pte_table need be flushed
+	 */
+	if (!cpu_has_ptw && huge_pte_none(*ptep))
+		flush_tlb_mm(mm);
+
+	set_pte_at(mm, addr, ptep, pte);
+}
+
 static void setup_ptwalker(void)
 {
 	unsigned long pwctl0, pwctl1;
-- 
2.27.0

