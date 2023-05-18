Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451342A9CA
	for <loongarch@lists.linux.dev>; Thu, 18 May 2023 07:15:37 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4f24ceae142so1914275e87.3
        for <loongarch@lists.linux.dev>; Thu, 18 May 2023 00:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684394135; x=1686986135;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KYKmQfTmh1bEYIv0MqpLWu88gw8N39vIF7/3HVXEtq0=;
        b=Rh/fojwkalbjq0+9uWj9+OQ35gHQboxXNNSGtTDD47GISpAFuCVvveHBk6pWBLoPeP
         E7Q/hBaWeJFc+hXKNVJdBKDjZ0lRHAK9LETBu4/q9s74wkiaXdGfl1EA45vbIiIRcRiR
         RXKrFJP5cbCvcEPF9fmJDxHbQl12icgOuA0YTQhpJrYumyWFtU16sHuxhYlEAZZUG0pU
         mV+Bn9EYzuGcJ37FyA4v6v+ivfE5iDuWFCJa2TuMAQsMSG9fbhnmJXR5QPHxgJIkNTgC
         HvWHTx+zXCmDCJOVIBkgnNroQBNKbKG7njOaBF13gvRkWxUYK2ViyMm6YcW/WswwfFy1
         Q7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684394135; x=1686986135;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KYKmQfTmh1bEYIv0MqpLWu88gw8N39vIF7/3HVXEtq0=;
        b=AQbTs3eGPIlGPKt80z73mr1IomPNFwWOOZbA/rjKZxXAQnaKnUGVdBduz18yAHg1S1
         Zwgxci9C9PrIYrcGCAyAtKLDVhRcwUNLhON02f/VrVpiLqMUvyCIWwmlxQJXG6aRBrfK
         D8/s2yZOhge+zvxuWaDWXPVQ5Dgdes+IGuwx90nC3GHKKC3WDKyM3S3kjOqrsK5+pfk4
         JlRQOc3wnLCtG/AWdIxTK/T8f8vporMqdC+J2JkqBctZGwd2ghYfaHnO9XwzbQkLJqrP
         R03ntsrGvQIcBjGK21QmrReCllRaVkLJVS0IStTkv5AWQbagQxwwDZ215BBG9autjd6A
         uBvA==
X-Gm-Message-State: AC+VfDztvRb6AIuhGI74Nco6zduCitywCbCrFnfeoXKH65jLzydsMy0c
	MzmaCB0Tzk5fITld87tMVc7SWA==
X-Google-Smtp-Source: ACHHUZ5w/WS18KRlT6zZx4TvcGzjRToUbnX6tn8AELoPIH92+lXRt2kQzNO52ptf7vSazWqiSv7+tA==
X-Received: by 2002:ac2:4117:0:b0:4e9:cfd2:e2d with SMTP id b23-20020ac24117000000b004e9cfd20e2dmr819020lfi.65.1684394135207;
        Thu, 18 May 2023 00:15:35 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a2b:c408:5834:f48e? ([2a02:810d:15c0:828:a2b:c408:5834:f48e])
        by smtp.gmail.com with ESMTPSA id i13-20020a056512006d00b004ece331c830sm146808lfo.206.2023.05.18.00.15.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 May 2023 00:15:34 -0700 (PDT)
Message-ID: <1bbabe6d-b013-9837-8986-205a2b04de14@linaro.org>
Date: Thu, 18 May 2023 09:15:31 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v1 2/3] dt-bindings: soc: add loongson-2 pm
Content-Language: en-US
To: zhuyinbo <zhuyinbo@loongson.cn>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Marc Zyngier <maz@kernel.org>, Youling Tang <tangyouling@loongson.cn>,
 Baoqi Zhang <zhangbaoqi@loongson.cn>, Arnd Bergmann <arnd@arndb.de>,
 Yun Liu <liuyun@loongson.cn>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev
Cc: Jianmin Lv <lvjianmin@loongson.cn>, wanghongliang@loongson.cn,
 Liu Peibao <liupeibao@loongson.cn>, loongson-kernel@lists.loongnix.cn
References: <20230517073149.31980-1-zhuyinbo@loongson.cn>
 <20230517073149.31980-3-zhuyinbo@loongson.cn>
 <d3791702-4d41-0208-1346-34738a2883b6@linaro.org>
 <4521c591-6fcd-c96a-e2f6-f41f5c191036@loongson.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <4521c591-6fcd-c96a-e2f6-f41f5c191036@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/05/2023 05:23, zhuyinbo wrote:
> 
> 
> 在 2023/5/17 下午11:00, Krzysztof Kozlowski 写道:
>> On 17/05/2023 09:31, Yinbo Zhu wrote:
>>> Add the Loongson-2 SoC Power Management Controller binding with DT
>>> schema format using json-schema.
>>>
>>> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
>>
>> ...
>>
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - enum:
>>> +          - loongson,ls2k-pmc
>>> +      - const: syscon
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  interrupts:
>>> +    maxItems: 1
>>> +
>>> +  suspend-address:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    description:
>>> +      This option indicate this PM suspend address.
>>
>> This tells me nothing. Drop "This option indicate this" and rephrase
>> everything to actually describe this property. Why would the address
>> differ on given, specific SoC? It looks like you just miss compatibles.
>> Anyway this needs much more explanation so we can judge whether it fits DT.
> 
> Hi Krzysztof,
> 
> I will add following description about "suspend-address", please review.

Thanks.

> 
> The "suspend-address" is a ACPI S3 (Suspend To RAM) firmware entry

Why do we add properties for ACPI? This does not seem right. Please
reword to skip ACPI stuff, e.g. deep sleep states (Suspend to RAM).


> address which was jumped from kernel and it's value was dependent on 
> specific platform firmware code. 

"entry address which was jumped" <- the address cannot jump. Please
explain who is jumping here - boot CPU? each suspended CPU? I guess the
first as CPUs are offlined, right?

> In addition, the PM driver need 
> according to it to indicate that current SoC whether support ACPI S3.

Skip references to driver.

> 

Best regards,
Krzysztof

