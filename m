Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D14C6ABD
	for <loongarch@lists.linux.dev>; Sun, 27 Nov 2022 20:49:04 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id j16so14533718lfe.12
        for <loongarch@lists.linux.dev>; Sun, 27 Nov 2022 12:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vR4hvjFZqcJcK9D7nIBiS7pXR2h8XNS5XvEnHFUhGDE=;
        b=mLpVT2EoF2YuKbsQrmK0Up8tniXVmqelZ/a04ghqJhHsC1N4FbhcF6+uNOzeiYLud+
         NJk6n15Ea8qZ4y8VR+iQmweBVzanYTs2Ha4mkSOhwlFf3K9ZuUIxdw3mLW8G0Gt0BZ45
         Sjo0Mrv8dSAjRgpMBriUULmX7mlwkm1b60LvQ+I8lElxEa6EX/u1RaIdMaHq4nBBXkNj
         ww2YHxcuIUncjEtylGaqEi37xBi7ZCYa5E6bCwkLMvAJixQkgrkc+Lhn69+aWzPLNy6d
         iJAiwGjYhmY6hvLyGNd7CEb1xHbi44nU+l2sZvUp86muQr+hebJJQiVoryXU4IIxB614
         ejGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vR4hvjFZqcJcK9D7nIBiS7pXR2h8XNS5XvEnHFUhGDE=;
        b=If6/pE/wT9tPxwrBv8+2fj0k5/ShHnVoSsGLfQ+MacCtkm9SPppc6VsS/WfLeMv7bx
         UoYeTtDk+Wh9tOvb6VlZQA0VzEKNS5GlpkodlDABIaxwJsyMwyTx4uHBrHyCuY2FCuvs
         cmhOxUGXonFMXN+wzOZQe4CI3pIJXOFx0KYzjZpXoA2EaI37nHG+QRd0WFQKezNdbfx0
         Q2HX70kXzHoHeObFErjcDSV3nWsRq5+7s9VyYttPbkT/ROkZWEBWEmnFEXc6001sL8VQ
         //NcA8hme/t5xpX+21WWXa1+JgSkxz5UhJ/bGK3Y4ugUL/+KRJdj1fI9C1zHtijHRR/V
         rf1A==
X-Gm-Message-State: ANoB5pmScxGzw6OXyjxx0FikbUaErUDo20HNltIvonPKpLk+ycr6cRCk
	nQsL14Ik3QaxReMgkNyEWTUUuw==
X-Google-Smtp-Source: AA0mqf47uMAlT8JMFOyJOqlqu4YKZATtET8jVj4qm5LqbktsNhciwtvw8kt3U1yFZtbUdXSXBVmREQ==
X-Received: by 2002:a05:6512:6d:b0:4a8:ebec:7143 with SMTP id i13-20020a056512006d00b004a8ebec7143mr16016485lfo.493.1669582142700;
        Sun, 27 Nov 2022 12:49:02 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id n11-20020a05651203eb00b00497aa190523sm1421668lfq.248.2022.11.27.12.49.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Nov 2022 12:49:02 -0800 (PST)
Message-ID: <61541d15-fbfd-3f99-fc05-663ebf4a2b54@linaro.org>
Date: Sun, 27 Nov 2022 21:49:01 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH V3 3/5] dt-bindings: i2c: add bindings for Loongson LS2X
 I2C
Content-Language: en-US
To: Binbin Zhou <zhoubinbin@loongson.cn>, Wolfram Sang <wsa@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, linux-i2c@vger.kernel.org
Cc: loongarch@lists.linux.dev, devicetree@vger.kernel.org,
 Huacai Chen <chenhuacai@loongson.cn>, WANG Xuerui <kernel@xen0n.name>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jianmin Lv <lvjianmin@loongson.cn>
References: <cover.1669359515.git.zhoubinbin@loongson.cn>
 <57339e73b6c0bfe446e19a7f55a48b7ca640b9ec.1669359515.git.zhoubinbin@loongson.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <57339e73b6c0bfe446e19a7f55a48b7ca640b9ec.1669359515.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/11/2022 09:54, Binbin Zhou wrote:
> Add device tree bindings for the i2c controller on the Loongson-2K Soc
> or Loongosn LS7A bridge.

It's a v3 which is for the first time sent to DT maintainers...

Subject: drop second, redundant "bindings for".

> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  .../bindings/i2c/loongson,ls2x-i2c.yaml       | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml b/Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml
> new file mode 100644
> index 000000000000..8c785f329d2f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/i2c/loongson,ls2x-i2c.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"

Drop quotes form both.

> +
> +title: Loongson LS2X I2C Controller
> +
> +maintainers:
> +  - Binbin Zhou <zhoubinbin@loongson.cn>
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - loongson,ls2k-i2c # Loongson-2K SoCs
> +      - loongson,ls7a-i2c # Loongson LS7A Bridge

Isn't your comment exactly the same as compatible? Where is the
difference? I propose to drop the comment entirely, unless it explains
something.

> +
> +  reg:
> +    maxItems: 1
> +

No clocks? I2C controller without clocks? Are you sure the binding is
complete?

> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +

Best regards,
Krzysztof

