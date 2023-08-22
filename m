Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0F11855
	for <loongarch@lists.linux.dev>; Tue, 22 Aug 2023 06:25:33 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-99bf8e5ab39so551973666b.2
        for <loongarch@lists.linux.dev>; Mon, 21 Aug 2023 23:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692685531; x=1693290331;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h9URx5W84Divr3E15R8uy2iV5OFoR8mXmpt0/gGTyXM=;
        b=mFNl0Z9+KVkHshcQi1SfwEPR6C8O98naFaSMROhElFS3eB2Ifk4pRV36rHCI5Ivz9K
         Vb+kFbW8HlTqjeIvLUT2YdnVRUGSjBtZgHTg61KOM3zYaC1oLg3g3t2BrX/p87O6y0EU
         sAJ7c0sPGUi6AHxmrqUnL+36ROX5Zke8zubSxTcqDzxP8hwMYBc/5wkvJiTbtKLoGrTe
         W5q7MTCcENvtHWWsIzUtjpbT2VakPGsN1hHYgyE28udqFi176u+ms9Vmf9Uf38SJMPBv
         RIIacK4HIF8iGnwG9WBlQb1k6jtFKYbRj4li069W25pecqc8V8k6q5+iq4D7UxKqeEd6
         qn4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692685531; x=1693290331;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h9URx5W84Divr3E15R8uy2iV5OFoR8mXmpt0/gGTyXM=;
        b=VxHhYVB7ijOv6Bliv2UyDAsYbAHiJ9Qm+ojyv1Y7hIT+y3kSJInSJYLm6pjb6BPxRP
         Pi1OginoO2+myBAIMUBMXNpW7QtlTniKenQP1ORkv/ZPqCmNpUW+Nez9JCh9t5XEPufv
         YWl3VuMjmUs8lrI+7RkXPqilWf1NbMkiFH9zB7TDjTnfHP4RRobYy//MPwAZ1pKiIdnL
         rUFYurWKAGcBZ6rTuFhugx7pmToXBlDhbu2S7EgQVD/XGPdJn4V1VvdpBlcoa58wmRv5
         v0baVJHyYowqHIzYK053VXzbqJdXmxNBVKNN1g/UFfRRIdABDuGfx1RQAYWOYzGuC1Ty
         b2sw==
X-Gm-Message-State: AOJu0Yyl67fTSI8RlDYd4YLLh0jAq2OY8mzw1NUN9ZdFihcWC4Lxpf7q
	l8gyarGiCoxypJicpPMUj2zH9Q==
X-Google-Smtp-Source: AGHT+IEmzsbeo3aIN+JjqNT5cJw1qAMv9Y9wzOmcqQWRBqATxmGcjG/BrhGpepliwyEn03Vvc89d5w==
X-Received: by 2002:a17:907:2ccf:b0:99b:cdb2:6f5f with SMTP id hg15-20020a1709072ccf00b0099bcdb26f5fmr6658421ejc.49.1692685531309;
        Mon, 21 Aug 2023 23:25:31 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id z14-20020a170906240e00b00982d0563b11sm7740008eja.197.2023.08.21.23.25.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Aug 2023 23:25:30 -0700 (PDT)
Message-ID: <bb885b12-ce9b-adf4-88fe-17925e5cf55a@linaro.org>
Date: Tue, 22 Aug 2023 08:25:29 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 5/7] LoongArch: dts: DeviceTree for Loongson-2K1000
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
 <10689163c9800d8c6b5e47255a3ba126e3f4fb92.1692618548.git.zhoubinbin@loongson.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <10689163c9800d8c6b5e47255a3ba126e3f4fb92.1692618548.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/08/2023 14:49, Binbin Zhou wrote:
> Add DeviceTree file for Loongson-2K1000 processor, which integrates two
> 64-bit dual emission superscalar LA264 processor cores.
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  arch/loongarch/boot/dts/Makefile              |   3 +-
>  .../boot/dts/loongson-2k1000-ref.dts          | 171 ++++++++
>  arch/loongarch/boot/dts/loongson-2k1000.dtsi  | 375 ++++++++++++++++++
>  3 files changed, 548 insertions(+), 1 deletion(-)
>  create mode 100644 arch/loongarch/boot/dts/loongson-2k1000-ref.dts
>  create mode 100644 arch/loongarch/boot/dts/loongson-2k1000.dtsi
> 
> diff --git a/arch/loongarch/boot/dts/Makefile b/arch/loongarch/boot/dts/Makefile
> index aa0b21d73d4e..dc0782315bed 100644
> --- a/arch/loongarch/boot/dts/Makefile
> +++ b/arch/loongarch/boot/dts/Makefile
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  
> -dtb-$(CONFIG_MACH_LOONGSON64)	= loongson-2k0500-ref.dtb
> +dtb-$(CONFIG_MACH_LOONGSON64)	= loongson-2k0500-ref.dtb \
> +				  loongson-2k1000-ref.dtb
>  
>  obj-$(CONFIG_BUILTIN_DTB)	+= $(addsuffix .dtb.o, $(CONFIG_BUILTIN_DTB_NAME))
> diff --git a/arch/loongarch/boot/dts/loongson-2k1000-ref.dts b/arch/loongarch/boot/dts/loongson-2k1000-ref.dts
> new file mode 100644
> index 000000000000..6fff45a2ea82
> --- /dev/null
> +++ b/arch/loongarch/boot/dts/loongson-2k1000-ref.dts
> @@ -0,0 +1,171 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023 Loongson Technology Corporation Limited

...

> +		liointc1: interrupt-controller@1fe01440 {
> +			compatible = "loongson,liointc-2.0";
> +			reg = <0x0 0x1fe01440 0x0 0x40>,
> +			      <0x0 0x1fe01048 0x0 0x8>,
> +			      <0x0 0x1fe01148 0x0 0x8>;
> +			reg-names = "main", "isr0", "isr1";
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			interrupt-parent = <&cpuintc>;
> +			interrupts = <3>;
> +			interrupt-names = "int1";
> +			loongson,parent_int_map = <0x00000000>, /* int0 */
> +						  <0xffffffff>, /* int1 */
> +						  <0x00000000>, /* int2 */
> +						  <0x00000000>; /* int3 */
> +		};
> +
> +		global-utilities@1fe00000 {

I have no clue what "globla-utilities" are for a SoC. Compatible
suggests it is chipid.


Best regards,
Krzysztof

