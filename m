Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CC31C3A
	for <loongarch@lists.linux.dev>; Tue, 21 Feb 2023 11:18:40 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id b12so15676521edd.4
        for <loongarch@lists.linux.dev>; Tue, 21 Feb 2023 03:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=te3p4bKydyp/MbIlm34Ds4b8t0tdrCO/k0x0oPR5HmA=;
        b=sjV1W157Nd2uD+N+AFPnMckchyhrGh5QiQNKESz4iHvU2+4NW6LDaJyh6mwplvbenr
         Q89gbbsgzbWULv4GlgcsLIciNpn5KsXcgGN54b6kLQyU/jDWR6tx587ZdsqybTkAbyKa
         oVMcINL8ypDqOZNvMeayu6+Xn13pAPWuAjNnPyIHhXUb5c404idEDDzKuTV3a2Gg02EA
         xkSaU90014O4rZidTioVUiwxQ3zsOBAj68RkXh5zRH5XWz5M9vYDuHB0JcVNQQ1u0ooN
         BFD8OHn8sF3aYWJwcrIrC23fe4jWMcS+6NJlKlqyHoGKCRX5QurkfADwi4ewXm5/QpRT
         swfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=te3p4bKydyp/MbIlm34Ds4b8t0tdrCO/k0x0oPR5HmA=;
        b=1d4EQe8y4IXg6Y+kHFKPqnGxV1ILQ9EB9Lx9EF+pG5NbCpharJIzVul9ux6spFrOTs
         41krGkzDI5MLV8UbeUgRMt3fON1va81S82tkkGyGuW0kPCNewSI7MX36BssbMbz+HYbf
         b75TVFzr6N97xOuyYq7mJrqKjU6qQJncgP88b2gOxAPovC4vuG687VbUzr2RLisoNWUS
         fqpasMVJSo/+7kRaIQEyf/St3NwY3BdnnyJeJmuPu71gHdcZVd3l6TfUbMFRAJxxAiQY
         D7+PQ+8bV1Z2Y5T+PddM9MiFXT7Avet18OUBNgi7JGh5Z0kom542Huk5u2lis+tN//P2
         NJvg==
X-Gm-Message-State: AO0yUKVOYxVQlkRsDm+Hu0LTcXnTJgPMYJxeR45vN56IW4Pwsk0hni9U
	FW+pSkEuN9+SFZ1VvxSzJu+uPQ==
X-Google-Smtp-Source: AK7set/OO+e1W/Ws56sG5Ah5QjKrNgdFollXBGhuh6EuaPZ5R/SRBjgvMBb2POELMIB/xkjfl5peYA==
X-Received: by 2002:a05:6402:34d5:b0:4ae:eae1:2be0 with SMTP id w21-20020a05640234d500b004aeeae12be0mr3044763edc.14.1676978318384;
        Tue, 21 Feb 2023 03:18:38 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id g13-20020a056402090d00b004acbda55f6bsm1096399edz.27.2023.02.21.03.18.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 03:18:37 -0800 (PST)
Message-ID: <aded9eca-bf6d-9a55-d791-29f635323332@linaro.org>
Date: Tue, 21 Feb 2023 12:18:35 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH V2 1/2] dt-bindings: interrupt-controller: Add Loongson
 EIOINTC
Content-Language: en-US
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
 <CAMpQs4K+aYGrOoWy04vrbEy53kba9zUzGkOwD34pwAH0c=D8iA@mail.gmail.com>
 <49c8255e-66f3-fa1f-2949-1f03f77a0fa4@linaro.org>
 <CAMpQs4KennWg60ccQ5NYOs=5a9gqTk_bKY26noQ3u0qLQSBg_w@mail.gmail.com>
 <4dcaaa70-11e0-fc9d-da03-224d34e36983@linaro.org>
 <CAMpQs4KpE7RLyxw4++4z4RhjR_ix300mtDfwh6KgJJw1B43CqA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMpQs4KpE7RLyxw4++4z4RhjR_ix300mtDfwh6KgJJw1B43CqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/02/2023 11:12, Binbin Zhou wrote:
> On Fri, Feb 17, 2023 at 4:40 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 17/02/2023 07:09, Binbin Zhou wrote:
>>
>>>>> Hi Krzysztof:
>>>>>
>>>>> Allow me to give a brief overview of the current status of eiointc (DT-based):
>>>>>      Loongson-3A series supports eiointc;
>>>>>      Loongson-2K1000 does not support eiointc now;
>>>>>      Loongson-2K0500 supports eiointc, with differences from
>>>>> Loongson-3, e.g. only up to 128 devices are supported;
>>>>>      Loongson-2K2000 supports eiointc, similar to Loongson-3.
>>>>>      ....
>>>>>
>>>>> As can be seen, there is now a bit of confusion in the chip's design of eiointc.
>>>>>
>>>>> The design of eiointc is probably refined step by step with the chip.
>>>>> The same version of eiointc can be used for multiple chips, and the
>>>>> same chip series may also use different versions of eiointc. Low-end
>>>>> chips may use eiointc-2.0, and high-end chips may use eiointc-1.0,
>>>>> depending on the time it's produced.
>>>>>
>>>>> So in the Loongson-2K series I have defined the current state as
>>>>> eiointc-1.0, using the dts property to indicate the maximum number of
>>>>> devices supported by eiointc that can be used directly in the driver.
>>>>>
>>>>> If there are new changes to the design later on, such as the
>>>>> definition of registers, we can call it eiointc-2.0, which can also
>>>>> cover more than one chip.
>>>>
>>>> Just go with SoC-based compatibles. If your version is not specific
>>>> enough, then it is not a good way to represent the hardware.
>>>>
>>>
>>> Hi Krzysztof:
>>>
>>> I have tried to write the following  SoC-based compatibles,  is it fine?
>>>
>>> compatible:
>>>     enum:
>>>       - loongson,ls3a-eiointc  # For MIPS Loongson-3A if necessary.
>>>       - loongson,ls2k0500-eiointc
>>>       - loongson,ls2k200-eiointc
>>
>> Looks good, but didn't you state these are compatible between each
>> other? I have impression there is a common set, so maybe one compatible
>> work on other device with reduced number of devices?
>>
> 
> So far, the difference between ls2k SOCs is the number of devices
> supported by eiointc.
> 
> Do you mean use unified compatible and reuse loongson,eio-num-vecs?
> 
> Would this be possible, e.g.

No. I meant that maybe all these three should have been made compatible.

Best regards,
Krzysztof

