Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0991CD1FB
	for <loongarch@lists.linux.dev>; Wed, 22 Jan 2025 22:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737586621; cv=none; b=ORHci0CrbilFJ7ZHNsGcwPMzh8mpqmi4knXl4MQcC9M6O6FoOaxuo7HPQ6/MDP7KyTiLFlxHNe+bLvsy62fO+S4Z0nAfsTJuk/mO6bQuAJhuCSlQHmSSJxY4TdKfbPCsgzABKIiXX54Tckou8NASrclQ0MAiQXw/owXQeA0Ry2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737586621; c=relaxed/simple;
	bh=IfDjpWzOkJ2hu8S0SjhggOry7IIgS+knXj7qp/i1XMU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yl7MzxoSoIaWFyLB6Y2Yvxb/1Jhf2vP5rKrT9y9sLDAuTIk0+yEuniA227H/yi5izGNHuZ04BDWrUDFzj98Yq37DZA/2nj0jIr3s0BzCx+3VjLeVaRR7GHW5rkls7oyOKoqfUQ85msADICCWrTBx0Vf41vtCV165j/C3hsIvHy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=OewRVin5; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="OewRVin5"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ee67e9287fso633242a91.0
        for <loongarch@lists.linux.dev>; Wed, 22 Jan 2025 14:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737586619; x=1738191419; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8+waL18iX0aaC1P1/K+RB0UPKm0pakylfY2Y6RIkpXQ=;
        b=OewRVin54lg3riQ4hxzd/giSctbvc3HX5QKerlLN84ZSHOR20nIPCU7BIilZsEJ658
         +jwRcvtMdBJWT5Zcftg6kEfnDGJGEhi6b0xoNLpHN1ZRqky8XVqGB5gHkx4fg/JPmQHY
         pu6AujGXu97U8WsJepf0+qwygkwOOzO96svRvlgMrSLQX1FxQ3Q5eDnskYGhFlaEdtUB
         ay8FZfavlj6vLcR1tb1b1/MmWoEOP/O8uTxZdAIV0g414tLWqF1EVRmMeMopLsPrXA+C
         LY+JJ24MsVr5IdHpYXfxJfp4OuPvMDq2vpSwEg2ltqyj/hqiZk4FqQ9Ow6VD3hou8zXm
         CIkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737586619; x=1738191419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+waL18iX0aaC1P1/K+RB0UPKm0pakylfY2Y6RIkpXQ=;
        b=rrVM7NHI3g6+qU3NV24d65VKs+WUUr4rFVHV22ggAZTeJy3hSBIcgKyUHS7B/XffTz
         HohagBkovAViQRl8HH38x2U5YDr2ZBRqVxExrvc7Y5TuT/ZeLfg9qFOpX6dx+RnuEbJz
         TnkbxPlJSyTzkGb3P7EJuqfe5Rt2SWNfhz6etDE9/HllciPu4DzHXEjThU0CnIrpxocv
         6Tgy5NGxgqiyt0sWEXH4/ms3AdHNpTJid28xISqQzREV4c0jjmA3xiHND6ifg63pg+GH
         hgR1s6RbyhAaebShnoN6aLoyFymVPBSGsJmdFkhdUMOAZb3Kz0fdI/wN4dIGM6be6Xhf
         wycg==
X-Forwarded-Encrypted: i=1; AJvYcCXiPmC9WKHVLc0UBPtIYphsWgRGTsZhmFJTV/zAqj/ds2Y2AOmN/hw4o3Ib2ExM9m8ePv0AbC1jSyc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxwbCwr7CwcJwNH4d6bop5Nep5Sk9v7pjyGf/AROGM8YM95FQNn
	MZigWpu0/5l9QJlu5JoTFakbON9NhWvMs0U62YVS0C6JPGPWHY95fdIzaWjP4kM=
X-Gm-Gg: ASbGncvjYS6iQPY086d592dJUvKyHnUm2KyfVhOQNsExxjuoGhhop4y6XZ6SFOSLPFI
	5KBFQbsWun3wdJ7c4io65Ug+yfig9F++HV6jI1tfMHSJTnHB+SGYxIrCTDwhFPqL/n8tJ7JSPbH
	kPorzfpEMZOutbntiAIe2Ql0gli+jYNqvsfSNUByXKKIHYl3t7mBNvukHIE5MRQnP/f7cEzofdJ
	iJpFuEUpWh7UzupgGKhWcCiTIJ+XRDzsm42RvOSjj5jzXezhdiE6Ui0JGMdQeY7tqjwTRjBBeLU
	DKCRBMePS//iBijx/uOZ
X-Google-Smtp-Source: AGHT+IFzzfa8LiTbTT2Dmbp7MvGOIfIV8LIzhJeiC+AzFuWK0lSK5kP59xevBlrCdbe0b52VK1rxLQ==
X-Received: by 2002:a17:90b:2c83:b0:2ee:c918:cd42 with SMTP id 98e67ed59e1d1-2f782d4eea7mr29321427a91.22.1737586619150;
        Wed, 22 Jan 2025 14:56:59 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7e6aaf3b4sm2301375a91.25.2025.01.22.14.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 14:56:58 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 22 Jan 2025 14:56:22 -0800
Subject: [PATCH 3/4] loongarch: entry: Migrate ret_from_fork() to C
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250122-riscv_optimize_entry-v1-3-4ee95559cfd0@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5559; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=IfDjpWzOkJ2hu8S0SjhggOry7IIgS+knXj7qp/i1XMU=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/rE8i1dL+OOSYp8qL2mJrSGk+0H5+f2Kp+Pe9jq1j479
 X6Zw93yjlIWBjEuBlkxRRaeaw3MrXf0y46Klk2AmcPKBDKEgYtTACbS58XwP8BkwY7+lm9r70p9
 PBS5f82H6nUbnypMbNbf1X3B77b6BXlGhvWh9sl8e+4IHvqc9LB/msHdqb4Hds7b5PnpRYe+W/a
 WgzwA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

Loongarch is the only architecture that calls
syscall_exit_to_user_mode() from asm. Move the call into C so that this
function can be inlined across all architectures.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/loongarch/include/asm/switch_to.h |  8 ++++++++
 arch/loongarch/kernel/entry.S          | 22 ++++++++++-----------
 arch/loongarch/kernel/process.c        | 36 ++++++++++++++++++++++++++++------
 3 files changed, 48 insertions(+), 18 deletions(-)

diff --git a/arch/loongarch/include/asm/switch_to.h b/arch/loongarch/include/asm/switch_to.h
index 5b225aff3ba21aa06d0713bc8e73e1b941389630..a1c5576f1fd145670e13038bec6dd390486099ab 100644
--- a/arch/loongarch/include/asm/switch_to.h
+++ b/arch/loongarch/include/asm/switch_to.h
@@ -26,6 +26,14 @@ extern asmlinkage struct task_struct *__switch_to(struct task_struct *prev,
 			struct task_struct *next, struct thread_info *next_ti,
 			void *sched_ra, void *sched_cfa);
 
+void noinstr __no_stack_protector ret_from_kernel_thread(struct task_struct *prev,
+							 struct pt_regs *regs,
+							 int (*fn)(void *),
+							 void *fn_arg);
+
+void noinstr __no_stack_protector ret_from_fork(struct task_struct *prev,
+						struct pt_regs *regs);
+
 /*
  * For newly created kernel threads switch_to() will return to
  * ret_from_kernel_thread, newly created user threads to ret_from_fork.
diff --git a/arch/loongarch/kernel/entry.S b/arch/loongarch/kernel/entry.S
index 48e7e34e355e83eae8165957ba2eac05a8bf17df..2abc29e573810e000f2fef4646ddca0dbb80eabe 100644
--- a/arch/loongarch/kernel/entry.S
+++ b/arch/loongarch/kernel/entry.S
@@ -77,24 +77,22 @@ SYM_CODE_START(handle_syscall)
 SYM_CODE_END(handle_syscall)
 _ASM_NOKPROBE(handle_syscall)
 
-SYM_CODE_START(ret_from_fork)
+SYM_CODE_START(ret_from_fork_asm)
 	UNWIND_HINT_REGS
-	bl		schedule_tail		# a0 = struct task_struct *prev
-	move		a0, sp
-	bl 		syscall_exit_to_user_mode
+	move		a1, sp
+	bl 		ret_from_fork
 	RESTORE_STATIC
 	RESTORE_SOME
 	RESTORE_SP_AND_RET
-SYM_CODE_END(ret_from_fork)
+SYM_CODE_END(ret_from_fork_asm)
 
-SYM_CODE_START(ret_from_kernel_thread)
+SYM_CODE_START(ret_from_kernel_thread_asm)
 	UNWIND_HINT_REGS
-	bl		schedule_tail		# a0 = struct task_struct *prev
-	move		a0, s1
-	jirl		ra, s0, 0
-	move		a0, sp
-	bl		syscall_exit_to_user_mode
+	move		a1, sp
+	move		a2, s0
+	move		a3, s1
+	bl		ret_from_kernel_thread
 	RESTORE_STATIC
 	RESTORE_SOME
 	RESTORE_SP_AND_RET
-SYM_CODE_END(ret_from_kernel_thread)
+SYM_CODE_END(ret_from_kernel_thread_asm)
diff --git a/arch/loongarch/kernel/process.c b/arch/loongarch/kernel/process.c
index 6e58f65455c7ca3eae2e88ed852c8655a6701e5c..9bb069ef363fefed1f2115e6572b31c2b76bb414 100644
--- a/arch/loongarch/kernel/process.c
+++ b/arch/loongarch/kernel/process.c
@@ -14,6 +14,7 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
+#include <linux/entry-common.h>
 #include <linux/sched.h>
 #include <linux/sched/debug.h>
 #include <linux/sched/task.h>
@@ -47,6 +48,7 @@
 #include <asm/pgtable.h>
 #include <asm/processor.h>
 #include <asm/reg.h>
+#include <asm/switch_to.h>
 #include <asm/unwind.h>
 #include <asm/vdso.h>
 
@@ -63,8 +65,12 @@ EXPORT_SYMBOL(__stack_chk_guard);
 unsigned long boot_option_idle_override = IDLE_NO_OVERRIDE;
 EXPORT_SYMBOL(boot_option_idle_override);
 
-asmlinkage void ret_from_fork(void);
-asmlinkage void ret_from_kernel_thread(void);
+asmlinkage void restore_and_ret(void);
+asmlinkage void ret_from_fork_asm(void);
+void noinstr __no_stack_protector ret_from_kernel_thread(struct task_struct *prev,
+							 struct pt_regs *regs,
+							 int (*fn)(void *),
+							 void *fn_arg)
 
 void start_thread(struct pt_regs *regs, unsigned long pc, unsigned long sp)
 {
@@ -138,6 +144,24 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 	return 0;
 }
 
+void noinstr __no_stack_protector ret_from_kernel_thread(struct task_struct *prev,
+							 struct pt_regs *regs,
+							 int (*fn)(void *),
+							 void *fn_arg)
+{
+	schedule_tail(prev);
+
+	fn(fn_arg);
+
+	syscall_exit_to_user_mode(regs);
+}
+
+void noinstr __no_stack_protector ret_from_fork(struct task_struct *prev, struct pt_regs *regs)
+{
+	schedule_tail(prev);
+	syscall_exit_to_user_mode(regs);
+}
+
 /*
  * Copy architecture-specific thread state
  */
@@ -165,8 +189,8 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		p->thread.reg03 = childksp;
 		p->thread.reg23 = (unsigned long)args->fn;
 		p->thread.reg24 = (unsigned long)args->fn_arg;
-		p->thread.reg01 = (unsigned long)ret_from_kernel_thread;
-		p->thread.sched_ra = (unsigned long)ret_from_kernel_thread;
+		p->thread.reg01 = (unsigned long)ret_from_kernel_thread_asm;
+		p->thread.sched_ra = (unsigned long)ret_from_kernel_thread_asm;
 		memset(childregs, 0, sizeof(struct pt_regs));
 		childregs->csr_euen = p->thread.csr_euen;
 		childregs->csr_crmd = p->thread.csr_crmd;
@@ -182,8 +206,8 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		childregs->regs[3] = usp;
 
 	p->thread.reg03 = (unsigned long) childregs;
-	p->thread.reg01 = (unsigned long) ret_from_fork;
-	p->thread.sched_ra = (unsigned long) ret_from_fork;
+	p->thread.reg01 = (unsigned long) ret_from_fork_asm;
+	p->thread.sched_ra = (unsigned long) ret_from_fork_asm;
 
 	/*
 	 * New tasks lose permission to use the fpu. This accelerates context

-- 
2.43.0

