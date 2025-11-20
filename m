Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46486301716
	for <loongarch@lists.linux.dev>; Thu, 20 Nov 2025 12:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763640255; cv=none; b=mysprmcLjDIrEeAjddFBtXjvMsoQ10u79P6VnrXHZhebOfjEEDPnHhKvMpLxJrhG+d5jyIjS8IXhSTW3O+vUK9HehlLdF8u+NZWbvRYVj5IW4Pzzfa3pLVp6vGYItLVR7o3PwtjiVD5O97nCtLHk0uS3BOUovzXeVXB2igcCPTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763640255; c=relaxed/simple;
	bh=TvKuNxF8KVzTcJOUyKqukheXPBn2wF0Qdt9k4a0yJ1k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uswNhgn4WJs8USeYS2gpkSNMY0f/8RR+BBmdw3drFUde2H/zzaZjRCusebHNJX+/tNa5xXqHYIqiZaCiYvUcTs9Fd7sIoH4YdVHlmKslAyYQTnKWFwJHOHim6t7axuGnexsL2MsmRRXbcFXmbT3TTDXba7WUNOgrsnkgORRVzo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ut8pbL1i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ut8pbL1i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDCC7C4AF09
	for <loongarch@lists.linux.dev>; Thu, 20 Nov 2025 12:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763640255;
	bh=TvKuNxF8KVzTcJOUyKqukheXPBn2wF0Qdt9k4a0yJ1k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ut8pbL1iOuIzAmhZqxmV4XqEKwJJdvwTMezcdwfkaM1SL6mZy0Ug0qn7wOg4XmKKl
	 92w9SmQTt9P8WpHVkyEZF5kD4cNDGD6hZCtaN+FHqySE6XbV7fuZJGwK1vWxZlZ4pN
	 efL7QjPvRkx0UotwhtNHg7kSbx/uHTxhuN023ZuFpiB9f/A6vlFRn5wC8X67RVoqZg
	 n+22RrGEEd7brKiqxVrsZXtgXabDJ2E++uf9v6notm6xvudGu/XX2TYJ/bNoQfDIPc
	 8stUkPp0BENLSy1gwLXKm7xANF++i0oEuO5qH9A0RsL8fmJS6mQn+rbQX2Ig4L6vB5
	 lVdYXcQyU96uw==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b73161849e1so209439266b.2
        for <loongarch@lists.linux.dev>; Thu, 20 Nov 2025 04:04:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVJ1w5dQs25B+bcvQmw9jr10tJM3r/5Ja861Hh8jf5hWRQXAzehbgcU+XatDjdlf7jSv6mGRWnQIRg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyYGlZB1nelXL1jn9muSX6fXF/xO8SwB58Iihjtp3RLsodrsP25
	6zok5VUkBBk+U85T97QWjw1T8FXiYChtL9oRqwS66/CltJojczTcmR+67BBjxCtKo9LsqX8wp8P
	/MjthIVVnt+GK3Q3KIBi71veaVTDeaps=
X-Google-Smtp-Source: AGHT+IHrwBCd3dKr6xvzcNJE2FOBI7NF7lucPKAfcahjjE/JI1kDrb5pYEtyohOxHciBo8tacJyC3pH8M4Bo7CRtiRg=
X-Received: by 2002:a17:906:c107:b0:b2b:3481:93c8 with SMTP id
 a640c23a62f3a-b76587b1c55mr227463066b.19.1763640253480; Thu, 20 Nov 2025
 04:04:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251118112728.571869-1-chenhuacai@loongson.cn>
 <20251118112728.571869-12-chenhuacai@loongson.cn> <8dd8334b-388b-4681-a62e-11e10b6d6466@xen0n.name>
In-Reply-To: <8dd8334b-388b-4681-a62e-11e10b6d6466@xen0n.name>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 20 Nov 2025 20:04:13 +0800
X-Gmail-Original-Message-ID: <CAAhV-H64h2AtMt-zZYLs7ZZAWadEpU=ZUpvPojC6ut-Z04YDdA@mail.gmail.com>
X-Gm-Features: AWmQ_bltrBYAeaOpjcL3S1Z_kJJMPufmCCydAP9wpFgnNCsjI429Hjufo6Kmv4I
Message-ID: <CAAhV-H64h2AtMt-zZYLs7ZZAWadEpU=ZUpvPojC6ut-Z04YDdA@mail.gmail.com>
Subject: Re: [PATCH V2 11/14] LoongArch: Adjust misc routines for 32BIT/64BIT
To: WANG Xuerui <kernel@xen0n.name>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Arnd Bergmann <arnd@arndb.de>, loongarch@lists.linux.dev, 
	linux-arch@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>, 
	Guo Ren <guoren@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 20, 2025 at 6:45=E2=80=AFPM WANG Xuerui <kernel@xen0n.name> wro=
te:
>
> On 11/18/25 19:27, Huacai Chen wrote:
> > Adjust misc routines for both 32BIT and 64BIT, including: checksum,
> > jump label, unaligned access emulator, PCI init routines, sleep/wakeup
> > routines, etc.
> >
> > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > ---
> >   arch/loongarch/include/asm/checksum.h   |  4 ++
> >   arch/loongarch/include/asm/jump_label.h | 12 ++++-
> >   arch/loongarch/include/asm/string.h     |  2 +
> >   arch/loongarch/kernel/unaligned.c       | 30 ++++++++---
> >   arch/loongarch/lib/unaligned.S          | 72 ++++++++++++------------=
-
> >   arch/loongarch/pci/pci.c                |  8 +--
> >   arch/loongarch/power/suspend_asm.S      | 72 ++++++++++++------------=
-
> >   7 files changed, 116 insertions(+), 84 deletions(-)
> >
> > [snip]
> > diff --git a/arch/loongarch/pci/pci.c b/arch/loongarch/pci/pci.c
> > index 5bc9627a6cf9..d9fc5d520b37 100644
> > --- a/arch/loongarch/pci/pci.c
> > +++ b/arch/loongarch/pci/pci.c
> > @@ -50,11 +50,11 @@ static int __init pcibios_init(void)
> >        */
> >       lsize =3D cpu_last_level_cache_line_size();
> >
> > -     BUG_ON(!lsize);
> > +     if (lsize) {
> > +             pci_dfl_cache_line_size =3D lsize >> 2;
> >
> > -     pci_dfl_cache_line_size =3D lsize >> 2;
> > -
> > -     pr_debug("PCI: pci_cache_line_size set to %d bytes\n", lsize);
> > +             pr_debug("PCI: pci_cache_line_size set to %d bytes\n", ls=
ize);
> > +     }
> >
> >       return 0;
> >   }
> Mind adding a few words about why this is no longer considered a BUG and
> why functionality isn't adversely affected by the change?
Yes, you are right, so I split this part into a separate patch.
https://lore.kernel.org/loongarch/20251120082039.2293136-1-chenhuacai@loong=
son.cn/T/#u

Huacai
>
> --
> WANG "xen0n" Xuerui
>
> Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/
>
