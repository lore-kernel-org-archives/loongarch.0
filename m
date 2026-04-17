Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7A2282F05
	for <loongarch@lists.linux.dev>; Fri, 17 Apr 2026 03:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776395728; cv=none; b=i+lD9jOuqsWpQNC1M6ubcSajEJVOqPSaQtCGOfgoHo2YPqYuo+kZ6AQa3TD3FZJ3CzYXjYSdOdnihWcCo4nbRsC64/mqLAPRbrJ0gySVoVlKLIdB833ZGPsHg66At7+bTa8o38Tpgqkerf5tIRwD1ZuHDBTh7NIjemApFkJDXGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776395728; c=relaxed/simple;
	bh=KyhBDN9h5sQlkpf72nrWY01K84qeR6aao2bsr9KywHM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IkPDZEyc2UPW+a/aUZJdBUP1xpH41N1EUfoWGPam4BtNfcVo3TyQ9jWHn95MD9cMLvbhnic8KVpgreHrbrJJDAFDFaMhQLX8/gC1OXVJYlFRhz8qMS/+YuP6V7WkK7yTfV4iE/fq3LrYreHMo7Qt/hQaCx52iCrXgzzFVVPwm3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b0m0dN8u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b0m0dN8u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D59B6C4AF09
	for <loongarch@lists.linux.dev>; Fri, 17 Apr 2026 03:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776395727;
	bh=KyhBDN9h5sQlkpf72nrWY01K84qeR6aao2bsr9KywHM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=b0m0dN8u5UNNLg4NPVYOy/jYJTFxAONK+D2PuWpsAXaW28C0pxKINZcxYqtoJLdfy
	 VgkHgWmK7eChqe3V3mSs9GqVIsRcpKFpT5X1PoGFhaHeaT536JIwDn6dri6gMrX8ka
	 T2Z3oyQxvyklPyFf0psKU1nxAd8XW026HaodklX/3t4kPJj4JMDsOjgQ2Iji/dgF/S
	 iFvTSKkePqumRcK8MSqXXMRuZXWLA0jDwGvTCN4NCYndeiWaIIyL42Z8y0JZ5dOjnU
	 8LKGUqMxmZ6KsBSpiYr7heoHjk/pzGgmxdTvcYCmaA+OvHxfwoKwv2FzhmNgztuOiI
	 ZGM9VEQTJMrig==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b9358bc9c50so35153866b.1
        for <loongarch@lists.linux.dev>; Thu, 16 Apr 2026 20:15:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9lo/aLTC8Yd3B/MivIoAoc3senPcr15VG3lSan5kwpFEo/OHShZYOkaAfUQUouQJ+aGGmI5EWwgB8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyVqtzACZNWY8zQj02qlRyHjftATVk9Nur8evn6eAUgGfwG64dI
	gUa7HZqZ4jeGqHT62aDY4pYIkW4Ys5h2pJIGsAQ6FjwyXwMGxt1L0Ms0dfYQQzxpLe2tCk2F96W
	jvb1djj1GcKY+LIpn904QWiXQiFgKEbE=
X-Received: by 2002:a17:907:7f8a:b0:b9d:498d:cffd with SMTP id
 a640c23a62f3a-ba41b3de282mr49426866b.35.1776395726202; Thu, 16 Apr 2026
 20:15:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <80CA78395583F396+20260413031236.2512416-1-yangyuqian@uniontech.com>
In-Reply-To: <80CA78395583F396+20260413031236.2512416-1-yangyuqian@uniontech.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 17 Apr 2026 11:15:13 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5TmQUjcqCn6b_fXo+Fi9ovtkJNENpRh9ekqbc4xOJA9g@mail.gmail.com>
X-Gm-Features: AQROBzAxqbhmC9VWqjZmZaV8zW5hDDvOrYbhr4TNOsKAUhMfPUVp-0T-iM09anE
Message-ID: <CAAhV-H5TmQUjcqCn6b_fXo+Fi9ovtkJNENpRh9ekqbc4xOJA9g@mail.gmail.com>
Subject: Re: [PATCH v2] LoongArch: improve logging of disabling KASLR
To: Yuqian Yang <yangyuqian@uniontech.com>
Cc: WANG Xuerui <kernel@xen0n.name>, Cheng Nie <niecheng1@uniontech.com>, 
	Wentao Guan <guanwentao@uniontech.com>, Dandan Zhang <zhangdandan@uniontech.com>, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied with some modifications, thanks.

Huacai

On Mon, Apr 13, 2026 at 11:13=E2=80=AFAM Yuqian Yang <yangyuqian@uniontech.=
com> wrote:
>
> Whether KASLR is disabled is not handled in nokaslr (early param
> "nokaslr" setup function) but in kaslr_disabled. However, the logging
> was done in nokaslr previously. So we move the logging to the right
> place and add more specific info about why it's disabled.
>
> Suggested-by: Wentao Guan <guanwentao@uniontech.com>
> Signed-off-by: Yuqian Yang <yangyuqian@uniontech.com>
> ---
>
> Changes since v1:
>   * update commit title, loongarch -> LoongArch, remove trailing period.
>   * use macro instead of const variable as log message to avoid build err=
or.
>
>  arch/loongarch/kernel/relocate.c | 27 +++++++++++++++++++--------
>  1 file changed, 19 insertions(+), 8 deletions(-)
>
> diff --git a/arch/loongarch/kernel/relocate.c b/arch/loongarch/kernel/rel=
ocate.c
> index 82aa3f0359278..80720175c89dc 100644
> --- a/arch/loongarch/kernel/relocate.c
> +++ b/arch/loongarch/kernel/relocate.c
> @@ -128,9 +128,8 @@ static inline __init unsigned long get_random_boot(vo=
id)
>
>  static int __init nokaslr(char *p)
>  {
> -       pr_info("KASLR is disabled.\n");
> -
> -       return 0; /* Print a notice and silence the boot warning */
> +       /* The real check is handled in kaslr_disabled() below. */
> +       return 0;
>  }
>  early_param("nokaslr", nokaslr);
>
> @@ -138,14 +137,19 @@ static inline __init bool kaslr_disabled(void)
>  {
>         char *str;
>         const char *builtin_cmdline =3D CONFIG_CMDLINE;
> +#define LOONGARCH_KASLR_DISABLED_MESSAGE "KASLR is disabled by %s in %s =
cmdline.\n"
>
>         str =3D strstr(builtin_cmdline, "nokaslr");
> -       if (str =3D=3D builtin_cmdline || (str > builtin_cmdline && *(str=
 - 1) =3D=3D ' '))
> +       if (str =3D=3D builtin_cmdline || (str > builtin_cmdline && *(str=
 - 1) =3D=3D ' ')) {
> +               pr_info(LOONGARCH_KASLR_DISABLED_MESSAGE, "nokaslr", "bui=
lt-in");
>                 return true;
> +       }
>
>         str =3D strstr(boot_command_line, "nokaslr");
> -       if (str =3D=3D boot_command_line || (str > boot_command_line && *=
(str - 1) =3D=3D ' '))
> +       if (str =3D=3D boot_command_line || (str > boot_command_line && *=
(str - 1) =3D=3D ' ')) {
> +               pr_info(LOONGARCH_KASLR_DISABLED_MESSAGE, "nokaslr", "boo=
t");
>                 return true;
> +       }
>
>  #ifdef CONFIG_HIBERNATION
>         str =3D strstr(builtin_cmdline, "nohibernate");
> @@ -165,19 +169,26 @@ static inline __init bool kaslr_disabled(void)
>                 return false;
>
>         str =3D strstr(builtin_cmdline, "resume=3D");
> -       if (str =3D=3D builtin_cmdline || (str > builtin_cmdline && *(str=
 - 1) =3D=3D ' '))
> +       if (str =3D=3D builtin_cmdline || (str > builtin_cmdline && *(str=
 - 1) =3D=3D ' ')) {
> +               pr_info(LOONGARCH_KASLR_DISABLED_MESSAGE, "resume=3D", "b=
uilt-in");
>                 return true;
> +       }
>
>         str =3D strstr(boot_command_line, "resume=3D");
> -       if (str =3D=3D boot_command_line || (str > boot_command_line && *=
(str - 1) =3D=3D ' '))
> +       if (str =3D=3D boot_command_line || (str > boot_command_line && *=
(str - 1) =3D=3D ' ')) {
> +               pr_info(LOONGARCH_KASLR_DISABLED_MESSAGE, "resume=3D", "b=
oot");
>                 return true;
> +       }
>  #endif
>
>         str =3D strstr(boot_command_line, "kexec_file");
> -       if (str =3D=3D boot_command_line || (str > boot_command_line && *=
(str - 1) =3D=3D ' '))
> +       if (str =3D=3D boot_command_line || (str > boot_command_line && *=
(str - 1) =3D=3D ' ')) {
> +               pr_info(LOONGARCH_KASLR_DISABLED_MESSAGE, "kexec_file", "=
boot");
>                 return true;
> +       }
>
>         return false;
> +#undef LOONGARCH_KASLR_DISABLED_MESSAGE
>  }
>
>  /* Choose a new address for the kernel */
>
> base-commit: e774d5f1bc27a85f858bce7688509e866f8e8a4e
> --
> 2.50.1
>
