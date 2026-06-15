Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FD51A680E
	for <loongarch@lists.linux.dev>; Mon, 15 Jun 2026 01:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781485494; cv=pass; b=ZqgRnOKq65T+fPRC2yTv4kKQ9tXnA8QBLgKZhwMM+99WkjDgPziODBTWiO+gxkh6zZwQZytpAQIPe+s5W5tZ/x/bwrtjheRYi7wxmXgCN/8TpPahFo81ssSAnE10En+GI0GhFchYu5V7xcJ0GsgQQWGtA3z7S2sTRBAd70bTp5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781485494; c=relaxed/simple;
	bh=R2ycl9QhnYSUjK91R3xYK2Q1tAb2Ce8h0XOfR+YQzug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hNh8ab+6mojLnExAhaVAK+A0jLwfNh2KlyWa5A04YrhxO2wHzEw2jfeeL4QZwDijf/f63+eA6jOahfWEuX0fcHQr6QDvWnvcBaz97qzjWACuLjqdDF4TTGuYE2NZvvSgdpktjnbrR2+c7YoiJA5YFPZx9GNtiolOP9jqCXg4ePI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YBPVKRnH; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YBPVKRnH"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-bec450b950dso376359766b.2
        for <loongarch@lists.linux.dev>; Sun, 14 Jun 2026 18:04:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781485492; cv=none;
        d=google.com; s=arc-20240605;
        b=Vnf5PStgR0ocg9EWXbKEkjtRzCvAHHq27BGWZ2Yw99fHayp1eF/zy7XXZ4VUIZ8Qvt
         XHTBkUkMF5oQijab6JWrlmXdbiHG1Cvc9hKujFqkJCveoPKhhoVT+LbVX8t5HBk5QbIR
         bdacr4/H0h05fQ+jQ4HHCBmJ7qJgqv88gX+jYDmnznAV3sUwTfWU66RwotDADwZrRK3J
         Epyeii97Fs28/cIjYMzHC2ZsagfVO77UkyLOlML7CgLfYpW8ps2Uqv5y1RspTS0HB7a/
         rJEvju0BeupMZNrmF4q3IeZrEJ4iY3lAfnL6DdI4VioLkhZ6UVkQN15+U+8IxOQmA42F
         Uisw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wQSOOV+DBTiCCEtastW35rFQgcJIi8WkjbxM6bIBd6s=;
        fh=xBtNnEN9AfF/Prl3tPva5SiNKsf8FPilLlKHETOHZSU=;
        b=Siw1zIBqz573I9tLbM7U7rDrYjyWpsKLITnehcmb8FsvbofXrLRyMjUx4PPwqw5QSg
         S30+JYG4LXfJpZ8aXom+F5KY5lvUmDhLByWchvRJQKwGOBuVBf8FInon2iIbaBrr1Af8
         o/XdxfYAGFUa1OSJysz85SYnXfl09K6HUohAnOFxjZ/x7G3QZBvBjimRYjnsJh5+MCX0
         /GjPhiBsTuJ5Y0T5v6w/gNpDHBPAw1B0L17A1RRr8qYFtHmNN9P2Nqx8O47ON2vp2Zk7
         U/VM3MHv3UbkeGfcSqQTLV4yXg1FHeH2gn+ESMX7nAmy/PtSVB56i4UcQTcA7UF7ZUsK
         wncQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781485492; x=1782090292; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wQSOOV+DBTiCCEtastW35rFQgcJIi8WkjbxM6bIBd6s=;
        b=YBPVKRnH+y3WgN5DDfl38vu+MZxdRM6p7+oat+XXnO8zmq+qgo3JAc8ZIFYOHREA5I
         hm7GsHPqAJZFzjnRaX8Xg3aArs5paca+KX41+OQWLFMiCKk+9jT9n0JHg9JnLoTz8PXm
         5sEU4WNLYSpJEFJeX9j3Ak3Agz42Gj4T+sLZJIpvPEhVIQoJ0V84vTBwAfhZGh2FQKUB
         FfSfC7awrIzK6a6MDpLQqSkMrwegQMJgm88wpQ329mVLu8lJ2EnWroQwdBdqc1M1jVuy
         uwJh+vE4Glh0w4K1vRV4U/3dC/vfwHe0UTHYqDnsBj+fUrtCb0r9rSceOdky+cmzIT7w
         TJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781485492; x=1782090292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wQSOOV+DBTiCCEtastW35rFQgcJIi8WkjbxM6bIBd6s=;
        b=VVdgfSwRiEi5UY+tz2vhid0pZ/C/BJdI1A7HSXgW5CixMal/IcHORh5rifC15X2ASX
         1Z6KRM5oGKM2nqBaI3waWIfRZmF/pVJp67sJFzwf+QTVfRVJB5BO+Ih5F575a/Ig1LXr
         UqIrINEUE3dhKrgC3s6v8oLspom664QJ3jNnw2iDKw9gGUetV2RxFjGdej5PdAhmUOMv
         P/EAmeiQNBjR5AOm8sjcm8HzTAzRIWLKqa769zGqs0+7Rebd5zBzizPDXtGcI9gv2u4w
         tPXRcRF3CJdwcG+FY6Q0g/XjYc/lYcC5LPydcKH7/b1bW0LwvsA2oJiuJ5Cn2Tf//Cb1
         2AgQ==
X-Forwarded-Encrypted: i=1; AFNElJ86J7PNEJzyRFDaFtSSWfFpgzvadvt0A1HhRrPrIYm8qJnL05jn0l9IOpdPqfKVkrWuLOcdCycE/fY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx88ZCin3MC3sk7eJaRk6GmeaiFOr6cpF897QAuDlNpatABBmwd
	WTOlktuYLdKPyHkBd3t0uee39+q02hkMfaqzQzUoXDVyTBjh9bpPD7x+GuJaYOWWgarRHzsy+Tp
	JKxzgPtIfMj2CcWFFps8JNX/Xw0wlkRk=
X-Gm-Gg: Acq92OEZDpRotPt2KEzyRN0rjxMJADAsh+21PG0ICDVtizSZg6vDbR2RUmotCdajnI3
	te8+NEKrSWQER+UrhCulTRxWIX22HV5rHKSHJB/v9N8lJYa5kecwyIGqKvCn2wmrmFCHgLiKhKG
	lIgzIRmZR4e4V5U95LX44+KyAVX+eqIP6aQ0jAL0cJxXR1I6+9Ef1jHyS9RoqrAEGty2/1T7LLD
	k4j3bSsHHxm3e7rbhB9ZbhDzC7qSQ1gK0DlJO98LowiPW1UfE5v1tK4WjO1sPnP2kaX4miUUhhX
	wzKhqxZr
X-Received: by 2002:a17:907:6895:b0:bed:2a8b:3e72 with SMTP id
 a640c23a62f3a-c006c665bf4mr175509566b.21.1781485491299; Sun, 14 Jun 2026
 18:04:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1780538113.git.zhoubinbin@loongson.cn> <c03b86a9318cffe69ecf8d5c14543fc5948ab2c7.1780538113.git.zhoubinbin@loongson.cn>
 <20260612160134.GA1116138-robh@kernel.org>
In-Reply-To: <20260612160134.GA1116138-robh@kernel.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Mon, 15 Jun 2026 09:04:38 +0800
X-Gm-Features: AVVi8CehLy42LEJgG2i99cMYFG50MlGhaNfJeJz81YaHZrK9mKFknfitnhAJSIc
Message-ID: <CAMpQs4LUs2g=_QvJ14NQD1KAEwvKgjNmdj6B-3odnqJNxEUcQQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] ASoC: dt-bindings: loongson,ls-audio-card: Add
 ATK-DL2K0300B compatible
To: Rob Herring <robh@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob:

Thanks for your review.

On Sat, Jun 13, 2026 at 12:01=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Thu, Jun 04, 2026 at 10:11:46AM +0800, Binbin Zhou wrote:
> > Add new compatible for the ATK-DL2K0300B development board based on
> > Loongson-2K0300.
> >
> > Unlike others, this board features GPIO-controlled headphone detection,
> > headphone mute, and speaker enable.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  .../sound/loongson,ls-audio-card.yaml         | 37 +++++++++++++++++++
> >  1 file changed, 37 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/loongson,ls-audio-=
card.yaml b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.=
yaml
> > index 8c214e5d04b1..e9b248e8246c 100644
> > --- a/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.ya=
ml
> > +++ b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.ya=
ml
> > @@ -23,6 +23,7 @@ properties:
> >      enum:
> >        - loongson,ls-audio-card  # Loongson-2K1000/Loongson-2K2000/LS7A
> >        - loongson,ls2k0300-forever-pi-audio-card # CTCISZ Forever Pi
> > +      - loongson,ls2k0300-dl2k0300b-audio-card # ATK-DL2K0300B
> >
> >    mclk-fs:
> >      $ref: simple-card.yaml#/definitions/mclk-fs
> > @@ -47,6 +48,18 @@ properties:
> >      required:
> >        - sound-dai
> >
> > +  loongson,spkr-en-gpios:
> > +    maxItems: 1
> > +    description: The GPIO that enables the speakers
> > +
> > +  loongson,hp-mute-gpios:
> > +    maxItems: 1
> > +    description: The GPIO that mutes the headphones
> > +
> > +  loongson,hp-det-gpios:
> > +    maxItems: 1
> > +    description: The GPIO that detect headphones are plugged in
>
> We have standard properties for at least this one. If you see multiple
> $vendor,foo-bar properties, don't add yet another vendor foo-bar
> property.

Yes, the `hp-det-gpios` property can be found in
`audio-graph-card2.yaml` or `audio-graph-card.yaml`, but I don't seem
to be able to reference it directly.
I=E2=80=99m not sure if I understood your suggestion correctly=E2=80=94to r=
emove the
`vendor` prefix? If so, could I use the `fsl sound card`[1] as a
reference?

Also, the description for `hp-mute-gpios` is inaccurate; it actually
controls the enable state of the hp. I will rename it to
`hp-ctl-gpios`, as follows:

  spkr-en-gpios:
    maxItems: 1
    description: The GPIO that enables the speakers

  hp-ctl-gpios:
    maxItems: 1
    description: The GPIO that controls the headphones

  hp-det-gpios:
    maxItems: 1
    description: The GPIO that detects when headphones are plugged in


[1]: https://elixir.bootlin.com/linux/v7.0/source/Documentation/devicetree/=
bindings/sound/fsl-asoc-card.yaml#L133
>
> Rob

--
Thanks.
Binbin
