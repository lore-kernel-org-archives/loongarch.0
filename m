Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EA2C129
	for <loongarch@lists.linux.dev>; Mon,  4 Dec 2023 07:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c4AfQQV9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95CA0C433C7
	for <loongarch@lists.linux.dev>; Mon,  4 Dec 2023 07:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701675674;
	bh=dzUje8AnmwjLWX61PyUvezwxfEoybbUnfl3NZk7Eul8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=c4AfQQV9VERgD90Epksxlcf5+p7Ld3K2EjrZxghqoTlVBK16W5Cs0lQevyAtp/0E3
	 yncFa7/B74SqnihAoIih8ObMjezPOxNPVb9buKxrnSOSeibA9yFfp5+fK8LB9g9C1U
	 VkzOQDnnTVsX3LZOKAyPpz4SY864evZK/T86U6bwci4y/0CY/6IGMap1ys9RhWnFOP
	 tq6qlFNerrbC1NhwmyJpK5hi69w6m61a5XHTrIwrMPOX4X17wLHBSei+uHQKs9z41F
	 bWYPaWQROW+fHutraFdej70kouhv93+HDXXl05qOSOBduVlK3mhbfcOVaAUiXraEFJ
	 zGMtzE7iGzrNQ==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-54c77e0835bso2174168a12.2
        for <loongarch@lists.linux.dev>; Sun, 03 Dec 2023 23:41:14 -0800 (PST)
X-Gm-Message-State: AOJu0YzXP3ChRrNtG00fMNSJnOcyrLW5aEP9G3cye3u5yFrvpCKDqbNn
	BB0CpJK2XYEoGYkRC9PMgbIbvkyMXtfmZTH0h+Q=
X-Google-Smtp-Source: AGHT+IELVVyN8weIhVewmt7Kz3EXFdvGgIroZ7d3AxQ5jpKvIKHH8KA8hIZ7lDDuA0X9NFjgXUQzHW7EXbniS05Hnmc=
X-Received: by 2002:a50:d6cf:0:b0:53d:b59c:8f91 with SMTP id
 l15-20020a50d6cf000000b0053db59c8f91mr3082749edj.27.1701675673094; Sun, 03
 Dec 2023 23:41:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231204053745.3153-1-hengqi.chen@gmail.com>
In-Reply-To: <20231204053745.3153-1-hengqi.chen@gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 4 Dec 2023 15:41:00 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4TMU+4_-UWv+7o1jbHOvWey=7iU7n=R=+TCLPPGHasSg@mail.gmail.com>
Message-ID: <CAAhV-H4TMU+4_-UWv+7o1jbHOvWey=7iU7n=R=+TCLPPGHasSg@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Preserve syscall nr across execve
To: Hengqi Chen <hengqi.chen@gmail.com>
Cc: loongarch@lists.linux.dev, kernel@xen0n.name
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Queued for loongarch-fixes, thanks.

Huacai

On Mon, Dec 4, 2023 at 1:37=E2=80=AFPM Hengqi Chen <hengqi.chen@gmail.com> =
wrote:
>
> Currently, we store syscall nr in pt_regs::regs[11] and
> syscall execve accidentally overrides it during its execution:
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
> we get a wrong syscall nr. This breaks tool like execsnoop since it
> relies on execve tracepoints.
>
> Skip pt_regs::regs[11] reset in ELF_PLAT_INIT to fix the issue.
>
> Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
> ---
>  arch/loongarch/include/asm/elf.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/include/asm/elf.h b/arch/loongarch/include/as=
m/elf.h
> index b9a4ab54285c..fb9261164a34 100644
> --- a/arch/loongarch/include/asm/elf.h
> +++ b/arch/loongarch/include/asm/elf.h
> @@ -293,7 +293,7 @@ extern const char *__elf_platform;
>  #define ELF_PLAT_INIT(_r, load_addr)   do { \
>         _r->regs[1] =3D _r->regs[2] =3D _r->regs[3] =3D _r->regs[4] =3D 0=
;      \
>         _r->regs[5] =3D _r->regs[6] =3D _r->regs[7] =3D _r->regs[8] =3D 0=
;      \
> -       _r->regs[9] =3D _r->regs[10] =3D _r->regs[11] =3D _r->regs[12] =
=3D 0;   \
> +       _r->regs[9] =3D _r->regs[10] =3D /* syscall nr */ _r->regs[12] =
=3D 0; \
>         _r->regs[13] =3D _r->regs[14] =3D _r->regs[15] =3D _r->regs[16] =
=3D 0;  \
>         _r->regs[17] =3D _r->regs[18] =3D _r->regs[19] =3D _r->regs[20] =
=3D 0;  \
>         _r->regs[21] =3D _r->regs[22] =3D _r->regs[23] =3D _r->regs[24] =
=3D 0;  \
> --
> 2.27.0
>
