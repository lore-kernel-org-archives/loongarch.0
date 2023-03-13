Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FA72569
	for <loongarch@lists.linux.dev>; Mon, 13 Mar 2023 13:04:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87B44C4339B
	for <loongarch@lists.linux.dev>; Mon, 13 Mar 2023 13:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678712681;
	bh=/vucZP2mPMlyumcebZ63XE2amBMJ1xmLp4/RTyYx/V4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tVYutPcJeIBuE9d1diSY4e106xtwcXBXIDj0VVjj0yVzQhOhJo1wHUkhznz1xDSS1
	 Vy6nc3XfhHW1xH5IjgksLGHY72anafImyKIYDeJhbyty8L8BUQvV9IxoHhw5x/GMxL
	 GQKatol787V1qijn6tndzGyC85cwC/q8O4xNTHkPHBgdnn9eoghZYN687ETG8t+BhW
	 dcvazf0AEDWzmhNRi5eQ2ZFHpEbSJwhEJ0ZWXy7Lcwu8/B+Bz4I49YSt0akjJzeP+i
	 o6sFBZhGREC6xZC7tEsBsBJyJ1ww63dEs8+OZnIxPei7EkvZJr/BqADbdEPZMqy3Qg
	 4Eor6vR8MJRug==
Received: by mail-ed1-f49.google.com with SMTP id o12so48404667edb.9
        for <loongarch@lists.linux.dev>; Mon, 13 Mar 2023 06:04:41 -0700 (PDT)
X-Gm-Message-State: AO0yUKXuXKg82iR1MsTSCaNDuYh5RCmUs9Kqf58KlvsRikqLycR+hw/d
	0ph2uEpbzREQT5saS1oGtGbf5eDgFLHN70BdPBQ=
X-Google-Smtp-Source: AK7set+aJeCjQtASvuc4EZBXMVvJjIlJGUuQLf3YS2V04aF3+wW8e93YAMhhKb/HYNKjGN5kPj5ah7OttgULV4i+Xgc=
X-Received: by 2002:a50:8e5d:0:b0:4fc:6494:81c3 with SMTP id
 29-20020a508e5d000000b004fc649481c3mr1698511edx.1.1678712679792; Mon, 13 Mar
 2023 06:04:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230313081432.3769496-1-ardb@kernel.org> <CAMj1kXFBB9DK_zNL2h2=5-8P+VzOO=K1SgJ+07C55zbZoMHRLw@mail.gmail.com>
 <CAMj1kXGFb+0-e_t+LeRSJzqweU=SL98cfFnem625PGjjuGCv0A@mail.gmail.com>
In-Reply-To: <CAMj1kXGFb+0-e_t+LeRSJzqweU=SL98cfFnem625PGjjuGCv0A@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 13 Mar 2023 21:04:28 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5T2iVbyUiifDG-pKHisr0HYX=tw=xDHEOn5n0Yo41eoA@mail.gmail.com>
Message-ID: <CAAhV-H5T2iVbyUiifDG-pKHisr0HYX=tw=xDHEOn5n0Yo41eoA@mail.gmail.com>
Subject: Re: [PATCH] efi: libstub: Use relocated version of kernel's struct screen_info
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-efi@vger.kernel.org, loongarch@lists.linux.dev, 
	Xuefeng Li <lixuefeng@loongson.cn>, Xuerui Wang <kernel@xen0n.name>, 
	loongson-kernel@lists.loongnix.cn, Huacai Chen <chenhuacai@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Ard,

On Mon, Mar 13, 2023 at 6:00=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> wr=
ote:
>
> On Mon, 13 Mar 2023 at 09:48, Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > On Mon, 13 Mar 2023 at 09:14, Ard Biesheuvel <ardb@kernel.org> wrote:
> > >
> > > In some cases, we expose the kernel's struct screen_info to the EFI s=
tub
> > > directly, so it gets populated before even entering the kernel.  This
> > > means the early console is available as soon as the early param parsi=
ng
> > > happens, which is nice. It also means we need two different ways to p=
ass
> > > this information, as this trick only works if the EFI stub is baked i=
nto
> > > the core kernel image, which is not always the case.
> > >
> > > Huacai reports that the preparatory refactoring that was needed to
> > > implement this alternative method for zboot resulted in a non-functio=
nal
> > > efifb earlycon for other cases as well, due to the reordering of the
> > > kernel image relocation with the population of the screen_info struct=
,
> > > and the latter now takes place after copying the image to its new
> > > location, which means we copy the old, uninitialized state.
> > >
> > > So let's ensure that alloc_screen_info() produces the correct
> > > screen_info pointer, by keeping its relocated address in a global
> > > variable.
> > >
> > > Cc: loongarch@lists.linux.dev
> > > Cc: Xuefeng Li <lixuefeng@loongson.cn>
> > > Cc: Xuerui Wang <kernel@xen0n.name>
> > > Cc: loongson-kernel@lists.loongnix.cn
> > > Reported-by: Huacai Chen <chenhuacai@loongson.cn>
> > > Link: https://lore.kernel.org/linux-efi/20230310021749.921041-1-chenh=
uacai@loongson.cn/
> > > Fixes: 42c8ea3dca094ab8 ("efi: libstub: Factor out EFI stub entrypoin=
t into separate file")
> > > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> >
> > This is still not working :-(
> >
>
> Huacai, could you try this patch please? It is working now - I don't
> know what I did wrong before when testing it.
I've tested, it works for me.

Tested-by: Huacai Chen <chenhuacai@loongson.cn>

But I think my original patch is also OK, unless screen_info is needed
by zboot (but the earliest zboot doesn't need it).

Huacai
>
