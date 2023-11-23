Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD67BA26
	for <loongarch@lists.linux.dev>; Thu, 23 Nov 2023 05:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gncAtwVh"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-1f0f160e293so380211fac.0
        for <loongarch@lists.linux.dev>; Wed, 22 Nov 2023 21:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700718588; x=1701323388; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cPfksV5844JHYEUobFng9V4vWZpitSP8AHiUCoJcjbU=;
        b=gncAtwVhtnBTC8Yggr0RkswZWJZg6WUfMgMiD2jOgURh+kCz+OzQsPYS8QL1n2fUmb
         Am8xZwT8E2BtNFJhI80TFWE6Lc4x8Kb4Xe+ZB6bt7J6oWFQf4fV+L95Ss6Pni1NZeLV5
         cfZoEw9xV8ABV4JE0LVPlTMDzFT2c+oHlSUSwxuqaEI3cWSjO+ViK1EVBJ7apwX3QHps
         lPGcvG6CENjKnz3TSVwIjBdrqn86oVRxyjKlXUF0ruoTDey/75U6ev9MAhn9ie54uNjW
         uhQDvqIWSwiCNRTYo7KZVynvZC9Gba3q8AbLeQW35w9BwrNSBXRAnkvrh6lzv+JF35sX
         Q5cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700718588; x=1701323388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cPfksV5844JHYEUobFng9V4vWZpitSP8AHiUCoJcjbU=;
        b=wNXk4Y5DBLKF35/fhZGqbeRCXEIL4Jn3n+YT5bKiteUOzecR8klXryiCBgilRzd0Mr
         vf1+GGhH1yseav1vcwq4ooUsrFK1ainWL7hWyBh+OVBJLqY2fyQn38cRiTf3BNQ5BjzB
         AMKtDgWgmAJRi9b2Swr68gJ9Wb59p0217v38p3MZgOBsIepESHGtkMxfsuGE43lVBCh8
         +8V+UR1nbEU3xrp9AsFwOvjGESWuDRRAfFts8lAPhNrRnLldMCyBbc7o3rr3NZoPAjVG
         zH8euxGz1RNU1NKJofuZXL665DYooQ1r1h/OAXq8epYpmN430+NbA0fsDW+IjyTXnvbW
         uFDw==
X-Gm-Message-State: AOJu0Yxtmxpp/gnj9e+q8grENh33Im19jzAWgm/IMe9nUxdQ5Wdvq2TE
	Eh/mbNAuPCj9sXIfgZN3OyntiPw09JBQ1J5DLRE=
X-Google-Smtp-Source: AGHT+IFBUgMf8BkN7yIm4mC7gjITFkIXu7lXnbcu5HUA1DhlXMvJUADTew6Dcv4oLC4YSr/cYCa/qrk72ZRBJGbucjI=
X-Received: by 2002:a05:6870:3c87:b0:1f5:ccc2:b21e with SMTP id
 gl7-20020a0568703c8700b001f5ccc2b21emr6712288oab.41.1700718587763; Wed, 22
 Nov 2023 21:49:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231121070209.210934-1-hengqi.chen@gmail.com>
 <CAAhV-H7SwSRDh8Ui2xVb1ncoaEQVd=dugphcBemkeaPNGQX2qw@mail.gmail.com>
 <CAEyhmHRYghT5iFiLByUmC=AjdygiBWU8TH3joSyyWibu0Ki2xw@mail.gmail.com> <CAAhV-H4Jr_a4j+Qnitd7ay9Vkcw5g0W_W3LNJwUzQ1BWXoGpoA@mail.gmail.com>
In-Reply-To: <CAAhV-H4Jr_a4j+Qnitd7ay9Vkcw5g0W_W3LNJwUzQ1BWXoGpoA@mail.gmail.com>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Thu, 23 Nov 2023 13:49:36 +0800
Message-ID: <CAEyhmHRFZqH=4K8WUO6tPFd0NoWMHm_iLan+4EPiqovO03w1xw@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Store syscall nr in thread_info
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arch <linux-arch@vger.kernel.org>, loongarch@lists.linux.dev, 
	kernel@xen0n.name
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 3:58=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> Hi, Hengqi,
>
> On Wed, Nov 22, 2023 at 3:34=E2=80=AFPM Hengqi Chen <hengqi.chen@gmail.co=
m> wrote:
> >
> > Hi, Huacai,
> >
> > On Wed, Nov 22, 2023 at 2:32=E2=80=AFPM Huacai Chen <chenhuacai@kernel.=
org> wrote:
> > >
> > > Hi, Hengqi,
> > >
> > > On Wed, Nov 22, 2023 at 1:14=E2=80=AFPM Hengqi Chen <hengqi.chen@gmai=
l.com> wrote:
> > > >
> > > > Currently, we store syscall number in pt_regs::regs[11] and it may =
be
> > > > changed during syscall execution. Take `execve` as an example:
> > > >
> > > >     sys_execve
> > > >       -> do_execve
> > > >         -> do_execveat_common
> > > >           -> bprm_execve
> > > >             -> exec_binprm
> > > >               -> search_binary_handler
> > > >                 -> load_elf_binary
> > > >                   -> ELF_PLAT_INIT
> > > >
> > > > ELF_PLAT_INIT reset regs[11] to 0, later in syscall_exit_to_user_mo=
de
> > > > we get a wrong syscall nr.
> > > >
> > > > Known affected syscalls includes execve/execveat/rt_sigreturn. Tool=
s
> > > > like execsnoop do not work properly because the sys_exit_* tracepoi=
nts
> > > > does not trigger at all.
> > > >
> > > > Let's store syscall nr in thread_info instead.
> > > Can we just modify ELF_PLAT_INIT and not clear regs[11]?
> > >
> >
> > I am uncertain about the side effects of changing ELF_PLAT_INIT.
> > From a completeness perspective, changing ELF_PLAT_INIT is suboptimal,
> > rt_sigreturn is affected in another code path, and there may be other
> > syscalls that I am unaware of.
> Save syscall number in thread_info has more side effects, because
> ptrace allows us to change the number during syscall, then we should
> keep consistency between syscall and regs[11].
>

How about the change below:

diff --git a/arch/loongarch/include/asm/syscall.h
b/arch/loongarch/include/asm/syscall.h
index e286dc58476e..954ba53bcc9a 100644
--- a/arch/loongarch/include/asm/syscall.h
+++ b/arch/loongarch/include/asm/syscall.h
@@ -23,7 +23,9 @@ extern void *sys_call_table[];
 static inline long syscall_get_nr(struct task_struct *task,
                                  struct pt_regs *regs)
 {
-       return regs->regs[11];
+       long nr =3D task_thread_info(task)->syscall;
+
+       return nr ? : regs->regs[11];
 }

 static inline void syscall_rollback(struct task_struct *task,
diff --git a/arch/loongarch/kernel/syscall.c b/arch/loongarch/kernel/syscal=
l.c
index b4c5acd7aa3b..553ab0d624cb 100644
--- a/arch/loongarch/kernel/syscall.c
+++ b/arch/loongarch/kernel/syscall.c
@@ -53,6 +53,7 @@ void noinstr do_syscall(struct pt_regs *regs)
        regs->regs[4] =3D -ENOSYS;

        nr =3D syscall_enter_from_user_mode(regs, nr);
+       current_thread_info()->syscall =3D nr;

        if (nr < NR_syscalls) {
                syscall_fn =3D sys_call_table[nr];
@@ -61,4 +62,5 @@ void noinstr do_syscall(struct pt_regs *regs)
        }

        syscall_exit_to_user_mode(regs);
+       current_thread_info()->syscall =3D 0;
 }

* allow ptrace to change syscall nr
* sys_exit_* will also see the right syscall nr
* this works even if rt_sigreturn clobbers all pt_regs::regs

> And about ELF_PLAT_INIT, maybe Arnd can give us some more information.
>
> Hi, Arnd,
>
> I found some new architectures, such as ARM64 and RISC-V, just do
> nearly nothing in ELF_PLAT_INIT, while some old architectures, such as
> x86 and MIPS, clear most of the registers, do you know why?
>
> Huacai
>
> >
> > > Huacai
> > >
> > > >
> > > > Fixes: be769645a2aef ("LoongArch: Add system call support")
> > > > Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
> > > > ---
> > > >  arch/loongarch/include/asm/syscall.h | 2 +-
> > > >  arch/loongarch/kernel/syscall.c      | 1 +
> > > >  2 files changed, 2 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/arch/loongarch/include/asm/syscall.h b/arch/loongarch/=
include/asm/syscall.h
> > > > index e286dc58476e..2317d674b92a 100644
> > > > --- a/arch/loongarch/include/asm/syscall.h
> > > > +++ b/arch/loongarch/include/asm/syscall.h
> > > > @@ -23,7 +23,7 @@ extern void *sys_call_table[];
> > > >  static inline long syscall_get_nr(struct task_struct *task,
> > > >                                   struct pt_regs *regs)
> > > >  {
> > > > -       return regs->regs[11];
> > > > +       return task_thread_info(task)->syscall;
> > > >  }
> > > >
> > > >  static inline void syscall_rollback(struct task_struct *task,
> > > > diff --git a/arch/loongarch/kernel/syscall.c b/arch/loongarch/kerne=
l/syscall.c
> > > > index b4c5acd7aa3b..2783e33cf276 100644
> > > > --- a/arch/loongarch/kernel/syscall.c
> > > > +++ b/arch/loongarch/kernel/syscall.c
> > > > @@ -52,6 +52,7 @@ void noinstr do_syscall(struct pt_regs *regs)
> > > >         regs->orig_a0 =3D regs->regs[4];
> > > >         regs->regs[4] =3D -ENOSYS;
> > > >
> > > > +       task_thread_info(current)->syscall =3D nr;
> > > >         nr =3D syscall_enter_from_user_mode(regs, nr);
> > > >
> > > >         if (nr < NR_syscalls) {
> > > > --
> > > > 2.42.0
> > > >
