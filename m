Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96141DA636
	for <loongarch@lists.linux.dev>; Fri, 24 Jan 2025 07:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737705381; cv=none; b=czAIIHn5p6M3bCb5R7MfMnMstHyJr8SjvuZPDQZLVbQ1B8X7taJb0bRRx3ACzpjnu2Q1zUJwdoC/IeZ/tFcQ1whiDRnqKlRMBEjBuivUkOHMXmYgiqtjtqzTpNFEHlPN8eTBRS9dSn1tZYeRa8BGWcnnRqLwW0p/2Bd07Rh6mAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737705381; c=relaxed/simple;
	bh=HrH8G8PQV5+gKJKRebFsRuzL+IqXKVPmgz80aOEfsP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IA3DhMg/LEUYzhVfpQ4L8Tble8ttDWDxJLUe0xvTse5pLQwwiC08tD4ZNh+sULSvHTAKz51jG3/XLFA1nNI5oZ6UTCFpMZZdMdZ3gIJodJ9w/M9vo4uRtjUeizmPyt2naG6lULFDFjxJ/ahaaQ7wECtJiDS+15ldf8oYut58w3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=yZZYG6lG; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="yZZYG6lG"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2ee86a1a92dso2721460a91.1
        for <loongarch@lists.linux.dev>; Thu, 23 Jan 2025 23:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737705379; x=1738310179; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Puavfv6Mwo40wvE/QGDVA8qgrBgZXijyP93Qz2d9GhQ=;
        b=yZZYG6lG2TNfGLq+NWFzARD3iB39RDY9Z0js4uDtoLXmV5T8dy+1H2VRoJtszN99eS
         U795zmau1jD91dW+ZNlpXdSBO7OxDZ+yduAqJU6J3+iLV+yuZEcODXgBvYHQVWbNJmyt
         6qCUZvGb2c+cL9forjcU4eOiU6I+gXdlh9VJ1LZV1j/9aHV+tvwnP8BhDVBYQfydHUA8
         sIKfKQs7AxijqvjdcLatJ+KrbLNtf62+pvBbyMREVpca6Wgn95GShd9N02MNPy7ubhC1
         RO1aKq858nVoJ3i4HR5jaF1jbX0KQuYB+AwW4R8FRM25Bfj28nqE8aiU71LnQecQJ1sU
         p4DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737705379; x=1738310179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Puavfv6Mwo40wvE/QGDVA8qgrBgZXijyP93Qz2d9GhQ=;
        b=D9mA5gQcU5V8i4ZJghpjvxdwa0ZqWbXO8DSQ1/zzGOFIXLN6Q67SNPsKcRYVRhObDr
         G1pXnjE6PSm7kozVyUEKKX6W3ClVe1w9rHV4+9A+j5Brr/NgkAgoBZ9KBRwjyCknp1yT
         pxUuHiIKs87sOZSwK1dd8pHA0Q7bWAOGniA+XhdLTnUbfdOfGGG4dNSikPYIONAVUN/a
         ZTUneqPYWu4mnGrsrXbdobgIczorP4ekwb6KDq8dWULk7PVJZDGkqA6OA72Smnw+zJy2
         2EMReLf4SPRQ4RFDpumY0JytgtVsPkGkbMHvbviSPfQ+QSTzq9j0N2uQWErpXPSXjtl8
         vVmw==
X-Forwarded-Encrypted: i=1; AJvYcCVdGOpp2Jrjym9+GaeruNHtZ2f/JEugs27BV8oIqcJb4oJGWPoztqw/7pq8PRZlmU9j7TfJoC+WXn0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyoKn0Reo+vFwGT+a5JyiujgLJFzJCR27tBm65fXfjRQGNnCcAM
	kP+taKyveCzm5Ap4TmLuNhAqYc7MjTRlcZMhBmkFWsn5oGFZk5JOHypwbmnSCfA=
X-Gm-Gg: ASbGncuVfQtMZhBjxpAWyicASH4KfZKKV0C+yb8nfDyED0jIotoqdOCpI3DSDUT2kMz
	C27oS/n9CTvJEMSy03/HVOp9TeTE/IY7uFc9AMVIHSOsITzq/QYUjtRr1Fydezg/54jLOH+NPsH
	slsJGNrVeox9kbiFgaM6aTyiraQAQ7WGxkvdxnQsg5IV+BmSdgB95X7ZUmFqV4Za10luB+CaSNz
	8J4M1fQ6hD5okNZNYjeTcZobiW9Sd3Vu+BEN6jkFMN0TIkl4l4QtAMe139VD9+5mvGaBESEVyBm
X-Google-Smtp-Source: AGHT+IGtfy5k0PlhMUnKgepez8xy7+vWZVhDSj6+NmuJiXytfOUnL0FH4Jlly+P6YjqyMghE081Vyg==
X-Received: by 2002:aa7:9a83:0:b0:725:e325:ab3a with SMTP id d2e1a72fcca58-72daf97a541mr41394847b3a.14.1737705378949;
        Thu, 23 Jan 2025 23:56:18 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:db66:c77e:13aa:17a4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a7614e9sm1238956b3a.109.2025.01.23.23.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 23:56:18 -0800 (PST)
Date: Thu, 23 Jan 2025 23:56:16 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: Re: [PATCH 1/4] riscv: entry: Convert ret_from_fork() to C
Message-ID: <Z5NHoNI2UFc6q_O8@ghost>
References: <20250122-riscv_optimize_entry-v1-0-4ee95559cfd0@rivosinc.com>
 <20250122-riscv_optimize_entry-v1-1-4ee95559cfd0@rivosinc.com>
 <3c2d171a-1e6c-459e-b254-e9684a4e5ba4@ghiti.fr>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c2d171a-1e6c-459e-b254-e9684a4e5ba4@ghiti.fr>

On Fri, Jan 24, 2025 at 08:09:16AM +0100, Alexandre Ghiti wrote:
> Hi Charlie,
> 
> On 22/01/2025 23:56, Charlie Jenkins wrote:
> > Move the main section of ret_from_fork() to C to allow inlining of
> > syscall_exit_to_user_mode().
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >   arch/riscv/include/asm/asm-prototypes.h |  1 +
> >   arch/riscv/kernel/entry.S               | 15 ++++++---------
> >   arch/riscv/kernel/process.c             | 14 ++++++++++++--
> >   3 files changed, 19 insertions(+), 11 deletions(-)
> > 
> > diff --git a/arch/riscv/include/asm/asm-prototypes.h b/arch/riscv/include/asm/asm-prototypes.h
> > index cd627ec289f163a630b73dd03dd52a6b28692997..733ff609778797001006c33bba9e3cc5b1f15387 100644
> > --- a/arch/riscv/include/asm/asm-prototypes.h
> > +++ b/arch/riscv/include/asm/asm-prototypes.h
> > @@ -52,6 +52,7 @@ DECLARE_DO_ERROR_INFO(do_trap_ecall_s);
> >   DECLARE_DO_ERROR_INFO(do_trap_ecall_m);
> >   DECLARE_DO_ERROR_INFO(do_trap_break);
> > +asmlinkage void ret_from_fork(void *fn_arg, int (*fn)(void *), struct pt_regs *regs);
> >   asmlinkage void handle_bad_stack(struct pt_regs *regs);
> >   asmlinkage void do_page_fault(struct pt_regs *regs);
> >   asmlinkage void do_irq(struct pt_regs *regs);
> > diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> > index 33a5a9f2a0d4e1eeccfb3621b9e518b88e1b0704..9225c322279aa90e737b1d7144db084319cf8103 100644
> > --- a/arch/riscv/kernel/entry.S
> > +++ b/arch/riscv/kernel/entry.S
> > @@ -319,17 +319,14 @@ SYM_CODE_END(handle_kernel_stack_overflow)
> >   ASM_NOKPROBE(handle_kernel_stack_overflow)
> >   #endif
> > -SYM_CODE_START(ret_from_fork)
> > +SYM_CODE_START(ret_from_fork_asm)
> >   	call schedule_tail
> > -	beqz s0, 1f	/* not from kernel thread */
> > -	/* Call fn(arg) */
> > -	move a0, s1
> > -	jalr s0
> > -1:
> > -	move a0, sp /* pt_regs */
> > -	call syscall_exit_to_user_mode
> > +	move a0, s1 /* fn */
> > +	move a1, s0 /* fn_arg */
> 
> 
> You pass the arguments in the right order but the comments are wrong (s1
> contains fn_arg and s0 fn).

Oh thank you! I originally had it in this order but then moved it around
to reduce the amount of register shuffling that is needed on the C side,
I will fix in the next version.

- Charlie

> 
> 
> > +	move a2, sp /* pt_regs */
> > +	call ret_from_fork
> >   	j ret_from_exception
> > -SYM_CODE_END(ret_from_fork)
> > +SYM_CODE_END(ret_from_fork_asm)
> >   #ifdef CONFIG_IRQ_STACKS
> >   /*
> > diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> > index 58b6482c2bf662bf5224ca50c8e21a68760a6b41..0d07e6d8f6b57beba438dbba5e8c74a014582bee 100644
> > --- a/arch/riscv/kernel/process.c
> > +++ b/arch/riscv/kernel/process.c
> > @@ -17,7 +17,9 @@
> >   #include <linux/ptrace.h>
> >   #include <linux/uaccess.h>
> >   #include <linux/personality.h>
> > +#include <linux/entry-common.h>
> > +#include <asm/asm-prototypes.h>
> >   #include <asm/unistd.h>
> >   #include <asm/processor.h>
> >   #include <asm/csr.h>
> > @@ -36,7 +38,7 @@ unsigned long __stack_chk_guard __read_mostly;
> >   EXPORT_SYMBOL(__stack_chk_guard);
> >   #endif
> > -extern asmlinkage void ret_from_fork(void);
> > +extern asmlinkage void ret_from_fork_asm(void);
> >   void noinstr arch_cpu_idle(void)
> >   {
> > @@ -206,6 +208,14 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
> >   	return 0;
> >   }
> > +asmlinkage void ret_from_fork(void *fn_arg, int (*fn)(void *), struct pt_regs *regs)
> > +{
> > +	if (unlikely(fn))
> > +		fn(fn_arg);
> > +
> > +	syscall_exit_to_user_mode(regs);
> > +}
> > +
> >   int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
> >   {
> >   	unsigned long clone_flags = args->flags;
> > @@ -242,7 +252,7 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
> >   	p->thread.riscv_v_flags = 0;
> >   	if (has_vector())
> >   		riscv_v_thread_alloc(p);
> > -	p->thread.ra = (unsigned long)ret_from_fork;
> > +	p->thread.ra = (unsigned long)ret_from_fork_asm;
> >   	p->thread.sp = (unsigned long)childregs; /* kernel sp */
> >   	return 0;
> >   }
> > 
> 
> With the comment fix, you can add:
> 
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> 
> Thanks,
> 
> Alex
> 
