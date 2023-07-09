Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057F817E1
	for <loongarch@lists.linux.dev>; Sun,  9 Jul 2023 03:52:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A69EC433C8
	for <loongarch@lists.linux.dev>; Sun,  9 Jul 2023 03:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688874751;
	bh=QbeU9C1eV5NDrPryCedGiMb3A34VmKXr6ljBa+OLAhs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WYNyV+8p4LLkjJajwdcyCCdrHGf6x3bPezuZTW5ir6p8sarcQODzBhXZNvKUVtRfw
	 9Vg0kjGU/0sPmAfmLsvc962XTZrPTBrvUUIXXgdOZpA7bicilkkqod105NT92tmBEI
	 +L/lKCzlwpg9SvMdCNLyEnhl720dgNAnUF7UJYn6YT/L7OR7FTk/Dmt5qi93v4T4+E
	 hj0cA1kZ5mLlJhwev/dFZzGXIKuQEaqLDEYezI/MeAkEVnQsmMEHVN4hAWeUwm40Du
	 mUl07Dh4xOcxxtRe6RHo60bGeLOlgIZ3kuG9w0ydckeDRml5HeSkYFwHcLtPru9WWv
	 Y8xcXrZyqWiXA==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-51d7e8dd118so4512645a12.1
        for <loongarch@lists.linux.dev>; Sat, 08 Jul 2023 20:52:30 -0700 (PDT)
X-Gm-Message-State: ABy/qLY1H68GdtPo/KlukysRRFizhIOna7/G0H9T9qicYST4RnUPd5OM
	VuFlMddrkjinARG792weacss0KZ1nYOSWxGAl5s=
X-Google-Smtp-Source: APBJJlGNCUL6QDorEqtymyKx6PttpF9SBpMnoOu55iTaodjTA54nw7G5G8NBbW3t3qfwZPJ/SI56nv5qiI+a46v3Rc4=
X-Received: by 2002:aa7:d3cc:0:b0:51e:ca7:a107 with SMTP id
 o12-20020aa7d3cc000000b0051e0ca7a107mr6981521edr.31.1688874748799; Sat, 08
 Jul 2023 20:52:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230701083247.177482-1-xry111@xry111.site>
In-Reply-To: <20230701083247.177482-1-xry111@xry111.site>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 9 Jul 2023 11:52:18 +0800
X-Gmail-Original-Message-ID: <CAAhV-H623HAbKBp5emSo_-gL-7bJmA3TfqkmajS+PKABPwUdYw@mail.gmail.com>
Message-ID: <CAAhV-H623HAbKBp5emSo_-gL-7bJmA3TfqkmajS+PKABPwUdYw@mail.gmail.com>
Subject: Re: [PATCH] loongarch: loongson3_defconfig: Enable CONFIG_JUMP_LABEL
To: Xi Ruoyao <xry111@xry111.site>
Cc: WANG Xuerui <kernel@xen0n.name>, Tiezhu Yang <yangtiezhu@loongson.cn>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Ruoyao,

This has already been enabled here [1] for the next cycle.

[1] https://github.com/chenhuacai/linux/commit/03f4dca2d838b34aa8618b9d378a=
fb706f810d56

Huacai

On Sat, Jul 1, 2023 at 4:33=E2=80=AFPM Xi Ruoyao <xry111@xry111.site> wrote=
:
>
> As it's an optimization without any real disadvantages, let's enable it
> like the defconfig of other architecture supporting it.
>
> Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> ---
>  arch/loongarch/configs/loongson3_defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/loongarch/configs/loongson3_defconfig b/arch/loongarch/=
configs/loongson3_defconfig
> index 6cd26dd3c134..33a0f5f742f6 100644
> --- a/arch/loongarch/configs/loongson3_defconfig
> +++ b/arch/loongarch/configs/loongson3_defconfig
> @@ -63,6 +63,7 @@ CONFIG_EFI_ZBOOT=3Dy
>  CONFIG_EFI_GENERIC_STUB_INITRD_CMDLINE_LOADER=3Dy
>  CONFIG_EFI_CAPSULE_LOADER=3Dm
>  CONFIG_EFI_TEST=3Dm
> +CONFIG_JUMP_LABEL=3Dy
>  CONFIG_MODULES=3Dy
>  CONFIG_MODULE_FORCE_LOAD=3Dy
>  CONFIG_MODULE_UNLOAD=3Dy
> --
> 2.41.0
>
>
