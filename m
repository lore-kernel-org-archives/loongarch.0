Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80696AA8
	for <loongarch@lists.linux.dev>; Sun, 30 Oct 2022 13:50:24 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-13ba9a4430cso11139898fac.11
        for <loongarch@lists.linux.dev>; Sun, 30 Oct 2022 06:50:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1QUpqSv8LSRsD1VYxzYGonzNWEdEEaZtwSxjwf3b2Fg=;
        b=Iu6ET5WZzTrKxc0zUW8xTAPJpOKYMys5kv+kbyJsLaH5P1xCpp3prpindDy81XbIQB
         zLTfTgioPgkHkth46t12e2WQ0nVnOS/jbu9lo9imY7sS1/aWSI8Iyiy1x9cIlsxk2PIx
         uExBVFVpw6CfepDRtXZYxY8DkvNtpbOVCpeHDAedgL/x6gQTvSrdQTEKyyym6/SiRWSm
         ukgZvQwjkeMmfWHdgxwfOQNCsDYnyap8oMxkQ54f1Wi9A0KsHNlljFrWBGqQGeQkuT3d
         SI/JNVZjxnrWOF9xt66Z7dIgIAETD7QEps/7nen7dvXKtTqqlI5bmfzmiXoUihdJG6Ev
         GU9g==
X-Gm-Message-State: ACrzQf0Lj+YqZ+czP/F1wQE/NxH+I2jzmXGf2IX512yf6D6pNd8ltFU4
	ZsAlIlGK0woSFBjIdBGgsQ==
X-Google-Smtp-Source: AMsMyM4A4ituhLKMdNGU6GZbc0dsVd/UTLy9ttWdlGJXrzspN/uk3HqBWucUMAxeWy0eP8Y0ZZSnwQ==
X-Received: by 2002:a05:6871:28a:b0:13b:cb8b:1ab7 with SMTP id i10-20020a056871028a00b0013bcb8b1ab7mr4755663oae.225.1667137823806;
        Sun, 30 Oct 2022 06:50:23 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id c4-20020a056870478400b0013320d9d9casm1836309oaq.44.2022.10.30.06.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 06:50:23 -0700 (PDT)
Received: (nullmailer pid 992222 invoked by uid 1000);
	Sun, 30 Oct 2022 13:50:23 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: devicetree@vger.kernel.org, loongarch@lists.linux.dev, WANG Xuerui <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Yun Liu <liuyun@loongson.cn>, Thomas Gleixner <tglx@linutronix.de>, Jianmin Lv <lvjianmin@loongson.cn>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Yang Li <yang.lee@linux.alibaba.com>, Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20221029065222.27912-2-zhuyinbo@loongson.cn>
References: <20221029065222.27912-1-zhuyinbo@loongson.cn>
 <20221029065222.27912-2-zhuyinbo@loongson.cn>
Message-Id: <166713668551.965836.8662861477016293697.robh@kernel.org>
Subject: Re: [PATCH v6 2/2] dt-bindings: hpet: add loongson-2 hpet
Date: Sun, 30 Oct 2022 08:50:23 -0500


On Sat, 29 Oct 2022 14:52:22 +0800, Yinbo Zhu wrote:
> Add the Loongson-2 High Precision Event Timer (HPET) binding
> with DT schema format using json-schema.
> 
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
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

