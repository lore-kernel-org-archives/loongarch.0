Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359B922306
	for <loongarch@lists.linux.dev>; Tue, 31 Oct 2023 17:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6ce322b62aeso3735695a34.3
        for <loongarch@lists.linux.dev>; Tue, 31 Oct 2023 10:53:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698774824; x=1699379624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JErNOeS484fSE6jMqFS1aWxPGk/XE6lq+FSKNBvOBGk=;
        b=RYllot6opKq++ghLAPf97Ovrap3E5n7VenTh3iAchTDLIOmX0QtAxB3meUWZI//GZH
         1fJe+jpT3LMhckd6LiPyYTIGWHqtsSwaQYOZr50ZmNceALDIljariNNp70BcXKjWw8oh
         xwfW4/KyTubL0bGyNgGTBHvOJFBajVsYDEb3zep8GsqFxAfAU6Aq2ou0Wr0EHeWYCJqI
         6zQ/wJInw9/JBEAvBhA/ryKNGk8pVdovUtHE26KTMRCVzCGwifYeT0hvN047zQkwwc+C
         b6Va5kPzibID/2UZMj5u5soepE0xPR4pI3XYJa5Yo4sMQHBJDRjK2e/fQUM32SbsHj79
         bSLw==
X-Gm-Message-State: AOJu0Ywijo1KIRpX/MapZKCmfzwA/S29q4tksnbNhLSq6lKXD5JeqTn1
	NRI9lKkqZbIFTlLKHCiuF2cqR9W+xg==
X-Google-Smtp-Source: AGHT+IHmDV7ekbXMqnPAI+zXPOg9uVdSiGo0HGjlgtqDy0nQceDIWHe1Ss1oJDxPVF8IkiT6rhqXwg==
X-Received: by 2002:a9d:7f85:0:b0:6b9:8357:61e6 with SMTP id t5-20020a9d7f85000000b006b9835761e6mr13026591otp.35.1698774824296;
        Tue, 31 Oct 2023 10:53:44 -0700 (PDT)
Received: from herring.priv ([4.31.143.193])
        by smtp.gmail.com with ESMTPSA id a3-20020a9d5c83000000b006c4d6a06a94sm290478oti.76.2023.10.31.10.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 10:53:43 -0700 (PDT)
Received: (nullmailer pid 1807481 invoked by uid 1000);
	Tue, 31 Oct 2023 17:53:42 -0000
Date: Tue, 31 Oct 2023 12:53:42 -0500
From: Rob Herring <robh@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, loongson-kernel@lists.loongnix.cn, devicetree@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, lvjianmin@loongson.cn, WANG Xuerui <git@xen0n.name>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/5] dt-bindings: interrupt-controller:
 loongson,liointc: Fix dtbs_check for interrupt-names
Message-ID: <20231031175342.GA1805362-robh@kernel.org>
References: <cover.1698717154.git.zhoubinbin@loongson.cn>
 <7fae3ce932b455effcf73ff0208f4776959f2f44.1698717154.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7fae3ce932b455effcf73ff0208f4776959f2f44.1698717154.git.zhoubinbin@loongson.cn>

On Tue, Oct 31, 2023 at 10:36:38AM +0800, Binbin Zhou wrote:
> The Loongson-2K0500/2K1000 CPUs have 64 interrupt sources as inputs, and
> a route-mapped node handles up to 32 interrupt sources, so two liointc
> nodes are defined in dts{i}.
> Of course, we need to ensure that the routing outputs (intx) of the two
> nodes cannot conflict.
> 
> For example, in Loongson-2K1000, 'int0' is typically used by the liointc0
> node, then the liointc1 node can only use the outputs starting with
> 'int1'.
> 
> So "interrupt-names" should be defined by "pattern".
> 
> This fixes dtbs_check warning:
> 
> DTC_CHK arch/loongarch/boot/dts/loongson-2k0500-ref.dtb
> arch/loongarch/boot/dts/loongson-2k0500-ref.dtb: interrupt-controller@1fe11440: interrupt-names:0: 'int0' was expected
>         From schema: Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
> arch/loongarch/boot/dts/loongson-2k0500-ref.dtb: interrupt-controller@1fe11440: Unevaluated properties are not allowed ('interrupt-names' was unexpected)
>         From schema: Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
> DTC_CHK arch/loongarch/boot/dts/loongson-2k1000-ref.dtb
> arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: interrupt-controller@1fe01440: interrupt-names:0: 'int0' was expected
>         From schema: Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
> arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: interrupt-controller@1fe01440: Unevaluated properties are not allowed ('interrupt-names' was unexpected)
>         From schema: Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  .../bindings/interrupt-controller/loongson,liointc.yaml    | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
> index 7393d7dfbe82..a90c609d351e 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
> @@ -54,11 +54,9 @@ properties:
>    interrupt-names:
>      description: List of names for the parent interrupts.
>      items:
> -      - const: int0
> -      - const: int1
> -      - const: int2
> -      - const: int3
> +      pattern: int[0-3]
>      minItems: 1
> +    maxItems: 4
>  
>    '#interrupt-cells':
>      const: 2
> @@ -87,6 +85,7 @@ required:
>    - compatible
>    - reg
>    - interrupts
> +  - interrupt-names

A new required property is an ABI break. Is that okay for this platform? 
The commit msg should answer that if so.


>    - interrupt-controller
>    - '#interrupt-cells'
>    - loongson,parent-int-map
> -- 
> 2.39.3
> 
