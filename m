Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAEE3FE0
	for <loongarch@lists.linux.dev>; Tue, 22 Aug 2023 06:19:00 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-99bf1f632b8so547084666b.1
        for <loongarch@lists.linux.dev>; Mon, 21 Aug 2023 23:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692685138; x=1693289938;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rBZR80HMcA0hG5+MQLHG3OGyFYuzset5UuwaFr9JmIk=;
        b=Jowpxuc47sPnHuzsjiRVCa/pCcdQ7vK8OGlfPMZYtljpyS2jp1aZLM1E0XNgDc89Iy
         XrPQexTD4mRQjMouXxRKDST9EbkkPIASWqa3NC9c4ROLBv/P+ZD9uUJUoJzuKSmN/JfG
         0Eesrqjflimy55pQCiq0z8fn1S55V8YfhFr/xwUHOKZt8dcwTc5DkrYg0P1LrR58P8Fe
         DtmDzwNtL5hgthn34Uv2277OEyCApvoYzAU9eO9b5PrnIGnPX0U9+oyWW7WrLPBxLzA1
         rE+JNnGeg5pBm2QzjzCD3a1PZPOhGA8ZK/m+StqatLT71rp4ENcjlSEU5Jq04FO2DUhF
         1j3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692685138; x=1693289938;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rBZR80HMcA0hG5+MQLHG3OGyFYuzset5UuwaFr9JmIk=;
        b=IXtSZLbJ7efb5p6QwvbdGJpNaxe/7C8u33ifQtQABix3g9i02bvgWi45Vny8F/ue2a
         BvLZctzLSDO2HipPxLpiH8YO0DzxJ+BBXp07qZ7cc6fi+Fq7aW1InADLLlRPYX4rrxia
         M04kcZ5NoWTRruAt81aPdg40ILJhL7lzBVcmXYhHRzDNYVHBvCxfEuXE4wxKkOEMf7UW
         rLtDQEoS7uHli9BTFkJBOhjephCBIP/pdG8r+RIAQaw+NZ/bCZVAyUWYhlXHJc119jSO
         L5VZ5BVeE+xp76V8F/IaodqrDRIpx7cwUN651KLc95BpKjKr3AayTspZHPEbK3gKLT3b
         LHOw==
X-Gm-Message-State: AOJu0YwV5gT0r2erWJoU1F+ZKjsJ9rZzmp/ty9B7eg0JNQB4mUEc00w1
	2PlRRTrR2Qkk5ZPXPjny6hwUCA==
X-Google-Smtp-Source: AGHT+IFd52n5Iwi9201bIJZvqjI/dEisxoNzxRDacGsyRKJKy/1icM7UFynuUyaQ6xzom3FTCA8C1g==
X-Received: by 2002:a17:906:3001:b0:99b:22dd:f83d with SMTP id 1-20020a170906300100b0099b22ddf83dmr6680153ejz.55.1692685138436;
        Mon, 21 Aug 2023 23:18:58 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id h27-20020a17090634db00b009a193a5acffsm3767614ejb.121.2023.08.21.23.18.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Aug 2023 23:18:58 -0700 (PDT)
Message-ID: <305b0572-8625-9233-8d65-393616a72807@linaro.org>
Date: Tue, 22 Aug 2023 08:18:56 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 1/7] dt-bindings: loongarch: Add CPU bindings for
 LoongArch
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
References: <cover.1692618548.git.zhoubinbin@loongson.cn>
 <47d5ef30a513a7185a6ea94d8e6f6d9e393eba92.1692618548.git.zhoubinbin@loongson.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <47d5ef30a513a7185a6ea94d8e6f6d9e393eba92.1692618548.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/08/2023 14:49, Binbin Zhou wrote:
> Add the available CPUs in LoongArch binding with DT schema format using
> json-schema.
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>


> +
> +allOf:
> +  - $ref: /schemas/cpu.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - loongson,la264
> +      - loongson,la364
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  device_type: true

Drop

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks

Best regards,
Krzysztof

