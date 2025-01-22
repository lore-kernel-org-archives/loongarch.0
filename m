Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5CA1CBEA4
	for <loongarch@lists.linux.dev>; Wed, 22 Jan 2025 22:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737586619; cv=none; b=ZRlGMnQLMHEo3UJSgWaX1UM1iCB3mumZM4YelLRvaiRFKJH53AmawaqwZfLr3bGwIppwn3NP0vHp7aY3RYVDqbj4zLT/2v4znEIsDy/aQh4Jn2mG1IgnOs5tqcBmAWlVv2rQ0S9lQNbYFmUdZwpyPhKzKUAoBoRllU+z78xnfbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737586619; c=relaxed/simple;
	bh=/8HxBSW4tXtNDNNcwvIlJWKmSet2jd64HJR1EYtmRzg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cLDlKVBZtbDa66JtUn9OGzTAphes23iNYyhGe5AWyyUshIa7YEE129TWBa6zW+tCfR3vHpD7OYlzIwYPLAFzXnKcwz4M3VULHIh8hC5j2kR/loNyxt1D21On30Z8Fi1b7nf+6uJLHvl9hW5J0+kgVKoZU+vPMggaEzbqnUP1QrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=yiHd5NW0; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="yiHd5NW0"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2efded08c79so509553a91.0
        for <loongarch@lists.linux.dev>; Wed, 22 Jan 2025 14:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737586617; x=1738191417; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gk9EjRkEzIcEMvzIBfoIlltgvi6+ujtlpNud1xWt+ys=;
        b=yiHd5NW06taZoLzc30O7drZx9f6nOyYGHKkvmGvbAzlW6iMKt1HZgsWlyytzUwrOzS
         eRH5dY5KYTjmEwwBRtGIzJazYh1+AtrLULz+Ur2sLrU5EPkUygj6Qv9B8QCfCHkIRxjm
         VyF0m8VUTdP2s9JSLR6hQo3KX6WbiYjeMZKChwsp5qzBXgVT76+ivo4g5SAxMV2OLn/V
         Kr1X9dN16zQLAhQzs+Lb24mBb1q4mKvDdFQ31bE7lBiSWY5Gp+otJ+KqlOx2RnR88tYx
         YgHVY2mL1k9pdvNtWr8BCZQFTbKQ/Qeglu4Iy90ok16pXN8BrU2xVz0l7/AxMd8OgzjF
         XT4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737586617; x=1738191417;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gk9EjRkEzIcEMvzIBfoIlltgvi6+ujtlpNud1xWt+ys=;
        b=Oo/V8ohVMdzzKPO58EttkDWEpUDOFyoVZzc/BsRIHkRXKW7++0uQTpFOX20FxnoQrl
         jSkMiRzwHCNO5NgKIUS7tVIQ2drlXGqt8MN7YZhPQ27Tu5Erh3GFR5RQIzC78CerM6wT
         kLh7lYMc2QdpEdfIUmPXnS8WUn4dBuhwiZd+NzfLVDZig9AQ+42BM/3zBfc70Lsgbr8g
         H8gge7Wxe6jNoCkwZPM45FMP5ctAoP/0g92zp/Aceho6tMsp9M6/wCGZIzkn/ASSrtaU
         4eWAR2yywDo62U03PKGPMQ2rfa31Trs3ZdpQkGsusDVvKbALAFY0t5XIVHNFIaYyGYq8
         M+xQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIKsKwlpqR5cJzeBeTJ8DyC0YDR5OreE/nhi+ch7Z67Nwy7lgJC74QlopgY7yoknwir9+n/CCwXO0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyKuuQAuLIBcp0tT4OV1jEZmOFzQhDhXIVjBhyDedNrYeuLEmGu
	BxKCzrSLtCU4mikIs19QJdYScWu7P4OfacAT6spgYjQ3z04Mm92NosdXGTI8boI=
X-Gm-Gg: ASbGncv6V9ABYaanfG83PvXfJITd3/yWAzSOMqf0sDHJyqvxHIYhQujTpcNNcLt+NzI
	W9vm6KXThOKJFNrkWcOvLE3iA9a3Jw93HW0zIvyFNnHyYr4pTcpla3ehmFVPhxrGdUJ6sl67WJO
	Hzqurusq+WBU1Kt0QMt4GApc4vE4Z5iqYacM7wVpo8QKiLkOqEoRcRGpB3//39P0QX4TBvP1h4/
	PtAawoZYqKXmX1NwiWx4PkQmVQ0SoYSM8PidOwQC/jqsq/+LdVvFSUBeU9OfeTHr6Z2nns+eC3M
	TD5q55mo5YZL//qDyreq
X-Google-Smtp-Source: AGHT+IEgKTQYuz2/Gbshe8x8bmjmpJ0Acgfixj4MEY6AowVSMpnu4YvlJGJiQi2O8+uqfUzYLPzGkA==
X-Received: by 2002:a17:90b:4b82:b0:2f4:423a:8fb2 with SMTP id 98e67ed59e1d1-2f782cbf6a3mr35467389a91.20.1737586617545;
        Wed, 22 Jan 2025 14:56:57 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7e6aaf3b4sm2301375a91.25.2025.01.22.14.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 14:56:56 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 22 Jan 2025 14:56:21 -0800
Subject: [PATCH 2/4] riscv: entry: Split ret_from_fork() into user and
 kernel
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250122-riscv_optimize_entry-v1-2-4ee95559cfd0@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4442; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=/8HxBSW4tXtNDNNcwvIlJWKmSet2jd64HJR1EYtmRzg=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/rE8i0b7c+0s/xcqt3/5b4w99KHFwsVdgnIyp27P0Uh+
 PiLWpaFHaUsDGJcDLJiiiw81xqYW+/olx0VLZsAM4eVCWQIAxenAEzkvxojw/S94Wbr81rsm08G
 Ci0Pqo+N/Pys/vcCwWWTdNbd4dItesbwV/CvwkKz0Md8V+zighdYTl076b4Iy/KkostTt9bobnT
 +zwYA
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
index 9225c322279aa90e737b1d7144db084319cf8103..9386ef7444267f0b9bf8a0550f4e31deaeb85881 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -319,14 +319,21 @@ SYM_CODE_END(handle_kernel_stack_overflow)
 ASM_NOKPROBE(handle_kernel_stack_overflow)
 #endif
 
-SYM_CODE_START(ret_from_fork_asm)
+SYM_CODE_START(ret_from_fork_kernel_asm)
 	call schedule_tail
 	move a0, s1 /* fn */
 	move a1, s0 /* fn_arg */
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

