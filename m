Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17212185F
	for <loongarch@lists.linux.dev>; Wed, 19 Oct 2022 12:31:14 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id f22so11507550qto.3
        for <loongarch@lists.linux.dev>; Wed, 19 Oct 2022 05:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=whlykbQsNRDmBUFhZqH43vmu3PG1yI/9OA5fIpYLMqI=;
        b=qNV4e3eA/V25xQDFfA53+l3QpBYZ4hKhtUdH4C2TCUXYtZUJv1WoLDiQtRweDm9KwA
         GDuxKtKUYvRSWkZmN+Qv1Hjx2cRuHBRZJDkmJiySsa43OQBtwlznBctHWmzUeulQ0I43
         hfQDS21yFxMeZWGtCGpsjLPh1BADnewcVXX7uhtEOomWZpPsZVjcTZXoykB9OcxdeGp/
         zZHRvksJn5SYp++R+TLj1PrPd52JoulzvzNxxyvKJk2Lt+eqTA6pNH0mZzy5c4FnzYy8
         t3n5IB4dXC6cauJXazobwnH2cenhVPsKfnpLPU1TSUTkGF2pYf6/v+I84sQqiGYRxPZl
         InCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=whlykbQsNRDmBUFhZqH43vmu3PG1yI/9OA5fIpYLMqI=;
        b=afTM2mI09oAtHG5gZ/GA6IQrfRvJxOZbV3UGeRj4guYoN7WiuTLAl69Ae78ifuj3LA
         jiWRJBefN3OJl5qVYAIrVK1ql6xkgFmM6S9TqjJLWfRpLEBjRCAO+MDTzAyCyxaOzoGT
         72qSlm/f91vGhjVHfppSr/dHj0UIMJeZGI+rOvy6PTmOza5I2eJ6Ce5hzb7JYR1ko1EB
         S9k6l4b60V6ihYaFXfl4jIq6cM7V2A0BFAvgCH0BPrkvoXVNnhH6v3rSZSoDu5SB9vuj
         MvPArtX04F0TErxtMvSau3aR/YTcLp3aBwYwHkywYGV3PzoWFdQSdGlThx1pgoqj21P/
         4cPA==
X-Gm-Message-State: ACrzQf0x9RJt7RGHJprbgGiDZIMBzlbENVHL1JMMnXDLx5TnZq1tvaii
	cI/AaZLi0hCyHLBrfPe0GrsRuQ==
X-Google-Smtp-Source: AMsMyM7bUSOzzZ6K0iuspDrCqy2b1YagSH5wAqYiNXw/7EInOLjCDS1oLVxV6rMmh9ZpGER8tXYtrg==
X-Received: by 2002:a05:622a:15d1:b0:39c:f1da:fe0e with SMTP id d17-20020a05622a15d100b0039cf1dafe0emr6113062qty.662.1666182672542;
        Wed, 19 Oct 2022 05:31:12 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id h3-20020ac87763000000b0035d5e5660cbsm3899065qtu.59.2022.10.19.05.31.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Oct 2022 05:31:11 -0700 (PDT)
Message-ID: <9e3fb6b4-c929-66b9-a1de-d39f2893c37d@linaro.org>
Date: Wed, 19 Oct 2022 08:31:10 -0400
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2 3/3] dt-bindings: clock: add loongson2 clock binding
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
References: <20221019062912.3463-1-zhuyinbo@loongson.cn>
 <20221019062912.3463-3-zhuyinbo@loongson.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221019062912.3463-3-zhuyinbo@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/10/2022 02:29, Yinbo Zhu wrote:
> Add the loongson2 clock binding with DT schema format using
> json-schema.
> 
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>

Drop redundant (last) binding from the title.


> ---
> Change in v2:
> 		1. Drop "Binding" string in the title.
> 		2. Drop entire allOf and move the contents to top level.
> 		3. Change string "refclk_100m" to "ref_100m". 
> 
>  .../bindings/clock/loongson,ls2k-clk.yaml     | 64 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml b/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml
> new file mode 100644
> index 000000000000..104e38a618e2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/loongson,ls2k-clk.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Loongson2 SoC Clock Control Module
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
> +    items:
> +      - description: 100m ref
> +
> +  clock-names:
> +    items:
> +      - const: ref_100m
> +
> +  '#clock-cells':
> +    const: 1
> +    description:
> +      The clock consumer should specify the desired clock by having the clock
> +      ID in its "clocks" phandle cell. See include/dt-bindings/clock/loongson,ls2k-clk.h
> +      for the full list of loongson2 SoC clock IDs.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    ref_100m: clock-ref-100m {
> +        compatible = "fixed-clock";
> +        #clock-cells = <0>;
> +        clock-frequency = <100000000>;
> +        clock-output-names = "ref_100m";
> +    };
> +
> +  - |

Drop this. This splits examples into two separate ones, but you have
here only one example.

> +    clk: clock-controller@1fe00480 {
> +        compatible = "loongson,ls2k-clk";
> +        reg = <0x1fe00480 0x58>;
> +        #clock-cells = <1>;
> +        clocks = <&ref_100m>;
> +        clock-names = "ref_100m";
> +    };

Best regards,
Krzysztof

