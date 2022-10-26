Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE44111E
	for <loongarch@lists.linux.dev>; Wed, 26 Oct 2022 12:36:05 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id n130so18263182oia.6
        for <loongarch@lists.linux.dev>; Wed, 26 Oct 2022 05:36:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rm41MowY05sJRqfXfoxzAmqqrLaTLbUM9gClxYnyOow=;
        b=aoYtSUqn91BD4VqQPZO13d04MO/yuxH5yMLpqI7NQcv8iE17rdYYo4qT45PRnHLUPS
         mEqv46ovhWynDU9M1aM3LxHcerkOsHM7pj4yejpuKwgAu5rg1Ofn5gXlGbWXq9TIDHEd
         8vZKY+kvT+rybTH/lb7rb8Zr75dNVph/ypqN6qeTS3whBmKeNpzkRPOXBgkVP2Yw4pZ0
         NFbIb8zp92LquNL4Mhq0Wma3k2D5CoL9yH4JRJhG74GKF5f9owVU/ToM3TVAjD6YTzNV
         4i+3GMVK4FB0E7NIM+5uLaiKZUdNcfzILcO9KjQ8WIwvrA62Y+NQc/nvI8P3kiymgLLL
         RJBw==
X-Gm-Message-State: ACrzQf0d90LEwWZnrHRr5O7yvsTUGcbX8cF5zMLLSuyxeWV4CIeRxeRf
	yTaa3K7Q8OgTPPwsgzaaZw==
X-Google-Smtp-Source: AMsMyM6duJO0gmR8nZl6HIMYUcghPQyMdR8djOWJsGUC4WlydXSFxuJPtsjlClzbZvqef+U12QY7jA==
X-Received: by 2002:a05:6808:1404:b0:355:4cd4:b10b with SMTP id w4-20020a056808140400b003554cd4b10bmr1667530oiv.207.1666787764113;
        Wed, 26 Oct 2022 05:36:04 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r26-20020a4ae51a000000b0047f8ceca22bsm2129712oot.15.2022.10.26.05.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 05:36:03 -0700 (PDT)
Received: (nullmailer pid 277723 invoked by uid 1000);
	Wed, 26 Oct 2022 12:36:02 -0000
From: Rob Herring <robh@kernel.org>
To: Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Yun Liu <liuyun@loongson.cn>, Yang Li <yang.lee@linux.alibaba.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, Daniel Lezcano <daniel.lezcano@linaro.org>, Jianmin Lv <lvjianmin@loongson.cn>, devicetree@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, loongarch@lists.linux.dev
In-Reply-To: <20221026035752.32681-2-zhuyinbo@loongson.cn>
References: <20221026035752.32681-1-zhuyinbo@loongson.cn> <20221026035752.32681-2-zhuyinbo@loongson.cn>
Message-Id: <166678762827.274703.1754327957580321197.robh@kernel.org>
Subject: Re: [PATCH v4 2/2] dt-bindings: hpet: add loongson2 hpet
Date: Wed, 26 Oct 2022 07:36:02 -0500
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

On Wed, 26 Oct 2022 11:57:52 +0800, Yinbo Zhu wrote:
> Add the loongson2 High Precision Event Timer (HPET) binding
> with DT schema format using json-schema.
> 
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
> ---
> Change in v4:
>                 1. Fixup the clock-names that replace apb-clk with apb.
>                 2. This patch need rely on clock patch, which patchwork
>                    link was "https://patchwork.kernel.org/project/linux-clk/list/?series=688892".
> 
>  .../bindings/timer/loongson,ls2k-hpet.yaml    | 50 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/loongson,ls2k-hpet.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/timer/loongson,ls2k-hpet.example.dts:21:18: fatal error: dt-bindings/clock/loongson,ls2k-clk.h: No such file or directory
   21 |         #include <dt-bindings/clock/loongson,ls2k-clk.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:406: Documentation/devicetree/bindings/timer/loongson,ls2k-hpet.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1492: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

