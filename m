Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D601ADC63
	for <loongarch@lists.linux.dev>; Thu, 23 Jan 2025 19:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737659722; cv=none; b=sBuHravBPJUdfpPWiy8tdChTeEuMkHc4L1eq9hyu2xNwAxxC97mbF03GR3qau85RkOk73sKTYdHU6CiwpgwmmqBjEo8BYu7p2Qy5pWom3dwq0K0ZCR4Ax3gUFgwmJrKywijXgxsXrzaEBH8r5RX9KxGPI7E6AfsC3OLZYwI7E1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737659722; c=relaxed/simple;
	bh=/8HxBSW4tXtNDNNcwvIlJWKmSet2jd64HJR1EYtmRzg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WbzFPQe9OQHIYC6C/i+us0vL5h/8R2X9G3YMYPb390X7cDFKvC9+FWWlxzt7Tor0HPoi7YfJaK0F+1arZ3YuCECnSHhMOe/CD0jHTr3FH8StpDZckr9XaX5Y2yqS5e7OiKVhbvOljBhBJNe20r9BO+HXx6T0ZRdhei5lajdtOYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=GAthKgqH; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="GAthKgqH"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-219f8263ae0so24997125ad.0
        for <loongarch@lists.linux.dev>; Thu, 23 Jan 2025 11:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737659720; x=1738264520; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gk9EjRkEzIcEMvzIBfoIlltgvi6+ujtlpNud1xWt+ys=;
        b=GAthKgqHfh8FBXPZXYBwS2+1B46dgbpdzLR8CH/ibtH7IGd59ZgJczBVvkJvEMXWd5
         SjeD/GCs37F7AShJC+HF4wzknnfkh9JW48Q55lNxW9hpo4VMOzXODm2UCkM7zv+FHigs
         CwnFwdyaE5+ddyAYT+SPaYFWi1n/5YFbulaGRsZsXULpH94ivdN3Nxqfm+soiAuXgu4P
         mx2IYYFdNXd+kA2GzGpCgxRq7wcYg0/wLiBc0T6A6Vx8w9MFY28jr5EAiE8xgbcoZwVU
         OKshJQUaM5NZXhDD7f2CkaKZ45C+I9gnkTPnegesV8zjerMTIJjMRQmNYz1bJNA+IdpE
         x1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737659720; x=1738264520;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gk9EjRkEzIcEMvzIBfoIlltgvi6+ujtlpNud1xWt+ys=;
        b=Ahl21vCUzFMy4bKK1CxlcT+hu9Z7+ktxCXErk3kcPjjLpryH8TgC3BWp68Dw4r0CZT
         6M/pMV8x4hvEMqsm6NuxTvB6DdbCdKb6AmmEx1JH0hmKV14gHk5G+ZjJwKuDTPfFZEVr
         YLlDpvS2UGwxtv10E00pK459L7DN9TndRbtPMToKehPwPXr5souyNVu554g70VaJAUYs
         gODF0uPNoqX6BZMP5gXGmwQwioxH9ogjcwY4ajNGiGQL6CQnfqbcMev/QcqFq08SBD6n
         NdpI+X62RBqPR/tYCzuk4e8LbwV8HtL0JlpgKhzsC1xhvyYaiFnHfz7eI0RcjSjtIyW3
         IAFw==
X-Forwarded-Encrypted: i=1; AJvYcCU4UHpDdrKXzrKzGevRVLauondSB/jEx24QY/5cjVffrj6NMXUlLK/B8ezbhDDG0E3pszEcy+8Sc6g=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/0vX9JlcCWg0zeE/RECT1gKN/z5D6ZL3NgwEdHXJsMz6W2P9q
	zr2riLNRFJ6p5Dz5AIvD1vhbdPlP2ER6esXKCQkoywy0Fjsj+hA+vzoMyfaEQ/s=
X-Gm-Gg: ASbGncsR+RdX4JY5ZvUpObWSBjLXe32joMDJwXEMXAmAuEY0qcHTV/75rH0R4dAoOZt
	zAYg8Pv1ANwZf9CuCVnYmMmBTPMviskh9NtvCFs1ZBaWW4EKvhW/6cLMo2Jl4twT4GImKdXR3pu
	6vDWQ7XDaoS1abW+TjoTgrCEECbNL0N8+yUxUxzp98fuGozMIBBHnvoyIleq4ZQwZQPzqnEL8A/
	qKLImniHkRfnz4+sunKWPGwK5G+Y1qNdReGbf/gZpUuuygKRclsW00/uDIZ01GCTFWHTslp2ELv
	LHq1366kPtxOT440sQ+0
X-Google-Smtp-Source: AGHT+IHkfQrPEp8KLYF3AL+Bo2Q59PhtC2Y35HYLcJb5kUhqwNq9FsM6DusLZuZ2u/xwUq4DVWlfUw==
X-Received: by 2002:a17:903:186:b0:216:1ad4:d8fd with SMTP id d9443c01a7336-21c352de48cmr341368705ad.8.1737659720435;
        Thu, 23 Jan 2025 11:15:20 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da3ea3cb2sm2504645ad.90.2025.01.23.11.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 11:15:19 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 23 Jan 2025 11:14:30 -0800
Subject: [PATCH v2 2/4] riscv: entry: Split ret_from_fork() into user and
 kernel
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250123-riscv_optimize_entry-v2-2-7c259492d508@rivosinc.com>
References: <20250123-riscv_optimize_entry-v2-0-7c259492d508@rivosinc.com>
In-Reply-To: <20250123-riscv_optimize_entry-v2-0-7c259492d508@rivosinc.com>
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
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/qkqU5LlD7M5JuZcPjghNKfuzee+h96SKX52fwpF+7Pv
 yJwsEJ1ZUcpC4MYF4OsmCILz7UG5tY7+mVHRcsmwMxhZQIZwsDFKQATmfqb4b/LsmLTjNZDcn8n
 We6aOa8wV19C3dpT+ubLC8IskrtvVrxn+B+d8GZq9h75F88bpdL8j4uE+lp+5OEwuiJ6Vydjiex
 GA14A
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

