Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC307C;
	Sun, 25 Jun 2023 08:13:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F40B5C433CA;
	Sun, 25 Jun 2023 08:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687680825;
	bh=A6eLoSF/3c9MwdZ73/LDRUS0KBbUtVOgEQo1SNVN0vY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SMNiC13gJnhftwCGlx3d+/qnKa958AbLokVoVK7Bfl2io6pcfM2Oxevrpm6LPhaSN
	 YNVkINkYcks+8LGX7ytgTfOtAtsfyKIo2EA4POdffxfxoBX8nKW58NBkKzz6/lW1wX
	 zgcEApLiHK1xhmMXnm22aXj+KaepyyUrmwJaAlMp8AQZoTm9XVz+sRdAQCTxEn94O2
	 muel+R0184GpAYEKawpeC6shDbPC/5i6lH9wmx2e4X7AZCpYTrkRYqoCPeb64KEMDK
	 B8y3L6xjPHETTlvy/3nNXnMWqBeL7Dq9K26UXdN2aRa4Yu5aCDhfh4BC8ICmyAS7Yf
	 AMIL5G7LdqRFQ==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-51d8fa4dbf9so747934a12.1;
        Sun, 25 Jun 2023 01:13:44 -0700 (PDT)
X-Gm-Message-State: AC+VfDyAky9igI5/aONR3rib9gjVjcgHtXwPsA/diZWKAliZvi7z+P4s
	cgKC+A5RoiLZM6d7dpq2eZg++nNR5xF3fqLMQxk=
X-Google-Smtp-Source: ACHHUZ6tZAjsjOuGF42BTonLvZw/MNdZ/ki6HUzFD7w8sca/HlOnCwNTPffBK9UWiVacTzDdRe71RKDem/p0WWv0WTo=
X-Received: by 2002:a05:6402:1641:b0:51d:80a1:7b1e with SMTP id
 s1-20020a056402164100b0051d80a17b1emr1964597edx.9.1687680823171; Sun, 25 Jun
 2023 01:13:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230624184055.3000636-1-kernel@xen0n.name> <20230624184055.3000636-8-kernel@xen0n.name>
 <CAAhV-H54bZ5_OSXtcq3B3d4bZj4GBTOf7Z8aA6Jm7uGdKTj_ug@mail.gmail.com>
 <cc8c2f2d-b242-7488-3b5a-33828ee38b36@xen0n.name> <5154e8141e2b022b477f2d2658279e94f6b02149.camel@xry111.site>
 <12e9a417-e655-b85b-1213-231fd68b0977@xen0n.name>
In-Reply-To: <12e9a417-e655-b85b-1213-231fd68b0977@xen0n.name>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 25 Jun 2023 16:13:27 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5Xn51y4Vd1DgtVCRtkAAvVT5DtmQ7EZ+NwF2M9xRiRcw@mail.gmail.com>
Message-ID: <CAAhV-H5Xn51y4Vd1DgtVCRtkAAvVT5DtmQ7EZ+NwF2M9xRiRcw@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] LoongArch: Tweak CFLAGS for Clang compatibility
To: WANG Xuerui <kernel@xen0n.name>
Cc: Xi Ruoyao <xry111@xry111.site>, WANG Rui <wangrui@loongson.cn>, loongarch@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, WANG Xuerui <git@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 25, 2023 at 3:48=E2=80=AFPM WANG Xuerui <kernel@xen0n.name> wro=
te:
>
> On 2023/6/25 15:36, Xi Ruoyao wrote:
> > On Sun, 2023-06-25 at 15:16 +0800, WANG Xuerui wrote:
> >> On 2023/6/25 10:13, Huacai Chen wrote:
> >>> Hi, Ruoyao,
> >>>
> >>> On Sun, Jun 25, 2023 at 2:42=E2=80=AFAM WANG Xuerui <kernel@xen0n.nam=
e> wrote:
> >>>>
> >>>> From: WANG Xuerui <git@xen0n.name>
> >>>>
> >>>> Now the arch code is mostly ready for LLVM/Clang consumption, it is =
time
> >>>> to re-organize the CFLAGS a little to actually enable the LLVM build=
.
> >>>>
> >>>> In particular, -mexplicit-relocs and -mdirect-extern-access are not
> >>>> necessary nor supported on Clang; feature detection via cc-option wo=
uld
> >>>> not work, because that way the broken combo of "new GNU as + old GCC=
"
> >>>> would seem to get "fixed", but actually produce broken kernels.
> >>>> Explicitly depending on CONFIG_CC_IS_CLANG is thus necessary to not
> >>>> regress UX for those building their own kernels.
> >>>>
> >>>> A build with !RELOCATABLE && !MODULE is confirmed working within a Q=
EMU
> >>>> environment; support for the two features are currently blocked on
> >>>> LLVM/Clang, and will come later.
> >>>>
> >>>> Signed-off-by: WANG Xuerui <git@xen0n.name>
> >>>> ---
> >>>>    arch/loongarch/Makefile | 6 +++++-
> >>>>    1 file changed, 5 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
> >>>> index 366771016b99..82c619791a63 100644
> >>>> --- a/arch/loongarch/Makefile
> >>>> +++ b/arch/loongarch/Makefile
> >>>> @@ -51,7 +51,9 @@ LDFLAGS_vmlinux                       +=3D -static=
 -n -nostdlib
> >>>>
> >>>>    # When the assembler supports explicit relocation hint, we must u=
se it.
> >>>>    # GCC may have -mexplicit-relocs off by default if it was built w=
ith an old
> >>>> -# assembler, so we force it via an option.
> >>>> +# assembler, so we force it via an option. For LLVM/Clang the desir=
ed behavior
> >>>> +# is the default, and the flag is not supported, so don't pass it i=
f Clang is
> >>>> +# being used.
> >>>>    #
> >>>>    # When the assembler does not supports explicit relocation hint, =
we can't use
> >>>>    # it.  Disable it if the compiler supports it.
> >>>> @@ -61,8 +63,10 @@ LDFLAGS_vmlinux                      +=3D -static=
 -n -nostdlib
> >>>>    # combination of a "new" assembler and "old" compiler is not supp=
orted.  Either
> >>>>    # upgrade the compiler or downgrade the assembler.
> >>>>    ifdef CONFIG_AS_HAS_EXPLICIT_RELOCS
> >>>> +ifndef CONFIG_CC_IS_CLANG
> >>>>    cflags-y                       +=3D -mexplicit-relocs
> >>>>    KBUILD_CFLAGS_KERNEL           +=3D -mdirect-extern-access
> >>>> +endif
> >>> I prefer to drop CONFIG_CC_IS_CLANG and use
> >>> cflags-y                       +=3D $(call cc-option,-mexplicit-reloc=
s)
> >>> KBUILD_CFLAGS_KERNEL           +=3D $(call cc-option,-mdirect-extern-=
access)
> >>>
> >>> Then Patch-6 can be merged in this.
> >>>
> >>> What's your opinion?
> >>
> >> FYI: with this approach the build no longer instantly dies with binuti=
ls
> >> 2.40 + gcc 12.3, but there are also tons of warnings that say the mode=
l
> >> attribute is being ignored. I checked earlier discussions and this mea=
ns
> >> modules are silently broken at runtime, which is not particularly good=
 UX.
> >
> > We can add
> >
> > #if defined(MODULE) && !__has_attribute(model)
> > #  error some fancy error message
> > #endif
> >
> > into percpu.h to error out in this case.  It had been in my earlier
> > drafts of explicit relocs patches, but we dropped it because there was
> > no such configuration (unless a snapshot of development GCC is used, an=
d
> > using such a snapshot is never supported IIUC).
>
> Ah I've seen that. So in this case we simply wrap -mexplicit-relocs with
> cc-option and error out in case of CONFIG_MODULE but no model attribute,
> which nicely prevents broken configurations (MODULE && ((old_gcc &&
> new_binutils) || clang)) with feature detection alone.
>
> This seems elegant and better to me; Huacai, WDYT?
OK, perfect.

Huacai
>
> --
> WANG "xen0n" Xuerui
>
> Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/
>
