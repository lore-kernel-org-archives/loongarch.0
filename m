Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A101E98F8
	for <loongarch@lists.linux.dev>; Fri, 24 Jan 2025 22:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737757892; cv=none; b=VK3pNbGoNGPLJIRw3Mol7fmtoiNnVVsSAP2xrDyMxNCWrZM8LRR4S7d9Qgh/80hU2EtnV0+1vaVaiRoczyX+CbeIpfdU8d2ApJAsc2nZQo1rAp7eKdGQoQlp8dNqw9mwX9xRRFsrN90DiSVwirvBwFTbW7uswZdsMyApZcR6WyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737757892; c=relaxed/simple;
	bh=t9WBogxb56lApIirNVzIj0lHOk+/6g6AFgtrehj97DE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZJBlt3wKGlJQ+faRtJdug/IeqCImxKR6AsCcdng7zyiC2iYwSGLYt0unbixmJy8DOg9lPIm2oC/euwDCR4hOMbI1PIU3s+y2tl+AaP9egzD8S6iuZ2DsDfwZEV3S3gFICNuxo713Ggtl0SR8j5nG6bJz5sPjvNWQh8/BO6srTSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=a/Ny7iFx; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="a/Ny7iFx"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21619108a6bso45399025ad.3
        for <loongarch@lists.linux.dev>; Fri, 24 Jan 2025 14:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737757889; x=1738362689; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nnq3B23qbOBveDsFleAgWeOkAmZk3gQFKZw4IbSmZLU=;
        b=a/Ny7iFxhw4JOC8iDhoxIeaPC0QBptbdmh4HPTz+2wS4vRUYgf+ZwRsf1PtBfq1cw4
         /cNUeBtfc0mYmajbx6bCEw1c/qvwiepT/eyw8k2QPflzVORLQQDmJLACP2FsWJGDdMyY
         VRuKTttf4sTVIroLxk4ktNe/paDBrSKaC8M4UDV/wv6bzSir4A0yo4wQYccrGR0gDFW0
         XlmcUMS2GUOyAEG04+tfRxtHx+0p3P4heGzKVeGVba4I7/OdNqbSuHKsM2gM1LBKB9Hk
         vukW0gymJzZD3Hw+WDByZnSDQpfcJuDFF6n6lBW9T7aJaN1esv5dpnYh+zuDFuQ2BdWq
         MP1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737757889; x=1738362689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nnq3B23qbOBveDsFleAgWeOkAmZk3gQFKZw4IbSmZLU=;
        b=uteXiV7Rjdd4gmk938PnmtWrm4d8h0wfd7FhIA7Ie+Iho9CLxv3NrVukHOsa+fjrpq
         P7RY0yARZNOjtOSVs5sYjGezbcL7OZKdnyp5WOCiGOMiCd7Fe5+bUo2lu9HVw3g7SrtN
         gRMwDDIg2CtZJaay4w5vgNSY9/FX2VEoY7diHm8rw6aQRAlRQQSEzaMc1dHbyqDLNzmL
         eXK1sht+1l/8G62mzrZL5PEqq1xTcTGNLbh6MstXRbHWwDyCI1CE7iwIuLIY+OvJioLj
         QSa5A9HGzAB5NPLNfVZbL8mBCUJLnTsBfDeaPeW8i+rHJDq3su8wMqAGOYv9uSIwKhtQ
         M+Lg==
X-Forwarded-Encrypted: i=1; AJvYcCUpbYVMRanEnZclXkcBMhdAKgEHWULj6Nw1gY7hy5qwNEPSW6pSVd2uBUJ2ZXs/uiBXOqH+lflI1X0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyKizM/v2Nmqf6bjMMJkEJXoY2CnySH7XV/QSXkl9oy6ErcB7jI
	7G4O1jl/9wOr8OhW72IXQLs55xYTRySIdyhrntznZA0Kd3qhJ4DmRXFDORv2BLfZNqQNVjF2bLC
	6
X-Gm-Gg: ASbGncugV97Xngzw18mEv13PiE6WrdD53KYxxsEEPODKxbkO/zOOq5W3WJrfPBFU01y
	VMlnHjwpvkprOw1eqGp1DC30Sdng5QHAfENbVQpc+xqLZjrZ0D5N8ymHhH9zIyCW8IKw7GiB8jQ
	4OfuXQRdh+EoaEHVT2AGiflnv1cs+zA+4ptJ5MBUucy2WlYusEVwaG2a+w+IV4p8UW2mZZFeA7s
	vJMz43y6FgALKeg6QYvXZHOB0yf05eY9Vca1pJht4E07Bdip8HF9Ge5NTT/Eulq3ddkjVa30MhO
	QQNQa06ByVy3WFX9BsHX
X-Google-Smtp-Source: AGHT+IG2A2M9jJ06wgeU6MMIXKJU3cZe7jVRjjabtXl2tIE7gfG3Pli2LQenVrOmHMThyR5CLM42Yw==
X-Received: by 2002:a05:6a00:8084:b0:724:d758:f35 with SMTP id d2e1a72fcca58-72daf9bd157mr43251403b3a.2.1737757889642;
        Fri, 24 Jan 2025 14:31:29 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a761150sm2397183b3a.119.2025.01.24.14.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 14:31:28 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 24 Jan 2025 14:31:00 -0800
Subject: [PATCH v3 2/4] riscv: entry: Split ret_from_fork() into user and
 kernel
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-riscv_optimize_entry-v3-2-869f36b9e43b@rivosinc.com>
References: <20250124-riscv_optimize_entry-v3-0-869f36b9e43b@rivosinc.com>
In-Reply-To: <20250124-riscv_optimize_entry-v3-0-869f36b9e43b@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>, 
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 loongarch@lists.linux.dev, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4442; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=t9WBogxb56lApIirNVzIj0lHOk+/6g6AFgtrehj97DE=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/oUkT1rm9Z8Nf0kEHf0/WHb/Q7WLrI7Fxwsm14jGnnDn
 +9v0JejHaUsDGJcDLJiiiw81xqYW+/olx0VLZsAM4eVCWQIAxenAEzk4GqG/44uK2Vbko953/Tz
 iju3MFvOKHpDoOYUC6lZB7o9n3u+2crwh/PYJ327eY+9t3o2/Zgy35Dj0px0OeEla1NcZefnh3L
 ZcwMA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

This function was unified into a single function in commit ab9164dae273
("riscv: entry: Consolidate ret_from_kernel_thread into ret_from_fork").
However that imposed a performance degradation. Partially reverting this
commit to have ret_from_fork() split again results in a 1% increase on
the number of times fork is able to be called per second.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/asm-prototypes.h |  3 ++-
 arch/riscv/kernel/entry.S               | 13 ++++++++++---
 arch/riscv/kernel/process.c             | 17 +++++++++++------
 3 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/include/asm/asm-prototypes.h b/arch/riscv/include/asm/asm-prototypes.h
index 733ff609778797001006c33bba9e3cc5b1f15387..bfc8ea5f9319b19449ec59493b45b926df888832 100644
--- a/arch/riscv/include/asm/asm-prototypes.h
+++ b/arch/riscv/include/asm/asm-prototypes.h
@@ -52,7 +52,8 @@ DECLARE_DO_ERROR_INFO(do_trap_ecall_s);
 DECLARE_DO_ERROR_INFO(do_trap_ecall_m);
 DECLARE_DO_ERROR_INFO(do_trap_break);
 
-asmlinkage void ret_from_fork(void *fn_arg, int (*fn)(void *), struct pt_regs *regs);
+asmlinkage void ret_from_fork_kernel(void *fn_arg, int (*fn)(void *), struct pt_regs *regs);
+asmlinkage void ret_from_fork_user(struct pt_regs *regs);
 asmlinkage void handle_bad_stack(struct pt_regs *regs);
 asmlinkage void do_page_fault(struct pt_regs *regs);
 asmlinkage void do_irq(struct pt_regs *regs);
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index b2dc5e7c7b3a843fa4aa02eba2a911eb3ce31d1f..0fb338000c6dc0358742cd03497fa54b9e9d1aec 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -319,14 +319,21 @@ SYM_CODE_END(handle_kernel_stack_overflow)
 ASM_NOKPROBE(handle_kernel_stack_overflow)
 #endif
 
-SYM_CODE_START(ret_from_fork_asm)
+SYM_CODE_START(ret_from_fork_kernel_asm)
 	call schedule_tail
 	move a0, s1 /* fn_arg */
 	move a1, s0 /* fn */
 	move a2, sp /* pt_regs */
-	call ret_from_fork
+	call ret_from_fork_kernel
 	j ret_from_exception
-SYM_CODE_END(ret_from_fork_asm)
+SYM_CODE_END(ret_from_fork_kernel_asm)
+
+SYM_CODE_START(ret_from_fork_user_asm)
+	call schedule_tail
+	move a0, sp /* pt_regs */
+	call ret_from_fork_user
+	j ret_from_exception
+SYM_CODE_END(ret_from_fork_user_asm)
 
 #ifdef CONFIG_IRQ_STACKS
 /*
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 0d07e6d8f6b57beba438dbba5e8c74a014582bee..5f15236cb526bd9fe61636ed372b4b76c94df946 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -38,7 +38,8 @@ unsigned long __stack_chk_guard __read_mostly;
 EXPORT_SYMBOL(__stack_chk_guard);
 #endif
 
-extern asmlinkage void ret_from_fork_asm(void);
+extern asmlinkage void ret_from_fork_kernel_asm(void);
+extern asmlinkage void ret_from_fork_user_asm(void);
 
 void noinstr arch_cpu_idle(void)
 {
@@ -208,14 +209,18 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 	return 0;
 }
 
-asmlinkage void ret_from_fork(void *fn_arg, int (*fn)(void *), struct pt_regs *regs)
+asmlinkage void ret_from_fork_kernel(void *fn_arg, int (*fn)(void *), struct pt_regs *regs)
 {
-	if (unlikely(fn))
-		fn(fn_arg);
+	fn(fn_arg);
 
 	syscall_exit_to_user_mode(regs);
 }
 
+asmlinkage void ret_from_fork_user(struct pt_regs *regs)
+{
+	syscall_exit_to_user_mode(regs);
+}
+
 int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 {
 	unsigned long clone_flags = args->flags;
@@ -238,6 +243,7 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 
 		p->thread.s[0] = (unsigned long)args->fn;
 		p->thread.s[1] = (unsigned long)args->fn_arg;
+		p->thread.ra = (unsigned long)ret_from_fork_kernel_asm;
 	} else {
 		*childregs = *(current_pt_regs());
 		/* Turn off status.VS */
@@ -247,12 +253,11 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		if (clone_flags & CLONE_SETTLS)
 			childregs->tp = tls;
 		childregs->a0 = 0; /* Return value of fork() */
-		p->thread.s[0] = 0;
+		p->thread.ra = (unsigned long)ret_from_fork_user_asm;
 	}
 	p->thread.riscv_v_flags = 0;
 	if (has_vector())
 		riscv_v_thread_alloc(p);
-	p->thread.ra = (unsigned long)ret_from_fork_asm;
 	p->thread.sp = (unsigned long)childregs; /* kernel sp */
 	return 0;
 }

-- 
2.43.0

