Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EE87E
	for <loongarch@lists.linux.dev>; Sat, 26 Nov 2022 22:25:38 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id e189so5250769iof.1
        for <loongarch@lists.linux.dev>; Sat, 26 Nov 2022 14:25:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/RMyYOFIS/k1shCeQijOTAmK/nl8iYEKcVhmij4E6XQ=;
        b=AEU/CCx0N7fP4zsCzS7+dOZtXqQ2x3PD8g0c7IVhVop3yY1/uM4JUTI9VgRJnrbcah
         aOThQMz7pGynqLyrJj4+gqh4qW/AqlM6JOROJicGr4wHIBzaoQ/SFAYXZNGzqFUlhyrY
         YdvkhRGwz60I1W+S1oGZCwPqUgZFUg2vivr2QIuu5BkqIwE1kHcgQYE60wNArWIg72xe
         362E9AaYcIJJ59RtrraT3fcu5vZma+Dg0avA4XnsJRm7fqRih1FRsrIxm0SajCoQRF+q
         fEqWFjM26dfoUR3LftlhjHx+AJh6vyYdukwzpL3TM6ZipNlBJSvQEzjyUN9LgH+fxIZv
         EnLQ==
X-Gm-Message-State: ANoB5pmAFXlRhKrB3w5o4zTZuuy8bZyJVtjGaDG1jHT7Y++aV46whlM0
	mL77mLxbhhdxESzrgkSwoQ==
X-Google-Smtp-Source: AA0mqf6L5vpWQSgA/6k8bcYQ9iY//s4vl30Rngyl90snp4mmdp+Xi+UVan/7Qhv91B1sR/JhIJYCkg==
X-Received: by 2002:a02:9547:0:b0:375:3dd1:743c with SMTP id y65-20020a029547000000b003753dd1743cmr13248207jah.281.1669501537580;
        Sat, 26 Nov 2022 14:25:37 -0800 (PST)
Received: from robh_at_kernel.org ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id c12-20020a02330c000000b003898778bed7sm2202159jae.134.2022.11.26.14.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 14:25:37 -0800 (PST)
Received: (nullmailer pid 35349 invoked by uid 1000);
	Sat, 26 Nov 2022 22:25:36 -0000
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
Cc: WANG Xuerui <kernel@xen0n.name>, Jianmin Lv <lvjianmin@loongson.cn>, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, Huacai Chen <chenhuacai@loongson.cn>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Rob Herring <robh+dt@kernel.org>, loongarch@lists.linux.dev, Wolfram Sang <wsa@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To:  =?utf-8?q?=3C57339e73b6c0bfe446e19a7f55a48b7ca640b9ec=2E166935?=
 =?utf-8?q?9515=2Egit=2Ezhoubinbin=40loongson=2Ecn=3E?=
References: <cover.1669359515.git.zhoubinbin@loongson.cn>  =?utf-8?q?=3C5733?=
 =?utf-8?q?9e73b6c0bfe446e19a7f55a48b7ca640b9ec=2E1669359515=2Egit=2Ezhoubin?=
 =?utf-8?q?bin=40loongson=2Ecn=3E?=
Message-Id: <166950113038.8130.14678253677023396314.robh@kernel.org>
Subject:
 Re: [PATCH V3 3/5] dt-bindings: i2c: add bindings for Loongson LS2X I2C
Date: Sat, 26 Nov 2022 16:25:36 -0600


On Fri, 25 Nov 2022 16:54:13 +0800, Binbin Zhou wrote:
> Add device tree bindings for the i2c controller on the Loongson-2K Soc
> or Loongosn LS7A bridge.
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  .../bindings/i2c/loongson,ls2x-i2c.yaml       | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.example.dtb: i2c@1fe21000: reg: [[0, 534908928], [0, 8]] is too long
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.example.dtb: i2c@1fe21000: Unevaluated properties are not allowed ('reg' was unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/57339e73b6c0bfe446e19a7f55a48b7ca640b9ec.1669359515.git.zhoubinbin@loongson.cn

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command.

