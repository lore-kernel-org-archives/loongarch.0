Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A281D17F3;
	Sun,  6 Aug 2023 09:16:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F707C433C8;
	Sun,  6 Aug 2023 09:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691313401;
	bh=jifb9YG4Rr6HXqnZjYB7v41LYGfsqhR3YX17d3VIXRo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Xkm+Vy4AZQVhElkPv8pOnKa8sEbqYec8OuYslYcCv74rHx/U+z/QNvplxoQdiDeUM
	 tLB1szcGSl6M7c0Oi8K8lxlziy2WJp7y8FaPBw0Dl6G440XDcd2oBJLOKsQqkh12LI
	 CuhZyeGyqZq8sUhLlwKBCaTht69bWOIiFEuzVrt6ZFDydRsc4F9gURZDaNHzyEtgUF
	 6QRtoGNvCMkyaqtPGP7t451hIwP4rAevehFzeS54Fh26oWzMvZYWkqnTbomu/ABhuV
	 V9eUEraD8XBdEmD7csBIuDS/rhxxlC2nXUVsK211b1mSMtpN1nT+f1ImuY5Ws/gXS+
	 m3Kq2dwvsvJmA==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-523225dd110so2539742a12.0;
        Sun, 06 Aug 2023 02:16:41 -0700 (PDT)
X-Gm-Message-State: AOJu0YxZSwbAfdKtGYp2b4Y8SqFrCmVQgtsAEPiUzBtjc5OHbXTaq8sZ
	BRpS5r/JrHvIW8jyEPiZkmLq6JvZxX5JyKpZuHw=
X-Google-Smtp-Source: AGHT+IE44ZgJDuzU2/E4B4XddjcS5qKjR0In7pq4IcQqpa+gfmTZKMitg1QKWUctRDdgDPeBnxJwq8yQwXa08M9rsE8=
X-Received: by 2002:aa7:cac2:0:b0:522:3ef1:b10 with SMTP id
 l2-20020aa7cac2000000b005223ef10b10mr4773223edt.6.1691313399306; Sun, 06 Aug
 2023 02:16:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230806083021.2243574-1-kernel@xen0n.name>
In-Reply-To: <20230806083021.2243574-1-kernel@xen0n.name>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 6 Aug 2023 17:16:28 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4ypd-+z-KbeGM6C_mNk0aggk2yhdDik-XfPNWqsO=j=A@mail.gmail.com>
Message-ID: <CAAhV-H4ypd-+z-KbeGM6C_mNk0aggk2yhdDik-XfPNWqsO=j=A@mail.gmail.com>
Subject: Re: [PATCH v2] LoongArch: Replace -ffreestanding with finer-grained -fno-builtin's
To: WANG Xuerui <kernel@xen0n.name>
Cc: Nathan Chancellor <nathan@kernel.org>, Xi Ruoyao <xry111@xry111.site>, loongarch@lists.linux.dev, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	WANG Xuerui <git@xen0n.name>, Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Xuerui,

On Sun, Aug 6, 2023 at 4:30=E2=80=AFPM WANG Xuerui <kernel@xen0n.name> wrot=
e:
>
> From: WANG Xuerui <git@xen0n.name>
>
> As explained by Nick in the original issue: the kernel usually does a
> good job of providing library helpers that have similar semantics as
> their ordinary userspace libc equivalents, but -ffreestanding disables
> such libcall optimization and other related features in the compiler,
> which can lead to unexpected things such as CONFIG_FORTIFY_SOURCE not
> working (!).
>
> As it turns out to be the case, only the memory operations really need
> to be prevented from expansion by the compiler, and this is doable with
> finer-grained -fno-builtin-* toggles. So only disable memcpy, memmove
> and memset, while leaving other builtins enabled, to fix source
> fortification among others.
>
> Closes: https://github.com/ClangBuiltLinux/linux/issues/1897
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> ---
>
> Changes in v2:
>
> - Keep the memory operation builtins disabled, add comments, and tweak th=
e
>   commit message along the way.
>
>  arch/loongarch/Makefile | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
> index b1e5db51b61c..34fc48df87f2 100644
> --- a/arch/loongarch/Makefile
> +++ b/arch/loongarch/Makefile
> @@ -83,7 +83,14 @@ KBUILD_CFLAGS_KERNEL         +=3D -fPIE
>  LDFLAGS_vmlinux                        +=3D -static -pie --no-dynamic-li=
nker -z notext
>  endif
>
> -cflags-y +=3D -ffreestanding
> +# Make sure the memory libcalls are not expanded by the compiler, for be=
tter
> +# control over unaligned accesses with respect to CONFIG_ARCH_STRICT_ALI=
GN,
> +# and also for avoiding https://gcc.gnu.org/PR109465.
> +#
> +# The overly broad -ffreestanding is undesirable as it disables *all* li=
bcall
> +# handling, that unfortunately includes proper FORTIFY_SOURCE instrument=
ation.
I think these comments should go to commit message rather than here,
because after this patch there is no -ffreestanding in Makefile.

Huacai

> +cflags-y +=3D -fno-builtin-memcpy -fno-builtin-memmove -fno-builtin-mems=
et
> +
>  cflags-y +=3D $(call cc-option, -mno-check-zero-division)
>
>  load-y         =3D 0x9000000000200000
> --
> 2.40.0
>
>
