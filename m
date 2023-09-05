Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81E891C13
	for <loongarch@lists.linux.dev>; Tue,  5 Sep 2023 08:01:50 +0000 (UTC)
Received: from loongson.cn (unknown [10.2.9.158])
	by gateway (Coremail) with SMTP id _____8CxLOtt4PZkXm8fAA--.57952S3;
	Tue, 05 Sep 2023 16:01:49 +0800 (CST)
Received: from kvm-1-158.loongson.cn (unknown [10.2.9.158])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxJ8xr4PZkz45sAA--.24257S4;
	Tue, 05 Sep 2023 16:01:48 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] LoongArch: Use static defined zero page rather than allocated
Date: Tue,  5 Sep 2023 16:01:47 +0800
Message-Id: <20230905080147.1625448-3-maobibo@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20230905080147.1625448-1-maobibo@loongson.cn>
References: <20230905080147.1625448-1-maobibo@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxJ8xr4PZkz45sAA--.24257S4
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxWFW8ur4DWw1DZF4fKrWDKFX_yoW5Zr4fpF
	9rAr1vgr4rGr97Ar97t3sF9r1kJanxKa1Igay2yas5ua42qr92vr1kKr97ZFyjq3yxGFW0
	qF4fJw1avF1DJwcCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1a6r1DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v2
	6r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07Ul4E_UUUUU=

Like other popular architectures, zero page is defined in kernel
BSS code segment, rather than dynamically alloted page. It is
simpler.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/include/asm/mmzone.h  |  2 --
 arch/loongarch/include/asm/pgtable.h |  6 ++----
 arch/loongarch/kernel/numa.c         |  1 -
 arch/loongarch/mm/init.c             | 21 +--------------------
 4 files changed, 3 insertions(+), 27 deletions(-)

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
index 342c5f9c25d2..70bd57daf42a 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -70,10 +70,8 @@ struct vm_area_struct;
  * for zero-mapped memory areas etc..
  */
 
-extern unsigned long empty_zero_page;
-
-#define ZERO_PAGE(vaddr) \
-	(virt_to_page((void *)(empty_zero_page)))
+extern unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)];
+#define ZERO_PAGE(vaddr)	((void)(vaddr), virt_to_page(empty_zero_page))
 
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
index 8ec668f97b00..628ebe42b519 100644
--- a/arch/loongarch/mm/init.c
+++ b/arch/loongarch/mm/init.c
@@ -35,27 +35,9 @@
 #include <asm/pgalloc.h>
 #include <asm/tlb.h>
 
-unsigned long empty_zero_page;
+unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)] __page_aligned_bss;
 EXPORT_SYMBOL(empty_zero_page);
 
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
-}
-
 void copy_user_highpage(struct page *to, struct page *from,
 	unsigned long vaddr, struct vm_area_struct *vma)
 {
@@ -99,7 +81,6 @@ void __init mem_init(void)
 	high_memory = (void *) __va(max_low_pfn << PAGE_SHIFT);
 
 	memblock_free_all();
-	setup_zero_pages();	/* Setup zeroed pages.  */
 }
 #endif /* !CONFIG_NUMA */
 
-- 
2.27.0

