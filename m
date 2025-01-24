Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240E121B8F2
	for <loongarch@lists.linux.dev>; Fri, 24 Jan 2025 18:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737743335; cv=none; b=d3Icj/Txqi3r5E/dJXV5gBQP6zmnVzQTQz7KszfZvEFjT6yuk+TQp/fpQI4/AmNod8BHasFkfIYUWY0+DMRaNNG3KqleL5PEkNl+IHdkRDBfCvoBaISGx9b8kUkbrJiQKdzAEYQez0ioV5DVInCHwlS8McsunRSC+VK8bF5Bt+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737743335; c=relaxed/simple;
	bh=e7novaT/1nBh0GJFAywGIHyXlsgrNo1ecH1o9NzCRss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f41djMU9fy0qsGs0Qi5st2GL8t05DfvdJZJ+tcsRueWdCzkWWMuQmpV8IAmeMGPsKcjgB2BrGpqh+eGfQ2OC2jDrxVbiCDkgZeoNE+rLQOt9c9IcJqzSF9+sLexd+dLJ2iZPN4a/pjb2iTSftHo9H0cKQ4JigQrCQfItN0LP7L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=rFW0VuxW; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="rFW0VuxW"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ef6c56032eso3400318a91.2
        for <loongarch@lists.linux.dev>; Fri, 24 Jan 2025 10:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737743333; x=1738348133; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8mi8VPKnc/rijmPRv6U/IJSuAJ48E0dl7KypEOb/XOU=;
        b=rFW0VuxWaH+Pb//zMEvCQIl1zpuFlYaaP2IC84sp99TAV5ZkcaWzQLjDF45JAlPYeU
         4hreVUty2D80gQADhOEeqbrXs/iWpnUVroPl/uXOVaXAtfEaSjZd79EN7w2mL2NTYJ5S
         rrkbtV9o4/s0CiclZkz+nzY+ySvHUQubcuT2NGyz7v2CPxEDYhXiF3J5PxP+liO9O3tH
         gGbjLR015PbdyhxRNuQigR2QDz6lCkYqfVoXU7pWHkHtWwsi2dTVZbi3nsgahV3015/N
         FeDZjPux16AaFv8N69VFMhGjz/Hf6SJC+HIhYFyHYx1SbCwUBMnQvhqxIHdYRTRxa7XV
         D2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737743333; x=1738348133;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8mi8VPKnc/rijmPRv6U/IJSuAJ48E0dl7KypEOb/XOU=;
        b=AwGepvEq2mlnV6xuD8iUSYQT2rQR8wQiznxyWibPZTvqqR3/plFtO2EU+Aolt9EyHW
         AJbPlihXAHPam+ZUEyv68dRgK+o/lyt/jOSOhUo+7cym45yoRz48w0rAk5UVsEZ2zmLp
         y1faBCn+9lumpoCANG9dYDbTFFTuwA4nCGu/1oEiU6RCG5fwCqM2EqFAved5HrsA5WOG
         NTshQ89E0JYnmzIpKGZZJPbLrAZO0RZ00KU80HJLgQcoRuLwbkHNw7/nufFH+7KG8mFK
         azaoU9KJabiAJmRiGpyHLu4JtKUIDvKOv+ih7zuf12rB0wHAF34r8OYqZtha117SguJW
         ItGQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0fqOOi/KSHwf27V6MX33y66s1sK/jYjiGz0KEwf3eYrM5mzuYhlPPjFBe1Qo3bXiibEFijzHcZOE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwMOpuX+3DARet9pHa+nFgNa1DSF5sIcKz09SbE9nn62LM6V4/L
	XEeteu+szTbJSSNba27hvF6hAATxgjRAguDCX/Ldg+3IvRkS/I2u2CNKuvWluvY=
X-Gm-Gg: ASbGncvdMGItDQX+ZQpsXBMeL62TkV8ClcR5NHfiDFHgrRgGev6/vo8hicB46pPrvVh
	rIyPfBDq6vRS9XcUsMsV+p9YwRHxE0MqtJDGPHSqP4fBjJCPnnPUOTv47PuMzxTWXLNJpSiV2i3
	foTchwEljrIo1m9q7QCahFAn9A0aWCuPzVNtwT4qUBUffUibLMK5srSPXQiPAJIxhgXc8QGw1CX
	vVXDKF9zaW4/FF9KfbLIH97zfGMxCg9Zrj5pOvxiPAdXXwtwe1S5/1/CxDKX72V07NVm1eXqDA=
X-Google-Smtp-Source: AGHT+IHA4N16HWh6D6ociCzA4jkBLKWzl7eCVyJWgy/BQ7/q5B7t82MMNw4lNH/Bv7YLi+Hi+jI30g==
X-Received: by 2002:a17:90a:c888:b0:2f4:f7f8:fc8a with SMTP id 98e67ed59e1d1-2f782d8cd4emr49337076a91.33.1737743333401;
        Fri, 24 Jan 2025 10:28:53 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:63b:8ac9:503a:b81d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa76d1csm2055339a91.32.2025.01.24.10.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 10:28:52 -0800 (PST)
Date: Fri, 24 Jan 2025 10:28:50 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: Re: [PATCH v2 3/4] loongarch: entry: Migrate ret_from_fork() to C
Message-ID: <Z5Pb4jsO_qH6Wrx7@ghost>
References: <20250123-riscv_optimize_entry-v2-0-7c259492d508@rivosinc.com>
 <20250123-riscv_optimize_entry-v2-3-7c259492d508@rivosinc.com>
 <CAAhV-H7RSn2ek5CeLnohTcrh=0unDNmaLDq+yDH2oqshoeRMNQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhV-H7RSn2ek5CeLnohTcrh=0unDNmaLDq+yDH2oqshoeRMNQ@mail.gmail.com>

On Fri, Jan 24, 2025 at 05:05:21PM +0800, Huacai Chen wrote:
> Hi, Charlie,
> 
> On Fri, Jan 24, 2025 at 3:15 AM Charlie Jenkins <charlie@rivosinc.com> wrote:
> >
> > Loongarch is the only architecture that calls
> We usually use "LoongArch" instead of "loongarch" or "Loongarch".
> 
> > syscall_exit_to_user_mode() from asm. Move the call into C so that this
> > function can be inlined across all architectures.
> >
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  arch/loongarch/include/asm/asm-prototypes.h |  5 +++++
> >  arch/loongarch/include/asm/switch_to.h      |  8 +++++++
> >  arch/loongarch/kernel/entry.S               | 22 +++++++++----------
> >  arch/loongarch/kernel/process.c             | 34 ++++++++++++++++++++++++-----
> >  4 files changed, 51 insertions(+), 18 deletions(-)
> >
> > diff --git a/arch/loongarch/include/asm/asm-prototypes.h b/arch/loongarch/include/asm/asm-prototypes.h
> > index 51f224bcfc654228ae423e9a066b25b35102a5b9..0195d4309fd29f94664d5f34247198c769033b1b 100644
> > --- a/arch/loongarch/include/asm/asm-prototypes.h
> > +++ b/arch/loongarch/include/asm/asm-prototypes.h
> > @@ -12,3 +12,8 @@ __int128_t __ashlti3(__int128_t a, int b);
> >  __int128_t __ashrti3(__int128_t a, int b);
> >  __int128_t __lshrti3(__int128_t a, int b);
> >  #endif
> > +
> > +asmlinkage void noinstr __no_stack_protector ret_from_kernel_thread(struct task_struct *prev,
> > +                                                                   struct pt_regs *regs,
> > +                                                                   int (*fn)(void *),
> > +                                                                   void *fn_arg);
> It is a little strange that we only need to declare
> ret_from_kernel_thread() but not ret_from_fork().

Just an oversight by me, thank you for pointing that out.

> 
> > diff --git a/arch/loongarch/include/asm/switch_to.h b/arch/loongarch/include/asm/switch_to.h
> > index 5b225aff3ba21aa06d0713bc8e73e1b941389630..a1c5576f1fd145670e13038bec6dd390486099ab 100644
> > --- a/arch/loongarch/include/asm/switch_to.h
> > +++ b/arch/loongarch/include/asm/switch_to.h
> > @@ -26,6 +26,14 @@ extern asmlinkage struct task_struct *__switch_to(struct task_struct *prev,
> >                         struct task_struct *next, struct thread_info *next_ti,
> >                         void *sched_ra, void *sched_cfa);
> >
> > +void noinstr __no_stack_protector ret_from_kernel_thread(struct task_struct *prev,
> > +                                                        struct pt_regs *regs,
> > +                                                        int (*fn)(void *),
> > +                                                        void *fn_arg);
> > +
> > +void noinstr __no_stack_protector ret_from_fork(struct task_struct *prev,
> > +                                               struct pt_regs *regs);
> > +
> I prefer alpha-betical order, which means put ret_from_fork() before
> ret_from_kernel_thread().

Makes sense!

> 
> >  /*
> >   * For newly created kernel threads switch_to() will return to
> >   * ret_from_kernel_thread, newly created user threads to ret_from_fork.
> > diff --git a/arch/loongarch/kernel/entry.S b/arch/loongarch/kernel/entry.S
> > index 48e7e34e355e83eae8165957ba2eac05a8bf17df..2abc29e573810e000f2fef4646ddca0dbb80eabe 100644
> > --- a/arch/loongarch/kernel/entry.S
> > +++ b/arch/loongarch/kernel/entry.S
> > @@ -77,24 +77,22 @@ SYM_CODE_START(handle_syscall)
> >  SYM_CODE_END(handle_syscall)
> >  _ASM_NOKPROBE(handle_syscall)
> >
> > -SYM_CODE_START(ret_from_fork)
> > +SYM_CODE_START(ret_from_fork_asm)
> >         UNWIND_HINT_REGS
> > -       bl              schedule_tail           # a0 = struct task_struct *prev
> > -       move            a0, sp
> > -       bl              syscall_exit_to_user_mode
> > +       move            a1, sp
> > +       bl              ret_from_fork
> >         RESTORE_STATIC
> >         RESTORE_SOME
> >         RESTORE_SP_AND_RET
> > -SYM_CODE_END(ret_from_fork)
> > +SYM_CODE_END(ret_from_fork_asm)
> >
> > -SYM_CODE_START(ret_from_kernel_thread)
> > +SYM_CODE_START(ret_from_kernel_thread_asm)
> >         UNWIND_HINT_REGS
> > -       bl              schedule_tail           # a0 = struct task_struct *prev
> > -       move            a0, s1
> > -       jirl            ra, s0, 0
> > -       move            a0, sp
> > -       bl              syscall_exit_to_user_mode
> > +       move            a1, sp
> > +       move            a2, s0
> > +       move            a3, s1
> > +       bl              ret_from_kernel_thread
> >         RESTORE_STATIC
> >         RESTORE_SOME
> >         RESTORE_SP_AND_RET
> > -SYM_CODE_END(ret_from_kernel_thread)
> > +SYM_CODE_END(ret_from_kernel_thread_asm)
> > diff --git a/arch/loongarch/kernel/process.c b/arch/loongarch/kernel/process.c
> > index 6e58f65455c7ca3eae2e88ed852c8655a6701e5c..16cc949fe43443d70f1d865ce04595c2d8c1615b 100644
> > --- a/arch/loongarch/kernel/process.c
> > +++ b/arch/loongarch/kernel/process.c
> > @@ -14,6 +14,7 @@
> >  #include <linux/init.h>
> >  #include <linux/kernel.h>
> >  #include <linux/errno.h>
> > +#include <linux/entry-common.h>
> >  #include <linux/sched.h>
> >  #include <linux/sched/debug.h>
> >  #include <linux/sched/task.h>
> > @@ -33,6 +34,7 @@
> >  #include <linux/prctl.h>
> >  #include <linux/nmi.h>
> >
> > +#include <asm/asm-prototypes.h>
> >  #include <asm/asm.h>
> >  #include <asm/bootinfo.h>
> >  #include <asm/cpu.h>
> > @@ -47,6 +49,7 @@
> >  #include <asm/pgtable.h>
> >  #include <asm/processor.h>
> >  #include <asm/reg.h>
> > +#include <asm/switch_to.h>
> >  #include <asm/unwind.h>
> >  #include <asm/vdso.h>
> >
> > @@ -63,8 +66,9 @@ EXPORT_SYMBOL(__stack_chk_guard);
> >  unsigned long boot_option_idle_override = IDLE_NO_OVERRIDE;
> >  EXPORT_SYMBOL(boot_option_idle_override);
> >
> > -asmlinkage void ret_from_fork(void);
> > -asmlinkage void ret_from_kernel_thread(void);
> > +asmlinkage void restore_and_ret(void);
> > +asmlinkage void ret_from_fork_asm(void);
> > +asmlinkage void ret_from_kernel_thread_asm(void);
> >
> >  void start_thread(struct pt_regs *regs, unsigned long pc, unsigned long sp)
> >  {
> > @@ -138,6 +142,24 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
> >         return 0;
> >  }
> >
> > +asmlinkage void noinstr __no_stack_protector ret_from_kernel_thread(struct task_struct *prev,
> > +                                                                   struct pt_regs *regs,
> > +                                                                   int (*fn)(void *),
> > +                                                                   void *fn_arg)
> > +{
> > +       schedule_tail(prev);
> > +
> > +       fn(fn_arg);
> > +
> The two blank lines can be removed, and again, I prefer alpha-betical
> order, which means put ret_from_fork() before
> ret_from_kernel_thread().

Will update in the next version.

- Charlie

> 
> Huacai
> 
> > +       syscall_exit_to_user_mode(regs);
> > +}
> > +
> > +void noinstr __no_stack_protector ret_from_fork(struct task_struct *prev, struct pt_regs *regs)
> > +{
> > +       schedule_tail(prev);
> > +       syscall_exit_to_user_mode(regs);
> > +}
> > +
> >  /*
> >   * Copy architecture-specific thread state
> >   */
> > @@ -165,8 +187,8 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
> >                 p->thread.reg03 = childksp;
> >                 p->thread.reg23 = (unsigned long)args->fn;
> >                 p->thread.reg24 = (unsigned long)args->fn_arg;
> > -               p->thread.reg01 = (unsigned long)ret_from_kernel_thread;
> > -               p->thread.sched_ra = (unsigned long)ret_from_kernel_thread;
> > +               p->thread.reg01 = (unsigned long)ret_from_kernel_thread_asm;
> > +               p->thread.sched_ra = (unsigned long)ret_from_kernel_thread_asm;
> >                 memset(childregs, 0, sizeof(struct pt_regs));
> >                 childregs->csr_euen = p->thread.csr_euen;
> >                 childregs->csr_crmd = p->thread.csr_crmd;
> > @@ -182,8 +204,8 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
> >                 childregs->regs[3] = usp;
> >
> >         p->thread.reg03 = (unsigned long) childregs;
> > -       p->thread.reg01 = (unsigned long) ret_from_fork;
> > -       p->thread.sched_ra = (unsigned long) ret_from_fork;
> > +       p->thread.reg01 = (unsigned long) ret_from_fork_asm;
> > +       p->thread.sched_ra = (unsigned long) ret_from_fork_asm;
> >
> >         /*
> >          * New tasks lose permission to use the fpu. This accelerates context
> >
> > --
> > 2.43.0
> >
