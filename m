Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBD72777E0
	for <loongarch@lists.linux.dev>; Wed, 11 Jun 2025 12:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749643434; cv=none; b=blVKg6BoEzlFLS1aF5vGhJQH3XG0sNr0WcuGJMzqfmSWEeWL5nILbCcc65UXEEcvtlKzT6xh2JZ/6hxDe5dVx91GlhL2xw+91jdnmGmHblmBCryZW50hq2MPO9YFGSk28A6NrcO9Q6VghahAid9DA5EmrXC1JNvENS4+qFN00fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749643434; c=relaxed/simple;
	bh=9UiKiYlx5NA+Z06PkejCZwe3N8/A/yr0lPz8XjtxIME=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=Pa2k/WYQRyjTSFKHv8pT8o/oeeOMFhLIwoCAQv+yINglF5kwwyzjgoZLMAAtfTza7u+tZG1mKKnl6G+LUj1XiA6s16N/CJCml7W6DAzFSz+t1QCCwQzuOqZPkOFPbmM0r4lWb2j2Ek2JTWoG2iyxWzi/7U52mjaIuh7SMc/xOqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NJGEitMG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NJGEitMG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749643426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ow2IwBmPUHChzUExeXC999l5mAhG3xnp+q9/Yre91sM=;
	b=NJGEitMGT2GFLemwTWoglfXa9sG60BWuhp//Ah2dCjBoL2XrW9nOiQAWmKdqS92aiQSuoz
	gvM5r3XA5x32icBPIlBGQ4pYicWavgeTsqpYOso3tiBvKcp94T+swEtIkeLYJXPidWagfL
	ofjdOjVNxdt2kOKM+LRvbQ0s39pVy2Y=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-138-k6zscBNZNgCWIYIQ6RIPyQ-1; Wed,
 11 Jun 2025 08:03:40 -0400
X-MC-Unique: k6zscBNZNgCWIYIQ6RIPyQ-1
X-Mimecast-MFC-AGG-ID: k6zscBNZNgCWIYIQ6RIPyQ_1749643413
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D260618002A2;
	Wed, 11 Jun 2025 12:03:32 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.45.224.174])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9E339180045B;
	Wed, 11 Jun 2025 12:03:30 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev
Subject: [PATCH v2] loongarch: Replace __ASSEMBLY__ with __ASSEMBLER__ in the loongarch headers
Date: Wed, 11 Jun 2025 14:03:28 +0200
Message-ID: <20250611120328.120219-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Skwv15t_Lk-i6yNtACZwBqdVeJWrTKtEr4F4kH0u5KQ_1749643413
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

From: Thomas Huth <thuth@redhat.com>

While the GCC and Clang compilers already define __ASSEMBLER__
automatically when compiling assembler code, __ASSEMBLY__ is a
macro that only gets defined by the Makefiles in the kernel.
This is bad since macros starting with two underscores are names
that are reserved by the C language. It can also be very confusing
for the developers when switching between userspace and kernelspace
coding, or when dealing with uapi headers that rather should use
__ASSEMBLER__  instead. So let's now standardize on the __ASSEMBLER__
macro that is provided by the compilers.

This is almost a completely mechanical patch (done with a simple
"sed -i" statement), with one comment tweaked manually in
arch/loongarch/include/asm/cpu.h (it was missing the trailing
underscores).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v2: Rebased and fixed more occurances that have been added recently

 arch/loongarch/include/asm/addrspace.h         |  8 ++++----
 arch/loongarch/include/asm/alternative-asm.h   |  4 ++--
 arch/loongarch/include/asm/alternative.h       |  4 ++--
 arch/loongarch/include/asm/asm-extable.h       |  6 +++---
 arch/loongarch/include/asm/asm.h               |  8 ++++----
 arch/loongarch/include/asm/cpu.h               |  4 ++--
 arch/loongarch/include/asm/ftrace.h            |  4 ++--
 arch/loongarch/include/asm/gpr-num.h           |  6 +++---
 arch/loongarch/include/asm/irqflags.h          |  4 ++--
 arch/loongarch/include/asm/jump_label.h        |  4 ++--
 arch/loongarch/include/asm/kasan.h             |  2 +-
 arch/loongarch/include/asm/loongarch.h         | 16 ++++++++--------
 arch/loongarch/include/asm/orc_types.h         |  4 ++--
 arch/loongarch/include/asm/page.h              |  4 ++--
 arch/loongarch/include/asm/pgtable-bits.h      |  4 ++--
 arch/loongarch/include/asm/pgtable.h           |  4 ++--
 arch/loongarch/include/asm/prefetch.h          |  2 +-
 arch/loongarch/include/asm/thread_info.h       |  4 ++--
 arch/loongarch/include/asm/types.h             |  2 +-
 arch/loongarch/include/asm/unwind_hints.h      |  6 +++---
 arch/loongarch/include/asm/vdso/arch_data.h    |  4 ++--
 arch/loongarch/include/asm/vdso/getrandom.h    |  4 ++--
 arch/loongarch/include/asm/vdso/gettimeofday.h |  4 ++--
 arch/loongarch/include/asm/vdso/processor.h    |  4 ++--
 arch/loongarch/include/asm/vdso/vdso.h         |  4 ++--
 arch/loongarch/include/asm/vdso/vsyscall.h     |  4 ++--
 tools/arch/loongarch/include/asm/orc_types.h   |  4 ++--
 27 files changed, 64 insertions(+), 64 deletions(-)

diff --git a/arch/loongarch/include/asm/addrspace.h b/arch/loongarch/include/asm/addrspace.h
index fe198b473f849..e739dbc6329dc 100644
--- a/arch/loongarch/include/asm/addrspace.h
+++ b/arch/loongarch/include/asm/addrspace.h
@@ -18,12 +18,12 @@
 /*
  * This gives the physical RAM offset.
  */
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 #ifndef PHYS_OFFSET
 #define PHYS_OFFSET	_UL(0)
 #endif
 extern unsigned long vm_map_base;
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #ifndef IO_BASE
 #define IO_BASE			CSR_DMW0_BASE
@@ -66,7 +66,7 @@ extern unsigned long vm_map_base;
 #define FIXADDR_TOP		((unsigned long)(long)(int)0xfffe0000)
 #endif
 
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 #define _ATYPE_
 #define _ATYPE32_
 #define _ATYPE64_
@@ -85,7 +85,7 @@ extern unsigned long vm_map_base;
 /*
  *  32/64-bit LoongArch address spaces
  */
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 #define _ACAST32_
 #define _ACAST64_
 #else
diff --git a/arch/loongarch/include/asm/alternative-asm.h b/arch/loongarch/include/asm/alternative-asm.h
index ff3d10ac393f2..7dc29bd9b2f0e 100644
--- a/arch/loongarch/include/asm/alternative-asm.h
+++ b/arch/loongarch/include/asm/alternative-asm.h
@@ -2,7 +2,7 @@
 #ifndef _ASM_ALTERNATIVE_ASM_H
 #define _ASM_ALTERNATIVE_ASM_H
 
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 
 #include <asm/asm.h>
 
@@ -77,6 +77,6 @@
 	.previous
 .endm
 
-#endif  /*  __ASSEMBLY__  */
+#endif  /*  __ASSEMBLER__  */
 
 #endif /* _ASM_ALTERNATIVE_ASM_H */
diff --git a/arch/loongarch/include/asm/alternative.h b/arch/loongarch/include/asm/alternative.h
index cee7b29785ab2..b5bae21fb3c85 100644
--- a/arch/loongarch/include/asm/alternative.h
+++ b/arch/loongarch/include/asm/alternative.h
@@ -2,7 +2,7 @@
 #ifndef _ASM_ALTERNATIVE_H
 #define _ASM_ALTERNATIVE_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <linux/types.h>
 #include <linux/stddef.h>
@@ -106,6 +106,6 @@ extern void apply_alternatives(struct alt_instr *start, struct alt_instr *end);
 #define alternative_2(oldinstr, newinstr1, feature1, newinstr2, feature2) \
 	(asm volatile(ALTERNATIVE_2(oldinstr, newinstr1, feature1, newinstr2, feature2) ::: "memory"))
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* _ASM_ALTERNATIVE_H */
diff --git a/arch/loongarch/include/asm/asm-extable.h b/arch/loongarch/include/asm/asm-extable.h
index df05005f2b80a..d60bdf2e63775 100644
--- a/arch/loongarch/include/asm/asm-extable.h
+++ b/arch/loongarch/include/asm/asm-extable.h
@@ -7,7 +7,7 @@
 #define EX_TYPE_UACCESS_ERR_ZERO	2
 #define EX_TYPE_BPF			3
 
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 
 #define __ASM_EXTABLE_RAW(insn, fixup, type, data)	\
 	.pushsection	__ex_table, "a";		\
@@ -22,7 +22,7 @@
 	__ASM_EXTABLE_RAW(\insn, \fixup, EX_TYPE_FIXUP, 0)
 	.endm
 
-#else /* __ASSEMBLY__ */
+#else /* __ASSEMBLER__ */
 
 #include <linux/bits.h>
 #include <linux/stringify.h>
@@ -60,6 +60,6 @@
 #define _ASM_EXTABLE_UACCESS_ERR(insn, fixup, err)			\
 	_ASM_EXTABLE_UACCESS_ERR_ZERO(insn, fixup, err, zero)
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* __ASM_ASM_EXTABLE_H */
diff --git a/arch/loongarch/include/asm/asm.h b/arch/loongarch/include/asm/asm.h
index f591b3245def6..f018d26fc995a 100644
--- a/arch/loongarch/include/asm/asm.h
+++ b/arch/loongarch/include/asm/asm.h
@@ -110,7 +110,7 @@
 #define LONG_SRA	srai.w
 #define LONG_SRAV	sra.w
 
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 #define LONG		.word
 #endif
 #define LONGSIZE	4
@@ -131,7 +131,7 @@
 #define LONG_SRA	srai.d
 #define LONG_SRAV	sra.d
 
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 #define LONG		.dword
 #endif
 #define LONGSIZE	8
@@ -158,7 +158,7 @@
 
 #define PTR_SCALESHIFT	2
 
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 #define PTR		.word
 #endif
 #define PTRSIZE		4
@@ -181,7 +181,7 @@
 
 #define PTR_SCALESHIFT	3
 
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 #define PTR		.dword
 #endif
 #define PTRSIZE		8
diff --git a/arch/loongarch/include/asm/cpu.h b/arch/loongarch/include/asm/cpu.h
index 98cf4d7b4b0a0..dfb982fe87019 100644
--- a/arch/loongarch/include/asm/cpu.h
+++ b/arch/loongarch/include/asm/cpu.h
@@ -46,7 +46,7 @@
 
 #define PRID_PRODUCT_MASK	0x0fff
 
-#if !defined(__ASSEMBLY__)
+#if !defined(__ASSEMBLER__)
 
 enum cpu_type_enum {
 	CPU_UNKNOWN,
@@ -55,7 +55,7 @@ enum cpu_type_enum {
 	CPU_LAST
 };
 
-#endif /* !__ASSEMBLY */
+#endif /* !__ASSEMBLER__ */
 
 /*
  * ISA Level encodings
diff --git a/arch/loongarch/include/asm/ftrace.h b/arch/loongarch/include/asm/ftrace.h
index 6e0a99763a9a7..f4caaf764f9ee 100644
--- a/arch/loongarch/include/asm/ftrace.h
+++ b/arch/loongarch/include/asm/ftrace.h
@@ -14,7 +14,7 @@
 
 #define MCOUNT_INSN_SIZE 4		/* sizeof mcount call */
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #ifndef CONFIG_DYNAMIC_FTRACE
 
@@ -84,7 +84,7 @@ __arch_ftrace_set_direct_caller(struct pt_regs *regs, unsigned long addr)
 
 #endif
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* CONFIG_FUNCTION_TRACER */
 
diff --git a/arch/loongarch/include/asm/gpr-num.h b/arch/loongarch/include/asm/gpr-num.h
index 996038da806d1..af95b941f48bd 100644
--- a/arch/loongarch/include/asm/gpr-num.h
+++ b/arch/loongarch/include/asm/gpr-num.h
@@ -2,7 +2,7 @@
 #ifndef __ASM_GPR_NUM_H
 #define __ASM_GPR_NUM_H
 
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 
 	.equ	.L__gpr_num_zero, 0
 	.irp	num,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
@@ -25,7 +25,7 @@
 	.equ	.L__gpr_num_$s\num, 23 + \num
 	.endr
 
-#else /* __ASSEMBLY__ */
+#else /* __ASSEMBLER__ */
 
 #define __DEFINE_ASM_GPR_NUMS					\
 "	.equ	.L__gpr_num_zero, 0\n"				\
@@ -47,6 +47,6 @@
 "	.equ	.L__gpr_num_$s\\num, 23 + \\num\n"		\
 "	.endr\n"						\
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* __ASM_GPR_NUM_H */
diff --git a/arch/loongarch/include/asm/irqflags.h b/arch/loongarch/include/asm/irqflags.h
index 003172b8406be..620163628a7f6 100644
--- a/arch/loongarch/include/asm/irqflags.h
+++ b/arch/loongarch/include/asm/irqflags.h
@@ -5,7 +5,7 @@
 #ifndef _ASM_IRQFLAGS_H
 #define _ASM_IRQFLAGS_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <linux/compiler.h>
 #include <linux/stringify.h>
@@ -80,6 +80,6 @@ static inline int arch_irqs_disabled(void)
 	return arch_irqs_disabled_flags(arch_local_save_flags());
 }
 
-#endif /* #ifndef __ASSEMBLY__ */
+#endif /* #ifndef __ASSEMBLER__ */
 
 #endif /* _ASM_IRQFLAGS_H */
diff --git a/arch/loongarch/include/asm/jump_label.h b/arch/loongarch/include/asm/jump_label.h
index 8a924bd69d196..4000c7603d8e3 100644
--- a/arch/loongarch/include/asm/jump_label.h
+++ b/arch/loongarch/include/asm/jump_label.h
@@ -7,7 +7,7 @@
 #ifndef __ASM_JUMP_LABEL_H
 #define __ASM_JUMP_LABEL_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <linux/types.h>
 
@@ -50,5 +50,5 @@ static __always_inline bool arch_static_branch_jump(struct static_key * const ke
 	return true;
 }
 
-#endif  /* __ASSEMBLY__ */
+#endif  /* __ASSEMBLER__ */
 #endif	/* __ASM_JUMP_LABEL_H */
diff --git a/arch/loongarch/include/asm/kasan.h b/arch/loongarch/include/asm/kasan.h
index 7f52bd31b9d4f..62f139a9c87da 100644
--- a/arch/loongarch/include/asm/kasan.h
+++ b/arch/loongarch/include/asm/kasan.h
@@ -2,7 +2,7 @@
 #ifndef __ASM_KASAN_H
 #define __ASM_KASAN_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <linux/linkage.h>
 #include <linux/mmzone.h>
diff --git a/arch/loongarch/include/asm/loongarch.h b/arch/loongarch/include/asm/loongarch.h
index d84dac88a5846..a0994d226efff 100644
--- a/arch/loongarch/include/asm/loongarch.h
+++ b/arch/loongarch/include/asm/loongarch.h
@@ -9,15 +9,15 @@
 #include <linux/linkage.h>
 #include <linux/types.h>
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 #include <larchintrin.h>
 
 /* CPUCFG */
 #define read_cpucfg(reg) __cpucfg(reg)
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 
 /* LoongArch Registers */
 #define REG_ZERO	0x0
@@ -53,7 +53,7 @@
 #define REG_S7		0x1e
 #define REG_S8		0x1f
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 /* Bit fields for CPUCFG registers */
 #define LOONGARCH_CPUCFG0		0x0
@@ -171,7 +171,7 @@
  * SW emulation for KVM hypervirsor, see arch/loongarch/include/uapi/asm/kvm_para.h
  */
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 /* CSR */
 #define csr_read32(reg) __csrrd_w(reg)
@@ -187,7 +187,7 @@
 #define iocsr_write32(val, reg) __iocsrwr_w(val, reg)
 #define iocsr_write64(val, reg) __iocsrwr_d(val, reg)
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 /* CSR register number */
 
@@ -1195,7 +1195,7 @@
 #define LOONGARCH_IOCSR_EXTIOI_ROUTE_BASE	0x1c00
 #define IOCSR_EXTIOI_VECTOR_NUM			256
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 static __always_inline u64 drdtime(void)
 {
@@ -1357,7 +1357,7 @@ __BUILD_CSR_OP(tlbidx)
 #define clear_csr_estat(val)	\
 	csr_xchg32(~(val), val, LOONGARCH_CSR_ESTAT)
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 /* Generic EntryLo bit definitions */
 #define ENTRYLO_V		(_ULCAST_(1) << 0)
diff --git a/arch/loongarch/include/asm/orc_types.h b/arch/loongarch/include/asm/orc_types.h
index caf1f71a1057b..d5fa98d1d1779 100644
--- a/arch/loongarch/include/asm/orc_types.h
+++ b/arch/loongarch/include/asm/orc_types.h
@@ -34,7 +34,7 @@
 #define ORC_TYPE_REGS			3
 #define ORC_TYPE_REGS_PARTIAL		4
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 /*
  * This struct is more or less a vastly simplified version of the DWARF Call
  * Frame Information standard.  It contains only the necessary parts of DWARF
@@ -53,6 +53,6 @@ struct orc_entry {
 	unsigned int	type:3;
 	unsigned int	signal:1;
 };
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* _ORC_TYPES_H */
diff --git a/arch/loongarch/include/asm/page.h b/arch/loongarch/include/asm/page.h
index 7368f12b7cb1e..a3aaf34fba16a 100644
--- a/arch/loongarch/include/asm/page.h
+++ b/arch/loongarch/include/asm/page.h
@@ -15,7 +15,7 @@
 #define HPAGE_MASK	(~(HPAGE_SIZE - 1))
 #define HUGETLB_PAGE_ORDER	(HPAGE_SHIFT - PAGE_SHIFT)
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <linux/kernel.h>
 #include <linux/pfn.h>
@@ -110,6 +110,6 @@ extern int __virt_addr_valid(volatile void *kaddr);
 #include <asm-generic/memory_model.h>
 #include <asm-generic/getorder.h>
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 #endif /* _ASM_PAGE_H */
diff --git a/arch/loongarch/include/asm/pgtable-bits.h b/arch/loongarch/include/asm/pgtable-bits.h
index 45bfc65a0c9f9..7bbfb04a54cc3 100644
--- a/arch/loongarch/include/asm/pgtable-bits.h
+++ b/arch/loongarch/include/asm/pgtable-bits.h
@@ -92,7 +92,7 @@
 #define PAGE_KERNEL_WUC __pgprot(_PAGE_PRESENT | __READABLE | __WRITEABLE | \
 				 _PAGE_GLOBAL | _PAGE_KERN |  _CACHE_WUC)
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #define _PAGE_IOREMAP		pgprot_val(PAGE_KERNEL_SUC)
 
@@ -127,6 +127,6 @@ static inline pgprot_t pgprot_writecombine(pgprot_t _prot)
 	return __pgprot(prot);
 }
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 #endif /* _ASM_PGTABLE_BITS_H */
diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index a3f17914dbab1..e5d906f87c5b7 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -55,7 +55,7 @@
 
 #define USER_PTRS_PER_PGD       ((TASK_SIZE64 / PGDIR_SIZE)?(TASK_SIZE64 / PGDIR_SIZE):1)
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <linux/mm_types.h>
 #include <linux/mmzone.h>
@@ -618,6 +618,6 @@ static inline long pmd_protnone(pmd_t pmd)
 #define HAVE_ARCH_UNMAPPED_AREA
 #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 #endif /* _ASM_PGTABLE_H */
diff --git a/arch/loongarch/include/asm/prefetch.h b/arch/loongarch/include/asm/prefetch.h
index 1672262a5e2ef..0b168cdaae9a9 100644
--- a/arch/loongarch/include/asm/prefetch.h
+++ b/arch/loongarch/include/asm/prefetch.h
@@ -8,7 +8,7 @@
 #define Pref_Load	0
 #define Pref_Store	8
 
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 
 	.macro	__pref hint addr
 #ifdef CONFIG_CPU_HAS_PREFETCH
diff --git a/arch/loongarch/include/asm/thread_info.h b/arch/loongarch/include/asm/thread_info.h
index 4f5a9441754e3..9dfa2ef008167 100644
--- a/arch/loongarch/include/asm/thread_info.h
+++ b/arch/loongarch/include/asm/thread_info.h
@@ -10,7 +10,7 @@
 
 #ifdef __KERNEL__
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <asm/processor.h>
 
@@ -53,7 +53,7 @@ static inline struct thread_info *current_thread_info(void)
 
 register unsigned long current_stack_pointer __asm__("$sp");
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 /* thread information allocation */
 #define THREAD_SIZE		SZ_16K
diff --git a/arch/loongarch/include/asm/types.h b/arch/loongarch/include/asm/types.h
index baf15a0dcf8b5..0edd731f3d6a0 100644
--- a/arch/loongarch/include/asm/types.h
+++ b/arch/loongarch/include/asm/types.h
@@ -8,7 +8,7 @@
 #include <asm-generic/int-ll64.h>
 #include <uapi/asm/types.h>
 
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 #define _ULCAST_
 #define _U64CAST_
 #else
diff --git a/arch/loongarch/include/asm/unwind_hints.h b/arch/loongarch/include/asm/unwind_hints.h
index 2c68bc72736c9..16c7f7e465a0f 100644
--- a/arch/loongarch/include/asm/unwind_hints.h
+++ b/arch/loongarch/include/asm/unwind_hints.h
@@ -5,7 +5,7 @@
 #include <linux/objtool.h>
 #include <asm/orc_types.h>
 
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 
 .macro UNWIND_HINT_UNDEFINED
 	UNWIND_HINT type=UNWIND_HINT_TYPE_UNDEFINED
@@ -23,7 +23,7 @@
 	UNWIND_HINT sp_reg=ORC_REG_SP type=UNWIND_HINT_TYPE_CALL
 .endm
 
-#else /* !__ASSEMBLY__ */
+#else /* !__ASSEMBLER__ */
 
 #define UNWIND_HINT_SAVE \
 	UNWIND_HINT(UNWIND_HINT_TYPE_SAVE, 0, 0, 0)
@@ -31,6 +31,6 @@
 #define UNWIND_HINT_RESTORE \
 	UNWIND_HINT(UNWIND_HINT_TYPE_RESTORE, 0, 0, 0)
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 #endif /* _ASM_LOONGARCH_UNWIND_HINTS_H */
diff --git a/arch/loongarch/include/asm/vdso/arch_data.h b/arch/loongarch/include/asm/vdso/arch_data.h
index 322d0a5f1c844..395ec223bcbed 100644
--- a/arch/loongarch/include/asm/vdso/arch_data.h
+++ b/arch/loongarch/include/asm/vdso/arch_data.h
@@ -7,7 +7,7 @@
 #ifndef _VDSO_ARCH_DATA_H
 #define _VDSO_ARCH_DATA_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <asm/asm.h>
 #include <asm/vdso.h>
@@ -20,6 +20,6 @@ struct vdso_arch_data {
 	struct vdso_pcpu_data pdata[NR_CPUS];
 };
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif
diff --git a/arch/loongarch/include/asm/vdso/getrandom.h b/arch/loongarch/include/asm/vdso/getrandom.h
index a81724b69f291..2ff05003c6e74 100644
--- a/arch/loongarch/include/asm/vdso/getrandom.h
+++ b/arch/loongarch/include/asm/vdso/getrandom.h
@@ -5,7 +5,7 @@
 #ifndef __ASM_VDSO_GETRANDOM_H
 #define __ASM_VDSO_GETRANDOM_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <asm/unistd.h>
 #include <asm/vdso/vdso.h>
@@ -28,6 +28,6 @@ static __always_inline ssize_t getrandom_syscall(void *_buffer, size_t _len, uns
 	return ret;
 }
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 #endif /* __ASM_VDSO_GETRANDOM_H */
diff --git a/arch/loongarch/include/asm/vdso/gettimeofday.h b/arch/loongarch/include/asm/vdso/gettimeofday.h
index f15503e3336ca..dcafabca9bb69 100644
--- a/arch/loongarch/include/asm/vdso/gettimeofday.h
+++ b/arch/loongarch/include/asm/vdso/gettimeofday.h
@@ -7,7 +7,7 @@
 #ifndef __ASM_VDSO_GETTIMEOFDAY_H
 #define __ASM_VDSO_GETTIMEOFDAY_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <asm/unistd.h>
 #include <asm/vdso/vdso.h>
@@ -89,6 +89,6 @@ static inline bool loongarch_vdso_hres_capable(void)
 }
 #define __arch_vdso_hres_capable loongarch_vdso_hres_capable
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 #endif /* __ASM_VDSO_GETTIMEOFDAY_H */
diff --git a/arch/loongarch/include/asm/vdso/processor.h b/arch/loongarch/include/asm/vdso/processor.h
index ef5770b343a01..1e255373b0b8e 100644
--- a/arch/loongarch/include/asm/vdso/processor.h
+++ b/arch/loongarch/include/asm/vdso/processor.h
@@ -5,10 +5,10 @@
 #ifndef __ASM_VDSO_PROCESSOR_H
 #define __ASM_VDSO_PROCESSOR_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #define cpu_relax()	barrier()
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* __ASM_VDSO_PROCESSOR_H */
diff --git a/arch/loongarch/include/asm/vdso/vdso.h b/arch/loongarch/include/asm/vdso/vdso.h
index 50c65fb29dafb..04bd2d4528769 100644
--- a/arch/loongarch/include/asm/vdso/vdso.h
+++ b/arch/loongarch/include/asm/vdso/vdso.h
@@ -7,7 +7,7 @@
 #ifndef _ASM_VDSO_VDSO_H
 #define _ASM_VDSO_VDSO_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <asm/asm.h>
 #include <asm/page.h>
@@ -16,6 +16,6 @@
 
 #define VVAR_SIZE (VDSO_NR_PAGES << PAGE_SHIFT)
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif
diff --git a/arch/loongarch/include/asm/vdso/vsyscall.h b/arch/loongarch/include/asm/vdso/vsyscall.h
index 1140b54b4bc82..558eb9dfda520 100644
--- a/arch/loongarch/include/asm/vdso/vsyscall.h
+++ b/arch/loongarch/include/asm/vdso/vsyscall.h
@@ -2,13 +2,13 @@
 #ifndef __ASM_VDSO_VSYSCALL_H
 #define __ASM_VDSO_VSYSCALL_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <vdso/datapage.h>
 
 /* The asm-generic header needs to be included after the definitions above */
 #include <asm-generic/vdso/vsyscall.h>
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 #endif /* __ASM_VDSO_VSYSCALL_H */
diff --git a/tools/arch/loongarch/include/asm/orc_types.h b/tools/arch/loongarch/include/asm/orc_types.h
index caf1f71a1057b..d5fa98d1d1779 100644
--- a/tools/arch/loongarch/include/asm/orc_types.h
+++ b/tools/arch/loongarch/include/asm/orc_types.h
@@ -34,7 +34,7 @@
 #define ORC_TYPE_REGS			3
 #define ORC_TYPE_REGS_PARTIAL		4
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 /*
  * This struct is more or less a vastly simplified version of the DWARF Call
  * Frame Information standard.  It contains only the necessary parts of DWARF
@@ -53,6 +53,6 @@ struct orc_entry {
 	unsigned int	type:3;
 	unsigned int	signal:1;
 };
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* _ORC_TYPES_H */
-- 
2.49.0

