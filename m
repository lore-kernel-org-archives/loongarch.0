Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FDE10F7
	for <loongarch@lists.linux.dev>; Thu, 29 Sep 2022 07:23:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80465C433D6;
	Thu, 29 Sep 2022 07:23:47 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Arnd Bergmann <arnd@arndb.de>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-arch@vger.kernel.org,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>,
	Weihao Li <liweihao@loongson.cn>
Subject: [PATCH V2] LoongArch: Support access filter to /dev/mem interface
Date: Thu, 29 Sep 2022 15:22:32 +0800
Message-Id: <20220929072232.562727-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Accidental access to /dev/mem is obviously disastrous, but specific
access can be used by people debugging the kernel. So select GENERIC_
LIB_DEVMEM_IS_ALLOWED, as well as define ARCH_HAS_VALID_PHYS_ADDR_RANGE
and related helpers, to support access filter to /dev/mem interface.

Signed-off-by: Weihao Li <liweihao@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
V2: Fix build warnings reported by kernel test robot.

 arch/loongarch/Kconfig          |  1 +
 arch/loongarch/include/asm/io.h |  4 ++++
 arch/loongarch/mm/mmap.c        | 29 +++++++++++++++++++++++++++++
 3 files changed, 34 insertions(+)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index fcb5f9489ffd..9c36eb29096a 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -70,6 +70,7 @@ config LOONGARCH
 	select GENERIC_LIB_CMPDI2
 	select GENERIC_LIB_LSHRDI3
 	select GENERIC_LIB_UCMPDI2
+	select GENERIC_LIB_DEVMEM_IS_ALLOWED
 	select GENERIC_PCI_IOMAP
 	select GENERIC_SCHED_CLOCK
 	select GENERIC_SMP_IDLE_THREAD
diff --git a/arch/loongarch/include/asm/io.h b/arch/loongarch/include/asm/io.h
index 999944ea1cea..398d1a7b3dd6 100644
--- a/arch/loongarch/include/asm/io.h
+++ b/arch/loongarch/include/asm/io.h
@@ -107,4 +107,8 @@ extern void __memcpy_fromio(void *to, const volatile void __iomem *from, size_t
 
 #include <asm-generic/io.h>
 
+#define ARCH_HAS_VALID_PHYS_ADDR_RANGE
+extern int valid_phys_addr_range(phys_addr_t addr, size_t size);
+extern int valid_mmap_phys_addr_range(unsigned long pfn, size_t size);
+
 #endif /* _ASM_IO_H */
diff --git a/arch/loongarch/mm/mmap.c b/arch/loongarch/mm/mmap.c
index 381a569635a9..fbe1a4856fc4 100644
--- a/arch/loongarch/mm/mmap.c
+++ b/arch/loongarch/mm/mmap.c
@@ -3,6 +3,8 @@
  * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
  */
 #include <linux/export.h>
+#include <linux/io.h>
+#include <linux/memblock.h>
 #include <linux/mm.h>
 #include <linux/mman.h>
 
@@ -116,3 +118,30 @@ int __virt_addr_valid(volatile void *kaddr)
 	return pfn_valid(PFN_DOWN(PHYSADDR(kaddr)));
 }
 EXPORT_SYMBOL_GPL(__virt_addr_valid);
+
+/*
+ * You really shouldn't be using read() or write() on /dev/mem.  This might go
+ * away in the future.
+ */
+int valid_phys_addr_range(phys_addr_t addr, size_t size)
+{
+	/*
+	 * Check whether addr is covered by a memory region without the
+	 * MEMBLOCK_NOMAP attribute, and whether that region covers the
+	 * entire range. In theory, this could lead to false negatives
+	 * if the range is covered by distinct but adjacent memory regions
+	 * that only differ in other attributes. However, few of such
+	 * attributes have been defined, and it is debatable whether it
+	 * follows that /dev/mem read() calls should be able traverse
+	 * such boundaries.
+	 */
+	return memblock_is_region_memory(addr, size) && memblock_is_map_memory(addr);
+}
+
+/*
+ * Do not allow /dev/mem mappings beyond the supported physical range.
+ */
+int valid_mmap_phys_addr_range(unsigned long pfn, size_t size)
+{
+	return !(((pfn << PAGE_SHIFT) + size) & ~(GENMASK_ULL(cpu_pabits, 0)));
+}
-- 
2.31.1

