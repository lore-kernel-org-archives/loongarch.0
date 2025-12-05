Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE5414A60F
	for <loongarch@lists.linux.dev>; Fri,  5 Dec 2025 07:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764918972; cv=none; b=PK10+apheob9yN8L8ifp5brbkE8ZqR+xXnE8EUXTXmIg7jzhLAmV1il2mXAQ8/0u28/VUAvzVxMzos2ShIykeOz0kKm+BqyAfwMIBWVXJrbS3w44TsPnOqkgahxqEJBfFrb1Ju+y65g9ue+6YXkx8B39OrN1uSHXSOf4qZRGfmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764918972; c=relaxed/simple;
	bh=GTCOBq6IOnzq5vDEI9ht6TcYWVLabop9ATvb1iw/qbY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n9MY74hXvrkyVytcyopLKtRe3Pek2l/m2Tw1MfuBgEhz9yhxhGY0qagY27fyd5nueOCxrSRO2EcCc4MwGv39PTyppo+udT5HKupzA6HdTL5aZyu1mZefZ7lYZ/oAPFu+zM1AME4QYEunERwI1FtBHEe6xoiunsSbYZXqDB2lYZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fDCmwnnG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fDCmwnnG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 561BEC16AAE
	for <loongarch@lists.linux.dev>; Fri,  5 Dec 2025 07:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764918972;
	bh=GTCOBq6IOnzq5vDEI9ht6TcYWVLabop9ATvb1iw/qbY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fDCmwnnGz8T2IpT3yjDGG0sxktGU4k0sYqWD4wYVpGJ9u6U2vfPIu/1n5JIvCpPQE
	 bwi3tL3cr/WKs5XaQyHp4in59FYP5KaCWywWOpgGNm4fi9HXziVqFnVt71FxhapNKR
	 N1f1KNK+dxNqO2pg9KSEd2bPRJz7ULQlD/rbbJO22qPDjCaTZjxQnd5R73/SU41W3S
	 KAJbnqqHN5rrkqpOgD9+H8XDCWmnLWQkr1TxWDgM/VnDhJhLytTRlLbUrwI8zkaSbT
	 dCfLbMl2mWTZkTekAGNgjzb0HAPZU9TDx7NLpbYKdo4ijGrIZFebcs3oos3yjKNmVb
	 TGZ6JyRcRaZHw==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-64166a57f3bso2822839a12.1
        for <loongarch@lists.linux.dev>; Thu, 04 Dec 2025 23:16:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUUuDmTkOMoUoXblk73e6qZnKsmBByfoLA9l2dVLTXn7gzHB0+djkVc1hc6tL4nfIaKHkgqR5H69kI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxvIi5N26b1LUsx6ZLdGODe5OaaQgAs4KfLCKEkJjE1seAF3s4n
	1j+c+oTaoSd/VNrEuGcasN027CDeB/NZXF83mftQVabbGAngUOoE94xgNCoaMukCvUPA7tCKeCU
	kEG9c4ORxFWhyEOutiVkgOaw4c6d/y6g=
X-Google-Smtp-Source: AGHT+IE87PUXBgUOQQQn845iw2eaLAU0gjeQCRoHLEEOpqlAKmPcxR/d1whACknD+KrUT+s2i+GUg/7yEx+6Caz801Q=
X-Received: by 2002:a17:907:7e9c:b0:b0e:d477:4972 with SMTP id
 a640c23a62f3a-b79ec486c21mr588862666b.25.1764918970315; Thu, 04 Dec 2025
 23:16:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251124055642.1591-1-hengqi.chen@gmail.com> <CAAhV-H6rrpgBF+bMpEvsJyq0F7sdWisGSwTbuf=ZBhi4XD-5jw@mail.gmail.com>
 <CAEyhmHSntgSQdAOksd6YUsHh0UXJS7XMmSHAZmRDQ5uEzDU0JQ@mail.gmail.com>
 <CAAhV-H5Vab3bwgT2LdGyNB4ipzhnS+JW7PdcOSmNm4JZ30tWTg@mail.gmail.com>
 <fc62bac6-b212-3aed-1536-aee8a60d2f0a@loongson.cn> <CAEyhmHQO9bDP7L=cwxLUbQCrkFfcDaSeKMgB5R32sqMgvJk7ng@mail.gmail.com>
 <CAEyhmHTUToX3qedYVS7v3LP84f3LiW9NbrH-nzxEqEdWAkhFmw@mail.gmail.com>
In-Reply-To: <CAEyhmHTUToX3qedYVS7v3LP84f3LiW9NbrH-nzxEqEdWAkhFmw@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 5 Dec 2025 15:16:17 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7+ORpvG-73OaprbH2HiHzF-HUepVxGLsJb9rJXzg3gPA@mail.gmail.com>
X-Gm-Features: AWmQ_bm-PtcERW06C9R8x5vs5KJvd_mif6Izj_uYzQlsObo9qMBUHCnLuEh1QIs
Message-ID: <CAAhV-H7+ORpvG-73OaprbH2HiHzF-HUepVxGLsJb9rJXzg3gPA@mail.gmail.com>
Subject: Re: [PATCH 0/5] LoongArch: BPF features and fixes
To: Hengqi Chen <hengqi.chen@gmail.com>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, vincent.mc.li@gmail.com, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 5, 2025 at 3:04=E2=80=AFPM Hengqi Chen <hengqi.chen@gmail.com> =
wrote:
>
> Hi Huacai,
>
> Will you pick this series for 6.19 ?
I tend to not pick it, because it is a little hurried.

Huacai

>
> Thanks.
>
> On Fri, Nov 28, 2025 at 9:37=E2=80=AFAM Hengqi Chen <hengqi.chen@gmail.co=
m> wrote:
> >
> > On Thu, Nov 27, 2025 at 3:30=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongso=
n.cn> wrote:
> > >
> > > On 2025/11/27 =E4=B8=8B=E5=8D=882:44, Huacai Chen wrote:
> > > > Hi, Tiezhu,
> > > >
> > > > On Mon, Nov 24, 2025 at 3:49=E2=80=AFPM Hengqi Chen <hengqi.chen@gm=
ail.com> wrote:
> > > >>
> > > >> On Mon, Nov 24, 2025 at 2:31=E2=80=AFPM Huacai Chen <chenhuacai@ke=
rnel.org> wrote:
> > > >>>
> > > >>> Hi, Hengqi,
> > > >>>
> > > >>> I think this is the successor of
> > > >>> https://lore.kernel.org/loongarch/20251006053323.193581-1-hengqi.=
chen@gmail.com/T/#t
> > > >>>
> > > >>> Right?
> > > >>>
> > > >>
> > > >> Right, sorry for the long delay.
> > > > Could you please help to review this series?
> > >
> > > I trust Hengqi and I am OK with this series in general with
> > > a quick look.
> > >
> > > For the two functions sign_extend() and emit_abi_ext(), I
> > > have no strong opinion, I do not want to respin the patch
> > > since the merge window is coming soon, it does not affect
> > > the correctness, so we can refine the code later if there
> > > is a better way.
> > >
> > > Acked-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> > >
> >
> > Thanks.
> >
> > > Thanks,
> > > Tiezhu
> > >
