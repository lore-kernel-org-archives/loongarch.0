Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00321F5EA
	for <loongarch@lists.linux.dev>; Thu,  6 Mar 2025 00:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741221854; cv=none; b=o5RCQzkiCRMsK4l+8beN1PwGHKnEWYMi50ibDQwJhovhaMbqy+suRFJiqldOM2so7LWfcMovnqR+xe4zP99SLgEoR7izYQ4M/B3qYNOw8bnQxCK9MkNj7o5SrjWn2MBCky3+L6gIcHt5WZgOcEGWR54iFCwYEYwOTYgkheUoWGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741221854; c=relaxed/simple;
	bh=j7ZO4FXV1Hf14yiJt7JLsFHCp0FLrXbd7xunBuFQ9j8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GF3ObsPwayTlgYbgKgiA9FkRo+og2dRN1oE2SyBwW5IBcmMMoS/OyO/lEnhVqGCMfxoq6EVfYKBN8prh3JAAlSJtdy5jBkR/CEoHs4gEQaUzNu5SYAoWouhbVFoacGzChwCd9S8TXYqkmXXSVpAtNkzoZZ6fE3/KpkbKzloUPuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=SDpzQixV; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="SDpzQixV"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-223785beedfso842075ad.1
        for <loongarch@lists.linux.dev>; Wed, 05 Mar 2025 16:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741221852; x=1741826652; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p30t3bidsL8DH7wJ55Ht0+lyyt5ZTgdtBsNdg8zXD0s=;
        b=SDpzQixV2CLkM0Px9PXqi1I+LsNuhHGGEFMdwXgiD1l6fFQ8MyM2yHI0q/m/R3aLBa
         vpnzDHM6u0+MIoXSCBxyM9IXEQ6/dYTdE4Qv0ecdkPz2DacloBPrDX/UFmcSiUiTngCw
         CxbQjjI9OFIspe9i0wPvCGKOZLpsTW4Ip+s2DeUTo7tlWr7dbdAzcO+PwCIan+IUyekN
         8KaCnMzgNY2z+ZSZptTgLtcX/cRR8qCrkOf6+JxcW1H8ACg/ex8J0IPnJTuioO+Megrm
         CUWEeBWKaRTEhL8BXk9CGerAsxAL4V1PLvudhEQXOUSYoYeNsA4o+SB7GfA5ujNPhuVG
         droA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741221852; x=1741826652;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p30t3bidsL8DH7wJ55Ht0+lyyt5ZTgdtBsNdg8zXD0s=;
        b=Pz/3b0pN4nNicOehkOczZsmkVx/Bb5nTqPXKBeB6p7RyUv1x33wlDHkEL5DjwWYKJU
         ELZAzOyv+RTQ29Ao80plLQGq5IV6dmx1QQPLT9Ru/+zSMLnYZelGl4Oswp2gVRo3xCMg
         /bY6BlXkFJQYk5IEaHfaMLdf4AnfjTRaxBOF+Tybc+4beT5+ls10AaGiZSZrGaLkeU9Q
         TomC+ZuF4BQVkeTV1OTyPIc67+1Bkr1W/gIdHBz8ACQN7D0LK4+MvxlLhCMrUjLm1SDk
         uNDWCsu/oqYkcJlfDnkvK1HRw9+6vEwHJgUycA+yyT+6cNAfAzfBmZ3HgsQNKYUPRNmk
         R9EA==
X-Forwarded-Encrypted: i=1; AJvYcCVs+TFupQhJXc/vE5OE3UYSSrRdolqWqyvIzmqEJokwdWIw8VTBV2sHyii1AM1kEzJeC7T9eUGiWcs=@lists.linux.dev
X-Gm-Message-State: AOJu0YwBUSyEG0kmP4viWNCad8+t7ZRaSMXHT3TdwC+Hc5ck9CSL37BV
	NV4Vf4tWuRp0sQcDOrnRLH0DiJ1yr6tancfCRjLsxInEAO057ntrGj1sgieEt8jda7praxgRCvr
	b
X-Gm-Gg: ASbGncvCsoqpAlHSXoNXx07X3ZsDLphQnAa3vaezsblt+UPnWyDyZ3cZP588VW/Jnen
	+hcDttJOghmuHY/QD/Jpk80dFQmtQqdCsXY9flBCgA723UN0eccYG8c7nHVZCmZtkDo4Q/UJjki
	3l2nfrHQuuSFgw7ln5WKlfNFjFvRRX2rNeGcp1tbSvqStg6Wt/MAUWoLqoU6B9xifRP1LhQFwWh
	fA8gLdHXdy2XiucvGeoVDipsVBUuDb1daPNgEijfTnteqwVLT4l8k4vHzK3brT79twWvQinPHHA
	Yp2xA1dpzJUXdu4CSpbmQtbM86wbu+ZSJM3+rOvxOzsck5gE+0iMHgta25MV
X-Google-Smtp-Source: AGHT+IE3udje6D9ToJozjElnL03nykz3gt3O3YbFzCSzOAeX2/0ggHbBiX1+w1/L3X8PtcJZLOlRYA==
X-Received: by 2002:a17:902:d549:b0:224:3c9:19ae with SMTP id d9443c01a7336-22403c91a6cmr43245075ad.34.1741221851852;
        Wed, 05 Mar 2025 16:44:11 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410a7f7efsm347085ad.132.2025.03.05.16.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 16:44:11 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 05 Mar 2025 16:43:47 -0800
Subject: [PATCH v5 4/4] entry: Inline syscall_exit_to_user_mode()
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-riscv_optimize_entry-v5-4-6507b5dff3ce@rivosinc.com>
References: <20250305-riscv_optimize_entry-v5-0-6507b5dff3ce@rivosinc.com>
In-Reply-To: <20250305-riscv_optimize_entry-v5-0-6507b5dff3ce@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>, 
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 loongarch@lists.linux.dev, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5141; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=j7ZO4FXV1Hf14yiJt7JLsFHCp0FLrXbd7xunBuFQ9j8=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/qJ95d9ndq3LQ44de6FoLjnP4Wflp+6lvkeeNEuvN8vl
 k/soW5mRykLgxgXg6yYIgvPtQbm1jv6ZUdFyybAzGFlAhnCwMUpABNRWMDIsEH+59MDmer/fzAU
 vvxYZjyFw/HQm6w1f54Er/xks8PGu5mRoa1Us0Hzc7CdgfrJc8aZ75wz9rt7hrUu4uo1/VOqxcH
 FAQA=
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
index fc61d0205c97084acc89c8e45e088946f5e6d9b2..f94f3fdf15fc0091223cc9f7b823970302e67312 100644
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
+	CT_WARN_ON(ct_state() != CT_STATE_KERNEL);
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

