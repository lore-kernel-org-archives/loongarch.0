Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C20C1DDC21
	for <loongarch@lists.linux.dev>; Tue, 28 Jan 2025 05:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738042409; cv=none; b=ZLNU+Q28rpGFPRo3WvJD/cZXy1qoscEqunnq7tzChmq0c/t/ywQdeMaWKiXGcT28t4D2Gr+3YmaClpLDfVuEJrv9RG1cHdfHvVLBIOyvsIzyjHYP7tVH9qhwNQa437XzNG7K8wuJnIsAAr0zO4+4Fbtl6QE/ZXVAs1/EXD7Yl+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738042409; c=relaxed/simple;
	bh=j7ZO4FXV1Hf14yiJt7JLsFHCp0FLrXbd7xunBuFQ9j8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=muVSy99vQWW9yGdqdEooqFhIn7Tgzqh5SfcLnMuGI7CtwHo+dPXpE0IpPA+l3Tr/sWxHHIjrzOAkU7p4OcBpgjZCYfE4dMUDDHRLOJhhc9Sq5FUuk+yunnV9droX1m1IX9hDspt5Wstd0ScYpYcFaSqF0MRZwTQF4Pb1j9NvTt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=PlMC/hCO; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="PlMC/hCO"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2eeb4d643a5so9175342a91.3
        for <loongarch@lists.linux.dev>; Mon, 27 Jan 2025 21:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738042407; x=1738647207; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p30t3bidsL8DH7wJ55Ht0+lyyt5ZTgdtBsNdg8zXD0s=;
        b=PlMC/hCOX414V6iJGYmnp6XL/J/a6nLKTCXzAw8D0c19w3h6CydTKxIoumrPgtuE+R
         JlyaveGql9djXL+69XN1Hde82mU1XposCr5oMMtpbdz1hzR7q2NjgsbwKkvnymNilj9d
         Q+QYT9QOJ4qk0Alzly2EXt0B4pNWE4QPPTcDup6EiMwUfSxcoVOfdLIlAParWr5jGc8O
         ek964o6tlj/QilgZKoZ/yQ0VW1fiO0CcKw0DC6ByD03p7dRccodB25HMVWNIvRpf1AfA
         2//Lc2RuwS7HmyuAr60h3k2V1qJ3+RrpqHZ2xwFljhJV0ecz4/Jw6ISMnJfNR74y+8E+
         MI3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738042407; x=1738647207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p30t3bidsL8DH7wJ55Ht0+lyyt5ZTgdtBsNdg8zXD0s=;
        b=Y/onioW5WUru9HwIlZif6Ax0IL0zjpy3NvAGINKARwkERLEK3RuCQEK/+ZvZPzrOIB
         sxVRBu3Pt30ggYQfwvI65E8m4CkvalVyMss3A5eNfZkWav6wb0jotcUtZNmLvAwaiX0f
         XAHfdzmQJjNdyUIDWA/vVvShOz6UGaC5keME1tqrJzYgf40vUrHABS0q123OSB2QDKGb
         eGwmHqfAiEgTFytbKfu50PFKnMFNlt4lecOVmChv3apQuXdOD2czWxtkh5ZneakTEwcq
         hOcVs1HzmHAUcq/IVioRIm+O1y48jEL5hMrAT9tOxpOBOXvzRm1P0NEyjJnbwE1V7a2z
         ddbw==
X-Forwarded-Encrypted: i=1; AJvYcCWf4z69wHoEQDdYSzZU2hoKjsojYm/pEgcotAHck2eiW2DxTHZ/Kc5eU644pHysOxFcIjhhmG4avrM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzZNZ7pqaFEBDGjS2UKrh1iUAparyeq0SJTPuefh/7uv304+b6u
	MxEPLuBGtX7HyrtVwYPVE3vVTdbFgOb5Qh/GCX8ZEKVVSDKvH7ettGgwYtLOcPA=
X-Gm-Gg: ASbGncsPEcDE1Y3LhHxsmJ+2ufipk8qtV8eCCjdyqGNWa7OmJSX0rEELEE/yd5kMOTa
	TuVbMD6Njo9WSrJq4xbeZ08d5MOAJKiIhZs6meViWFVfYDZ63iK2jhL1cHFFqHdEumCkgL0VmxR
	iHTzuHVFCPCDL9vNoXDgeXKUX3IOHiYppmxUeVqxPU6Dj7m4VfBKp8+jaBme+K136xKLzh10zXl
	Mfuyv9tPMbAkYNf9n5IUeQxjksMiILaJ4dh7YgzRkTRgpLPTp1FHoi2JXlWLL1iIsbx4ZC32taA
	3vInilrbj5j6JnSpo4kGzmjCc3fzR6k=
X-Google-Smtp-Source: AGHT+IGkVxybbhmMu57xJQJzMyQwkOMbXHCtIM1pnr7yMYLR6mnolYIlXLb9ipU14x5Wd4npsIBS3g==
X-Received: by 2002:a17:90b:2805:b0:2ee:9e06:7db0 with SMTP id 98e67ed59e1d1-2f782c9406bmr66373912a91.11.1738042406754;
        Mon, 27 Jan 2025 21:33:26 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffaf9e98sm8266247a91.38.2025.01.27.21.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 21:33:25 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 27 Jan 2025 21:33:12 -0800
Subject: [PATCH v4 4/4] entry: Inline syscall_exit_to_user_mode()
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-riscv_optimize_entry-v4-4-868cf7702dc9@rivosinc.com>
References: <20250127-riscv_optimize_entry-v4-0-868cf7702dc9@rivosinc.com>
In-Reply-To: <20250127-riscv_optimize_entry-v4-0-868cf7702dc9@rivosinc.com>
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
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/qMHLmT/cfrmEzXr81fsZRrrt1xy46eFcmTJkyf8yV3J
 +ONXa15HaUsDGJcDLJiiiw81xqYW+/olx0VLZsAM4eVCWQIAxenAExkhSYjQ0tK9rqTG+6t2NJe
 OX3SYdNnU5/J+PQU124rOPzh9JWb76czMrxgbzSee55Z/3qgbdxOpv5PwVe4rM/rvZ2R9GX1ny3
 7ilgB
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

