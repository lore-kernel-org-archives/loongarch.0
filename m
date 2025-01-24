Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9E88F6C
	for <loongarch@lists.linux.dev>; Fri, 24 Jan 2025 18:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737743001; cv=none; b=CJRBLXlwxNRhJZyZoKeumdM8J299lTzyXrey/BOZiozKdO0sxJWDPKJ0jjpqvMQaIO/P9LPLux995gzDJwFzk6DXLq5Q3k3J0zeM11PRzL1NmoL9PRoNmTjkB94PNwwlBpQ5I3KNda5G9IaX8pxT/oB3/n+vPTe9jUv0l1iYz8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737743001; c=relaxed/simple;
	bh=y3iIsWeWGHo0ltkA9gy7eXOdJFOX+uwzZPJtLIXikVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nnQN5MWZ5G5ziRPYgkWdvXdnuMr9vS2ktUVQ2xmaql50p3YdbrT75+aSe9qU9wXBw1Sf/7nyMZWsf8JMRYU50n4Bs6HJzv8pW5r1lITcYg9iEuiGlcWRhOCrITReFIWU2pgoirIhReMHEJ3aO8PCJFcgA22OwbCEpR5IgEJyQ4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=bB59y4uE; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="bB59y4uE"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21669fd5c7cso43849675ad.3
        for <loongarch@lists.linux.dev>; Fri, 24 Jan 2025 10:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737742997; x=1738347797; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TmhY1Ao+VmFSDo1BmTvqptG8gc/CxBrrxfn8sS/HsAc=;
        b=bB59y4uEhnK6ndLYUlzXpM3K8k9bkCHqM/KRd5fjYXSrl2OlJZYGRSLLBZe2ntEOjE
         60znp5lF+iL1wUYu1fmyJkCOY2WbGBCyJLg528w2rNmaugSa8o5WhCsG56+31xjxoXhz
         3/vfhhAjZN1RHp0YSU9QO8cm/nUCb5pBcLIlrUwm84QAOf6wq7b/DdVmQfFV/0O4kTBB
         X97oh1j9kQfRr0o57g2WJnVIgOYL5bhRlOhD23D41GzyfkPWPzEelO7v5HmQ+I0aw1bS
         f2xz4g68/rs+30GdNfuhLJ1si3MzpcA3RT5BoAe8zr048hEwuqta9j6EGJr/KYeNOBW+
         V/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737742997; x=1738347797;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TmhY1Ao+VmFSDo1BmTvqptG8gc/CxBrrxfn8sS/HsAc=;
        b=P+/qNxwG1K2BsFL1mvIcKGfWnBetwdLrmsPREpL+6pmLjXzr8VhrG5HoF/pBftSLM5
         WUwFU4NOw6u/YSZcvlA38ry3kc7P+4btStc+MDoPHhZ+Kv5wm9CkrVibnL9TgLJSgb1N
         6qT3y/Au3p1UZj+MSYAoqihxIU0bBK+8jpTxexqnCOKtjv8fsp4Ua/gxNel63GZCO5Eg
         6LuFoIhhIz43D84dPuXImGqGcN7CbdgfvxydczqqHgv7YhauGRsaq2IV5993wS5E+0ip
         DAcPjY8UnXC+eG7ROo0WcFxaSZtTvPym1/Ttti5Rk+wtqas/x6lqE3bI4dvUWkdSX7i1
         9Taw==
X-Forwarded-Encrypted: i=1; AJvYcCXLXEkvUFFqWqBNhbgABuDsR1lKXESFZOYRUt0itwwrfVsH4wb1oNXs78kNJgUZOTqCxRX8nDuLryE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1dxplhEnx9wmvPNrl2L1Qq4ilozHiuz9PXuNe3rNUMyaEtFTb
	StmBgWPJ5h+LgHmXZ1KfoUi7kwONJRhszzi2+amTXmDVEh4LrdWB+tOckcAv/Z0=
X-Gm-Gg: ASbGncvQLK/6xb1RM3MF6FFTWDrWnB9H9t17Ti0nZxW7ohHxJMdhaMGaivzSaaSL5Vh
	JLYZ0eJxrpTDlAzVET3e7FRmS5fJO3OfWpRD5REywgP8/vLKwlU1677rto7mi48Brond1IyJRyp
	7jM0gVaEo53AirJteeN4jFKR3b/pJwP0RvKMXi7Q5T7aQ48j5WAwKc4tSb4ZdZSJig8zSqIOjHZ
	yVvFKkU7s1eNmN00JhIV1YwmoahyO0MpfX6+8gY+QQ1TWsA0b/XisBH7x17s0bqoVy5G5H4tzk=
X-Google-Smtp-Source: AGHT+IE6FKbO9CSqOPIUS3pPhPqeJw2iYJFTBLHuyDPPhL8KY4QiJJLGFriia3fJ1HeHTCC8w5ilww==
X-Received: by 2002:a17:902:ea03:b0:215:b33b:e26d with SMTP id d9443c01a7336-21c3550c5d3mr520132085ad.21.1737742997486;
        Fri, 24 Jan 2025 10:23:17 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:63b:8ac9:503a:b81d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da413f474sm19579925ad.130.2025.01.24.10.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 10:23:16 -0800 (PST)
Date: Fri, 24 Jan 2025 10:23:14 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Brian Gerst <brgerst@gmail.com>
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
Subject: Re: [PATCH v2 1/4] riscv: entry: Convert ret_from_fork() to C
Message-ID: <Z5Pakko46SmUsz9d@ghost>
References: <20250123-riscv_optimize_entry-v2-0-7c259492d508@rivosinc.com>
 <20250123-riscv_optimize_entry-v2-1-7c259492d508@rivosinc.com>
 <CAMzpN2gZrL8xusm8oDz-Oy6sZwjmYWshfx=hTUe7yL5M6UJSmw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMzpN2gZrL8xusm8oDz-Oy6sZwjmYWshfx=hTUe7yL5M6UJSmw@mail.gmail.com>

On Fri, Jan 24, 2025 at 08:14:08AM -0500, Brian Gerst wrote:
> On Thu, Jan 23, 2025 at 2:15 PM Charlie Jenkins <charlie@rivosinc.com> wrote:
> >
> > Move the main section of ret_from_fork() to C to allow inlining of
> > syscall_exit_to_user_mode().
> >
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/asm-prototypes.h |  1 +
> >  arch/riscv/kernel/entry.S               | 15 ++++++---------
> >  arch/riscv/kernel/process.c             | 14 ++++++++++++--
> >  3 files changed, 19 insertions(+), 11 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/asm-prototypes.h b/arch/riscv/include/asm/asm-prototypes.h
> > index cd627ec289f163a630b73dd03dd52a6b28692997..733ff609778797001006c33bba9e3cc5b1f15387 100644
> > --- a/arch/riscv/include/asm/asm-prototypes.h
> > +++ b/arch/riscv/include/asm/asm-prototypes.h
> > @@ -52,6 +52,7 @@ DECLARE_DO_ERROR_INFO(do_trap_ecall_s);
> >  DECLARE_DO_ERROR_INFO(do_trap_ecall_m);
> >  DECLARE_DO_ERROR_INFO(do_trap_break);
> >
> > +asmlinkage void ret_from_fork(void *fn_arg, int (*fn)(void *), struct pt_regs *regs);
> >  asmlinkage void handle_bad_stack(struct pt_regs *regs);
> >  asmlinkage void do_page_fault(struct pt_regs *regs);
> >  asmlinkage void do_irq(struct pt_regs *regs);
> > diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> > index 33a5a9f2a0d4e1eeccfb3621b9e518b88e1b0704..9225c322279aa90e737b1d7144db084319cf8103 100644
> > --- a/arch/riscv/kernel/entry.S
> > +++ b/arch/riscv/kernel/entry.S
> > @@ -319,17 +319,14 @@ SYM_CODE_END(handle_kernel_stack_overflow)
> >  ASM_NOKPROBE(handle_kernel_stack_overflow)
> >  #endif
> >
> > -SYM_CODE_START(ret_from_fork)
> > +SYM_CODE_START(ret_from_fork_asm)
> >         call schedule_tail
> > -       beqz s0, 1f     /* not from kernel thread */
> > -       /* Call fn(arg) */
> > -       move a0, s1
> > -       jalr s0
> > -1:
> > -       move a0, sp /* pt_regs */
> > -       call syscall_exit_to_user_mode
> > +       move a0, s1 /* fn */
> > +       move a1, s0 /* fn_arg */
> > +       move a2, sp /* pt_regs */
> > +       call ret_from_fork
> >         j ret_from_exception
> > -SYM_CODE_END(ret_from_fork)
> > +SYM_CODE_END(ret_from_fork_asm)
> >
> >  #ifdef CONFIG_IRQ_STACKS
> >  /*
> > diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> > index 58b6482c2bf662bf5224ca50c8e21a68760a6b41..0d07e6d8f6b57beba438dbba5e8c74a014582bee 100644
> > --- a/arch/riscv/kernel/process.c
> > +++ b/arch/riscv/kernel/process.c
> > @@ -17,7 +17,9 @@
> >  #include <linux/ptrace.h>
> >  #include <linux/uaccess.h>
> >  #include <linux/personality.h>
> > +#include <linux/entry-common.h>
> >
> > +#include <asm/asm-prototypes.h>
> >  #include <asm/unistd.h>
> >  #include <asm/processor.h>
> >  #include <asm/csr.h>
> > @@ -36,7 +38,7 @@ unsigned long __stack_chk_guard __read_mostly;
> >  EXPORT_SYMBOL(__stack_chk_guard);
> >  #endif
> >
> > -extern asmlinkage void ret_from_fork(void);
> > +extern asmlinkage void ret_from_fork_asm(void);
> >
> >  void noinstr arch_cpu_idle(void)
> >  {
> > @@ -206,6 +208,14 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
> >         return 0;
> >  }
> >
> > +asmlinkage void ret_from_fork(void *fn_arg, int (*fn)(void *), struct pt_regs *regs)
> > +{
> > +       if (unlikely(fn))
> > +               fn(fn_arg);
> > +
> > +       syscall_exit_to_user_mode(regs);
> > +}
> > +
> >  int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
> >  {
> >         unsigned long clone_flags = args->flags;
> > @@ -242,7 +252,7 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
> >         p->thread.riscv_v_flags = 0;
> >         if (has_vector())
> >                 riscv_v_thread_alloc(p);
> > -       p->thread.ra = (unsigned long)ret_from_fork;
> > +       p->thread.ra = (unsigned long)ret_from_fork_asm;
> >         p->thread.sp = (unsigned long)childregs; /* kernel sp */
> >         return 0;
> >  }
> >
> > --
> > 2.43.0
> >
> >
> 
> Is there a specific reason you didn't move the call to schedule_tail()
> to the C function, like on x86?

Yes, the generated code ends up being dramatically worse if
schedule_tail() is moved into C. This is because the arg for
schedule_tail() is already in a0 so the extra stack manipulation
instructions end up taking up a lot of instructions.

With this change:
<ret_from_fork_asm>:
       ff65b097                auipc   ra,0xff65b
       1ee080e7                jalr    494(ra) # ffffffff8005038a <schedule_tail>
       8526                    mv      a0,s1
       85a2                    mv      a1,s0
       860a                    mv      a2,sp
       ff61b097                auipc   ra,0xff61b
       606080e7                jalr    1542(ra) # ffffffff800107b0 <ret_from_fork>
       b5f5                    j       ffffffff809f509e <ret_from_exception>


<ret_from_fork>:
       1101                    addi    sp,sp,-32
       e822                    sd      s0,16(sp)
       ec06                    sd      ra,24(sp)
       1000                    addi    s0,sp,32
       e991                    bnez    a1,ffffffff800107cc <ret_from_fork+0x1c>
       8532                    mv      a0,a2
       009db097                auipc   ra,0x9db
       a32080e7                jalr    -1486(ra) # ffffffff809eb1ee <syscall_exit_to_user_mode>
       60e2                    ld      ra,24(sp)
       6442                    ld      s0,16(sp)
       6105                    addi    sp,sp,32
       8082                    ret
       <following instructions used only in the kernel thread case>
       fec43423                sd      a2,-24(s0)
       9582                    jalr    a1
       fe843603                ld      a2,-24(s0)
       8532                    mv      a0,a2
       009db097                auipc   ra,0x9db
       a16080e7                jalr    -1514(ra) # ffffffff809eb1ee <syscall_exit_to_user_mode>
       60e2                    ld      ra,24(sp)
       6442                    ld      s0,16(sp)
       6105                    addi    sp,sp,32
       8082                    ret

Contrasted with what this looks like if schedule_tail() is called from
C.

<ret_from_fork_asm>:
       85a6                    mv      a1,s1
       8622                    mv      a2,s0
       868a                    mv      a3,sp
       ff61b097                auipc   ra,0xff61b
       60e080e7                jalr    1550(ra) # ffffffff800107b0 <ret_from_fork>
       bdd5                    j       ffffffff809f509e <ret_from_exception>

<ret_from_fork>:
       7179                    addi    sp,sp,-48
       f022                    sd      s0,32(sp)
       ec26                    sd      s1,24(sp)
       e84a                    sd      s2,16(sp)
       e44e                    sd      s3,8(sp)
       f406                    sd      ra,40(sp)
       1800                    addi    s0,sp,48
       84b2                    mv      s1,a2
       89ae                    mv      s3,a1
       8936                    mv      s2,a3
       3c73f0ef                jal     ffffffff8005038a <schedule_tail>
       ec89                    bnez    s1,ffffffff800107e2 <ret_from_fork+0x32>
       854a                    mv      a0,s2
       009db097                auipc   ra,0x9db
       a22080e7                jalr    -1502(ra) # ffffffff809eb1ee <syscall_exit_to_user_mode>
       70a2                    ld      ra,40(sp)
       7402                    ld      s0,32(sp)
       64e2                    ld      s1,24(sp)
       6942                    ld      s2,16(sp)
       69a2                    ld      s3,8(sp)
       6145                    addi    sp,sp,48
       8082                    ret
       854e                    mv      a0,s3
       9482                    jalr    s1
       b7d5                    j       ffffffff800107ca <ret_from_fork+0x1a>


ret_from_fork_asm ends up being 2 instructions more when calling from
asm, but the user fork ret_from_fork ends up being only 12 instructions
rather than 22 instructions when calling from C. If we were able to mix
asm and C code in a naked function we would be able to get rid of the
stack manipulation and still be able to inline C but we don't live in
that world...

- Charlie

> 
> 
> Brian Gerst
