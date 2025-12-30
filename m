Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B558C2367A2
	for <loongarch@lists.linux.dev>; Tue, 30 Dec 2025 02:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767063353; cv=none; b=jkYixfth9GbMUhB0Y/PB31sMXTsYfb2hYKLpVvcjaE+2AkWor7smzgnhdqE5YE8LchPNhjBywyILvVibpjErox8RvKDrUAoQSwPQQWWeYtfe6WmnVp6NuOlR8Op+d54A+4xn+Es+3gkSRbuRL9/djBuiH/m3QkxVsgb3R8udKW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767063353; c=relaxed/simple;
	bh=nI9lYB93lJ43d2hyzZESmgTMTNkXzdu6Ri+Yt22S1CE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cOwhKaZbHvTpHpbDJZtf1gTtJRugtsyZW7jqfZl+RhqVHElYytd5Kz1WViWQY5dgRl95kVOHMdpOl7ZnxcxbbF6pXudBL8xa5SzRCF0C/oXsmfvzhZRQY595mFxQRcpYi+KjFbL9L5n1l7/cNwD1LZusZ6EhZZtxE42uNlcxtUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JwZp7AV9; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JwZp7AV9"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b7a72874af1so1629314766b.3
        for <loongarch@lists.linux.dev>; Mon, 29 Dec 2025 18:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767063349; x=1767668149; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/kNhGdUnuIO1bhgisSgWZDQr0f9RTGWGoYzmIatRKg8=;
        b=JwZp7AV9Xk7gG1rTUJTB71nQJan+QlAgsAyJ1WESzRJX0tce/IMYg465uEsLRTT/5C
         IFqJlGmZTxHU+6b7F/JcXaayoUNg7IRyvkCbkkXqzkYEeTmU3GqDS4QRWK/MayFFst1t
         3YxSsAs9c/PvHtQoVpcBdTGnm1U4A8HPyFHAyoHwEoAYRuEv1Se2llTNrimPRrLAZH/K
         ome1uFD1M02Eu+7mUJ2cDVR1/ubyALmmWsioxBMFos+DMHT8Skx75rkttyGUVavmRiVF
         z/BaDn3WH/TesFMDXKHwN5uKEYjwLqsgJYtvwI9FpcPPO5+ydWWvdHsCJmGdZqblf5MU
         wgTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767063349; x=1767668149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/kNhGdUnuIO1bhgisSgWZDQr0f9RTGWGoYzmIatRKg8=;
        b=VroVA8LVdcoCpieXf4OrEkHJQZYxVJXFz1B3Z2JjrxWwOV+NGqifLylkQykhEAmwTB
         d225nVfBg7NnD1o6LrNPdqpFDcThuG4q8BhoJ3fAYnNgi7r2jOxGsxrEpnCbgMUytPTn
         6G0Owb06rFH33iva16RnRdCd54muX1sHI43idw2HodKakJwPu9VXk3omcmboaI+lGL0z
         z4dHV7lyZlJxMuvOu5PND7lQrdZN/AMmoa8Z96SPGx3fBeImGnLskjhhCjTrVbDHaxW3
         CcTbDn95yJdNQ5JhoVL5MEKTtw0DnKwDeahsHqUS/WJuDMpa2v36Vxd+CxezEzBe6SC+
         7Wjw==
X-Forwarded-Encrypted: i=1; AJvYcCXYTLIo3WWhw/kY6Om0xLtf5Dq1wXjm+0XT1YkQjoncGdHFfFPzooSb09/lcS4qbczGZUM2MXH0HWY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwJZR9AY5vv6WtrVtrvFH8cy8kXJbhwr0fhrn0O0kPTpzMA+ZVi
	Nhi7DGDkK1p68H28P7RzFd4BKHB2xQmmB69B1bKY55K/R11+aqKIRUrokC2Zx7j59YEvw6l9fvm
	/1TdN0odq7DVvd+Lmc6AukHB2yoOqKOA=
X-Gm-Gg: AY/fxX44hVdOdXYn3UfwxsndFM6ZdEhXhiZaduGyx9wRHPyQjBjYC4+MqqAS3LBdWVr
	KGrWTHQW5JJMCZ+ZStO1Q/WlflDzogKFcEDTVZrXVHYTXpKRNu0UW9fVkeB8kKijhf0zHNLZFFF
	IJDZH2Jduwcdf6rjLLbRsCW9MMmsxN/w1fTP0843hrPO0Bl8mtg77CrdsxfQ1vUiD8mBJ0GmWmP
	T4gz2YgutOWz+N3fac/IVvW/GkxjTzPyXDW2O6TtHWS9zVcXLf61npJaruDNXxZVSgBYz62j6s6
	4ohJx9Y=
X-Google-Smtp-Source: AGHT+IHo+pBaBCzyDYIzLFgf837wXULXmYcMXZA6Rr7xVRaNkkQw2wDtkIoKDJTswNkaCffTWGhU+gKpEOsF0eHdFM0=
X-Received: by 2002:a17:906:30d4:b0:b80:3fff:3369 with SMTP id
 a640c23a62f3a-b803fff3447mr2483722066b.48.1767063348733; Mon, 29 Dec 2025
 18:55:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1766037997.git.zhoubinbin@loongson.cn> <7a0df6f836e0ec7ddfe4d592c10259c87ef96e4f.1766037997.git.zhoubinbin@loongson.cn>
 <20251229234931.GA2804566-robh@kernel.org>
In-Reply-To: <20251229234931.GA2804566-robh@kernel.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 30 Dec 2025 10:55:36 +0800
X-Gm-Features: AQt7F2pU5FPG5eRc06lMZ-1hFwHy4kxm4WC16S0Cr_PnT-tAAbtXPVsOifFlPkE
Message-ID: <CAMpQs4+yh6=9bBufkuw9uAas1PEHj43QjW1fBFOHfc8+p4Gbpw@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] dt-bindings: interrupt-controller:
 loongson,pch-pic: Change to unevaluatedProperties
To: Rob Herring <robh@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Yao Zi <me@ziyao.cc>, 
	Huacai Chen <chenhuacai@loongson.cn>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob:

Thanks for your detailed review.

On Tue, Dec 30, 2025 at 7:49=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Fri, Dec 19, 2025 at 04:46:49PM +0800, Binbin Zhou wrote:
> > Change additionalProperties to unevaluatedProperties because it refs to
> > interrupt-controller.yaml.
> >
> > Fix below CHECK_DTBS warnings:
> > arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: interrupt-controller@1=
0000000 (loongson,pch-pic-1.0): '#address-cells' does not match any of the =
regexes: '^pinctrl-[0-9]+$'
> >         from schema $id: http://devicetree.org/schemas/interrupt-contro=
ller/loongson,pch-pic.yaml
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  .../interrupt-controller/loongson,pch-pic.yaml         | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/loo=
ngson,pch-pic.yaml b/Documentation/devicetree/bindings/interrupt-controller=
/loongson,pch-pic.yaml
> > index b7bc5cb1dff2..cf235ca57a2f 100644
> > --- a/Documentation/devicetree/bindings/interrupt-controller/loongson,p=
ch-pic.yaml
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,p=
ch-pic.yaml
> > @@ -14,6 +14,9 @@ description:
> >    transforming interrupts from on-chip devices into HyperTransport vec=
torized
> >    interrupts.
> >
> > +allOf:
> > +  - $ref: /schemas/interrupt-controller.yaml#
>
> This is not really needed because interrupt-controller.yaml is applied
> to all nodes named 'interrupt-controller', but fine to add.
>
> > +
> >  properties:
> >    compatible:
> >      const: loongson,pch-pic-1.0
> > @@ -34,14 +37,18 @@ properties:
> >    '#interrupt-cells':
> >      const: 2
> >
> > +  '#address-cells':
> > +    const: 0
> > +
>
> This part is the only change actually needed.

Except for this part, I'll remove any other unneeded changes.
>
> >  required:
> >    - compatible
> >    - reg
> >    - loongson,pic-base-vec
> >    - interrupt-controller
> >    - '#interrupt-cells'
> > +  - '#address-cells'
>
> Unless there's some guarantee that this node is *always* referenced by
> an interrupt-map property, then it's not really required. After all,
> presumably things worked without it.
>
> >
> > -additionalProperties: false
> > +unevaluatedProperties: false
>
> Also not needed.
>
> >
> >  examples:
> >    - |
> > @@ -50,6 +57,7 @@ examples:
> >        compatible =3D "loongson,pch-pic-1.0";
> >        reg =3D <0x10000000 0x400>;
> >        interrupt-controller;
> > +      #address-cells =3D <0>;
> >        #interrupt-cells =3D <2>;
> >        loongson,pic-base-vec =3D <64>;
> >        interrupt-parent =3D <&htvec>;
> > --
> > 2.47.3
> >

--=20
Thanks.
Binbin
