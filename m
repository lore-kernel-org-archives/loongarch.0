Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD7410792
	for <loongarch@lists.linux.dev>; Wed, 15 Feb 2023 20:12:22 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id fi26so25431125edb.7
        for <loongarch@lists.linux.dev>; Wed, 15 Feb 2023 12:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZWoZA8qGgq7/x6EJNe+HmaR5fU3v8UqOPtojqnq1sKg=;
        b=MsGryKrtxHBLaqw/J3F42LFYUz5sSQzBldJ0cMFEzla/sx+xMPqtLJEDuKS1QNi98k
         iWAUSYZxKkhY5NCUw04aRg9xrjCr12i3b1r4pQLuNUZILpblRbtFk6pg1Wo7qhpzGF7q
         naNqeo4EW7i2JDAQeW/Q/XLtRk2JXPaDQ9AZIJTlJOJNL7dMCGelqkY7TNUiCbeJKPtB
         3JIuJxAmdsyA07dsHFlAqcrYdRvbVgsCsU3bm1jtUaVQkgcpSsSh979kSjKcXxtenKHh
         kgaU78naEAHo+Yb6LTN1O02s8gsrlo01HK7r4C0Obi1E3qs0LQAy6GJaPzLHwyMYJ9tg
         bA5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZWoZA8qGgq7/x6EJNe+HmaR5fU3v8UqOPtojqnq1sKg=;
        b=az+3N6tUydX69QJkkfcn7Bxm4K23+0MyqItLwFAbQtXqimIBc/5wmFBAovIH1wW0Ua
         QK+bn2cjysLKIUMThEp1Qq25xv2/FehBWjMcIJraKyPFb85k1T8MwU3EVTjtRZfT8TJ4
         DxsOoY9SqSJYCZetCfESbjsyQ+v+cCIcklhWIWAqBz+1zh3Gb0HJGeGxeySjTVQOsCOh
         +4J/tQfEOAxk4CDH1v6vbGQ08UrQCy4AMryl/29Sbbj+lI0ybibiL32oqZsZcaq1yHDC
         vdFdx3HsViQ24e1t0/hTd7KPElt9b4QCCz0cA+66O7cKjmxVWTSMdpTcACIrtfuw+bBD
         nuBg==
X-Gm-Message-State: AO0yUKX08kcqJJEeq9xFTZwzZSurEg7/UeKVaEcU0MZqCMCHPE/v8kmR
	9t/u87MJxMnNNsNTAmgyqEwlMg==
X-Google-Smtp-Source: AK7set/jHl1Odp5mSZbVYnAK8AAz4shx+jKhUVZbGwC/0QQ2RDATXndC8SUR3jQp9W3UQU0pjK4lyA==
X-Received: by 2002:aa7:dc18:0:b0:4ad:152a:9ded with SMTP id b24-20020aa7dc18000000b004ad152a9dedmr967831edu.32.1676491940846;
        Wed, 15 Feb 2023 12:12:20 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id 29-20020a508e5d000000b004acdef7baaesm2709053edx.96.2023.02.15.12.12.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 12:12:20 -0800 (PST)
Message-ID: <730f6bf9-ce57-6834-12e0-b60abbfb2e1f@linaro.org>
Date: Wed, 15 Feb 2023 21:12:18 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V2 1/2] dt-bindings: interrupt-controller: Add Loongson
 EIOINTC
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Binbin Zhou <zhoubb.aaron@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen
 <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jianmin Lv <lvjianmin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 loongarch@lists.linux.dev, devicetree@vger.kernel.org,
 loongson-kernel@lists.loongnix.cn
References: <cover.1676289084.git.zhoubinbin@loongson.cn>
 <a9f697906df6599e6b001981e668479da71aa7a0.1676289084.git.zhoubinbin@loongson.cn>
 <df464409-9a93-c057-5f66-923a9e24696a@linaro.org>
 <CAMpQs4JX0Vgf5tvv5Yw5eLGANFfn1p=iQ_kMS0yQPV6kE2tN1g@mail.gmail.com>
 <23068d0c-d37c-0563-e1c1-e4d112059f5b@linaro.org>
In-Reply-To: <23068d0c-d37c-0563-e1c1-e4d112059f5b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/02/2023 13:43, Krzysztof Kozlowski wrote:
>>
>>>
>>>> +
>>>> +  reg:
>>>> +    minItems: 1
>>>> +    maxItems: 3
>>>
>>> You need to describe the items.>>>
>>>> +
>>>> +  interrupt-controller: true
>>>> +
>>>> +  interrupts:
>>>> +    description:
>>>> +      Interrupt source of the CPU interrupts.
>>>
>>> You need to describe the items.
>>
>> Do you mean a more detailed description?
> 
> I mean constraints on interrupts and/or description if they are not obvious.


Actually I noticed that for interrupts you provided the name, so it is
description and you just need maxItems:1.

The reg however need list of items which clearly documents what is there.

Best regards,
Krzysztof

