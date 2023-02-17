Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A548E323E
	for <loongarch@lists.linux.dev>; Fri, 17 Feb 2023 10:12:16 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id cn2so2374159edb.4
        for <loongarch@lists.linux.dev>; Fri, 17 Feb 2023 02:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7hw648BlWiWtBk/f0KKzoPuGmE7KbLFt/y3M1QgpRb8=;
        b=DkGgz7LrrshUUqf98FEQHx+4ZLsw1fmj5xlLMYyg/apRAjsxEw7p1q2hYhewpY//AC
         JgOSPxlI58u/6CrB5nHfIey6F8vFzD+IG3h1qtADCX3oNJnQ9VuURgFNHi9tc2KKhQ3Y
         T7cRhAo/RxwKzzcpWDvHV4kJRYaTe3ZU5R4DFUcINE8j4tEYgcDBxmVD9MAKeJayMoFL
         s+cpWPIhjOUCWh+HZPwXIWgujNEJrGjyWRFZLc2Ph8F+9Tj2N54bsdJ4+9gbMYFO5+ME
         ZMjzQcSSj5F3MJtyWzD6nHA/Vj/ff9wONV3GbAUHv9o3HdcwAF1IQ1JX6zFdJsQ/hGcZ
         iU6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7hw648BlWiWtBk/f0KKzoPuGmE7KbLFt/y3M1QgpRb8=;
        b=NURvY7wKU3zXpkWNilEH2OHIX6hjwIUrttjUngUag/+bRk3ILVYRl40RnLu/XslYwg
         +MLkfPocq93+XVpJX/LYo5Pp+x+5FpmJtUneFVyDzOci1XAdWz9epRSgDWlAUF5NTDp/
         FCch13K1GqVBk8pEID6RqNSZHU5Y8Y00TaNSlMEV//W/KVMRmYJSGNu/tOfXdnTVrDTQ
         bKXDwlgQqf9yiRlkhWcVSP/spi1q/ZnIgLBA99XS9LaunvueEZopwcWVjLRhredjbVdE
         Os5LsW8GQCHBLY19+qUAkZcKCiJSVZxr9bOTgi8WY9Qrp2jfrA5iVa9WwB0Jbu4qVE+Y
         VhmQ==
X-Gm-Message-State: AO0yUKXwEwjC7RHmpG1rkHt5PMCqNitX5X9I0/25augzx6hblEsGTv5e
	BaXGMg4JjUAOGjzqXOWjczRNhjgDUZxwxPwYYCE=
X-Google-Smtp-Source: AK7set+GT0Ah3I/6vPnxNmj3RSo2G/EDRSHCWkFAtQuG+sMISDYexJpAIhdh9LnTy7Wf3Mb443eJzI2NRdM6y6KK2Zo=
X-Received: by 2002:a17:907:76ad:b0:8b1:749f:b2c6 with SMTP id
 jw13-20020a17090776ad00b008b1749fb2c6mr1849103ejc.2.1676628734827; Fri, 17
 Feb 2023 02:12:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1676289084.git.zhoubinbin@loongson.cn> <a9f697906df6599e6b001981e668479da71aa7a0.1676289084.git.zhoubinbin@loongson.cn>
 <df464409-9a93-c057-5f66-923a9e24696a@linaro.org> <CAMpQs4JX0Vgf5tvv5Yw5eLGANFfn1p=iQ_kMS0yQPV6kE2tN1g@mail.gmail.com>
 <23068d0c-d37c-0563-e1c1-e4d112059f5b@linaro.org> <CAMpQs4K+aYGrOoWy04vrbEy53kba9zUzGkOwD34pwAH0c=D8iA@mail.gmail.com>
 <49c8255e-66f3-fa1f-2949-1f03f77a0fa4@linaro.org> <CAMpQs4KennWg60ccQ5NYOs=5a9gqTk_bKY26noQ3u0qLQSBg_w@mail.gmail.com>
 <4dcaaa70-11e0-fc9d-da03-224d34e36983@linaro.org>
In-Reply-To: <4dcaaa70-11e0-fc9d-da03-224d34e36983@linaro.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Fri, 17 Feb 2023 18:12:01 +0800
Message-ID: <CAMpQs4KpE7RLyxw4++4z4RhjR_ix300mtDfwh6KgJJw1B43CqA@mail.gmail.com>
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

On Fri, Feb 17, 2023 at 4:40 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 17/02/2023 07:09, Binbin Zhou wrote:
>
> >>> Hi Krzysztof:
> >>>
> >>> Allow me to give a brief overview of the current status of eiointc (DT-based):
> >>>      Loongson-3A series supports eiointc;
> >>>      Loongson-2K1000 does not support eiointc now;
> >>>      Loongson-2K0500 supports eiointc, with differences from
> >>> Loongson-3, e.g. only up to 128 devices are supported;
> >>>      Loongson-2K2000 supports eiointc, similar to Loongson-3.
> >>>      ....
> >>>
> >>> As can be seen, there is now a bit of confusion in the chip's design of eiointc.
> >>>
> >>> The design of eiointc is probably refined step by step with the chip.
> >>> The same version of eiointc can be used for multiple chips, and the
> >>> same chip series may also use different versions of eiointc. Low-end
> >>> chips may use eiointc-2.0, and high-end chips may use eiointc-1.0,
> >>> depending on the time it's produced.
> >>>
> >>> So in the Loongson-2K series I have defined the current state as
> >>> eiointc-1.0, using the dts property to indicate the maximum number of
> >>> devices supported by eiointc that can be used directly in the driver.
> >>>
> >>> If there are new changes to the design later on, such as the
> >>> definition of registers, we can call it eiointc-2.0, which can also
> >>> cover more than one chip.
> >>
> >> Just go with SoC-based compatibles. If your version is not specific
> >> enough, then it is not a good way to represent the hardware.
> >>
> >
> > Hi Krzysztof:
> >
> > I have tried to write the following  SoC-based compatibles,  is it fine?
> >
> > compatible:
> >     enum:
> >       - loongson,ls3a-eiointc  # For MIPS Loongson-3A if necessary.
> >       - loongson,ls2k0500-eiointc
> >       - loongson,ls2k200-eiointc
>
> Looks good, but didn't you state these are compatible between each
> other? I have impression there is a common set, so maybe one compatible
> work on other device with reduced number of devices?
>

So far, the difference between ls2k SOCs is the number of devices
supported by eiointc.

Do you mean use unified compatible and reuse loongson,eio-num-vecs?

Would this be possible, e.g.
compatible:
     const: loongson,ls2k-eiointc

  loongson,eio-num-vecs:
    description:
      The number of devices supported by the extended I/O interrupt vector.
    $ref: /schemas/types.yaml#/definitions/uint32
    minimum: 1
    maximum: 256

Thanks.
Binbin

> Best regards,
> Krzysztof
>
