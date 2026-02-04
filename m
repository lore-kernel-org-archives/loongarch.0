Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA8D81724
	for <loongarch@lists.linux.dev>; Wed,  4 Feb 2026 01:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770168303; cv=pass; b=m21oc7bUDy75NVcCjL7OeK/S5arT03JQI7CcPrCv/H/5bGwjq9a5SIDWadmeZq6LyfXwUfP1UVo5M5Zcjim0SMquQx58Ew5TcS9/QtiQGdEh8HE3ik+FcyCIN2SAmA3C0UweHFpp5x0ehy/bX3VK6n6937rK49CdQZKumk/o5qA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770168303; c=relaxed/simple;
	bh=/+f2suc9LFtxuDNlXH100F4yN30vJg9HdtU9fyXKPzs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PaLNrh66mmjusMSSO1iGJT01VLlOC8EnXLSBHk90DxT+fN8GOd3EP6Eq+zIfU47N52voQhddHnrTFcktuA35jDr/DsiPoMcEQvgTsR3k9NMWSeMAlkuyZGCV91aLiUByx387FHdKM3RUN/w+7oP9JIVspWZzH0zv2kaFzvL6ZcM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iczzzoSr; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iczzzoSr"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-658381b28e8so8728314a12.0
        for <loongarch@lists.linux.dev>; Tue, 03 Feb 2026 17:25:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770168300; cv=none;
        d=google.com; s=arc-20240605;
        b=T1wkuCZ1e72Y1R8MEzHcyfEMR19UOTErKkWZ72Tpa92UlqA4NNiu08d9pkMB8jro4N
         ivyHOsbu/7JEhn5ZM2Qk8WD5suKGXDMYb5/Y1+HvbRjykWfonvMucDufQvSxDEBOBVEt
         iEbP1rYBxJbimq9AAN/MuLPiefGOk+6qZRla2xzDyW7NuPbZj/kzq1Z53K2w0NcppcXx
         7DKEuvd6rskyum8yqmJ22skZVo5S8qqerayvt96iGTWGAGLNdf0xTdxLPH4udeqMV9oC
         Ac7bVt8cTj3zB2zM4MnkFx3HQDMqHTQQYnB0TH0W2j67PA72PHNl3DfRoD31+1hT6mdy
         NOpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BSQbsRTvBz9zOZSX4Hu3wQKCkFjocGyQDMtXx0/BobU=;
        fh=4aeTZV0gQo3TuCgvcAnzxS90O+Ov0ydGexNtQnTZRIQ=;
        b=XVbwTAlN6sa+GRoXDyisb/8+cSU9vDgwsM2B1L2bqOZy1rn30AyVs1F8/gix9nrMOR
         +J/Z7/dEntR7C4hik6vDGjyctB4ZGFFCESVlTgTu5LatLkXyAs2jUrBVeiEyPcIYRSJN
         g/S5eMcxmQXuxhMnLjNi6sqpT/S8qZWyBMfMYfl1oEs4ZzckQZUFjHwmB4jxbwTqiI81
         9rtljKNl/jqscYohieZxbK6qqIHOoWGMGBRllmMs8endzIL6hXGqHobweFv8/CyYVK4K
         wfkuOO7FjYyu7YbCpGV3jF53yvakhB4YkRtsdj5PdIP9s6PmKHUZn+XdYTxXa5bDekiV
         fxYQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770168300; x=1770773100; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BSQbsRTvBz9zOZSX4Hu3wQKCkFjocGyQDMtXx0/BobU=;
        b=iczzzoSrnkFjqAiekZ0lqxVCfIEPPsmc3oYSKXQpMqabKE0e7KBSqn/nKDReV9Rocc
         JMqJthhML/C6nNd9U5LYLc1ExGgHQ+fXDZ7wAOqJGW534X6HH9iyxIRDeOlMgTw4XB51
         key66fPIAjR85QMncngZIqYXBNz2UYtC5w4U9Mdv73SZvryeKD+8T13G79MEbjFbM0LD
         FxYHzy6/ethbjx/kbSGt8W1tH3vxgkZ7KtvUd7riuEOd6Nl366bEmdqoJths9ZUCBtqS
         DIT7PSERVDW4bB6MKLoawFSQmwfajP4RPetZTONysyM0CqZuxYEW5wb7EOx+WMX1wnmg
         RGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770168300; x=1770773100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BSQbsRTvBz9zOZSX4Hu3wQKCkFjocGyQDMtXx0/BobU=;
        b=UHAoULDp5dxXNEJ2yNSoYbgXE2un8L2OyuMk7KsQOLuDuVzAmmQzvnwfD4mQJbb1Al
         +OFFLT9wl3Knahi7E18sWplu5ZxaQ2gi3oVWOJEUxW1viYfBug80bjtUeZi0VrCbdsv9
         7yvPChHeUWoJWOqCYaJVA0s0lmbDcCVoxxNUVKYbq/ePjDpSwf1rn8UTmEFp5DDQymRN
         p0F3mrwYsY9gt9edZMOmE0Lvg1ulgFpo/bq28yyrVazsKXVV/k0NCgLaradtmXcZQAAX
         YqUTmVPgCWo0zqQ45WjgXN64bpJL3PrqlFzQ52WNCi5mgPKA2zLVkyzwG4ik5uHqRxZ3
         oqiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtL2dadQiLtzSc3KDEv3GNLyq08s0nvxdAUzubGcvFXZFQ2j8zI+DKW+EU1jUhIsBAnNV4kxID7MY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxlVeNytXXSnXAoAzCP7fu5b5av45xbJRYtyTBDJOwAjeuBWeLK
	jMjl4g6BVDNdGpK68zrr+BwVW2eCpAEpprZ8bo/kjoYmc+o8fIHCwneihIv815kXDlCWMgR86/u
	g0aBbZiJunhWoPylQMsqoTTUw6L92BOY=
X-Gm-Gg: AZuq6aIGpu3inYhYzAucPUwPj1tu+166DfaC5uGf/+t9r0lbKRDtDpJpOLFT/MbKD8b
	zChGh+w1/0/B0IQ0vDtUSMVQU2u6EQWbOs8JYA8hPKM0DFx84Tt5FlkYfi2807HzYOAwq+tMpJR
	jpUEHxX2W7BCMqZc/wl/jp9XNJVK7mcqJXXgVZhvknk715pLjfyBP+5TQXpuVi2jqJs2g6j7Xar
	5xOdPdoYAPpzxAyM3/JJJR9210Zi86z0lXCdkD2KwQau3TTFAtshtZxZa4BWzm76z/GVTQ=
X-Received: by 2002:a05:6402:1d4b:b0:655:a20a:a258 with SMTP id
 4fb4d7f45d1cf-65949abd3femr975527a12.10.1770168299500; Tue, 03 Feb 2026
 17:24:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1770119693.git.zhoubinbin@loongson.cn> <7d6bb6ddc9b2d7c760fa0dcef30123f700e47f77.1770119693.git.zhoubinbin@loongson.cn>
 <aYJT3B/vgjklDN46@lizhi-Precision-Tower-5810>
In-Reply-To: <aYJT3B/vgjklDN46@lizhi-Precision-Tower-5810>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 4 Feb 2026 09:24:46 +0800
X-Gm-Features: AZwV_Qg7lTZAlTII9Lc1LaPvKwjyIxSgjAYbgx3n8Pz_6fYcbnbBi3dEw_krDVw
Message-ID: <CAMpQs4+jT8kCXSKta2QfQyhek5sC45yqnW=0f_Ap-8HnynbSOg@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: dmaengine: Add Loongson Multi-Channel
 DMA controller
To: Frank Li <Frank.li@nxp.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org, 
	Xiaochuang Mao <maoxiaochuan@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	Keguang Zhang <keguang.zhang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Frank:

Thanks for your reply.

On Wed, Feb 4, 2026 at 4:00=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Tue, Feb 03, 2026 at 08:30:11PM +0800, Binbin Zhou wrote:
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
> > index 000000000000..d5316885ca85
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
> > +additionalProperties: false
>
> use
>         unevaluatedProperties: false

Yes, that should be it.
>
> because there are $ref: dma-controller.yaml#
>
> Frank
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
> > index 66807104af63..16fe66bebac1 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -14771,10 +14771,11 @@ S:  Maintained
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
> > 2.47.3
> >

--=20
Thanks.
Binbin
