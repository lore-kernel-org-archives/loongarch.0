Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62BB97EC
	for <loongarch@lists.linux.dev>; Thu,  7 Sep 2023 01:22:14 +0000 (UTC)
Received: from loongson.cn (unknown [10.2.9.158])
	by gateway (Coremail) with SMTP id _____8DxPOvBJflkD_EgAA--.60429S3;
	Thu, 07 Sep 2023 09:22:10 +0800 (CST)
Received: from kvm-1-158.loongson.cn (unknown [10.2.9.158])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxHCPBJflkubtvAA--.51784S2;
	Thu, 07 Sep 2023 09:22:09 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] LoongArch: Code cleanup with zero page
Date: Thu,  7 Sep 2023 09:22:09 +0800
Message-Id: <20230907012209.2451090-1-maobibo@loongson.cn>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxHCPBJflkubtvAA--.51784S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxWF1rGryUJw48Xr4kXF4kKrX_yoWrXrW3pF
	9xAwn2gr4rGryfAr97t3s7Zr1kJanxKa1Igay2ya4kua42qr92vr1kKrykZFyjq3yxJFWI
	qa1rJr1avF1DJwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWU
	twAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
	8JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
	xVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7-B_UUUUU

Like other popular architectures, zero page is defined in kernel
BSS data segment, rather than dynamically allocated. It is simpler.
Also this patch removes macro __HAVE_COLOR_ZERO_PAGE and variable
zero_page_mask since there is only one page for zeo_page usage.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
Changes in v2:
 1. Combine two simple patches into one
 2. Refine implementation about macro ZERO_PAGE(vaddr) 

---
 arch/loongarch/include/asm/mmzone.h  |  2 --
 arch/loongarch/include/asm/pgtable.h |  9 ++-------
 arch/loongarch/kernel/numa.c         |  1 -
 arch/loongarch/mm/init.c             | 28 +---------------------------
 4 files changed, 3 insertions(+), 37 deletions(-)

diff --git a/arch/loongarch/include/asm/mmzone.h b/arch/loongarch/include/asm/mmzone.h
index fe67d0b4b33d..2b9a90727e19 100644
--- a/arch/loongarch/include/asm/mmzone.h
+++ b/arch/loongarch/include/asm/mmzone.h
@@ -13,6 +13,4 @@ extern struct pglist_data *node_data[];
 
 #define NODE_DATA(nid)	(node_data[(nid)])
 
-extern void setup_zero_pages(void);
-
 #endif /* _ASM_MMZONE_H_ */
diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index 06963a172319..189156d8435c 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -69,13 +69,8 @@ struct vm_area_struct;
  * ZERO_PAGE is a global shared page that is always zero; used
  * for zero-mapped memory areas etc..
  */
-
-extern unsigned long empty_zero_page;
-extern unsigned long zero_page_mask;
-
-#define ZERO_PAGE(vaddr) \
-	(virt_to_page((void *)(empty_zero_page + (((unsigned long)(vaddr)) & zero_page_mask))))
-#define __HAVE_COLOR_ZERO_PAGE
+extern unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)];
+#define ZERO_PAGE(vaddr)	(virt_to_page(empty_zero_page))
 
 /*
  * TLB refill handlers may also map the vmalloc area into xkvrange.
diff --git a/arch/loongarch/kernel/numa.c b/arch/loongarch/kernel/numa.c
index 708665895b47..6f464d49f0c2 100644
--- a/arch/loongarch/kernel/numa.c
+++ b/arch/loongarch/kernel/numa.c
@@ -470,7 +470,6 @@ void __init mem_init(void)
 {
 	high_memory = (void *) __va(get_num_physpages() << PAGE_SHIFT);
 	memblock_free_all();
-	setup_zero_pages();	/* This comes from node 0 */
 }
 
 int pcibus_to_node(struct pci_bus *bus)
diff --git a/arch/loongarch/mm/init.c b/arch/loongarch/mm/init.c
index 3b7d8129570b..628ebe42b519 100644
--- a/arch/loongarch/mm/init.c
+++ b/arch/loongarch/mm/init.c
@@ -35,33 +35,8 @@
 #include <asm/pgalloc.h>
 #include <asm/tlb.h>
 
-/*
- * We have up to 8 empty zeroed pages so we can map one of the right colour
- * when needed.	 Since page is never written to after the initialization we
- * don't have to care about aliases on other CPUs.
- */
-unsigned long empty_zero_page, zero_page_mask;
+unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)] __page_aligned_bss;
 EXPORT_SYMBOL(empty_zero_page);
-EXPORT_SYMBOL(zero_page_mask);
-
-void setup_zero_pages(void)
-{
-	unsigned int order, i;
-	struct page *page;
-
-	order = 0;
-
-	empty_zero_page = __get_free_pages(GFP_KERNEL | __GFP_ZERO, order);
-	if (!empty_zero_page)
-		panic("Oh boy, that early out of memory?");
-
-	page = virt_to_page((void *)empty_zero_page);
-	split_page(page, order);
-	for (i = 0; i < (1 << order); i++, page++)
-		mark_page_reserved(page);
-
-	zero_page_mask = ((PAGE_SIZE << order) - 1) & PAGE_MASK;
-}
 
 void copy_user_highpage(struct page *to, struct page *from,
 	unsigned long vaddr, struct vm_area_struct *vma)
@@ -106,7 +81,6 @@ void __init mem_init(void)
 	high_memory = (void *) __va(max_low_pfn << PAGE_SHIFT);
 
 	memblock_free_all();
-	setup_zero_pages();	/* Setup zeroed pages.  */
 }
 #endif /* !CONFIG_NUMA */
 
-- 
2.27.0

