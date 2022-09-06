Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83F417D1
	for <loongarch@lists.linux.dev>; Tue,  6 Sep 2022 05:57:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F06BC433D7
	for <loongarch@lists.linux.dev>; Tue,  6 Sep 2022 05:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662443863;
	bh=hQca5NtX2FBlPGk+GSQpzGG+VRJ3Z904jrv6Nzdt/3E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SFtooTkiyMSeuxJ7f1gN9skE0ZcbsMoAdEObqRVlAgE+qqRi8+Y7L0MkEdLz7yImw
	 DPpisMT4vQUEgLG3x7UMXLspTdF07jST7y2Q+YdRl9WmK5tEa/MtkH+ta9IKcA4Ufg
	 W+UdliA3eRypOxqgRsfxVSUhgjl5jLmVXNw6fsptfMbgUdYS/p484p7gwivWNQn9dX
	 RYqjSNNEQ89o6JQ9w06jSUhUHv7qwIca/JJAz4mSaUZGC4tN31EJrFuZXf/NTADuCT
	 muNViFtcn93xCWQ86S9Ixuzo0nofaDg1rWHwkY8GBuIK+dMHWHYflVChAbqxlf6Vih
	 3N5uKlAFWLm1g==
Received: by mail-ua1-f46.google.com with SMTP id p17so3221783uao.11
        for <loongarch@lists.linux.dev>; Mon, 05 Sep 2022 22:57:43 -0700 (PDT)
X-Gm-Message-State: ACgBeo0EJPScLSvW8WHJtYWMw/DCI6C+y01FKH6ehKc/jrTO6WSaXa4L
	TZPFe6FjPQ3Z/JorlYZ2rJJW1GJ6WtwFgf1GrBo=
X-Google-Smtp-Source: AA6agR7Qo1zXs+K6mR1O8A31AAZ4nJZysXhwJLbVHgukToP4OsQw3zKXMyPs74Vq8WWlLFPb/sc7svi8F6oSnwLSXzI=
X-Received: by 2002:ab0:d82:0:b0:39e:db4c:c80c with SMTP id
 i2-20020ab00d82000000b0039edb4cc80cmr15008458uak.22.1662443862305; Mon, 05
 Sep 2022 22:57:42 -0700 (PDT)
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
 <CAAhV-H56TQeU54JjvNQg2qZ6L1aSbzbaM2a=VQr9ZcAn4uthyg@mail.gmail.com>
 <8d0f96e2977c5c78f17bb410087f2aad986ef5a4.camel@xry111.site>
 <CAAhV-H7LjkY+XAzGs2K3544+CGOztCd4V8BuSjMJwZCgfBLDow@mail.gmail.com> <6a3e185eaaac4a1397abe43026004548d47ee305.camel@xry111.site>
In-Reply-To: <6a3e185eaaac4a1397abe43026004548d47ee305.camel@xry111.site>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 6 Sep 2022 13:57:31 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7wpyxeSDtBhxwRSJ+cenFkSRkvCLvajCXh6jwBB7JaQQ@mail.gmail.com>
Message-ID: <CAAhV-H7wpyxeSDtBhxwRSJ+cenFkSRkvCLvajCXh6jwBB7JaQQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] LoongArch: Support toolchain with new relocation types
To: Xi Ruoyao <xry111@xry111.site>
Cc: Ard Biesheuvel <ardb@kernel.org>, Jinyang He <hejinyang@loongson.cn>, 
	WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>, Youling Tang <tangyouling@loongson.cn>
Content-Type: text/plain; charset="UTF-8"

Hi, Ruoyao,

On Tue, Sep 6, 2022 at 1:01 PM Xi Ruoyao <xry111@xry111.site> wrote:
>
> On Tue, 2022-09-06 at 12:43 +0800, Huacai Chen wrote:
> > > Note that -fpic/-fPIC is "position-independent code *suitable for
> > > use in a shared library*", while -fpie/-fPIE is more like just
> > > "position-independent code".  The names of those options are confusing.
> > > (When -fpic was invented first time, people mostly believed "PIC had
> > > been only for shared libraries", so it's named -fpic instead of -shlib
> > > or something.)  IMO in the EFI stub for other ports, -fpie should be
> > > used instead of -fpic as well because the EFI stub is not similar to a
> > > shared library in any means.
>
> > You are right, but I guess that Ard doesn't want to squash the efistub
> > change into the LoongArch efistub support patch. :)
>
> It only changes cflags-$(CONFIG_LOONGARCH), which is LoongArch specific.
> And arm64 is also using -fpie.
>
> Should I send the one-line EFI stub change to linux-efi first?
I know that should be changed. I just don't like the one-line patch
and hope it can be squashed to the original patch. Of course Ard is
free to decide how to handle it.

Huacai
>
> --
> Xi Ruoyao <xry111@xry111.site>
> School of Aerospace Science and Technology, Xidian University
