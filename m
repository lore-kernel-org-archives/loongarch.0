Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478C715AC3
	for <loongarch@lists.linux.dev>; Fri, 16 Jun 2023 09:59:18 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-51a2c60c529so623974a12.3
        for <loongarch@lists.linux.dev>; Fri, 16 Jun 2023 02:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686909556; x=1689501556;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z0kVN4uJ2t6EXhxGAHJQ7Af/HYSNhGQj+DL7pRhqY+A=;
        b=liDkAwN+gjKjXNRRQ/j5BbR2bHRs+ioFBaRsdJyeB6BaB+k55wVdUrAICLpQ3q/c+d
         +x9YqitUwz2laN87zOH95H+OQIW1AqYhGp/KL3VD83VLgDi5Mf6hTotj+nnOWEZHIEkI
         pNjKr0KARmuNd/UXKILCs7g5rWWmZM7WNqhteJYbOg4ZbwD/syEPAvUHHy85PVXodFcm
         9ORNIBX3IjNokCaPY3vzXtYG+n5Q9RTzl2KL9HuicXiYDZeZvsil9GiB+s+436MnwJU6
         75T6wXM2r5JvVAWJWBEoIS8s2kKOxdT9zJdKZ5BMAXxZ7PcTZLt2Tb7tGAD41LkowIwj
         IQww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686909556; x=1689501556;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z0kVN4uJ2t6EXhxGAHJQ7Af/HYSNhGQj+DL7pRhqY+A=;
        b=hKqu1ns8seNZs51LqquT97RSR8VSHpaEaOVG7Kx8+wa0aL8cc7AvEOJp2ztGP1uhi3
         lLJW/aYp9wYyjhg1HFev31bPtasYYWriIyxboEj578Y93/TguREtB1WTf6zQeTj458uK
         hookyrzhaeqzBLw24N0n+OydQyqXmz/H178lmoSHELV0VIMxDzI2mZ93V9kZUNuMg0TV
         j9GCNyLTaoN1Gzfm8JcaScDN66KlyGj8b07Fu3ub+dvd8Zgw/2a8f+GEb44mNzFqihLx
         wLJAYDLvBZ1EHBzpqCGJ4v3LFR5qvna9RvuGJwQ3kDgXL3LFNvFuwchc7Qq4XY/rzlNE
         +B0g==
X-Gm-Message-State: AC+VfDyghqFxeW+u+g5svf+WThfRbrGitoUX81tO3f6LunfohZIxZAPG
	p1Q+40nLS+Gk5XefbNrVnC5W6g==
X-Google-Smtp-Source: ACHHUZ4E4gTgAo61EQOIM9JWP0xKrmQTtHA1n0R7+mNOO3uVHQxrA8Gb7YCsXU9CoyVkm7HHqjyj2Q==
X-Received: by 2002:a05:6402:354:b0:519:a5cc:e66e with SMTP id r20-20020a056402035400b00519a5cce66emr789487edw.18.1686909556514;
        Fri, 16 Jun 2023 02:59:16 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id j17-20020aa7ca51000000b00518710798b3sm4578496edt.50.2023.06.16.02.59.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jun 2023 02:59:16 -0700 (PDT)
Message-ID: <493a28b2-8ad5-2e9a-462b-bdc7d585b722@linaro.org>
Date: Fri, 16 Jun 2023 11:59:14 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 5/6] LoongArch: DeviceTree for Loongson-2K1000
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
 <99bdbfc66604b4700e3e22e28c3d27ef7c9c9af7.1686882123.git.zhoubinbin@loongson.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <99bdbfc66604b4700e3e22e28c3d27ef7c9c9af7.1686882123.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/06/2023 08:11, Binbin Zhou wrote:
> Add DeviceTree file for Loongson-2K1000 processor, which integrates two
> 64-bit dual emission superscalar LA264 processor cores.
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  arch/loongarch/boot/dts/Makefile            |   3 +-
>  arch/loongarch/boot/dts/loongson_2k1000.dts | 565 ++++++++++++++++++++
>  2 files changed, 567 insertions(+), 1 deletion(-)
>  create mode 100644 arch/loongarch/boot/dts/loongson_2k1000.dts
> 
> diff --git a/arch/loongarch/boot/dts/Makefile b/arch/loongarch/boot/dts/Makefile
> index 0e5ed373b1b4..c0464bb8e430 100644
> --- a/arch/loongarch/boot/dts/Makefile
> +++ b/arch/loongarch/boot/dts/Makefile
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  
> -dtb-$(CONFIG_MACH_LOONGSON64)	= loongson_2k0500.dtb
> +dtb-$(CONFIG_MACH_LOONGSON64)	= loongson_2k0500.dtb \
> +				  loongson_2k1000.dtb
>  
>  obj-$(CONFIG_BUILTIN_DTB)	+= $(addsuffix .dtb.o, $(CONFIG_BUILTIN_DTB_NAME))
> diff --git a/arch/loongarch/boot/dts/loongson_2k1000.dts b/arch/loongarch/boot/dts/loongson_2k1000.dts
> new file mode 100644
> index 000000000000..9fd9d400d97f
> --- /dev/null
> +++ b/arch/loongarch/boot/dts/loongson_2k1000.dts
> @@ -0,0 +1,565 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/clock/loongson,ls2k-clk.h>
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +	model = "LS2K1000 Reference Board";
> +	compatible = "loongson,ls2k1000";
> +

All the same comments apply here. Don't mix SoC (DTSI) with boards.

It does not look like you tested the DTS against bindings. Please run
`make dtbs_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).

Best regards,
Krzysztof

