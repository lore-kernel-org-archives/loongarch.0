Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59906117
	for <loongarch@lists.linux.dev>; Fri, 16 Jun 2023 09:47:09 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5187aa18410so608653a12.0
        for <loongarch@lists.linux.dev>; Fri, 16 Jun 2023 02:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686908828; x=1689500828;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ifjs8IzGG51I99S8/uEN1zbxdqPw85c/zfKSzuZxu0c=;
        b=mYaq4eLXeDX588B7PnPusUgbtP0xodNgXFt+zvt5ErujCNWuo+tV82S7btWcFw5UYC
         aqFGAHxYfrMkqPkz65ye/9gbM7Dohn8bRwQQ8ZN01WfzV50qZhcHw6mf4KNDYGLyVyMi
         bBzpzHvSKdzd3KhjotsSHS4ixZ9CXRetMEPg+DJEJXxQto2tfYMkBRfRinEJMoNKTHJg
         Rr1MeJc35gXBisfwfx+279X34JJthSycH37/+HRN/NgefHIe4g+96ZIXMP/mTzzBoTy1
         JsAoEwQtVLofvAecwmWIaFiuExvgi4xAvpuA89ni+6IuywlH8LF9WQmjgxcAOoma5kFb
         WUdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686908828; x=1689500828;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ifjs8IzGG51I99S8/uEN1zbxdqPw85c/zfKSzuZxu0c=;
        b=JPMw+SzMdxWIARn9nmw2hpCy7CZ4KYnAUJFVKs0JzAzMrS6/wQz5PEHIupAZl5tYr4
         QJRj2zE0v6o/z3zJPPuqjdhAyQr86OJ92LgoI4VWLlo/Zl5S1GksDYRqzQezRSyBRDht
         BCVztLIU6J5AiwY1H9w/mrmFs4O9buUzyYiVFzFxp/yb4ppTgJ+5ng3/HOWPVo3VUN5R
         4t2urglyGQ+y3vo92O8MEGCA1ZHD6lt+R7x2BC704ich15TcZZP76rgGCspPghRH52+H
         j6xU5c/uJv0xKBylenuXi6Iol/69Y1p2UflW/krcQmtSrrApNNNWehaLlsbfseDhN4Wl
         JLyA==
X-Gm-Message-State: AC+VfDzPdefxcch3uVZyeV4Al/mMZgWeP2bnYEYcs5uJl3gMgfqXEhwJ
	AnXcOuGo41mJQKxrlWwbkM4LvA==
X-Google-Smtp-Source: ACHHUZ6HAxVgJx2QSRY/5nUox1m78oic1SYdy3ZwKZhZezMNKwREPHgmZ4rHXvX7m+8NTxphc0GRdg==
X-Received: by 2002:a05:6402:21a:b0:518:7a51:7e97 with SMTP id t26-20020a056402021a00b005187a517e97mr822922edv.36.1686908827946;
        Fri, 16 Jun 2023 02:47:07 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id v15-20020aa7cd4f000000b0051a3f9770dasm212422edw.8.2023.06.16.02.47.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jun 2023 02:47:07 -0700 (PDT)
Message-ID: <172e50ef-c516-b992-72b7-dc9ef82a3667@linaro.org>
Date: Fri, 16 Jun 2023 11:47:05 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/6] dt-bindings: loongarch: Add CPU bindings for
 LoongArch
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>,
 Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen
 <chenhuacai@loongson.cn>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, loongson-kernel@lists.loongnix.cn,
 Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Hongliang Wang <wanghongliang@loongson.cn>
References: <cover.1686882123.git.zhoubinbin@loongson.cn>
 <c1f86e5d1026937abda331ce564e5ee96b7114c7.1686882123.git.zhoubinbin@loongson.cn>
 <20230616-gallon-shrank-42613cd73666@wendy>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230616-gallon-shrank-42613cd73666@wendy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/06/2023 11:34, Conor Dooley wrote:
> On Fri, Jun 16, 2023 at 02:10:38PM +0800, Binbin Zhou wrote:
>> Add the available CPUs in LoongArch binding with DT schema format using
>> json-schema.
>>
>> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
>> ---
>>  .../devicetree/bindings/loongarch/cpus.yaml   | 65 +++++++++++++++++++
>>  1 file changed, 65 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/loongarch/cpus.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/loongarch/cpus.yaml b/Documentation/devicetree/bindings/loongarch/cpus.yaml
>> new file mode 100644
>> index 000000000000..c3e2dba42c81
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/loongarch/cpus.yaml
>> @@ -0,0 +1,65 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/loongarch/cpus.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: LoongArch CPUs
>> +
>> +maintainers:
>> +  - Binbin Zhou <zhoubinbin@loongson.cn>
>> +
>> +description:
>> +  The device tree allows to describe the layout of CPUs in a system through
>> +  the "cpus" node, which in turn contains a number of subnodes (ie "cpu")
>> +  defining properties for every CPU.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - loongson,la264
>> +      - loongson,la364
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  device_type: true
>> +
>> +  clock-frequency:
>> +    description: The frequency of cpu in Hz.
> 
> Why don't you just add a ref to the common cpu schema and use the
> standard properties for communicating clock frequencies?
> You then get the standard properties for l1 caches, power management,
> frequency scaling etc as a side effect.
> 

And operating-points-v2... unless all Loongson CPUs work with only one
frequency and do not allow dynamic scaling?


Best regards,
Krzysztof

