Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCC64C64
	for <loongarch@lists.linux.dev>; Tue, 18 Oct 2022 13:45:55 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id f22so9626350qto.3
        for <loongarch@lists.linux.dev>; Tue, 18 Oct 2022 06:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=drTjJKcD8QJOd10zQ0gum6cJSH3rnvYwTkLWAPWtxQ8=;
        b=J5zc6fWalORUSCdW1JctbKrNHS0caAhuRwj/l9+2ZWLPK56QNsX8ofOMISnF75kO1b
         wDPDD5RVf607JAIQNn+zPEkowObf1NgW6Ck45kB8RUtDmEhMkqOQV9VoSQqfV0pufqyN
         rNRS3i1FS7DgePYL8ggzvVHF8ooR7oiCG1ahazTF+iqItUJQPMYdi+BFPlqzf2da3zZ2
         sqGRMVsIKdZqPbJYTLGhsZ4w/wY1EwAOhte9jADyXxC4nfupWmUV6Dnd4+Y53mLVP3QF
         rO8UxqQt2RfIAt9NziZB5CoCDZcdqIb+0Ynk9wo6dPYcHDyTH9OK6NcA16FrJdOTvYJM
         lqIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=drTjJKcD8QJOd10zQ0gum6cJSH3rnvYwTkLWAPWtxQ8=;
        b=YBa3o0BkmWr2Im0qgk3FZpfGdk0MW5123KJdXr0TTUhNfruiue2aevISHfF09X3Jxo
         ck5D5KjreNNegGTYK4yrGAqqlJ8CsYOC8touXf/WzQ8UtcaPj10uqgzv8cbsn2MO3aTR
         3PCi/hTtonvNy95imWvPGVifAxKO+D0AtZeEdKV8dE+RPeSDrwFWPI26ykFOamZVpIcA
         bgFyvy3DZYb6jfP035lzI+YX1rIUHCUHlKwXI2lAMefkLRJ4zMBREH0EDnvK2uU/LfYa
         G6TuZQFHU4hyK+4Daef3/J2hx9cKbQyPVUun5Tu0D5M7S4zXoP17nFRJ0u2HyXZpE0BI
         YP9g==
X-Gm-Message-State: ACrzQf3JpY4QuYXzSU2aXhlsf9C7dzfL4VNCApigclEp0JKDfCByaK3H
	e9j53MGFVngeNh+79/LHfJWwwQ==
X-Google-Smtp-Source: AMsMyM4JkuiI01HNBhFX//zuBopPACdJXHKVAHoOUBuLa+96jKJfM3o2PgCLeFHCwdEj+oTWnZGs7A==
X-Received: by 2002:ac8:5cc3:0:b0:39c:f695:d39b with SMTP id s3-20020ac85cc3000000b0039cf695d39bmr1592305qta.468.1666100754519;
        Tue, 18 Oct 2022 06:45:54 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id bi26-20020a05620a319a00b006ce7bb8518bsm2514104qkb.5.2022.10.18.06.45.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Oct 2022 06:45:53 -0700 (PDT)
Message-ID: <37dfc849-a822-661f-4816-f8fe917a1e2c@linaro.org>
Date: Tue, 18 Oct 2022 09:45:47 -0400
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v1 3/3] dt-bindings: clock: add loongson2k clock binding
Content-Language: en-US
To: Yinbo Zhu <zhuyinbo@loongson.cn>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Jianmin Lv <lvjianmin@loongson.cn>,
 Yang Li <yang.lee@linux.alibaba.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev
References: <20221018130531.301-1-zhuyinbo@loongson.cn>
 <20221018130531.301-3-zhuyinbo@loongson.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221018130531.301-3-zhuyinbo@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/10/2022 09:05, Yinbo Zhu wrote:
> Add the loongson2k clock binding with DT schema format using
> json-schema.
> 
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
> ---
>  .../bindings/clock/loongson,ls2k-clk.yaml     | 77 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 78 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml b/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml
> new file mode 100644
> index 000000000000..cf42e7cd4c7e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/loongson,ls2k-clk.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Loongson2 SoC Clock Control Module Binding

Drop "Binding"

> +
> +maintainers:
> +  - Yinbo Zhu <zhuyinbo@loongson.cn>
> +
> +description: |
> +  Loongson2 SoC clock control module is an integrated clock controller, which
> +  generates and supplies to all modules.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - loongson,ls2k-clk
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1

maxItems instead

> +
> +  clock-names:
> +    minItems: 1

Just list the items here.

> +
> +  '#clock-cells':
> +    const: 1
> +    description:
> +      The clock consumer should specify the desired clock by having the clock
> +      ID in its "clocks" phandle cell. See include/dt-bindings/clock/loongson2-clock.h
> +      for the full list of loongson2 SoC clock IDs.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: loongson,ls2k-clk
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: 100m refclk
> +        clock-names:
> +          items:
> +            - const: refclk_100m

Drop entire allOf and move the contents to top level.

Name just: "ref_100m"

>  

Best regards,
Krzysztof

