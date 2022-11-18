Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38D620FD
	for <loongarch@lists.linux.dev>; Fri, 18 Nov 2022 12:38:48 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id k19so6642432lji.2
        for <loongarch@lists.linux.dev>; Fri, 18 Nov 2022 04:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=no+H9b9eosuH2qEiOD6KMI4wDDshNFpABjP/G2BO63Y=;
        b=jppWrMespj1W0x31C9rRdsaH+buh83dd/Gcj7rlLRtIESrlD//bdSWM9+4ikPaNATM
         3jNHsYnzfIt+1qp93V6OXnhxPO5SNUxRXJ/TWMh0jB8rnvAN/Bn44AAO/yLzhzCdJsuG
         DguZeIHz+DYm4t6pdwsZB5gtuYIMZaU8yFSrD8Ycim0rDmOfIz8FGLO50T2CTSFKv3LH
         Oh80rSa6GhGxaEnIuQPwfKoXqHD5jgqlpqmDsi0WdOwZ0TXMPF1FsLhToraw3qbOR6tu
         PdLgJzSuXcAj6AcIyebrgco2D6UH2F5Y1YrjKqRQhOvfz8cwn6sywTCGsU70k8ptIo7c
         vbtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=no+H9b9eosuH2qEiOD6KMI4wDDshNFpABjP/G2BO63Y=;
        b=chhXLHBJ23wCw9uPZrCUOhDVuZgq2i/RzIlVduyDDzuB/9WFpZxr/8AKH7WAwO6sjn
         BiewTY2fErdndubq5ibMP2/OrToGSYexyliuGUgsig7c0P08a0m+8mCmQQks+Wgy+xHn
         g8FJjE9NXwgUZsGCYnSlCNQofovUdXrzGauZfCkaGGXSW8vv6Avr61cXhQyRmUrTT2RE
         lWxwF/0w+/Bf3X+VjkNR/H4VNkxxfIYpXu8Zv1CfXoE68OkGyXTa80x5V+fXe24zjC11
         bjSuumPW809HPX8ZO7XzmVhhFVnaqB66+IKSBkrSYQPN4E+mYQ9AgZX83zr5aiINWl/s
         LWMQ==
X-Gm-Message-State: ANoB5pnvIQh7TnplkdvcgxbKiWDposDUR4hQ5QnUxokW0bhsyoeVYYIK
	Ge/3Cqb2aUDY9aJf3+hG2hhROg==
X-Google-Smtp-Source: AA0mqf62h736Id6DM8RIqmZIS9xAsNwoJ77uCAoB61kEqeITqo+LxKOuY7z4FqSEcmCxnj0W6V0Atw==
X-Received: by 2002:a2e:b529:0:b0:26a:c77f:57f8 with SMTP id z9-20020a2eb529000000b0026ac77f57f8mr2247605ljm.465.1668775127010;
        Fri, 18 Nov 2022 04:38:47 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id u24-20020a2e9b18000000b002637c04b472sm638303lji.83.2022.11.18.04.38.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 04:38:46 -0800 (PST)
Message-ID: <947bc72f-2273-9474-9af4-5532d69491b2@linaro.org>
Date: Fri, 18 Nov 2022 13:38:44 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 2/2] dt-bindings: gpio: add loongson series gpio
Content-Language: en-US
To: Yinbo Zhu <zhuyinbo@loongson.cn>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 WANG Xuerui <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Juxin Gao <gaojuxin@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Yanteng Si <siyanteng@loongson.cn>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org, richard.liu@st.com,
 Arnaud Patard <apatard@mandriva.com>, Hongbing Hu <huhb@lemote.com>,
 Huacai Chen <chenhuacai@kernel.org>
References: <20221108092107.28996-1-zhuyinbo@loongson.cn>
 <20221108092107.28996-2-zhuyinbo@loongson.cn>
 <d9edb6e1-c3da-0f5b-546d-37d8151aaa35@linaro.org>
 <d5457109-3bcb-e7d3-067d-9e4acd66ac17@loongson.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <d5457109-3bcb-e7d3-067d-9e4acd66ac17@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/11/2022 10:50, Yinbo Zhu wrote:
>
>>> +
>>> +  "#gpio-cells":
>>> +    const: 2
>>> +
>>> +  gpio-controller: true
>>> +
>>> +  gpio-ranges: true
>>> +
>>> +  loongson,conf_offset:
>>
>> No underscores in node names. Plus comments from Linus seem to apply
>> here as well. Drop it entirely or explain why this is not part of
>> compatible, why this is needed and why encoding programming model
>> address in DT matches the DT...
> Add it is to distinguish differnt address in different platform.
> and I had drop them and initial them in kernel driver that depend
> on diffent compatible.
>>

So if you had to drop these, please drop from the bindings.

Best regards,
Krzysztof

