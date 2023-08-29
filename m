Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EDE10EC
	for <loongarch@lists.linux.dev>; Tue, 29 Aug 2023 06:29:46 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-99c1d03e124so520182666b.2
        for <loongarch@lists.linux.dev>; Mon, 28 Aug 2023 23:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693290585; x=1693895385;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VfulV8l9fAUi9Tsip5/92M0tbm/MGDJ64gWqHZKs5QM=;
        b=M6U9uxGnbQr/fqYwdYbCqGLGUC5TUD21umeX91HrRYhQ9ru4ZrV22Oc73gfV+qTpfr
         7xrf8ZFp3iXsdNCL9aJs+1orL7o0WUwiM/7C/U1GpYfzEj2hKL4B3rkscQzmw0hL9kcd
         F+B0mr/KR0tu8xq/cbfrcyWYEiI8A9+IRlG4YYJjFt1xCFNZ6Xo6XU/LM7n29+9JSb0l
         jMdltpPxtOW5wPQkWFY5lgUW4HxkuKHrBFA5tsqR1D+J6j5PqiRmomqNTRqLTf0XF39Y
         QIgxnwhEkEgqQc3jKhkzwSpJ2uuPpfX5ulMqOkbRSriLqBkx67qgLplaaW1+G0Jd9XN6
         JY/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693290585; x=1693895385;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VfulV8l9fAUi9Tsip5/92M0tbm/MGDJ64gWqHZKs5QM=;
        b=LBDqHN4jDYcK8XrfTbmFqcme1adjTQxHZW7rbZT3wAz4j9jEBRMnbsTZbuAsCV6Sp3
         ZrmzhBsrE9kRNbQyqzCDJuoADbhx9271NxDwj2uv5VoUJZfHzh4T/n5oHJqslffxyW1F
         oawLCyMFCA5XWWqmJU9+w9jtV9Aq7BthlrGnfLzCfxXv9O9MKm0Gvf3nzm6ywKlBX9V0
         5mTNAZ+WZeElxqccYlkNa+MWmP3F1Gbt9KiezPBOYTPkbBasObwf1pgUScpELqRIt4d4
         DQhbNlWoG472PifcoosCFqLEZjjf1qj7sHNeQj5KMT/mHqIyelSNfBol3L8xg99GuG8U
         eJPg==
X-Gm-Message-State: AOJu0YwAU7DYm9o3UG0tbUWEEdq1hCBg7d5dPFETw8Wf9YPlfE9IY/1M
	7CuU8jhs15vGgKCE8TY7eLu9QA==
X-Google-Smtp-Source: AGHT+IHmnbiTbRrVI1+kiRm4p8e06XXGWlBZtkv3p5iM1pfrWN1Ql5/ryaWvi4l3r6rYzjx7fJXLvw==
X-Received: by 2002:a17:906:113:b0:9a2:120a:5779 with SMTP id 19-20020a170906011300b009a2120a5779mr11507129eje.60.1693290584856;
        Mon, 28 Aug 2023 23:29:44 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.196])
        by smtp.gmail.com with ESMTPSA id k16-20020a170906971000b009a0955a7ad0sm5573160ejx.128.2023.08.28.23.29.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Aug 2023 23:29:44 -0700 (PDT)
Message-ID: <3fd27e64-2221-ec38-1320-9ae966f998aa@linaro.org>
Date: Tue, 29 Aug 2023 08:29:43 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 2/5] dt-bindings: soc: loongson,ls2k-pmc: Add missing
 compatible for Loongson-2K2000
Content-Language: en-US
To: Binbin Zhou <zhoubb.aaron@gmail.com>, Conor Dooley <conor@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen
 <chenhuacai@loongson.cn>, Yinbo Zhu <zhuyinbo@loongson.cn>,
 Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 loongson-kernel@lists.loongnix.cn, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>,
 loongarch@lists.linux.dev
References: <cover.1693218539.git.zhoubinbin@loongson.cn>
 <54ee114c08f35ab8b5dc584fd76135ac9076f5a7.1693218539.git.zhoubinbin@loongson.cn>
 <20230828-shrewdly-payee-c5eb091a0417@spud>
 <CAMpQs4Jp0rb8sbrLrPnNziLph4Ym4LxBsFt-00G69ecd8bUHNg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMpQs4Jp0rb8sbrLrPnNziLph4Ym4LxBsFt-00G69ecd8bUHNg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/08/2023 05:21, Binbin Zhou wrote:
> HI Conor:
> 
> Thanks for your reply.
> 
> On Mon, Aug 28, 2023 at 11:49 PM Conor Dooley <conor@kernel.org> wrote:
>>
>> On Mon, Aug 28, 2023 at 08:38:32PM +0800, Binbin Zhou wrote:
>>> Document the Power Management Unit system controller compatible for
>>> Loongson-2K2000.
>>>
>>> This is a missing compatible, now we add it.
>>>
>>> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
>>> ---
>>>  .../devicetree/bindings/soc/loongson/loongson,ls2k-pmc.yaml      | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/soc/loongson/loongson,ls2k-pmc.yaml b/Documentation/devicetree/bindings/soc/loongson/loongson,ls2k-pmc.yaml
>>> index da2dcfeebf12..7473c5659929 100644
>>> --- a/Documentation/devicetree/bindings/soc/loongson/loongson,ls2k-pmc.yaml
>>> +++ b/Documentation/devicetree/bindings/soc/loongson/loongson,ls2k-pmc.yaml
>>> @@ -15,6 +15,7 @@ properties:
>>>        - enum:
>>>            - loongson,ls2k0500-pmc
>>>            - loongson,ls2k1000-pmc
>>> +          - loongson,ls2k2000-pmc
>>
>> Same thing here as the driver patch, the pmc on this newly added SoC
>> appears to use the same codepaths as the existing ones. Does it share a
>> programming model & should there be a fallback compatible here?
> 
> I noticed the guideline about fallback compatible:
> 
> "DO use fallback compatibles when devices are the same as or a subset
> of prior implementations."
> 
> But in fact, ls2k0500/ls2k1000/ls2k2000 are independent, there is no subset.

We do not consider here ls2k0500/ls2k1000/ls2k2000, but PMC in each of
them. If they are independent, why would they use the same interface?

> Can we define a "loongson,ls2k-pmc" superset for each ls2k SoC
> compatible fallback.
> 
> Such as:
> 
>   compatible:
>     oneOf:
>       - enum:
>           - loongson,ls2k0500-pmc
>           - loongson,ls2k1000-pmc
>           - loongson,ls2k2000-pmc
>       - const: loongson,ls2k-pmc

This is discouraged. Use 0500 as fallback.



Best regards,
Krzysztof

