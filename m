Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCB59447
	for <loongarch@lists.linux.dev>; Fri, 16 Jun 2023 08:03:56 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2b1b06af50eso4657221fa.1
        for <loongarch@lists.linux.dev>; Fri, 16 Jun 2023 01:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686902634; x=1689494634;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hULyAVDg1y9tDeonTJB2nq2Om4nQ0EG3JOer8JbQBgk=;
        b=IjyyIjRvGJ6T59xW+C0BwtDhrkUtXVrPEBmitFdbVZj5r/FE6bMgxSecYi9QXghR2d
         V5y9FYiVW5wClSM4X+FYHojfR1F4PZnud/5OnHP2hV64TlSkGF39SpSsvJg+8WHw3hTm
         Sa0kqwuNfIa6AlNThBEBb0T8fv6aNXyVlbxcM1wiCiZ+Cj/c+I8UDVn+KdZ7aweQCoiY
         01xKnKQfj7qGmx9kRuxB9ahCcWLlpyPBf8FAic7GrefbQEPt7wV3EOr/bNi6NWxPy4rB
         Jb5D8yo/m9pfs674Zmtunm9tFzZIDDrbRLOvMOnaLQ5eTC6A9aipJQV8Wd6/OAZbBqeF
         yxhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686902634; x=1689494634;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hULyAVDg1y9tDeonTJB2nq2Om4nQ0EG3JOer8JbQBgk=;
        b=UMi1fMZo/Cs+tn6QGKYsl0Iq95FagjpRAYQAPg+CUTeRh820ThPVWs5muXTxFqJ1IW
         VYSXppQPIowWL/WAIfNmHqOwM/l12CHF0uFuQy4Eh+lWSYI0WDrnQpJzJhCM/w3sy+/z
         8L618C6b6YJYICQX4usG1p6EDysKaLvEbHeJnh0/7doHqTtsFZ+UG+POEdOhGRygKOeo
         NkTjxwkzMCAC3aC0fnLUr1cK05RWhNOKS11suBGHPQ0Q9Uepg9hB2vC4X4cm3a9kdWhe
         8iqjgnGGx494GYm16eEQ/ueuQH3TtwYOPiy93C358nRuZuugscmL/AZrU5y6CVdZAxir
         Juyg==
X-Gm-Message-State: AC+VfDz4LWQV6ik3gQc8pkCxuIXg1SEyStVv4Sd6InV/TD3uliXS0b7/
	bgDgfoSodu9St/59y9WKOkEZoQ==
X-Google-Smtp-Source: ACHHUZ6I3r39l8aDjCeT+3PLWduhsdthB5fB5sV2c3c0A+8gjY/rggU6SYdfOnmk0HXZbGrejZLc0Q==
X-Received: by 2002:a2e:86d2:0:b0:2ad:9139:c871 with SMTP id n18-20020a2e86d2000000b002ad9139c871mr1103205ljj.19.1686902634418;
        Fri, 16 Jun 2023 01:03:54 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id u3-20020aa7d543000000b00514bddcb87csm9908991edr.31.2023.06.16.01.03.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jun 2023 01:03:53 -0700 (PDT)
Message-ID: <efdd8e66-a8dc-1a7e-6ac3-fdbe0ba45204@linaro.org>
Date: Fri, 16 Jun 2023 10:03:51 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 2/3] soc: dt-bindings: add loongson-2 pm
To: Yinbo Zhu <zhuyinbo@loongson.cn>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Marc Zyngier <maz@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev
Cc: Jianmin Lv <lvjianmin@loongson.cn>, wanghongliang@loongson.cn,
 Liu Peibao <liupeibao@loongson.cn>, loongson-kernel@lists.loongnix.cn
References: <20230615091757.24686-1-zhuyinbo@loongson.cn>
 <20230615091757.24686-3-zhuyinbo@loongson.cn>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230615091757.24686-3-zhuyinbo@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/06/2023 11:17, Yinbo Zhu wrote:
> Add the Loongson-2 SoC Power Management Controller binding with DT
> schema format using json-schema.
> 
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
> ---
>  .../soc/loongson/loongson,ls2k-pmc.yaml       | 53 +++++++++++++++++++
>  MAINTAINERS                                   |  6 +++
>  2 files changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/loongson/loongson,ls2k-pmc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/loongson/loongson,ls2k-pmc.yaml b/Documentation/devicetree/bindings/soc/loongson/loongson,ls2k-pmc.yaml
> new file mode 100644
> index 000000000000..32499bd10f8c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/loongson/loongson,ls2k-pmc.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/loongson/loongson,ls2k-pmc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Loongson-2 Power Manager controller
> +
> +maintainers:
> +  - Yinbo Zhu <zhuyinbo@loongson.cn>
> +
> +properties:
> +  compatible:
> +    oneOf:

Drop oneOf, you don't have here many choices.

> +      - items:
> +          - enum:
> +              - loongson,ls2k1000-pmc
> +              - loongson,ls2k0500-pmc
> +          - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  suspend-address:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The "suspend-address" is a deep sleep state (Suspend To RAM)
> +      firmware entry address which was jumped from kernel and it's
> +      value was dependent on specific platform firmware code. In
> +      addition, the PM need according to it to indicate that current
> +      SoC whether support Suspend To RAM.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    pmc: pm@1fe27000 {

Node name: system-controller or power-pamanagement

With these two:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

