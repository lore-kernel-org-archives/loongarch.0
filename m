Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E549D1ADC9B
	for <loongarch@lists.linux.dev>; Thu, 23 Jan 2025 19:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737659724; cv=none; b=Q0xCUepFBn6PXQmXJ1o3Z9LMACCPiHMmR8Dibokmo0YW80HoEQ6xl5ExrBlqjimZLOgsXkgaUjaFVVLpWSxNQhuqHHeeG+DAB34fCSAua0In4EfmnHbPkaDp/fg0EgKwfn22LVF5pUNn+vmMFIbyExnSTWxhw74c0pepfvO+NKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737659724; c=relaxed/simple;
	bh=sOZDk0mqs9t7JThCawDCQVAf1T6D7VObAlzqPEnCu8U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CX2OIPh/R+jwZ8N6d4ImxYemlvUhbfU3jkttrUJ5Rn0NkQmZZ+FGHVus8OUgFwcXDls3MsOfZ+/6eh8jGKJAjLRdbK0KJ/Rui3ogV8eZw8SVcI9nFrcAx+T4ScsqULgTkab83kq6uuA0j/9oNyaKyDTxmXTzMJjJd92NWyRTIJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=NX03UXLG; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="NX03UXLG"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2166651f752so13352945ad.3
        for <loongarch@lists.linux.dev>; Thu, 23 Jan 2025 11:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737659722; x=1738264522; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7sSJeNFuPfWReO9OO5qkQ/VIRfyi9C57dHefTNmMMUo=;
        b=NX03UXLGQ02fdGSJ1OzC2YY+goqHu6t4TlMgz2IiJRzlcKGsDJjKjygrHcmzXgbIAJ
         PeIh5fN9AzNcWvo1oidGUZXWtbiBpQP+i2bXYN7gtNUuCcrWZa0fFBHAFNF6D9G0bOMW
         QgN6i3syAnv8GGleXks6lvg5foTuQS63iV5Sm+kK82slMl2orRemhAVBhfS6xZXCG318
         R/vfqxvK/acOr0CVQxWlWsExiwSy6MXo6vPkucNv3bTUH8P6PwOXIZLe14WfT4/byqae
         KcHcn7mVlNCs/ex7z+SJ5e0dwYFOWiKLtzsQ21a+ssZw8GTYxYG1GCzrQpPUmSpeZQ75
         EjBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737659722; x=1738264522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7sSJeNFuPfWReO9OO5qkQ/VIRfyi9C57dHefTNmMMUo=;
        b=QNyrNC/EXlncYPMrMZuZfPa6bk9Rk8Yw9Ht5fmE/rHuP9bkcSIlU6YtX4WUvkYt3UC
         ZkRBFFheO/Gb9hPDNSfx5kTOfIjnCcZRObK0RKvLjZauopuQsFMGDY4L0ADl84NXFN1d
         2TiDn50Vo8I6w10BJKKJO0Ex8W4YR1k9Nu9SCt1vRDolVcV/oFvLnLxSlA1gsrLVgTa4
         zGqJqvqw44QSI/NfWdCjcagAt+M3MR+b2zcwcp+zlzZk5WD1Z9ZYbGzJpV+SxLNBfA0F
         kBWDs/Y2SR89NKjqufBwqD38nlwfm31I45GCTP4PKbyOcDfL03K/fbtflWDNGBkLf2yX
         D0dQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoadKR5wblyaVzY+i7GkfQ2m5JmWRqmdxQXext8hOSVyFu8UTUvByA/1J8Yx9FWSNtbWNzUa5R4ME=@lists.linux.dev
X-Gm-Message-State: AOJu0YzNFwWBBLoUkQh1pDUXGPAdOSTJZb3W+3PP0kb0KXbHWCw25nY1
	9Gmwd2KRsInGxT/jxf5IP8f/G8ONNaUM9OE3EXuRhShpiCwyBO8VCL+stc0teA0=
X-Gm-Gg: ASbGncvdnqwfUOY3EZVU2MFt8eSHlbeXw6xi0Oqra5MISu29e44ZG/RQKWDxlK+W6gD
	G6iiKmxxLJneprykD1cMKTBsDCg0cfkH4OHPiqwN+rgLxda8OhEeSiQH1iYXYvgEEoFZ9J20gL+
	GFyxdVKaUriazzFp9B41SeiuG3SjPuAz8zWVGh7shjQd6iXSrd4WPSGC+Ut1okS8XRYzjmxeLaB
	v73LvBqioSeKjO+Cl51pPWPpFanP5yJmB3XgDzMyy/ZBI8VbYOLsvdaJHU32QAJTEapJ+qh0CuY
	B2hkRKQkocy6z0J40yYgIR82KJ6rMdc=
X-Google-Smtp-Source: AGHT+IGwkaQcjsRA0ckQ8hfF7rhnrA97lBFPxRTb5ooMPcRBrFUbh16WviAiYS7cf8KITGLjKjwLug==
X-Received: by 2002:a17:902:ec84:b0:215:3661:747e with SMTP id d9443c01a7336-21c353ef81cmr312691415ad.8.1737659722130;
        Thu, 23 Jan 2025 11:15:22 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da3ea3cb2sm2504645ad.90.2025.01.23.11.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 11:15:21 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 23 Jan 2025 11:14:31 -0800
Subject: [PATCH v2 3/4] loongarch: entry: Migrate ret_from_fork() to C
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250123-riscv_optimize_entry-v2-3-7c259492d508@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6370; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=sOZDk0mqs9t7JThCawDCQVAf1T6D7VObAlzqPEnCu8U=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/qkqU42lptFm4tfHG0Q3FL45mrn9VMsDcqfnhfev3Prn
 tzX2o/fOkpZGMS4GGTFFFl4rjUwt97RLzsqWjYBZg4rE8gQBi5OAZjIqi5Ghv9sVntVJ8m2P4id
 v3NlbdrVdMcZBxd6sWzOn7uOw19Rdh0jw6Pru85siL8aUHVBPqzbXHn2bCe2E1Lbq09amBWv2m2
 8ggkA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

Loongarch is the only architecture that calls
syscall_exit_to_user_mode() from asm. Move the call into C so that this
function can be inlined across all architectures.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/loongarch/include/asm/asm-prototypes.h |  5 +++++
 arch/loongarch/include/asm/switch_to.h      |  8 +++++++
 arch/loongarch/kernel/entry.S               | 22 +++++++++----------
 arch/loongarch/kernel/process.c             | 34 ++++++++++++++++++++++++-----
 4 files changed, 51 insertions(+), 18 deletions(-)

diff --git a/arch/loongarch/include/asm/asm-prototypes.h b/arch/loongarch/include/asm/asm-prototypes.h
index 51f224bcfc654228ae423e9a066b25b35102a5b9..0195d4309fd29f94664d5f34247198c769033b1b 100644
--- a/arch/loongarch/include/asm/asm-prototypes.h
+++ b/arch/loongarch/include/asm/asm-prototypes.h
@@ -12,3 +12,8 @@ __int128_t __ashlti3(__int128_t a, int b);
 __int128_t __ashrti3(__int128_t a, int b);
 __int128_t __lshrti3(__int128_t a, int b);
 #endif
+
+asmlinkage void noinstr __no_stack_protector ret_from_kernel_thread(struct task_struct *prev,
+								    struct pt_regs *regs,
+								    int (*fn)(void *),
+								    void *fn_arg);
diff --git a/arch/loongarch/include/asm/switch_to.h b/arch/loongarch/include/asm/switch_to.h
index 5b225aff3ba21aa06d0713bc8e73e1b941389630..a1c5576f1fd145670e13038bec6dd390486099ab 100644
--- a/arch/loongarch/include/asm/switch_to.h
+++ b/arch/loongarch/include/asm/switch_to.h
@@ -26,6 +26,14 @@ extern asmlinkage struct task_struct *__switch_to(struct task_struct *prev,
 			struct task_struct *next, struct thread_info *next_ti,
 			void *sched_ra, void *sched_cfa);
 
+void noinstr __no_stack_protector ret_from_kernel_thread(struct task_struct *prev,
+							 struct pt_regs *regs,
+							 int (*fn)(void *),
+							 void *fn_arg);
+
+void noinstr __no_stack_protector ret_from_fork(struct task_struct *prev,
+						struct pt_regs *regs);
+
 /*
  * For newly created kernel threads switch_to() will return to
  * ret_from_kernel_thread, newly created user threads to ret_from_fork.
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
index 6e58f65455c7ca3eae2e88ed852c8655a6701e5c..16cc949fe43443d70f1d865ce04595c2d8c1615b 100644
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
@@ -138,6 +142,24 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 	return 0;
 }
 
+asmlinkage void noinstr __no_stack_protector ret_from_kernel_thread(struct task_struct *prev,
+								    struct pt_regs *regs,
+								    int (*fn)(void *),
+								    void *fn_arg)
+{
+	schedule_tail(prev);
+
+	fn(fn_arg);
+
+	syscall_exit_to_user_mode(regs);
+}
+
+void noinstr __no_stack_protector ret_from_fork(struct task_struct *prev, struct pt_regs *regs)
+{
+	schedule_tail(prev);
+	syscall_exit_to_user_mode(regs);
+}
+
 /*
  * Copy architecture-specific thread state
  */
@@ -165,8 +187,8 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
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
@@ -182,8 +204,8 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
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

