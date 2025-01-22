Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E2B1CAA80
	for <loongarch@lists.linux.dev>; Wed, 22 Jan 2025 22:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737586618; cv=none; b=rmH4MwetaR1AHT8B5bXULB3GVYTqd+KjsWiVFRaqe0dbiVDUPl2pAztDoil+M0jKOCoTorAFFWxFmOl4lLNoL+KDjkBjpgYEhOeux7hWFFwZU1C8Sd9QW07ocYj6cnaQiMSjT//h9AVuWEjiQIXizvB0Acy6wOv3z9sqRMgGXGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737586618; c=relaxed/simple;
	bh=rV9JUhm8W3Bx7rnRIzGCq2bwJctlTEtmatZOhNjH0vc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=meX/EO6ytdWNrom1kVuYreMJeuaqvC0p6fPxLtlZwRvvWYtiC2POg1julbg0ISkBxiZy3oGMWia2IIyxDB0TJ7+9hEWuRIxUtE+xuZLYMmCxH1QYSk6RrFa6HeZhvGvSUSJu6jpl7IIMMpxuXIG6hrOiZfGygTlPM8K2fD+SE/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=UN3GhE+a; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="UN3GhE+a"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2f42992f608so528503a91.0
        for <loongarch@lists.linux.dev>; Wed, 22 Jan 2025 14:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737586616; x=1738191416; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fn/PejcoPFKdcNV/yWi5+0DAQFM+nDQKenDgBFYN3Mk=;
        b=UN3GhE+a1joYxW0A3noYGKdNIIY4Je/9Lile/fTPrYno8jHB/NY3oygUpHYpGaVzc8
         z2G0PNJdISmumneEo8nGelP4ms7SZ+51ySBBgnq4HW2L3z3w2Lja8RuUDdCgSpkuWezf
         xR8olMat1K64+1jmNvPOWioKtB1clKU2iFpydbJPlwquXewvbzM1zv99t3FKPFCT9XFw
         01bAICQQa835NhLTRB6tQ2xHzzI7FhM/WbOXJsn2gfS9V1w2NdsiN1H77J354KLZuFSU
         4lyk6xY8JfU2jkPUfbHpAXDEs2O2D2p7BVRs0um9AOFlKQNwqmlPTEqE/qyR185LOIuO
         OGXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737586616; x=1738191416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fn/PejcoPFKdcNV/yWi5+0DAQFM+nDQKenDgBFYN3Mk=;
        b=m9dBKIxNpFrHKGjhIOmFI8Lsh/qZ6sIt8PAeJURKnNUAekXrOHJoasDG/Kq2mDDFL0
         Mxk1AXGFYe5DSY5/tsFH8q36s8J1k6feoTgpwE4/GTItzQUVVKzzXf2qtrm6Xog3/cPP
         A+5cm7ldo2CFJlI1f+hx2gYnh53ixcZ0CJ8FKZa3rL/+AEjI5DehqkJ6cywiHWySr7bO
         jc0QD03CQ6RfePiyiqjahdNclse3YkThAq9pzIGlVWvAq9bFoW72StOrrMSg0ZyTkKA2
         RjbbeN0jY/4dxCKl5Af508i9m09JymW+sJdJC78x+qLUBI8L06OALsDFVtw0ycgCWs8t
         r2mA==
X-Forwarded-Encrypted: i=1; AJvYcCW9oWWBeu5nT1I0DIqBGzENEiMJi2wB8sJaD2sLnOgC7VoH9h9ayj9re6+3VMESYxShczhxwFHM44k=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywpl9GKjA0fhmdt8MgkFg4izljo9Q1wZ+u4VBMck0Tk3fbmAKWi
	fII/P1+x3zvIAlx/cKp9Cuix8rJZJnyDbPNgu86o5eVobUYTQ0WriXnyUgNIBp4=
X-Gm-Gg: ASbGncu5hN+0Z0l+V9UpPX1NXrxkOQosSjQ3zrar/AKhQrixZNEE6BlzduRx59F2czj
	5/dbounBErKeJPh7zx3/RI6wD62Lyt0Ojo/CeqG9LSJyQ+c0YqIwMyCf0UwH1wcqTPYzFuRwdik
	cfFs7XJl6DRfI4SmpZwFv/Uh5YI3vAndBTiMs7ixuwRK+GJ5tqgaEs8RoTwn+1r/m3qMpqpCs2D
	98h3cn+UO/+2VSbE7wG9ipA3mwHcvdYS8uLhnglSNZ2dpEJ/h+OMKPLJe0QnPukZdH2MIzbnxM0
	z9OPy1l4Kg==
X-Google-Smtp-Source: AGHT+IGkOWQer0g/4jCDpWuE1nqdG+SGuwiRfCbniIbIL1sny3WjBA7acx7xqTIHE+P8KLoFagnQAg==
X-Received: by 2002:a17:90b:5249:b0:2ee:e518:c1cb with SMTP id 98e67ed59e1d1-2f782c4bdd2mr36926987a91.7.1737586615920;
        Wed, 22 Jan 2025 14:56:55 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7e6aaf3b4sm2301375a91.25.2025.01.22.14.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 14:56:55 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 22 Jan 2025 14:56:20 -0800
Subject: [PATCH 1/4] riscv: entry: Convert ret_from_fork() to C
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250122-riscv_optimize_entry-v1-1-4ee95559cfd0@rivosinc.com>
References: <20250122-riscv_optimize_entry-v1-0-4ee95559cfd0@rivosinc.com>
In-Reply-To: <20250122-riscv_optimize_entry-v1-0-4ee95559cfd0@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>, 
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 loongarch@lists.linux.dev, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3438; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=rV9JUhm8W3Bx7rnRIzGCq2bwJctlTEtmatZOhNjH0vc=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/rE8s3MIQ08j0o/nwm++ubjMauZxccEN91XPGF74+yfn
 ewBNxhfdpSyMIhxMciKKbLwXGtgbr2jX3ZUtGwCzBxWJpAhDFycAjCRU7YMf7izZz+fvbMn6Tjb
 s5lz+eSSgzfZ1B4I++FZYx1kl/riy1xGhpMFnZuYvBcrfshj37l/8YZJ0kmhD5nP2Xm+tzAqnJ4
 XwgsA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

Move the main section of ret_from_fork() to C to allow inlining of
syscall_exit_to_user_mode().

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
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
index 33a5a9f2a0d4e1eeccfb3621b9e518b88e1b0704..9225c322279aa90e737b1d7144db084319cf8103 100644
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
+	move a0, s1 /* fn */
+	move a1, s0 /* fn_arg */
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

