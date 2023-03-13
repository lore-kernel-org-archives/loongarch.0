Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AAB2569
	for <loongarch@lists.linux.dev>; Mon, 13 Mar 2023 13:07:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E7EEC4339E
	for <loongarch@lists.linux.dev>; Mon, 13 Mar 2023 13:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678712865;
	bh=HQNgpcS/E6wh0rv49d4yGVux/Ba225VqGXhQ+VFGl9o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LHtZLT0P6F0Ed/uvaVFW38+oD16Sv0VtcInNsJ6tqoI7EGtFF7Df20U8hCo+KBlpX
	 FbKf2ZGZECrv0nw1ILhtdUBcp+H19zPWMBafJTHGK43TPpjgy392aKH+pFRIgb3Y61
	 brXzuiBWCcXtKcgCfTtnYnzX1xADqVc0rxIiXPsSJ/W2Qk4ikVOVU2EMWjJ7mzPhcA
	 WY4M2bAA4Lko1zp5vE8Rd2mzaDNyN3xhbFJ6Hxz+g8RVvN+w7/sEys2eSE62/I5kts
	 AC5N9V30sbRzlLOb3Z55JNqIH+Hs5cxwuEY+bTVg5CcNIdrVFA6WTvG+Ww4Dwn14nx
	 WVsUgu7Dq1LrA==
Received: by mail-ed1-f50.google.com with SMTP id x13so1164604edd.1
        for <loongarch@lists.linux.dev>; Mon, 13 Mar 2023 06:07:45 -0700 (PDT)
X-Gm-Message-State: AO0yUKVQnfSaPmspNUqdiQk71Eg55p5xel2IzGP777X1x4rWMpEceTof
	WDoiGar12SsMujmfVyfxUbrTFUo3YTPOFIkHdRQ=
X-Google-Smtp-Source: AK7set998oXNxg089u24M12TEznTs/T7QZKHRlg9BO1UjSJJpYrC34UZvy4i7HGHqWg3exK2buzVFnhLj3r0Ig+Ygg8=
X-Received: by 2002:a17:906:2546:b0:8d8:4578:18e0 with SMTP id
 j6-20020a170906254600b008d8457818e0mr17697817ejb.10.1678712863350; Mon, 13
 Mar 2023 06:07:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230224033017.15653-1-lienze@kylinos.cn> <35f61f336d390c0117270fc4b5a0f842dd459083.camel@kylinos.cn>
 <CAAhV-H5nFj8U_cp3o0Q41OhFZN+K809A=TbGbw0c=CpQnBCa0g@mail.gmail.com> <98fd597524d6a04bffab13c01dbcf0801d0a59ba.camel@kylinos.cn>
In-Reply-To: <98fd597524d6a04bffab13c01dbcf0801d0a59ba.camel@kylinos.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 13 Mar 2023 21:07:30 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4Kef8mQ3p=rwWhvhgVN7-zjfH8jeAeK_UsXgR0CMLo_w@mail.gmail.com>
Message-ID: <CAAhV-H4Kef8mQ3p=rwWhvhgVN7-zjfH8jeAeK_UsXgR0CMLo_w@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: use EXCCODE_INT_START instead of hard coded value
To: Enze Li <lienze@kylinos.cn>
Cc: kernel@xen0n.name, loongarch@lists.linux.dev, enze.li@gmx.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 13, 2023 at 5:18=E2=80=AFPM Enze Li <lienze@kylinos.cn> wrote:
>
> Hi Huacai,
>
> Thanks for your review :)
>
> On Mon, 2023-03-13 at 15:52 +0800, Huacai Chen wrote:
> > Though EXCCODE_INT_START is 64, its meaning is not suitable in this
> > case.
>
> Humm...Yeah.  Sharing the same macro may make things difficult to
> understand.
>
> What about defining a new macro to indicate this?  Something like
> EXCCODE_NOR_NUM or EXCCODE_EXC_NUM?
I prefer to keep it as original.


Huacai
>
> For a newcomer, thank you in advance for your patience.
>
> Thanks,
> Enze
>
> >
> > Huacai
> >
> > On Mon, Mar 13, 2023 at 12:42=E2=80=AFPM Enze Li <lienze@kylinos.cn> wr=
ote:
> > > Hi Huacai,
> > >
> > > Kindly PING for this tiny patch. :)
> > >
> > > Thanks,
> > > Enze
> > >
> > > On Fri, 2023-02-24 at 11:30 +0800, Enze Li wrote:
> > > > The for loop in per_cpu_trap_init function use a hard coded
> > > > length
> > > > while
> > > > setting default exception handler.  Use the proper define instead
> > > > of
> > > > hard coded value.
> > > >
> > > > Signed-off-by: Enze Li <lienze@kylinos.cn>
> > > > ---
> > > >  arch/loongarch/kernel/traps.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/arch/loongarch/kernel/traps.c
> > > > b/arch/loongarch/kernel/traps.c
> > > > index de8ebe20b666..7d5784eccf19 100644
> > > > --- a/arch/loongarch/kernel/traps.c
> > > > +++ b/arch/loongarch/kernel/traps.c
> > > > @@ -755,7 +755,7 @@ void per_cpu_trap_init(int cpu)
> > > >
> > > >       /* Initialise exception handlers */
> > > >       if (cpu =3D=3D 0)
> > > > -             for (i =3D 0; i < 64; i++)
> > > > +             for (i =3D 0; i < EXCCODE_INT_START; i++)
> > > >                       set_handler(i * VECSIZE, handle_reserved,
> > > > VECSIZE);
> > > >
> > > >       tlb_init(cpu);
> > > >
> > > > base-commit: 804f6d04b1adae9602edbd6410c0ba3a556964fe
>
>
