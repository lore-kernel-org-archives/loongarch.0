Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BC42F56
	for <loongarch@lists.linux.dev>; Sun,  9 Oct 2022 15:33:10 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id hh9so5332089qtb.13
        for <loongarch@lists.linux.dev>; Sun, 09 Oct 2022 08:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=alea5whSDUVTPbowFf3bGNlQG2HJr/Ik7qIqYtiqvTk=;
        b=HS0laf0rxGfHw66zEFpXE/EHMArH0FKANJ/omEtc0SYQBwXvY5BGsdlFGV1dmdnyGR
         YicBBdDQQ3hWmZLMQHeIp4micRVbrV2IijZxyGW2N8yaXVj90RvMOMK7qEsIFUHAAUm5
         JkJQ5LhaFQSrFgOUOPnORVK3aY9D4fRODY1huF/fuFyEizAncc8jHxlVNLuKvgqUDDdj
         Sdx2dmIUJ9PYqm5Cah7cn4jZRG5wa56AuhDu6AE3qF260Sx0qWVREqaSu2K8A6K7S6lg
         UsdbIW+JQTxaU7PbZzbpxhtv65igYblGKhtCLGSiUtUbAcgw+qR21SUEZEAanSMBWDVt
         ao4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=alea5whSDUVTPbowFf3bGNlQG2HJr/Ik7qIqYtiqvTk=;
        b=tBPP1KZjZZN107MWrWhOxhaVyWO1+xmR28pZQV2c1fEsa5zIQ952fjHmSUJiORnc/a
         rEffbjFkfb3hM1dDx8goFdaabo1OILtyniMTEBrqLrf8XfIG4ENLedVk7LJpfDrUMkou
         +DGl0I35bvcu1YnT6dkY0CMlbKV3AMAqEarvKmzfvkx//4IoJcMRM8k1mQ1C4yuPh2FC
         k+9+G6TqhKFrDuxPi3ufhIwiOob8Ucybx2dqjlrm2tzwzJ75DfnhMMw0One63nvwqoFU
         5SdG5dRayJU6LEAjww6UV0CURcu3BWTvzTw2TJQiQzwRNMZt+14zWeC4pAaifieckZGY
         u2cg==
X-Gm-Message-State: ACrzQf0aeRrJTLf2kVHi6WLd0MmWBYKByKahdgJEk5brjOjPqs2LIGSB
	HktVz7m+uRLLW11VJn4MbM8K9A==
X-Google-Smtp-Source: AMsMyM5OlLEChYwipvywf7QaFVCYA0Eh3Ihq4AiAvnwYfgPu1QwTschTq/M4uW5tbfaHRTpmPr6yEg==
X-Received: by 2002:a05:622a:3ca:b0:398:db76:9072 with SMTP id k10-20020a05622a03ca00b00398db769072mr4114225qtx.301.1665329589111;
        Sun, 09 Oct 2022 08:33:09 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id r9-20020a05620a298900b006ce3cffa2c8sm7946350qkp.43.2022.10.09.08.33.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Oct 2022 08:33:08 -0700 (PDT)
Message-ID: <b4025a37-9589-e10e-7a60-ceee7e96443e@linaro.org>
Date: Sun, 9 Oct 2022 17:30:55 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 2/2] dt-bindings: hpet: add loongson2k hpet binding
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
References: <20221008063710.12241-1-zhuyinbo@loongson.cn>
 <20221008063710.12241-2-zhuyinbo@loongson.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221008063710.12241-2-zhuyinbo@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/10/2022 08:37, Yinbo Zhu wrote:
> Add the loongson2k High Precision Event Timer (HPET) binding
> with DT schema format using json-schema.
> 
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
> ---
> Change in v2:
> 		1. Drop the  "hpet0" label.
> 		2. Modify the hpet node name to timer.
> 
>  .../bindings/timer/loongson,ls2k-hpet.yaml    | 41 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/loongson,ls2k-hpet.yaml
> 
> diff --git a/Documentation/devicetree/bindings/timer/loongson,ls2k-hpet.yaml b/Documentation/devicetree/bindings/timer/loongson,ls2k-hpet.yaml
> new file mode 100644
> index 000000000000..1805f2608de8
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

What clock? You did not answer to this one...

What values can go here?

Use Common Clock Framework instead (you did not say that it's not
possible, so I assume it's fine).

> +
> +  interrupts:

Best regards,
Krzysztof

