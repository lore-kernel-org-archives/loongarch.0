Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BE9251792
	for <loongarch@lists.linux.dev>; Wed, 23 Jul 2025 06:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753253819; cv=none; b=J0EZmegRuRo102U/i9C1JjfVW/8ZEmgMUZe9qrjqewWWQRT6piT/obulTqG9Qbb0OdXqhgUj3cQEfkAW3nGhMXp55oztUyhkBnLQQLJp8X3U6A2q2tlM0gLRmr7zo5JqdiyT0SIVFnviD/irW9StolupLOj2TmhkEFkKGYPHmpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753253819; c=relaxed/simple;
	bh=xdtI84WqemnjJgMeGyNiVI1yA4JLbAfIPNi/WDgsKYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TUs7S37+m8qHri+GVqhu0IEIfZpzEyAEsRKDBYtN7KbWI7swinaGBNJa5YPjXmGbaXBVeh31ravtB4sc1x7Bt3ivAWYu8nHoHr6+2bCNrY/PYxMYgETuly1kEruwWqpbmPByoH55OebrJIxJBafTjT7oh2hf5SdU5oHrPRZWagg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=guRYAP4f; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="guRYAP4f"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ae0b2ead33cso110002966b.0
        for <loongarch@lists.linux.dev>; Tue, 22 Jul 2025 23:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753253816; x=1753858616; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzGs50sMtqAdEdsyGgv1T8F/fASfIs0YpLyjWXfuibc=;
        b=guRYAP4fOCVIjt+n1QNb1+1Xcn82wWbbBQ8lvUXFQFzHv6oeJfddcecfAdklgTpL5g
         ephj/ik72VUNpxc07oSYiADY1k39Q3Vlef589yRlpl3tLcR+riWb1W6up4feB3rlXWb8
         RMlIbfcZrNcjaBo5MEqCiFSjj9lMPM1RTQni7WFVdDmv/Yt4Cvu9itam9RGsl81afCQn
         qELVirNZrEeVtvZ8sZ+wAj/h4MqruZ8Jkverzr2y9Lzr66z4Q6FPdPNkmi9OV3xNkcx5
         ufCYKH/XYpouHLoCmQA4V+zws7x1YIvuF/bukGBjEarmT9ErRASqYZvW0d7R1mWV/VBl
         vbyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753253816; x=1753858616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mzGs50sMtqAdEdsyGgv1T8F/fASfIs0YpLyjWXfuibc=;
        b=AH/4rG6cUbMGzUAxNXMYjywDpmaFmKyNguPjkON96EFZ1qs8rEccRcJCZbd4aF7HCR
         YdnA+zGzExs4PwINLEQ62HGTgzQi83ltd1EwAcKyTSKBs2TDgmFwb3fvReZ/Jl/QxL/2
         tLYvWEP+bMHHNQUBW+PhH0AJAASZCQugzABrn+aJfcwr1BLpZaCqr5riyYVvjLM/CmK7
         v6eJzuBbQl9R7b/ezAetCAusY6DsM7F1w0+KIbu5WaVU65YI7WSvLQ6b1ZPcPdxyqcVy
         58xR/k1rgeLneUmfNjmOI8dJR/E6aMetrUQNqbssN+mFmjyMnl9u/TFB7C89oGmPtU5+
         cv2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUN/bkEawlI3PYgnZWhZC6sEDDRWfrW35LTwzgl17XhRgvNfnOqZLMg3mzBhsDweDRy9S9P0dEYoeA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4/ieVsgKSUFM+8RGhZCrMwzjItVp+RDz0JT7MN6ru9295N+kx
	9nS5mFCHa0aTVOQkprzRHZ2ukxZBlOzMk9ck8i7xKuioQU7ph8GrAWWqM07q15tn4eiYLb80WNg
	qviI5oOhzXxWb6qm9X+DnnH6P5O0M0zM=
X-Gm-Gg: ASbGncszG1MLcGUmGNY0n8BCs4C481WYaU9oAJMQsbBdyYwMaSCgEhLeCSy1p75+RP3
	O8vtX5DlRzJyPeqfzPW2YD5v5VGoDdJJU83p6Z6KwSAkTuCW4Ke/7uKnMzt9EX11EXfyiExuVsA
	Z1YfGYJpzZVSyQOJCgeitGlxltXJBo0WFteC5NuCOqupBQJSTO3Ce5MUFVaYcnPuqi4PciBfZ3G
	Xe5PRsX
X-Google-Smtp-Source: AGHT+IHtfZqjBEsPm3jiweUvUgdfmqxEA1/NrYjUcBbEteu7UTNuOkN8so+Y9soZLgns8FwUWGBF/PDOw0pVHGFgS2Q=
X-Received: by 2002:a17:907:9704:b0:acb:37ae:619c with SMTP id
 a640c23a62f3a-af2f48b0b3fmr184201766b.15.1753253815516; Tue, 22 Jul 2025
 23:56:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1753166096.git.zhoubinbin@loongson.cn> <ed625518c752738cb7e24f6d4b7fb9b62a609880.1753166096.git.zhoubinbin@loongson.cn>
 <20250723045322.GA1226341-robh@kernel.org>
In-Reply-To: <20250723045322.GA1226341-robh@kernel.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 23 Jul 2025 14:56:43 +0800
X-Gm-Features: Ac12FXwj_V_rXm0G-f1xcp_U8ADbgodmKUhlQGp8z4NF7NnsLXFcURgUjYOstVM
Message-ID: <CAMpQs4K2saB_Cyn03btZdc4ePa-U6G2ots3AtiNoy8UHrBY7OA@mail.gmail.com>
Subject: Re: [PATCH v1 7/8] dt-bindings: mtd: loongson,ls1b-nand-controller:
 Document the Loongson-2K1000 NAND controller
To: Rob Herring <robh@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob:

Thanks for your review.

On Wed, Jul 23, 2025 at 12:53=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Tue, Jul 22, 2025 at 05:11:06PM +0800, Binbin Zhou wrote:
> > Add new compatible for the Loongson-2K NAND controller used for
> > Loongson-2K1000 SoC.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  .../mtd/loongson,ls1b-nand-controller.yaml    | 58 +++++++++++++++++--
> >  1 file changed, 54 insertions(+), 4 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/mtd/loongson,ls1b-nand-c=
ontroller.yaml b/Documentation/devicetree/bindings/mtd/loongson,ls1b-nand-c=
ontroller.yaml
> > index 4ec2b5d1e89d..07a0d9b40fdd 100644
> > --- a/Documentation/devicetree/bindings/mtd/loongson,ls1b-nand-controll=
er.yaml
> > +++ b/Documentation/devicetree/bindings/mtd/loongson,ls1b-nand-controll=
er.yaml
> > @@ -26,18 +26,19 @@ properties:
> >            - loongson,ls1b-nand-controller
> >            - loongson,ls1c-nand-controller
> >            - loongson,ls2k0500-nand-controller
> > +          - loongson,ls2k1000-nand-controller
> >        - items:
> >            - enum:
> >                - loongson,ls1a-nand-controller
> >            - const: loongson,ls1b-nand-controller
> >
> >    reg:
> > -    maxItems: 2
> > +    minItems: 2
> > +    maxItems: 3
> >
> >    reg-names:
> > -    items:
> > -      - const: nand
> > -      - const: nand-dma
>
> Keep the list and add dma-config here and 'minItems: 2'

OK, It will be rewritten as follows:

  reg-names:
    minItems: 2
    items:
      - const: nand
      - const: nand-dma
      - const: dma-config

>
> > +    minItems: 2
> > +    maxItems: 3
> >
> >    dmas:
> >      maxItems: 1
> > @@ -54,6 +55,32 @@ required:
> >
> >  unevaluatedProperties: false
> >
> > +if:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        enum:
> > +          - loongson,ls2k1000-nand-controller
> > +
> > +then:
> > +  properties:
> > +    reg:
> > +      minItems: 3
> > +    reg-names:
> > +      items:
> > +        - const: nand
> > +        - const: nand-dma
> > +        - const: dma-config
>
> And just 'minItems: 3' here

OK...
>
> > +
> > +else:
> > +  properties:
> > +    reg:
> > +      maxItems: 2
> > +    reg-names:
> > +      items:
> > +        - const: nand
> > +        - const: nand-dma
>
> And 'maxItems: 2' here.

OK...
>
> > +
> >  examples:
> >    - |
> >      nand-controller@1fe78000 {
> > @@ -72,3 +99,26 @@ examples:
> >              nand-ecc-algo =3D "hamming";
> >          };
> >      };
> > +
> > +  - |
> > +    nand-controller@1fe26000 {
> > +        compatible =3D "loongson,ls2k1000-nand-controller";
> > +        reg =3D <0x1fe26000 0x24>,
> > +              <0x1fe26040 0x4>,
> > +              <0x1fe00438 0x8>;
> > +        reg-names =3D "nand", "nand-dma", "dma-config";
> > +        dmas =3D <&apbdma0 0>;
> > +        dma-names =3D "rxtx";
> > +
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        nand@0 {
> > +            reg =3D <0>;
> > +            label =3D "ls2k1000-nand";
> > +            nand-use-soft-ecc-engine;
> > +            nand-ecc-algo =3D "bch";
> > +            nand-ecc-strength =3D <8>;
> > +            nand-ecc-step-size =3D <512>;
> > +        };
> > +    };
> > --
> > 2.47.3
> >

--
Thanks.
Binbin
