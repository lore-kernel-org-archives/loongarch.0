Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55DF7B
	for <loongarch@lists.linux.dev>; Tue, 25 Oct 2022 14:49:31 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id j21so8174027qkk.9
        for <loongarch@lists.linux.dev>; Tue, 25 Oct 2022 07:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8YP5wWUEEBMY2PTNKrTu3Hh2pQmEm7huU1HOYVz0Rwk=;
        b=jwEJWV/zFdZ896Mkmss4/ajlWv6Os+0/UtK8gEBYdYtX5hvHY0/rI58TAvELkvqVsE
         YJargWbH5W1QyduIbf7U2FNwQcQvsAmEyafhApayU/O8VFZIDia/USrcnbhY0bouVtok
         2HwauXBFcJTpxlvgaY70ySmMsiDBUGAge285taKQC9lM07fL4/70Xr+lHmbgTxNOQybU
         q2hM+fHtSfR71pvx5/bB54JFwT/1RwiqtQ2mnzlAWHCDfRE2stpV6SvhOWjj35LMof4W
         NP1SxoAnNIAI/e+72XdoNM9mVuBXlyQYehDWrG0jwSTWdImJl5cP1bNpiQFnpplwjPKc
         Hb/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8YP5wWUEEBMY2PTNKrTu3Hh2pQmEm7huU1HOYVz0Rwk=;
        b=MycHySNn0Hnci/nFyOlTOmxaPX5kqVXKyB7G3Lc73YoyGYjSOQHlxEL9/vgyxCWoh7
         etjFR5UOZo9Gr8VPf80zbHcINinxLjl96nIWzjhXCn7T80HWHRCErUzSINzVpGplKUH5
         5cv3tTquq14LYZkR2ZY4tiVyptg/OvzQFKT9wYKnRHg8k1wIhiH+l+jDnLOfcQQ+clll
         H1icXXVmNXDmY+jLoHRFtfIho1gOZLGJr3P3ce5qsT5xnVdQ3Iwm3+m/vgaWIEwT05y6
         6KzqZZ5DvH1Y/k9qDEWsTgiY1UwHx9/h+aVdkkV2I7jWDXWkp8z0kxAk22JYJmmZ9cax
         etFg==
X-Gm-Message-State: ACrzQf1Yb6eGbMmzpJxmB32QdEqDZ9yhpyP2p8y5Zp2fICwD6HdOgKyc
	X6qasfZXvF8QEWQV7/b89kw+8w==
X-Google-Smtp-Source: AMsMyM6CxSbFXx8tIMJFyF8KEBlAnnnHYsyGOMTSwcPVWCGa6Me8gw8xFad19rxKtM7zhMtCSDY/FQ==
X-Received: by 2002:a05:620a:484c:b0:6ee:9acb:dfdc with SMTP id ec12-20020a05620a484c00b006ee9acbdfdcmr26735181qkb.594.1666709370859;
        Tue, 25 Oct 2022 07:49:30 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id m17-20020ae9e711000000b006ed61f18651sm2155611qka.16.2022.10.25.07.49.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 07:49:30 -0700 (PDT)
Message-ID: <d181924f-d87b-cad3-400a-dec22d3b29a6@linaro.org>
Date: Tue, 25 Oct 2022 10:49:28 -0400
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v3 2/2] dt-bindings: hpet: add loongson2 hpet
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
References: <20221021010925.21604-1-zhuyinbo@loongson.cn>
 <20221021010925.21604-2-zhuyinbo@loongson.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221021010925.21604-2-zhuyinbo@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/10/2022 21:09, Yinbo Zhu wrote:
> Add the loongson2 High Precision Event Timer (HPET) binding
> with DT schema format using json-schema.
> 
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
> ---
> Change in v3:
> 		1. Update dts that base on common clock framework.
> 
>  .../bindings/timer/loongson,ls2k-hpet.yaml    | 50 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/loongson,ls2k-hpet.yaml
> 
> diff --git a/Documentation/devicetree/bindings/timer/loongson,ls2k-hpet.yaml b/Documentation/devicetree/bindings/timer/loongson,ls2k-hpet.yaml
> new file mode 100644
> index 000000000000..01656048858a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/loongson,ls2k-hpet.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/timer/loongson,ls2k-hpet.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Loongson2 High Precision Event Timer (HPET)
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
> +  clocks:
> +    items:
> +      - description: SoC apb clock
> +
> +  clock-names:
> +    items:
> +      - const: apb_clk

Just: apb

> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/loongson,ls2k-clk.h>

Your patchset is now untestable/unapplicable because you have a
dependency. You need to explain the dependencies in the cover letter or
in the patch changelog (---).


Best regards,
Krzysztof

