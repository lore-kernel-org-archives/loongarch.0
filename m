Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F56F364D8
	for <loongarch@lists.linux.dev>; Thu, 16 Nov 2023 17:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-586a516755aso1061673eaf.0
        for <loongarch@lists.linux.dev>; Thu, 16 Nov 2023 09:40:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700156447; x=1700761247;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XVlonfuXcyY4FJzpA36LqmNpUEIgZNzkmfekYli/Iv4=;
        b=X+QP63ukXgRYekfbPpm7XkoQn7zBiZW+4UMW0AbaLnlQ/oDz/14ROOJhL4RvJCZIRT
         Ofx2PbmaXA/RAMtx1P+xw3oe6VoSV0pLzIUirem7LJOq8jtG+YG+P5DQXOKjjRu8pGMs
         3bhEDkWH04hUDqf9R1tjz4kBeYcYT/G+KYLGr45AJGOW5eiXDjHX1o+6uIT6uvlGsD3Q
         rLXfWb+BK59Ndvrb7iA+VGvX7P4nw5Gi+NabOe9V5+3t7CAU7vEBOJ8Z8hBVed+4+FJZ
         5Yf8MLz6VBmDt8il+Na9h8LG735K7dlebQ9JfL7YQLHnMzw+p5PLc3enCyruJMCNBggD
         qW8w==
X-Gm-Message-State: AOJu0YymppIxGFYl/IGapxFD46M87SghktJpo5coQk9CJp1o54VO6rVw
	0J3w8H1BeF1zsTLbI5Xixw==
X-Google-Smtp-Source: AGHT+IHcR2mFJJO/I2dSRQmde4Q1Z1Ep57hlSQO6O8mHsC/e90Oxx9dd3UekKvWIdFGevP2c+LrbAQ==
X-Received: by 2002:a05:6870:460d:b0:1e9:668f:46d0 with SMTP id z13-20020a056870460d00b001e9668f46d0mr1083386oao.19.1700156447533;
        Thu, 16 Nov 2023 09:40:47 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id pi5-20020a056871d10500b001e578de89cesm2295626oac.37.2023.11.16.09.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 09:40:46 -0800 (PST)
Received: (nullmailer pid 2521463 invoked by uid 1000);
	Thu, 16 Nov 2023 17:40:45 -0000
Date: Thu, 16 Nov 2023 11:40:45 -0600
From: Rob Herring <robh@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: loongarch@lists.linux.dev, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Conor Dooley <conor+dt@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, loongson-kernel@lists.loongnix.cn, WANG Xuerui <git@xen0n.name>, linux-kernel@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Binbin Zhou <zhoubb.aaron@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, lvjianmin@loongson.cn, Huacai Chen <chenhuacai@loongson.cn>, linux-mips@vger.kernel.org
Subject: Re: [PATCH v4 2/5] dt-bindings: interrupt-controller:
 loongson,liointc: Fix dtbs_check warning for reg-names
Message-ID: <170015642605.2521005.9993251175536603536.robh@kernel.org>
References: <cover.1699521866.git.zhoubinbin@loongson.cn>
 <3a5bba5929691b6bcd0d09acacc5b6c246292ce1.1699521866.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a5bba5929691b6bcd0d09acacc5b6c246292ce1.1699521866.git.zhoubinbin@loongson.cn>


On Mon, 13 Nov 2023 10:36:22 +0800, Binbin Zhou wrote:
> As we know, the Loongson-2K0500 is a single-core CPU, and the
> core1-related register (isr1) does not exist. So "reg" and "reg-names"
> should be set to "minItems 2"(main nad isr0).
> 
> This fixes dtbs_check warning:
> 
> DTC_CHK arch/loongarch/boot/dts/loongson-2k0500-ref.dtb
> arch/loongarch/boot/dts/loongson-2k0500-ref.dtb: interrupt-controller@1fe11400: reg-names: ['main', 'isr0'] is too short
>         From schema: Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
> arch/loongarch/boot/dts/loongson-2k0500-ref.dtb: interrupt-controller@1fe11400: Unevaluated properties are not allowed ('reg-names' was unexpected)
>         From schema: Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
> arch/loongarch/boot/dts/loongson-2k0500-ref.dtb: interrupt-controller@1fe11400: reg: [[0, 534844416, 0, 64], [0, 534843456, 0, 8]] is too short
>         From schema: Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
> arch/loongarch/boot/dts/loongson-2k0500-ref.dtb: interrupt-controller@1fe11440: reg-names: ['main', 'isr0'] is too short
>         From schema: Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
> 
> Acked-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  .../interrupt-controller/loongson,liointc.yaml        | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

