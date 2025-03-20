Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248B62253BD
	for <loongarch@lists.linux.dev>; Thu, 20 Mar 2025 17:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742491779; cv=none; b=fBtzzYi31UmhqLwsgeH4nvjD08YWrUp8bo/GS+8Ww//N2MRbp8tqi6wfZFvTv6oXs2dGIvReqQyp7tlXt/CiIPYoM4i1tv2Hzr0RpKxrODcR9yCSZ2bFtSIE8xoECM9Ly5WC5U/H+fLZRF8WHiic8Hkv/UKv80raWCH2voHULOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742491779; c=relaxed/simple;
	bh=LoTSopBOka5A9kpDiPFFurbF+1mjOb81UBycxnBlNbA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OcaCpxNAgisEJCNZIai86noWDtCWDqkWSFpTjEXEzIswIfNHyHGGAXcX6eCiXdp17jBl34uBzsj/pZ78D8E2XuQ2gxAlyGJvxMgtuLKyvTbT20TLna7mgGhOfAF3NDR4K6yQee6kEzkqVBowggdSoXk90biBPx9wuINnGsgZyNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=s6gOMgZI; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="s6gOMgZI"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-225477548e1so21044085ad.0
        for <loongarch@lists.linux.dev>; Thu, 20 Mar 2025 10:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742491777; x=1743096577; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ehMUm3J1yyvZGiQlan49h9651rjeLktXjDjteQa4YzI=;
        b=s6gOMgZIwdEde/lzelrJziWthH3C2VtmTm/slOJGMSUAdjAIxkqbARZycg3llbUvRe
         A6lVXOpMUqmEh+gjqisjXKxItTK6RIgHSw81sShrC5inCvQy6twb+mnvEwDT6d3ioBvo
         /nNXb8A+Y2uK67ujqKqTKgMHuG+wLNfCZiHC1xq54Iwz9E3EOwIIldpeaFoCOjlpuLyx
         55nDuTqVm0E1jRRj7ZqGiyjfVcxeEZbVBF7DvZez4V2ggkP/MIOjPNeThwsFvOVlgf7T
         9n7FuZyGV5BFNCBvbx7d93UVVaFKmLO8lbWZeMOsWoT6iNsYmIK3AH1TsQOgr6aNGu6i
         3Xpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742491777; x=1743096577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ehMUm3J1yyvZGiQlan49h9651rjeLktXjDjteQa4YzI=;
        b=ewpjJrWgFM/JqyJP4EUMHqHnc+rB7H6+n2Igalz6y4/2aJOtUVkSeOHaxOGhmslwF5
         GvkXA/0TEmGo2ufa6QksPWnsqUecNg3byyuUls+e8sjjlghDMd/i39+QW3dXY0wQtaCE
         b+sHSGA2vuOlf2XeCT+2Uxoo/PcQV2uGDAC7PxACQhz2kxPhh72vZYJ1b2tabk7bXzp1
         j2yZpk6seeui9V5yIqcJ+iTOXBEzKkgTa/PLULL3V/pWoDVKiih+U6J7PcofjWO1aYon
         9isrJqtg9q8vrX7vdfu3wYzD9IPQoUKkLpswS5eOHrv0wh+KQeQe+pKof8L+BPIoaxrP
         AwgA==
X-Forwarded-Encrypted: i=1; AJvYcCWfZj1rVscc+Rm2SatgySNWtnqHpeqILJaZwgipUYGEGzux6QfnBt1+5yX0G+6RvjoejsKrwTWd8qM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzCdBOVRvmhmP8bpyAlF70mylFse6Ptbk9TX5aooAGJOjqtMNYW
	DDPtZPH71GdChdrlrEcm3NNhzsTY823LgcSiHz8IXFg2XLHi6ELrOLsIfn+x44s=
X-Gm-Gg: ASbGnctk+8vuXzvFYAVWX4Zmne/OHheyGYq3BwdZvmZG5zpGQsEQYQ8JZ8eNi5axohY
	YgE6FEM+mYkQNNcMVkZfPEZs/Q3N6+4q4Asf7ueuoTc5n87sBwUSrnhdQpc/s4w94r6V6zc2+PQ
	RadF59f4E25yZ3N7OgiPlfwpFjM9wxuO4ai3AuNJgJGA0FYsdumiia5ZcYRb0Pz64x1lIedxZXn
	RFPSbjlGGoiQAcmBc2Lp0tb7PRgzxbudpu+ts1fN3MmdVwtkL8Ws1rNp/d15fs8WjWuzJlfpcbU
	Goo1UtIAwONg6c6fzQIZ78YtN0nN7Kc9E2nQ7Rcu96nEuIqrkGQv8j7rj39c
X-Google-Smtp-Source: AGHT+IHosJQQFvVMIroy5HqFrhcvWEZzb29pVdZNHAFlNJkZE8gGcxmxyZzEuwUqug8vYxa+GU6q9w==
X-Received: by 2002:a17:902:d4c5:b0:221:7e36:b13e with SMTP id d9443c01a7336-22780c7a32dmr3719635ad.12.1742491777384;
        Thu, 20 Mar 2025 10:29:37 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f45994sm554075ad.81.2025.03.20.10.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 10:29:36 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 20 Mar 2025 10:29:22 -0700
Subject: [PATCH v6 2/4] riscv: entry: Split ret_from_fork() into user and
 kernel
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250320-riscv_optimize_entry-v6-2-63e187e26041@rivosinc.com>
References: <20250320-riscv_optimize_entry-v6-0-63e187e26041@rivosinc.com>
In-Reply-To: <20250320-riscv_optimize_entry-v6-0-63e187e26041@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>, 
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 loongarch@lists.linux.dev, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4464; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=LoTSopBOka5A9kpDiPFFurbF+1mjOb81UBycxnBlNbA=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/qdgKoixkOt4od/iEifL9zYlhO5zOWE7Vw5m4ApZ998y
 O14lMvdUcrCIMbFICumyMJzrYG59Y5+2VHRsgkwc1iZQIYwcHEKwEQ2pDL8d4p6u1r9XZ/p36Ph
 jJrvuJPnX6/4mvmoWWO2f7i9ULmTNcNfuVlX/l06sK2ofs2Kdtmgf/l/nq4y9epjOXvN4/StFeu
 UuAA=
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
index 7b0a0bfe29aec896c2bdd8976d855dd390de88d7..485ec7a80a56097e8905cd6395af29633846b5c8 100644
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
 	if (has_vector() || has_xtheadvector())
 		riscv_v_thread_alloc(p);
-	p->thread.ra = (unsigned long)ret_from_fork_asm;
 	p->thread.sp = (unsigned long)childregs; /* kernel sp */
 	return 0;
 }

-- 
2.43.0

