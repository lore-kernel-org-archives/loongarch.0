Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDEB7F6
	for <loongarch@lists.linux.dev>; Wed,  1 Mar 2023 12:30:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8EA4C433EF;
	Wed,  1 Mar 2023 12:30:43 +0000 (UTC)
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
	Huacai Chen <chenhuacai@loongson.cn>,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH V2] LoongArch: Mark 3 symbol exports as non-GPL
Date: Wed,  1 Mar 2023 20:30:32 +0800
Message-Id: <20230301123032.2452817-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vm_map_base, empty_zero_page and invalid_pmd_table could be accessed
widely by some out-of-tree non-GPL but important file systems or drivers
(e.g. OpenZFS). Let's use EXPORT_SYMBOL() instead of EXPORT_SYMBOL_GPL()
to export them, so as to avoid build errors.

1, Details about vm_map_base:

This is a LoongArch-specific symbol and may be referenced through macros
PCI_IOBASE, VMALLOC_START and VMALLOC_END.

2, Details about empty_zero_page:

As it stands today, only 3 architectures export empty_zero_page as a GPL 
symbol: IA64, LoongArch and MIPS. LoongArch gets the GPL export by 
inheriting from MIPS, and the MIPS export was first introduced in commit 
497d2adcbf50b ("[MIPS] Export empty_zero_page for sake of the ext4 
module."). The IA64 export was similar: commit a7d57ecf4216e ("[IA64] 
Export three symbols for module use") did so for kvm.

In both IA64 and MIPS, the export of empty_zero_page was done for 
satisfying some in-kernel component built as module (kvm and ext4 
respectively), and given its reasonably low-level nature, GPL is a 
reasonable choice. But looking at the bigger picture it is evident most 
other architectures do not regard it as GPL, so in effect the symbol 
probably should not be treated as such, in favor of consistency.

3, Details about invalid_pmd_table:

Keep consistency with invalid_pte_table and make it be possible by some
modules.

Reviewed-by: WANG Xuerui <git@xen0n.name>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
V2: Update commit messages.

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

