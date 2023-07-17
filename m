Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D6F1FCC
	for <loongarch@lists.linux.dev>; Mon, 17 Jul 2023 07:06:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 848CDC433C9
	for <loongarch@lists.linux.dev>; Mon, 17 Jul 2023 07:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689577566;
	bh=3YLD3BsG7+2BO+Oev/NAb7pEjim2De5t1WFLv9RTA44=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nrEQK7fi3R4GzM5GHZI8YXS7G5FO1CCPpvmFEqSqOz8kQFWaXNvyOlYTEccjoemGG
	 ammI5MWhoMapAt8lksC86E7yeNzhBm7U6bheeUEyv5C9/xp8JXXu10mopUHaWKO/nv
	 cyX9nhQJ6FIu7QbDx0boDtDA773RpUj2o6+N8xYPaLtdyjPGTzqK6XgpmSzjJt3ShQ
	 Oz66gDJnqPIdRV5VMRKwdvQAW0giEqaguiBvZRGS+HRY5q3a4o2fHQSqbx0PRc21Im
	 4pUOkcURTMMBQpTFDLQTJu1jdeZLFb+hwxaIEndeJF4nDauZcWrP44jefBVT2Q64Dg
	 UmyOnQFWGc3Jw==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-51e5da802afso5936170a12.3
        for <loongarch@lists.linux.dev>; Mon, 17 Jul 2023 00:06:06 -0700 (PDT)
X-Gm-Message-State: ABy/qLauNdpGDTgVYK9Wn6KhBdG3wp+Kq7V6EoqdyJybmV4IGQkDpxx8
	vGsSehzuCmCYN5502yNH1YW+owe6cfciSLxwmJo=
X-Google-Smtp-Source: APBJJlG5LKwPyz5qfh4I31r5cP/uFn3PkgEOKigeITITs9bLV0/hTJLSWT1UgkScu8NqHpduwoMXAmqfIumAK1DOV18=
X-Received: by 2002:a50:ec87:0:b0:51d:98d1:5337 with SMTP id
 e7-20020a50ec87000000b0051d98d15337mr10408759edr.37.1689577564764; Mon, 17
 Jul 2023 00:06:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <MEYP282MB259720FF3C1683A75881EF02D93BA@MEYP282MB2597.AUSP282.PROD.OUTLOOK.COM>
In-Reply-To: <MEYP282MB259720FF3C1683A75881EF02D93BA@MEYP282MB2597.AUSP282.PROD.OUTLOOK.COM>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 17 Jul 2023 15:05:52 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6dn9iRxaGGoD+=7YHiDEmt_Be4_v8d1oY7+dmhrJBUMw@mail.gmail.com>
Message-ID: <CAAhV-H6dn9iRxaGGoD+=7YHiDEmt_Be4_v8d1oY7+dmhrJBUMw@mail.gmail.com>
Subject: Re: [PATCH v4] LoongArch: Fix CONFIG_CMDLINE_EXTEND and
 CONFIG_CMDLINE_BOOTLOADER handling
To: Dong Zhihong <donmor3000@hotmail.com>
Cc: kernel@xen0n.name, ardb@kernel.org, tangyouling@loongson.cn, 
	zhoubinbin@loongson.cn, yangtiezhu@loongson.cn, tglx@linutronix.de, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 17, 2023 at 2:51=E2=80=AFPM Dong Zhihong <donmor3000@hotmail.co=
m> wrote:
>
> Make CONFIG_CMDLINE work with CONFIG_CMDLINE_EXTEND and
> CONFIG_CMDLINE_BOOTLOADER. The touched function is bootcmdline_init()`.
> There's already code handling CONFIG_CMDLINE_FORCE, which replaces
> `boot_command_line` with CONFIG_CMDLINE and immediately`goto out`. It'd b=
e
> similar way to handle CONFIG_CMDLINE_EXTEND and CONFIG_CMDLINE_BOOTLOADER=
,
> so some code is added after OF_FLATTREE part to handle them.
>
> Signed-off-by: Dong Zhihong <donmor3000@hotmail.com>
> ---
>
> v4 -> v3: Make CONFIG_CMDLINE appended to the end of command line (Huacai=
);
>         Removed unnecessary #ifdef since CONFIG_CMDLINE is always a strin=
g on
>         LoongArch
>         Reworded comments
>         Reworded the subject of commit message (Huacai)
> v3 -> v2: Reworded the commit message again to make it imperative (Ruoyao=
)
> v2 -> v1: Reworded the commit message so it's more imperative (Markus);
>         Added `goto out` to FDT part (Huacai)
>
>  arch/loongarch/kernel/setup.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.=
c
> index 78a00359bde3..a98f33553acf 100644
> --- a/arch/loongarch/kernel/setup.c
> +++ b/arch/loongarch/kernel/setup.c
> @@ -332,9 +332,26 @@ static void __init bootcmdline_init(char **cmdline_p=
)
>                         strlcat(boot_command_line, " ", COMMAND_LINE_SIZE=
);
>
>                 strlcat(boot_command_line, init_command_line, COMMAND_LIN=
E_SIZE);
> +               goto out;
>         }
>  #endif
>
> +       /*
> +        * Append built-in command to the retrieved one if
> +        * CONFIG_CMDLINE_EXTEND is enabled.
> +        */
> +       if (IS_ENABLED(CONFIG_CMDLINE_EXTEND) && CONFIG_CMDLINE[0]) {
Don't need to check CONFIG_CMDLINE[0], this simplifies the conditions.

> +               strlcat(boot_command_line, " ", COMMAND_LINE_SIZE);
> +               strlcat(boot_command_line, CONFIG_CMDLINE, COMMAND_LINE_S=
IZE);
> +               goto out;
Remove this line and in the next line using the old method
(IS_ENABLED(CONFIG_CMDLINE_BOOTLOADER) && !boot_command_line[0]) is
better.

Huacai
> +       }
> +
> +       /*
> +        * Use built-in command line if nothing is retrieved from boot lo=
ader.
> +        */
> +       if (!boot_command_line[0])
> +               strscpy(boot_command_line, CONFIG_CMDLINE, COMMAND_LINE_S=
IZE);
> +
>  out:
>         *cmdline_p =3D boot_command_line;
>  }
> --
> 2.25.1
>
