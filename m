Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81831396B8E
	for <loongarch@lists.linux.dev>; Mon, 30 Mar 2026 10:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774864893; cv=none; b=rvdjnwZFVl+wTI+UzZ2vG091O6glJhHt+zqTxOUOvb1U9wZp7EmO8rrmMBqDQ+dWRp6zFbRsJEGQV8GMbEvdFhJfjjFTN+3CXBy42leugipy3YTfuAUwXGHSfiL8S/epb5W6pnsGoC2ZA5RClEpBXbjkcThPlO9v8G4rYzzgxB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774864893; c=relaxed/simple;
	bh=mZg7sSFakgU3u8dUZmQAVzozp6h719RiydOmTEs15AI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s8UG4FX6h6kB4CTcjyi5cL8n46Da3R3XMjxr8JRpw1bRgGnuHQhJeVZGYOQw0B5e/8DYujxBvfz4vXfourQzudo0f8x57CW3zoBJ58w+QkNtwnid8ceW1bgRlL8MjoVZ8j2R2IMkoLPbsWrX55I4/mgI2dh1mo/BbdaBcfpkNzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.17])
	by gateway (Coremail) with SMTP id _____8DxNMH1ScppMu0fAA--.43337S3;
	Mon, 30 Mar 2026 18:01:25 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.17])
	by front1 (Coremail) with SMTP id qMiowJBxxuLuScpptK9gAA--.41618S2;
	Mon, 30 Mar 2026 18:01:21 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: Xuerui Wang <kernel@xen0n.name>,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Xi Ruoyao <xry111@xry111.site>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH for 6.12] LoongArch: vDSO: Emit GNU_EH_FRAME correctly
Date: Mon, 30 Mar 2026 18:01:07 +0800
Message-ID: <20260330100107.3955340-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxxuLuScpptK9gAA--.41618S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW3WFWxXry3ZFWrKF15AFWUGFX_yoWfXrWrpF
	n8Zrn5GrZ8WFyI9ryDtw4rZrZ0yFn7Gr129ayqka4UCryYgr1xWF4vyrs0qF1kJw4kCrWI
	gF90qay5uF45AagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jUsqXUUUUU=

From: Xi Ruoyao <xry111@xry111.site>

commit e4878c37f6679fdea91b27a0f4e60a871f0b7bad upstream.

With -fno-asynchronous-unwind-tables and --no-eh-frame-hdr (the default
of the linker), the GNU_EH_FRAME segment (specified by vdso.lds.S) is
empty.  This is not valid, as the current DWARF specification mandates
the first byte of the EH frame to be the version number 1.  It causes
some unwinders to complain, for example the ClickHouse query profiler
spams the log with messages:

    clickhouse-server[365854]: libunwind: unsupported .eh_frame_hdr
    version: 127 at 7ffffffb0000

Here "127" is just the byte located at the p_vaddr (0, i.e. the
beginning of the vDSO) of the empty GNU_EH_FRAME segment. Cross-
checking with /proc/365854/maps has also proven 7ffffffb0000 is the
start of vDSO in the process VM image.

In LoongArch the -fno-asynchronous-unwind-tables option seems just a
MIPS legacy, and MIPS only uses this option to satisfy the MIPS-specific
"genvdso" program, per the commit cfd75c2db17e ("MIPS: VDSO: Explicitly
use -fno-asynchronous-unwind-tables").  IIRC it indicates some inherent
limitation of the MIPS ELF ABI and has nothing to do with LoongArch.  So
we can simply flip it over to -fasynchronous-unwind-tables and pass
--eh-frame-hdr for linking the vDSO, allowing the profilers to unwind the
stack for statistics even if the sample point is taken when the PC is in
the vDSO.

However simply adjusting the options above would exploit an issue: when
the libgcc unwinder saw the invalid GNU_EH_FRAME segment, it silently
falled back to a machine-specific routine to match the code pattern of
rt_sigreturn() and extract the registers saved in the sigframe if the
code pattern is matched.  As unwinding from signal handlers is vital for
libgcc to support pthread cancellation etc., the fall-back routine had
been silently keeping the LoongArch Linux systems functioning since
Linux 5.19.  But when we start to emit GNU_EH_FRAME with the correct
format, fall-back routine will no longer be used and libgcc will fail
to unwind the sigframe, and unwinding from signal handlers will no
longer work, causing dozens of glibc test failures.  To make it possible
to unwind from signal handlers again, it's necessary to code the unwind
info in __vdso_rt_sigreturn via .cfi_* directives.

The offsets in the .cfi_* directives depend on the layout of struct
sigframe, notably the offset of sigcontext in the sigframe.  To use the
offset in the assembly file, factor out struct sigframe into a header to
allow asm-offsets.c to output the offset for assembly.

To work around a long-term issue in the libgcc unwinder (the pc is
unconditionally substracted by 1: doing so is technically incorrect for
a signal frame), a nop instruction is included with the two real
instructions in __vdso_rt_sigreturn in the same FDE PC range.  The same
hack has been used on x86 for a long time.

Cc: stable@vger.kernel.org
Fixes: c6b99bed6b8f ("LoongArch: Add VDSO and VSYSCALL support")
Signed-off-by: Xi Ruoyao <xry111@xry111.site>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/include/asm/linkage.h  | 36 +++++++++++++++++++++++++++
 arch/loongarch/include/asm/sigframe.h |  9 +++++++
 arch/loongarch/kernel/asm-offsets.c   |  2 ++
 arch/loongarch/kernel/signal.c        |  6 +----
 arch/loongarch/vdso/Makefile          |  4 +--
 arch/loongarch/vdso/sigreturn.S       |  6 ++---
 6 files changed, 53 insertions(+), 10 deletions(-)
 create mode 100644 arch/loongarch/include/asm/sigframe.h

diff --git a/arch/loongarch/include/asm/linkage.h b/arch/loongarch/include/asm/linkage.h
index e2eca1a25b4e..a1bd6a3ee03a 100644
--- a/arch/loongarch/include/asm/linkage.h
+++ b/arch/loongarch/include/asm/linkage.h
@@ -41,4 +41,40 @@
 	.cfi_endproc;					\
 	SYM_END(name, SYM_T_NONE)
 
+/*
+ * This is for the signal handler trampoline, which is used as the return
+ * address of the signal handlers in userspace instead of called normally.
+ * The long standing libgcc bug https://gcc.gnu.org/PR124050 requires a
+ * nop between .cfi_startproc and the actual address of the trampoline, so
+ * we cannot simply use SYM_FUNC_START.
+ *
+ * This wrapper also contains all the .cfi_* directives for recovering
+ * the content of the GPRs and the "return address" (where the rt_sigreturn
+ * syscall will jump to), assuming there is a struct rt_sigframe (where
+ * a struct sigcontext containing those information we need to recover) at
+ * $sp.  The "DWARF for the LoongArch(TM) Architecture" manual states
+ * column 0 is for $zero, but it does not make too much sense to
+ * save/restore the hardware zero register.  Repurpose this column here
+ * for the return address (here it's not the content of $ra we cannot use
+ * the default column 3).
+ */
+#define SYM_SIGFUNC_START(name)				\
+	.cfi_startproc;					\
+	.cfi_signal_frame;				\
+	.cfi_def_cfa 3, RT_SIGFRAME_SC;			\
+	.cfi_return_column 0;				\
+	.cfi_offset 0, SC_PC;				\
+							\
+	.irp num, 1,  2,  3,  4,  5,  6,  7,  8, 	\
+		  9,  10, 11, 12, 13, 14, 15, 16,	\
+		  17, 18, 19, 20, 21, 22, 23, 24,	\
+		  25, 26, 27, 28, 29, 30, 31;		\
+	.cfi_offset \num, SC_REGS + \num * SZREG;	\
+	.endr;						\
+							\
+	nop;						\
+	SYM_START(name, SYM_L_GLOBAL, SYM_A_ALIGN)
+
+#define SYM_SIGFUNC_END(name) SYM_FUNC_END(name)
+
 #endif
diff --git a/arch/loongarch/include/asm/sigframe.h b/arch/loongarch/include/asm/sigframe.h
new file mode 100644
index 000000000000..109298b8d7e0
--- /dev/null
+++ b/arch/loongarch/include/asm/sigframe.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#include <asm/siginfo.h>
+#include <asm/ucontext.h>
+
+struct rt_sigframe {
+	struct siginfo rs_info;
+	struct ucontext rs_uctx;
+};
diff --git a/arch/loongarch/kernel/asm-offsets.c b/arch/loongarch/kernel/asm-offsets.c
index 73954aa22664..3f3d22f0b94a 100644
--- a/arch/loongarch/kernel/asm-offsets.c
+++ b/arch/loongarch/kernel/asm-offsets.c
@@ -16,6 +16,7 @@
 #include <asm/ptrace.h>
 #include <asm/processor.h>
 #include <asm/ftrace.h>
+#include <asm/sigframe.h>
 
 static void __used output_ptreg_defines(void)
 {
@@ -219,6 +220,7 @@ static void __used output_sc_defines(void)
 	COMMENT("Linux sigcontext offsets.");
 	OFFSET(SC_REGS, sigcontext, sc_regs);
 	OFFSET(SC_PC, sigcontext, sc_pc);
+	OFFSET(RT_SIGFRAME_SC, rt_sigframe, rs_uctx.uc_mcontext);
 	BLANK();
 }
 
diff --git a/arch/loongarch/kernel/signal.c b/arch/loongarch/kernel/signal.c
index c9f7ca778364..d4151d2fb82e 100644
--- a/arch/loongarch/kernel/signal.c
+++ b/arch/loongarch/kernel/signal.c
@@ -35,6 +35,7 @@
 #include <asm/cpu-features.h>
 #include <asm/fpu.h>
 #include <asm/lbt.h>
+#include <asm/sigframe.h>
 #include <asm/ucontext.h>
 #include <asm/vdso.h>
 
@@ -51,11 +52,6 @@
 #define lock_lbt_owner()	({ preempt_disable(); pagefault_disable(); })
 #define unlock_lbt_owner()	({ pagefault_enable(); preempt_enable(); })
 
-struct rt_sigframe {
-	struct siginfo rs_info;
-	struct ucontext rs_uctx;
-};
-
 struct _ctx_layout {
 	struct sctx_info *addr;
 	unsigned int size;
diff --git a/arch/loongarch/vdso/Makefile b/arch/loongarch/vdso/Makefile
index 49af37f781bb..b37cda634644 100644
--- a/arch/loongarch/vdso/Makefile
+++ b/arch/loongarch/vdso/Makefile
@@ -21,7 +21,7 @@ cflags-vdso := $(ccflags-vdso) \
 	$(filter -W%,$(filter-out -Wa$(comma)%,$(KBUILD_CFLAGS))) \
 	-std=gnu11 -O2 -g -fno-strict-aliasing -fno-common -fno-builtin \
 	-fno-stack-protector -fno-jump-tables -DDISABLE_BRANCH_PROFILING \
-	$(call cc-option, -fno-asynchronous-unwind-tables) \
+	$(call cc-option, -fasynchronous-unwind-tables) \
 	$(call cc-option, -fno-stack-protector)
 aflags-vdso := $(ccflags-vdso) \
 	-D__ASSEMBLY__ -Wa,-gdwarf-2
@@ -36,7 +36,7 @@ endif
 
 # VDSO linker flags.
 ldflags-y := -Bsymbolic --no-undefined -soname=linux-vdso.so.1 \
-	$(filter -E%,$(KBUILD_CFLAGS)) -shared --build-id -T
+	$(filter -E%,$(KBUILD_CFLAGS)) -shared --build-id --eh-frame-hdr -T
 
 #
 # Shared build commands.
diff --git a/arch/loongarch/vdso/sigreturn.S b/arch/loongarch/vdso/sigreturn.S
index 9cb3c58fad03..59f940d928de 100644
--- a/arch/loongarch/vdso/sigreturn.S
+++ b/arch/loongarch/vdso/sigreturn.S
@@ -12,13 +12,13 @@
 
 #include <asm/regdef.h>
 #include <asm/asm.h>
+#include <asm/asm-offsets.h>
 
 	.section	.text
-	.cfi_sections	.debug_frame
 
-SYM_FUNC_START(__vdso_rt_sigreturn)
+SYM_SIGFUNC_START(__vdso_rt_sigreturn)
 
 	li.w	a7, __NR_rt_sigreturn
 	syscall	0
 
-SYM_FUNC_END(__vdso_rt_sigreturn)
+SYM_SIGFUNC_END(__vdso_rt_sigreturn)
-- 
2.52.0

