Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D81AD2FF
	for <loongarch@lists.linux.dev>; Fri, 23 Jun 2023 16:39:15 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-400813b8d56so8227431cf.0
        for <loongarch@lists.linux.dev>; Fri, 23 Jun 2023 09:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687538354; x=1690130354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8LECLQNnPYl0y9r0xDtUgl5E87ZKIYJNhvoef1Dor0g=;
        b=dkKxv2jKnBQqAajzGXBmpV6B0eM8pL9kPs6CIVf+ThG9Iahm2kU+vQ0Fjnzn7i9vHT
         GjUC5pNMkIyqj9rtWJMxzb91fel2sBJjFqzEVLiKyVhIYA6jE5UH/dZYxxYO/A2PtIv2
         Hxp+jcSKewNrf5iuF5bOpEyTkxC3xH18HAChCnG98UD6p7dVREWfhjA/O7Ec3L8BiJDu
         vRWYe+zjzPZ0+SU/QJXJ+Lg23sFoeHdWLozBEe5gMg8s0vgYl31aoKkfmib29RE8/OL/
         9vrHrUCHluh78Smr69+sWBr0lNEnv64ao2hB5EIHKCE+asWMYAXE+cLz5VZr9CFy9CuS
         xVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687538354; x=1690130354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8LECLQNnPYl0y9r0xDtUgl5E87ZKIYJNhvoef1Dor0g=;
        b=L46cRxblmyX4pcSyjO6mDZUACUpK0so9F4IZ2fv0NLPs+N0akRgZBb++7qXkaJO75K
         6mauFdGGYtHvLurTwow3QH4y+Hj+EMVf8gbryPw41O9J84tLeGfiux4MYF1t3oV+Fbg5
         YdzAlEMkLVSoiEs1nO5Vq3CO2WmkMcTsqkTlR78qFiyhtVTmURF1gpFgt79TLy0u0TIi
         8arWcweT+dk2B3IUBoeTvGzhdL2uWoFCmUYKY7P/QHvxxOVSXj2tv5L9dGxVTY/qwcFy
         JTwgW9q7cKkJG/KzOxQmj4f1s8tAOg6N0pXyhd8ZIEzOr7043X7Ytn6mdJO2FrkdjNFf
         vnrw==
X-Gm-Message-State: AC+VfDweG9xNAlNJUTD+wHe5vEE/WG1lpJF+uKntG/uJ8u9f8Nc0uLDZ
	DTbPxLLYMvo/dY5jQP4AgD2cTOdwHXUrVLTcH2ambg==
X-Google-Smtp-Source: ACHHUZ4nTMiMdzxcp5Dyr7rUsaaeYLVLKDx8ob6RuR0oNVQa3WXS6lje+VJiQNjFDZvvFpcBUUKXRlNvWTJhRtRJ3RU=
X-Received: by 2002:ad4:5be4:0:b0:634:20f:471c with SMTP id
 k4-20020ad45be4000000b00634020f471cmr1044805qvc.14.1687538353806; Fri, 23 Jun
 2023 09:39:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230623134351.1898379-1-kernel@xen0n.name> <20230623134351.1898379-8-kernel@xen0n.name>
In-Reply-To: <20230623134351.1898379-8-kernel@xen0n.name>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 23 Jun 2023 09:39:03 -0700
Message-ID: <CAKwvOdn5e+BzhGzDPnZYEjCuanABJmu5ZZo5x2uwHj4L44m5nA@mail.gmail.com>
Subject: Re: [PATCH 7/9] LoongArch: Tweak CFLAGS for Clang compatibility
To: WANG Xuerui <kernel@xen0n.name>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Rui <wangrui@loongson.cn>, 
	Xi Ruoyao <xry111@xry111.site>, loongarch@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, WANG Xuerui <git@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 23, 2023 at 6:44=E2=80=AFAM WANG Xuerui <kernel@xen0n.name> wro=
te:
>
> From: WANG Xuerui <git@xen0n.name>
>
> Now the arch code is mostly ready for LLVM/Clang consumption, it is time
> to re-organize the CFLAGS a little to actually enable the LLVM build.
>
> A build with !RELOCATABLE && !MODULE is confirmed working within a QEMU
> environment; support for the two features are currently blocked by
> LLVM/Clang, and will come later.
>
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> ---
>  arch/loongarch/Makefile      | 14 +++++++++++---
>  arch/loongarch/vdso/Makefile |  6 +++++-
>  2 files changed, 16 insertions(+), 4 deletions(-)
>
> diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
> index a27e264bdaa5..efe9b50bd829 100644
> --- a/arch/loongarch/Makefile
> +++ b/arch/loongarch/Makefile
> @@ -46,12 +46,18 @@ ld-emul                     =3D $(64bit-emul)
>  cflags-y               +=3D -mabi=3Dlp64s
>  endif
>
> -cflags-y                       +=3D -G0 -pipe -msoft-float

This seems to drop -msoft-float for GCC. Intentional?

> -LDFLAGS_vmlinux                        +=3D -G0 -static -n -nostdlib
> +ifndef CONFIG_CC_IS_CLANG
> +cflags-y                       +=3D -G0
> +LDFLAGS_vmlinux                        +=3D -G0

Thanks for the patch!

I can understand not passing -G0 to clang if clang doesn't understand
it, but should you be using CONFIG_LD_IS_LLD for LDFLAGS?

What does -G0 do?

Is there a plan to support it in clang and lld?

If so, please file a bug in LLVM's issue tracker
https://github.com/llvm/llvm-project/issues
then link to it in a comment in this Makefile above the relevant condition.

> +endif
> +cflags-y                       +=3D -pipe
> +LDFLAGS_vmlinux                        +=3D -static -n -nostdlib
>
>  # When the assembler supports explicit relocation hint, we must use it.
>  # GCC may have -mexplicit-relocs off by default if it was built with an =
old
> -# assembler, so we force it via an option.
> +# assembler, so we force it via an option. For LLVM/Clang the desired be=
havior
> +# is the default, and the flag is not supported, so don't pass it if Cla=
ng is
> +# being used.
>  #
>  # When the assembler does not supports explicit relocation hint, we can'=
t use
>  # it.  Disable it if the compiler supports it.
> @@ -61,8 +67,10 @@ LDFLAGS_vmlinux                      +=3D -G0 -static =
-n -nostdlib
>  # combination of a "new" assembler and "old" compiler is not supported. =
 Either
>  # upgrade the compiler or downgrade the assembler.
>  ifdef CONFIG_AS_HAS_EXPLICIT_RELOCS
> +ifndef CONFIG_CC_IS_CLANG
>  cflags-y                       +=3D -mexplicit-relocs
>  KBUILD_CFLAGS_KERNEL           +=3D -mdirect-extern-access
> +endif

Why would AS_HAS_EXPLICIT_RELOCS be set if -mexplicit-relocs isn't
supported? Is the kconfig for that broken?

Does AS_HAS_EXPLICIT_RELOCS also need to test for the support for
-mdirect-extern-access or should there be a new config for that?
CC_SUPPORTS_DIRECT_EXTERN_ACCESS

>  else
>  cflags-y                       +=3D $(call cc-option,-mno-explicit-reloc=
s)
>  KBUILD_AFLAGS_KERNEL           +=3D -Wa,-mla-global-with-pcrel
> diff --git a/arch/loongarch/vdso/Makefile b/arch/loongarch/vdso/Makefile
> index 4c859a0e4754..19f6c75a1106 100644
> --- a/arch/loongarch/vdso/Makefile
> +++ b/arch/loongarch/vdso/Makefile
> @@ -25,13 +25,17 @@ endif
>  cflags-vdso :=3D $(ccflags-vdso) \
>         -isystem $(shell $(CC) -print-file-name=3Dinclude) \
>         $(filter -W%,$(filter-out -Wa$(comma)%,$(KBUILD_CFLAGS))) \
> -       -O2 -g -fno-strict-aliasing -fno-common -fno-builtin -G0 \
> +       -O2 -g -fno-strict-aliasing -fno-common -fno-builtin \
>         -fno-stack-protector -fno-jump-tables -DDISABLE_BRANCH_PROFILING =
\
>         $(call cc-option, -fno-asynchronous-unwind-tables) \
>         $(call cc-option, -fno-stack-protector)
>  aflags-vdso :=3D $(ccflags-vdso) \
>         -D__ASSEMBLY__ -Wa,-gdwarf-2
>
> +ifndef CONFIG_CC_IS_CLANG
> +cflags-vdso +=3D -G0
> +endif
> +
>  ifneq ($(c-gettimeofday-y),)
>    CFLAGS_vgettimeofday.o +=3D -include $(c-gettimeofday-y)
>  endif
> --
> 2.40.0
>
>


--=20
Thanks,
~Nick Desaulniers
