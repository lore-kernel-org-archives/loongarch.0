Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68346224B08
	for <loongarch@lists.linux.dev>; Thu, 20 Mar 2025 17:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742491778; cv=none; b=leXOOBbeC4xIHXd2f3rRNI26cyqk+7WvTa/S+ev+yJCv8XuKnz8O3Ii/MXB6cf6zRSGZILIWIxYYzyvo9QHwKC1t9sBuz3km0LBCV7tPxVIMf7gDzqcERMXqHBelcagZO3F12xbczbJdYBMXH0HBZSfgycWf5z56XaXmMqyypGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742491778; c=relaxed/simple;
	bh=gaq/v9YuAdYAHAPq6G2li6XLwEhlQb1rcc0R86FQKSc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qi2Sg1RcJPJup9j3Kc+OTH1npSHWG5/9H9ggNdumABAEsPVzaFOkAsO7AIGsJu1kTlC2VidMir380DhxPAGVWKJiX0IsCwanY3Ju3AJ4bDOZLrdEZ80v/Oszhqat2XQs93vi6BP/+XOmoVoyVJdpfacrzZWNn+rBR8GhT1s/fBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=LXcKXN07; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="LXcKXN07"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-225a28a511eso24659695ad.1
        for <loongarch@lists.linux.dev>; Thu, 20 Mar 2025 10:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742491775; x=1743096575; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R3jS1rl0NyPiPtBrV6gbvaKvWtHD4LTe2LvNMOIdkhU=;
        b=LXcKXN07PP2s4MRxd5AOH3+AuqmjFnPYPBQdqF5Q+E+dIjrW9/v/VH5dZbuYEfVOmC
         Rzc/S4K0qVInFitaYu9S8o7rgykhcg32ijKeIuxjDl8f6pMDTuOBtacw8fhefdBidjbT
         dFDQBx61wnb/VYhoG3FZ6H/An34SCAbfe2ZB581W6Q0pfTFNRkYMTMDNYyDuKHC9iivp
         lpx+PkHrt2TRyyNwfqJHEM8C7Yw43TsWk5wY/siUcLqMDyZuPAXpZUA1rvVO3WcRcoP4
         FjUVdDVzVxaRjWbAsUjc3Wj9wCpU4LeRQrBsXvpJV++D6+fXfFUqR1BFtbDsIatA+h7/
         bC/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742491775; x=1743096575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R3jS1rl0NyPiPtBrV6gbvaKvWtHD4LTe2LvNMOIdkhU=;
        b=ExeAaIpXdDzE5PhbQ3hPIQrdzAeZYyTZn+MDZFfwOoSCxvupGZXjDMdHnImbUPG5VQ
         q6bZpoUa//hKeqZPGXiLGit8ODCrecm25WExmk8sFrKC4U+EwzF9dSLUxe9GwrJxMwDV
         foWkWgiUnyB0spETz3gs5fgycPdQmnx0j7VVHtALaVAsJ+GEo5QT1air6IMt8n4Sf3dX
         9ZxYw2cxIUluBr1CiwwkjNoHa8PKe2jZJEjbUx6UpI0YDH3ZfaFIgWPtb4EWBRzfnFXK
         SSP3GmzD6osy1qLPHn3NaGi7AgW5/ujiA5SizkEFQb3/s3Xxa/N7E9kCTgsRGdgPkppF
         cj0A==
X-Forwarded-Encrypted: i=1; AJvYcCXI6eqsx/WOTaknATKhDzWEptiFFhx5lH4FidhWNZh/vgxRUD4vqnKh+wniMrk5s02zBHJ7O2u4hYc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1t8K8QNdK3vGPctqSglO5X+GzSNccF0BTXJqNwoEqvptuiKts
	jomiDaJiehW1IkAAdxZmZYEtAnY/nBBsqiXoKOVBjZ40+iSHyt48/wgM8qrqBOA=
X-Gm-Gg: ASbGncsNw6FGPE4fa4gTWys+QhS9Au01t1zgwJsisfo3jQZ9p7Jjmw7ICh9oIbqqlfd
	vX6fcDGNSbHH69+mcx4u+ME1HMHfwoZy3nZK5k61yuJET0uapvNf3uYoFKac/XvvXN9RlnOyxbZ
	LsRX0xriB+V37s6mrSu8zRuKwCrDIhoYshIh3ql6VABxERDTcdzJQI0cHxKCMX8zINbK0+4sL7o
	3BuHoNmTc7XupzCQfkQR6x646CTLZeJxKiExZa92+BxTeXhmNJcTVi1a1Mf914/6ir4r6Wlv8Va
	WJYGlb+KKxwnV+EBY8UPbNW2lDkdyONGbmI4l7kvZg3uYMk4mDdq56EZ0C3A
X-Google-Smtp-Source: AGHT+IEQ1hA26C98UYsq0v49utf4d+ujVyRXt/fsHRytInopHwMDFgd1YulOL9OtsGProEAKKBvvhw==
X-Received: by 2002:a17:902:ea07:b0:224:76f:9e59 with SMTP id d9443c01a7336-22780c54d2cmr4749885ad.10.1742491775625;
        Thu, 20 Mar 2025 10:29:35 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f45994sm554075ad.81.2025.03.20.10.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 10:29:34 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 20 Mar 2025 10:29:21 -0700
Subject: [PATCH v6 1/4] riscv: entry: Convert ret_from_fork() to C
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250320-riscv_optimize_entry-v6-1-63e187e26041@rivosinc.com>
References: <20250320-riscv_optimize_entry-v6-0-63e187e26041@rivosinc.com>
In-Reply-To: <20250320-riscv_optimize_entry-v6-0-63e187e26041@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>, 
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 loongarch@lists.linux.dev, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3515; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=gaq/v9YuAdYAHAPq6G2li6XLwEhlQb1rcc0R86FQKSc=;
 b=kA0DAAoWjgFid219CPYByyZiAGfcUHrImYiZNCS0BmPPKWSpiEX0ghY/Of3RasTrPX9qN5AB8
 4h1BAAWCgAdFiEEDNaAA4XcL3bFFXaQjgFid219CPYFAmfcUHoACgkQjgFid219CPbRkwEAtPKv
 Ku03MbxplfH795hgrIKj97bZxGVqLUQ7QpkrN6QBAMINRMdaKpxJoDyr+sPeH8RagpPD/EteNBB
 ZeabOyrgN
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
index 7c244de7718008947075357ea4502d56419d507c..7b0a0bfe29aec896c2bdd8976d855dd390de88d7 100644
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
 	if (has_vector() || has_xtheadvector())
 		riscv_v_thread_alloc(p);
-	p->thread.ra = (unsigned long)ret_from_fork;
+	p->thread.ra = (unsigned long)ret_from_fork_asm;
 	p->thread.sp = (unsigned long)childregs; /* kernel sp */
 	return 0;
 }

-- 
2.43.0

