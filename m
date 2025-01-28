Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B5A19AA63
	for <loongarch@lists.linux.dev>; Tue, 28 Jan 2025 05:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738042405; cv=none; b=TZGkoJAtb9ZTM0OGF16zptCN7Vo+8Bvn3570Yt57vtMlSA+EBD4q3X0EFP2aOfK93wq106CRzYJZPMoAd45os2QjHoudIbWI8BIZSHIXfVZjSz+16L6ebOSCSw+Iaq19HXsndhMfL2UO8LV7ZxCTFyqEf1xr4iPq4vp5IA0GvJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738042405; c=relaxed/simple;
	bh=t9WBogxb56lApIirNVzIj0lHOk+/6g6AFgtrehj97DE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q6Z2H8dcU5Y1K255rtKt6D2cMaXa/lQFP5ACIUyTBSjkK/3R38fSmzwAfDCx9bnCDprkrAfvORMmxmxXq+rDU0tcxrBhl0YLDe3q6PHeEzJuLBZCaF6elwIfdyhPhqw0dR8nfDi4/a2cTujLAdMNTBbFoW6qMJ9bdemDo37ABqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=eU45hOJ9; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="eU45hOJ9"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ef28f07dbaso7206262a91.2
        for <loongarch@lists.linux.dev>; Mon, 27 Jan 2025 21:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738042403; x=1738647203; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nnq3B23qbOBveDsFleAgWeOkAmZk3gQFKZw4IbSmZLU=;
        b=eU45hOJ9g5MpfOcKM75UbNSU7wtBakVsJ7LmJYgTK1yl/L6/HtJz0nbl3Bv+fDzbOY
         pXjMFjulHzIhkn3V6tYvphO0BWQv+VAtBJZG6YWP/DyakecgS/bDN4hUod8VZvkVLsOi
         NidWqjcbXdgH1GZw/O3nMny13mLRIGmNHhd1MC0ySn7i2kqKdJkhrBnfK7tMHQt6svgd
         AFL9QHY/X82CqAGANHiU9pTDPmU2oMrcRCQKQhCazFKqw8QDmsMlYjD1rEniNqQnIt1q
         P2fuDIa++LzN6aQNaDMfxGRTEuKMIAN9DhRqirHGmoLc2FQ02zF3KHNm2Fnb45YT6zjp
         9dFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738042403; x=1738647203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nnq3B23qbOBveDsFleAgWeOkAmZk3gQFKZw4IbSmZLU=;
        b=TP9p+/G4Ukg87AEiKTBPuZRN69cYaQN764LN2z3yBI0/y6oozj76EuLaXLp4XBfD+W
         0AjgUKRvlHD0Qs0ODA63YmZPX4VAMgvay4ixyfJ1Z49Kt32s2n7sxf5iTLZ73+DzeKKJ
         bxIr4StAZ9ha3//EcvfvQ0KQhVdvlJ3796vMEHhE43eQEr7jwsmOplJGYn7efeYQfpsl
         kcaeXnNejmDkDU9CX43vH7T4JssrJq++eVmjun8uRfH+Y+Cu0SkRjvM9+iIeEc04GiGV
         r43FIhyUG34NHtb0X1TuWHOODlp6x8P7qSM2hpCxlFMJUleoPHThTY0FM3CgyzuaxjmJ
         +FZw==
X-Forwarded-Encrypted: i=1; AJvYcCX3oca/tjMcUleOTiBxH2mwks52k066cWFrf85wLzTx8PDy23x7bgrOotFbJUFeB1eCo7wFDlFwb/4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxvvzr5O/MvTZFV6ojmJJnAWIWaEDK8U+XqE1pA5PeXYVeqqKqD
	XTnq9dHzwLcZOnvkSNkfqsa7Zua11sLx+r+QfCZvyGkV4c50n7ELpOcliE3JeLI=
X-Gm-Gg: ASbGncu9Yzgb8cJBWj6ZzxMpEXbPXqbnGp6SIaVDsJCTRYe6UIwvDX375GYnbGwKYhE
	yVfvAFYodKyiDgFcnhxegmjHonwQpTnqB3VVJLe8ijdaHdM7R/9D3Nxmrh4k3aWruqbWGDrXaG+
	bZ0gd9TwppR3lALKmGAcWE2gGw4B70xq0dCgYnbiHrD1tb8sGBg0rkIp9QqeHVe6kySs9sFWguB
	8ecSMU2Lb4rIJpOYZ0mSlPk9DdStf00vH/BAmA8o0d9REcSwVc5yXWgO38sGrvsczx8HF+GXcub
	aAkeRyblwUgQ14M89NugefU7xsN84CI=
X-Google-Smtp-Source: AGHT+IFR4FKoI6WAOEtDoSPEKu3zmYlAkQg4eL8AiynsxA5wsmbIEvXhdDDVdrsVxT1SWVknkzcJvA==
X-Received: by 2002:a17:90b:3bc3:b0:2ee:f80c:6889 with SMTP id 98e67ed59e1d1-2f782d9a9eamr70402131a91.33.1738042403569;
        Mon, 27 Jan 2025 21:33:23 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffaf9e98sm8266247a91.38.2025.01.27.21.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 21:33:22 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 27 Jan 2025 21:33:10 -0800
Subject: [PATCH v4 2/4] riscv: entry: Split ret_from_fork() into user and
 kernel
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-riscv_optimize_entry-v4-2-868cf7702dc9@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4442; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=t9WBogxb56lApIirNVzIj0lHOk+/6g6AFgtrehj97DE=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/qMHLnAdcu/2aq4Ot/p4NC8dlorvE3lce7LZWe0/y751
 nYteNv6jlIWBjEuBlkxRRaeaw3MrXf0y46Klk2AmcPKBDKEgYtTACby5h/Df0/OuS3LfH/dPsVx
 sFZ3xyxNY1NrE7db0rMO5R+xevZP/jwjwyvuKOvWI15XT9dpcVd/DQwU6X+SqeLFXT5h6eOFE5X
 XMQEA
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

