Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D56461FA4
	for <loongarch@lists.linux.dev>; Tue,  5 Sep 2023 08:01:50 +0000 (UTC)
Received: from loongson.cn (unknown [10.2.9.158])
	by gateway (Coremail) with SMTP id _____8Ax1fBs4PZkWG8fAA--.63494S3;
	Tue, 05 Sep 2023 16:01:48 +0800 (CST)
Received: from kvm-1-158.loongson.cn (unknown [10.2.9.158])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxJ8xr4PZkz45sAA--.24257S3;
	Tue, 05 Sep 2023 16:01:48 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] LoongArch: Remove zero_page_mask symbol
Date: Tue,  5 Sep 2023 16:01:46 +0800
Message-Id: <20230905080147.1625448-2-maobibo@loongson.cn>
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
X-CM-TRANSID:AQAAf8DxJ8xr4PZkz45sAA--.24257S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Kr1xtF4UXw13KFWxJF13GFX_yoW8ZFWxpF
	9Fyw1vgr48G34fArn7AwnrZr1UJws3Kr4Iga42yFyq9a47XryFgr1kKrZ7ZFyUtayxJFW0
	ga15Gr1avF4DA3XCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AK
	xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I
	0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2Z2-UUUUU

On LoongArch system, there is only one page for zero page, and
there is no COLOR_ZERO_PAGE, so zero_page_mask is useless and
macro __HAVE_COLOR_ZERO_PAGE is not necessary. This patch removes
zero_page_mask and macro __HAVE_COLOR_ZERO_PAGE.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/include/asm/pgtable.h | 4 +---
 arch/loongarch/mm/init.c             | 9 +--------
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index 06963a172319..342c5f9c25d2 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -71,11 +71,9 @@ struct vm_area_struct;
  */
 
 extern unsigned long empty_zero_page;
-extern unsigned long zero_page_mask;
 
 #define ZERO_PAGE(vaddr) \
-	(virt_to_page((void *)(empty_zero_page + (((unsigned long)(vaddr)) & zero_page_mask))))
-#define __HAVE_COLOR_ZERO_PAGE
+	(virt_to_page((void *)(empty_zero_page)))
 
 /*
  * TLB refill handlers may also map the vmalloc area into xkvrange.
diff --git a/arch/loongarch/mm/init.c b/arch/loongarch/mm/init.c
index 3b7d8129570b..8ec668f97b00 100644
--- a/arch/loongarch/mm/init.c
+++ b/arch/loongarch/mm/init.c
@@ -35,14 +35,8 @@
 #include <asm/pgalloc.h>
 #include <asm/tlb.h>
 
-/*
- * We have up to 8 empty zeroed pages so we can map one of the right colour
- * when needed.	 Since page is never written to after the initialization we
- * don't have to care about aliases on other CPUs.
- */
-unsigned long empty_zero_page, zero_page_mask;
+unsigned long empty_zero_page;
 EXPORT_SYMBOL(empty_zero_page);
-EXPORT_SYMBOL(zero_page_mask);
 
 void setup_zero_pages(void)
 {
@@ -60,7 +54,6 @@ void setup_zero_pages(void)
 	for (i = 0; i < (1 << order); i++, page++)
 		mark_page_reserved(page);
 
-	zero_page_mask = ((PAGE_SIZE << order) - 1) & PAGE_MASK;
 }
 
 void copy_user_highpage(struct page *to, struct page *from,
-- 
2.27.0

