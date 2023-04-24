Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6ED7C
	for <loongarch@lists.linux.dev>; Mon, 24 Apr 2023 08:45:32 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-506bdf29712so30940159a12.0
        for <loongarch@lists.linux.dev>; Mon, 24 Apr 2023 01:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682325931; x=1684917931;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H2QhGbPfS5cFQyV2e+dfSoRNu58zlK/LOs70+0DhVQg=;
        b=JYxpf8QGYxce1yUMh0Qi+Fp1oILpqRp2214cBO7q7NJqGA86odQLx05RtEiAz3qEDZ
         pYTCQas33oKTGfv4nE3NcOjO6lj37xrTOx/dWm2Ipr2JpAkfnNTxzDG317OzYHMkp9aB
         M4DSY/0nkneF+otW91G9dj/K12ipUQhLG/kjc1aN/rqNcAbgWRmOHkFeKiOJcjO8xt4Y
         NkuV4UvLvgm4nDuKc7kJmyndDoMzuK7uDmlNGgcsBWNQu/60v75WPFzcDd4+oI8YU6qc
         T1I4UuK0qckBjz88XVMhU247waC0pn+3GR+yx5zc9097CTrBxaaQf8GUISMrSDauUehk
         8eGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682325931; x=1684917931;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H2QhGbPfS5cFQyV2e+dfSoRNu58zlK/LOs70+0DhVQg=;
        b=eV1dSx4g8YnnhpU4VZSuEYP5EY+WdJWvj+aEqNhCBWyZaFw3loEpypD8NTAmKxmrRh
         WDCKGYX6KWtPM0LKtMClmoiZt0ZylTwHX5bXhhNJJAatATOTIe47vZJsBZztJiEDwvAd
         J0g0qoEvedCk4UqXFSWFwJO6M3h9+UQS538lrYE9sgiyBZhz6NE31EAxaDMmFrXFUwbR
         Wztbsq0b8p+UonKi+2WH0QwSQ7kLB+APPrl4gYUcb3eeamBPLKX6q4HyX3UlakLQhOWA
         QtER6vamy0uNo6b3IVtdmUezK61UbMTtovioX0eXcbDwoj+P7ZBqbtnqlyxwp0CpjXE0
         JrWw==
X-Gm-Message-State: AAQBX9dvJqGQJgPWbSVQZ8APnJ67cRvz23WRMllXy8RJ9DPm5SphtDex
	sXaU1Y+i3cw5YOXiEeQRka/peg==
X-Google-Smtp-Source: AKy350bxdVgo3uacEszB4mUWydB3zlwuBKaof0asY6EntyEMNGr8s1gxCIhCzq9xEWTc75SvmZNj8g==
X-Received: by 2002:a17:906:cc99:b0:94a:511b:a21d with SMTP id oq25-20020a170906cc9900b0094a511ba21dmr9547736ejb.28.1682325930798;
        Mon, 24 Apr 2023 01:45:30 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:fcdb:bf53:d053:3a52? ([2a02:810d:15c0:828:fcdb:bf53:d053:3a52])
        by smtp.gmail.com with ESMTPSA id jt20-20020a170906ca1400b008e54ac90de1sm5250255ejb.74.2023.04.24.01.45.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Apr 2023 01:45:30 -0700 (PDT)
Message-ID: <169d832c-72c0-6c67-37c3-dbea9e1bc639@linaro.org>
Date: Mon, 24 Apr 2023 10:45:28 +0200
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
 <75231886-cdf6-cfde-d6b9-183b1fbf98da@linaro.org>
 <CAMpQs4Jp8WPKJEuJD-_83oRPBbPELxS5ufqp-nHow0D9D+R+ig@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMpQs4Jp8WPKJEuJD-_83oRPBbPELxS5ufqp-nHow0D9D+R+ig@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/04/2023 10:30, Binbin Zhou wrote:
> On Thu, Apr 20, 2023 at 11:52 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 20/04/2023 15:00, Binbin Zhou wrote:
>>>>> +examples:
>>>>> +  - |
>>>>> +    eiointc: interrupt-controller@1fe11600 {
>>>>> +      compatible = "loongson,ls2k0500-eiointc";
>>>>> +      reg = <0x1fe11600 0x10>,
>>>>> +            <0x1fe11700 0x10>,
>>>>> +            <0x1fe11800 0x10>,
>>>>> +            <0x1fe114c0 0x4>;
>>>>
>>>> Binding is OK, but are you sure you want to split the address space like
>>>> this? It looks like two address spaces (enable+clear+status should be
>>>> one). Are you sure this is correct?
>>>>
>>> Hi Krzysztof:
>>>
>>> These registers are all in the range of chip configuration registers,
>>> in the case of LS2K0500, which has a base address of 0x1fe10000.
>>> However, the individual register addresses are not contiguous with
>>> each other, and most are distributed across modules, so I feel that
>>> they should be listed in detail as they are used.
>>
>> Do you want to say that:
>> Between 0x1fe11600 and 0x1fe11700 there are EIOINTC registers and other
>> (independent) module registers?
> 
> No, this section is all EIO-related configuration, but there will be
> undefined space here.
> 
> Throughout the chip configuration space, there are some relatively
> common areas, such as the definition of 0x1fe1_14c0.
> Because our chip supports two interrupt modes, node legacy I/O
> interrupt and extended I/O interrupt, both modes require interrupt
> routing registers.
> Their registers are then defined together: the legacy interrupt I/O
> start address is 0x1fe1_1400, while the extended I/O interrupt start
> address is 0x1fe1_14c0.
> 
> Then I have carefully compared the chip configuration space in
> LS2K0500 and LS2K2000 and can see that:
> 
> 1. The chip configuration space base addresses are different, but they
> both have a size of 64KB;
> 2. The offset addresses of the EIO related registers are the same, for
> example the offset of the enable register is 0x1600.
> 
> Wouldn't it be better to declare the entire configuration space (64KB)
> directly in the dts and use the offsets to access the corresponding
> registers?
> 
> Example:
> reg = <0x1fe10000 0x10000>.

Yes, that's what usually we do.

Best regards,
Krzysztof

