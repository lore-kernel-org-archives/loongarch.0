Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6402F56
	for <loongarch@lists.linux.dev>; Sun,  9 Oct 2022 15:16:37 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id a22so5500963qkk.7
        for <loongarch@lists.linux.dev>; Sun, 09 Oct 2022 08:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nMoVhDHOXbkfrQHXkDjBBWNzAhgx6kAOiO9M5hP5GW8=;
        b=u3ZfctBM9b1dd8Z0PEQMKq5aDzD+Sngf7/9n36/FFKr9PxVJozWgk+Dl8Q81ukH1vy
         FtRFmO1lGoX9+XayULTcP/M1lDGeB4Ux9FFb9d1fA2awfYI1kLbe7vXDBuxmXpgw0TTG
         o1dY/SgID1zy14Wy332bPImnXKgpJMQsOhzvZZUzkRYvJtSURYmtIwZIwX2AFADmv5ZI
         LulnMJ0la5z5Mt8Zgh8SehBBsJ7G5luciXaFbYVqqR9SqAOYZ5O2lZugCrQafl4SZpUj
         lgNufci6R/qj0VeyfTLP6lZr2Wv0QYDQNeopSK9Y+uwpuE9yrXhvLEoMEJEfkTfFhHo7
         Fq+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nMoVhDHOXbkfrQHXkDjBBWNzAhgx6kAOiO9M5hP5GW8=;
        b=AeO1Kp45irgNoCGB3UVmhdShrK8z+49aaE0uCyqb1uyxtuXEUzo6gPnBhBtpwvVwo2
         qBuhB3lftUCFlf8cOUzyVzn23n0jm9I0se8QyGJE3Nx0szKcK4P0RAnHgsfCoj5jYRRR
         QYYZE2f3JduezSRL3bSifPdqK0Y0ZBtlcsO5gO2TdUxn5mmi+gJkHl2QrfG2gZOaQdWd
         BZfiTxZVSGoTmu0jOfDYsLKqW7eAPLaAWlX3wsLjx9zQVO0k79ov1rLzrgwFJgguXEVM
         Y6gWl4eJ/5IZUSVxTf+hKkfTYwZNfKbNxQD+nboyJVZ/u80i2l4P+8Q6Hrj65B7buf4P
         XI0g==
X-Gm-Message-State: ACrzQf1gP3FDvaMxgjhL7XTmSokVg1UU6+cyqvfVm2k8QwMCRwif5S9X
	GdUxwGdAq7kcXDxy7T/ImJeb7g==
X-Google-Smtp-Source: AMsMyM5t905CkC2pl9ZhiooQYt86bJuYi8XfqiZzuanYsiUD8E3vQoIIdhEAJjVCGGpu+HO0b6ENog==
X-Received: by 2002:a05:620a:2627:b0:6b9:1b05:7b9 with SMTP id z39-20020a05620a262700b006b91b0507b9mr10396742qko.776.1665328596650;
        Sun, 09 Oct 2022 08:16:36 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id l18-20020a37f912000000b006ce580c2663sm7516046qkj.35.2022.10.09.08.16.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Oct 2022 08:16:35 -0700 (PDT)
Message-ID: <69ac49d8-1a4e-c830-fd7d-08f7ec1e1fa1@linaro.org>
Date: Sun, 9 Oct 2022 17:14:23 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v1 2/2] dt-bindings: hpet: add loongson2k hpet binding
To: Yinbo Zhu <zhuyinbo@loongson.cn>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Jianmin Lv <lvjianmin@loongson.cn>,
 Yun Liu <liuyun@loongson.cn>, Yang Li <yang.lee@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 loongarch@lists.linux.dev
References: <20220930093510.10781-1-zhuyinbo@loongson.cn>
 <20220930093510.10781-2-zhuyinbo@loongson.cn>
 <ba5873fa-83fc-2d16-b8c0-715ae8bf630a@linaro.org>
 <80af028d-d123-6894-189a-a26134ec89ee@loongson.cn>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <80af028d-d123-6894-189a-a26134ec89ee@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/10/2022 05:21, Yinbo Zhu wrote:
> 
> 
> 在 2022/9/30 下午5:58, Krzysztof Kozlowski 写道:
>> On 30/09/2022 11:35, Yinbo Zhu wrote:
>>> Add the loongson2k High Precision Event Timer (HPET) binding
>>> with DT schema format using json-schema.
>>>
>>> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
>>> ---
>>>   .../bindings/timer/loongson,ls2k-hpet.yaml    | 41 +++++++++++++++++++
>>>   MAINTAINERS                                   |  1 +
>>>   2 files changed, 42 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/timer/loongson,ls2k-hpet.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/timer/loongson,ls2k-hpet.yaml b/Documentation/devicetree/bindings/timer/loongson,ls2k-hpet.yaml
>>> new file mode 100644
>>> index 000000000000..1a8785076228
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/timer/loongson,ls2k-hpet.yaml
>>> @@ -0,0 +1,41 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/timer/loongson,ls2k-hpet.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Loongson2k High Precision Event Timer (HPET)
>>> +
>>> +maintainers:
>>> +  - Yinbo Zhu <zhuyinbo@loongson.cn>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: loongson,ls2k-hpet
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  clock-frequency: true
>>
>> clock frequency of what? I assume it's too early to use common clock
>> framework and just get the clock?

Still you did not answer: which/what clock?

> The clock-frequency is 125000000, It doesn't support use common clock 
> framework 

But it should use CCF, if possible.

> and just get the clock from dts, and I refer 

How do you "get" the clock from DTS?

> "arm,armv7m-systick" to add the clock-frequency information:

Better go with Common Clock Framework instead.

> 
>    clock-frequency: true
> 
> oneOf:
>    - required:
>        - clocks
>    - required:
>        - clock-frequency
>>

Best regards,
Krzysztof

