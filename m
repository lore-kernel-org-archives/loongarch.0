Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CD7168A7
	for <loongarch@lists.linux.dev>; Wed, 22 Nov 2023 06:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TUx2iF4I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B5A3C433C7
	for <loongarch@lists.linux.dev>; Wed, 22 Nov 2023 06:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700634743;
	bh=v4ooUWdofiE1biiOD96m0HMuzHYWgWtGFhcdxiRJb+w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TUx2iF4ICk4iE9bZ+/yxXrAPgQJq8PNjSSrGCPdrw9p2kb1xG/r6Ef6IHMfeKpnPm
	 1YyOBkkCII8UV/2yuaGerhgPJqoTwl/HmKz95UGOrACyzGTb+kE2cRfzP341gjLI2n
	 qd3lt7CeNv6pYMWBIy3g3np35cFgK8YtapilhJ/C/nZd5LUVDmrvuxfiXZZx3cU1kn
	 oxoIooazdLQGW0E/SSqyp6m4PIUONUeYG6SDv3jFIogGaXE3QnnXxCKONkI5bkYYB0
	 4NT8kkgDjpcspezec7QTsTcqhB5Xp/+maXR53eB4JNcqhkDHmd4S3O7wAeB8Zv2D13
	 dz4yWNtUcDXKA==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a00a9d677fcso294365566b.0
        for <loongarch@lists.linux.dev>; Tue, 21 Nov 2023 22:32:23 -0800 (PST)
X-Gm-Message-State: AOJu0Yyw1Gz6rEPlEgWYnVQdVx0COoZMrZi3+q0P6/WtlzdfIAQViKhH
	L768UNl2xPvPyBPFLMyaNtWMMFVzwMjUBjfX0Tg=
X-Google-Smtp-Source: AGHT+IEtlwwQK/vdaDQReBXHCZDgA26et3OCYEMivVRWQBFXA09LItG6MCxoOYdPM/5zcoxB3XUhQYYJq48UDuV3PA4=
X-Received: by 2002:a17:906:b208:b0:9fc:3aeb:d2b9 with SMTP id
 p8-20020a170906b20800b009fc3aebd2b9mr710597ejz.71.1700634742020; Tue, 21 Nov
 2023 22:32:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231121070209.210934-1-hengqi.chen@gmail.com>
In-Reply-To: <20231121070209.210934-1-hengqi.chen@gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 22 Nov 2023 14:32:10 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7SwSRDh8Ui2xVb1ncoaEQVd=dugphcBemkeaPNGQX2qw@mail.gmail.com>
Message-ID: <CAAhV-H7SwSRDh8Ui2xVb1ncoaEQVd=dugphcBemkeaPNGQX2qw@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Store syscall nr in thread_info
To: Hengqi Chen <hengqi.chen@gmail.com>
Cc: loongarch@lists.linux.dev, kernel@xen0n.name
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Hengqi,

On Wed, Nov 22, 2023 at 1:14=E2=80=AFPM Hengqi Chen <hengqi.chen@gmail.com>=
 wrote:
>
> Currently, we store syscall number in pt_regs::regs[11] and it may be
> changed during syscall execution. Take `execve` as an example:
>
>     sys_execve
>       -> do_execve
>         -> do_execveat_common
>           -> bprm_execve
>             -> exec_binprm
>               -> search_binary_handler
>                 -> load_elf_binary
>                   -> ELF_PLAT_INIT
>
> ELF_PLAT_INIT reset regs[11] to 0, later in syscall_exit_to_user_mode
> we get a wrong syscall nr.
>
> Known affected syscalls includes execve/execveat/rt_sigreturn. Tools
> like execsnoop do not work properly because the sys_exit_* tracepoints
> does not trigger at all.
>
> Let's store syscall nr in thread_info instead.
Can we just modify ELF_PLAT_INIT and not clear regs[11]?

Huacai

>
> Fixes: be769645a2aef ("LoongArch: Add system call support")
> Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
> ---
>  arch/loongarch/include/asm/syscall.h | 2 +-
>  arch/loongarch/kernel/syscall.c      | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/include/asm/syscall.h b/arch/loongarch/includ=
e/asm/syscall.h
> index e286dc58476e..2317d674b92a 100644
> --- a/arch/loongarch/include/asm/syscall.h
> +++ b/arch/loongarch/include/asm/syscall.h
> @@ -23,7 +23,7 @@ extern void *sys_call_table[];
>  static inline long syscall_get_nr(struct task_struct *task,
>                                   struct pt_regs *regs)
>  {
> -       return regs->regs[11];
> +       return task_thread_info(task)->syscall;
>  }
>
>  static inline void syscall_rollback(struct task_struct *task,
> diff --git a/arch/loongarch/kernel/syscall.c b/arch/loongarch/kernel/sysc=
all.c
> index b4c5acd7aa3b..2783e33cf276 100644
> --- a/arch/loongarch/kernel/syscall.c
> +++ b/arch/loongarch/kernel/syscall.c
> @@ -52,6 +52,7 @@ void noinstr do_syscall(struct pt_regs *regs)
>         regs->orig_a0 =3D regs->regs[4];
>         regs->regs[4] =3D -ENOSYS;
>
> +       task_thread_info(current)->syscall =3D nr;
>         nr =3D syscall_enter_from_user_mode(regs, nr);
>
>         if (nr < NR_syscalls) {
> --
> 2.42.0
>
