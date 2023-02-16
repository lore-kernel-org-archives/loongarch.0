Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507097B
	for <loongarch@lists.linux.dev>; Thu, 16 Feb 2023 01:46:24 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id my5so1599000ejc.7
        for <loongarch@lists.linux.dev>; Wed, 15 Feb 2023 17:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jv6cvjo686LVOVKC6rcDtTFa30YNfYHMmyU6W4jz+Mo=;
        b=hOWbdVvnNuMQYO9emFZuvkmpGwBNqkXb+ZPFKNmb7bIH0iXmHZzotyY82ak4bTuKy8
         OgUZ3o7+2yFys7PMR3ebJXqp9xC3HrEeA4U7QRly93FNJsWUcRvUaHEtm8xYgT3CagFM
         6TXeKgZk9mNnaBA6PYoiMyXCfkZ4MXdI+ABezHkYuHs9KxwtIzp+KH5xXM2tsQc3PWnj
         TGiJ8lIxEZKdsIdthvHiWSJUGxNTA2ZB7PffHHuVHIfoTB3PxFI4Y2CKoDlp8JGWSt4T
         /BaHLOXLYMuTAX+HUqpTmQCmozzwJDgMVxwV7SP4177HEgx/HykPbLGYhiunja7g0e1Q
         j2DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jv6cvjo686LVOVKC6rcDtTFa30YNfYHMmyU6W4jz+Mo=;
        b=ydqiN1YzJWFa8T607m3XjUFC2vP8tz1aojPReKu03AMimqlr9kaH0rf3wNPylYdxEs
         DOdhDwJ9BccOSYDnjODewp9ghMGJ5c+Z0PHpZj5MMce98L4PWDEW7bnOSWKunJP6G7Nb
         ipUkSLDPMI8fKiFmj1+ETjXlPLyB68vUxevqn1B1K1q2Z/GmEeyr61TmfGe1/KdjXn67
         MhAjmXKQz2DARcgpJL2zTo9mxwLM41bz57p/Bb2ILVOiy2JQ8uRqzeAmk1mMq09BrknL
         WcH1H91rkP8oTZOLLE7ZyNH1zUTNhi73PQz0OD1N7G5mkCoV+FgLY6DKJ7T56QN7Q5Lx
         cVSA==
X-Gm-Message-State: AO0yUKWUT5bDqR1neKC108yjZGhi9GgHaIZFzfXBP/tlObQAjAP6HTES
	9MTfJxkpQqOQpGAGuRE7GIz46kMmeLznojBp6Ng=
X-Google-Smtp-Source: AK7set+rcb8VPwl22THcOhg2BjlDEf1NPu44Ct2NLA8hipljIJtynALfkEnslMffAmaYmRViaZJ5bukXBH6hc0cGtcs=
X-Received: by 2002:a17:906:4dc4:b0:877:e539:810b with SMTP id
 f4-20020a1709064dc400b00877e539810bmr2031759ejw.2.1676511982463; Wed, 15 Feb
 2023 17:46:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1676289084.git.zhoubinbin@loongson.cn> <a9f697906df6599e6b001981e668479da71aa7a0.1676289084.git.zhoubinbin@loongson.cn>
 <df464409-9a93-c057-5f66-923a9e24696a@linaro.org> <CAMpQs4JX0Vgf5tvv5Yw5eLGANFfn1p=iQ_kMS0yQPV6kE2tN1g@mail.gmail.com>
 <23068d0c-d37c-0563-e1c1-e4d112059f5b@linaro.org>
In-Reply-To: <23068d0c-d37c-0563-e1c1-e4d112059f5b@linaro.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Thu, 16 Feb 2023 09:46:09 +0800
Message-ID: <CAMpQs4K+aYGrOoWy04vrbEy53kba9zUzGkOwD34pwAH0c=D8iA@mail.gmail.com>
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

On Tue, Feb 14, 2023 at 8:43 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 14/02/2023 13:40, Binbin Zhou wrote:
> > On Tue, Feb 14, 2023 at 5:53 PM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 13/02/2023 13:15, Binbin Zhou wrote:
> >>> Add Loongson Extended I/O Interrupt controller binding with DT schema
> >>> format using json-schema.
> >>>
> >>> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> >>> ---
> >>>  .../loongson,eiointc.yaml                     | 80 +++++++++++++++++++
> >>>  1 file changed, 80 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,eiointc.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,eiointc.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,eiointc.yaml
> >>> new file mode 100644
> >>> index 000000000000..88580297f955
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,eiointc.yaml
> >>> @@ -0,0 +1,80 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: "http://devicetree.org/schemas/interrupt-controller/loongson,eiointc.yaml#"
> >>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> >>
> >> Drop quotes from bopth.
> >>
> >>> +
> >>> +title: Loongson Extended I/O Interrupt Controller
> >>> +
> >>> +maintainers:
> >>> +  - Binbin Zhou <zhoubinbin@loongson.cn>
> >>> +
> >>> +description: |
> >>> +  This interrupt controller is found on the Loongson-3 family chips and
> >>> +  Loongson-2K0500 chip and is used to distribute interrupts directly to
> >>> +  individual cores without forwarding them through the HT's interrupt line.
> >>> +
> >>> +allOf:
> >>> +  - $ref: /schemas/interrupt-controller.yaml#
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    enum:
> >>> +      - loongson,eiointc-1.0
> >>
> >> Why not using SoC based compatible? It is preferred.
> >
> > Hi Krzysztof:
> >
> > So far, from the datasheet, I know that only the EXIOINTC of the
> > Loongson-2K0500 is different from the other chips, and that is the
> > "loongson,eio-num-vecs" below, which is 128, while all the others are
> > 256.
> > My original idea was to add this property to make compatible
> > consistent, and also to make it easier to add new chips if they have
> > different eio-num-vecs.
>
> We talk about different things. SoC based compatibles are preferred over
> version ones. This was on the lists expressed many times. Please provide
> a reason why you deviate from general recommendation. Flexibility and
> genericness of bindings is not a reason - it's the opposite of the
> argument, thus this will be a: NAK. :(
>
>
Hi Krzysztof:

Allow me to give a brief overview of the current status of eiointc (DT-based):
     Loongson-3A series supports eiointc;
     Loongson-2K1000 does not support eiointc now;
     Loongson-2K0500 supports eiointc, with differences from
Loongson-3, e.g. only up to 128 devices are supported;
     Loongson-2K2000 supports eiointc, similar to Loongson-3.
     ....

As can be seen, there is now a bit of confusion in the chip's design of eiointc.

The design of eiointc is probably refined step by step with the chip.
The same version of eiointc can be used for multiple chips, and the
same chip series may also use different versions of eiointc. Low-end
chips may use eiointc-2.0, and high-end chips may use eiointc-1.0,
depending on the time it's produced.

So in the Loongson-2K series I have defined the current state as
eiointc-1.0, using the dts property to indicate the maximum number of
devices supported by eiointc that can be used directly in the driver.

If there are new changes to the design later on, such as the
definition of registers, we can call it eiointc-2.0, which can also
cover more than one chip.

Thanks.
Binbin

> >
> >>
> >>> +
> >>> +  reg:
> >>> +    minItems: 1
> >>> +    maxItems: 3
> >>
> >> You need to describe the items.
> >>
> >>> +
> >>> +  interrupt-controller: true
> >>> +
> >>> +  interrupts:
> >>> +    description:
> >>> +      Interrupt source of the CPU interrupts.
> >>
> >> You need to describe the items.
> >
> > Do you mean a more detailed description?
>
> I mean constraints on interrupts and/or description if they are not obvious.
>
> Best regards,
> Krzysztof
>
