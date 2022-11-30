Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030B53214
	for <loongarch@lists.linux.dev>; Wed, 30 Nov 2022 13:47:39 +0000 (UTC)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-141ca09c2fbso21005195fac.6
        for <loongarch@lists.linux.dev>; Wed, 30 Nov 2022 05:47:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=seGCIQpV/gpvjnLqrRAttrUZC/KeZw23Ao+wHzN0Wd8=;
        b=LoNIDW3pbvIoreY6gOwqdIe3DLAVqQVJCjUK3cO25sCfeSx0kzuv3L8cf7wequGdr1
         ft1HYrscmWVzm5x1pJ40dpkmqtAeOBD66NfxWCySGQRSRSVpvsJX4rIG5BhsDRm0bZvI
         iqECCADyllCMvrW7nie6DYbIgtIkRUyHrqIajuwNyoeBHhc/74oqMen4qzNBOceln3dB
         vx+Q8Yiz21oFNLHky1fQInB0nYsucIfE/rBEFE+N9mjCXWybDAPn+io9Lgx/aEZZfDAz
         505Z57epL9HFCHHOy/N9dauDc1MCr8NuPHCg8u3CWu0oUIEYnAalSogvjF+EPSqu5Zo0
         5gZg==
X-Gm-Message-State: ANoB5pleEN4uvlTE73KE2S7TYQ2Xdovt9Z+MJH4sj7bXZONiJjNH+v6c
	SOKSmZmpVxQ18hbbkjzhtA==
X-Google-Smtp-Source: AA0mqf6bSZBKUGp5+4gpBC4spVxEYTFL+jIgIXJoRus4aB5OZONHshtpPMdps+k6DfC1a9bbxlbGNA==
X-Received: by 2002:a05:6870:6984:b0:13b:254d:6500 with SMTP id my4-20020a056870698400b0013b254d6500mr35322161oab.229.1669816058951;
        Wed, 30 Nov 2022 05:47:38 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r34-20020a056870e9a200b0013b1301ce42sm1152916oao.47.2022.11.30.05.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 05:47:38 -0800 (PST)
Received: (nullmailer pid 1848611 invoked by uid 1000);
	Wed, 30 Nov 2022 13:47:34 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: WANG Xuerui <kernel@xen0n.name>, Wolfram Sang <wsa@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, Jianmin Lv <lvjianmin@loongson.cn>, linux-i2c@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev, Rob Herring <robh+dt@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To:  =?utf-8?q?=3C8503ed054d5b4984b5d6e18891767cace2d36a31=2E166977?=
 =?utf-8?q?7792=2Egit=2Ezhoubinbin=40loongson=2Ecn=3E?=
References: <cover.1669777792.git.zhoubinbin@loongson.cn>  =?utf-8?q?=3C8503?=
 =?utf-8?q?ed054d5b4984b5d6e18891767cace2d36a31=2E1669777792=2Egit=2Ezhoubin?=
 =?utf-8?q?bin=40loongson=2Ecn=3E?=
Message-Id: <166981596682.1846552.1915746875446058794.robh@kernel.org>
Subject:
 Re: [PATCH V4 3/5] dt-bindings: i2c: add bindings for Loongson LS2X I2C
Date: Wed, 30 Nov 2022 07:47:34 -0600


On Wed, 30 Nov 2022 13:55:53 +0800, Binbin Zhou wrote:
> Add Loongson LS2X I2C controller binding with DT schema format using
> json-schema.
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  .../bindings/i2c/loongson,ls2x-i2c.yaml       | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.example.dts:25.30-31 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:406: Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1492: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/8503ed054d5b4984b5d6e18891767cace2d36a31.1669777792.git.zhoubinbin@loongson.cn

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

