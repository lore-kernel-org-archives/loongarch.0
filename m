Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B9223A3
	for <loongarch@lists.linux.dev>; Fri, 28 Oct 2022 12:20:07 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id r83so5951565oih.2
        for <loongarch@lists.linux.dev>; Fri, 28 Oct 2022 05:20:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GS27YxTROfugF/wVZbzeCMhNKTwEI+7kiEMnQj/EQrE=;
        b=8Ctu9EXKQp1eAxJh0d2GcK4b497cEXVitmDGltSxUCqte6/6dUIG5htfkGDc+3jLBD
         dj3S6AgGrDJ0Wp2YYHWw9vglHDlY+3xDuapsxVl5mICJqWnh7NYCXcxHXt/lUrk/pQLr
         OlMRfCypTEjyN7Z8u+yeJ9sDlYDIDr2gu9q74zT0qc8JFyXtK2dpSQUXMCJdvwhuZK4P
         EDLYXTq76heE2Kc0OtU8zostcSIptyjmzqKyFowahQK79g4Kml7EZu7kzGvgSPs2ro0P
         eDBbQCdRokOedf5JxhT73MS/yCSfuLC0CjKvGxGsQ19ld+ndWn12qIF72KQk4qqtp0nD
         rI3w==
X-Gm-Message-State: ACrzQf0Tx/IjFmqrInjE1UzZTusagacY+ZjIWxDYnUULzbkGu8N/LhcY
	X+fY5qKABwyw76pLREFSNw==
X-Google-Smtp-Source: AMsMyM654wy/VermBsr6jXijH34jpCZlwSxa507GFx8XdZTumRNnQbRpMmh3u7vFH90EDhUf9AYZRg==
X-Received: by 2002:a05:6808:ec4:b0:354:475a:c101 with SMTP id q4-20020a0568080ec400b00354475ac101mr8080836oiv.56.1666959606450;
        Fri, 28 Oct 2022 05:20:06 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id n15-20020a0568301e8f00b00661946468c6sm270107otr.31.2022.10.28.05.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 05:20:05 -0700 (PDT)
Received: (nullmailer pid 1079533 invoked by uid 1000);
	Fri, 28 Oct 2022 12:20:05 -0000
From: Rob Herring <robh@kernel.org>
To: Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Yun Liu <liuyun@loongson.cn>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org, loongarch@lists.linux.dev, Huacai Chen <chenhuacai@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Jianmin Lv <lvjianmin@loongson.cn>, WANG Xuerui <kernel@xen0n.name>, Yang Li <yang.lee@linux.alibaba.com>, Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20221028073222.21609-2-zhuyinbo@loongson.cn>
References: <20221028073222.21609-1-zhuyinbo@loongson.cn> <20221028073222.21609-2-zhuyinbo@loongson.cn>
Message-Id: <166695949216.1076967.15883740834218408019.robh@kernel.org>
Subject: Re: [PATCH v5 2/2] dt-bindings: hpet: add loongson-2 hpet
Date: Fri, 28 Oct 2022 07:20:05 -0500
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

On Fri, 28 Oct 2022 15:32:22 +0800, Yinbo Zhu wrote:
> Add the Loongson-2 High Precision Event Timer (HPET) binding
> with DT schema format using json-schema.
> 
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> Change in v5:
> 		1. Replace string loongson2/Loongson2 with Loongson-2/loongson-2.
> 		2. Add the patch review information.
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

