Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB07A71750
	for <loongarch@lists.linux.dev>; Thu,  6 Mar 2025 00:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741221853; cv=none; b=ip7y/pLvzWAzW43f7I+he2FCCHp82n0FE0J9uDkd5Z1u2BO+UY4rgbhkX273t1Si4Lr6nxPRP/VDiwbWJGdlApmvN9tWg6dW2CbkImF5cPVpUT9yOr9YBze/geynVtRxAb7fs/mz5S7RAAIWIS6hQlnX/WgSlof5mYMbohxXR3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741221853; c=relaxed/simple;
	bh=ji6jPR39ZKDby+guv8CCAiBLyKbpGz9Kynms9BH9fJU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iEyj6L7bkNvcYnKfMBIwFY9Saxs1C2Njq3J7PVO/18570StGbFGvjtRrZkG1ZYmhqSpb/IrII09tlIvd8YPHOWEBIGktvtLXmTDskkFlYHn1Xtj2gnw+97Zo1dg+BJoRmCaygbOGAkc8IjxiW69PGhyi0Io1gTOWXiL3PKO7V7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=hy6nf0Mq; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="hy6nf0Mq"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2234daaf269so1276465ad.3
        for <loongarch@lists.linux.dev>; Wed, 05 Mar 2025 16:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741221850; x=1741826650; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a+zSCWqqyKc551VynXTcxotuXwo5gv9XFD/e4PnRFpw=;
        b=hy6nf0MqmCnn6jWykn2iM0cJeSKARfZffwf09udjn2Sy/dxNkkj/vjiUtkegqNLkAU
         EkiAcmB/4fz7rJnhZYJNeRCmVrR6kJNDZAiliVw6NQCK1ytDP1YwIEKaHnvlk+OJDYDV
         6KumCrpx1kfjnfo1d+nXISgd2npXhddLQsT0Sl3eW6hT+ZIpE/MwDYqJGa2o6Cg0wgfJ
         gUbqo6TuFnAHD/zIGWRT32SJDzs/0gERxCFnUqqi/PqIVYhvFlXmV5RHE6X1azMaYLyF
         RHd+iG5Mh5z/XWUhgnm7TMEynghkhCWfp+mMx9Ub/m+79MO0RMVul5VMEboNocLnmf7R
         TIdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741221850; x=1741826650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a+zSCWqqyKc551VynXTcxotuXwo5gv9XFD/e4PnRFpw=;
        b=hIkLvAxyeNkQpGSCRlZ3nVQkZhPbwh6TdEdHDP52tcTdlUXTfDxTYcL0GsPwxOCo5y
         UBSHLPenDFJT719HhICvZrqFgFAOm6Z6bgMKCd7W4vtEhjv7xDy4aov78zgK2j2MS5lG
         MNAN4Im1rpQD7f7IiiFozrrzbFPb79jc4wqjD1aJN78cGXdgIWez9Ilwb+dExOe58qqj
         1fSpNhCIXAtRvzoE1Ime7wDmutHGjdrme7M8HdPfOZzMsB1gMffAFyFd98Dehghhxj4g
         KKzacJT4OSkiYPNOOHrZ7Go3IFdANG6gPv0LfwVmgWRLdtnf1DIHQU4z+/HCdDFEBD1n
         D1Jw==
X-Forwarded-Encrypted: i=1; AJvYcCW1PRQnMWnvQgkwZn7VdZgngX5qtkLGLi+qvdDTlyDCxS8hP/Qav0j85g1pAhFQ9g1njn37F/XtXLY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyFtKzTULbxmBXXqdBmyR/MoTLsViuRYIcCkad37te/2/EXcBln
	sGnh4nlcN4n2rOAZHh+tmSGYPUMtcPd5ENoDiJZdXdRlzJ9uzdcHXkIuhX02ujIEO17HJ4CLkj2
	I
X-Gm-Gg: ASbGncuAWC0GwQ8mwlkrwnphJeZel7DAIJGxRU40rdwC4kdmL2lENuXrHX9QrbiD/cC
	cQhSy4it8BTCnASrX9sJJKnEbJmlTXYmr4bbG1JlIYv22Ah0AUdDtj3PIaSIc4xIy7Vc/8XWMqh
	NwOR7kapYOUuTdvncaACLJpp2kXix/q3AseO5oGN0EE5Bo0FU8Nt2qTRcV6Ine3wZ/uZE2IbIqi
	Ya4CuHm6fdESrIbDIGC0IY5nU08Xp8cgYmXbOCW7OtzPRHsK4/ChoF3b62NwWf3Yfw+qWC0Xk+m
	86KEnWKkWifV9bCbcx+1z7gWdsBbxffW1QAXbisgC7IJLk3Dh3eRXHAleXS4
X-Google-Smtp-Source: AGHT+IGYFA+K5CP6Cy9THeZNXREi+YFcFuwtTfzr0w6OgFVQJjQCMGiweUstJDPBRDAGvCr9mJ4IwQ==
X-Received: by 2002:a17:903:2305:b0:224:de2:7fd6 with SMTP id d9443c01a7336-2240de28335mr9026765ad.25.1741221850434;
        Wed, 05 Mar 2025 16:44:10 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410a7f7efsm347085ad.132.2025.03.05.16.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 16:44:09 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 05 Mar 2025 16:43:46 -0800
Subject: [PATCH v5 3/4] LoongArch: entry: Migrate ret_from_fork() to C
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-riscv_optimize_entry-v5-3-6507b5dff3ce@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5547; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=ji6jPR39ZKDby+guv8CCAiBLyKbpGz9Kynms9BH9fJU=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/qJ95ePTzBvvzPfOaKeK9gkZ6GPsf20tfcCnKo13u4KZ
 LworCLQUcrCIMbFICumyMJzrYG59Y5+2VHRsgkwc1iZQIYwcHEKwETSrjEyXF0Ud+RJZLCFOkfG
 I+4SH97LUxlbNP/rrNyTuuCCQeD5Gob/abeMBayufysUjl2cYcByfGvR7nPRXyd+OcZXxRJx4OZ
 2HgA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

LoongArch is the only architecture that calls
syscall_exit_to_user_mode() from asm. Move the call into C so that this
function can be inlined across all architectures.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/loongarch/include/asm/asm-prototypes.h |  8 +++++++
 arch/loongarch/kernel/entry.S               | 22 +++++++++----------
 arch/loongarch/kernel/process.c             | 33 +++++++++++++++++++++++------
 3 files changed, 45 insertions(+), 18 deletions(-)

diff --git a/arch/loongarch/include/asm/asm-prototypes.h b/arch/loongarch/include/asm/asm-prototypes.h
index 51f224bcfc654228ae423e9a066b25b35102a5b9..704066b4f7368be15be960fadbcd6c2574bbf6c0 100644
--- a/arch/loongarch/include/asm/asm-prototypes.h
+++ b/arch/loongarch/include/asm/asm-prototypes.h
@@ -12,3 +12,11 @@ __int128_t __ashlti3(__int128_t a, int b);
 __int128_t __ashrti3(__int128_t a, int b);
 __int128_t __lshrti3(__int128_t a, int b);
 #endif
+
+asmlinkage void noinstr __no_stack_protector ret_from_fork(struct task_struct *prev,
+							   struct pt_regs *regs);
+
+asmlinkage void noinstr __no_stack_protector ret_from_kernel_thread(struct task_struct *prev,
+								    struct pt_regs *regs,
+								    int (*fn)(void *),
+								    void *fn_arg);
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
index 6e58f65455c7ca3eae2e88ed852c8655a6701e5c..98bc60d7c550fcc0225e8452f81a7d6cd7888015 100644
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
@@ -33,6 +34,7 @@
 #include <linux/prctl.h>
 #include <linux/nmi.h>
 
+#include <asm/asm-prototypes.h>
 #include <asm/asm.h>
 #include <asm/bootinfo.h>
 #include <asm/cpu.h>
@@ -47,6 +49,7 @@
 #include <asm/pgtable.h>
 #include <asm/processor.h>
 #include <asm/reg.h>
+#include <asm/switch_to.h>
 #include <asm/unwind.h>
 #include <asm/vdso.h>
 
@@ -63,8 +66,9 @@ EXPORT_SYMBOL(__stack_chk_guard);
 unsigned long boot_option_idle_override = IDLE_NO_OVERRIDE;
 EXPORT_SYMBOL(boot_option_idle_override);
 
-asmlinkage void ret_from_fork(void);
-asmlinkage void ret_from_kernel_thread(void);
+asmlinkage void restore_and_ret(void);
+asmlinkage void ret_from_fork_asm(void);
+asmlinkage void ret_from_kernel_thread_asm(void);
 
 void start_thread(struct pt_regs *regs, unsigned long pc, unsigned long sp)
 {
@@ -138,6 +142,23 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 	return 0;
 }
 
+asmlinkage void noinstr __no_stack_protector ret_from_fork(struct task_struct *prev,
+							   struct pt_regs *regs)
+{
+	schedule_tail(prev);
+	syscall_exit_to_user_mode(regs);
+}
+
+asmlinkage void noinstr __no_stack_protector ret_from_kernel_thread(struct task_struct *prev,
+								    struct pt_regs *regs,
+								    int (*fn)(void *),
+								    void *fn_arg)
+{
+	schedule_tail(prev);
+	fn(fn_arg);
+	syscall_exit_to_user_mode(regs);
+}
+
 /*
  * Copy architecture-specific thread state
  */
@@ -165,8 +186,8 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
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
@@ -182,8 +203,8 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
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

