Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6195C97
	for <loongarch@lists.linux.dev>; Sun,  9 Jul 2023 15:31:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03BDFC433D9
	for <loongarch@lists.linux.dev>; Sun,  9 Jul 2023 15:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688916671;
	bh=sJQ626PfB3mNnXp3+jOn70AE5kQgiQFZoWeqyBTfR5o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fGh0BUCVls6qo2DiVINgakrirj3819iWwYl5GUZ9r2wgZ++Uuz5H3fotpuD8BRU6s
	 XqPs83wV7+mO+MyBGngWUGEXO/zvXAlrbOvr8jBhixj6x0BvNUYo9oE1wSrcnUcaHM
	 ybDbhob3P2ZATXrifflGXkkvvk7PgDJod7KnOUucj80X1S7EYN1K0s37X3VexQ3Lui
	 Q4h9IwUmNM46M2Q3L42Wu75xFbg6lM96dHN3sM2Cbexyg2i/vdZ1gehWPocxyOsRMG
	 uMZiYTmCj/DgXy09dbKJfYIgDMBNOOv6/tTNzgobqe5p3wIRPmXj7VVKkqGCL/8Q6p
	 DDgVVfFtkiDuw==
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3094910b150so3929993f8f.0
        for <loongarch@lists.linux.dev>; Sun, 09 Jul 2023 08:31:10 -0700 (PDT)
X-Gm-Message-State: ABy/qLYOjttzoG1PIL5zu3ZHYo+b3Y/e+EYsg+TOKFytoU7YUo0ntPOy
	Q7/174Oat2q0lsBdQkjs0kdhvc/UZ1ctOsliuR8=
X-Google-Smtp-Source: APBJJlEYmFhvnAuchoWHaiYQQ6v9RXtZhF0CprZCfzIiQe88fn/aqQylldopjq5cdoOm8yuKLEEj4TbZ8ximqK+hB5I=
X-Received: by 2002:a5d:6b49:0:b0:314:327:2ece with SMTP id
 x9-20020a5d6b49000000b0031403272ecemr8688188wrw.61.1688916669116; Sun, 09 Jul
 2023 08:31:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <MEYP282MB2597CD6E861D659E3218148DD933A@MEYP282MB2597.AUSP282.PROD.OUTLOOK.COM>
In-Reply-To: <MEYP282MB2597CD6E861D659E3218148DD933A@MEYP282MB2597.AUSP282.PROD.OUTLOOK.COM>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 9 Jul 2023 23:30:56 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5P_NgJ5kTQ1iO-eL577D=-COjEZ6u9_OgvrHpWJLqsXw@mail.gmail.com>
Message-ID: <CAAhV-H5P_NgJ5kTQ1iO-eL577D=-COjEZ6u9_OgvrHpWJLqsXw@mail.gmail.com>
Subject: Re: [PATCH] loongarch: Make CONFIG_CMDLINE work with
 CONFIG_CMDLINE_EXTEND and CONFIG_CMDLINE_BOOTLOADER
To: Dong Zhihong <donmor3000@hotmail.com>
Cc: kernel@xen0n.name, ardb@kernel.org, tangyouling@loongson.cn, 
	zhoubinbin@loongson.cn, yangtiezhu@loongson.cn, tglx@linutronix.de, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 9, 2023 at 9:33=E2=80=AFPM Dong Zhihong <donmor3000@hotmail.com=
> wrote:
>
> This patch tends to fix broken CONFIG_CMDLINE, which is not working with
> CONFIG_CMDLINE_EXTEND or CONFIG_CMDLINE_BOOTLOADER. Some code is absent i=
n
> arch/loongarch/kernel/setup.c, which should handle built-in command lines
> in CONFIG_CMDLINE. The absence of such code causes CONFIG_CMDLINE not
> working if CONFIG_CMDLINE_EXTEND or CONFIG_CMDLINE_BOOTLOADER is set to Y=
.
> CONFIG_CMDLINE_FORCE is not affected.
How to reproduce? If you use UEFI firmware, this is handled in
drivers/firmware/efi/libstub/efi-stub.c; if you use non-UEFI firmware,
this is handled in drivers/of/fdt.c.

Huacai
>
> Signed-off-by: Dong Zhihong <donmor3000@hotmail.com>
> ---
>  arch/loongarch/kernel/setup.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.=
c
> index 78a00359bde3..504218b94879 100644
> --- a/arch/loongarch/kernel/setup.c
> +++ b/arch/loongarch/kernel/setup.c
> @@ -335,6 +335,22 @@ static void __init bootcmdline_init(char **cmdline_p=
)
>         }
>  #endif
>
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
> +       }
> +
> +       if (IS_ENABLED(CONFIG_CMDLINE_BOOTLOADER) && !boot_command_line[0=
])
> +               strscpy(boot_command_line, CONFIG_CMDLINE, COMMAND_LINE_S=
IZE);
> +#endif
> +
>  out:
>         *cmdline_p =3D boot_command_line;
>  }
> --
> 2.25.1
>
>
