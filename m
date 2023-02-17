Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F83625
	for <loongarch@lists.linux.dev>; Fri, 17 Feb 2023 08:40:54 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id co2so1005515edb.13
        for <loongarch@lists.linux.dev>; Fri, 17 Feb 2023 00:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yNlzdhkOQHzq20NVyGLukWTdEN+zeap3hr8OBMls538=;
        b=xD6/IJpi470BpQTRI/51fSBug+Im2ui4QtKq+o4q97OX5PiWIG3hNYI27KdZnkUYgh
         kosxXQJkJhA0oRORMQKnD2L8v3TsBt1bcb/Wp5wxbdmKuejaoBsrPMKGYWa3l3xM4NIu
         SDYChuxobHu2bS4v0WbwIm/U3GMasJcboFEumhaepTHUzGNo+2oTYY0MfjaQYPVaXYcE
         vpSbqMdqCaRcdbcPqAzLbFISfPMETDr9GZSS5h17oYPSPy9RmjgamOAyCMnfrar5xmaC
         11YwTblo+ykwObG+HDz4V2xHFmwBj/X3WYOt8+acK5thggzxlI2bThv6thANwTn5D7T6
         JE9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yNlzdhkOQHzq20NVyGLukWTdEN+zeap3hr8OBMls538=;
        b=NWEO/S55jcfm2Ta195plYg3jNiDsRwvguQTF19YZAQPy8cwINVDHPNDLWx1xP8DXO5
         XB1MAM5nkzIG1TmRJx2A5Or+yHNoLj4JT4RzhbiXpU7B6xGq7LeOfXkMD9sKzrSNdL3Y
         S1B0/1lXYbm0HmK3A2kUazTP8t3/BTZQsYMWbjfxsZgtx6CFCgPLOVVVGe8yn64hgG4R
         eNOEDeifEG8PB8r8IsKID8rPJvYHemLUwpI7ja+RRljK9lvg4K6IK0HL+eAa1Q/pqttP
         32xN5CW1Mp+PsdjW6e2YKlwaX3r07Kg16xTebvFmDf7spxTR8zzidMssEpBMsF+QDnmI
         lHQA==
X-Gm-Message-State: AO0yUKUGDQNppkNYROjwvWo7iaC/joNtbrwysh00apPNxNDMpJp6g3Cc
	vN7OiZz1rA4BulnESY29vlo4uw==
X-Google-Smtp-Source: AK7set9PRGCfdro26MLR7ocLmnYzrc1z44bpXULKIiN9W8O9OqdmP07SWABEAtqN/zho+4rT/h7Ovw==
X-Received: by 2002:a17:906:308a:b0:8b1:81eb:159e with SMTP id 10-20020a170906308a00b008b181eb159emr1395860ejv.7.1676623252738;
        Fri, 17 Feb 2023 00:40:52 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id lt13-20020a170906fa8d00b00888d593ce76sm1859298ejb.72.2023.02.17.00.40.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Feb 2023 00:40:52 -0800 (PST)
Message-ID: <4dcaaa70-11e0-fc9d-da03-224d34e36983@linaro.org>
Date: Fri, 17 Feb 2023 09:40:50 +0100
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMpQs4KennWg60ccQ5NYOs=5a9gqTk_bKY26noQ3u0qLQSBg_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/02/2023 07:09, Binbin Zhou wrote:

>>> Hi Krzysztof:
>>>
>>> Allow me to give a brief overview of the current status of eiointc (DT-based):
>>>      Loongson-3A series supports eiointc;
>>>      Loongson-2K1000 does not support eiointc now;
>>>      Loongson-2K0500 supports eiointc, with differences from
>>> Loongson-3, e.g. only up to 128 devices are supported;
>>>      Loongson-2K2000 supports eiointc, similar to Loongson-3.
>>>      ....
>>>
>>> As can be seen, there is now a bit of confusion in the chip's design of eiointc.
>>>
>>> The design of eiointc is probably refined step by step with the chip.
>>> The same version of eiointc can be used for multiple chips, and the
>>> same chip series may also use different versions of eiointc. Low-end
>>> chips may use eiointc-2.0, and high-end chips may use eiointc-1.0,
>>> depending on the time it's produced.
>>>
>>> So in the Loongson-2K series I have defined the current state as
>>> eiointc-1.0, using the dts property to indicate the maximum number of
>>> devices supported by eiointc that can be used directly in the driver.
>>>
>>> If there are new changes to the design later on, such as the
>>> definition of registers, we can call it eiointc-2.0, which can also
>>> cover more than one chip.
>>
>> Just go with SoC-based compatibles. If your version is not specific
>> enough, then it is not a good way to represent the hardware.
>>
> 
> Hi Krzysztof:
> 
> I have tried to write the following  SoC-based compatibles,  is it fine?
> 
> compatible:
>     enum:
>       - loongson,ls3a-eiointc  # For MIPS Loongson-3A if necessary.
>       - loongson,ls2k0500-eiointc
>       - loongson,ls2k200-eiointc

Looks good, but didn't you state these are compatible between each
other? I have impression there is a common set, so maybe one compatible
work on other device with reduced number of devices?

Best regards,
Krzysztof

