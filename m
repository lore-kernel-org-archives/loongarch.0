Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE9714D44D
	for <loongarch@lists.linux.dev>; Thu, 23 Jan 2025 19:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737659721; cv=none; b=PW75mpcZqob4fbTEeLMKYrcjszFfj1H/NHaCvghiRK5adJNRXxckKZ+wV3cMoQb5tqYLfdd2YW0cxxltnrZIWt1sOz5ba0G4hdPvnuvmX5Av5ok+O9iCisEY7KjSHTQw90fDLwQ5SyQXsaU1Kw6o25JCbR5DRBZLOOKn5gAJZUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737659721; c=relaxed/simple;
	bh=rV9JUhm8W3Bx7rnRIzGCq2bwJctlTEtmatZOhNjH0vc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jJviaBkO1QDNjt1Zjdh8NZXxsm6kMLzZMeNDxaCdHvxzaMG8in69fmtMBKDK+j1BDWcXV+wUVR+cdNHq6D3G5zGGXZy9/WxpQgKxwCRk2Y8bkmyTLL4mH+F40Rkq5xeYksGR2rc8Q2S3qesZmyOY5TRtctdp72MwYWL8xrZhv4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=aU8m9ulj; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="aU8m9ulj"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-216426b0865so21341505ad.0
        for <loongarch@lists.linux.dev>; Thu, 23 Jan 2025 11:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737659719; x=1738264519; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fn/PejcoPFKdcNV/yWi5+0DAQFM+nDQKenDgBFYN3Mk=;
        b=aU8m9uljTBzG+nSk+rb9JhmD4SLB7MQMmq1QukJmrcnAuWQal0+ZZ/1Bs3AGF9GMJr
         XM3SkoiraXf9QnCiZGdyVpJQQAGeSiRcSLqfSc9mXujAfefZpS3mSHiRdu9T0YaxPU/G
         xhyhsAK9/VZup3fAK3xsYg/AlkIZfy4iTln+Wrp/06QaVRmEvx1tsxLJwm9MkEmIucmT
         RZNYLdXQqcSFrdI/jombyJYK/KMr/uSGrtedbX7vcJsQ0n96X79IaIZrPGtuLemGl5Fo
         hDeXdyrAK06/DgsenVyvw2AO6fgSuZXnNHSTYvRoeDzljLFrXrI8StQ0R4XI/+sBGLVM
         DuOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737659719; x=1738264519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fn/PejcoPFKdcNV/yWi5+0DAQFM+nDQKenDgBFYN3Mk=;
        b=qryYiywaqKTNg1rwcgJVtBiKCAnzbvLW4g//zVTCIF3CDwAEY99y8+SfbM/iGaaAs5
         llYdntRiR9ftH7qiXF85yEU650uRUuqQHmu0BOofH37GVHepKPiVgQTE9jCJ/etMVLBj
         YCbhhe7Eyncxv+Kz+T1OAMcN9uHuqWuWMIYodbg0w1UJ/9aMw7+GXDl/Pdgpfhoo4ves
         Kk98pj6+GMQZseky/KCOPWmYCa/mv+O7po3nf8+FzV9R+7Om2Y1uIyfCEyxgSoYWxZ2U
         JZxVTXL52s/Q/w+vTOYnK9BfuI0SEjScZhD4xJc8dfHPcZwp7Gs1KTZRMTVqN4Poxoyu
         QpYw==
X-Forwarded-Encrypted: i=1; AJvYcCXzqe2CP2bQ09V+SmGq4UATQrliHEHBQd65E0LDV/mblfqnW6Jsj6H+qUabBGf/SJFlIp/DUC3PS9k=@lists.linux.dev
X-Gm-Message-State: AOJu0YzvGdjYpnHl2BNrmPbbobV2fFvGeQ22e3S5qCcFe9G4B111xkbg
	//eZIc1hvl4LVnN6hCn+/yF9AQvAW2Z6/rOCCMa1hW+0APl3ayp2W2M8FVLaiFw=
X-Gm-Gg: ASbGncsH62KoqLRCqpsdqjpdBC7NO/I2ukH+X58vT5huy+zsnITVKXQmCdUghzk40Nx
	+RiRdvjZAltVF9IJoMu69bLFUGvRk4Sxo74dEMm6/DAl+RMqj4qTrEmtGSi6ME1yx8vK9gxvFNE
	9uqFH5OgDbHXzpywS6WB3VSmGo+rB/rw2slZBR4uhVv98oM9l9KF/5/BOpR0iGJNgEbg9aD1HkM
	Z/jWXzyUdGWUyEeHPkc/xvvfoDiviuJgAW/68NBCFyCj65as2bWm2Dk9BmyRtr4m1HIL3pa3HLl
	hbp17SnOAoYtzHvWTjrN
X-Google-Smtp-Source: AGHT+IG2SXcF4PIOFt5auO85FS9zRjRm6NOHqFx7weXaZpffy9LXIlLj0obu51PQsSDcJNxzGgfzHw==
X-Received: by 2002:a17:902:d4c2:b0:216:7cbf:951f with SMTP id d9443c01a7336-21c3540c3c2mr446009945ad.21.1737659718665;
        Thu, 23 Jan 2025 11:15:18 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da3ea3cb2sm2504645ad.90.2025.01.23.11.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 11:15:17 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 23 Jan 2025 11:14:29 -0800
Subject: [PATCH v2 1/4] riscv: entry: Convert ret_from_fork() to C
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250123-riscv_optimize_entry-v2-1-7c259492d508@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3438; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=rV9JUhm8W3Bx7rnRIzGCq2bwJctlTEtmatZOhNjH0vc=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/qkqU4bH1vsaOoXfbtU9PKcyqX8u5nCrfamCxb8XNO84
 3F/rd7ujlIWBjEuBlkxRRaeaw3MrXf0y46Klk2AmcPKBDKEgYtTACYyYx7D/7JZL6QSpG+/tn7M
 tHuvVoGx/oP5C9li10eJRKt/98tX+cbwT0VkvX7C6hZ32+LpFww03t1g7uk5G7C/++3uww6euT+
 XcQIA
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

