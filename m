Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C361513ADF;
	Fri,  4 Aug 2023 15:26:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FD38C433CB;
	Fri,  4 Aug 2023 15:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691162764;
	bh=WvZAHorDIpiciLffkFVJw3h0wT4JjJwW3b25V9pJ9jc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rdgdWpwsgCrdio72CLu/5c47JmPJbC6pDJ9yd7X3ODpdKiXDv3a0AEludD6OO3h0Y
	 kaaYjSPQ59gET1u3Dj4nloSvhNDFGqXLNNVZ3mvvWHmcfbw/eG5x3Q+n0IpgAqZAg6
	 fL/++eStQJ5/amosKRZFt4besY0Ga/gHOArYUSlDGugZ7nNU+5cmvtKXAQKS3mhIDG
	 ynkDtScRIaENlSn+ScpKQWq/S4phsR+kHrE0PirPoeN3/UVCaQFIKLmdDHCLA823F+
	 oUIVDvVxYzZh7KAOdIYXKtrtsAosCu6wdRTZtM37y0ri6LDkidXfMmoYmVkOYrJrxY
	 Zal2WDdHSB1uA==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-51a52a7d859so7099508a12.0;
        Fri, 04 Aug 2023 08:26:04 -0700 (PDT)
X-Gm-Message-State: AOJu0Yyq4zcanZ05RyHXjwafdFG7o7S4KzFJFNqqow62JBpOt/2Gkrvt
	ZxexelxX2STUutBe6NITry3i8Altw1gCMlt5H3g=
X-Google-Smtp-Source: AGHT+IHgYIxDUocD7XElmW9huTw2tiWuHOgemRBa6n1ZRjbTHykdamk6R3XLjPmb3ulxLHxs7ZYARKgDoOxCKmOvacg=
X-Received: by 2002:a05:6402:3509:b0:522:ddeb:cdcb with SMTP id
 b9-20020a056402350900b00522ddebcdcbmr58574edd.18.1691162762460; Fri, 04 Aug
 2023 08:26:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230804125609.2054719-1-kernel@xen0n.name>
In-Reply-To: <20230804125609.2054719-1-kernel@xen0n.name>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 4 Aug 2023 23:25:50 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5g-jmeQMhicrqhpStV9n0Z-EZ1dZAsuT2hmOaHki4ucg@mail.gmail.com>
Message-ID: <CAAhV-H5g-jmeQMhicrqhpStV9n0Z-EZ1dZAsuT2hmOaHki4ucg@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Drop -ffreestanding from CFLAGS
To: WANG Xuerui <kernel@xen0n.name>
Cc: Nathan Chancellor <nathan@kernel.org>, loongarch@lists.linux.dev, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, WANG Xuerui <git@xen0n.name>, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Xuerui,

On Fri, Aug 4, 2023 at 8:56=E2=80=AFPM WANG Xuerui <kernel@xen0n.name> wrot=
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
> As it turns out to be the case, removing the flag does not impact the
> LoongArch kernel's normal operation at all; so just remove it to
> restore expected libcall semantics globally on this architecture.
>
Not all processors support unaligned access, so we need the
alternative mechanism to select memset/memcpy/memmove implementations.
If remove -ffreestanding, the builtin implementation cannot be used on
all hardware.

Huacai

> Closes: https://github.com/ClangBuiltLinux/linux/issues/1897
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> ---
>  arch/loongarch/Makefile | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
> index b1e5db51b61c..db0d7210272d 100644
> --- a/arch/loongarch/Makefile
> +++ b/arch/loongarch/Makefile
> @@ -83,7 +83,6 @@ KBUILD_CFLAGS_KERNEL          +=3D -fPIE
>  LDFLAGS_vmlinux                        +=3D -static -pie --no-dynamic-li=
nker -z notext
>  endif
>
> -cflags-y +=3D -ffreestanding
>  cflags-y +=3D $(call cc-option, -mno-check-zero-division)
>
>  load-y         =3D 0x9000000000200000
> --
> 2.40.0
>
