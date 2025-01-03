Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2F31F8F0B
	for <loongarch@lists.linux.dev>; Fri,  3 Jan 2025 09:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735896945; cv=none; b=d5tAZ3w2rGLunEqDp0TTXT8btEahO2jSv8X3XqAJLP1aMxEjPgglZdLdwYwgceby5MMHvcibaELtjFJU/rbnbTiNjmRnKcwIesTM6D8mFIO+4DlEg8U4KOhpNp85ZuqETuphHUICNoTg5zVkJ1WEzrdaalEVcHCWalxwbYPaoR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735896945; c=relaxed/simple;
	bh=BGjJh4A4wkn5XTUgeh+EagpyHMMzRL3wk5GLlfO2ENI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gBMXYSmICqK4dkoUu2rJ1+LiSy0Bs7UfwreV4rk0lWlpVJMXuRHSW8lkHvm/LlFtsl/KB+f4U49fJDbVpKg8xKc0V3xjL1Hl3NfZi14w+lAgfmOr+y4R0tgoxgomKQrFQNm50bg36hWnzh8ecW7/0dykor1Ua0XRZ7F4jbkFI0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j8eINz7G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j8eINz7G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77CC0C4CED7
	for <loongarch@lists.linux.dev>; Fri,  3 Jan 2025 09:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735896945;
	bh=BGjJh4A4wkn5XTUgeh+EagpyHMMzRL3wk5GLlfO2ENI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=j8eINz7Gw5EtJ/UhxC0eeoQOyhLQNywNUT85GCqLZU3xHo8TnKmCbJA7mS4kfeizk
	 MrPcj9qOZjZd+bgasZgkpK7GsGgfqE3Z4vgabW2hSxwsNOqOspFfB/KmyL+wYffw9S
	 VgTG/BqjNpeziPfHBZRN0bV1AWIlb45pSvWdVtRQ6rsBTcUAaeMzj3nzvRVU0rveMm
	 et05bYtffA30EMnssYdX2CnT4Nj1D44anI74dFtlEXw7rG5e+w6jP1rH9xWGODoQf8
	 nR9yFvDJKhgRJRpLa+aJmVNC2fgdqT0s79qTL/HU1i1ol1UaMhCr6vsBSlRTttpqM0
	 xHhkUmPvo+brw==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aaec61d0f65so1933724966b.1
        for <loongarch@lists.linux.dev>; Fri, 03 Jan 2025 01:35:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWhtP9HK1ISdt8pArwBKckuGeWIhu292vz8EKmVhDiAuHXDpcfiUJ3GX8fXsYQFZMTszs6FJkTwXOk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxXkjKCTkqozINlU4d5wgO8YeMqVsLkYX4146nsAM8ohwzqyWeW
	e+18XvZKcqW+MpE4pSYAt1ZEJCX2JZsthYJ855qVm4sxzWTH0yQhhe5+WD0DJ8X1m1AZqZIURQA
	qeJ6puedHAf7/pTYVyLC1SZ3X1+I=
X-Google-Smtp-Source: AGHT+IEdmQLHkHqRWEzrGgZulFdE0fqpmupartEq3KIlFSHVT588vGoB4m7n2OeOImFcnWUH56VHB6lwIhzSi90TBg0=
X-Received: by 2002:a17:907:1b18:b0:aae:e9cf:5c1a with SMTP id
 a640c23a62f3a-aaee9cf5e8bmr3223554766b.36.1735896944064; Fri, 03 Jan 2025
 01:35:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250102-la-earlycon-fixed-map-v1-1-23fe3a6681c4@flygoat.com>
 <CAAhV-H44VvyxHqmyQ3K8qC+HERH0FjheqAJpDCiYkQ2oK2woAg@mail.gmail.com> <05ac2a87-7f60-4336-a323-443967a77a76@app.fastmail.com>
In-Reply-To: <05ac2a87-7f60-4336-a323-443967a77a76@app.fastmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 3 Jan 2025 17:35:34 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6Bji1FKcuhxLntfWe4iJGpr-tmWLt7q3L55sVPHrH7AA@mail.gmail.com>
Message-ID: <CAAhV-H6Bji1FKcuhxLntfWe4iJGpr-tmWLt7q3L55sVPHrH7AA@mail.gmail.com>
Subject: Re: [PATCH] loongarch: Disable FIX_EARLYCON_MEM when ARCH_IOREMAP is enabled
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 3, 2025 at 5:02=E2=80=AFPM Jiaxun Yang <jiaxun.yang@flygoat.com=
> wrote:
>
>
>
> =E5=9C=A82025=E5=B9=B41=E6=9C=883=E6=97=A5=E4=B8=80=E6=9C=88 =E4=B8=8A=E5=
=8D=882:38=EF=BC=8CHuacai Chen=E5=86=99=E9=81=93=EF=BC=9A
> > Hi, Jiaxun,
> >
> > On Thu, Jan 2, 2025 at 10:34=E2=80=AFPM Jiaxun Yang <jiaxun.yang@flygoa=
t.com> wrote:
> >>
> >> When ARCH_IOREMAP is enabled, we are using always accessible DMW
> >> for ioremap. It makes no sense to create a dedicated mapping for
> >> earlycon given that we can access the region via DMW.
> >>
> >> Disable FIX_EARLYCON_MEM when ARCH_IOREMAP is selected. This can
> >> ease debugging for early mapping issues.
> > Fixmap has nothing to do with IOREMAP, whether you use ARCH_IOREMAP or
> > GENERIC_IOREMAP, earlycon is mapped by fixmap rather than ioremap().
>
> When you have ARCH_IOREMAP it=E2=80=99s not necessary to create fixed map=
 for earlycon.
>
> As ioremap along is sufficient to access MMIO.
It's sufficient but ioremap() doesn't need to control everything about
MMIO, and I don't like the #ifdef in fixmap.h.

Huacai
>
> I=E2=80=99m doing this as it can help with debugging early mapping issues=
.
>
> Thanks
>
> >
> > Huacai
> >
> >>
> >> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >> ---
> >>  arch/loongarch/Kconfig              | 2 +-
> >>  arch/loongarch/include/asm/fixmap.h | 2 ++
> >>  2 files changed, 3 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> >> index 1c4d13aa677e2e04b9791882fba7523f93d6a69d..ad8a8cf75343799ea626be=
52f521fa75e7cbe07b 100644
> >> --- a/arch/loongarch/Kconfig
> >> +++ b/arch/loongarch/Kconfig
> >> @@ -246,7 +246,7 @@ config MACH_LOONGSON64
> >>         def_bool 64BIT
> >>
> >>  config FIX_EARLYCON_MEM
> >> -       def_bool y
> >> +       def_bool !ARCH_IOREMAP
> >>
> >>  config PGTABLE_2LEVEL
> >>         bool
> >> diff --git a/arch/loongarch/include/asm/fixmap.h b/arch/loongarch/incl=
ude/asm/fixmap.h
> >> index d2e55ae55bb9c499b9a685509bc26d663054b58e..905dc7a5f9fa52ac924fe8=
32749f39283c28a9f8 100644
> >> --- a/arch/loongarch/include/asm/fixmap.h
> >> +++ b/arch/loongarch/include/asm/fixmap.h
> >> @@ -12,7 +12,9 @@
> >>
> >>  enum fixed_addresses {
> >>         FIX_HOLE,
> >> +#ifdef CONFIG_FIX_EARLYCON_MEM
> >>         FIX_EARLYCON_MEM_BASE,
> >> +#endif
> >>         __end_of_fixed_addresses
> >>  };
> >>
> >>
> >> ---
> >> base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
> >> change-id: 20250102-la-earlycon-fixed-map-d6a48bd5b831
> >>
> >> Best regards,
> >> --
> >> Jiaxun Yang <jiaxun.yang@flygoat.com>
> >>
>
> --
> - Jiaxun
