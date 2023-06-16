Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5AF6117
	for <loongarch@lists.linux.dev>; Fri, 16 Jun 2023 09:51:24 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-9828a7a39d1so65950166b.0
        for <loongarch@lists.linux.dev>; Fri, 16 Jun 2023 02:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686909083; x=1689501083;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hsoplbcfrZFEeLbInsOKgLV7qLBEVxNAPdh3qoACM8c=;
        b=DDlMoyyPQ2+g63PQan8VB28u32p42tkfqY41+EB6QVu4ckLuKhaOBPbNmDkfHiYKYN
         ktpBbBSs3h5vn1OneCIGZ3If8qOdsiAEDfcAZW6vTi66EunOQDsYLmadenLq1EJuQnrH
         0TNerrz2TQUOfsnKGW8FGGus7EzpiHAAufzkCnBHvQbJe2wuq3arGHOD4TEMnwdr6Eo/
         W93zPZIBYR7v9bG6hczJfyFQ7c5gaxSOOxA9SNGi1HWe3AqDeWoQn4wZ9vncYNoAaW4z
         03yMZbeI3Ho15mbExhIH/OPGg3U9QyfvsGqMnlW7FSSAorQ94+3QS1iWOhIItSv8Tr+p
         K1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686909083; x=1689501083;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hsoplbcfrZFEeLbInsOKgLV7qLBEVxNAPdh3qoACM8c=;
        b=D3Qcpi1MXh7u6eBq/5QW0oQD3pEbi1IFZM5+XzgNqLOR3dNbXpZaOUibfxSvw5k/JE
         0MMmA5IaOjd6d6bYBYHdyG7GeIcPXda82MNTXGRFl1/oVD5EL9IpiL4mF7bazPMvVYlP
         7pqmBEZ5nbMOXTw//Lc4OzOjCyTdZ/akI6Z+rXKs//Z8q6m0JUefBYQaLJxbzeMiIOTg
         UxW6fCXZQYVRdYafdHMv2yxrtcdyGJ3mlC4Ex4KQfcpixrWqp8WRn4LQGXshDMDx0oKc
         f75RiLAd6YbRuBwm0SD/7k9uTtEcvQMDXbtkpel+Z+EBhdUNQ2K2Appg0zzwHwCAy9w+
         Dk6g==
X-Gm-Message-State: AC+VfDwEvQMxPfN5v4wMmh/2ePR2RxI+EfpQyjXqcDscqnIz5Mfcqhl3
	EM3v1h9BDYdOa6deNOtSjP5ihP5+F6ImY/zRZ0o=
X-Google-Smtp-Source: ACHHUZ7GEO9/u+75MVi2ghulEmqcyLseJuj8+XSCikPpDyjnEEzBV0nlVtluIHCPuDnR1dQe4LHJ3Q==
X-Received: by 2002:a17:907:74b:b0:971:484:6391 with SMTP id xc11-20020a170907074b00b0097104846391mr1215822ejb.20.1686909082263;
        Fri, 16 Jun 2023 02:51:22 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id k9-20020a170906128900b00965ffb8407asm10466077ejb.87.2023.06.16.02.51.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jun 2023 02:51:21 -0700 (PDT)
Message-ID: <6bfd273e-d7e8-8447-f7e7-ebda33092337@linaro.org>
Date: Fri, 16 Jun 2023 11:51:19 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/6] dt-bindings: loongarch: Add CPU bindings for
 LoongArch
Content-Language: en-US
To: Binbin Zhou <zhoubinbin@loongson.cn>, Binbin Zhou
 <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Cc: Huacai Chen <chenhuacai@kernel.org>, loongson-kernel@lists.loongnix.cn,
 Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Hongliang Wang <wanghongliang@loongson.cn>
References: <cover.1686882123.git.zhoubinbin@loongson.cn>
 <c1f86e5d1026937abda331ce564e5ee96b7114c7.1686882123.git.zhoubinbin@loongson.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c1f86e5d1026937abda331ce564e5ee96b7114c7.1686882123.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/06/2023 08:10, Binbin Zhou wrote:
> Add the available CPUs in LoongArch binding with DT schema format using
> json-schema.
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  .../devicetree/bindings/loongarch/cpus.yaml   | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/loongarch/cpus.yaml
> 
> diff --git a/Documentation/devicetree/bindings/loongarch/cpus.yaml b/Documentation/devicetree/bindings/loongarch/cpus.yaml
> new file mode 100644
> index 000000000000..c3e2dba42c81
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/loongarch/cpus.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/loongarch/cpus.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LoongArch CPUs
> +
> +maintainers:
> +  - Binbin Zhou <zhoubinbin@loongson.cn>
> +
> +description:
> +  The device tree allows to describe the layout of CPUs in a system through
> +  the "cpus" node, which in turn contains a number of subnodes (ie "cpu")
> +  defining properties for every CPU.

I understand you copied it from ARM, but I would prefer to have here
something meaningful. Bindings description does not explain what is DTS,
but explains what the hardware is.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - loongson,la264
> +      - loongson,la364
> +
> +  reg:
> +    maxItems: 1
> +
> +  device_type: true
> +
> +  clock-frequency:
> +    description: The frequency of cpu in Hz.
> +
> +  model:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: User-visible cpu name in /proc/cpuinfo.

First, aren't you mixing nodes?
Second, it is derived from compatible, so no need for such property.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clock-frequency
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    cpus {
> +        #size-cells = <0>;
> +        #address-cells = <1>;
> +
> +        model = "Loongson-2K1000";

Drop, not related.

Best regards,
Krzysztof

