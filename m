Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDA51B78E7
	for <loongarch@lists.linux.dev>; Thu, 23 Jan 2025 19:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737659726; cv=none; b=YU+q6TP2UU88lPjljnd1Iyr0bjzGZdcIniMdAbFfYotvzfLOlyImxBQ0gAJSnAKA8y6zDqFDQx7ei0h0SwgxtGk8exVvBGKnlYQWLYqCSnIoCSi4AYOVzGdwTkJY65Wjz11qPpchuQ0CS6YX+Mw2aKyUoBmk1GWiuXghKasPXXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737659726; c=relaxed/simple;
	bh=sNZ3kRgQB3K0rJNT54yR9TpYcWCb1xtle/FG6x9msOc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DOI23GeXMWLC282f3rqFGUSiY+zzyeioejhaeU68IIeEHinz9qxvLsKd3DVE6NfxTwZ6dQjlGUBdgZt1vY+b8zMZKoz4zTshMRhpze6fEoB9VhCVg/+0gzqDT2yetTQ8oKbQHkVS12uAgkzC+K+gp1c1N5ZFol8AWJwRwNZwZr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=VXrQRfyZ; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="VXrQRfyZ"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-216728b1836so21346485ad.0
        for <loongarch@lists.linux.dev>; Thu, 23 Jan 2025 11:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737659724; x=1738264524; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OT7EL7aXHj5Qe8OT6w++iL8CLZKTuGLA5KeWTFGIQzY=;
        b=VXrQRfyZLLqiCEnz0W6xIFLEsx2lmR24AbqajI0MJys2UFmnEHBNb5u0m578bacU7A
         epRJRNqH3pAGdUZHyuqpe4UnpskhAoVGPCzEY2wb60oXD16FPnO2iPqupNDmglcQKuN5
         6xEt4UsTrd+3W870cvi2wplS4vfueow278KwWiZyVT2p86T3h/hOb+KRDbo04JxIZCFd
         5HXjzycPsf/yK0L+UmnxwWBlG01HQioUbigSqifmkEm/qH5gGS5JQ6/eotbkvrtyFeOu
         5Wf5Up430iBpziYUj1sNTdLkwcJEd1yhVnF1dduny94W22QCmoX3avTtFlS4nUdZi2Y0
         dpRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737659724; x=1738264524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OT7EL7aXHj5Qe8OT6w++iL8CLZKTuGLA5KeWTFGIQzY=;
        b=J+2Hsyii/iYP1q/v3lUzxexZZBvoKWG6XWcZPn76TNWbscqaE5d4KVqnN8kroxoDXN
         2gMKYmEQYWRS0Y2afIlYpPTf59+clvHOPuCNmSNtZoDTbWmQOIIxMvqLtRUeg3gsZczl
         rhkoJWxWAWKS/P4rImNOBapuBwNEu/umpE2+sisoaTNLdUMy7rWhwGkocq5qqRcJ1vKX
         2lk1pHR6UA3g56jNMIJ4l1k11VZ613RGnh7xf69Cu211cUCHqZkWmUHmhZPzT6OK67Vx
         N+MZHnSqYsaipyJqftONjoY5s3Mq9/swXkIw9fqd701Mr72JykLVe/cE8FMQO0+1wU3Q
         S70g==
X-Forwarded-Encrypted: i=1; AJvYcCWrbufgtMBjGK7bY0oMFgPIyJU+MMx6UGuGLIptgRrE5pMOZA1FWrb1MBQuJXenw8eB2DVcNkCI3z8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwezgDqDVcnwgrJ6ZHBKRTpJJVSRhDk/h3tWoUy6b4BrujXAzxR
	20UYvefdnmzAGoZyze9shNJzV6Rcg//4YTcxu7b8O8ChhBWXHBCXuJNU2aGgRdA=
X-Gm-Gg: ASbGncuGGaTLqwgG7/vpVjtWNJdZ5KAOSLSYINq0DcKZc7OX316yHR/qR7wOva0tCEq
	9z044bkySiX4aLsNDYpGyPz2sgfvqSTo7l89JWLBsCA9q49mk7eItOh+dSPCD9GeaHMNKsAczU+
	movsISe+uNh02Q1YgHfWAqMKC/fZwATGh61Q91fMo9+t39X2KsfROHRIvQ2jd2sPJMaDmvju5PP
	1RNYJBQnA01ye7YLSNJEkgjJ2ZPeDLItoCEzH8J7AfcdLU0U7LJrcUIdvKuPNSRQP3FsjmXAKcH
	TgQrCxAWjvh/PTCeQuii
X-Google-Smtp-Source: AGHT+IEYNOhlEJXPQBtWi85GhJgHV9Yrk3PSdmPAVSOzqlnq4qLhaCE8KgNu8jpQHMIt2g3t9EdDpA==
X-Received: by 2002:a17:902:ce0c:b0:21c:e34:c8c3 with SMTP id d9443c01a7336-21c35540560mr481214975ad.24.1737659723835;
        Thu, 23 Jan 2025 11:15:23 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da3ea3cb2sm2504645ad.90.2025.01.23.11.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 11:15:22 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 23 Jan 2025 11:14:32 -0800
Subject: [PATCH v2 4/4] entry: Inline syscall_exit_to_user_mode()
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250123-riscv_optimize_entry-v2-4-7c259492d508@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5145; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=sNZ3kRgQB3K0rJNT54yR9TpYcWCb1xtle/FG6x9msOc=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/qkqU53TuRtTHj3fNe5lfPyE/IEpc/3RlRNFXlhaxe/Q
 9wmfbFCRykLgxgXg6yYIgvPtQbm1jv6ZUdFyybAzGFlAhnCwMUpABNZZs/wT7++1v5d9o4WnqBP
 p6Tbpq2w1IqbmD7lttHvQ9uM3U10tzP8D1grdbP/UmxWhqVs6beLTJv/6C04VHugw9nyjL1s4wE
 rZgA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

Architectures using the generic entry code can be optimized by having
syscall_exit_to_user_mode inlined.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 include/linux/entry-common.h | 43 ++++++++++++++++++++++++++++++++++++--
 kernel/entry/common.c        | 49 +-------------------------------------------
 2 files changed, 42 insertions(+), 50 deletions(-)

diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
index fc61d0205c97084acc89c8e45e088946f5e6d9b2..ee1c400bc0eb0ebb5850f95e856b819fca7b3577 100644
--- a/include/linux/entry-common.h
+++ b/include/linux/entry-common.h
@@ -14,6 +14,7 @@
 #include <linux/kmsan.h>
 
 #include <asm/entry-common.h>
+#include <asm/syscall.h>
 
 /*
  * Define dummy _TIF work flags if not defined by the architecture or for
@@ -366,6 +367,15 @@ static __always_inline void exit_to_user_mode(void)
 	lockdep_hardirqs_on(CALLER_ADDR0);
 }
 
+/**
+ * syscall_exit_work - Handle work before returning to user mode
+ * @regs:	Pointer to current pt_regs
+ * @work:	Current thread syscall work
+ *
+ * Do one-time syscall specific work.
+ */
+void syscall_exit_work(struct pt_regs *regs, unsigned long work);
+
 /**
  * syscall_exit_to_user_mode_work - Handle work before returning to user mode
  * @regs:	Pointer to currents pt_regs
@@ -379,7 +389,30 @@ static __always_inline void exit_to_user_mode(void)
  * make the final state transitions. Interrupts must stay disabled between
  * return from this function and the invocation of exit_to_user_mode().
  */
-void syscall_exit_to_user_mode_work(struct pt_regs *regs);
+static __always_inline void syscall_exit_to_user_mode_work(struct pt_regs *regs)
+{
+	unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
+	unsigned long nr = syscall_get_nr(current, regs);
+
+	CT_WARN_ON(ct_state() != PERF_CONTEXT_KERNEL);
+
+	if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
+		if (WARN(irqs_disabled(), "syscall %lu left IRQs disabled", nr))
+			local_irq_enable();
+	}
+
+	rseq_syscall(regs);
+
+	/*
+	 * Do one-time syscall specific work. If these work items are
+	 * enabled, we want to run them exactly once per syscall exit with
+	 * interrupts enabled.
+	 */
+	if (unlikely(work & SYSCALL_WORK_EXIT))
+		syscall_exit_work(regs, work);
+	local_irq_disable_exit_to_user();
+	exit_to_user_mode_prepare(regs);
+}
 
 /**
  * syscall_exit_to_user_mode - Handle work before returning to user mode
@@ -410,7 +443,13 @@ void syscall_exit_to_user_mode_work(struct pt_regs *regs);
  * exit_to_user_mode(). This function is preferred unless there is a
  * compelling architectural reason to use the separate functions.
  */
-void syscall_exit_to_user_mode(struct pt_regs *regs);
+static __always_inline void syscall_exit_to_user_mode(struct pt_regs *regs)
+{
+	instrumentation_begin();
+	syscall_exit_to_user_mode_work(regs);
+	instrumentation_end();
+	exit_to_user_mode();
+}
 
 /**
  * irqentry_enter_from_user_mode - Establish state before invoking the irq handler
diff --git a/kernel/entry/common.c b/kernel/entry/common.c
index e33691d5adf7aab4af54cf2bf8e5ef5bd6ad1424..f55e421fb196dd5f9d4e34dd85ae096c774cf879 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -146,7 +146,7 @@ static inline bool report_single_step(unsigned long work)
 	return work & SYSCALL_WORK_SYSCALL_EXIT_TRAP;
 }
 
-static void syscall_exit_work(struct pt_regs *regs, unsigned long work)
+void syscall_exit_work(struct pt_regs *regs, unsigned long work)
 {
 	bool step;
 
@@ -173,53 +173,6 @@ static void syscall_exit_work(struct pt_regs *regs, unsigned long work)
 		ptrace_report_syscall_exit(regs, step);
 }
 
-/*
- * Syscall specific exit to user mode preparation. Runs with interrupts
- * enabled.
- */
-static void syscall_exit_to_user_mode_prepare(struct pt_regs *regs)
-{
-	unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
-	unsigned long nr = syscall_get_nr(current, regs);
-
-	CT_WARN_ON(ct_state() != CT_STATE_KERNEL);
-
-	if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
-		if (WARN(irqs_disabled(), "syscall %lu left IRQs disabled", nr))
-			local_irq_enable();
-	}
-
-	rseq_syscall(regs);
-
-	/*
-	 * Do one-time syscall specific work. If these work items are
-	 * enabled, we want to run them exactly once per syscall exit with
-	 * interrupts enabled.
-	 */
-	if (unlikely(work & SYSCALL_WORK_EXIT))
-		syscall_exit_work(regs, work);
-}
-
-static __always_inline void __syscall_exit_to_user_mode_work(struct pt_regs *regs)
-{
-	syscall_exit_to_user_mode_prepare(regs);
-	local_irq_disable_exit_to_user();
-	exit_to_user_mode_prepare(regs);
-}
-
-void syscall_exit_to_user_mode_work(struct pt_regs *regs)
-{
-	__syscall_exit_to_user_mode_work(regs);
-}
-
-__visible noinstr void syscall_exit_to_user_mode(struct pt_regs *regs)
-{
-	instrumentation_begin();
-	__syscall_exit_to_user_mode_work(regs);
-	instrumentation_end();
-	exit_to_user_mode();
-}
-
 noinstr void irqentry_enter_from_user_mode(struct pt_regs *regs)
 {
 	enter_from_user_mode(regs);

-- 
2.43.0

