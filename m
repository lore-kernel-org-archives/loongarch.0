Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135AD156991
	for <loongarch@lists.linux.dev>; Fri, 24 Jan 2025 07:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737705205; cv=none; b=UqVBK+mSQ+mSI1m7Q/Q1qTNrs9eXHom9yMTrmWqD/bPBGrtb28YsRfSNTQ2bGU+gp9O01pcPxrJVcm6W2b0RNtJhE2czUShDTwvZ6LVEmlX/wsLuaZMlomFEb1XQdN1w00UA1ieYgjEe5cl0smS16pFOduswEgHZp3pLYXhi22A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737705205; c=relaxed/simple;
	bh=msYJij1VXYle5WNOAAnf0IBmpKOoFO//xfnWo3osKhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=doXhNpVgEok1FtZex21JUnR8AQND2kap5EusqwHydKDgZMO4ecrINdYf6jZQWNlAlYmUPbFniuiM43I9QbK9iAAnwxKceMHBymO1487WXnr8B7bE801HCkZpmyDGPcQ2QolEw3b4do/IzywG85MPAN2+FFuXoQl0SJLNzknv/hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=s00Y5VV9; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="s00Y5VV9"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-216395e151bso24310245ad.0
        for <loongarch@lists.linux.dev>; Thu, 23 Jan 2025 23:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737705202; x=1738310002; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1D6xSUMx6yY9EExV7q645xrMDEE4y5ZutPMhix8rPCw=;
        b=s00Y5VV9y2eBUs3T52yFZto1gHsehoDlOiNwep1yti+VhLv5nGhp7dopydJBf9ZHD+
         audq3qD0dOkDz2Zl/9MgxpXeT5BsjUlZQyXVoyw62RgQCbAWvaPsfgoMSBBkrHbqse7V
         SROZ0qcHlioMBqp+KZnBS8thesm9jKguHGbzu4XHe/6/6hEaSMP7pZKpAy3ixtDJQIAT
         Z97g5SnZz0CDx4UkgBzZKwV0yBOBT/9nJbO4OHHym5jWL0R0yLV4wtR/0V5Opt6lPzKW
         Q2ph1gkcJKWG1Zx3sYzlyEWulXDUqGXeTnGOwj0XmVlhpGVdGPeUkt+u5OGnr38N1QiE
         wYuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737705202; x=1738310002;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1D6xSUMx6yY9EExV7q645xrMDEE4y5ZutPMhix8rPCw=;
        b=tpedRRcS4PDvSjOIHPvADRNY49/SPqkDrCfcCf5drEDtjgwGPhCsBjSKWNFboNn35T
         OO/fzUr6TZJdT18hXUtYinct1iHtsLBCsvWM4O8+4SOgWz9fU7cAf3xq+0C7lD4EZDLi
         /t+IFEzatdE8at6eUWNYNvXNeop8ElqNzU3fY157zZoD3C0AQ6gmhiTRJT8g00U2Vnyd
         2ATPHg7SW96h+05o5089eQi2J1rjQcFGj+7IV9+xgwKBQNsLrltjYHpVYJMtj6BICiQ4
         Qk/xrSrvxMZ8Ab/Jq/wE4gJj/i13GADGr0zrlaWBEKyecHnh6EjikiTmaGSylsEujzKW
         vfKw==
X-Forwarded-Encrypted: i=1; AJvYcCUGo/cPeva4u4EET3/nL8ScNZLu4xmTKhatz7u6mXGocVOXjwQxQ/nRKih1HlGb7THYg5kC9JdozS8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyyCYGALlFJtBEXapyjcoFMp2CHl38gKLVmKV21NhO6dFmoVDLr
	wJJjVzFc8ke35R54S96LYkVqLOmzZATyTs8GIAjsGH+bHi1iJEUvrRPsIXtktNI=
X-Gm-Gg: ASbGncsvd1WI6BV/smvMFxpEgeBaxWKtARICs2l3I4+0g26MBBM6H2dFL6tWFpvK7OK
	GGTpFY0NZXLiljr8egJhzw+uY7Ic/qY4P0fxCXUdcEkZnQ67I11IshayL2/dc3dR15KOa7CRNEU
	Hr66S4vS6tXpb7XXuBiK+1UtDoEeKqCbE84cGXO+5cn0XN5Q96a2SbDFgg/UTdffJXN3fkzC+aK
	Pc6l2Y67LvoFPGpQNoSm+mgzNciMSAo3LWWe/a52ijL4EBzPuMQG824f6Bo6Utsfxh++UtS4+NE
X-Google-Smtp-Source: AGHT+IHHGxH/HpkilKLbQogSJE/TNcVINRyD5SPXZk/okYZGkzNq3qPlVSt7eLNhXfhsaqVlbYLkJg==
X-Received: by 2002:a17:902:fc4e:b0:215:8847:4377 with SMTP id d9443c01a7336-21d9936e91bmr100372865ad.15.1737705202331;
        Thu, 23 Jan 2025 23:53:22 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:db66:c77e:13aa:17a4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da424e7a6sm10521215ad.231.2025.01.23.23.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 23:53:21 -0800 (PST)
Date: Thu, 23 Jan 2025 23:53:19 -0800
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
Subject: Re: [PATCH v2 2/4] riscv: entry: Split ret_from_fork() into user and
 kernel
Message-ID: <Z5NG7-0YyophMcZy@ghost>
References: <20250123-riscv_optimize_entry-v2-0-7c259492d508@rivosinc.com>
 <20250123-riscv_optimize_entry-v2-2-7c259492d508@rivosinc.com>
 <6ebe8b7c-7df3-4bea-9175-35512e9960a7@ghiti.fr>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ebe8b7c-7df3-4bea-9175-35512e9960a7@ghiti.fr>

On Fri, Jan 24, 2025 at 08:19:18AM +0100, Alexandre Ghiti wrote:
> Hi Charlie,
> 
> On 23/01/2025 20:14, Charlie Jenkins wrote:
> > This function was unified into a single function in commit ab9164dae273
> > ("riscv: entry: Consolidate ret_from_kernel_thread into ret_from_fork").
> > However that imposed a performance degradation. Partially reverting this
> > commit to have ret_from_fork() split again results in a 1% increase on
> > the number of times fork is able to be called per second.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >   arch/riscv/include/asm/asm-prototypes.h |  3 ++-
> >   arch/riscv/kernel/entry.S               | 13 ++++++++++---
> >   arch/riscv/kernel/process.c             | 17 +++++++++++------
> >   3 files changed, 23 insertions(+), 10 deletions(-)
> > 
> > diff --git a/arch/riscv/include/asm/asm-prototypes.h b/arch/riscv/include/asm/asm-prototypes.h
> > index 733ff609778797001006c33bba9e3cc5b1f15387..bfc8ea5f9319b19449ec59493b45b926df888832 100644
> > --- a/arch/riscv/include/asm/asm-prototypes.h
> > +++ b/arch/riscv/include/asm/asm-prototypes.h
> > @@ -52,7 +52,8 @@ DECLARE_DO_ERROR_INFO(do_trap_ecall_s);
> >   DECLARE_DO_ERROR_INFO(do_trap_ecall_m);
> >   DECLARE_DO_ERROR_INFO(do_trap_break);
> > -asmlinkage void ret_from_fork(void *fn_arg, int (*fn)(void *), struct pt_regs *regs);
> > +asmlinkage void ret_from_fork_kernel(void *fn_arg, int (*fn)(void *), struct pt_regs *regs);
> > +asmlinkage void ret_from_fork_user(struct pt_regs *regs);
> >   asmlinkage void handle_bad_stack(struct pt_regs *regs);
> >   asmlinkage void do_page_fault(struct pt_regs *regs);
> >   asmlinkage void do_irq(struct pt_regs *regs);
> > diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> > index 9225c322279aa90e737b1d7144db084319cf8103..9386ef7444267f0b9bf8a0550f4e31deaeb85881 100644
> > --- a/arch/riscv/kernel/entry.S
> > +++ b/arch/riscv/kernel/entry.S
> > @@ -319,14 +319,21 @@ SYM_CODE_END(handle_kernel_stack_overflow)
> >   ASM_NOKPROBE(handle_kernel_stack_overflow)
> >   #endif
> > -SYM_CODE_START(ret_from_fork_asm)
> > +SYM_CODE_START(ret_from_fork_kernel_asm)
> >   	call schedule_tail
> >   	move a0, s1 /* fn */
> >   	move a1, s0 /* fn_arg */
> >   	move a2, sp /* pt_regs */
> > -	call ret_from_fork
> > +	call ret_from_fork_kernel
> >   	j ret_from_exception
> > -SYM_CODE_END(ret_from_fork_asm)
> > +SYM_CODE_END(ret_from_fork_kernel_asm)
> > +
> > +SYM_CODE_START(ret_from_fork_user_asm)
> > +	call schedule_tail
> > +	move a0, sp /* pt_regs */
> > +	call ret_from_fork_user
> > +	j ret_from_exception
> > +SYM_CODE_END(ret_from_fork_user_asm)
> >   #ifdef CONFIG_IRQ_STACKS
> >   /*
> > diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> > index 0d07e6d8f6b57beba438dbba5e8c74a014582bee..5f15236cb526bd9fe61636ed372b4b76c94df946 100644
> > --- a/arch/riscv/kernel/process.c
> > +++ b/arch/riscv/kernel/process.c
> > @@ -38,7 +38,8 @@ unsigned long __stack_chk_guard __read_mostly;
> >   EXPORT_SYMBOL(__stack_chk_guard);
> >   #endif
> > -extern asmlinkage void ret_from_fork_asm(void);
> > +extern asmlinkage void ret_from_fork_kernel_asm(void);
> > +extern asmlinkage void ret_from_fork_user_asm(void);
> >   void noinstr arch_cpu_idle(void)
> >   {
> > @@ -208,14 +209,18 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
> >   	return 0;
> >   }
> > -asmlinkage void ret_from_fork(void *fn_arg, int (*fn)(void *), struct pt_regs *regs)
> > +asmlinkage void ret_from_fork_kernel(void *fn_arg, int (*fn)(void *), struct pt_regs *regs)
> >   {
> > -	if (unlikely(fn))
> > -		fn(fn_arg);
> > +	fn(fn_arg);
> >   	syscall_exit_to_user_mode(regs);
> >   }
> > +asmlinkage void ret_from_fork_user(struct pt_regs *regs)
> > +{
> > +	syscall_exit_to_user_mode(regs);
> > +}
> > +
> >   int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
> >   {
> >   	unsigned long clone_flags = args->flags;
> > @@ -238,6 +243,7 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
> >   		p->thread.s[0] = (unsigned long)args->fn;
> >   		p->thread.s[1] = (unsigned long)args->fn_arg;
> > +		p->thread.ra = (unsigned long)ret_from_fork_kernel_asm;
> >   	} else {
> >   		*childregs = *(current_pt_regs());
> >   		/* Turn off status.VS */
> > @@ -247,12 +253,11 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
> >   		if (clone_flags & CLONE_SETTLS)
> >   			childregs->tp = tls;
> >   		childregs->a0 = 0; /* Return value of fork() */
> > -		p->thread.s[0] = 0;
> > +		p->thread.ra = (unsigned long)ret_from_fork_user_asm;
> >   	}
> >   	p->thread.riscv_v_flags = 0;
> >   	if (has_vector())
> >   		riscv_v_thread_alloc(p);
> > -	p->thread.ra = (unsigned long)ret_from_fork_asm;
> >   	p->thread.sp = (unsigned long)childregs; /* kernel sp */
> >   	return 0;
> >   }
> > 
> 
> Can you benchmark this change on some HW? I'm not sure we would indeed gain
> this 1%.

It reduces the syscall path by 3 instructions, two for not needing to
move the fn and fn_args from:

move a0, s1 /* fn */
move a1, s0 /* fn_arg */

And one for not needing to do the conditional. This one is also saved on
kernel threads.

It's a very small improvement, but there is only something like 100
instructions along the direct syscall path so it ends up being a large
percentage. On hardware moving registers is very cheap and this branch
will be almost always be correctly predicted so the cost is close to
zero. I just figured that since I am making changes around here it would
be nice if it was optimal instead of being close to optimal.

- Charlie

> 
> Thanks,
> 
> Alex
> 
