Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E881CEAD8
	for <loongarch@lists.linux.dev>; Wed, 22 Jan 2025 22:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737586622; cv=none; b=Bp2doQiWg2xJgobrdUS08Hxwx4C3Ah+piNDciDVqWvVXQQbZnYeU1YVj5OuxlzdUj6vf4IrbhbZzQi+K7yHkadaD266KzUGng9CHau2SICeh7ZwRpOGzJMdWk+1zY/a4bVhj8lEuzzT8c+EYtOaJkbC9sJxowqUb+BIkbS4YYeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737586622; c=relaxed/simple;
	bh=Z1tS2IEfH8NjFHjnsgjlU412ZTPZo9IgZRJ3cE9Ze5k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ux8+vlflqd966iX7mh99/kyu7Q7gvSGMsf7mGMJfyPofyd4gDsfxDXFJxV1hJeQZHb+ADJJu7ct2l1XC+MfTW4WFawCNZG8cLAAw9gAO77nkFV5MNqTqzhsexyueRShdqU+4YaL40wI0qPJU9051aczz/SpiLyK06chBh+ShFWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=jwoVxqCs; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="jwoVxqCs"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2f4448bf96fso492276a91.0
        for <loongarch@lists.linux.dev>; Wed, 22 Jan 2025 14:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737586621; x=1738191421; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HCJijnh3eucUGl1hsJuof30/Y1t6y46+I+a/ErqCn/w=;
        b=jwoVxqCslqyMiHbFcSxaxXLi15xG845E0kgRPf3fAx515A2Nmc/iOstN4YIz5SW5ZT
         gg4ve97SJZ4QfxftHMnFV+cGMK8HgBTJISxuNsdytJosNzsNcOg+t+jkzZWt2ka1gdA4
         +cDOfzqByl23iOYE6F92gTZX7HFmY6ADZCUVrDByL//mu38Bh3Ltm14lf18EJyk0dNg6
         iBD4dpc7KHfUUqfO9QVZOZOC/fXgSmEC3OyzznEx98vM1/zpOvf4qthvWPm32lj6cPoO
         tck4U/sUKo+3uMohq4ZlxZiVlnV+qwzG6vP1AiZcYTyX0mkJhI7mUZF5f5BDQRQlIRaN
         3uOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737586621; x=1738191421;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HCJijnh3eucUGl1hsJuof30/Y1t6y46+I+a/ErqCn/w=;
        b=ms89qadB/Xd5EJs1dZ2kzzJVex3SlK/YqKPiFGQ94WV+0yT6UI+bD7IO7Syre+Bb9T
         QagOXJMB/FXitYoihQefPrgIITnFQYOd58Nf23TAnT/Tn8J5u7nDFY1i/Rv0xHmRuLg1
         Rpz6mgI25qp9huHetFoFMZusZcnXDKag54yDw7FumOuukHtRwuD63vCpuzHCY+1SAGDn
         RKWOwYZQarxRgfgdYhTCyPDWIq6AmMMwGYikwZjbn87/kO4TIuvmQtdbeLoAiaK8sB7s
         2O8kRLl4xF3085E7aS+9I3sF6ZiY57ZAURVDiUt13U04Zbg7ugvEBTkNbaekJ4/S42tC
         IpzA==
X-Forwarded-Encrypted: i=1; AJvYcCXDjr6pqzdom4bAGpqDM+VHJF6pAkRfUbIf/r9djyafLn3ESxAE0UTLu5FiVTr+McgKahec4f+5LT4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzrl8ZvNY/4c149eRnQDs8l5myePNtIJf2kriOj8S1+Ju8wHBvx
	/VtkdwGuRr2ZB+VfuWI/7sSYF2rHJOqHPAPSSNkoSExP8NlrhMHlL7wTN15KVbc=
X-Gm-Gg: ASbGncsN+IPUHkS8jnIewyolJLtoMCZZFUjrg+tCx8tfv6yaQutJsVoVK6Ad0IW2Gv1
	Voi4GiOHcbHTXqpe/S8RfHZxm9onDG51iSFrIGBDh4f48D+LXsYzkx5rzB2KFR7z7sy1XkZBJsj
	Bmkht9KJbuKL0FEynKwPeWmM/jGfvuH7YldijIATtnOsWVgcGaCayXhOy7J1zwSO6QfOWx3Ahry
	MHWgXCu656XAZKZG1wjH0C/VSAugczbyo7eYWqEclcmQjaTNkULn2WGdRUei6bEAMMUZGIfgM8s
	CXxyujy2hw==
X-Google-Smtp-Source: AGHT+IHS1l32r3sB5S5xxvBnREu6zfuZQuMS6eKu4LrFATLcIt6SklxYU1mGoLAC7M2MGJdnMK+c1Q==
X-Received: by 2002:a17:90b:1f88:b0:2ee:db8a:2a01 with SMTP id 98e67ed59e1d1-2f782d5d838mr33980210a91.30.1737586620724;
        Wed, 22 Jan 2025 14:57:00 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7e6aaf3b4sm2301375a91.25.2025.01.22.14.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 14:56:59 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 22 Jan 2025 14:56:23 -0800
Subject: [PATCH 4/4] entry: Inline syscall_exit_to_user_mode()
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250122-riscv_optimize_entry-v1-4-4ee95559cfd0@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5140; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=Z1tS2IEfH8NjFHjnsgjlU412ZTPZo9IgZRJ3cE9Ze5k=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/rE8i1Xrbq3yFk9XtolEHc+YPPKS4zHdLyPbp1l/T3K8
 ibjJu3nHaUsDGJcDLJiiiw81xqYW+/olx0VLZsAM4eVCWQIAxenAExEo4mR4cTqzcKbngRY/JjW
 1KZ9LnmP/3vOqTsu/eEzCLYLaWh9uJbhr5xYRZ/aZPPgR5fkV/YHnnWcJf2O39WubLv+9xcTFs2
 W4QIA
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
index fc61d0205c97084acc89c8e45e088946f5e6d9b2..a46861ffd6858fadf4014c387e8f2f216a879c25 100644
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
+	CT_WARN_ON(ct_state() != CONTEXT_KERNEL);
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

