Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6ED205AD6
	for <loongarch@lists.linux.dev>; Wed,  5 Mar 2025 23:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741215647; cv=none; b=YkiqZbcXKmbQ1/bieCcpapfuI2OtuB7V7OexDaqAiLwgla0GyEY3IaOJLxqDxIumT0e752kc9P4FxAfMiV8vbUXtAN4l09SakjnZ3T5LtATuLUusqS4fnt+E7lXuIEorE5mrKrY7Y3kWkvTGcb9gbiEBm06S7QfWxt0XhmZCmCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741215647; c=relaxed/simple;
	bh=t9WBogxb56lApIirNVzIj0lHOk+/6g6AFgtrehj97DE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QReXAHM0j2mvdab+cIBx8vjzRlJ2DCsLhIgpm/KTCrEdq2RM6SXjAWnYJBQUeI/IH8i/hN1G/poPelcHgac6yHJa4IZIxGYnwxnKX/97/8S/g1M5plkkeZ3WBbvpurnwg5zYpT24maBJmYdAyDqo3X6+EOdJovS8NxFRTIea0bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=hZmZqmAS; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="hZmZqmAS"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2fa8ada6662so163840a91.1
        for <loongarch@lists.linux.dev>; Wed, 05 Mar 2025 15:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741215645; x=1741820445; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nnq3B23qbOBveDsFleAgWeOkAmZk3gQFKZw4IbSmZLU=;
        b=hZmZqmASzLHMBXtxmPscm63ZWwprxcCd5jJTxvL1NvJX4CeSZNDru7DuB+5f4/Z+2S
         kuTzA7GwSXx4fmOfzjmCt3L1Er5trnYTcS9r/N4EjseaOSw5ySs4TDWRfwmFxJWrFfsi
         E1DxppdYz9Lddjg1S5FJ9kZMTgrX8p7ruBue8QDKHWtwrw1qDQ0ked1TdhkA7roEdxdD
         BEb9ehp7A8Zwyr1S/0Gjhf4enSE8y7EAup/ICh+D5BMR/yMghpwFrA+49uJsgNQeWryz
         Sh51BUBTytp8r51qksmWJ2pf8NGvrJCzGY/YRAlS8C3ckyQMSwZwdpD5Lfk34Xkv56Hs
         3uxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741215645; x=1741820445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nnq3B23qbOBveDsFleAgWeOkAmZk3gQFKZw4IbSmZLU=;
        b=KB3nqsdhpKWLKQG1jWYMtw4ISS7a2BDnnqvH8a5GNyL0segI0mNTchfPiKTajJ0cE8
         x2fXlvN5Ar4DaP2dxBPCyv1cu0ki+7i9R8iWRmFjqXC/7slVKjovaX4+MEPcCVdjIUlI
         r2reBHX/7f3yWOdP/sKGmBCuIxdxonp3MAxE0rXy/WWpWMJuaS+l17cURvjSvROso++1
         l3ObywQdSm50E/4cCKWZdOf1RIOLF8zUiwrn8BDHVpb9UDd+4yWeVcO59YBJdnfXx106
         eLNnA+uaV94Zt/jaFgY1XJqVzmenWMx/RLHbUTDkUMbyZk/D1EGm2kA93oBBQovll/rB
         lm8A==
X-Forwarded-Encrypted: i=1; AJvYcCWmbCj/NEloSUOwiEHM8ZuAlO5iYBBZBrW0sw3eLbBnRVFK/2xgguXfJhHdiTVlS5Vxz3M+w2CAZuk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzJ9kGe0HAp99zcLuA8izqHytCWUMS3jmKTpNnrLJS9xCE9ST39
	yKDFsQxwA6hdkwc13mbf20uOx0iXN36nGu0zh7fc9qK5sFIBvXXSPpsHGNaANWU=
X-Gm-Gg: ASbGncsU988fByaVzsEdh0Ky8GXH7Xuy6u7LcoA3596QlL9nKPYjeSajoNDFLRIB+xv
	9hYGMkdTpqTGNVV5Oz0K7hGzJM7sFbdPnhkh4mGcDtUoZyOdrLIlSYFHl6MqtJ8TDno+grOgRhd
	KuDIiAuxHfrkdmQe90erOVXcW+ThdBioOZzzg+7VBTKeoX2Kfnzm//voc9BiBYUbALJryivBgyG
	+UFnSwpjtjnL7nnwmHkRzel0Z7j12h7z7kQzOBKzk394FLofjV30igZ96n9IfJMimPRpxYg3hRw
	JGLziaeNw1aQZE1oQgzeXkneNUjnigHPf1iQ1SrArcDQVzm8vdZa16V2AbTb
X-Google-Smtp-Source: AGHT+IHvW5MI/rViqhq1DoMiw7xqnu+EXrlGQ4nTLYN2RziECr6n5eoBvZiwNc4aRRHQuXNm88Ho1Q==
X-Received: by 2002:a05:6a21:328c:b0:1ee:dcd3:80e6 with SMTP id adf61e73a8af0-1f3493303c1mr9715603637.0.1741215644639;
        Wed, 05 Mar 2025 15:00:44 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7dedd22esm10593413a12.63.2025.03.05.15.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 15:00:43 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 05 Mar 2025 15:00:26 -0800
Subject: [PATCH RESEND v4 2/4] riscv: entry: Split ret_from_fork() into
 user and kernel
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-riscv_optimize_entry-v4-2-0d81bb45203f@rivosinc.com>
References: <20250305-riscv_optimize_entry-v4-0-0d81bb45203f@rivosinc.com>
In-Reply-To: <20250305-riscv_optimize_entry-v4-0-0d81bb45203f@rivosinc.com>
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
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/qJ69PKgi8V7xPjXmGYb6hQrvgjfnd2xYXS799eR28NP
 FG5XmdPRykLgxgXg6yYIgvPtQbm1jv6ZUdFyybAzGFlAhnCwMUpABNJms3I8Iq1Tv7tm/bAprj2
 6SaO39+sCbGcdkWd61+iQCeL86I0ZkaGpSUCEburIm5d+bT9h2hB1nc2rQXXr4qmanTdnGM8MU+
 OFQA=
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

