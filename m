Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A137200AB
	for <loongarch@lists.linux.dev>; Wed, 22 Nov 2023 07:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bpdmXVBx"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-1f5d34235dbso281834fac.0
        for <loongarch@lists.linux.dev>; Tue, 21 Nov 2023 23:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700638487; x=1701243287; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hasyh809eUGDJR7ce0CGD8nFmNgR22ak+3nL9Mhv3m0=;
        b=bpdmXVBxyaT26m+UoCgd+dpz87SnkKMoec61BsJ9DsDvBwaxraT79V34VkvyfPxdQ7
         D8MMWgO+Iq6EDRQ3O7SeE6MZHMCgNb7WFCd0NA/z1LFic6BBcPO2eA1+KOoetftKTD3r
         k+kjepRCCFI+SLkbYeaqQoRkgK7/PkzjHdofmBfXR5Zg6dmuPgjrnMaXLP3DweZHlBkx
         1Zgp6I0uUQYBJKW8OdpaYWRbNblyRCahxcqzErw+OEHLdMVQzOQ1EJsVCIhymHU0MZ7a
         akDRYjDlNtXSkFEY5TuHmzRYP2EFh1RZ1ihl/N9j9ey0H7HmHd+dtweldGvJlYA3tnZ2
         s+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700638487; x=1701243287;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hasyh809eUGDJR7ce0CGD8nFmNgR22ak+3nL9Mhv3m0=;
        b=HBajFYJvpIMQijKX3HRxEfVvfaohDetYjhqHGKvxVi93G5s0n6LqBeFYCkunbW7I6c
         QkUltPQp4CFrTRrgXDkJnDGDCOdHJXmUGpVsaaWWqdElZ2ZTUeZAcrlDfLczgR8j7vPv
         tid8qprtMmvJq/hWn601hG+PCpVeYkbDQiLOyvmv3diLD7dw07GkAzq8WyajDhnP/GMi
         SDDtFklxcElzOx3R3pdVKhfGPs4utfakOHOD4DyAymRNgGVA0WMYqm6qhiU33BggrN15
         vHakqiIheNY1PkbaiV3wfAhmPeyM2uCYy8pfKtAkCuHNYaHZ9ufRo5jN2cuYb3TvXQzj
         QftA==
X-Gm-Message-State: AOJu0YwJVK5nAXnrtV3Sq2C7bBi2jF0j1fT/22iiyi3fbgqldYVV4D3I
	tnQUdFmt+cnumKoTzaENFOPJrpSx9Onu6rhZE/k=
X-Google-Smtp-Source: AGHT+IEIT2tCq/sqjUU3okpO/26+Covhy0egKq/R2d1qt4KaBxKGaB3L2RC4WjQCs7A4ZAsXWvewei+62JJ90M/acQY=
X-Received: by 2002:a05:6871:5314:b0:1ea:3c8e:4673 with SMTP id
 hx20-20020a056871531400b001ea3c8e4673mr926291oac.8.1700638487491; Tue, 21 Nov
 2023 23:34:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231121070209.210934-1-hengqi.chen@gmail.com> <CAAhV-H7SwSRDh8Ui2xVb1ncoaEQVd=dugphcBemkeaPNGQX2qw@mail.gmail.com>
In-Reply-To: <CAAhV-H7SwSRDh8Ui2xVb1ncoaEQVd=dugphcBemkeaPNGQX2qw@mail.gmail.com>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Wed, 22 Nov 2023 15:34:36 +0800
Message-ID: <CAEyhmHRYghT5iFiLByUmC=AjdygiBWU8TH3joSyyWibu0Ki2xw@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Store syscall nr in thread_info
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, kernel@xen0n.name
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Huacai,

On Wed, Nov 22, 2023 at 2:32=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> Hi, Hengqi,
>
> On Wed, Nov 22, 2023 at 1:14=E2=80=AFPM Hengqi Chen <hengqi.chen@gmail.co=
m> wrote:
> >
> > Currently, we store syscall number in pt_regs::regs[11] and it may be
> > changed during syscall execution. Take `execve` as an example:
> >
> >     sys_execve
> >       -> do_execve
> >         -> do_execveat_common
> >           -> bprm_execve
> >             -> exec_binprm
> >               -> search_binary_handler
> >                 -> load_elf_binary
> >                   -> ELF_PLAT_INIT
> >
> > ELF_PLAT_INIT reset regs[11] to 0, later in syscall_exit_to_user_mode
> > we get a wrong syscall nr.
> >
> > Known affected syscalls includes execve/execveat/rt_sigreturn. Tools
> > like execsnoop do not work properly because the sys_exit_* tracepoints
> > does not trigger at all.
> >
> > Let's store syscall nr in thread_info instead.
> Can we just modify ELF_PLAT_INIT and not clear regs[11]?
>

I am uncertain about the side effects of changing ELF_PLAT_INIT.
From a completeness perspective, changing ELF_PLAT_INIT is suboptimal,
rt_sigreturn is affected in another code path, and there may be other
syscalls that I am unaware of.

> Huacai
>
> >
> > Fixes: be769645a2aef ("LoongArch: Add system call support")
> > Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
> > ---
> >  arch/loongarch/include/asm/syscall.h | 2 +-
> >  arch/loongarch/kernel/syscall.c      | 1 +
> >  2 files changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/loongarch/include/asm/syscall.h b/arch/loongarch/incl=
ude/asm/syscall.h
> > index e286dc58476e..2317d674b92a 100644
> > --- a/arch/loongarch/include/asm/syscall.h
> > +++ b/arch/loongarch/include/asm/syscall.h
> > @@ -23,7 +23,7 @@ extern void *sys_call_table[];
> >  static inline long syscall_get_nr(struct task_struct *task,
> >                                   struct pt_regs *regs)
> >  {
> > -       return regs->regs[11];
> > +       return task_thread_info(task)->syscall;
> >  }
> >
> >  static inline void syscall_rollback(struct task_struct *task,
> > diff --git a/arch/loongarch/kernel/syscall.c b/arch/loongarch/kernel/sy=
scall.c
> > index b4c5acd7aa3b..2783e33cf276 100644
> > --- a/arch/loongarch/kernel/syscall.c
> > +++ b/arch/loongarch/kernel/syscall.c
> > @@ -52,6 +52,7 @@ void noinstr do_syscall(struct pt_regs *regs)
> >         regs->orig_a0 =3D regs->regs[4];
> >         regs->regs[4] =3D -ENOSYS;
> >
> > +       task_thread_info(current)->syscall =3D nr;
> >         nr =3D syscall_enter_from_user_mode(regs, nr);
> >
> >         if (nr < NR_syscalls) {
> > --
> > 2.42.0
> >
