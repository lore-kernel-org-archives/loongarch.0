Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0A174C14
	for <loongarch@lists.linux.dev>; Tue, 10 Feb 2026 06:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770703347; cv=pass; b=T1EJr5+/AH36vvBSGKVUQhiM7N1r9nxwITZMtYP3C02/v35Is3QyLV+hQnAmNOyjCqLvrWuPTF3Y69C+MJqJfznujDZthHxhO8rRhK3grE/a8B3KzuWv2d3+PArOvjBtWAcWHKws2+TKlhZ6hEjvF1fKLK2OPdhmR9BNoc3B7Uw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770703347; c=relaxed/simple;
	bh=SBGRUJE27Sh9oreSO41Rbst3WAb+KnZAYy13PKJYLsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SOIRFG3E+jP1PCySWq3S4J3OvY/Zvl2LILqm3CRYQeCOnTZ1lzEbMG/9SJDl+S5svoUO6UgdDavhbbyg1v5pQkPIkMV0jAxU+SbR59U7WCQvnMZw09HvWpLJSIM+mLTMyvUMGumSumYx+bJb+2/ciXI2q4+XXEy8E2Glua6NCrM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gpu6TW+X; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gpu6TW+X"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b883787268fso591847966b.3
        for <loongarch@lists.linux.dev>; Mon, 09 Feb 2026 22:02:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770703345; cv=none;
        d=google.com; s=arc-20240605;
        b=E9sX3+ZihqXokte5GaKYA+bkY4M7LOUv9oB2HrTcEQmzup47aYJYDy73uLyVg0LZTd
         zlT9v7rHZDjekHremDC266f4SALdhrdib+I0pugOv2woBSWsOmhSZfQZRs6Od4Drr45N
         9Dw0g4GW9ID2Oce50CQYnpQx3URzoeC9ucZvEHac5ppbeER8SbCMGWQEvUS2zS76T51F
         aSkd+7EUQ6XI3l3FKyX6zPRAR4i7PUO9CceUzAZYsWkLQP/eixy6r/ORw3DvRcaRiedh
         Sc8ZyRmniuEqh98WfO8rnETl+CcASEOW4/+lSIzitRo9qbJ/Fs4w7Fb4WW1vlmXz3pz0
         hWMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wdfQoNjE0A1x2BNxyqiUYamnhnBwjzLKcZCZB7uzUFA=;
        fh=WxZ5dk9tTPEM2gv3bUfxGQ8BCUwweJOH9tn+ri9OaRQ=;
        b=Tox4NTNYOiup2b+Tza6a0/10pys0EE8J9Y3EcSKjcWuamRoRAZF7vVLWc1BBmXOuf9
         FkgI5k2XkfUOIXbteNj33/J6PN0n7Cbf1S1TzHKK3JcjWguku3v9JiC0wGC+kq4JaGGJ
         IH62yoY8QWQmlKbXpyu+tzbRE7UHGPZKQ9nuDNJS5yG/aWlrLPUUJ9Grx5BRgjKFjD4p
         t+tLAnjUPt8i71JYIcI0PD1F1iODeJJyJSyaHBXzUx3uk78OdYORc7QRbl92gdYD3S4l
         YGEqKDi51ppolgZJYQ4jK1prz6LUD50Q7k7yFz2vClyLYwdV11RGGFaBf5UE71bb3tsW
         X+MQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770703345; x=1771308145; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wdfQoNjE0A1x2BNxyqiUYamnhnBwjzLKcZCZB7uzUFA=;
        b=Gpu6TW+XAAEaA+mKJIugdK3A3UbmrlgN6ABVcyX5MaC5hN1Tw6rojdYtEAQFjTzCn4
         Eyb5lBXp64c49cM2cyoRmDy48shOtyh2wDewgRZ3Ucn5VPbpmze9er7ST+gnPUr7LvSW
         4ojdiydczmMXNPS26q6AfxAToddhyraBM1S9/qy4x3Aso2wo7xOLjoUw1PmAm9o5F0ck
         QXIiE4gkxejfZkrnEQF1VGHnxUbmlJbvMY01ytH1QfK/p83/7XahQQRViV9kvwoQvojD
         AYEU+kBuwoutXSOghXXEIz9EtH7zafEjhYql65j7zz7bkj422Q93BcerLstGefQ0EZnu
         +0JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770703345; x=1771308145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wdfQoNjE0A1x2BNxyqiUYamnhnBwjzLKcZCZB7uzUFA=;
        b=oMkdfDoWARZwppzVhE6PG3ZK5hqn5za79cM+2Mq6s38vI6RxuGXTL9/QcJpvcljxiG
         shPuGz1WnWmp3DFvcxmh6a1/jj6abFov7/Y/gaQPvuPDSOSIaC8Y3pFsfZcFh7tRivts
         i/OvjxkWkDA2X+ntrU3h5RIeBtEirZR9O/gHHKtIOzQPIgmztvSCGZfzPAm+gMIF8VSU
         cnbcZwhAvzoXTtXJfR70qPqaKltG585CXPxPb6KzLbprc0JJZjo3PkND5qoGWIr1e8n1
         lHFAaRGtwwgw0vD/2uraquMwZC3uaMOGjODRvLY01WhLzESN8gYFIFmFMDpLMOTA9l3u
         muig==
X-Forwarded-Encrypted: i=1; AJvYcCU8S7mczKCTUgCotUEZDwZKtWKVv4aujf5EwEDginXF4ECanQybIbOXfBxdPJVWCt3NdWiHPkwBreU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwYsO1BH7YrwnbYcdJvDbHutKAQrJ9E4EOt0ROBp3FnHqs+LCvI
	OJCtj2gxdp7oQklfH/1/d2dYy2vpp/8ONfEUE8tl00xjd+qxCBf6BRL2YahGUvOKUj0339IlMlu
	yciBFM9yyUFurMBwg3iAnSPc3f0NjyR0=
X-Gm-Gg: AZuq6aJ4WgJtgqo3LVv1hHdBuV9LCt25aZeOwtUKGk5GNtAkjyqAv0HhRMFoAyIfGVe
	HJv16jn+xYomXhT+9IdL5b+84LDYE/J4bh6lw70SeoC8L75B2jVr4MIvsf1oGpPWSjA8DuMmxzy
	e1+tF0Y9rgwTkCplMSl0EuQ9eJ2jX8AV+oAW5jWTiBlyKA+bC4kUfWdxvq8pI9uXaxU9Dp0R0ek
	6NvuFZuofkibBOSRLBlKM4mZXEfbRzn51x7WHkuStl2vSVtmY7sipD6sqQs/J1YcB2apauFyuOm
	0Hrs/3pO
X-Received: by 2002:a17:907:3dac:b0:b87:965:9078 with SMTP id
 a640c23a62f3a-b8edf14c39emr680666066b.7.1770703344240; Mon, 09 Feb 2026
 22:02:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1770605931.git.zhoubinbin@loongson.cn> <36cc977f0746095196354b631f0b158365208a0e.1770605931.git.zhoubinbin@loongson.cn>
 <20260210030346.GA2406064-robh@kernel.org>
In-Reply-To: <20260210030346.GA2406064-robh@kernel.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 10 Feb 2026 14:02:11 +0800
X-Gm-Features: AZwV_QiqIfn7ZPx0x3V31tbQ_jX8n-lqXvq0szv7fUMgSdTmEq3QSZCxI0OoBUg
Message-ID: <CAMpQs4JcnkmVM6B2rCQnFsdnMs9XnoV3EwO+0yA9XdXvVQg8cQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: dmaengine: Add Loongson Multi-Channel
 DMA controller
To: Rob Herring <robh@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	dmaengine@vger.kernel.org, Xiaochuang Mao <maoxiaochuan@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, Keguang Zhang <keguang.zhang@gmail.com>, 
	linux-mips@vger.kernel.org, jeffbai@aosc.io
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob:

Thanks for your reply.

On Tue, Feb 10, 2026 at 11:03=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Mon, Feb 09, 2026 at 11:04:20AM +0800, Binbin Zhou wrote:
> > The Loongson-2K0300/Loongson-2K3000 have built-in multi-channel DMA
> > controllers, which are similar except for some of the register offsets
> > and number of channels.
> >
> > Obviously, this is quite different from the APB DMA controller used in
> > the Loongson-2K0500/Loongson-2K1000, such as the latter being a
> > single-channel DMA controller.
> >
> > To avoid cluttering a single dt-binding file, add a new yaml file.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  .../bindings/dma/loongson,ls2k0300-dma.yaml   | 78 +++++++++++++++++++
> >  MAINTAINERS                                   |  3 +-
> >  2 files changed, 80 insertions(+), 1 deletion(-)
> >  create mode 100644 Documentation/devicetree/bindings/dma/loongson,ls2k=
0300-dma.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/dma/loongson,ls2k0300-dm=
a.yaml b/Documentation/devicetree/bindings/dma/loongson,ls2k0300-dma.yaml
> > new file mode 100644
> > index 000000000000..77e5df47ec01
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/dma/loongson,ls2k0300-dma.yaml
> > @@ -0,0 +1,78 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/dma/loongson,ls2k0300-dma.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Looongson-2 Multi-Channel DMA controller
> > +
> > +description:
> > +  The Loongson-2 Multi-Channel DMA controller is used for transferring=
 data
> > +  between system memory and the peripherals on the APB bus.
> > +
> > +maintainers:
> > +  - Binbin Zhou <zhoubinbin@loongson.cn>
> > +
> > +allOf:
> > +  - $ref: dma-controller.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - loongson,ls2k0300-dma
> > +      - loongson,ls2k3000-dma
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    minItems: 4
> > +    maxItems: 8
>
> I'm assuming this is 1 interrupt per channel? If so, add a description
> saying that.

Yes. this part will be rewritten as:

  interrupts:
    description:
      Should contain all of the per-channel DMA interrupts in ascending ord=
er
      with respect to the DMA channel index.
    minItems: 4
    maxItems: 8

>
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  '#dma-cells':
> > +    const: 2
> > +    description: |
> > +      DMA request from clients consists of 2 cells:
> > +        1. Channel index
> > +        2. Transfer request factor number, If no transfer factor, use =
0.
> > +           The number is SoC-specific, and this should be specified wi=
th
> > +           relation to the device to use the DMA controller.
> > +
> > +  dma-channels:
> > +    enum: [4, 8]
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - '#dma-cells'
> > +  - dma-channels
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/clock/loongson,ls2k-clk.h>
> > +
> > +    dma-controller@1612c000 {
> > +        compatible =3D "loongson,ls2k0300-dma";
> > +        reg =3D <0x1612c000 0xff>;
> > +        interrupt-parent =3D <&liointc0>;
> > +        interrupts =3D <23 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <24 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <25 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <26 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <27 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <28 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <29 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <30 IRQ_TYPE_LEVEL_HIGH>;
> > +        clocks =3D <&clk LS2K0300_CLK_APB_GATE>;
> > +        #dma-cells =3D <2>;
> > +        dma-channels =3D <8>;
> > +    };
> > +...
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 27f77b68d596..d3cb541aee2a 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -14772,10 +14772,11 @@ S:  Maintained
> >  F:   Documentation/devicetree/bindings/gpio/loongson,ls-gpio.yaml
> >  F:   drivers/gpio/gpio-loongson-64bit.c
> >
> > -LOONGSON-2 APB DMA DRIVER
> > +LOONGSON-2 DMA DRIVER
> >  M:   Binbin Zhou <zhoubinbin@loongson.cn>
> >  L:   dmaengine@vger.kernel.org
> >  S:   Maintained
> > +F:   Documentation/devicetree/bindings/dma/loongson,ls2k0300-dma.yaml
> >  F:   Documentation/devicetree/bindings/dma/loongson,ls2x-apbdma.yaml
> >  F:   drivers/dma/loongson/loongson2-apb-dma.c
> >
> > --
> > 2.52.0
> >

--=20
Thanks.
Binbin
