Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911272AEE4
	for <loongarch@lists.linux.dev>; Fri,  9 May 2025 01:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746753741; cv=none; b=GobJidwZomOOtIooKr41fvP7wxJ3rTHYNT8zOC+oel9S2PReIbnT1BQ38o6OjCz4a5+7xLt1jsPwoRv0fAIyQwnPYTN1iZL0ftZca0oNlMKeLICZ7rxbduAozUknXlqU9n2DsFZ77qBEqypAcskIwqvabidwgNcKsFzblha2Ymg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746753741; c=relaxed/simple;
	bh=K4PGaR75ciFMqUOd832iToV1R6IR+RU5ebaSxi/j4Qw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=biOE+1oeBqlAlpTxIjAhWjWfDTizDsIz9wF0F1PFfYo0XvTkPFxKdTaOS+vW4YoskNdYAT37OHqRyh82vLzGMEuPs1sqDmR4tObBkEga8XCQkHrlj9AyJbEm63sDlosnasysPS6dhAgNAM+CCQZzLqTyXyxD3zoYNOaoNpVMPgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D6KiV+in; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D6KiV+in"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5fbfa0a7d2cso2643993a12.1
        for <loongarch@lists.linux.dev>; Thu, 08 May 2025 18:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746753738; x=1747358538; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=urXW+BAEYO0CkFqXFETFIXtaSE/jSUmIp1lzCTyc1Ko=;
        b=D6KiV+incM83eFoQyk6254GtcJSw7EtsERd97qbKl6tR4ExennOVV8sUtT4WE8CMbf
         rTMsLT9N9QWlEfiFmRQPdh60M4SKV3DpkNgyxUb2YXzDhI1faC+HaaHJzkgPGs/9LIHk
         z5zEj5GPzipR3NyzEDbibEApo31XKaFDTX1YBaETGklOr/5rnjShY6YgGbI03VrvL7mM
         8zcD6jOQS7WkIfuBjL6gfXcc7U/Wi836Dh7ADcrOXpiv1HHtAzFg/5ORFYYsLNhNflZj
         jv3DBPJQxzzQleFg+mUF5YaB3I6gXI1e/y+Toq5DkCgkjKB++4dZUXyKmhrL+n9H6B4H
         WNzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746753738; x=1747358538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=urXW+BAEYO0CkFqXFETFIXtaSE/jSUmIp1lzCTyc1Ko=;
        b=Fo4zcF6OG7cpf05f9EdDlwkt4Ioon7MFXI+0d8I4dFqwG8RZLZj7ejM9H+TaEfRXSx
         L7mUvD8jASlulCwJbVodAibBSmkF5OcvR6ZxEebfdlOuGX3l7ZFC4b9GAjKTIAOhdgp0
         xIlNSPwZ4tXSMFswew0IvdGSeXCYAChr3x8bHXTHcCaDLSoWk1WA9kRrL7gAvm2MArY5
         Jm//nDF6WcYhIw5h02Hbmw+JexYXxiNqVusZou8EntjFnr/Bw4kMYCmueFSpRHIvArfq
         VlUUQwgt2RmxVCkHP6/89F/vLagHy9BsBM+5Y7hJOsSrKPSmfEWs1OE10jn+zANs+WQs
         HxVg==
X-Forwarded-Encrypted: i=1; AJvYcCWqyd7RXBTG5nkGyW5TiHrD/rmEYf/vyvd4NBbcZgabSG6ebXbRqUDZAYIKH4axWSxU1P8/G27ts1U=@lists.linux.dev
X-Gm-Message-State: AOJu0YwKdU9+68BIZaSiAur4UOmaEedsuHYckwwZ8WyzJoCAfSk6rdAG
	fZZ2n58zvznq3z01kdIqQCedA0nmF3+HzKJBlcor7XvRglFP6NugQOYAoQCVhOg7BC2b/YiiPcb
	yiyJOuo6XOXsSIUB+vAEATNTPTjw=
X-Gm-Gg: ASbGncsBuf+RGjMwpkMJx7Czz0oF3p0jScg7VsvJd2GD/ddBtzl4HLcPhMX+jJT0Xn7
	2rWLVxBtgllT11euQF2C9ofXmygUrKHZNgxDZgTL7j74tuc8jQoCJxEoHOub4u1ezcuwcRIqPmp
	7jYYitUh+IweuXXH+GrButDfg=
X-Google-Smtp-Source: AGHT+IG2yYw5OGqGhpOyx+XnDgtzOgA6aRoQHB5oRpX+l9WDFgc4JXXQWpqa2bxCVpEseQx7FJIg89wUOdn5bAAsT6g=
X-Received: by 2002:a17:907:a08b:b0:acb:5583:6fe0 with SMTP id
 a640c23a62f3a-ad218f46a45mr159357766b.15.1746753737638; Thu, 08 May 2025
 18:22:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1746581751.git.zhoubinbin@loongson.cn> <9b5a416143d5d5da7084f3a868cf01e6827cd653.1746581751.git.zhoubinbin@loongson.cn>
 <20250508-snagged-amber-432ed9bf3d41@spud>
In-Reply-To: <20250508-snagged-amber-432ed9bf3d41@spud>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Fri, 9 May 2025 09:22:04 +0800
X-Gm-Features: AX0GCFszpYExKXqggR86Q3nXf_ADQFMcMy3VvuQnohu3_YCcAHHZlnBuOYM2quk
Message-ID: <CAMpQs4LXvdd-=r15t2Fbm1xjQKBp8nvxQMR=UU7n0bXHS3MDHQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: mmc: Add Loongson-2K SD/SDIO/eMMC
 controller binding
To: Conor Dooley <conor@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor:

Thanks for your review.

On Thu, May 8, 2025 at 11:01=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Wed, May 07, 2025 at 03:28:05PM +0800, Binbin Zhou wrote:
> > Add the Loongson-2K SoC's SD/SDIO/eMMC controller binding with DT schem=
a
> > format using json-schema.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  .../bindings/mmc/loongson,ls2k-mmc.yaml       | 69 +++++++++++++++++++
> >  MAINTAINERS                                   |  6 ++
> >  2 files changed, 75 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mmc/loongson,ls2k=
-mmc.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/mmc/loongson,ls2k-mmc.ya=
ml b/Documentation/devicetree/bindings/mmc/loongson,ls2k-mmc.yaml
> > new file mode 100644
> > index 000000000000..97a0853399f1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mmc/loongson,ls2k-mmc.yaml
> > @@ -0,0 +1,69 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mmc/loongson,ls2k-mmc.yaml#
>
> Filename matching a compatible please.
> Otherwise this looks okay to me.

Yes, I forgot about this point, it will be renamed to
loongson,ls2k0500-mmc.yaml.

>
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: The SD/SDIO/eMMC host controller for Loongson-2K family SoCs
> > +
> > +description:
> > +  The MMC host controller on the Loongson-2K0500/2K1000 (using an exte=
rnally
> > +  shared apbdma controller) provides the SD and SDIO device interfaces=
.
> > +
> > +maintainers:
> > +  - Binbin Zhou <zhoubinbin@loongson.cn>
> > +
> > +allOf:
> > +  - $ref: mmc-controller.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - loongson,ls2k0500-mmc
> > +      - loongson,ls2k1000-mmc
> > +
> > +  reg:
> > +    items:
> > +      - description: Loongson-2K MMC controller registers.
> > +      - description: APB DMA config register for Loongson-2K MMC contr=
oller.
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  dmas:
> > +    maxItems: 1
> > +
> > +  dma-names:
> > +    const: rx-tx
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - dmas
> > +  - dma-names
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/clock/loongson,ls2k-clk.h>
> > +
> > +    mmc@1fe2c000 {
> > +        compatible =3D "loongson,ls2k1000-mmc";
> > +        reg =3D <0x1fe2c000 0x68>,
> > +              <0x1fe00438 0x8>;
> > +        interrupt-parent =3D <&liointc0>;
> > +        interrupts =3D <31 IRQ_TYPE_LEVEL_HIGH>;
> > +        clocks =3D <&clk LOONGSON2_APB_CLK>;
> > +        dmas =3D <&apbdma1 0>;
> > +        dma-names =3D "rx-tx";
> > +        bus-width =3D <4>;
> > +        cd-gpios =3D <&gpio0 22 GPIO_ACTIVE_LOW>;
> > +    };
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 96b827049501..5bf74aa63299 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -13935,6 +13935,12 @@ S:   Maintained
> >  F:   Documentation/devicetree/bindings/hwinfo/loongson,ls2k-chipid.yam=
l
> >  F:   drivers/soc/loongson/loongson2_guts.c
> >
> > +LOONGSON-2 SOC SERIES MMC/SD/SDIO CONTROLLER DRIVER
> > +M:   Binbin Zhou <zhoubinbin@loongson.cn>
> > +L:   linux-mmc@vger.kernel.org
> > +S:   Maintained
> > +F:   Documentation/devicetree/bindings/mmc/loongson,ls2k-mmc.yaml
> > +
> >  LOONGSON-2 SOC SERIES PM DRIVER
> >  M:   Yinbo Zhu <zhuyinbo@loongson.cn>
> >  L:   linux-pm@vger.kernel.org
> > --
> > 2.47.1
> >

--
Thanks.
Binbin
