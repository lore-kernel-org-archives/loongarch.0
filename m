Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3448D8F6C
	for <loongarch@lists.linux.dev>; Fri, 24 Jan 2025 18:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737743190; cv=none; b=dh+N2eFWKylsSfowzopBBKOl+g/TqtiuRqSVX9tWFPeJ8mq4ph3zazTqJdntQIr+3JgInYlUicCJu6XYpn8gIysIxoAysuAgZiIImo4jOy3AFZA7Za05xONyJqi3Ate9se//qs4KZtj770Bc4zzV6W03On3laYyThaU0gKQGILs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737743190; c=relaxed/simple;
	bh=duS/D4oZ3xDdfN8T9SWpkrrrimTyJObuLes6nNn4/+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZEZdbQGX1sSPgQWxv127x305auarpLEIFh5zGmF9Q7I+RQH6ngGhWt8l/BWLnkNXf5SoWfz/PaKPcj4T5LxFR1ydC63fxhfx1RhIlX82yXW9+h9TRf6MZC12NJp9+pAb0KfycDUcSmkmI2F9BJn7TdCDSbvwEMfI0egumxk6X7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=A7M0jfQO; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="A7M0jfQO"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ef748105deso3456211a91.1
        for <loongarch@lists.linux.dev>; Fri, 24 Jan 2025 10:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737743187; x=1738347987; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JcZ9ShAtZot6Jq99upP8px5POQ3dFwcJzQWOR+IFyvo=;
        b=A7M0jfQOMJ3kTdcP4OT6XUJxvdvTO/QE8WYrWQqSbfSSbTGuXqjY6U+xnVTZWwupzs
         VnxRhzLVbbPwHaNNIwt3FJy4PV9l3qSUIKGeCYmGa+sMAZ7/LbjC2hazYUIR+0Lb5sSO
         62PSgDFQlO/gamLdYGNPX3o85GzUibywGGnlKm190q78N9h8xOYathuw92i1pgLIghs/
         DLmco7llG3mgvxfMUovc2hFV0ijAH4gcMXtE1qamIa5F11diZMWfhzK4JiwwcnXqiHCT
         QNGXBBApMY+g1atJ4ElgRbOg7C/ftqcL7b4RexCeNCBHf7eULTAh9K6yOqIoyzxANHYK
         L/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737743187; x=1738347987;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JcZ9ShAtZot6Jq99upP8px5POQ3dFwcJzQWOR+IFyvo=;
        b=T3hAL0SgiuC91eId62ebXw93H8anQZSwgwSSAmeC3Fk75ePts5pd4blS6wgrvM6PnZ
         2qNumRhQ/Qbxq9Lp7miP2y7fdrODD0ijnsxGOauyDFl3wxmDQpAxHMqQgOGlNBEy2rwm
         opDapNXEhl4KJWTDPBxBK3fkuAt5FHJfZ0kPHx0VOS+wBiGZ4yYQU5Ld77QNfBCl/acB
         B1mBdVg5Fs+APaR8wzisqmUDYWyvxPOek5SAQ7AHllSQ++i2lc5g5nsqii0fk3GR+nAo
         TfNnAE+mjGqkld75fRI1rkQiXFIXDkwYBWy+SiDE+JhigUuG9F/S9x0+FwSIplppLo0E
         bIaA==
X-Forwarded-Encrypted: i=1; AJvYcCU/S1Lr+yU4M5q8txUfTzcK0fyyr2Caudl7ythM6n6Air6jFpeZDkhz8XW5RMCoahDYIE64jpoTHHQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwWl/397kKt6C0o5adUJT2xZ4KkU7ri4PlhQ0A5IUby3Zf5cJxm
	hMBuSaPEBgV3dw7NDbfOsGahtEZsjyUYZa1vdrjSxmkg9/shVVUi+IUTVgm+aDY=
X-Gm-Gg: ASbGncuPnrg90tvBolvJ+jN54uvGyEuJ49mrfmluQMJdvZb1aIMSQVyFhx0dXYQljaX
	xVH4YuMaehuf17T432lMY8uWmKghjJcjxMMSJz/EGNS2ZfcRzdwavtL1mISInz1qAG1mqD3+WPE
	58DRDiewwBf1VFqPUqFQCXxsccsuQqwmmjPvOL43+WVpfgGy6wEe91kLD4SqyrrnfhgbpV/sRWF
	9Kyylcr+hE/eoTGSSegvjHebrswRUNbOXrfVQs0CGQk/33gGIcn5Fh/lX8p74UP3ge+9DvXiBs=
X-Google-Smtp-Source: AGHT+IExa+XlIJFCMHDrMTDwaRw4tPDij+pDt0wqDBC8Qjsvm2Io6+LxzH42s62VXGEH/v9u63KDYg==
X-Received: by 2002:a17:90b:524d:b0:2ef:1134:e350 with SMTP id 98e67ed59e1d1-2f782d691d9mr44218436a91.35.1737743187400;
        Fri, 24 Jan 2025 10:26:27 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:63b:8ac9:503a:b81d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa8122fsm2050434a91.41.2025.01.24.10.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 10:26:26 -0800 (PST)
Date: Fri, 24 Jan 2025 10:26:24 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Brian Gerst <brgerst@gmail.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Paul Walmsley <paul.walmsley@sifive.com>,
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
Message-ID: <Z5PbUBqs2Eh8JCIw@ghost>
References: <20250123-riscv_optimize_entry-v2-0-7c259492d508@rivosinc.com>
 <20250123-riscv_optimize_entry-v2-2-7c259492d508@rivosinc.com>
 <6ebe8b7c-7df3-4bea-9175-35512e9960a7@ghiti.fr>
 <Z5NG7-0YyophMcZy@ghost>
 <CAMzpN2gL9GWx-YzJd+sgQ30=gk3TN342W8Memz5j1C02jgQfrg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMzpN2gL9GWx-YzJd+sgQ30=gk3TN342W8Memz5j1C02jgQfrg@mail.gmail.com>

On Fri, Jan 24, 2025 at 08:08:44AM -0500, Brian Gerst wrote:
> On Fri, Jan 24, 2025 at 2:53 AM Charlie Jenkins <charlie@rivosinc.com> wrote:
> >
> > On Fri, Jan 24, 2025 at 08:19:18AM +0100, Alexandre Ghiti wrote:
> > > Hi Charlie,
> > >
> > > On 23/01/2025 20:14, Charlie Jenkins wrote:
> > > > This function was unified into a single function in commit ab9164dae273
> > > > ("riscv: entry: Consolidate ret_from_kernel_thread into ret_from_fork").
> > > > However that imposed a performance degradation. Partially reverting this
> > > > commit to have ret_from_fork() split again results in a 1% increase on
> > > > the number of times fork is able to be called per second.
> > > >
> > > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > > ---
> > > >   arch/riscv/include/asm/asm-prototypes.h |  3 ++-
> > > >   arch/riscv/kernel/entry.S               | 13 ++++++++++---
> > > >   arch/riscv/kernel/process.c             | 17 +++++++++++------
> > > >   3 files changed, 23 insertions(+), 10 deletions(-)
> > > >
> > > > diff --git a/arch/riscv/include/asm/asm-prototypes.h b/arch/riscv/include/asm/asm-prototypes.h
> > > > index 733ff609778797001006c33bba9e3cc5b1f15387..bfc8ea5f9319b19449ec59493b45b926df888832 100644
> > > > --- a/arch/riscv/include/asm/asm-prototypes.h
> > > > +++ b/arch/riscv/include/asm/asm-prototypes.h
> > > > @@ -52,7 +52,8 @@ DECLARE_DO_ERROR_INFO(do_trap_ecall_s);
> > > >   DECLARE_DO_ERROR_INFO(do_trap_ecall_m);
> > > >   DECLARE_DO_ERROR_INFO(do_trap_break);
> > > > -asmlinkage void ret_from_fork(void *fn_arg, int (*fn)(void *), struct pt_regs *regs);
> > > > +asmlinkage void ret_from_fork_kernel(void *fn_arg, int (*fn)(void *), struct pt_regs *regs);
> > > > +asmlinkage void ret_from_fork_user(struct pt_regs *regs);
> > > >   asmlinkage void handle_bad_stack(struct pt_regs *regs);
> > > >   asmlinkage void do_page_fault(struct pt_regs *regs);
> > > >   asmlinkage void do_irq(struct pt_regs *regs);
> > > > diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> > > > index 9225c322279aa90e737b1d7144db084319cf8103..9386ef7444267f0b9bf8a0550f4e31deaeb85881 100644
> > > > --- a/arch/riscv/kernel/entry.S
> > > > +++ b/arch/riscv/kernel/entry.S
> > > > @@ -319,14 +319,21 @@ SYM_CODE_END(handle_kernel_stack_overflow)
> > > >   ASM_NOKPROBE(handle_kernel_stack_overflow)
> > > >   #endif
> > > > -SYM_CODE_START(ret_from_fork_asm)
> > > > +SYM_CODE_START(ret_from_fork_kernel_asm)
> > > >     call schedule_tail
> > > >     move a0, s1 /* fn */
> > > >     move a1, s0 /* fn_arg */
> > > >     move a2, sp /* pt_regs */
> > > > -   call ret_from_fork
> > > > +   call ret_from_fork_kernel
> > > >     j ret_from_exception
> > > > -SYM_CODE_END(ret_from_fork_asm)
> > > > +SYM_CODE_END(ret_from_fork_kernel_asm)
> > > > +
> > > > +SYM_CODE_START(ret_from_fork_user_asm)
> > > > +   call schedule_tail
> > > > +   move a0, sp /* pt_regs */
> > > > +   call ret_from_fork_user
> > > > +   j ret_from_exception
> > > > +SYM_CODE_END(ret_from_fork_user_asm)
> > > >   #ifdef CONFIG_IRQ_STACKS
> > > >   /*
> > > > diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> > > > index 0d07e6d8f6b57beba438dbba5e8c74a014582bee..5f15236cb526bd9fe61636ed372b4b76c94df946 100644
> > > > --- a/arch/riscv/kernel/process.c
> > > > +++ b/arch/riscv/kernel/process.c
> > > > @@ -38,7 +38,8 @@ unsigned long __stack_chk_guard __read_mostly;
> > > >   EXPORT_SYMBOL(__stack_chk_guard);
> > > >   #endif
> > > > -extern asmlinkage void ret_from_fork_asm(void);
> > > > +extern asmlinkage void ret_from_fork_kernel_asm(void);
> > > > +extern asmlinkage void ret_from_fork_user_asm(void);
> > > >   void noinstr arch_cpu_idle(void)
> > > >   {
> > > > @@ -208,14 +209,18 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
> > > >     return 0;
> > > >   }
> > > > -asmlinkage void ret_from_fork(void *fn_arg, int (*fn)(void *), struct pt_regs *regs)
> > > > +asmlinkage void ret_from_fork_kernel(void *fn_arg, int (*fn)(void *), struct pt_regs *regs)
> > > >   {
> > > > -   if (unlikely(fn))
> > > > -           fn(fn_arg);
> > > > +   fn(fn_arg);
> > > >     syscall_exit_to_user_mode(regs);
> > > >   }
> > > > +asmlinkage void ret_from_fork_user(struct pt_regs *regs)
> > > > +{
> > > > +   syscall_exit_to_user_mode(regs);
> > > > +}
> > > > +
> > > >   int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
> > > >   {
> > > >     unsigned long clone_flags = args->flags;
> > > > @@ -238,6 +243,7 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
> > > >             p->thread.s[0] = (unsigned long)args->fn;
> > > >             p->thread.s[1] = (unsigned long)args->fn_arg;
> > > > +           p->thread.ra = (unsigned long)ret_from_fork_kernel_asm;
> > > >     } else {
> > > >             *childregs = *(current_pt_regs());
> > > >             /* Turn off status.VS */
> > > > @@ -247,12 +253,11 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
> > > >             if (clone_flags & CLONE_SETTLS)
> > > >                     childregs->tp = tls;
> > > >             childregs->a0 = 0; /* Return value of fork() */
> > > > -           p->thread.s[0] = 0;
> > > > +           p->thread.ra = (unsigned long)ret_from_fork_user_asm;
> > > >     }
> > > >     p->thread.riscv_v_flags = 0;
> > > >     if (has_vector())
> > > >             riscv_v_thread_alloc(p);
> > > > -   p->thread.ra = (unsigned long)ret_from_fork_asm;
> > > >     p->thread.sp = (unsigned long)childregs; /* kernel sp */
> > > >     return 0;
> > > >   }
> > > >
> > >
> > > Can you benchmark this change on some HW? I'm not sure we would indeed gain
> > > this 1%.
> >
> > It reduces the syscall path by 3 instructions, two for not needing to
> > move the fn and fn_args from:
> >
> > move a0, s1 /* fn */
> > move a1, s0 /* fn_arg */
> >
> > And one for not needing to do the conditional. This one is also saved on
> > kernel threads.
> >
> > It's a very small improvement, but there is only something like 100
> > instructions along the direct syscall path so it ends up being a large
> > percentage. On hardware moving registers is very cheap and this branch
> > will be almost always be correctly predicted so the cost is close to
> > zero. I just figured that since I am making changes around here it would
> > be nice if it was optimal instead of being close to optimal.
> 
> That may be the case on the child process side, but compared to the
> cost of the fork on the parent process side (allocating and
> initializing a new task struct), it's miniscule.
> 

Yes that is a good point. The change will have a probably unnoticeable
effect, mostly just depends on how people want this code to look.

- Charlie

> 
> 
> Brian Gerst
