Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A6E7E
	for <loongarch@lists.linux.dev>; Sat, 14 Oct 2023 08:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K+yp/KOZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B239C433CA
	for <loongarch@lists.linux.dev>; Sat, 14 Oct 2023 08:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697272921;
	bh=G4Swg/OELkKA5zlwNUrWJdm9EBLT0JpHuSiYFDVKAVw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=K+yp/KOZHEM3arVfGghtli0iELZWZqeBdZQjVLVWAUiNiyjaLooZNU+qmDCQBd7ul
	 wJaBzeZOVlPFEUG5h5tlObcnYkX0avwfR0zxFXrVQEiQDnBc/Lml9dt/p9dThylmIB
	 6dy7VAWjVXsKM31JLEaZWzS991xED7EXyxYEqup8PHhHUWT6i4XXZP3blNDWD9gE4P
	 HBZnzVjpf+964c0m1gsJz512u75AQxj5sGo0kVtbsfwjz6xNJ/scm1p3BONbVF4ExA
	 K1tnbxCnRJlB0L9unW/GUHbyPmh79PM5kqNhJnIfBbfDsshHj4MN11rBcR3rT09vWo
	 iM+Y47HqeqnfA==
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1dc863efb61so1706093fac.0
        for <loongarch@lists.linux.dev>; Sat, 14 Oct 2023 01:42:01 -0700 (PDT)
X-Gm-Message-State: AOJu0Ywp8tqi57MqiZfT1elECD3F1i8j8to9ahBZcDpUZJOMOwkm+VAD
	/0kJ88WplzugA+3YK1VGqz4WDP4JWQt18vwATUw=
X-Google-Smtp-Source: AGHT+IEDHn8hDctpEgrOdAxDg4ZGS+fyZbcsCWC8+bRNQUrpKMWoTdaHrZNdtFPEOiGiKHQudHJYv6z04ih1iicSLkY=
X-Received: by 2002:a05:6870:7687:b0:1e9:d6c8:d031 with SMTP id
 dx7-20020a056870768700b001e9d6c8d031mr4746345oab.26.1697272921007; Sat, 14
 Oct 2023 01:42:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231009124210.1064021-1-masahiroy@kernel.org>
 <20231009124210.1064021-5-masahiroy@kernel.org> <20231009164424.GB1153868@dev-arch.thelio-3990X>
In-Reply-To: <20231009164424.GB1153868@dev-arch.thelio-3990X>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 14 Oct 2023 17:41:25 +0900
X-Gmail-Original-Message-ID: <CAK7LNASZ78NX13cfGiCeXGxB7A_2CasuAgNv-XzyWM79PD2NwA@mail.gmail.com>
Message-ID: <CAK7LNASZ78NX13cfGiCeXGxB7A_2CasuAgNv-XzyWM79PD2NwA@mail.gmail.com>
Subject: Re: [PATCH 5/5] kbuild: unify no-compiler-targets and no-sync-config-targets
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-um@lists.infradead.org, 
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org, x86@kernel.org, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 10, 2023 at 1:44=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Mon, Oct 09, 2023 at 09:42:10PM +0900, Masahiro Yamada wrote:
> > Now that vdso_install does not depend on any in-tree build artifact,
> > it no longer invokes a compiler, making no-compiler-targets the same
> > as no-sync-config-targets.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  Makefile | 13 +------------
> >  1 file changed, 1 insertion(+), 12 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 2170d56630e8..982b1ad33287 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -277,10 +277,6 @@ no-dot-config-targets :=3D $(clean-targets) \
> >                        $(version_h) headers headers_% archheaders archs=
cripts \
> >                        %asm-generic kernelversion %src-pkg dt_binding_c=
heck \
> >                        outputmakefile rustavailable rustfmt rustfmtchec=
k
> > -# Installation targets should not require compiler. Unfortunately, vds=
o_install
> > -# is an exception where build artifacts may be updated. This must be f=
ixed.
> > -no-compiler-targets :=3D $(no-dot-config-targets) install dtbs_install=
 \
> > -                     headers_install modules_install modules_sign kern=
elrelease image_name
> >  no-sync-config-targets :=3D $(no-dot-config-targets) %install modules_=
sign kernelrelease \
> >                         image_name
> >  single-targets :=3D %.a %.i %.ko %.lds %.ll %.lst %.mod %.o %.rsi %.s =
%.symtypes %/
> > @@ -288,7 +284,6 @@ single-targets :=3D %.a %.i %.ko %.lds %.ll %.lst %=
.mod %.o %.rsi %.s %.symtypes %
> >  config-build :=3D
> >  mixed-build  :=3D
> >  need-config  :=3D 1
> > -need-compiler        :=3D 1
> >  may-sync-config      :=3D 1
> >  single-build :=3D
> >
> > @@ -298,12 +293,6 @@ ifneq ($(filter $(no-dot-config-targets), $(MAKECM=
DGOALS)),)
> >       endif
> >  endif
> >
> > -ifneq ($(filter $(no-compiler-targets), $(MAKECMDGOALS)),)
> > -     ifeq ($(filter-out $(no-compiler-targets), $(MAKECMDGOALS)),)
> > -             need-compiler :=3D
> > -     endif
> > -endif
> > -
>
> MIPS and LoongArch seem to have grown a usage of need-compiler in
> 4fe4a6374c4d ("MIPS: Only fiddle with CHECKFLAGS if `need-compiler'")
> and 54c2c9df083f ("LoongArch: Only fiddle with CHECKFLAGS if
> `need-compiler'"). With this removal, should those be updated as well?


Right, but may-sync-config and need-compiler are not
interchangeable due to the following code.

ifneq ($(KBUILD_EXTMOD),)
        may-sync-config :=3D
endif


I will keep both.


--=20
Best Regards
Masahiro Yamada
