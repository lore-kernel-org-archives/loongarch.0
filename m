Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCF633CC3
	for <loongarch@lists.linux.dev>; Thu, 23 Nov 2023 14:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gtlfDgB0"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3b83c4c5aefso584370b6e.1
        for <loongarch@lists.linux.dev>; Thu, 23 Nov 2023 06:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700750393; x=1701355193; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x9X9uhF8OSYthUzmtslwmdEtCWgAjbVmdLteT4Uwcqw=;
        b=gtlfDgB0iqgNgwljmb7e0yvBPRxtkRmDo1kKoojDYAQpTPnUf7Rs8DKZE96Ep5Skaq
         ApDHbGjk8a+Rq9xOQ/KdS9BadwcRSX2EMR3NHZfPllzSM2QBTpXazCYECsOES66LLEOj
         qLm2c2/dT/5uMSk9fgrVsXOAUuGSsg2FT8N7Tv1z0+50uIGengbI+oiE1rlg9EbsrCdd
         OJVTf2aY6TaGpMa9LeDAIfQ42f17J+D4REht6r8pe3///8JEfGZ8q04kwCqwtBRvsMW0
         TISI5qeQ7b/hJms01VZd7YwANvBFETnQj6KvR6atI4Fxvvw+DI3CXtaqCNMsaRHT1Fzx
         JFgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700750393; x=1701355193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x9X9uhF8OSYthUzmtslwmdEtCWgAjbVmdLteT4Uwcqw=;
        b=vRo5i2Sxh5Iult6hQ2PC2fDjBE2pWsjc/FxR4JuZ8J18gqZGJ1puvp9r3wd4ojwqFp
         oUZcBTWAt3fc2YKv8e0u6VrnEnbuvzKoX5VVW688AOUE/VUc9Sk9N2u5E0q2QqJc8kgl
         rTxvfK9wK6VjvbI+3sOL1AihwujoV8mK6U+hlp0yaxZZRJmJVQrJq73Zr6c71C5J0g/4
         swkxQGshUnAJ5nIq6skGQDl6UFpEKp5GOO9e0aeI0jKihBvB2wYMYDCX+P5HejAhgeo7
         FTblAef4zg7nhu7gO5FaD5rKYECT1xTfHyvQ4xcpVeAQGOZtMNfbSOjmuFYIYpKZOoWI
         tSbg==
X-Gm-Message-State: AOJu0YxIo4D81f09fSEOSvYYSL6pS6ZxCm5SLGU7dXDgAlJuCxFBV30m
	EoDncZdvHwamOHD1iQZWRMDwc2BF+Pu23Bmg7Kc=
X-Google-Smtp-Source: AGHT+IH8jQ4PDRhyeRzH9DiB0Z37O/a9ZpRgM1avWuvGR7ryKm8yIgJ/zLL8p7eNT59Vvn3rDOCukib9uQWFrJcqetA=
X-Received: by 2002:a05:6870:9b0c:b0:1e9:af81:54b6 with SMTP id
 hq12-20020a0568709b0c00b001e9af8154b6mr7149706oab.55.1700750393048; Thu, 23
 Nov 2023 06:39:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231121070209.210934-1-hengqi.chen@gmail.com>
 <CAAhV-H7SwSRDh8Ui2xVb1ncoaEQVd=dugphcBemkeaPNGQX2qw@mail.gmail.com>
 <CAEyhmHRYghT5iFiLByUmC=AjdygiBWU8TH3joSyyWibu0Ki2xw@mail.gmail.com>
 <CAAhV-H4Jr_a4j+Qnitd7ay9Vkcw5g0W_W3LNJwUzQ1BWXoGpoA@mail.gmail.com>
 <CAEyhmHRFZqH=4K8WUO6tPFd0NoWMHm_iLan+4EPiqovO03w1xw@mail.gmail.com>
 <CAAhV-H53YNH_trJmgcp-=PjdTSXuyzvmxWVaeUg++yYiXd=1Kg@mail.gmail.com>
 <CAEyhmHSPwjWQ=KJKskQHTjNKfMV3WG6r8sHihqtbBsZeKUQzUg@mail.gmail.com> <CAAhV-H6xtawO3kMtJtzMAbGELTO=RieY3B2mM77Uk8rB73Ppqw@mail.gmail.com>
In-Reply-To: <CAAhV-H6xtawO3kMtJtzMAbGELTO=RieY3B2mM77Uk8rB73Ppqw@mail.gmail.com>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Thu, 23 Nov 2023 22:39:41 +0800
Message-ID: <CAEyhmHQQ3NqN1cZ1AfhUEbaswy6BWHCTjmUyncxdNUwQuCVOAA@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Store syscall nr in thread_info
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arch <linux-arch@vger.kernel.org>, loongarch@lists.linux.dev, 
	kernel@xen0n.name
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 23, 2023 at 4:25=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> On Thu, Nov 23, 2023 at 4:09=E2=80=AFPM Hengqi Chen <hengqi.chen@gmail.co=
m> wrote:
> >
> > On Thu, Nov 23, 2023 at 2:13=E2=80=AFPM Huacai Chen <chenhuacai@kernel.=
org> wrote:
> > >
> > > Hi, Hengqi,
> > >
> > > On Thu, Nov 23, 2023 at 1:49=E2=80=AFPM Hengqi Chen <hengqi.chen@gmai=
l.com> wrote:
> > > >
> > > > On Wed, Nov 22, 2023 at 3:58=E2=80=AFPM Huacai Chen <chenhuacai@ker=
nel.org> wrote:
> > > > >
> > > > > Hi, Hengqi,
> > > > >
> > > > > On Wed, Nov 22, 2023 at 3:34=E2=80=AFPM Hengqi Chen <hengqi.chen@=
gmail.com> wrote:
> > > > > >
> > > > > > Hi, Huacai,
> > > > > >
> > > > > > On Wed, Nov 22, 2023 at 2:32=E2=80=AFPM Huacai Chen <chenhuacai=
@kernel.org> wrote:
> > > > > > >
> > > > > > > Hi, Hengqi,
> > > > > > >
> > > > > > > On Wed, Nov 22, 2023 at 1:14=E2=80=AFPM Hengqi Chen <hengqi.c=
hen@gmail.com> wrote:
> > > > > > > >
> > > > > > > > Currently, we store syscall number in pt_regs::regs[11] and=
 it may be
> > > > > > > > changed during syscall execution. Take `execve` as an examp=
le:
> > > > > > > >
> > > > > > > >     sys_execve
> > > > > > > >       -> do_execve
> > > > > > > >         -> do_execveat_common
> > > > > > > >           -> bprm_execve
> > > > > > > >             -> exec_binprm
> > > > > > > >               -> search_binary_handler
> > > > > > > >                 -> load_elf_binary
> > > > > > > >                   -> ELF_PLAT_INIT
> > > > > > > >
> > > > > > > > ELF_PLAT_INIT reset regs[11] to 0, later in syscall_exit_to=
_user_mode
> > > > > > > > we get a wrong syscall nr.
> > > > > > > >
> > > > > > > > Known affected syscalls includes execve/execveat/rt_sigretu=
rn. Tools
> > > > > > > > like execsnoop do not work properly because the sys_exit_* =
tracepoints
> > > > > > > > does not trigger at all.
> > > > > > > >
> > > > > > > > Let's store syscall nr in thread_info instead.
> > > > > > > Can we just modify ELF_PLAT_INIT and not clear regs[11]?
> > > > > > >
> > > > > >
> > > > > > I am uncertain about the side effects of changing ELF_PLAT_INIT=
.
> > > > > > From a completeness perspective, changing ELF_PLAT_INIT is subo=
ptimal,
> > > > > > rt_sigreturn is affected in another code path, and there may be=
 other
> > > > > > syscalls that I am unaware of.
> > > > > Save syscall number in thread_info has more side effects, because
> > > > > ptrace allows us to change the number during syscall, then we sho=
uld
> > > > > keep consistency between syscall and regs[11].
> > > > >
> > > >
> > > > How about the change below:
> > > >
> > > > diff --git a/arch/loongarch/include/asm/syscall.h
> > > > b/arch/loongarch/include/asm/syscall.h
> > > > index e286dc58476e..954ba53bcc9a 100644
> > > > --- a/arch/loongarch/include/asm/syscall.h
> > > > +++ b/arch/loongarch/include/asm/syscall.h
> > > > @@ -23,7 +23,9 @@ extern void *sys_call_table[];
> > > >  static inline long syscall_get_nr(struct task_struct *task,
> > > >                                   struct pt_regs *regs)
> > > >  {
> > > > -       return regs->regs[11];
> > > > +       long nr =3D task_thread_info(task)->syscall;
> > > > +
> > > > +       return nr ? : regs->regs[11];
> > > >  }
> > > >
> > > >  static inline void syscall_rollback(struct task_struct *task,
> > > > diff --git a/arch/loongarch/kernel/syscall.c b/arch/loongarch/kerne=
l/syscall.c
> > > > index b4c5acd7aa3b..553ab0d624cb 100644
> > > > --- a/arch/loongarch/kernel/syscall.c
> > > > +++ b/arch/loongarch/kernel/syscall.c
> > > > @@ -53,6 +53,7 @@ void noinstr do_syscall(struct pt_regs *regs)
> > > >         regs->regs[4] =3D -ENOSYS;
> > > >
> > > >         nr =3D syscall_enter_from_user_mode(regs, nr);
> > > > +       current_thread_info()->syscall =3D nr;
> > > >
> > > >         if (nr < NR_syscalls) {
> > > >                 syscall_fn =3D sys_call_table[nr];
> > > > @@ -61,4 +62,5 @@ void noinstr do_syscall(struct pt_regs *regs)
> > > >         }
> > > >
> > > >         syscall_exit_to_user_mode(regs);
> > > > +       current_thread_info()->syscall =3D 0;
> > > >  }
> > > >
> > > > * allow ptrace to change syscall nr
> > > > * sys_exit_* will also see the right syscall nr
> > > > * this works even if rt_sigreturn clobbers all pt_regs::regs
> > > No, I still prefer to modify ELF_PLAT_INIT, we can wait Arnd's commen=
ts.
> > >
> >
> > OK, I am not eager, anyway, we know the root cause. :)
> >
> > > And, do you mean modifying ELF_PLAT_INIT cannot solve the
> > > rt_sigreturn's problem?
> > >
> >
> > Right, see https://elixir.bootlin.com/linux/latest/source/arch/loongarc=
h/kernel/signal.c#L807
> Is this the expected behavior for rt_sigreturn()? Otherwise I think
> RISC-V has the same problem. And if we really need the 'correct'
> syscall number, we can overwrite regs[11] in sys_rt_sigreturn().
>

I check with x86 and arm64, both have the same issue, seems no one care.

> And another question: do you have any updates about the BPF system
> hang problem? :)
>

Let's discuss this on a new thread.

> Huacai
>
> >
> > > Huacai
> > >
> > > >
> > > > > And about ELF_PLAT_INIT, maybe Arnd can give us some more informa=
tion.
> > > > >
> > > > > Hi, Arnd,
> > > > >
> > > > > I found some new architectures, such as ARM64 and RISC-V, just do
> > > > > nearly nothing in ELF_PLAT_INIT, while some old architectures, su=
ch as
> > > > > x86 and MIPS, clear most of the registers, do you know why?
> > > > >
> > > > > Huacai
> > > > >
> > > > > >
> > > > > > > Huacai
> > > > > > >
> > > > > > > >
> > > > > > > > Fixes: be769645a2aef ("LoongArch: Add system call support")
> > > > > > > > Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
> > > > > > > > ---
> > > > > > > >  arch/loongarch/include/asm/syscall.h | 2 +-
> > > > > > > >  arch/loongarch/kernel/syscall.c      | 1 +
> > > > > > > >  2 files changed, 2 insertions(+), 1 deletion(-)
> > > > > > > >
> > > > > > > > diff --git a/arch/loongarch/include/asm/syscall.h b/arch/lo=
ongarch/include/asm/syscall.h
> > > > > > > > index e286dc58476e..2317d674b92a 100644
> > > > > > > > --- a/arch/loongarch/include/asm/syscall.h
> > > > > > > > +++ b/arch/loongarch/include/asm/syscall.h
> > > > > > > > @@ -23,7 +23,7 @@ extern void *sys_call_table[];
> > > > > > > >  static inline long syscall_get_nr(struct task_struct *task=
,
> > > > > > > >                                   struct pt_regs *regs)
> > > > > > > >  {
> > > > > > > > -       return regs->regs[11];
> > > > > > > > +       return task_thread_info(task)->syscall;
> > > > > > > >  }
> > > > > > > >
> > > > > > > >  static inline void syscall_rollback(struct task_struct *ta=
sk,
> > > > > > > > diff --git a/arch/loongarch/kernel/syscall.c b/arch/loongar=
ch/kernel/syscall.c
> > > > > > > > index b4c5acd7aa3b..2783e33cf276 100644
> > > > > > > > --- a/arch/loongarch/kernel/syscall.c
> > > > > > > > +++ b/arch/loongarch/kernel/syscall.c
> > > > > > > > @@ -52,6 +52,7 @@ void noinstr do_syscall(struct pt_regs *r=
egs)
> > > > > > > >         regs->orig_a0 =3D regs->regs[4];
> > > > > > > >         regs->regs[4] =3D -ENOSYS;
> > > > > > > >
> > > > > > > > +       task_thread_info(current)->syscall =3D nr;
> > > > > > > >         nr =3D syscall_enter_from_user_mode(regs, nr);
> > > > > > > >
> > > > > > > >         if (nr < NR_syscalls) {
> > > > > > > > --
> > > > > > > > 2.42.0
> > > > > > > >
> > > >
