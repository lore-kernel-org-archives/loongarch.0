Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3DACA64
	for <loongarch@lists.linux.dev>; Fri, 24 Jan 2025 13:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737724140; cv=none; b=luC05Nh07bLDHiAb6IKI01GcvfVlrF2nXrkqBOgo2HXiIgYjKUNVyyRWRwW/wj//1Cl/8cT+TnkZiHCLFrpBWtM707xbX3LD+FtHjMVqnZOwuciBhT8u9ZlkhUuGTYfbAfp81iI9f46VF2R3BgnRuJZtkwtHyL30HJjqc3MzEpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737724140; c=relaxed/simple;
	bh=FRKkg2WeqZpP3s4E4jGDaA1S0NzW6pWwV/ZtZGn2VO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zit9Eke8eptMF6K6R+bqUlS2WtbgilLROKWAw5fJtzuOt4WQzXUHkpbNTTtsKACnu4MVhKS5yXegSQA3Brz/2vZrW5SNpf+bRCZ/eGjfd1PECv1FfQ4UrqsvPedXlmOAHo0nWzC5P3FRf3oV8sFbuOd8C3kAWz/jI4Jm/HBdHMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V9jrFjY2; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V9jrFjY2"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-543cc81ddebso319367e87.1
        for <loongarch@lists.linux.dev>; Fri, 24 Jan 2025 05:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737724136; x=1738328936; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vDJAtGJ/zMEYhFkMGfbSVTh26K1so6Pl/GTU/JVyf0o=;
        b=V9jrFjY2V1WWzt8oRtyGvknDuTDa9Y1vjrQFF4VLWxa2Nr4W3xeu4LxbCa2FmO/mmg
         Zwp1Ou2c8Ybbf/+I9GA4u5bwUJEtjr8tBzJsPY2OYSXHaAiLl9aFfQEammnZhpP7bUz2
         jl5ijWsfvd9jHHbj6s08xADnaoaXhcu9QUW+6JP2OrHxf5ALhSuJVA90P81HFFaJvkue
         mUAY6rx7LxXaNPJs/gneadL3ZKKa2k87MUZ+REEYYSOI/xJS0fedaGsVoFVJqVLbCxuE
         Pb1vfuayQ4DnWuqC9421/u0+KNqyoWJBsycVP+Akbb86scozGFpcynBlkrJYenbtQx42
         foWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737724136; x=1738328936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vDJAtGJ/zMEYhFkMGfbSVTh26K1so6Pl/GTU/JVyf0o=;
        b=OqnyBrAMgNxvvsatW0qRExyZsoLvf5WsuN/xOeNS87lnWMNXdEqle/+Y4b5E97Zl6h
         /ZXXkfQDOaj6OwWSJUkYOWqOHS1Zh8km3wrSc154IT4XCjtJdGwdU5brSdJrJzK9pFoV
         z2gE0kybx0NOKGcbyqWGe1f+JbvH4ItYPJaRtewMetY0lZK73HyCuPf2xuemSa3NcVb3
         DyEIJj6Go7Wvl7//A4Joy7oH41sdCUMNsoEWMBKjRnv6fCO8x0WC1C1+ZiUvy5I3DMu0
         sKVoFKsFN7bz4fQln0R9QNF3PsayKhlRrIQDPHsjcfUYZjFwLmsMGajxIS2/iPlIap63
         dkUg==
X-Forwarded-Encrypted: i=1; AJvYcCVk5oGLs/a8iM0AHPvdP82jZV0nv1RiGz3jLGis/oxSVzgoH4Aqbzpaf0prMtqiFzr+aaO6dXiQBJI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwCJkq9mHrPyRpAMXt89ra/QPq7ox4yjkuS9jbgk63n6yi+V2EJ
	rMA5sxNYQePgQHCy7z+R8PxmcgBwPFXJZngGbZm9LM0bRoPzynDF4rEQX9u4Bccc6y4eFyRh78y
	hCecWyRkS1UKUBnvDe0QcWCPEhw==
X-Gm-Gg: ASbGncvcHmH9UF/JBcmGCYwPKuhq3Cm/jBC7zI5GGir5FFBLhwn86wEKluT6rPEayNa
	hGIs4qpwhB8frNYXmyhFr9bN8oVed04InFfgwX9SSMfnb40bTmVlZGXto8R4mIUgX/I+t3/R1PR
	kW
X-Google-Smtp-Source: AGHT+IGCNvJ7EgcnoF3QHnHMqKw/UAmUFjGDJjH1iVtnR9s74xJWvxerOMvE4ZmsPL/fP9iLvOMiyMoMp3XT2gRsRrI=
X-Received: by 2002:ac2:5471:0:b0:542:2192:3eb6 with SMTP id
 2adb3069b0e04-5439c2875ecmr8654363e87.52.1737724136244; Fri, 24 Jan 2025
 05:08:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250123-riscv_optimize_entry-v2-0-7c259492d508@rivosinc.com>
 <20250123-riscv_optimize_entry-v2-2-7c259492d508@rivosinc.com>
 <6ebe8b7c-7df3-4bea-9175-35512e9960a7@ghiti.fr> <Z5NG7-0YyophMcZy@ghost>
In-Reply-To: <Z5NG7-0YyophMcZy@ghost>
From: Brian Gerst <brgerst@gmail.com>
Date: Fri, 24 Jan 2025 08:08:44 -0500
X-Gm-Features: AWEUYZnIDwsF945WyHr9mtBFNIjlBwvALsm-NE6fl2eYJrt8m8IoEvZ8uO1jeLo
Message-ID: <CAMzpN2gL9GWx-YzJd+sgQ30=gk3TN342W8Memz5j1C02jgQfrg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] riscv: entry: Split ret_from_fork() into user and kernel
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 24, 2025 at 2:53=E2=80=AFAM Charlie Jenkins <charlie@rivosinc.c=
om> wrote:
>
> On Fri, Jan 24, 2025 at 08:19:18AM +0100, Alexandre Ghiti wrote:
> > Hi Charlie,
> >
> > On 23/01/2025 20:14, Charlie Jenkins wrote:
> > > This function was unified into a single function in commit ab9164dae2=
73
> > > ("riscv: entry: Consolidate ret_from_kernel_thread into ret_from_fork=
").
> > > However that imposed a performance degradation. Partially reverting t=
his
> > > commit to have ret_from_fork() split again results in a 1% increase o=
n
> > > the number of times fork is able to be called per second.
> > >
> > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > ---
> > >   arch/riscv/include/asm/asm-prototypes.h |  3 ++-
> > >   arch/riscv/kernel/entry.S               | 13 ++++++++++---
> > >   arch/riscv/kernel/process.c             | 17 +++++++++++------
> > >   3 files changed, 23 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/arch/riscv/include/asm/asm-prototypes.h b/arch/riscv/inc=
lude/asm/asm-prototypes.h
> > > index 733ff609778797001006c33bba9e3cc5b1f15387..bfc8ea5f9319b19449ec5=
9493b45b926df888832 100644
> > > --- a/arch/riscv/include/asm/asm-prototypes.h
> > > +++ b/arch/riscv/include/asm/asm-prototypes.h
> > > @@ -52,7 +52,8 @@ DECLARE_DO_ERROR_INFO(do_trap_ecall_s);
> > >   DECLARE_DO_ERROR_INFO(do_trap_ecall_m);
> > >   DECLARE_DO_ERROR_INFO(do_trap_break);
> > > -asmlinkage void ret_from_fork(void *fn_arg, int (*fn)(void *), struc=
t pt_regs *regs);
> > > +asmlinkage void ret_from_fork_kernel(void *fn_arg, int (*fn)(void *)=
, struct pt_regs *regs);
> > > +asmlinkage void ret_from_fork_user(struct pt_regs *regs);
> > >   asmlinkage void handle_bad_stack(struct pt_regs *regs);
> > >   asmlinkage void do_page_fault(struct pt_regs *regs);
> > >   asmlinkage void do_irq(struct pt_regs *regs);
> > > diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> > > index 9225c322279aa90e737b1d7144db084319cf8103..9386ef7444267f0b9bf8a=
0550f4e31deaeb85881 100644
> > > --- a/arch/riscv/kernel/entry.S
> > > +++ b/arch/riscv/kernel/entry.S
> > > @@ -319,14 +319,21 @@ SYM_CODE_END(handle_kernel_stack_overflow)
> > >   ASM_NOKPROBE(handle_kernel_stack_overflow)
> > >   #endif
> > > -SYM_CODE_START(ret_from_fork_asm)
> > > +SYM_CODE_START(ret_from_fork_kernel_asm)
> > >     call schedule_tail
> > >     move a0, s1 /* fn */
> > >     move a1, s0 /* fn_arg */
> > >     move a2, sp /* pt_regs */
> > > -   call ret_from_fork
> > > +   call ret_from_fork_kernel
> > >     j ret_from_exception
> > > -SYM_CODE_END(ret_from_fork_asm)
> > > +SYM_CODE_END(ret_from_fork_kernel_asm)
> > > +
> > > +SYM_CODE_START(ret_from_fork_user_asm)
> > > +   call schedule_tail
> > > +   move a0, sp /* pt_regs */
> > > +   call ret_from_fork_user
> > > +   j ret_from_exception
> > > +SYM_CODE_END(ret_from_fork_user_asm)
> > >   #ifdef CONFIG_IRQ_STACKS
> > >   /*
> > > diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.=
c
> > > index 0d07e6d8f6b57beba438dbba5e8c74a014582bee..5f15236cb526bd9fe6163=
6ed372b4b76c94df946 100644
> > > --- a/arch/riscv/kernel/process.c
> > > +++ b/arch/riscv/kernel/process.c
> > > @@ -38,7 +38,8 @@ unsigned long __stack_chk_guard __read_mostly;
> > >   EXPORT_SYMBOL(__stack_chk_guard);
> > >   #endif
> > > -extern asmlinkage void ret_from_fork_asm(void);
> > > +extern asmlinkage void ret_from_fork_kernel_asm(void);
> > > +extern asmlinkage void ret_from_fork_user_asm(void);
> > >   void noinstr arch_cpu_idle(void)
> > >   {
> > > @@ -208,14 +209,18 @@ int arch_dup_task_struct(struct task_struct *ds=
t, struct task_struct *src)
> > >     return 0;
> > >   }
> > > -asmlinkage void ret_from_fork(void *fn_arg, int (*fn)(void *), struc=
t pt_regs *regs)
> > > +asmlinkage void ret_from_fork_kernel(void *fn_arg, int (*fn)(void *)=
, struct pt_regs *regs)
> > >   {
> > > -   if (unlikely(fn))
> > > -           fn(fn_arg);
> > > +   fn(fn_arg);
> > >     syscall_exit_to_user_mode(regs);
> > >   }
> > > +asmlinkage void ret_from_fork_user(struct pt_regs *regs)
> > > +{
> > > +   syscall_exit_to_user_mode(regs);
> > > +}
> > > +
> > >   int copy_thread(struct task_struct *p, const struct kernel_clone_ar=
gs *args)
> > >   {
> > >     unsigned long clone_flags =3D args->flags;
> > > @@ -238,6 +243,7 @@ int copy_thread(struct task_struct *p, const stru=
ct kernel_clone_args *args)
> > >             p->thread.s[0] =3D (unsigned long)args->fn;
> > >             p->thread.s[1] =3D (unsigned long)args->fn_arg;
> > > +           p->thread.ra =3D (unsigned long)ret_from_fork_kernel_asm;
> > >     } else {
> > >             *childregs =3D *(current_pt_regs());
> > >             /* Turn off status.VS */
> > > @@ -247,12 +253,11 @@ int copy_thread(struct task_struct *p, const st=
ruct kernel_clone_args *args)
> > >             if (clone_flags & CLONE_SETTLS)
> > >                     childregs->tp =3D tls;
> > >             childregs->a0 =3D 0; /* Return value of fork() */
> > > -           p->thread.s[0] =3D 0;
> > > +           p->thread.ra =3D (unsigned long)ret_from_fork_user_asm;
> > >     }
> > >     p->thread.riscv_v_flags =3D 0;
> > >     if (has_vector())
> > >             riscv_v_thread_alloc(p);
> > > -   p->thread.ra =3D (unsigned long)ret_from_fork_asm;
> > >     p->thread.sp =3D (unsigned long)childregs; /* kernel sp */
> > >     return 0;
> > >   }
> > >
> >
> > Can you benchmark this change on some HW? I'm not sure we would indeed =
gain
> > this 1%.
>
> It reduces the syscall path by 3 instructions, two for not needing to
> move the fn and fn_args from:
>
> move a0, s1 /* fn */
> move a1, s0 /* fn_arg */
>
> And one for not needing to do the conditional. This one is also saved on
> kernel threads.
>
> It's a very small improvement, but there is only something like 100
> instructions along the direct syscall path so it ends up being a large
> percentage. On hardware moving registers is very cheap and this branch
> will be almost always be correctly predicted so the cost is close to
> zero. I just figured that since I am making changes around here it would
> be nice if it was optimal instead of being close to optimal.

That may be the case on the child process side, but compared to the
cost of the fork on the parent process side (allocating and
initializing a new task struct), it's miniscule.



Brian Gerst
