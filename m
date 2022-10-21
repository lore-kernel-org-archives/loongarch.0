Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5F57E
	for <loongarch@lists.linux.dev>; Fri, 21 Oct 2022 02:29:14 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id p127so1736269oih.9
        for <loongarch@lists.linux.dev>; Thu, 20 Oct 2022 19:29:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zeRfb2XRWefyhhuSIvUFSXrC6TpkJoLTjEkTZ9UuysI=;
        b=n9f0wBa9NVOx302r4r9wL4MovIUgW40pCMIxXZlx2cdUgNzWbkcmjw5gFC9xKxJZCZ
         lOdShj3mHIc9broVPLa8ZDXD86Bb5dWNvSoh7TZhyHxvVuOvBT5H7aaXSPWpm4Hqcw0k
         VjGZxN3Yj0ix5bSvCequW7JRAvh4yJyspPb7ZgrsCjsXounIQSJbtlhIRgffNW+7XMlk
         hpdZoJBNlIINUZ30BbgEO+F+P/SDaadyzInse4+7eFwNe4f041tv+2rn97ZObKqaItL/
         b/lNwQY+HdfrO/oP4cJ7D7NqVHepIdVFWhoEeSk8Bc4/6aPOX7lRxBe53cMOPTInnn8K
         rdsg==
X-Gm-Message-State: ACrzQf05UtlhnWPzuoCRr1qoSxfp5/jPu0phJbpxfWI5+yMaM9R4HEhK
	2V+tVcUDOF5iJPohD/U8/A==
X-Google-Smtp-Source: AMsMyM5grMdTsY3sTGXuUp6WdUy3spEjRHLTwzrbXntW9n4h2EOCB+HWR1nAvp+/FmhChF/kG2IAgQ==
X-Received: by 2002:a05:6808:1186:b0:353:b77a:a481 with SMTP id j6-20020a056808118600b00353b77aa481mr23333601oil.199.1666319353928;
        Thu, 20 Oct 2022 19:29:13 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id o17-20020a056870969100b0013626c1a5f6sm9725151oaq.10.2022.10.20.19.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 19:29:13 -0700 (PDT)
Received: (nullmailer pid 2201590 invoked by uid 1000);
	Fri, 21 Oct 2022 02:29:15 -0000
From: Rob Herring <robh@kernel.org>
To: Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: Yang Li <yang.lee@linux.alibaba.com>, linux-kernel@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, loongarch@lists.linux.dev, WANG Xuerui <kernel@xen0n.name>, Rob Herring <robh+dt@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Yun Liu <liuyun@loongson.cn>, Jianmin Lv <lvjianmin@loongson.cn>, devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20221021010925.21604-2-zhuyinbo@loongson.cn>
References: <20221021010925.21604-1-zhuyinbo@loongson.cn> <20221021010925.21604-2-zhuyinbo@loongson.cn>
Message-Id: <166631933126.2201080.1602221756534154524.robh@kernel.org>
Subject: Re: [PATCH v3 2/2] dt-bindings: hpet: add loongson2 hpet
Date: Thu, 20 Oct 2022 21:29:15 -0500
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

On Fri, 21 Oct 2022 09:09:25 +0800, Yinbo Zhu wrote:
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

