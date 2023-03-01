Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DF3A32
	for <loongarch@lists.linux.dev>; Wed,  1 Mar 2023 08:51:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDE49C433D2;
	Wed,  1 Mar 2023 08:51:20 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Arnd Bergmann <arnd@arndb.de>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-arch@vger.kernel.org,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] LoongArch: Export some symbols without GPL
Date: Wed,  1 Mar 2023 16:51:09 +0800
Message-Id: <20230301085109.2373524-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some symbols, i.e., vm_map_base, empty_zero_page and invalid_pmd_table,
could be accessed widely by some out-of-tree non-GPL but important file
systems or drivers (e.g., OpenZFS). Let's use EXPORT_SYMBOL() instead of
EXPORT_SYMBOL_GPL() to export them, so as to avoid build errors.

Details about vm_map_base: may be referenced through macros PCI_IOBASE,
VMALLOC_START and VMALLOC_END.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/kernel/cpu-probe.c | 2 +-
 arch/loongarch/mm/init.c          | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/loongarch/kernel/cpu-probe.c b/arch/loongarch/kernel/cpu-probe.c
index 008b0249905f..001e43dd94ca 100644
--- a/arch/loongarch/kernel/cpu-probe.c
+++ b/arch/loongarch/kernel/cpu-probe.c
@@ -60,7 +60,7 @@ static inline void set_elf_platform(int cpu, const char *plat)
 
 /* MAP BASE */
 unsigned long vm_map_base;
-EXPORT_SYMBOL_GPL(vm_map_base);
+EXPORT_SYMBOL(vm_map_base);
 
 static void cpu_probe_addrbits(struct cpuinfo_loongarch *c)
 {
diff --git a/arch/loongarch/mm/init.c b/arch/loongarch/mm/init.c
index e018aed34586..3b7d8129570b 100644
--- a/arch/loongarch/mm/init.c
+++ b/arch/loongarch/mm/init.c
@@ -41,7 +41,7 @@
  * don't have to care about aliases on other CPUs.
  */
 unsigned long empty_zero_page, zero_page_mask;
-EXPORT_SYMBOL_GPL(empty_zero_page);
+EXPORT_SYMBOL(empty_zero_page);
 EXPORT_SYMBOL(zero_page_mask);
 
 void setup_zero_pages(void)
@@ -270,7 +270,7 @@ pud_t invalid_pud_table[PTRS_PER_PUD] __page_aligned_bss;
 #endif
 #ifndef __PAGETABLE_PMD_FOLDED
 pmd_t invalid_pmd_table[PTRS_PER_PMD] __page_aligned_bss;
-EXPORT_SYMBOL_GPL(invalid_pmd_table);
+EXPORT_SYMBOL(invalid_pmd_table);
 #endif
 pte_t invalid_pte_table[PTRS_PER_PTE] __page_aligned_bss;
 EXPORT_SYMBOL(invalid_pte_table);
-- 
2.39.1

