Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5353ACA43
	for <loongarch@lists.linux.dev>; Tue, 17 Mar 2026 12:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773751609; cv=pass; b=e38G+dCgKWQxy/vFMMev5RdehmrZlC6LLVIhxyVXadzgq5KD38+2FyIq4O3w6CA0mlHZ2p+tJZ10DNx87fcSJviaiU/8GhhdRX1SvgqE7Nng71EYfk2u04Uc74o2YrK2Bi2BdHdujzKOf5/XIIwZEOXXzLzsH4wT3O7QFZyZcEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773751609; c=relaxed/simple;
	bh=mYjGwKJGXb9AdcAJcVyQZLzkZJfik89IS4+cyqBDMrQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TL6BJJWQJQjr2lQCHgRs/N28W9miAM//x6FNBucujBegvYei9j9c7WcByye7lNa1jphmbP00nyhUlhkD4wq7jEOe8b6qCXcFQRNHtPTNW2ym2q/rdV1jyBx3ugb+0T3rJAQxP0nLbBrZArBKMVawx20fB80k10HxXQKdWgI7n48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EthHKduD; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EthHKduD"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-667952fd262so74669a12.2
        for <loongarch@lists.linux.dev>; Tue, 17 Mar 2026 05:46:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773751606; cv=none;
        d=google.com; s=arc-20240605;
        b=QjPleeXY1Hs5mIcdHvvs2zbUTOeamDQvXj6NOv5KHXb/TZM/DhMRW8NgSlxVi121O+
         2RXW31pcfPKMF+PyedeQ2KxwxFw2JqK7FMLdxeFoEIqk1t4xqtsXBvkENgvPRsysW928
         mzoft7kzLRJAd0ZDP4/21yJRKhHPIZ+Wcdm4YSa2eDBxTlh09rrGRz79aXFK3ij96JTv
         XQ70/5qQzjNMr0KWC4I6cfrYcZbar/VmoxkMZniUKFSF1o3uKgexbexBBR72pwBWBAOq
         BIx+W/sAbpE9/0l9oDC83u1LJ2YsgTr+sj8liv1kVuC2JxuFlRXmwfylYtExhp665gK0
         mAAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+JaAdR+BAKKabnEcn2fmDmSU35qTJcdB+x0PjifxyzA=;
        fh=wRRx0YexJi6JpXz13HnKQ1oB1p+v/9LWUFXjF3wa8Zw=;
        b=I+dL+ZOckpSlnwYKHB7Jsc8he94hkCaxhohQehfaQcw913rqjkJuPC6LoroG4bqwqT
         0NdRw/ekxzOMbq6wFYPwJKtF+aBD6uuGj94LxoiN8m9YXqSmM1lJono1IfCs5thOmedC
         +l8jPOw1pNEzdY6l9WVY6oURAHfoGpKoW7wfzY1BxMNyK4YrTD0V5w+nMovXc1LWJxGU
         JGCEPRc2xMMCVun8lHAGfMjiDtys/K0RfaxfGJInFgWtYTphk7G9opaBxIaYPHQZMQ5R
         kNpvj9m2pW6VyYqWk/pXFl+sMQGtIRtfno7JGLa6PFDWZ7lsMGYTbn2syPncGew28aNo
         T2dg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773751606; x=1774356406; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+JaAdR+BAKKabnEcn2fmDmSU35qTJcdB+x0PjifxyzA=;
        b=EthHKduD3D3tFQxDbPsfL+8yfI8PaGTpXkBk8lXzJ0oqWf/IalRbPWMcmbVmftcAXG
         HEYRAKdyv6K6BdmwutBqQiiAtgWbey+iPDOViywfZEm2diA71HXJPdDPjY945Z9hOpo6
         mYhO70oY0H9s9JhM0dGbbM1hNuz9dDhHLShNAKCKHLZ+mpFxcQRcA+xLGfn3PrgNrV1j
         MmHbchCEU3UMuFqpq7Rxl1E7jybxWpMRwTy8csLw9pDcgg5fh29ZUna7ybnxRUuzWYwt
         hFwi2B4SNQm0d+2B30Q5FynzoWo8sd0WjTyO3gALF0JTAFpSvmUjeUczCcTfzA2eZB2Y
         vV9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773751606; x=1774356406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+JaAdR+BAKKabnEcn2fmDmSU35qTJcdB+x0PjifxyzA=;
        b=L8b/R6dM59DzPavJ9+L39GbICejf1tULLY7F1mr71Qh3kOZ7lla6EJ5Qe1GfEGDbT3
         Gex54pvkncPSsH20P2peD3bwwWSzTquvhp/Ydq9lCzyMDUsj1k4lgccq93/gPPNsx6y/
         qPqKtWPjJeWbE9YYtXBcIyzz13P0axQ4AjgsxCB0Xi4f5S9mQWuBQgbNjMRyjKaHxM6g
         xU+BBSKBHLiPPdz4QojqBkm/1kHkFHNBQ4ycZ4i93GWCuIYrj57god1I3hcZW6qljL/o
         OQtCuLc31mjKM9Nj6unkRXYwOA8Uq5R8lhIUjHCxbIDXFMrSfbwg0vEx1JY5R+g2VVnj
         ji3w==
X-Forwarded-Encrypted: i=1; AJvYcCXXOjPGiDFFsmYWmPK/fA7ms8ZcaAzU9T4J0eIInR3dmTyMr3kYssVvT05NN9kzEcl9htu2AU8uaeg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxcH9hXXl2bKsHg9Ht9pPs3yzsTfcoMbYUjrC9LONw+12p8YeUm
	PWHvtAhAGOFLBnJ/isNefqTCLeWz1HcPBmKuM160YKWqUDWw8GrQ0gSjm+Le2+KsooDBaz8/uB8
	h6i7MwpB6Tub893gafs41hdmcj4UAhSI=
X-Gm-Gg: ATEYQzwKSpTalzH33WP2JtfRAH+yYiy3hEP+ZRb0fxQkvetiK+fgwGeGIJnvQElXJmu
	F3WhTe8sTW9NgU5RIRQLE0toSjgwmjexrvKDCwa8gimgAOeSQOk1C+pZLFUnZ7DwF/ObOz4Klla
	3F69tSjYbtthazA1YAUwfub41FTDxVmO/2Fzzfh4EuiCBWbnAUBTFMiz0oMZhZICizHmNCTDGo9
	G/yt2K3HCiM8wmzmkAFNvVxR1EsXvIm4C+Oa3fk/MOSQjWAaswaWM6F8vEHH6cITAvqJPUKetwe
	Aopsx85mGg==
X-Received: by 2002:a17:907:746:b0:b97:6384:2317 with SMTP id
 a640c23a62f3a-b97650e5609mr1098522666b.17.1773751606032; Tue, 17 Mar 2026
 05:46:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1773107475.git.zhoubinbin@loongson.cn> <cb7062433863aea0d66959fc0f4aee791cab6402.1773107475.git.zhoubinbin@loongson.cn>
 <dea0bc84-c039-449c-8a6b-652062df75aa@sirena.org.uk>
In-Reply-To: <dea0bc84-c039-449c-8a6b-652062df75aa@sirena.org.uk>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 17 Mar 2026 20:46:33 +0800
X-Gm-Features: AaiRm536vGSN7n9-qJm9TBI4DE0o4d3kzNfShcfuQTENhCd8atZI4Bolz7w2-c4
Message-ID: <CAMpQs4+ASJ=ZC9wH49cnSGk8BRMx35P-OVdxzYW-pXsN6QwPEQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] ASoC: loongson: Add Loongson-2k0300 I2S controller support
To: Mark Brown <broonie@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark:

Sorry for my late reply.

On Thu, Mar 12, 2026 at 12:15=E2=80=AFAM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Wed, Mar 11, 2026 at 02:37:48PM +0800, Binbin Zhou wrote:
>
> > Due to a hardware design flaw, PCM_START requires an explicit reset.
> > It has been tested and does not affect other machines.
>
> Are you sure?  It just does a reset whenever we start a stream which
> means if one direction is already running the controller will get reset
> underneath it and disrupt things if the other is started.  If this IP
> requires it I guess that's just unfortunate but presumably existing
> devices don't require the reset and will be regressed.

Sorry, I may have misunderstood that.
We just need to soft-reset the controller in
`loongson_i2s_plat_probe()`, similar to `loongson_i2s_pci_probe()`.
>
> > +++ b/sound/soc/loongson/loongson_card.c
> > @@ -61,7 +61,7 @@ static struct snd_soc_dai_link loongson_dai_links[] =
=3D {
> >       {
> >               .name =3D "Loongson Audio Port",
> >               .stream_name =3D "Loongson Audio",
> > -             .dai_fmt =3D SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_IB_NF
> > +             .dai_fmt =3D SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
> >                       | SND_SOC_DAIFMT_CBC_CFC,
> >               SND_SOC_DAILINK_REG(analog),
> >               .ops =3D &loongson_ops,
>
> This changes the clock inversion for everything - should this be
> parameterised as that seems to be a fairly generic card?

Okay, I'll add the new compatible.

In addition, this series of patches seems a bit disorganized, so I
plan to separate the first four patches into a standalone patchset
focused on code reorganization.
I plan to add GPIO-based headphone detection (Headphones Jack), which
will be used by the Loongson-2K0300 SoC.

--=20
Thanks.
Binbin
