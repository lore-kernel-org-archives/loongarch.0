Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420E8C5D8
	for <loongarch@lists.linux.dev>; Wed, 15 Feb 2023 19:49:47 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id p24-20020a056830131800b0068d4b30536aso5990586otq.9
        for <loongarch@lists.linux.dev>; Wed, 15 Feb 2023 11:49:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g+iuWlg41wdj9dsD9ORs/lnnSLbHgXl/OfpkvXkGtHs=;
        b=jCpHrNLT4X7re1YCrnthKVtTQ2fXSFpe1a15guP/5Q4XdSlk3P/H5Qcb+Tw1UJ/b89
         1j/kUPUCgLe7gbdBF33/r98aXOtcyizgt+oPzJbXWL++C6trUXElln3hIibMYPbSQIIt
         kUXViTMXNaL+sRL/HE8mzevA7jlluyhpM6Pjxc3I5py0CZtGZ1SuWUrXfx7L/dqVvEiC
         7rWtA+y38YMrptv9A3tJCaS4ps9kf7yJyqc+dbKektn1FkwzTocSQGrOaWU4qRYvF0+w
         nbGl1WV6g3s/ATLL2Gj8mqdwH3D7eAQvTISnesGdr+JVKq4vTBJSfCqg4pWs1EKQ73A4
         AiDQ==
X-Gm-Message-State: AO0yUKWAEB451EfnwpfNw2KN2zH9hEMdfcMsDXoZ/MuYA3pGFTWexnof
	OpRdv4TI+LQwLhFxZU6NqA==
X-Google-Smtp-Source: AK7set9vg3F2/fpcnJD4aal3lfEtigJLUSjMzaiQ4iS1okk2WkDSxToxUr2UntVD7TP27C1xl5blSQ==
X-Received: by 2002:a05:6830:129a:b0:68b:dc52:10f9 with SMTP id z26-20020a056830129a00b0068bdc5210f9mr1512185otp.5.1676490586196;
        Wed, 15 Feb 2023 11:49:46 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id z14-20020a05683020ce00b0068bb6043362sm7888188otq.11.2023.02.15.11.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 11:49:45 -0800 (PST)
Received: (nullmailer pid 461289 invoked by uid 1000);
	Wed, 15 Feb 2023 19:49:45 -0000
Date: Wed, 15 Feb 2023 13:49:45 -0600
From: Rob Herring <robh@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jianmin Lv <lvjianmin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, loongarch@lists.linux.dev, devicetree@vger.kernel.org, loongson-kernel@lists.loongnix.cn
Subject: Re: [PATCH V2 1/2] dt-bindings: interrupt-controller: Add Loongson
 EIOINTC
Message-ID: <20230215194945.GA458740-robh@kernel.org>
References: <cover.1676289084.git.zhoubinbin@loongson.cn>
 <a9f697906df6599e6b001981e668479da71aa7a0.1676289084.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a9f697906df6599e6b001981e668479da71aa7a0.1676289084.git.zhoubinbin@loongson.cn>

On Mon, Feb 13, 2023 at 08:15:27PM +0800, Binbin Zhou wrote:
> Add Loongson Extended I/O Interrupt controller binding with DT schema
> format using json-schema.
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  .../loongson,eiointc.yaml                     | 80 +++++++++++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,eiointc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,eiointc.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,eiointc.yaml
> new file mode 100644
> index 000000000000..88580297f955
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,eiointc.yaml
> @@ -0,0 +1,80 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/interrupt-controller/loongson,eiointc.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Loongson Extended I/O Interrupt Controller
> +
> +maintainers:
> +  - Binbin Zhou <zhoubinbin@loongson.cn>
> +
> +description: |
> +  This interrupt controller is found on the Loongson-3 family chips and
> +  Loongson-2K0500 chip and is used to distribute interrupts directly to
> +  individual cores without forwarding them through the HT's interrupt line.
> +
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - loongson,eiointc-1.0
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 3
> +
> +  interrupt-controller: true
> +
> +  interrupts:
> +    description:
> +      Interrupt source of the CPU interrupts.
> +
> +  interrupt-names:
> +    description:
> +      List of names for the parent interrupts.
> +    items:
> +      - const: int0

Why do you need this if there is only 1 interrupt?

Rob
