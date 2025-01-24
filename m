Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D21D17C
	for <loongarch@lists.linux.dev>; Fri, 24 Jan 2025 22:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737757890; cv=none; b=RHR7uRAeIftPV3ZaMoiOXkVa6p478Sfg2OG6Pnw52DiMJmw42viQeZj3pnaUUmjSdZ8AJG6upnOo39x7BT0emF5o5V5RCIQFQbx95dYplMeubvO2IP1fj6vsKv9OuEr3R4GeDlMTEpsdQzVZRgCdh/6LhOjHTOoC7L9o3pMAR1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737757890; c=relaxed/simple;
	bh=e+QmdYfzdsHe2i47iJnp8obSLIn3fW5B1Uv/wF/582w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=liuvrGwdvGMv+UxhzGcQLGXlAITp9/VNA9I0UJA3A8EM9KvY42C9eLWm9DQPMmzvtJalKufduCPFDbvQQZ0MwYMCq6JEBPyUkmwrWbovSuFlYaY2rqu43voXH7sn1TCNjlhtn+RT8frjL9F1LqCx07zr/0K/QqxCpAuFd3AmJgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=KJN8tpsZ; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="KJN8tpsZ"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21bc1512a63so52570615ad.1
        for <loongarch@lists.linux.dev>; Fri, 24 Jan 2025 14:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737757888; x=1738362688; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vNOxwbh8TJLovUJ4xbmkceu/OhoInCtt14EIM5E3MZs=;
        b=KJN8tpsZbOjYy/AkZnJ9hCpTjZb8Yti6dHzgS2NC/H4rVjEefmMA+d8upMDTYp9yOu
         nZCqx8mfnQTHVAH2fHzSj7q4TvGN4TCmTxRcpykuSKz+e4VWr4XJlU4yZrka3kBqcF2o
         m5BFiXFafGYsGgMFuDtRIwpY9SQdqdJ/r5Vmv7jgj1ngJYKKl5srRGQMp+byjVE3qil4
         98t0XyOpQPzvFp5s57/EuksHNXzzAXo/MGoM7vn8brFMk+FmG+MwcGiKkGAVDkVlvE+G
         F4bXJMZRzOSon+Hs43zwCIpk/3M25WtlH6Y8zMlwUCm3AgrtUNSywypj3PtZdWR22BR4
         WLkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737757888; x=1738362688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vNOxwbh8TJLovUJ4xbmkceu/OhoInCtt14EIM5E3MZs=;
        b=BsPK5t6kHoAV+NUal+TxUgDW3tmTnEBXy7K5wTrh8Swt4wquln/1f9ijGvi65WzCqT
         s/43L6S6zZlfPpsWUJJhTb07hGaSe6HzTZgQ5u2hNbsfTGADfIa5mmAt4Na5DhZ414d3
         1g0HA7J9slPpxhjX96XQO1xKELPjFwXKoa2N7QaFjEirfn+b0FrKEzTGSolnLr+kLPRe
         5gKakgX7H29NjL06W5R8Ngi9qj7hS1to022JtxNo8E6pUajeuGsCYIAA1mMFZpeNYhYc
         D4Bg6YsszKCdkmMmSwmIZWvavVA/SC72yM3I5I3t7bYAE6YQCCrw40t6vFtBvzLNq1xO
         wmow==
X-Forwarded-Encrypted: i=1; AJvYcCVbGAEvIErTygRcBHNHKPE/BP2Id0SbSqq6qGMuJE0NiRyJmkml+FB/sA6TOz1rj7kk+7rl1Uhq4/o=@lists.linux.dev
X-Gm-Message-State: AOJu0Yymbsx3fNsRLGs4FWwrVmHSx0SVIE6MSmTc0ETmiViWMyGKHceJ
	g+cFfcTTYtdbM2y4jmWdPPwGVFADdJUE6f0E8PGH4CpD6tGq91TIDMwp42ECyEJ/2XBqVp1p2sr
	H
X-Gm-Gg: ASbGnctc52IVDlUVBlZ807TPrLM0z12TpnOYsTOim7qE3ZA4KV5I05OkSg2X9xAKgzc
	NPEjEMShGugpjdqCbI7p21C+eZAbuJwzCEQ8btSo06TquhObKuGmOj7eHtpSSGeamjlhneK0Lm8
	/2Gw2KiiHFTEJNS+iBTnHR+Q7OoQelRsIs7mrPZDqvpSjRdt0u9hsv+8xgXXVeHFeT72YN1nAzk
	Lt4mtWHq3z/unby17rf6XT8xwanDfIWD2M/5PO37ElE280yg5keD+piAEIN6k6C2kl2LTJmsrBP
	7ixI0ngtd0zx5qZObBpK
X-Google-Smtp-Source: AGHT+IE7NbObNQvQSaPZkmeR+n8U2XghXp9qA7/c1qoqbpDzuOOutMqEPF/BOHkTtclCps2IhnplYw==
X-Received: by 2002:a05:6a00:460e:b0:726:54f1:d133 with SMTP id d2e1a72fcca58-72dafa44498mr46196661b3a.12.1737757888123;
        Fri, 24 Jan 2025 14:31:28 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a761150sm2397183b3a.119.2025.01.24.14.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 14:31:27 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 24 Jan 2025 14:30:59 -0800
Subject: [PATCH v3 1/4] riscv: entry: Convert ret_from_fork() to C
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-riscv_optimize_entry-v3-1-869f36b9e43b@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3493; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=e+QmdYfzdsHe2i47iJnp8obSLIn3fW5B1Uv/wF/582w=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/oUkT07p5vc3pN3zOnkt2t7t13MSjCoa19Xuf7PhTMrZ
 mmaPX4S01HKwiDGxSArpsjCc62BufWOftlR0bIJMHNYmUCGMHBxCsBEPFYx/A8WTt5ryjLVpMH1
 TErO2sWKx6RENDf46fAGP0z2XfrJ+A0jww+e91PXpHawiKp7p8QaGc1fP/81y37mGUU9B1q3fG/
 5zgYA
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

