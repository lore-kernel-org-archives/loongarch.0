Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2404207DF4
	for <loongarch@lists.linux.dev>; Wed,  5 Mar 2025 23:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741215650; cv=none; b=R2iBx4sgNdKMXK4F33OZ4VX45vgJhqXHqxMlwthfGoCY2Eh0LpxjxZla6gLcJmnICDXuM4VxtoVgICRZRWo/uug4Atks0Tiy4/G5L+Bl2gSVZWuw7rQsJoV6TvFnr+0BKYBtItjblqGRepTncRfxuyOz4+WHlbNRVCDxVTOu4Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741215650; c=relaxed/simple;
	bh=j7ZO4FXV1Hf14yiJt7JLsFHCp0FLrXbd7xunBuFQ9j8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YQ9p9EE0j4051mqombEQpB3YZWg9y5AdVQarciZ6j/mkNZGX9uGsj4OIHLW9p6i+EBmiXe/b/Dq4WIPBXgZfv2ALNMQMsW+sg35TXuXTNfZA3JKgZ8moILLBUceWZLvUSIOJ7doI4CiWoBKPSyzJOl4rzgEA3+zUjVZoOeO+UPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=qRtDoCNU; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="qRtDoCNU"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22185cddbffso24814785ad.1
        for <loongarch@lists.linux.dev>; Wed, 05 Mar 2025 15:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741215648; x=1741820448; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p30t3bidsL8DH7wJ55Ht0+lyyt5ZTgdtBsNdg8zXD0s=;
        b=qRtDoCNU28OjPfmzb4ysC2JsA1pqCQZa0271TTVH/Py/aB0YyxqztdLxddMUJWjs0X
         rQ5GEAb188PXbZhKjk5vFNEfDSABQ2S2KSYVlyyTaKkCfV3slU3hFg6lwBVA5RY+0TaU
         7a5WSJOfi8nkadGnLY+x1FH/xfNvaf/RbAwEiZgOiJkaGJFBin/hudcoNta3bVB5RWdT
         qJvDpPOysTfip9NNLM7Mxv9yecOFidlSmcbkyerO/KXDRXbt6vMtzwrYLfv+8+tA/YgK
         OYW0E0FNIqm2L9Q1SJhCTD5C4BEsF4nOQrINi3CfA3otCyF+4AtXwQ5orbo7zu1OOjIA
         zWVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741215648; x=1741820448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p30t3bidsL8DH7wJ55Ht0+lyyt5ZTgdtBsNdg8zXD0s=;
        b=X8t5A89+2itxrstwysBn73lwFWgN4ZF8yf27fZBBbbl67zreOA3wyyVPWkv63HRto2
         1ahC6HxTJRBPgSiCqleeEzhzGBWFQ+SKAK+CnppxmJuLLNgx3kVPzY4ZbPfiIAlUAASn
         e+Agxe+SrWY6n0ZFRc+GkmZBWeqtbNdQCYwd5dKrVNRcwyKE7KRELq8+xFbgU1EqYenH
         dCFcdqNvqzS6HxbAIDUTpykOhylqveo+UPQ27m264mWJs0FHXmhmvtwKxifiygGhUxqX
         EPY/X2x9vIaOle17PaekFDOgGgcho1k+3haTpieuv7CbEBLYzOh7jMPIk4fq4+haRLsl
         U35w==
X-Forwarded-Encrypted: i=1; AJvYcCXXzqThnJRm/6IdSNeq+5rIPVOjVsAVGRPRwyjByz22hJS680Pvw0jQNBgj32bQjehRTG3easkAKJA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxjPCItL47I1/i0HvO8el27uPjvmINv4ZvP38vLvgIA3RThjnZ5
	HHQQNuQdJLkMRNF+qY6m6GCebgNQW6bymDeU/BUjuUruc5Sjof62Wf7uijGhdgk=
X-Gm-Gg: ASbGnctiPrk6QTfTsMB/3QMWAzPDvSmxMl38AYGhazkQtMOHSsRuQsfcin6xPWol51I
	PYBMDWGjdsPvgSz5XkP2k31d/tojoGQcJ1PbpNi4uHWVBqv5iRR62RTft2VIGcJ73NfljnGSKih
	L/mOV7cBNyzWeu4H7TwlSB/Ow3yCZIUht/IPIo+1Wf0yLfogXvN1SXglB9JTwEqxkQ+IQLCLWaN
	3rRMtCqy42bWaw+J1Aca2JIyXhvceU94XKkydiEIPqoFNwh9waseawVIQlIaqL7kxBd8V+gp2Gz
	wi1cN+M78g0iyKQ+/dck34RFZz3JXinXad5EmpSr1njrSY0i8QN39mA90rOe
X-Google-Smtp-Source: AGHT+IHIXuq48FCG34gQSDWE/fOeG6ktun6hvvxw8iNV8AUnzyOAu2vvj3lTw8zV66HwuuHt9MjAlA==
X-Received: by 2002:a05:6a21:78a8:b0:1f3:3547:f21b with SMTP id adf61e73a8af0-1f359b16c26mr1515464637.5.1741215648040;
        Wed, 05 Mar 2025 15:00:48 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7dedd22esm10593413a12.63.2025.03.05.15.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 15:00:47 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 05 Mar 2025 15:00:28 -0800
Subject: [PATCH RESEND v4 4/4] entry: Inline syscall_exit_to_user_mode()
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-riscv_optimize_entry-v4-4-0d81bb45203f@rivosinc.com>
References: <20250305-riscv_optimize_entry-v4-0-0d81bb45203f@rivosinc.com>
In-Reply-To: <20250305-riscv_optimize_entry-v4-0-0d81bb45203f@rivosinc.com>
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
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/qJ69OP3ch+/m7/lUad2VUJDPL51ybv0VH/nvKC5SkLh
 xw7y9trHaUsDGJcDLJiiiw81xqYW+/olx0VLZsAM4eVCWQIAxenAEzEjonhv4vXQjVhvjLJW47v
 WI/u84ud+Gj1tLXqLWe8m6Py1dcqMDAyrDtzKpZ5ai7br0NPPZ1Ktt3U837x7/vCZP99nPvecaj
 08AIA
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

