Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28835242
	for <loongarch@lists.linux.dev>; Wed, 19 Jul 2023 08:33:49 +0000 (UTC)
X-UUID: f0ed99f9d9174c4f8aab76592d27aee9-20230719
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.28,REQID:441d7fdd-754c-415a-95e2-9168bf32e60d,IP:25,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:10
X-CID-INFO: VERSION:1.1.28,REQID:441d7fdd-754c-415a-95e2-9168bf32e60d,IP:25,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:10
X-CID-META: VersionHash:176cd25,CLOUDID:b790e14c-06c1-468b-847d-5b62d44dbb9b,B
	ulkID:230719161451JTKHZIDM,BulkQuantity:1,Recheck:0,SF:38|24|17|19|44|102,
	TC:nil,Content:0,EDM:-3,IP:-2,URL:1,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI,
	TF_CID_SPAM_ULS
X-UUID: f0ed99f9d9174c4f8aab76592d27aee9-20230719
X-User: lienze@kylinos.cn
Received: from ubuntu.. [(39.156.73.12)] by mailgw
	(envelope-from <lienze@kylinos.cn>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 633807358; Wed, 19 Jul 2023 16:28:19 +0800
From: Enze Li <lienze@kylinos.cn>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	loongarch@lists.linux.dev,
	glider@google.com,
	elver@google.com,
	akpm@linux-foundation.org,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org
Cc: zhangqing@loongson.cn,
	yangtiezhu@loongson.cn,
	dvyukov@google.com,
	Enze Li <lienze@kylinos.cn>
Subject: [PATCH 4/4] LoongArch: Add KFENCE support
Date: Wed, 19 Jul 2023 16:27:32 +0800
Message-Id: <20230719082732.2189747-5-lienze@kylinos.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230719082732.2189747-1-lienze@kylinos.cn>
References: <20230719082732.2189747-1-lienze@kylinos.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LoongArch architecture is quite different from other architectures.
When the allocating of KFENCE itself is done, it is mapped to the direct
mapping configuration window [1] by default on LoongArch.  It means that
it is not possible to use the page table mapped mode which required by
the KFENCE system and therefore it should be remapped to the appropriate
region.

This patch adds architecture specific implementation details for KFENCE.
In particular, this implements the required interface in <asm/kfence.h>.

Tested this patch by using the testcases and all passed.

[1] https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.html#virtual-address-space-and-address-translation-mode

Signed-off-by: Enze Li <lienze@kylinos.cn>
---
 arch/loongarch/Kconfig               |  1 +
 arch/loongarch/include/asm/kfence.h  | 62 ++++++++++++++++++++++++++++
 arch/loongarch/include/asm/pgtable.h |  6 +++
 arch/loongarch/mm/fault.c            | 22 ++++++----
 4 files changed, 83 insertions(+), 8 deletions(-)
 create mode 100644 arch/loongarch/include/asm/kfence.h

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 5411e3a4eb88..db27729003d3 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -93,6 +93,7 @@ config LOONGARCH
 	select HAVE_ARCH_JUMP_LABEL
 	select HAVE_ARCH_JUMP_LABEL_RELATIVE
 	select HAVE_ARCH_KASAN
+	select HAVE_ARCH_KFENCE if 64BIT
 	select HAVE_ARCH_MMAP_RND_BITS if MMU
 	select HAVE_ARCH_SECCOMP_FILTER
 	select HAVE_ARCH_TRACEHOOK
diff --git a/arch/loongarch/include/asm/kfence.h b/arch/loongarch/include/asm/kfence.h
new file mode 100644
index 000000000000..2a85acc2bc70
--- /dev/null
+++ b/arch/loongarch/include/asm/kfence.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * KFENCE support for LoongArch.
+ *
+ * Author: Enze Li <lienze@kylinos.cn>
+ * Copyright (C) 2022-2023 KylinSoft Corporation.
+ */
+
+#ifndef _ASM_LOONGARCH_KFENCE_H
+#define _ASM_LOONGARCH_KFENCE_H
+
+#include <linux/kfence.h>
+#include <asm/pgtable.h>
+#include <asm/tlb.h>
+
+static inline char *arch_kfence_init_pool(void)
+{
+	char *__kfence_pool_orig = __kfence_pool;
+	struct vm_struct *area;
+	int err;
+
+	area = __get_vm_area_caller(KFENCE_POOL_SIZE, VM_IOREMAP,
+				    KFENCE_AREA_START, KFENCE_AREA_END,
+				    __builtin_return_address(0));
+	if (!area)
+		return NULL;
+
+	__kfence_pool = (char *)area->addr;
+	err = ioremap_page_range((unsigned long)__kfence_pool,
+				 (unsigned long)__kfence_pool + KFENCE_POOL_SIZE,
+				 virt_to_phys((void *)__kfence_pool_orig),
+				 PAGE_KERNEL);
+	if (err) {
+		free_vm_area(area);
+		return NULL;
+	}
+
+	return __kfence_pool;
+}
+
+/* Protect the given page and flush TLB. */
+static inline bool kfence_protect_page(unsigned long addr, bool protect)
+{
+	pte_t *pte = virt_to_kpte(addr);
+
+	if (WARN_ON(!pte) || pte_none(*pte))
+		return false;
+
+	if (protect)
+		set_pte(pte, __pte(pte_val(*pte) & ~(_PAGE_VALID | _PAGE_PRESENT)));
+	else
+		set_pte(pte, __pte(pte_val(*pte) | (_PAGE_VALID | _PAGE_PRESENT)));
+
+	/* Flush this CPU's TLB. */
+	preempt_disable();
+	local_flush_tlb_one(addr);
+	preempt_enable();
+
+	return true;
+}
+
+#endif /* _ASM_LOONGARCH_KFENCE_H */
diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index 0fc074b8bd48..5a9c81298fe3 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -85,7 +85,13 @@ extern unsigned long zero_page_mask;
 #define MODULES_VADDR	(vm_map_base + PCI_IOSIZE + (2 * PAGE_SIZE))
 #define MODULES_END	(MODULES_VADDR + SZ_256M)
 
+#ifdef CONFIG_KFENCE
+#define KFENCE_AREA_START	MODULES_END
+#define KFENCE_AREA_END		(KFENCE_AREA_START + SZ_512M)
+#define VMALLOC_START		KFENCE_AREA_END
+#else
 #define VMALLOC_START	MODULES_END
+#endif
 
 #ifndef CONFIG_KASAN
 #define VMALLOC_END	\
diff --git a/arch/loongarch/mm/fault.c b/arch/loongarch/mm/fault.c
index da5b6d518cdb..c0319128b221 100644
--- a/arch/loongarch/mm/fault.c
+++ b/arch/loongarch/mm/fault.c
@@ -23,6 +23,7 @@
 #include <linux/kprobes.h>
 #include <linux/perf_event.h>
 #include <linux/uaccess.h>
+#include <linux/kfence.h>
 
 #include <asm/branch.h>
 #include <asm/mmu_context.h>
@@ -30,7 +31,8 @@
 
 int show_unhandled_signals = 1;
 
-static void __kprobes no_context(struct pt_regs *regs, unsigned long address)
+static void __kprobes no_context(struct pt_regs *regs, unsigned long address,
+				 unsigned long write)
 {
 	const int field = sizeof(unsigned long) * 2;
 
@@ -38,6 +40,9 @@ static void __kprobes no_context(struct pt_regs *regs, unsigned long address)
 	if (fixup_exception(regs))
 		return;
 
+	if (kfence_handle_page_fault(address, write, regs))
+		return;
+
 	/*
 	 * Oops. The kernel tried to access some bad page. We'll have to
 	 * terminate things with extreme prejudice.
@@ -51,14 +56,15 @@ static void __kprobes no_context(struct pt_regs *regs, unsigned long address)
 	die("Oops", regs);
 }
 
-static void __kprobes do_out_of_memory(struct pt_regs *regs, unsigned long address)
+static void __kprobes do_out_of_memory(struct pt_regs *regs, unsigned long address,
+				       unsigned long write)
 {
 	/*
 	 * We ran out of memory, call the OOM killer, and return the userspace
 	 * (which will retry the fault, or kill us if we got oom-killed).
 	 */
 	if (!user_mode(regs)) {
-		no_context(regs, address);
+		no_context(regs, address, write);
 		return;
 	}
 	pagefault_out_of_memory();
@@ -69,7 +75,7 @@ static void __kprobes do_sigbus(struct pt_regs *regs,
 {
 	/* Kernel mode? Handle exceptions or die */
 	if (!user_mode(regs)) {
-		no_context(regs, address);
+		no_context(regs, address, write);
 		return;
 	}
 
@@ -90,7 +96,7 @@ static void __kprobes do_sigsegv(struct pt_regs *regs,
 
 	/* Kernel mode? Handle exceptions or die */
 	if (!user_mode(regs)) {
-		no_context(regs, address);
+		no_context(regs, address, write);
 		return;
 	}
 
@@ -149,7 +155,7 @@ static void __kprobes __do_page_fault(struct pt_regs *regs,
 	 */
 	if (address & __UA_LIMIT) {
 		if (!user_mode(regs))
-			no_context(regs, address);
+			no_context(regs, address, write);
 		else
 			do_sigsegv(regs, write, address, si_code);
 		return;
@@ -211,7 +217,7 @@ static void __kprobes __do_page_fault(struct pt_regs *regs,
 
 	if (fault_signal_pending(fault, regs)) {
 		if (!user_mode(regs))
-			no_context(regs, address);
+			no_context(regs, address, write);
 		return;
 	}
 
@@ -232,7 +238,7 @@ static void __kprobes __do_page_fault(struct pt_regs *regs,
 	if (unlikely(fault & VM_FAULT_ERROR)) {
 		mmap_read_unlock(mm);
 		if (fault & VM_FAULT_OOM) {
-			do_out_of_memory(regs, address);
+			do_out_of_memory(regs, address, write);
 			return;
 		} else if (fault & VM_FAULT_SIGSEGV) {
 			do_sigsegv(regs, write, address, si_code);
-- 
2.34.1

