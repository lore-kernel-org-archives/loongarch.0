Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43D328E3
	for <loongarch@lists.linux.dev>; Fri, 21 Apr 2023 19:04:30 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-38c0a331d3cso1447749b6e.1
        for <loongarch@lists.linux.dev>; Fri, 21 Apr 2023 12:04:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682103870; x=1684695870;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oEVD6TwI8qgPWVxrhj86c7Ln4JsVutrlctSF8C4EjUM=;
        b=D5utc9iUXTAp9aWMwFOWyH20iebLBtzNX2VZGz4ugf/OLHyQ83a+CrmPVtVuDKCIQI
         RhseSlDXebpnLg/jZx1tQML2zHDbSB35j1T+I0zAYn5Vw+trCIyxweilHEfdtcjo7fx0
         C83vW64kw1q1+hl1uTUKO8ViUgXuPGfeCSRuetnmXOZTMFeZmZm3ULKJfNKng74dO8wi
         hcpcBz9CrJ4kUe35LWhU6oY6xqCCnR64TMkoIK8eeIlm4LUcQ5z9ag6SVv3ucHID1hYu
         URvg7lSMIPyMaRJKulPI4mmH4DMc17cao7VcYr6jSnC65+ny3jEmp3b+KPWOtbsSojPd
         +8mw==
X-Gm-Message-State: AAQBX9eY253vtnXqooMtTWdV2D/oh0xyMBxvq8QnFI9SHug42vsoIBqM
	RQOhxkAp3F41SzxXSsFfOQ==
X-Google-Smtp-Source: AKy350ZZKs6nRzErt5Hgh0Ydf8D5qRZ9OHhRf2jidU9uiXC1zuPE2SpN652Vc2sWTz/SHwVcWquxvw==
X-Received: by 2002:a05:6808:15a8:b0:38e:bfa:241e with SMTP id t40-20020a05680815a800b0038e0bfa241emr3816681oiw.42.1682103869565;
        Fri, 21 Apr 2023 12:04:29 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q125-20020acad983000000b0038e07fe2c97sm1884773oig.42.2023.04.21.12.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 12:04:29 -0700 (PDT)
Received: (nullmailer pid 1626609 invoked by uid 1000);
	Fri, 21 Apr 2023 19:04:28 -0000
Date: Fri, 21 Apr 2023 14:04:28 -0500
From: Rob Herring <robh@kernel.org>
To: Binbin Zhou <zhoubb.aaron@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jianmin Lv <lvjianmin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, loongarch@lists.linux.dev, devicetree@vger.kernel.org, loongson-kernel@lists.loongnix.cn
Subject: Re: [PATCH V3 1/2] dt-bindings: interrupt-controller: Add Loongson
 EIOINTC
Message-ID: <20230421190428.GA1617382-robh@kernel.org>
References: <cover.1681887790.git.zhoubinbin@loongson.cn>
 <3b9c4f05eaf14bc3b16aebec3ff84c8a2d52c4a5.1681887790.git.zhoubinbin@loongson.cn>
 <f9b62f48-5c8b-2674-313d-4552c61c4302@linaro.org>
 <CAMpQs4JjHvVOzQz-1Y-q9ut6tWUpakrHeozuwPg0dzoDcUFEGA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpQs4JjHvVOzQz-1Y-q9ut6tWUpakrHeozuwPg0dzoDcUFEGA@mail.gmail.com>

On Thu, Apr 20, 2023 at 09:00:42PM +0800, Binbin Zhou wrote:
> On Thu, Apr 20, 2023 at 4:09 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> >
> > On 19/04/2023 09:17, Binbin Zhou wrote:
> > > Add Loongson Extended I/O Interrupt controller binding with DT schema
> > > format using json-schema.
> > >
> > > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > > ---
> > >  .../loongson,eiointc.yaml                     | 74 +++++++++++++++++++
> > >  1 file changed, 74 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,eiointc.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,eiointc.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,eiointc.yaml
> > > new file mode 100644
> > > index 000000000000..4ab4efb061e1
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,eiointc.yaml
> > > @@ -0,0 +1,74 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/interrupt-controller/loongson,eiointc.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Loongson Extended I/O Interrupt Controller
> > > +
> > > +maintainers:
> > > +  - Binbin Zhou <zhoubinbin@loongson.cn>
> > > +
> > > +description: |
> > > +  This interrupt controller is found on the Loongson-3 family chips and
> > > +  Loongson-2K series chips and is used to distribute interrupts directly to
> > > +  individual cores without forwarding them through the HT's interrupt line.
> > > +
> > > +allOf:
> > > +  - $ref: /schemas/interrupt-controller.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - loongson,ls2k0500-eiointc
> > > +      - loongson,ls2k2000-eiointc
> > > +
> > > +  reg:
> > > +    items:
> > > +      - description: Interrupt enable registers
> > > +      - description: Interrupt status registers
> > > +      - description: Interrupt clear registers
> > > +      - description: Interrupt routing configuration registers
> > > +
> > > +  reg-names:
> > > +    items:
> > > +      - const: enable
> > > +      - const: status
> > > +      - const: clear
> > > +      - const: route
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  interrupt-controller: true
> > > +
> > > +  '#interrupt-cells':
> > > +    const: 1
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - interrupts
> > > +  - interrupt-controller
> > > +  - '#interrupt-cells'
> > > +
> > > +unevaluatedProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    eiointc: interrupt-controller@1fe11600 {
> > > +      compatible = "loongson,ls2k0500-eiointc";
> > > +      reg = <0x1fe11600 0x10>,
> > > +            <0x1fe11700 0x10>,
> > > +            <0x1fe11800 0x10>,
> > > +            <0x1fe114c0 0x4>;
> >
> > Binding is OK, but are you sure you want to split the address space like
> > this? It looks like two address spaces (enable+clear+status should be
> > one). Are you sure this is correct?
> >
> Hi Krzysztof:
> 
> These registers are all in the range of chip configuration registers,
> in the case of LS2K0500, which has a base address of 0x1fe10000.

Where is the schema for this? Either it should be the 
interrupt-controller itself or this binding should be a child node of 
it. Which way really depends on whether the eiointc is reused on 
multiple chips with different register offsets or parent block.

Can't really give better advice without a complete picture of the 'chip 
configuration registers'. So please provide that.

Rob
