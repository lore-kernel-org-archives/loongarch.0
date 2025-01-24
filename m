Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACCD1EEA44
	for <loongarch@lists.linux.dev>; Fri, 24 Jan 2025 22:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737757895; cv=none; b=ouNgHVhs4tIk+YrZhWTHRaGNzvEoKnz1YIITT5oNvHR/RHNh7/j7ufVZF0ebO0784SGgTF2X5h1y+7pZtVQN2+CxKKdb0GMLAxGlqlnUKcYIWfFC7AIYHqQS+Gn3LrqSAVT26KhbQN7MYFY1SINp6sXy9vYY5I1Xm/is5G+x24I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737757895; c=relaxed/simple;
	bh=sNZ3kRgQB3K0rJNT54yR9TpYcWCb1xtle/FG6x9msOc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eN5VNt2AY6JvTxkQ6lS4d0ZD5LMgeNypOaDCbABcCaHK7inHSOFQYFToON/3s4gDwCyFdYdvtQn02NFygIMjvUExD383OLxJPFiahnRYJnUcYtqmvgv6fMCBEB6+290lUK7AVIpO3BgHqpZfeihMacJil/P9Ufq18cozp+beQm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=q7XArpOH; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="q7XArpOH"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21bc1512a63so52571515ad.1
        for <loongarch@lists.linux.dev>; Fri, 24 Jan 2025 14:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737757893; x=1738362693; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OT7EL7aXHj5Qe8OT6w++iL8CLZKTuGLA5KeWTFGIQzY=;
        b=q7XArpOHPnn7a/rOyaURvRk5rpFwoPMU1ME728mbfWjvbJBEDp6RyjO+fJE8pwZnj6
         /tY0pzjX+FLkNgw+n679DzKE2r3m2icM/6ef8Yt4RCdQ36zbm1Y/5Q/yDsW0+PCcfHkS
         +lTNML5yjzk5Cf+pB+mJg9bK1YUkjETCbaZSnSABnmE4Vyo9//ajTnrUBab8HsZPGIb+
         AGnNELlfPD540v9ysJ+1ZIMI3y5gkqE6/DCk0AG71KBbXvvfgS0fBjeHm85YRnjsB3lB
         A8JzsAHuw3hag7SK4UHvQob+dy9Ym1ZIu2s+a4H08ev81uuFBCR59FnNqqarEuO5SpP8
         8RHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737757893; x=1738362693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OT7EL7aXHj5Qe8OT6w++iL8CLZKTuGLA5KeWTFGIQzY=;
        b=FmyZFPV6TaV8oyc1c5gs6FeUkq1B4AnMIRbEXGcWCr/akl5wZHmzsx+pQp/Lwvr/kz
         smacjBWzZqqq0k0DaPt7zp/G+orzUQqiZ4s79xntBhSS4Gte0i8QoXOjozbOmg+D1YwF
         AOq6ixjRErA83yQshTPuf1118YYl99lElcBt0GX+G2vOcyxYX7F/bgJFIChdnwmhl6dN
         vtrgwFmPZCxSPQAKitEy41BpwSVNVL6uz6PH8dlqPDY8zGRiFhTN9qRMruz+lIfbmdx2
         B4OMtyCHgXiheUojVvYUW2YsM34OJIoXJnsP8wIPq4ZN2Ji0R1tsuOSev6B/srCxSbhF
         jADQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGns2fFD9hD2j10mD3ePrwqGZIUlNhEOj2MU5vP0sd4AmbQU7m2y/7ggOu0z16m+1WiE1B62eZzMw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3iSLhK8CBNiYfzWgmlCtUy5zhWOotzkrhUp8tcYu4gIObrNka
	9Kl8yVM56m8nJkgpj7Q4lpZZqfFmlZZKwt+m4eziR24eXrfjHiYVz4PggTOFQq2OIuJUG60ytVR
	L
X-Gm-Gg: ASbGncsGWwbrne8psO5JZkpSxSzNcZiqvC9eCZ+OupCOOd3fAbF8oHPpL8e0i1/+J5R
	HnKi+uTtt+8morazggvuL1xuq682IiBxQg+qFjoiIg9aUK+mRkhFoqaOcIXx094sCdaQiXmwtM6
	XEXcuVLWADldFrEMmD25HlohXsbDapwdSTn5YzwzOja7JOe9FZ+L/EU0+yxAgCkGyX5jkuLsU3p
	0tX9E9fed6bpuUg/h8L4bD/8v137lCkWjUkhUof3r5Eyg7fLvBXhGR4KJuo/xaajFuRd6OPX31o
	McUI0gs5wKzulQUsW57zALhJpyXTKok=
X-Google-Smtp-Source: AGHT+IFXK5F2oZ/QyolwaGkbszhQMrnQEgQ/zkG4vY/tsUK75EkmfNWITMpNDa0U8tOC37teAvGGhA==
X-Received: by 2002:a05:6a20:7f89:b0:1e0:dc34:2e7d with SMTP id adf61e73a8af0-1eb214650camr45666065637.5.1737757892796;
        Fri, 24 Jan 2025 14:31:32 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a761150sm2397183b3a.119.2025.01.24.14.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 14:31:32 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 24 Jan 2025 14:31:02 -0800
Subject: [PATCH v3 4/4] entry: Inline syscall_exit_to_user_mode()
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-riscv_optimize_entry-v3-4-869f36b9e43b@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5145; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=sNZ3kRgQB3K0rJNT54yR9TpYcWCb1xtle/FG6x9msOc=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/oUkT0VfqffFouuyp4Vb3LsoMOtgw9+zgvqmDWt7m1u6
 uptVtNOdZSwMIhxMciKKbLwXGtgbr2jX3ZUtGwCzBxWJpAhDFycAjCRxYwMXzjKHDiO9HEpHtJd
 XMe7bKfCOlUBhU239h18IyXnPImPmeF/4OP5x+crPrF0lYizMbt4ZOOWJwxbIwtsblh/klvlYbu
 dDQA=
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

