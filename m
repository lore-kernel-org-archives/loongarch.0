Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B7E176AC5
	for <loongarch@lists.linux.dev>; Tue, 28 Jan 2025 05:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738042405; cv=none; b=pCFRYAi7TUjtCcmC61k25AXIFwx2puOOf7xEIWLEn6U5AZ9k/tjrvIR0KqDo4nD+SJvmUg2+ys/XG3Xd8YBUxCPsSj+o5+w2yKktg8na05a4Vw3T0QcXLaeELCSuaSKkwfKLcTrVXthGRqlc6Ro8WOO1A1a3ogiwb2HDbaIeiAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738042405; c=relaxed/simple;
	bh=e+QmdYfzdsHe2i47iJnp8obSLIn3fW5B1Uv/wF/582w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H+XoXTfYBSQ+z2udwFJxpdujkyAtrrgd8Ossftixy+2wioKntYTAqnMcuJpiJvltCz8qd9WBOE+C3fvNqH9uZp8EIEiNQhE/ggaT2ZuxpDQCEgV4PUqDPv+ADJrn+A/OHLZwvHQ/Wj0pkpxGszsFcj+SY+/8j8qJ6WBs4P1irvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=KBSY6y94; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="KBSY6y94"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ef714374c0so8053816a91.0
        for <loongarch@lists.linux.dev>; Mon, 27 Jan 2025 21:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738042403; x=1738647203; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vNOxwbh8TJLovUJ4xbmkceu/OhoInCtt14EIM5E3MZs=;
        b=KBSY6y94VmVDLfvqj/MOP4VNWR6M6I1k4AOdB9EGCr0NQN7xSznv//i1qW0R1zD2N+
         JVAhYMAht0IPsHHuh3PQimn+paXwEW+k9dG5tWF8fvKd2pJyfcrbDD8oM2IqOz3RFR8v
         lilTedNcWK6b+TAWXMhb037qxt/iONaD8lyYFLNj92iHp/EgUN3xAZhjoeoCjcssd3Tb
         7RoDdZF/lsIgR7YLNT38Ce5WFN20q6BLkiN7KbCNsJuVDnwd0+R4+AGajfVMTUUuG47G
         44z7DhLQNHczHqarQbYuSi/WSqfwYuI+hQP3rsX/qCYP3u7C5EjSHlYpnyj0pDegtCSH
         lXOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738042403; x=1738647203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vNOxwbh8TJLovUJ4xbmkceu/OhoInCtt14EIM5E3MZs=;
        b=YE+mVQjkljOYuuYy4IuvAC5oG4MaMnznPZABor4oIbpNrqzcn+EymvklM672jyAPHK
         8eKz2+VRLHjS5TGgylc8NrUJ+oYfk0/NfNUKkV3avl+Vmmh/0033Vp53cWh4xZzDHPo7
         tvLwlQ9c/k+7SnrZVRvwD+6UVJUiE25wVRqSe674HDfqwQUvp/k3MDUzDiDSQhOIBDjf
         DeDYSDj/c2HEAYtmrMd5KH+E7b3UpicJcoTGfcIsTPl5KmRiNsZUSQmwqLT9cYzK+e8M
         CvXIpTG534diQ/V0FIi0BplnNbrt6pcYA9VPp5UeUcDDSZEyl46i+5NNEMQWKo89GSac
         71KA==
X-Forwarded-Encrypted: i=1; AJvYcCVRmu2kZazTD454ODjDDpFfmLPTsO0ISFrfpEVrmJvPlyzIBviNyIW+sxWL18LECEYEkxr98HXUxws=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzd7hgi6WnfxqVMkXreIf7rQoywftKl1ZCLqP0K6BPcnUScQrku
	0dBkokOOsVWpWbaBD+Gmnl96Q+/XRfxS+Yttb86NlePcjeH293Zmk/Ru5NVdpxAL+16yVSAUKaO
	s
X-Gm-Gg: ASbGncu5Mf/au+9KvWjZlfN1MGI5ld0Hm+yDS6e7RCcI7MNsIO2HjqbY0zAARBC4ggK
	uU5ZCmw+bEaf+7uTQcF0z9+15oPLaF+mWbgvOiQcdczF25Yd26iIKdXAV347AFdF1Dy7YPDsefA
	4sl/RcAD3BNP4HkgWthgSx+SUKh6OT1DXQyRoTdDqdTMASkuExUJ9zXD1U8ZBC26N0zWM+PI5h9
	NUE9NXcP1ZOWciTdUKiKwRAlbhblzfMiFljQLFyEs9lEL2j8weD4ZlR2o9wmFIhzAbUWCyLN6dv
	C1D08lD1zfmFjbMMyOa1y02FL0s3f0k=
X-Google-Smtp-Source: AGHT+IHJHQRcL9Lv4f1yIJBut5cVZG5MPbkCVxCZQ6AIY/XzegyPECOnS8zpH/X82U5LA34CHjhDGw==
X-Received: by 2002:a17:90b:2dca:b0:2ee:e2f6:8abc with SMTP id 98e67ed59e1d1-2f82c028adfmr3131615a91.10.1738042402000;
        Mon, 27 Jan 2025 21:33:22 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffaf9e98sm8266247a91.38.2025.01.27.21.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 21:33:21 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 27 Jan 2025 21:33:09 -0800
Subject: [PATCH v4 1/4] riscv: entry: Convert ret_from_fork() to C
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-riscv_optimize_entry-v4-1-868cf7702dc9@rivosinc.com>
References: <20250127-riscv_optimize_entry-v4-0-868cf7702dc9@rivosinc.com>
In-Reply-To: <20250127-riscv_optimize_entry-v4-0-868cf7702dc9@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>, 
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 loongarch@lists.linux.dev, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3493; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=e+QmdYfzdsHe2i47iJnp8obSLIn3fW5B1Uv/wF/582w=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/qMHNmW1oVXLgvdrHm3epf2zccMKopBG1aE7L961V1Ps
 8zg7Yf6jlIWBjEuBlkxRRaeaw3MrXf0y46Klk2AmcPKBDKEgYtTACbyewUjQ0cF/4qw6W6Tp91M
 dj3pWZezPHNdv3m7eIHJb5l10jkWIQz/Exmk5z/IsjaQM6rhfiby99r+4z0//5VsE18Ye+azt74
 fNwA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

Move the main section of ret_from_fork() to C to allow inlining of
syscall_exit_to_user_mode().

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/asm-prototypes.h |  1 +
 arch/riscv/kernel/entry.S               | 15 ++++++---------
 arch/riscv/kernel/process.c             | 14 ++++++++++++--
 3 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/include/asm/asm-prototypes.h b/arch/riscv/include/asm/asm-prototypes.h
index cd627ec289f163a630b73dd03dd52a6b28692997..733ff609778797001006c33bba9e3cc5b1f15387 100644
--- a/arch/riscv/include/asm/asm-prototypes.h
+++ b/arch/riscv/include/asm/asm-prototypes.h
@@ -52,6 +52,7 @@ DECLARE_DO_ERROR_INFO(do_trap_ecall_s);
 DECLARE_DO_ERROR_INFO(do_trap_ecall_m);
 DECLARE_DO_ERROR_INFO(do_trap_break);
 
+asmlinkage void ret_from_fork(void *fn_arg, int (*fn)(void *), struct pt_regs *regs);
 asmlinkage void handle_bad_stack(struct pt_regs *regs);
 asmlinkage void do_page_fault(struct pt_regs *regs);
 asmlinkage void do_irq(struct pt_regs *regs);
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 33a5a9f2a0d4e1eeccfb3621b9e518b88e1b0704..b2dc5e7c7b3a843fa4aa02eba2a911eb3ce31d1f 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -319,17 +319,14 @@ SYM_CODE_END(handle_kernel_stack_overflow)
 ASM_NOKPROBE(handle_kernel_stack_overflow)
 #endif
 
-SYM_CODE_START(ret_from_fork)
+SYM_CODE_START(ret_from_fork_asm)
 	call schedule_tail
-	beqz s0, 1f	/* not from kernel thread */
-	/* Call fn(arg) */
-	move a0, s1
-	jalr s0
-1:
-	move a0, sp /* pt_regs */
-	call syscall_exit_to_user_mode
+	move a0, s1 /* fn_arg */
+	move a1, s0 /* fn */
+	move a2, sp /* pt_regs */
+	call ret_from_fork
 	j ret_from_exception
-SYM_CODE_END(ret_from_fork)
+SYM_CODE_END(ret_from_fork_asm)
 
 #ifdef CONFIG_IRQ_STACKS
 /*
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 58b6482c2bf662bf5224ca50c8e21a68760a6b41..0d07e6d8f6b57beba438dbba5e8c74a014582bee 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -17,7 +17,9 @@
 #include <linux/ptrace.h>
 #include <linux/uaccess.h>
 #include <linux/personality.h>
+#include <linux/entry-common.h>
 
+#include <asm/asm-prototypes.h>
 #include <asm/unistd.h>
 #include <asm/processor.h>
 #include <asm/csr.h>
@@ -36,7 +38,7 @@ unsigned long __stack_chk_guard __read_mostly;
 EXPORT_SYMBOL(__stack_chk_guard);
 #endif
 
-extern asmlinkage void ret_from_fork(void);
+extern asmlinkage void ret_from_fork_asm(void);
 
 void noinstr arch_cpu_idle(void)
 {
@@ -206,6 +208,14 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 	return 0;
 }
 
+asmlinkage void ret_from_fork(void *fn_arg, int (*fn)(void *), struct pt_regs *regs)
+{
+	if (unlikely(fn))
+		fn(fn_arg);
+
+	syscall_exit_to_user_mode(regs);
+}
+
 int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 {
 	unsigned long clone_flags = args->flags;
@@ -242,7 +252,7 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 	p->thread.riscv_v_flags = 0;
 	if (has_vector())
 		riscv_v_thread_alloc(p);
-	p->thread.ra = (unsigned long)ret_from_fork;
+	p->thread.ra = (unsigned long)ret_from_fork_asm;
 	p->thread.sp = (unsigned long)childregs; /* kernel sp */
 	return 0;
 }

-- 
2.43.0

