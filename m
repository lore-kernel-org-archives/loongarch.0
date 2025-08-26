Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86EA42877C0
	for <loongarch@lists.linux.dev>; Tue, 26 Aug 2025 06:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756190813; cv=none; b=GK6PfI2UpXlT7wpZvaBP/GpLoyxPlESTrD4Oa6alch9qmJPdP2DnkMJUYLRc+QFbj6lzZvTazxgjbyL4va5D6YSw4fIz4Shc6v8gCSy9Xxh8K3hGBAjSoCoxTTgkVLRFRxFsy4X4WFys5zmbl3YW4DH56EY8DFGM3htuDP9gdco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756190813; c=relaxed/simple;
	bh=dgpl0zeB4KxxDe5G6WIOvE+j+eCf/bjPv2bKqMCmsOo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XXHKTeGlrNmn/XwEF5C57SAdgY0+x1/Nb2JJAUEX90IOcGXuz2BZeQhuK7qFsHtLjF6M4oVJtBLjZvOl4UJa3OwygfMiwofHyTUuDcbcVdoiypA8jZsUlI4j8TjMourR1J1BAzThlx4oax17W+LPLixlfh6l75C0JNI21RUCBgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxztJVWK1oKEEDAA--.6235S3;
	Tue, 26 Aug 2025 14:46:45 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJBxTMFKWK1o6GppAA--.11160S4;
	Tue, 26 Aug 2025 14:46:41 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/2] objtool/LoongArch: Fix unreachable instruction warnings about head.S
Date: Tue, 26 Aug 2025 14:46:31 +0800
Message-ID: <20250826064631.9617-3-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250826064631.9617-1-yangtiezhu@loongson.cn>
References: <20250826064631.9617-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxTMFKWK1o6GppAA--.11160S4
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxZF45AFyUKw1fCF17tF4rCrX_yoWrtr4kpF
	47CryUAFZ8uFWqvw4UGa1ag3yavan8Xr4qqF1UJa4ft3yq9as2q3Wvyr17JFyqqr4YgF4f
	Xr4UtrWqk3Wjy3cCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v2
	6r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07josjUUUUUU=

When compiling with LLVM and CONFIG_LTO_CLANG is set, there exist the
following objtool warnings after silencing all of the other warnings:

  LD      vmlinux.o
vmlinux.o: warning: objtool: .head.text+0x0: unreachable instruction
vmlinux.o: warning: objtool: .head.text+0x18: unreachable instruction
vmlinux.o: warning: objtool: .head.text+0x38: unreachable instruction
vmlinux.o: warning: objtool: .head.text+0x3c: unreachable instruction
vmlinux.o: warning: objtool: .head.text+0x40: unreachable instruction
vmlinux.o: warning: objtool: .head.text+0x44: unreachable instruction
vmlinux.o: warning: objtool: .head.text+0x54: unreachable instruction
vmlinux.o: warning: objtool: .head.text+0x58: unreachable instruction
vmlinux.o: warning: objtool: .head.text+0x6c: unreachable instruction
vmlinux.o: warning: objtool: .head.text+0x84: unreachable instruction
vmlinux.o: warning: objtool: .head.text+0x94: unreachable instruction
vmlinux.o: warning: objtool: .head.text+0x9c: unreachable instruction
vmlinux.o: warning: objtool: .head.text+0xc4: unreachable instruction
vmlinux.o: warning: objtool: .head.text+0xf8: unreachable instruction
vmlinux.o: warning: objtool: .head.text+0xfc: unreachable instruction
vmlinux.o: warning: objtool: .head.text+0x104: unreachable instruction
vmlinux.o: warning: objtool: .head.text+0x10c: unreachable instruction
vmlinux.o: warning: objtool: .head.text+0x11c: unreachable instruction
vmlinux.o: warning: objtool: .head.text+0x120: unreachable instruction
vmlinux.o: warning: objtool: .head.text+0x124: unreachable instruction
vmlinux.o: warning: objtool: .head.text+0x144: unreachable instruction
vmlinux.o: warning: objtool: kernel_entry+0x0: unreachable instruction
vmlinux.o: warning: objtool: smpboot_entry+0x0: unreachable instruction

All of the above instructions are in arch/loongarch/kernel/head.S,
and there is "OBJECT_FILES_NON_STANDARD_head.o := y" in Makefile
to skip objtool checking for head.o, but OBJECT_FILES_NON_STANDARD
does not work for link time validation of vmlinux.o according to
tools/objtool/Documentation/objtool.txt.

Just give a proper unwind hint to silence the above warnings. By the way,
the previous instructions of kernel_entry+0xf4 and smpboot_entry+0x68 are
the 'bl' instructions, the call destination symbols are start_kernel() and
start_secondary() which are noreturn functions, then the 'bl' instructions
are marked as dead end in annotate_call_site(), so actually ASM_BUG() can
be removed due to unnecessary, otherwise there are following warnings:

  kernel_entry+0xf4: start_kernel() missing __noreturn
  in .c/.h or NORETURN() in noreturns.h

  smpboot_entry+0x68: start_secondary() missing __noreturn
  in .c/.h or NORETURN() in noreturns.h

Link: https://lore.kernel.org/lkml/20250814083651.GR4067720@noisy.programming.kicks-ass.net/
Suggested-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/kernel/head.S | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/kernel/head.S b/arch/loongarch/kernel/head.S
index e3865e92a917..566a1dbf5fa0 100644
--- a/arch/loongarch/kernel/head.S
+++ b/arch/loongarch/kernel/head.S
@@ -20,6 +20,7 @@
 	__HEAD
 
 _head:
+	UNWIND_HINT_UNDEFINED
 	.word	IMAGE_DOS_SIGNATURE	/* "MZ", MS-DOS header */
 	.org	0x8
 	.dword	_kernel_entry		/* Kernel entry point (physical address) */
@@ -30,6 +31,7 @@ _head:
 	.long	pe_header - _head	/* Offset to the PE header */
 
 pe_header:
+	UNWIND_HINT_UNDEFINED
 	__EFI_PE_HEADER
 
 SYM_DATA(kernel_asize, .long _kernel_asize);
@@ -42,6 +44,7 @@ SYM_DATA(kernel_fsize, .long _kernel_fsize);
 	.align 12
 
 SYM_CODE_START(kernel_entry)			# kernel entry point
+	UNWIND_HINT_UNDEFINED
 
 	/* Config direct window and set PG */
 	SETUP_DMWINS	t0
@@ -109,8 +112,6 @@ SYM_CODE_START(kernel_entry)			# kernel entry point
 #endif
 
 	bl		start_kernel
-	ASM_BUG()
-
 SYM_CODE_END(kernel_entry)
 
 #ifdef CONFIG_SMP
@@ -120,6 +121,7 @@ SYM_CODE_END(kernel_entry)
  * function after setting up the stack and tp registers.
  */
 SYM_CODE_START(smpboot_entry)
+	UNWIND_HINT_UNDEFINED
 
 	SETUP_DMWINS	t0
 	JUMP_VIRT_ADDR	t0, t1
@@ -142,8 +144,6 @@ SYM_CODE_START(smpboot_entry)
 	ld.d		tp, t0, CPU_BOOT_TINFO
 
 	bl		start_secondary
-	ASM_BUG()
-
 SYM_CODE_END(smpboot_entry)
 
 #endif /* CONFIG_SMP */
-- 
2.42.0

