Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373A97468
	for <loongarch@lists.linux.dev>; Mon, 17 Jul 2023 06:25:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA865C433C7
	for <loongarch@lists.linux.dev>; Mon, 17 Jul 2023 06:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689575102;
	bh=M+aBIDk8gF9TbKt2VjchGrvQUvaXF0DLEWlmQmRl5Y0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Lt79vDcBB8Bf9FDm1uMDifduuXtDspDZPNuAzdr3trzr8ZYcsf8DDnQIUuu8s0+NF
	 EfcXhUU0uejFc4HfhLID39hEwvl0s93zDUdPW3dcy3Bd7inmIP0Qv7l4Nn5cViMFCG
	 IEbel2jura9yKSYbf3A+H2tpeME7/Z/68+C15fJ79MKF/iKk5kfL+onjwTqeA/N012
	 hBmX48I0A7jbuPI31RHSchmZx9yEVRPa+ilg4p1efgzGWCJnmnPvnhV1BTSCciovPw
	 qX4jMxtd1Iwf+uPE5h8lLzrleA/RAYgXtDclgkViyCyhkjU5bKro6gkKHCmcDucUuL
	 AOZFRqeIqXyEw==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-9924ac01f98so585840266b.1
        for <loongarch@lists.linux.dev>; Sun, 16 Jul 2023 23:25:02 -0700 (PDT)
X-Gm-Message-State: ABy/qLbj9JOXiochFxBGQLrGvj6F7ZMTkrsr9gfBylt+3JLWozkF5RCl
	I/pM75Q0Cly5qw/o/AkcZIWH8KeR1+TppymOe20=
X-Google-Smtp-Source: APBJJlF7jp28QiMSJoC7yf4/D47I4DGMgHllA94w9S0ZyKFkA74MgLbMr5DjNXkOGr/E4tdsv2yDmefglgeWteKKEAM=
X-Received: by 2002:a17:906:51dd:b0:965:ff38:2fbb with SMTP id
 v29-20020a17090651dd00b00965ff382fbbmr10011057ejk.1.1689575100962; Sun, 16
 Jul 2023 23:25:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <MEYP282MB2597514C7A4697A72F829B78D93BA@MEYP282MB2597.AUSP282.PROD.OUTLOOK.COM>
In-Reply-To: <MEYP282MB2597514C7A4697A72F829B78D93BA@MEYP282MB2597.AUSP282.PROD.OUTLOOK.COM>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 17 Jul 2023 14:24:48 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6u5WBVC36OyNsFZVfmZ9_Nk+_ASFrYyxd5fsEEdNRaMQ@mail.gmail.com>
Message-ID: <CAAhV-H6u5WBVC36OyNsFZVfmZ9_Nk+_ASFrYyxd5fsEEdNRaMQ@mail.gmail.com>
Subject: Re: [PATCH v4] LoongArch: Make CONFIG_CMDLINE work with
 CONFIG_CMDLINE_EXTEND and CONFIG_CMDLINE_BOOTLOADER
To: Dong Zhihong <donmor3000@hotmail.com>
Cc: kernel@xen0n.name, ardb@kernel.org, tangyouling@loongson.cn, 
	zhoubinbin@loongson.cn, yangtiezhu@loongson.cn, tglx@linutronix.de, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 17, 2023 at 12:09=E2=80=AFPM Dong Zhihong <donmor3000@hotmail.c=
om> wrote:
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
>         loongarch
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
> index 78a00359bde3..3cafda1a409e 100644
> --- a/arch/loongarch/kernel/setup.c
> +++ b/arch/loongarch/kernel/setup.c
> @@ -332,7 +332,24 @@ static void __init bootcmdline_init(char **cmdline_p=
)
>                         strlcat(boot_command_line, " ", COMMAND_LINE_SIZE=
);
>
>                 strlcat(boot_command_line, init_command_line, COMMAND_LIN=
E_SIZE);
> +               goto out;
> +       }
> +#endif
> +
> +#ifdef CONFIG_CMDLINE
> +       /*
> +        * If CONFIG_CMDLINE_BOOTLOADER is enabled then we use thei built=
-in
> +        * command line if no command line given, or we append given comm=
and
> +        * line to the built-in one if CONFIG_CMDLINE_EXTEND is enabled.
> +        */
> +       if (IS_ENABLED(CONFIG_CMDLINE_EXTEND)) {
> +               strscpy(boot_command_line, CONFIG_CMDLINE, COMMAND_LINE_S=
IZE);
> +               strlcat(boot_command_line, " ", COMMAND_LINE_SIZE);
> +               strlcat(boot_command_line, init_command_line, COMMAND_LIN=
E_SIZE);
>         }
> +
> +       if (IS_ENABLED(CONFIG_CMDLINE_BOOTLOADER) && !boot_command_line[0=
])
> +               strscpy(boot_command_line, CONFIG_CMDLINE, COMMAND_LINE_S=
IZE);
>  #endif
???What is the difference between V3 and V4?
And the title can be "LoongArch: Fix CONFIG_CMDLINE_EXTEND and
CONFIG_CMDLINE_BOOTLOADER handling"

Huacai

>
>  out:
> --
> 2.25.1
>
