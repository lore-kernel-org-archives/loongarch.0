Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFDD1FA7
	for <loongarch@lists.linux.dev>; Fri, 30 Sep 2022 09:58:22 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id a8so6058186lff.13
        for <loongarch@lists.linux.dev>; Fri, 30 Sep 2022 02:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=mQNFTbjJsZ/QtD20aKuSgSzhrP5iLEWPqw7+b4Gc6Hk=;
        b=vzX4Kdna3ulAbcywBUMwTPKBg4bCYSp+BihKJye2sQaculetoFPs7N927IKxjGAjUF
         znfUuRNC6AMRkoBjuPgraGYEb5EXSDXHNMg6e+D8AQ4am8qurtJb5PSaRPVRbSM99cz8
         P0aiTTQ690T9ZITTuhQYRIAVzkanyuPuHy2bCMBf+mIRNbFr0aOOWakeCrsSOERxQneQ
         6iv8UgQRJZnVFcOx3qDorPZLHPIzGsXwEDDN8N4XliKBi7OZ0u55Ji3XkhrPerzIVaB4
         TrIsqzRkTb4Ifyzlqg/eUINkI7wICim9PsGxwORaBV5ys6OhD4mvLQZDicJOAoRDEm1q
         sfdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=mQNFTbjJsZ/QtD20aKuSgSzhrP5iLEWPqw7+b4Gc6Hk=;
        b=d3gebzxrpyid2WBfJVOEuciOu4gAvpUIircobQVsjbtOUi7xMTovl41uTBVlOvQNv1
         8PuRxFUf4XqHcEhLN9yPmnR4xXa96/lTah1j+b6c/IrA0D6jckX+a+NRfl9Z/dEH4XgC
         m+ZbBJnDvzHJWiasFc8BO5jGtjIt8mqrmKV+u44n8cRS6Ye8KC3b6aheDqhecTmMFBlQ
         puZbPJY2fjIJswxf3pKh/wP2kLcJD2tBhD0y/Vsf3gF+7o3sg/IB+MJd8ffip6CwPAT4
         CnMsgaIred/s8aY/lKPtG0OX3PQ5A5OQFPDqduRHs0bYXteT/bqFNu7yFEmvUdjtZ8oG
         bvYQ==
X-Gm-Message-State: ACrzQf3bf+c2p06P77xHL5SQffyc2Wt+Zm944lCPky+osrHbCmly/aI0
	dZnwCJbmEJclHkNegGm/l+RSgw==
X-Google-Smtp-Source: AMsMyM5gVssvdT8h4eN24kleMRIVAAQ4ECAC1Zk0BmlTwjnKzDA7m/P19Hsb/xFjblvC0ZT/L799UQ==
X-Received: by 2002:a05:6512:2211:b0:496:7767:28b with SMTP id h17-20020a056512221100b004967767028bmr3270118lfu.433.1664531900257;
        Fri, 30 Sep 2022 02:58:20 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u24-20020ac24c38000000b0048a934168c0sm249234lfq.35.2022.09.30.02.58.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Sep 2022 02:58:19 -0700 (PDT)
Message-ID: <ba5873fa-83fc-2d16-b8c0-715ae8bf630a@linaro.org>
Date: Fri, 30 Sep 2022 11:58:18 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v1 2/2] dt-bindings: hpet: add loongson2k hpet binding
Content-Language: en-US
To: Yinbo Zhu <zhuyinbo@loongson.cn>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Jianmin Lv <lvjianmin@loongson.cn>,
 Yun Liu <liuyun@loongson.cn>, Yang Li <yang.lee@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 loongarch@lists.linux.dev
References: <20220930093510.10781-1-zhuyinbo@loongson.cn>
 <20220930093510.10781-2-zhuyinbo@loongson.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220930093510.10781-2-zhuyinbo@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/09/2022 11:35, Yinbo Zhu wrote:
> Add the loongson2k High Precision Event Timer (HPET) binding
> with DT schema format using json-schema.
> 
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
> ---
>  .../bindings/timer/loongson,ls2k-hpet.yaml    | 41 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/loongson,ls2k-hpet.yaml
> 
> diff --git a/Documentation/devicetree/bindings/timer/loongson,ls2k-hpet.yaml b/Documentation/devicetree/bindings/timer/loongson,ls2k-hpet.yaml
> new file mode 100644
> index 000000000000..1a8785076228
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/loongson,ls2k-hpet.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/timer/loongson,ls2k-hpet.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Loongson2k High Precision Event Timer (HPET)
> +
> +maintainers:
> +  - Yinbo Zhu <zhuyinbo@loongson.cn>
> +
> +properties:
> +  compatible:
> +    const: loongson,ls2k-hpet
> +
> +  reg:
> +    maxItems: 1
> +
> +  clock-frequency: true

clock frequency of what? I assume it's too early to use common clock
framework and just get the clock?

> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clock-frequency
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    hpet0: hpet@1fe24000 {

Node name: timer
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

You can drop the  "hpet0" label.


Best regards,
Krzysztof

