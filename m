Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135E52FE569
	for <loongarch@lists.linux.dev>; Sat, 20 Sep 2025 11:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758368483; cv=none; b=d+1WsEBPYdz+pcFaOH4q2J/8CPLum6fkXpjFO4Mjc9hT6cbGpkOJUei4XypM8EEH5tNfFZC285kEy9/xGS2iI1bL4KXwNTRuYoTH7Ru/vlfXO925j9ynblIuJPbgEhPO4aLSAPpU9J38Flk0qQrYoRMNTXo8bkoD7vku3iD2xAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758368483; c=relaxed/simple;
	bh=wRo0YLaw8DyQub6BzFo7m0B5qda32As3YYQaoqnwGqk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=geR8euKGq9xJD8od9Y5gpnsV1QK1a1fBzOa9OIP/cyz8rrBCDKp5oJFRFy3OBeFHO+21sMdRRwzWGRBjI7Hsz6ksaG7MOoapMqZyyNTtSFKg82ylfjVdtRHab6MQQZEdam78XqBEukccqZTOmRAaUCkhw1hxdZ3wPKsoRaa8FFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ebc8MOl+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ebc8MOl+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1C2FC4CEF9
	for <loongarch@lists.linux.dev>; Sat, 20 Sep 2025 11:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758368481;
	bh=wRo0YLaw8DyQub6BzFo7m0B5qda32As3YYQaoqnwGqk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ebc8MOl+638fSEA1140g2IwWvkI9ocgbx/kWrkH60pjBxdMdicLF80Le7mbsGgui2
	 RB9UOt9n4AViq/s/ch+oLe2rNEOaw7JHwMGb+tvIAP5mgQXLC0ARszp/sBGj+xmUY4
	 fgocDZsvKRHb9poTJySROUb/UJ7GKmpYjjUNM+2W9pjyUIUijViJ/ENgITMMe7ZzJp
	 RTPKoszzb+1jIB+yBZoHGXtfA7l+WdsvUDUAjA6T3/UQZcTVDTHrFLj2qPU4/iuGkJ
	 EDLeXzGgTTKwhYPU9g6wmxCFFWNbV1s1xbX3CF5wCt/sQ9ZrQaS9mdpVNEUD+wWc84
	 /xqliJigs8EUw==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b042cc3954fso501332066b.0
        for <loongarch@lists.linux.dev>; Sat, 20 Sep 2025 04:41:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUKIM8H626gnRKHvFeom5mF15WvS/xXa6brT/IFxaVhvdZ0+BRm7nSa2+fYrFo8owJinGURpo8Vdrg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwNaFxcFRoDXOgueF+2hOXCD3rBSL6tAZI6IUbqknsS50NxJUXQ
	WZB8aFSCT9shWYgIkDXm/4GsYM/WPC5VYxJ4OMJMCHwU31dghm+sDeRZ/Al9tJMUdtXMcM/wuqp
	Hwa+JZJfzYXPSiHS0BhwWHvNWKGlXZSE=
X-Google-Smtp-Source: AGHT+IFZzHAyQ1PhqneBePuVKq1gxKghmUHATguF6ZPm4CtfFp3f4mVb6XLErzMCUoIWIkpOEn0J/WcwRy7at4Yq6iI=
X-Received: by 2002:a17:907:7292:b0:afe:a83a:87ce with SMTP id
 a640c23a62f3a-b24ee6ef584mr767720966b.2.1758368479046; Sat, 20 Sep 2025
 04:41:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250909092707.3127-1-yangtiezhu@loongson.cn> <20250909092707.3127-2-yangtiezhu@loongson.cn>
 <20250920061536.GA1460394@ax162> <CAAhV-H5=w82CDx=1=PZjf4FVW_dGWe_e__QazwDTwE3kKXtPLQ@mail.gmail.com>
 <c9c4c0e6-946d-95de-9c03-a4b8e1636b81@loongson.cn> <7eafa4a6-55bf-2fcb-19ef-b18bd51bfd39@loongson.cn>
In-Reply-To: <7eafa4a6-55bf-2fcb-19ef-b18bd51bfd39@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 20 Sep 2025 19:41:03 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4xx-C28-a8H7yJTK30+r90zL9XTSAb87Jr4zLc5ShBoA@mail.gmail.com>
X-Gm-Features: AS18NWDT4qeGtVwPk4bf2a0_rM3HNkQd7evhHdSpldq9OK81OM-K1U_xJkU-KhY
Message-ID: <CAAhV-H4xx-C28-a8H7yJTK30+r90zL9XTSAb87Jr4zLc5ShBoA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] LoongArch: Make LTO case independent in Makefile
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, WANG Rui <wangrui@loongson.cn>, 
	rust-for-linux@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 20, 2025 at 6:22=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> On 9/20/25 17:19, Tiezhu Yang wrote:
> > On 9/20/25 16:23, Huacai Chen wrote:
> >> On Sat, Sep 20, 2025 at 2:15=E2=80=AFPM Nathan Chancellor <nathan@kern=
el.org>
> >> wrote:
> >>>
> >>> Hi Tiezhu,
> >>>
> >>> On Tue, Sep 09, 2025 at 05:27:06PM +0800, Tiezhu Yang wrote:
> >>>> LTO is not only used for Clang, it maybe used for Rust, make LTO
> >>>> case out
> >>>> of CONFIG_CC_HAS_ANNOTATE_TABLEJUMP in Makefile.
> >>>>
> >>>> This is preparation for later patch, no function changes.
> >>>>
> >>>> Suggested-by: WANG Rui <wangrui@loongson.cn>
> >>>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> >>>> ---
> >>>>   arch/loongarch/Makefile | 10 +++++-----
> >>>>   1 file changed, 5 insertions(+), 5 deletions(-)
> >>>>
> >>>> diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
> >>>> index a3a9759414f4..9d80af7f75c8 100644
> >>>> --- a/arch/loongarch/Makefile
> >>>> +++ b/arch/loongarch/Makefile
> >>>> @@ -102,16 +102,16 @@ KBUILD_CFLAGS                   +=3D $(call
> >>>> cc-option,-mthin-add-sub) $(call cc-option,-Wa$(comma)
> >>>>
> >>>>   ifdef CONFIG_OBJTOOL
> >>>>   ifdef CONFIG_CC_HAS_ANNOTATE_TABLEJUMP
> >>>> +KBUILD_CFLAGS                        +=3D -mannotate-tablejump
> >>>> +else
> >>>> +KBUILD_CFLAGS                        +=3D -fno-jump-tables # keep
> >>>> compatibility with older compilers
> >>>> +endif
> >>>> +ifdef CONFIG_LTO_CLANG
> >>>>   # The annotate-tablejump option can not be passed to LLVM backend
> >>>> when LTO is enabled.
> >>>>   # Ensure it is aware of linker with LTO,
> >>>> '--loongarch-annotate-tablejump' also needs to
> >>>>   # be passed via '-mllvm' to ld.lld.
> >>>> -KBUILD_CFLAGS                        +=3D -mannotate-tablejump
> >>>> -ifdef CONFIG_LTO_CLANG
> >>>>   KBUILD_LDFLAGS                       +=3D -mllvm
> >>>> --loongarch-annotate-tablejump
> >>>>   endif
> >>>> -else
> >>>> -KBUILD_CFLAGS                        +=3D -fno-jump-tables # keep
> >>>> compatibility with older compilers
> >>>> -endif
> >>>>   endif
> >>>>
> >>>>   KBUILD_RUSTFLAGS             +=3D
> >>>> --target=3Dloongarch64-unknown-none-softfloat -Ccode-model=3Dsmall
> >>>> --
> >>>> 2.42.0
> >>>>
> >>>
> >>> This change is now in -next as commit b15212824a01 ("LoongArch: Make =
LTO
> >>> case independent in Makefile"), where it breaks the build for clang-1=
8,
> >>> as '--loongarch-annotate-tablejump' is unimplemented there but there =
is
> >>> no version check before using it.
> >>>
> >>>    $ make -skj"$(nproc)" ARCH=3Dloongarch LLVM=3D1 mrproper defconfig
> >>>
> >>>    $ scripts/config -d LTO_NONE -e LTO_CLANG_THIN
> >>>
> >>>    $ make -skj"$(nproc)" ARCH=3Dloongarch LLVM=3D1 olddefconfig vmlin=
uz.efi
> >>>    ld.lld: error: -mllvm: ld.lld: Unknown command line argument
> >>> '--loongarch-annotate-tablejump'.
> >>>    ...
> >>>
> >>>    $ scripts/config -s CC_HAS_ANNOTATE_TABLEJUMP
> >>>    undef
> >> Hmm, maybe we need this?
> >> diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
> >> index ae419e32f22e..fcfa793f9bb0 100644
> >> --- a/arch/loongarch/Makefile
> >> +++ b/arch/loongarch/Makefile
> >> @@ -115,7 +115,7 @@ ifdef CONFIG_LTO_CLANG
> >>   # The annotate-tablejump option can not be passed to LLVM backend
> >> when LTO is enabled.
> >>   # Ensure it is aware of linker with LTO,
> >> '--loongarch-annotate-tablejump' also needs to
> >>   # be passed via '-mllvm' to ld.lld.
> >> -KBUILD_LDFLAGS                 +=3D -mllvm
> >> --loongarch-annotate-tablejump
> >> +KBUILD_LDFLAGS                 +=3D $(call ld-option,-mllvm
> >> --loongarch-annotate-tablejump)
> >>   endif
> >>   endif
> >
> > We need to handle the other case to use -fno-jump-tables if llvm does
> > not support -loongarch-annotate-tablejump.
> >
> > So, it is better to update the minimal version of llvm to 20, which
> > includes the following two important commits:
> >
> > [LoongArch] Add options for annotate tablejump
> > https://github.com/llvm/llvm-project/commit/4c2c17756739
> >
> > [LoongArch] Avoid indirect branch jumps using the ra register
> > https://github.com/llvm/llvm-project/commit/21ef17c62645
> >
> > If you are OK, I will send a patch to modify the following file:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/scripts/min-tool-version.sh#n29
> >
> >
> > and keep arch/loongarch/Makefile as is.
>
> The other way is to keep scripts/min-tool-version.sh as is, and only
> modify arch/loongarch/Makefile, something like this (not tested):
>
> config LLD_HAS_ANNOTATE_TABLEJUMP
>         def_bool LLD_VERSION >=3D 200000
>
> ifdef CONFIG_LTO_CLANG
> ifdef CONFIG_LLD_HAS_ANNOTATE_TABLEJUMP
> KBUILD_LDFLAGS                  +=3D -mllvm --loongarch-annotate-tablejum=
p
> else
> KBUILD_LDFLAGS                  +=3D -mllvm --no-jump-tables
> endif
So complicated?

I think below is enough, no?
ifdef CONFIG_LTO_CLANG
# The annotate-tablejump option can not be passed to LLVM backend when
LTO is enabled.
# Ensure it is aware of linker with LTO,
'--loongarch-annotate-tablejump' also needs to
# be passed via '-mllvm' to ld.lld.
KBUILD_LDFLAGS                  +=3D $(call ld-option,-mllvm
--loongarch-annotate-tablejump,-mllvm --no-jump-tables)
endif

Huacai
>
> Update the minimal llvm version or change Makefile to compat various
> llvm versions, which one do you prefer? Pease let me know.
>
> Thanks,
> Tiezhu
>
