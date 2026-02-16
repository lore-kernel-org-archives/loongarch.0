Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1166F26AA91
	for <loongarch@lists.linux.dev>; Mon, 16 Feb 2026 10:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771238063; cv=none; b=EsjGIQA4RHQwe4on7em8nopyMYxqX0d891X5ZONXbqGvhPjAoeZm4zghp9sDgcDpjyPzldKC898IVhVc2xWET+7t/TswheqGWKaioFReizTkHE283kbndnSWFcaFHLdjUCBgw4XRR0qWhoW8bwLlP27XX1mEpfxhD3WPIc7dt7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771238063; c=relaxed/simple;
	bh=Q2+hdYFmtAqtMLq5tkMs+y+f+ZfaEJRBdIpsjZu0z9k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I4IJ9ewKVAra2gkx/aI0CEx8dV3jQ+LKqfMN7JpZjcPdTi2LHwl7o5aw9tRrZkSicpGi7u6c+vG1wknXerwT7mO99GLqxCQBXbxN7oSQbb0m4fWrHybbbxkoBCX1un/AZENDfe4KiElN93BfM8RFetqXkscXgFEyFxikDWrnz9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HZmr5E8Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HZmr5E8Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC385C2BC87
	for <loongarch@lists.linux.dev>; Mon, 16 Feb 2026 10:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771238062;
	bh=Q2+hdYFmtAqtMLq5tkMs+y+f+ZfaEJRBdIpsjZu0z9k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HZmr5E8Yxr2sSwM2NhDYJO4EcvdjbLjxsyzGZFJgjJenrLc5BjbcRfn4Hz3pBiqeD
	 CbqyvquORxWmOngSD+c75j0MHWotUbv30t9eVLe3nf18JEjdrEourXDZSGM0PcxlO/
	 QXtQoiLczDOGTzrQ9yllzfUB1i5+b0r/Lcc5286PL/rniAQwEyOn/WrX5/1vYBbXX4
	 9mqdYxcAKHjFCxULE437ojze3bVUQMlTcSoREqPacxWGzxiQOr6Ny8yQij4uIbYB71
	 P2M1G1RVcuWLXZTzTCIrzbMejMp220z4nHeDcWoGUmw6TNlSA0t9GaGhsRglUep68E
	 3OI5Lp0ARIgSQ==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b883787268fso360910766b.3
        for <loongarch@lists.linux.dev>; Mon, 16 Feb 2026 02:34:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUdHOowi1xkgC9H80OP6Oxg27OmKiLumXaT7w5dljgG8/Inmeu/xK6aZu/zHmACVh/YJvaui0HK4LU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyfqFASUFNSddC6U3N/bjv7+dYhpdIGwEtkAg8lUkSdbGWJwbxe
	qZHSkHJG6oHLDEjEWhv7/XfndqeBth3tkNi4++QUCdCg96IwFce8WNHlgGf2uvW3xikS0RC1iMv
	GtKyAT3XYRTuo4HOtII0JB/s91mcaI+A=
X-Received: by 2002:a17:907:3d9f:b0:b88:7431:3942 with SMTP id
 a640c23a62f3a-b8fc3ca80f2mr390011766b.33.1771238061395; Mon, 16 Feb 2026
 02:34:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260215140953.1224579-1-chenhuacai@loongson.cn>
 <2026021631-sabbath-wrangle-3496@gregkh> <CAAhV-H42+WuWpKqFc6MMv8cZ_U8Ve15qtb4DkOd9Yj6Z4ZFE_w@mail.gmail.com>
 <2026021602-unsalted-straining-edfb@gregkh>
In-Reply-To: <2026021602-unsalted-straining-edfb@gregkh>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 16 Feb 2026 18:34:17 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4x_739RjgJYmWOXVrfFkAwCf+ArzQHK6i42kUVqTvLMA@mail.gmail.com>
X-Gm-Features: AaiRm50VTFo3OX3Hse0aNUdm3jS1-phvYT_ZMWjuDkhf5xbRCVOepju_XRZEFvg
Message-ID: <CAAhV-H4x_739RjgJYmWOXVrfFkAwCf+ArzQHK6i42kUVqTvLMA@mail.gmail.com>
Subject: Re: [PATCH for 6.6 & 6.12] LoongArch: Rework KASAN initialization for
 PTW-enabled systems
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Sasha Levin <sashal@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, Tiezhu Yang <yangtiezhu@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 16, 2026 at 6:20=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Feb 16, 2026 at 06:09:31PM +0800, Huacai Chen wrote:
> > Hi, Greg,
> >
> > On Mon, Feb 16, 2026 at 5:52=E2=80=AFPM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Sun, Feb 15, 2026 at 10:09:53PM +0800, Huacai Chen wrote:
> > > > From: Tiezhu Yang <yangtiezhu@loongson.cn>
> > > >
> > > > commit 5ec5ac4ca27e4daa234540ac32f9fc5219377d53 upstream.
> > > >
> > > > "kasan_early_stage =3D false" indicates that kasan is fully initial=
ized,
> > > > so it should be put at end of kasan_init().
> > > >
> > > > Otherwise bringing up the primary CPU failed when CONFIG_KASAN is s=
et
> > > > on PTW-enabled systems, here are the call chains:
> > > >
> > > >     kernel_entry()
> > > >       start_kernel()
> > > >         setup_arch()
> > > >           kasan_init()
> > > >             kasan_early_stage =3D false
> > > >
> > > > The reason is PTW-enabled systems have speculative accesses which m=
eans
> > > > memory accesses to the shadow memory after kasan_init() may be exec=
uted
> > > > by hardware before. However, accessing shadow memory is safe only a=
fter
> > > > kasan fully initialized because kasan_init() uses a temporary PGD t=
able
> > > > until we have populated all levels of shadow page tables and writen=
 the
> > > > PGD register. Moving "kasan_early_stage =3D false" later can defer =
the
> > > > occasion of kasan_arch_is_ready(), so as to avoid speculative acces=
ses
> > > > on shadow pages.
> > > >
> > > > After moving "kasan_early_stage =3D false" to the end, kasan_init()=
 can no
> > > > longer call kasan_mem_to_shadow() for shadow address conversion bec=
ause
> > > > it will always return kasan_early_shadow_page. On the other hand, w=
e
> > > > should keep the current logic of kasan_mem_to_shadow() for both the=
 early
> > > > and final stage because there may be instrumentation before kasan_i=
nit().
> > > >
> > > > To solve this, we factor out a new mem_to_shadow() function from cu=
rrent
> > > > kasan_mem_to_shadow() for the shadow address conversion in kasan_in=
it().
> > >
> > > The subject line AND the commit text here do not match the upstream
> > > commit AND the diff is different and you did not explain what changed=
 or
> > > why :(
> > The subject line is exactly the same as the upstream commit (no differe=
nce).
> >
> > The changes in the commit message is because the text of the patch has
> > changed (this is why the upstream commit cannot be applied), and I
> > think the commit message should exactly reflect the text.
>
> No, the commit message should match exactly what is merged in Linus's
> tree and then the comments before your new signed-off-by should describe
> what is different here from what is in Linus's tree.  Don't rework
> changelog text for stable backports, that only confuses everyone
> involved and it makes it look like you are doing different things than
> expected (i.e. attempting to get stuff that is NOT upstream merged.)
OK, let me try a V2.

Huacai

>
> thanks,
>
> greg k-h
