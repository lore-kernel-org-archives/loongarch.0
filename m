Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2F615DA
	for <loongarch@lists.linux.dev>; Tue,  6 Sep 2022 04:43:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2792CC43470
	for <loongarch@lists.linux.dev>; Tue,  6 Sep 2022 04:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662439426;
	bh=7TjMi3dv4P+rRVTd8H7v8fPFr0supL/24PBj+1I7I9w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mCbCXwVq8PHAqEhWIP6ZFLri2XK5qsy7UFTua2m6x4OUpu1VLX+GtqJ9BgJ4pSra8
	 fc7CgFSbwOrgzgoyKt1vSDc8+HbzTu5TyVDe2Dwly4uNjoHvTRHNNWXh2JzY3uqyN1
	 hs930Z7wQ3T/J4z3bUdr2xIsFQQFZjGsverBNNIZ8EQOmKhEWs3TvVeUGs/DxkMEuX
	 VB7JROZHpO7Fb02ysbVrVVcMuG1794iCX+V9JYaUCR8rZ5eoPe4K5v3dHtXzsvcnwR
	 ElKqKFOUBmebjITRKINIyIX0keocU1I8Fzb9cnOXDwOZ2yx3/aRBwxlJewLZl+Cs3N
	 1blTwqbrteT9A==
Received: by mail-vs1-f51.google.com with SMTP id d126so10486611vsd.13
        for <loongarch@lists.linux.dev>; Mon, 05 Sep 2022 21:43:46 -0700 (PDT)
X-Gm-Message-State: ACgBeo2/5ZDQW84A1IkGc93k5wq6+6y64VYXgwvg89d63lb8KBNvCeeI
	lnQLjWasmMPN09mK7V1eMDB1WhtW2cs4hcC04Bw=
X-Google-Smtp-Source: AA6agR6Kr7+uYVHAsYYqongz0QSxrPwjX1ypWs90w3dRCTH5JPTvX43l3dGfpFOXcIM1BNcr49ICcCq7yigmUTonaCQ=
X-Received: by 2002:a67:d49e:0:b0:390:dccf:23c8 with SMTP id
 g30-20020a67d49e000000b00390dccf23c8mr13262980vsj.59.1662439425056; Mon, 05
 Sep 2022 21:43:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220830104806.128365-1-xry111@xry111.site> <CAAhV-H5bH7xZTWLhqcZ_Bmh=RNaEVBy9523hmj-gTmitqqc8ag@mail.gmail.com>
 <c0ba2e23-5be3-924d-554a-2f10272c05bc@xen0n.name> <CAAhV-H7Dz21qRgwkMcJ0SnA9FNDN19E6mpa7C25LUitrO9LGeA@mail.gmail.com>
 <5b87173faeef587a2ffaaa6f58d34e0940231067.camel@xry111.site>
 <c53303bf-a5d2-098f-8975-efadbe0b2f2e@loongson.cn> <bc323d8578d2f6ec580066bab181788b305ae3c3.camel@xry111.site>
 <CAAhV-H4N_XvmP9KA1M5crU44kHr33MZUVSsMY4Ugu5wQSv_LOQ@mail.gmail.com>
 <97291c0fe5a660c844475ff019c8db6af77ecf86.camel@xry111.site>
 <CAAhV-H6wzw-MV+h225rM4PfK_HY0tAdSXcUG-2Hx+_gfhzQ4_g@mail.gmail.com>
 <ae2652c5e140d407d523d7f35bee672cebe1b7a2.camel@xry111.site>
 <CAAhV-H56TQeU54JjvNQg2qZ6L1aSbzbaM2a=VQr9ZcAn4uthyg@mail.gmail.com> <8d0f96e2977c5c78f17bb410087f2aad986ef5a4.camel@xry111.site>
In-Reply-To: <8d0f96e2977c5c78f17bb410087f2aad986ef5a4.camel@xry111.site>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 6 Sep 2022 12:43:34 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7LjkY+XAzGs2K3544+CGOztCd4V8BuSjMJwZCgfBLDow@mail.gmail.com>
Message-ID: <CAAhV-H7LjkY+XAzGs2K3544+CGOztCd4V8BuSjMJwZCgfBLDow@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] LoongArch: Support toolchain with new relocation types
To: Xi Ruoyao <xry111@xry111.site>, Ard Biesheuvel <ardb@kernel.org>
Cc: Jinyang He <hejinyang@loongson.cn>, WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>, Youling Tang <tangyouling@loongson.cn>
Content-Type: text/plain; charset="UTF-8"

Hi, Ruoyao,

On Tue, Sep 6, 2022 at 12:27 PM Xi Ruoyao <xry111@xry111.site> wrote:
>
> On Tue, 2022-09-06 at 09:52 +0800, Huacai Chen wrote:
> > >   cflags-$(CONFIG_LOONGARCH)     := $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) \
> > > -                                  -fpic
> > > +                                  -fpie
> > >
> > >   cflags-$(CONFIG_EFI_GENERIC_STUB) += -I$(srctree)/scripts/dtc/libfdt
> > >
> > > (Some explanation: -fpic does not only mean "generate position-
> > > independent code", but "generate position-independent code *suitable for
> > > use in a shared library*".  On LoongArch -mdirect-extern-access cannot
> > > work for a shared library so the "-fpic -mdirect-extern-access"
> > > combination is rejected deliberately.)
> > >
> > > Not sure how to submit these changes properly...  Do you prefer me to
> > > send V8 of this series or a single patch on top of your tree on GitHub?
>
> > Don't need V8, I will squash it into the previous patch myself. But
> > can we keep efistub as is?
>
> No, we can't allow -mdirect-extern-access -fpic on LoongArch because
> without copy relocation such a combination just does not make sense (i.
> e. we cannot find a sensible way to handle such a combination in GCC).
> So such a combination will cause GCC refuse to run.
>
> Note that -fpic/-fPIC is "position-independent code *suitable for
> use in a shared library*", while -fpie/-fPIE is more like just
> "position-independent code".  The names of those options are confusing.
> (When -fpic was invented first time, people mostly believed "PIC had
> been only for shared libraries", so it's named -fpic instead of -shlib
> or something.)  IMO in the EFI stub for other ports, -fpie should be
> used instead of -fpic as well because the EFI stub is not similar to a
> shared library in any means.
You are right, but I guess that Ard doesn't want to squash the efistub
change into the LoongArch efistub support patch. :)

Huacai
>
> --
> Xi Ruoyao <xry111@xry111.site>
> School of Aerospace Science and Technology, Xidian University
>
