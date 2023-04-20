Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C958C15
	for <loongarch@lists.linux.dev>; Thu, 20 Apr 2023 15:52:24 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-94eff00bcdaso89426166b.1
        for <loongarch@lists.linux.dev>; Thu, 20 Apr 2023 08:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682005942; x=1684597942;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6wNV6vuEnDx323qiEZUPunRODUIJ2Mg30GBaFfSSX3w=;
        b=KUtGBpFZ4K9dSucECVZlT2qy5FvnWxP46zuHOMVJsi91f5wQw9RmX+hqV9rMJRjNWC
         bvim1ZW9BruSUXh7t24xkD3E9qIDDtOL2WfURgKcM2ITYHMdr0ZBeDhuidNarsqaSc0r
         yqe4GJjZQs13isZMujvMrIcwjP1EtTq/AmwONYNGk84c30P61LpkPI1ihZgK/5a/kcsQ
         b+tH1uPgz8oc1SstFQE1V/sba0WNunH5lWfib68TvZme9Q0X4I1rsPIlqiwAowJyjdgq
         gP7z4PD2Y24KMaDINb0teLYR4fj+RqFRpQcUOZpkLkSVfPnN3Vau0dNrArU1iweUL6p1
         +hyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682005942; x=1684597942;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6wNV6vuEnDx323qiEZUPunRODUIJ2Mg30GBaFfSSX3w=;
        b=bAL3kTLjBlyFzOF3hT1SF4ARtYqUXGvRh8cKt3aMu9Lb+AVcCzYQz9FM3ZNdrtNx/k
         CHcMDGX33dcybc5GoWB62dTuvEIr8VZpKS0KEU62mbE0XTDYQmcEiuB13p9LHnBlL4BN
         vaMZCnzxZjYNqdbQuctPX+KKlJGMpvEZMgT/KgC+vHtHTyQxzQMLZ0utk5lYuKnCzceB
         BlsssiQLpIaCTvinIp9H78zdjGj9F49dik2EOfNn7LHUrzfwzTpSJ96ek3gHiyJY1oQ5
         uQ1DYu4PabTTRtPiVH69RBytky8h/0ALffoON0YuKQuklnoDnRoS5J1sSoG6LVQjHGNp
         PgoA==
X-Gm-Message-State: AAQBX9cWSC9khr45UuaVp+tX6Tnb/er/bAdxRFfiKnt8YR0wiczAPe4x
	ErBkXQjPWNnhO6vtCqDi5/vRww==
X-Google-Smtp-Source: AKy350aPmsWqtsiLlXtFEKjMdEfdFTHARCOQr/LjyoR6a22xRet0wGy1eSSq3Rw+P0/E+xbmTBCyWg==
X-Received: by 2002:a05:6402:6d9:b0:506:833c:abcf with SMTP id n25-20020a05640206d900b00506833cabcfmr2405927edy.42.1682005942297;
        Thu, 20 Apr 2023 08:52:22 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:bcb8:77e6:8f45:4771? ([2a02:810d:15c0:828:bcb8:77e6:8f45:4771])
        by smtp.gmail.com with ESMTPSA id k10-20020aa7c04a000000b005076635b02bsm884526edo.13.2023.04.20.08.52.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 08:52:21 -0700 (PDT)
Message-ID: <75231886-cdf6-cfde-d6b9-183b1fbf98da@linaro.org>
Date: Thu, 20 Apr 2023 17:52:20 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH V3 1/2] dt-bindings: interrupt-controller: Add Loongson
 EIOINTC
Content-Language: en-US
To: Binbin Zhou <zhoubb.aaron@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen
 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jianmin Lv <lvjianmin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 loongarch@lists.linux.dev, devicetree@vger.kernel.org,
 loongson-kernel@lists.loongnix.cn
References: <cover.1681887790.git.zhoubinbin@loongson.cn>
 <3b9c4f05eaf14bc3b16aebec3ff84c8a2d52c4a5.1681887790.git.zhoubinbin@loongson.cn>
 <f9b62f48-5c8b-2674-313d-4552c61c4302@linaro.org>
 <CAMpQs4JjHvVOzQz-1Y-q9ut6tWUpakrHeozuwPg0dzoDcUFEGA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMpQs4JjHvVOzQz-1Y-q9ut6tWUpakrHeozuwPg0dzoDcUFEGA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/04/2023 15:00, Binbin Zhou wrote:
>>> +examples:
>>> +  - |
>>> +    eiointc: interrupt-controller@1fe11600 {
>>> +      compatible = "loongson,ls2k0500-eiointc";
>>> +      reg = <0x1fe11600 0x10>,
>>> +            <0x1fe11700 0x10>,
>>> +            <0x1fe11800 0x10>,
>>> +            <0x1fe114c0 0x4>;
>>
>> Binding is OK, but are you sure you want to split the address space like
>> this? It looks like two address spaces (enable+clear+status should be
>> one). Are you sure this is correct?
>>
> Hi Krzysztof:
> 
> These registers are all in the range of chip configuration registers,
> in the case of LS2K0500, which has a base address of 0x1fe10000.
> However, the individual register addresses are not contiguous with
> each other, and most are distributed across modules, so I feel that
> they should be listed in detail as they are used.

Do you want to say that:
Between 0x1fe11600 and 0x1fe11700 there are EIOINTC registers and other
(independent) module registers?


Best regards,
Krzysztof

