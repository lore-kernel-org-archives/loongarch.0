Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBF32FD7BD
	for <loongarch@lists.linux.dev>; Wed, 19 Nov 2025 04:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763526519; cv=none; b=eEYBI3KdNzfa9M8HBw2wxG/NMF+TEniyeqKyGc3BvHnCG6CaLRbOY6jE7qLOJgo7YuZ9cmDBPdOdL6dQtqpTNTuA9Bp5tsCx7rpD/BSX71lXM5fYmIkS2qKVlGHpaZY5nwquFRmhylf+nbKshuwoHjb7lj4dkClbmEmzfeDSGu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763526519; c=relaxed/simple;
	bh=20yE8xmrCxVj0HrYnRHPetvSNta/9P+r724P2CoUT8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aaCV+W4J5lZZ+prExuH+9UG/uS1Q6sDfSl28KN1Rh4Kjps3cgtIYyPCJmxi87qX8he77nwlXsSA456X+w1mBF9rnqlaM37kvbaj9LrfZAjlG9QKK8BiHTeSc5g5rfJnsc6iRbzYbWHrd3eOvpqkSBwa/lUfAM/Zn+D1i/oejieU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eBPcFOQO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eBPcFOQO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EF65C2BCB4
	for <loongarch@lists.linux.dev>; Wed, 19 Nov 2025 04:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763526518;
	bh=20yE8xmrCxVj0HrYnRHPetvSNta/9P+r724P2CoUT8E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eBPcFOQObY6HKbBH9Auur0DYI/JH8481vt80z7E8X9PiAsAgxFcxeQFqBlsLLtv3F
	 99LlN8u/9qwIy7DjDcbBGozMYRSsIWmZOsh1OmTbgGMgVotKfHhZUwPdg3O1W9r61u
	 l7bzoQeL7K+f8nAAXVn6GXs70aRYd2f5mc2unG36Tf4m9qu9/QFDWfebfRvFzcrxJ8
	 /ikLcf4pR8K0VFePmUO4FilVXQwEIDtQYoVg6Hdjh/Z+EiZoQGMsz2qDTl3Yq6py5t
	 ulPzfNANNOUjKTmchlwIrow0m1DeEKoJvNjRg6aFdEmrItALb2xrrpHZgP2eEWSPXh
	 /W+GX/LTr2gKg==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b7636c96b9aso54959566b.2
        for <loongarch@lists.linux.dev>; Tue, 18 Nov 2025 20:28:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWcyrsdrOeitrNZlczIhAr3hY3oe/6rYaYtmKhLybRV+0leUM7HyZdQTaqLbrCiXF6tS/0E8EpfusA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyBF5yMRCLWOOyMgsL7HIV0Z6U5T/ICkt+A/VFR5ls3fQ3PLlyx
	hsrWtsHMc+1joHiBVzcWWMd5ry1TxpwBmXjz4LPUirk5lMVFI3EdKzOec9KXDcoIYM7bfRcvpEE
	7QURh8iBf27oe6Y6pefUhh75qELyvRzM=
X-Google-Smtp-Source: AGHT+IGbWywcXwPsVFpJurJ5GAZ0bygPjNfZNq8uY4NQtMfmy5NOh6gv+cE5A/pgHpI4GEGww35ib53dEJCVASGJLdQ=
X-Received: by 2002:a17:907:96a8:b0:b73:9280:2e7 with SMTP id
 a640c23a62f3a-b739280114dmr1154628566b.34.1763526514307; Tue, 18 Nov 2025
 20:28:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251118112728.571869-1-chenhuacai@loongson.cn>
 <20251118112728.571869-5-chenhuacai@loongson.cn> <aRyoLBjD_8Hz91DV@pie>
In-Reply-To: <aRyoLBjD_8Hz91DV@pie>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 19 Nov 2025 12:28:36 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5uoDjBRYpK_e7Z+vrcqLAbLXhEbEQP_aJ9f3aTdA+-eQ@mail.gmail.com>
X-Gm-Features: AWmQ_bkAxEgaL09SmaycStpQZWVNv5BLUeJhpEXHn5nZFiBjratzLwjaG9XQB3s
Message-ID: <CAAhV-H5uoDjBRYpK_e7Z+vrcqLAbLXhEbEQP_aJ9f3aTdA+-eQ@mail.gmail.com>
Subject: Re: [PATCH V2 04/14] LoongArch: Adjust boot & setup for 32BIT/64BIT
To: Yao Zi <ziyao@disroot.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Arnd Bergmann <arnd@arndb.de>, f@disroot.org, 
	loongarch@lists.linux.dev, linux-arch@vger.kernel.org, 
	Xuefeng Li <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 1:09=E2=80=AFAM Yao Zi <ziyao@disroot.org> wrote:
>
> On Tue, Nov 18, 2025 at 07:27:18PM +0800, Huacai Chen wrote:
> > Adjust boot & setup for both 32BIT and 64BIT, including: efi header
> > definition, MAX_IO_PICS definition, kernel entry and environment setup
> > routines, etc.
> >
> > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > ---
> >  arch/loongarch/include/asm/addrspace.h |  2 +-
> >  arch/loongarch/include/asm/irq.h       |  5 ++++
> >  arch/loongarch/kernel/efi-header.S     |  4 +++
> >  arch/loongarch/kernel/efi.c            |  4 ++-
> >  arch/loongarch/kernel/env.c            |  9 ++++--
> >  arch/loongarch/kernel/head.S           | 39 +++++++++++---------------
> >  arch/loongarch/kernel/relocate.c       |  9 +++++-
> >  7 files changed, 45 insertions(+), 27 deletions(-)
> >
>
> ...
>
> > diff --git a/arch/loongarch/kernel/env.c b/arch/loongarch/kernel/env.c
> > index 23bd5ae2212c..3e8a25eb901b 100644
> > --- a/arch/loongarch/kernel/env.c
> > +++ b/arch/loongarch/kernel/env.c
> > @@ -68,18 +68,23 @@ static int __init fdt_cpu_clk_init(void)
> >
> >       np =3D of_get_cpu_node(0, NULL);
> >       if (!np)
> > -             return -ENODEV;
> > +             goto fallback;
> >
> >       clk =3D of_clk_get(np, 0);
> >       of_node_put(np);
> >
> >       if (IS_ERR(clk))
> > -             return -ENODEV;
> > +             goto fallback;
> >
> >       cpu_clock_freq =3D clk_get_rate(clk);
> >       clk_put(clk);
> >
> >       return 0;
> > +
> > +fallback:
> > +     cpu_clock_freq =3D 200 * 1000 * 1000;
>
> Why pick 200MHz here? And shouldn't the clock being always provided in
> devicetree if it's necessary for kernel to function?
>
> Per the schema for LoongArch CPUs (loongarch/cpus.yaml), "clocks"
> property is also described as mandantory, thus I don't think such
> fallback makes sense.
Yes, "clocks" is mandatory in theory, but sometimes is missing in
practice, at least in QEMU. On the other hand, if "clocks" really
always exist, then the error checking in fdt_cpu_clk_init() can also
be removed. So the fallback makes sense.

Why pick 200MHz? That is because we assume the constant timer is
100MHz (which is true for all real machines), 200MHz is the minimal
multiple of 100MHz, it is more reasonable than 0MHz.

Huacai
>
> > +
> > +     return -ENODEV;
> >  }
> >  late_initcall(fdt_cpu_clk_init);
>
> Best regards,
> Yao Zi
>
