Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4686015B7
	for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 12:43:40 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id f47-20020a05600c492f00b003dc584a7b7eso13555630wmp.3
        for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 04:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nAjMRsfCXAltgo5iFCDivnEztMCY0Q2l+8tj6K+rLFY=;
        b=E7vKL7YiZ2n7wSHDpNKqYHbizdd5zMroMUc9DlZxroJWVcNjyltejMRL3Qjbpd78U0
         gt+Eo0+cQj4wycKXYYLZ2QlCRTjrJjb5sapO4jDIjoFifZTGrhzLcQDbHnt6FTGpOBjM
         hIGeGdw8ARNB2JEtwdnssRxPDcEOQKSX2H7Kc0pbSpez57vwbPaMbbj29HeGHzvHeUAA
         fulZhtEUEKka1nZZ5y2dGM9DiVN9ekVO6nhL7okSBv1Krcai0Nj9gsox/y8L0AXrGHsN
         kMxd2P6ycOIXDbvuwd0/Q0UGKxzKcaPa2WXCqpXXxzCPNoVR0HroazzclLNoT+3Mw4bH
         Ms4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nAjMRsfCXAltgo5iFCDivnEztMCY0Q2l+8tj6K+rLFY=;
        b=wI+0GuHkoj1eTIsSVP/MedUlbb+OHDYjBeJxbeowI6f2T5DSXAllhsRyTt3xc2qhuQ
         AuovMK0m9Nd+pNScANkm0YCu+MYSzSCv9TEYezexHGAubzo0WLusgP2T8bY5FTShi2CP
         VZsinXhAXPs5VCckps8DQISgqx2fNoyRsVJoT9xY7R22ZjMBH0qcwgwRc5lJywauP63I
         qVpE/ej2Hm22tM0Z/FMlkqoWHe00QovbZtuGo7lrFMPrIm7zbYFzCetMf76D/dc2eMRR
         mpzDDLZqlzCwFWXRqdLqlHSKhDmb2KOV4k8glMRNY3TEmFdX930naVsZk13G/6pvu5LS
         /PKg==
X-Gm-Message-State: AO0yUKU/2vSgCTPTVJUHkWP6JYkvTpN7TUS+D81XWG6exhTuUYtIc1c0
	O8DGzUaT1YRLzgexVjVQ3D/51Vr/yh+tI5ma
X-Google-Smtp-Source: AK7set+tyMuXDWxzWtn+YJ8SdrR1sLZrsYgFO/g9k7MQQcrmb9dnjwFCZpIoVUaTa5Xt4cGwiuPVsg==
X-Received: by 2002:a05:600c:3acd:b0:3d3:4f99:bb32 with SMTP id d13-20020a05600c3acd00b003d34f99bb32mr1789250wms.36.1676378618477;
        Tue, 14 Feb 2023 04:43:38 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id ja13-20020a05600c556d00b003dc4b4dea31sm16156283wmb.27.2023.02.14.04.43.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 04:43:37 -0800 (PST)
Message-ID: <23068d0c-d37c-0563-e1c1-e4d112059f5b@linaro.org>
Date: Tue, 14 Feb 2023 13:43:36 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V2 1/2] dt-bindings: interrupt-controller: Add Loongson
 EIOINTC
Content-Language: en-US
To: Binbin Zhou <zhoubb.aaron@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen
 <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jianmin Lv <lvjianmin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 loongarch@lists.linux.dev, devicetree@vger.kernel.org,
 loongson-kernel@lists.loongnix.cn
References: <cover.1676289084.git.zhoubinbin@loongson.cn>
 <a9f697906df6599e6b001981e668479da71aa7a0.1676289084.git.zhoubinbin@loongson.cn>
 <df464409-9a93-c057-5f66-923a9e24696a@linaro.org>
 <CAMpQs4JX0Vgf5tvv5Yw5eLGANFfn1p=iQ_kMS0yQPV6kE2tN1g@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMpQs4JX0Vgf5tvv5Yw5eLGANFfn1p=iQ_kMS0yQPV6kE2tN1g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/02/2023 13:40, Binbin Zhou wrote:
> On Tue, Feb 14, 2023 at 5:53 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 13/02/2023 13:15, Binbin Zhou wrote:
>>> Add Loongson Extended I/O Interrupt controller binding with DT schema
>>> format using json-schema.
>>>
>>> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
>>> ---
>>>  .../loongson,eiointc.yaml                     | 80 +++++++++++++++++++
>>>  1 file changed, 80 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,eiointc.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,eiointc.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,eiointc.yaml
>>> new file mode 100644
>>> index 000000000000..88580297f955
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,eiointc.yaml
>>> @@ -0,0 +1,80 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: "http://devicetree.org/schemas/interrupt-controller/loongson,eiointc.yaml#"
>>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>>
>> Drop quotes from bopth.
>>
>>> +
>>> +title: Loongson Extended I/O Interrupt Controller
>>> +
>>> +maintainers:
>>> +  - Binbin Zhou <zhoubinbin@loongson.cn>
>>> +
>>> +description: |
>>> +  This interrupt controller is found on the Loongson-3 family chips and
>>> +  Loongson-2K0500 chip and is used to distribute interrupts directly to
>>> +  individual cores without forwarding them through the HT's interrupt line.
>>> +
>>> +allOf:
>>> +  - $ref: /schemas/interrupt-controller.yaml#
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - loongson,eiointc-1.0
>>
>> Why not using SoC based compatible? It is preferred.
> 
> Hi Krzysztof:
> 
> So far, from the datasheet, I know that only the EXIOINTC of the
> Loongson-2K0500 is different from the other chips, and that is the
> "loongson,eio-num-vecs" below, which is 128, while all the others are
> 256.
> My original idea was to add this property to make compatible
> consistent, and also to make it easier to add new chips if they have
> different eio-num-vecs.

We talk about different things. SoC based compatibles are preferred over
version ones. This was on the lists expressed many times. Please provide
a reason why you deviate from general recommendation. Flexibility and
genericness of bindings is not a reason - it's the opposite of the
argument, thus this will be a: NAK. :(


> 
>>
>>> +
>>> +  reg:
>>> +    minItems: 1
>>> +    maxItems: 3
>>
>> You need to describe the items.
>>
>>> +
>>> +  interrupt-controller: true
>>> +
>>> +  interrupts:
>>> +    description:
>>> +      Interrupt source of the CPU interrupts.
>>
>> You need to describe the items.
> 
> Do you mean a more detailed description?

I mean constraints on interrupts and/or description if they are not obvious.

Best regards,
Krzysztof

