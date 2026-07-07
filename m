Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9233AB262
	for <loongarch@lists.linux.dev>; Tue,  7 Jul 2026 06:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783406867; cv=none; b=S8tFBXF2OKR0FXCXikiegAdyEp51a+xKcsKomgUmji+z7NQaVkbU7Cpdd+CGnMtjx+cQLSciOgc6Pt3DZY6yb3Jv9qMS/iplbtBherc6gkCA3t1cVFAOQO+oJTkWy9SmlAJVGAloPcNC3Neuwv/HyzMyNkEAgNDpakvwcJ2RJOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783406867; c=relaxed/simple;
	bh=ashYyyw99NJsPjlBQu74Z1r6hNkvm7EWiZPO9KVkUEU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uD5bVsxmCtIEDuZX3pvLC22a8MzkRKoP+co0fEv6TSyx77O4xX0XQb4nlpyDRMEzGjK07zKjOdlDIYcZHTo3zQslGPjHs0eWkZl/bx6LeWqElHM5RN684KUDGYeSfhf8+zoGOSdeg6m5G25Ib5Su0SicgeSdjzrdl8wkhdcS9jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jdtneRan; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jdtneRan"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783406864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nGpP1xMjTiclJCSI9Z0Sv9lTJA1WOdCeAxh1F/T0lxM=;
	b=jdtneRanPqJ3vfzijt4C6o+nK2nXAuDdV3PBaqn4YM9SOkb6cUSTMxn+AJkUPxWKkCThIV
	8owEWOzDu74qaChoRQ08L3wVo4i4e4lKr78E9UwBE6OdPMuLEzHcqZWggIdd1R+yKOLmub
	quH+Zj+4mLc/wR9vW0KhhlTygRZcrk8=
From: haoran.jiang@linux.dev
To: loongarch@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	yangtiezhu@loongson.cn,
	Haoran Jiang <jianghaoran@kylinos.cn>
Subject: [PATCH 1/2] LoongArch: Enforce W^X for page-mapped virtual memory region
Date: Tue,  7 Jul 2026 14:45:55 +0800
Message-Id: <20260707064556.371881-2-haoran.jiang@linux.dev>
In-Reply-To: <20260707064556.371881-1-haoran.jiang@linux.dev>
References: <20260707064556.371881-1-haoran.jiang@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Haoran Jiang <jianghaoran@kylinos.cn>

Add the non-executable permission flag `_PAGE_NO_EXEC` to
the default attributes of kernel page tables, so that page
table permissions comply with the W^X (Write XOR Execute)
principle by default. Also enable `STRICT_MODULE_RWX` to
enforce strict memory permissions on the module region,
making the code region non‑writable, the data region non‑executable,
and the read‑only data region both non‑writable and non‑executable.
When code section modifications are needed, the `set_memory_xx()`
API is used to temporarily alter the read/write permissions
of the code section.

Signed-off-by: Haoran Jiang <jianghaoran@kylinos.cn>
---
 arch/loongarch/Kconfig                    |  1 +
 arch/loongarch/include/asm/pgtable-bits.h | 12 +++---
 arch/loongarch/kernel/ftrace_dyn.c        | 16 ++++++++
 arch/loongarch/kernel/inst.c              | 25 ++++++++++--
 arch/loongarch/kernel/jump_label.c        |  3 ++
 arch/loongarch/kernel/kgdb.c              | 50 +++++++++++++++++++++++
 arch/loongarch/kernel/kprobes.c           |  4 +-
 7 files changed, 99 insertions(+), 12 deletions(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index bec7cc1d72ee..2c5de66bf047 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -27,6 +27,7 @@ config LOONGARCH
 	select ARCH_HAS_PTE_SPECIAL if 64BIT
 	select ARCH_HAS_SET_MEMORY
 	select ARCH_HAS_SET_DIRECT_MAP
+	select ARCH_HAS_STRICT_MODULE_RWX
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UBSAN
 	select ARCH_HAS_VDSO_ARCH_DATA
diff --git a/arch/loongarch/include/asm/pgtable-bits.h b/arch/loongarch/include/asm/pgtable-bits.h
index b565573cd82e..8ad5dccb312e 100644
--- a/arch/loongarch/include/asm/pgtable-bits.h
+++ b/arch/loongarch/include/asm/pgtable-bits.h
@@ -110,17 +110,17 @@
 #define _HPAGE_CHG_MASK	(_PAGE_MODIFIED | _PAGE_SPECIAL | _PFN_MASK | _CACHE_MASK | _PAGE_PLV | _PAGE_HUGE)
 
 #define PAGE_NONE	__pgprot(_PAGE_PROTNONE | _PAGE_NO_READ | \
-				 _PAGE_USER | _CACHE_CC)
+				 _PAGE_USER | _CACHE_CC | _PAGE_NO_EXEC)
 #define PAGE_SHARED	__pgprot(_PAGE_PRESENT | _PAGE_WRITE | \
-				 _PAGE_USER | _CACHE_CC)
-#define PAGE_READONLY	__pgprot(_PAGE_PRESENT | _PAGE_USER | _CACHE_CC)
+				 _PAGE_USER | _CACHE_CC | _PAGE_NO_EXEC)
+#define PAGE_READONLY	__pgprot(_PAGE_PRESENT | _PAGE_USER | _CACHE_CC | _PAGE_NO_EXEC)
 
 #define PAGE_KERNEL	__pgprot(_PAGE_PRESENT | __READABLE | __WRITEABLE | \
-				 _PAGE_GLOBAL | _PAGE_KERN | _CACHE_CC)
+				 _PAGE_GLOBAL | _PAGE_KERN | _CACHE_CC | _PAGE_NO_EXEC)
 #define PAGE_KERNEL_SUC __pgprot(_PAGE_PRESENT | __READABLE | __WRITEABLE | \
-				 _PAGE_GLOBAL | _PAGE_KERN |  _CACHE_SUC)
+				 _PAGE_GLOBAL | _PAGE_KERN |  _CACHE_SUC | _PAGE_NO_EXEC)
 #define PAGE_KERNEL_WUC __pgprot(_PAGE_PRESENT | __READABLE | __WRITEABLE | \
-				 _PAGE_GLOBAL | _PAGE_KERN |  _CACHE_WUC)
+				 _PAGE_GLOBAL | _PAGE_KERN |  _CACHE_WUC | _PAGE_NO_EXEC)
 
 #ifndef __ASSEMBLER__
 
diff --git a/arch/loongarch/kernel/ftrace_dyn.c b/arch/loongarch/kernel/ftrace_dyn.c
index d5d81d74034c..d1d8c4c2da75 100644
--- a/arch/loongarch/kernel/ftrace_dyn.c
+++ b/arch/loongarch/kernel/ftrace_dyn.c
@@ -8,10 +8,24 @@
 #include <linux/ftrace.h>
 #include <linux/kprobes.h>
 #include <linux/uaccess.h>
+#include <linux/memory.h>
 
 #include <asm/inst.h>
 #include <asm/module.h>
 
+
+void ftrace_arch_code_modify_prepare(void)
+	__acquires(&text_mutex)
+{
+	mutex_lock(&text_mutex);
+}
+
+void ftrace_arch_code_modify_post_process(void)
+	__releases(&text_mutex)
+{
+	mutex_unlock(&text_mutex);
+}
+
 static int ftrace_modify_code(unsigned long pc, u32 old, u32 new, bool validate)
 {
 	u32 replaced;
@@ -171,6 +185,8 @@ int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
 	u32 old, new;
 	unsigned long pc;
 
+	guard(mutex)(&text_mutex);
+
 	pc = rec->ip;
 	old = larch_insn_gen_nop();
 	new = larch_insn_gen_move(LOONGARCH_GPR_T0, LOONGARCH_GPR_RA);
diff --git a/arch/loongarch/kernel/inst.c b/arch/loongarch/kernel/inst.c
index 0b9228b7c13a..3de94d465c3c 100644
--- a/arch/loongarch/kernel/inst.c
+++ b/arch/loongarch/kernel/inst.c
@@ -6,12 +6,11 @@
 #include <linux/uaccess.h>
 #include <linux/set_memory.h>
 #include <linux/stop_machine.h>
+#include <linux/memory.h>
 
 #include <asm/cacheflush.h>
 #include <asm/inst.h>
 
-static DEFINE_RAW_SPINLOCK(patch_lock);
-
 void simu_pc(struct pt_regs *regs, union loongarch_instruction insn)
 {
 	unsigned long pc = regs->csr_era;
@@ -207,14 +206,32 @@ int larch_insn_read(void *addr, u32 *insnp)
 int larch_insn_write(void *addr, u32 insn)
 {
 	int ret;
+	int err = 0;
+	size_t start;
 	unsigned long flags = 0;
 
 	if ((unsigned long)addr & 3)
 		return -EINVAL;
 
-	raw_spin_lock_irqsave(&patch_lock, flags);
+	start = round_down((size_t)addr, PAGE_SIZE);
+
+	lockdep_assert_held(&text_mutex);
+
+	err = set_memory_rw(start, 1);
+	if (err) {
+		pr_info("%s: set_memory_rw() failed\n", __func__);
+		return err;
+	}
+
+	local_irq_save(flags);
 	ret = copy_to_kernel_nofault(addr, &insn, LOONGARCH_INSN_SIZE);
-	raw_spin_unlock_irqrestore(&patch_lock, flags);
+	local_irq_restore(flags);
+
+	err = set_memory_rox(start, 1);
+	if (err) {
+		pr_info("%s: set_memory_rox() failed\n", __func__);
+		return err;
+	}
 
 	return ret;
 }
diff --git a/arch/loongarch/kernel/jump_label.c b/arch/loongarch/kernel/jump_label.c
index 24a3f4d8540c..e6bb040fe4c5 100644
--- a/arch/loongarch/kernel/jump_label.c
+++ b/arch/loongarch/kernel/jump_label.c
@@ -6,6 +6,7 @@
  */
 #include <linux/kernel.h>
 #include <linux/jump_label.h>
+#include <linux/memory.h>
 #include <asm/cacheflush.h>
 #include <asm/inst.h>
 
@@ -19,7 +20,9 @@ bool arch_jump_label_transform_queue(struct jump_entry *entry, enum jump_label_t
 	else
 		insn = larch_insn_gen_nop();
 
+	mutex_lock(&text_mutex);
 	larch_insn_write(addr, insn);
+	mutex_unlock(&text_mutex);
 
 	return true;
 }
diff --git a/arch/loongarch/kernel/kgdb.c b/arch/loongarch/kernel/kgdb.c
index 17664a6043b1..cacaff338f90 100644
--- a/arch/loongarch/kernel/kgdb.c
+++ b/arch/loongarch/kernel/kgdb.c
@@ -21,6 +21,7 @@
 #include <asm/irq_regs.h>
 #include <asm/ptrace.h>
 #include <asm/sigcontext.h>
+#include <asm/tlbflush.h>
 
 int kgdb_watch_activated;
 static unsigned int stepped_opcode;
@@ -233,6 +234,51 @@ noinline void arch_kgdb_breakpoint(void)
 }
 STACK_FRAME_NON_STANDARD(arch_kgdb_breakpoint);
 
+static inline bool kgdb_set_page_rwx(unsigned long addr, bool protect)
+{
+	pte_t *pte = virt_to_kpte(addr);
+
+	if (WARN_ON(!pte) || pte_none(ptep_get(pte)))
+		return false;
+
+	if (protect)
+		set_pte(pte, __pte(pte_val(ptep_get(pte)) & ~(_PAGE_WRITE | _PAGE_DIRTY)));
+	else
+		set_pte(pte, __pte(pte_val(ptep_get(pte)) | (_PAGE_WRITE | _PAGE_DIRTY)));
+
+	local_flush_tlb_one(addr);
+	return true;
+}
+
+int kgdb_arch_set_breakpoint(struct kgdb_bkpt *bpt)
+{
+	int err;
+
+	err = copy_from_kernel_nofault(bpt->saved_instr, (char *)bpt->bpt_addr,
+					BREAK_INSTR_SIZE);
+	if (err)
+		return err;
+
+	kgdb_set_page_rwx(bpt->bpt_addr, 0);
+	err = copy_to_kernel_nofault((char *)bpt->bpt_addr,
+					arch_kgdb_ops.gdb_bpt_instr, BREAK_INSTR_SIZE);
+	kgdb_set_page_rwx(bpt->bpt_addr, 1);
+	return err;
+}
+
+int kgdb_arch_remove_breakpoint(struct kgdb_bkpt *bpt)
+{
+	int err;
+
+	kgdb_set_page_rwx(bpt->bpt_addr, 0);
+	err = copy_to_kernel_nofault((char *)bpt->bpt_addr,
+					(char *)bpt->saved_instr, BREAK_INSTR_SIZE);
+	kgdb_set_page_rwx(bpt->bpt_addr, 1);
+
+	return err;
+}
+
+
 /*
  * Calls linux_debug_hook before the kernel dies. If KGDB is enabled,
  * then try to fall into the debugger
@@ -393,9 +439,11 @@ static int do_single_step(struct pt_regs *regs)
 
 	stepped_address = addr;
 
+	kgdb_set_page_rwx(stepped_address, 0);
 	/* Replace the opcode with the break instruction */
 	error = copy_to_kernel_nofault((void *)stepped_address,
 				       arch_kgdb_ops.gdb_bpt_instr, BREAK_INSTR_SIZE);
+	kgdb_set_page_rwx(stepped_address, 1);
 	flush_icache_range(addr, addr + BREAK_INSTR_SIZE);
 
 	if (error) {
@@ -413,8 +461,10 @@ static int do_single_step(struct pt_regs *regs)
 static void undo_single_step(struct pt_regs *regs)
 {
 	if (stepped_opcode) {
+		kgdb_set_page_rwx(stepped_address, 0);
 		copy_to_kernel_nofault((void *)stepped_address,
 				       (void *)&stepped_opcode, BREAK_INSTR_SIZE);
+		kgdb_set_page_rwx(stepped_address, 1);
 		flush_icache_range(stepped_address, stepped_address + BREAK_INSTR_SIZE);
 	}
 
diff --git a/arch/loongarch/kernel/kprobes.c b/arch/loongarch/kernel/kprobes.c
index 1985ed30dd16..cb3565178bb4 100644
--- a/arch/loongarch/kernel/kprobes.c
+++ b/arch/loongarch/kernel/kprobes.c
@@ -12,8 +12,8 @@ DEFINE_PER_CPU(struct kprobe_ctlblk, kprobe_ctlblk);
 
 static void arch_prepare_ss_slot(struct kprobe *p)
 {
-	p->ainsn.insn[0] = *p->addr;
-	p->ainsn.insn[1] = KPROBE_SSTEPBP_INSN;
+	larch_insn_patch_text(p->ainsn.insn, *p->addr);
+	larch_insn_patch_text(p->ainsn.insn + 1, KPROBE_SSTEPBP_INSN);
 	p->ainsn.restore = (unsigned long)p->addr + LOONGARCH_INSN_SIZE;
 }
 NOKPROBE_SYMBOL(arch_prepare_ss_slot);
-- 
2.43.0

