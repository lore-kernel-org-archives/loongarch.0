Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32E163E
	for <loongarch@lists.linux.dev>; Fri, 17 Feb 2023 06:09:33 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id dn12so8115688edb.5
        for <loongarch@lists.linux.dev>; Thu, 16 Feb 2023 22:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PtVZueFf795vFNiS/F0qWJesHcrC0oubN9RD4XuzgFA=;
        b=MGL/TkVJPptPxBlf66mae7qkZeaQUdTOAroZx1TE1sKA3LyDPUeOlsU1jSYyzaDsMh
         FIEVlXUn1jKf79YLmx3V7ALEm792jAKh31ZVysrE+5uPfZ7YjmGyZujSCRPAG7LqhDrE
         4URGIvYjWennyEts6ahumeBmUZxwXn+4ImWT/YnHRYE77MHNiRYMDjRBgrtWgws5lyNz
         NBvHea0+6xkiCzr7UM8vWpgIQmh5oVejcq+3dmee9u1KgoI1EZO8kYlRS0EBFBnW8X0b
         KHswRGkvJEVVfMB22aibav0aSnyKKX9S+y8EANVI7aWvrhsAKWhM9NsNu86PwDicCr4Q
         4ayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PtVZueFf795vFNiS/F0qWJesHcrC0oubN9RD4XuzgFA=;
        b=oD8Ksd2jSRC2xr5d2G6AuN5BIUQBnKO8E9fcsTs4CGXYKmvi4D1R49ctgS8QvqaYGS
         rbl/FL/BZWADq1zuNH70fTeTEPLGGllkBBDULxk8hlMZoXRX9h6hgCGC5xjPwUOAbyV4
         iDW4KadRtc3g5W6pmkmJYajz6P9u8jhtchU+POgw2l2tNCfYAyleyl9R8esP/AKdR29i
         pGpkVvWIribDxEvHGGC6Vn+PVBQfdLAUBGS13ES+mO+MZddaYqrw3gAK9o8k/I1RKOkX
         SmaoxACxw+CLTvF72+HH/1X9KW3u3Nfy8lMjQ7hDZwobN8zkHRH+cEH12FdBhRVvW9n3
         g/tA==
X-Gm-Message-State: AO0yUKXRhMzbEFtsIL3dne3N54F8PrtjJu5ZpcPe7ldqmh3JXvatWemd
	toetX1OCHsxop4/D95oTnIoqcBVx0TrU5eemgU0=
X-Google-Smtp-Source: AK7set9Bu2tGTO4MLrq+l4cMPuC3nYjn7sdpEzh7v8DtnqKyi850WRRsUnY3QcZw/u/AOuhzzkv3chvpLCoe2cV3dio=
X-Received: by 2002:a17:906:c306:b0:8af:38c9:d52d with SMTP id
 s6-20020a170906c30600b008af38c9d52dmr128027ejz.2.1676614171784; Thu, 16 Feb
 2023 22:09:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1676289084.git.zhoubinbin@loongson.cn> <a9f697906df6599e6b001981e668479da71aa7a0.1676289084.git.zhoubinbin@loongson.cn>
 <df464409-9a93-c057-5f66-923a9e24696a@linaro.org> <CAMpQs4JX0Vgf5tvv5Yw5eLGANFfn1p=iQ_kMS0yQPV6kE2tN1g@mail.gmail.com>
 <23068d0c-d37c-0563-e1c1-e4d112059f5b@linaro.org> <CAMpQs4K+aYGrOoWy04vrbEy53kba9zUzGkOwD34pwAH0c=D8iA@mail.gmail.com>
 <49c8255e-66f3-fa1f-2949-1f03f77a0fa4@linaro.org>
In-Reply-To: <49c8255e-66f3-fa1f-2949-1f03f77a0fa4@linaro.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Fri, 17 Feb 2023 14:09:18 +0800
Message-ID: <CAMpQs4KennWg60ccQ5NYOs=5a9gqTk_bKY26noQ3u0qLQSBg_w@mail.gmail.com>
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

On Thu, Feb 16, 2023 at 4:10 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 16/02/2023 02:46, Binbin Zhou wrote:
> > On Tue, Feb 14, 2023 at 8:43 PM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 14/02/2023 13:40, Binbin Zhou wrote:
> >>> On Tue, Feb 14, 2023 at 5:53 PM Krzysztof Kozlowski
> >>> <krzysztof.kozlowski@linaro.org> wrote:
> >>>>
> >>>> On 13/02/2023 13:15, Binbin Zhou wrote:
> >>>>> Add Loongson Extended I/O Interrupt controller binding with DT schema
> >>>>> format using json-schema.
> >>>>>
> >>>>> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> >>>>> ---
> >>>>>  .../loongson,eiointc.yaml                     | 80 +++++++++++++++++++
> >>>>>  1 file changed, 80 insertions(+)
> >>>>>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,eiointc.yaml
> >>>>>
> >>>>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,eiointc.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,eiointc.yaml
> >>>>> new file mode 100644
> >>>>> index 000000000000..88580297f955
> >>>>> --- /dev/null
> >>>>> +++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,eiointc.yaml
> >>>>> @@ -0,0 +1,80 @@
> >>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>>>> +%YAML 1.2
> >>>>> +---
> >>>>> +$id: "http://devicetree.org/schemas/interrupt-controller/loongson,eiointc.yaml#"
> >>>>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> >>>>
> >>>> Drop quotes from bopth.
> >>>>
> >>>>> +
> >>>>> +title: Loongson Extended I/O Interrupt Controller
> >>>>> +
> >>>>> +maintainers:
> >>>>> +  - Binbin Zhou <zhoubinbin@loongson.cn>
> >>>>> +
> >>>>> +description: |
> >>>>> +  This interrupt controller is found on the Loongson-3 family chips and
> >>>>> +  Loongson-2K0500 chip and is used to distribute interrupts directly to
> >>>>> +  individual cores without forwarding them through the HT's interrupt line.
> >>>>> +
> >>>>> +allOf:
> >>>>> +  - $ref: /schemas/interrupt-controller.yaml#
> >>>>> +
> >>>>> +properties:
> >>>>> +  compatible:
> >>>>> +    enum:
> >>>>> +      - loongson,eiointc-1.0
> >>>>
> >>>> Why not using SoC based compatible? It is preferred.
> >>>
> >>> Hi Krzysztof:
> >>>
> >>> So far, from the datasheet, I know that only the EXIOINTC of the
> >>> Loongson-2K0500 is different from the other chips, and that is the
> >>> "loongson,eio-num-vecs" below, which is 128, while all the others are
> >>> 256.
> >>> My original idea was to add this property to make compatible
> >>> consistent, and also to make it easier to add new chips if they have
> >>> different eio-num-vecs.
> >>
> >> We talk about different things. SoC based compatibles are preferred over
> >> version ones. This was on the lists expressed many times. Please provide
> >> a reason why you deviate from general recommendation. Flexibility and
> >> genericness of bindings is not a reason - it's the opposite of the
> >> argument, thus this will be a: NAK. :(
> >>
> >>
> > Hi Krzysztof:
> >
> > Allow me to give a brief overview of the current status of eiointc (DT-based):
> >      Loongson-3A series supports eiointc;
> >      Loongson-2K1000 does not support eiointc now;
> >      Loongson-2K0500 supports eiointc, with differences from
> > Loongson-3, e.g. only up to 128 devices are supported;
> >      Loongson-2K2000 supports eiointc, similar to Loongson-3.
> >      ....
> >
> > As can be seen, there is now a bit of confusion in the chip's design of eiointc.
> >
> > The design of eiointc is probably refined step by step with the chip.
> > The same version of eiointc can be used for multiple chips, and the
> > same chip series may also use different versions of eiointc. Low-end
> > chips may use eiointc-2.0, and high-end chips may use eiointc-1.0,
> > depending on the time it's produced.
> >
> > So in the Loongson-2K series I have defined the current state as
> > eiointc-1.0, using the dts property to indicate the maximum number of
> > devices supported by eiointc that can be used directly in the driver.
> >
> > If there are new changes to the design later on, such as the
> > definition of registers, we can call it eiointc-2.0, which can also
> > cover more than one chip.
>
> Just go with SoC-based compatibles. If your version is not specific
> enough, then it is not a good way to represent the hardware.
>

Hi Krzysztof:

I have tried to write the following  SoC-based compatibles,  is it fine?

compatible:
    enum:
      - loongson,ls3a-eiointc  # For MIPS Loongson-3A if necessary.
      - loongson,ls2k0500-eiointc
      - loongson,ls2k200-eiointc
       ....
Also remove the 'loongson,eio-num-vecs' property.

Thanks.
Binbin

> Best regards,
> Krzysztof
>
