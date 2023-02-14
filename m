Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1556B15B7
	for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 12:40:57 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id c1so13344039edt.4
        for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 04:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H1RFf0S+LauH4t97A9Q1FiAiUoFreqXYpUT2qQSR1TQ=;
        b=n1BIx/4gI7lkixI4VskXa1oopYMTh2x6QS7kFJOUtozj9Xvk8B349TzwI/KuP9QX9h
         hiKwY/isB42BK/Q1vvzUpbDTOMd4d5sjSTystzFoxW2eHREBLzxl5e+NJO0cE3WKovdO
         gQviSHGBCCBkjIB70DnrvttO7IGzYXoZWZhSXnxE/1U4xp0n1mN+MXHpZoP8XnCPJXrs
         czo3OuC78GzYyjWLPDdvEiGd+45SH9ZM91ZABuhfmzq4P8X/GytXoje4e6j1QOQWD9LL
         jeAndMIrc1Kb9a0tMEQEwHzw/3PCtracCitfnXx8N/zrHkFrHf0sQcSTOIEkOipA0hQH
         N8Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H1RFf0S+LauH4t97A9Q1FiAiUoFreqXYpUT2qQSR1TQ=;
        b=Ttww2gc9dn0Uwoun9AfU4gLiuEmpFRjHdFPg52uQ40hsLBSb8tphySWSX36iPhGmMw
         UslqndskeeobEaYfdV9Ctrf2WkSkneFA+M3WACex9NyqEWBojeo89QE5h0CmSD+IW3+g
         w8CFb5Go8tWUY5sKXLtWme3mn1ccIeJwCSXtngEP/V82zvMBXU7fWF+LrIHdC++AQ0dl
         5DX8djhxUXTawFalPiN2sf5GTLaQiNogXvM/sCcQSN+G5ZhmnaHHMhOQrLjmBfGWGnus
         lBhXx5KkqMNN0FQ8E+/OJINPcjjfSC6Ufjda8wn4xac/6dtnI78FXfNzsi2W4gQEhxnC
         2NHQ==
X-Gm-Message-State: AO0yUKXoQkvp+03MpniY6uSwsPQz0E3KIau4f8iw2Hxplw70EfqBFmAJ
	MAqBrHySZvsQLdNPk/aK5OFjM72SIx3B/8nutvY=
X-Google-Smtp-Source: AK7set9gX/9JsXGwOTkQzAzjsrZy1joEqYecrfvxpR02xTTpOOOTxTzp1GEPx+h57s11892naFOB3oqMvks+U2HUUCI=
X-Received: by 2002:a50:a456:0:b0:4ac:b618:968e with SMTP id
 v22-20020a50a456000000b004acb618968emr1057978edb.1.1676378456247; Tue, 14 Feb
 2023 04:40:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1676289084.git.zhoubinbin@loongson.cn> <a9f697906df6599e6b001981e668479da71aa7a0.1676289084.git.zhoubinbin@loongson.cn>
 <df464409-9a93-c057-5f66-923a9e24696a@linaro.org>
In-Reply-To: <df464409-9a93-c057-5f66-923a9e24696a@linaro.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 14 Feb 2023 20:40:43 +0800
Message-ID: <CAMpQs4JX0Vgf5tvv5Yw5eLGANFfn1p=iQ_kMS0yQPV6kE2tN1g@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] dt-bindings: interrupt-controller: Add Loongson EIOINTC
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jianmin Lv <lvjianmin@loongson.cn>, 
	Huacai Chen <chenhuacai@loongson.cn>, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 14, 2023 at 5:53 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 13/02/2023 13:15, Binbin Zhou wrote:
> > Add Loongson Extended I/O Interrupt controller binding with DT schema
> > format using json-schema.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  .../loongson,eiointc.yaml                     | 80 +++++++++++++++++++
> >  1 file changed, 80 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,eiointc.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,eiointc.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,eiointc.yaml
> > new file mode 100644
> > index 000000000000..88580297f955
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,eiointc.yaml
> > @@ -0,0 +1,80 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: "http://devicetree.org/schemas/interrupt-controller/loongson,eiointc.yaml#"
> > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>
> Drop quotes from bopth.
>
> > +
> > +title: Loongson Extended I/O Interrupt Controller
> > +
> > +maintainers:
> > +  - Binbin Zhou <zhoubinbin@loongson.cn>
> > +
> > +description: |
> > +  This interrupt controller is found on the Loongson-3 family chips and
> > +  Loongson-2K0500 chip and is used to distribute interrupts directly to
> > +  individual cores without forwarding them through the HT's interrupt line.
> > +
> > +allOf:
> > +  - $ref: /schemas/interrupt-controller.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - loongson,eiointc-1.0
>
> Why not using SoC based compatible? It is preferred.

Hi Krzysztof:

So far, from the datasheet, I know that only the EXIOINTC of the
Loongson-2K0500 is different from the other chips, and that is the
"loongson,eio-num-vecs" below, which is 128, while all the others are
256.
My original idea was to add this property to make compatible
consistent, and also to make it easier to add new chips if they have
different eio-num-vecs.

>
> > +
> > +  reg:
> > +    minItems: 1
> > +    maxItems: 3
>
> You need to describe the items.
>
> > +
> > +  interrupt-controller: true
> > +
> > +  interrupts:
> > +    description:
> > +      Interrupt source of the CPU interrupts.
>
> You need to describe the items.

Do you mean a more detailed description?

>
> > +
> > +  interrupt-names:
> > +    description:
> > +      List of names for the parent interrupts.
>
> Drop description.
>
> > +    items:
> > +      - const: int0
> > +
> > +  '#interrupt-cells':
> > +    const: 1
> > +
> > +  'loongson,eio-num-vecs':
>
> Drop quotes.
>
> > +    description:
> > +      The number of devices supported by the extended I/O interrupt vector.
>
> Why this cannot be inferred from the compatible? Different boards with
> the same SoC support different devices?

See above.

Thanks.
Binbin

>
> > +    $ref: "/schemas/types.yaml#/definitions/uint32"
>
> Drop quotes.
>
> > +    minimum: 1
> > +    maximum: 256
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - interrupt-controller
> > +  - '#interrupt-cells'
> > +  - 'loongson,eio-num-vecs'
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    eiointc: interrupt-controller@1fe11600 {
> > +      compatible = "loongson,eiointc-1.0";
> > +      reg = <0x1fe11600 0x8
> > +             0x1fe11700 0x8
> > +             0x1fe11800 0x8>;
>
> That's not correct syntax. <>, <>, <>
>
> > +
> > +      interrupt-controller;
> > +      #interrupt-cells = <1>;
> > +
> > +      interrupt-parent = <&cpuintc>;
> > +      interrupts = <3>;
> > +      interrupt-names = "int0";
> > +
> > +      loongson,eio-num-vecs = <128>;
> > +
>
> Drop stray blank line.
>
> > +    };
> > +
> > +...
>
> Best regards,
> Krzysztof
>
>
