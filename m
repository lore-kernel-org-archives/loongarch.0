Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D27119408A
	for <loongarch@lists.linux.dev>; Fri,  9 Aug 2024 09:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723197311; cv=none; b=Z6ohHrL6v0IT1YnFeReE7csoVoUFlsBUpPlCisA3r6Hexa2PTJz58tQgWXMgSJgefityAl+55fbFkVpXWV6C1PZ3TwALjOq4L8Tp8pPY3oNQ6e2sy8+xD13mi52vXMZ5VutanzjgLktZoh7X0H3rF9KvOV1EV1AMBKJfrj42C94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723197311; c=relaxed/simple;
	bh=bKqR00lMFHSPv2lR/K8iQjWL7W5AESJ79Fo1BCdTLn4=;
	h=From:Subject:To:Cc:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=H4zRGoTudybElk6pJ7Pn+R5tnhw2QPL5uuoBbqOibG1d0E/3ptIS7JKRVxmK+ZhHru8INgEi8K/RqnFSAwmBwnoMV1AwUDToEtEJYyHawWMxB8ymJlUUyainwBrZN4fiKa5WhGPZnUEG+C3++dSZTBrA2jxktnBS0EA2Yc7iCq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.4.132])
	by gateway (Coremail) with SMTP id _____8BxGJp557Vmnk4NAA--.658S3;
	Fri, 09 Aug 2024 17:55:05 +0800 (CST)
Received: from [10.20.4.132] (unknown [10.20.4.132])
	by front1 (Coremail) with SMTP id qMiowMAx4+F457Vm6l0LAA--.56196S3;
	Fri, 09 Aug 2024 17:55:04 +0800 (CST)
From: =?UTF-8?B?6YOR6LGq5aiB?= <zhenghaowei@loongson.cn>
Subject: Re: [PATCH v2 1/3] dt-bindings: serial: Add Loongson UART controller
To: Krzysztof Kozlowski <krzk@kernel.org>, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name,
 p.zabel@pengutronix.de
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, loongarch@lists.linux.dev
References: <20240804063834.70022-1-zhenghaowei@loongson.cn>
 <4d1f2426-b43c-4727-8387-f18edf937163@kernel.org>
 <f31609c4-1e47-49bc-9231-5b0353d35dc9@loongson.cn>
 <601adbfd-fbb6-48c6-b755-da1b5d321d6b@kernel.org>
Message-ID: <89e71573-9365-2e61-bb38-759363df1b8b@loongson.cn>
Date: Fri, 9 Aug 2024 17:55:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <601adbfd-fbb6-48c6-b755-da1b5d321d6b@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowMAx4+F457Vm6l0LAA--.56196S3
X-CM-SenderInfo: x2kh0w5kdr4v3l6o00pqjv00gofq/1tbiAgEEBGa0tRkS5gAAsJ
X-Coremail-Antispam: 1Uk129KBj93XoWxAFyrKFW5ArWkXF4UCw43twc_yoWrCFWfpw
	45Ca1qyr4qqr15Zw1vqa4xArnIv398JFnrur1DG34UKa90vw1ftr1ftF1Uu3s7WryUZry2
	qF1UK3yxua15ZrXCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
	ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8cz
	VUUUUUU==


在 2024/8/9 13:53, Krzysztof Kozlowski 写道:
> On 07/08/2024 10:23, 郑豪威 wrote:
>> 在 2024/8/4 16:43, Krzysztof Kozlowski 写道:
>>> On 04/08/2024 08:38,zhenghaowei@loongson.cn  wrote:
>>>
>>> Due to lack of changelog, I assume you send the same patch, so:
>>>
>>> <form letter>
>>> This is a friendly reminder during the review process.
>>>
>>> It seems my or other reviewer's previous comments were not fully
>>> addressed. Maybe the feedback got lost between the quotes, maybe you
>>> just forgot to apply it. Please go back to the previous discussion and
>>> either implement all requested changes or keep discussing them.
>>>
>>> Thank you.
>>> </form letter>
>>>
>>> Also:
>>>
>>>> +
>>>> +  clocks:
>>>> +    maxItems: 1
>>>> +
>>>> +  fractional-division:
>>> Where are this and following defined? In which schema?
>>>
>> These and the ones below are new definitions, can I use them like this?
>>
>> +  fractional-division:
>> +    description: Enables fractional-N division. Currently,
>> +      only LS2K1500 and LS2K2000 support this feature.
>> +    type: boolean
>>
> Missing vendor prefix, but what's more important, why would this be
> property of DT? Just enable it always...
>
>>>> +    description: Enables fractional-N division. Currently,
>>>> +      only LS2K1500 and LS2K2000 support this feature.
>>>> +
>>>> +  rts-invert:
>>>> +    description: Inverts the RTS value in the MCR register.
>>>> +      This should be used on Loongson-3 series CPUs, Loongson-2K
>>>> +      series CPUs, and Loongson LS7A bridge chips.
>>>> +
>>>> +  dtr-invert:
>>>> +    description: Inverts the DTR value in the MCR register.
>>>> +      This should be used on Loongson-3 series CPUs, Loongson-2K
>>>> +      series CPUs, and Loongson LS7A bridge chips.
>>>> +
>>>> +  cts-invert:
>>>> +    description: Inverts the CTS value in the MSR register.
>>>> +      This should be used on Loongson-2K0500, Loongson-2K1000,
>>>> +      and Loongson LS7A bridge chips.
>>>> +
>>>> +  dsr-invert:
>>>> +    description: Inverts the DSR value in the MSR register.
>>>> +      This should be used on Loongson-2K0500, Loongson-2K1000,
>>>> +      and Loongson LS7A bridge chips.
> Same questions for all these. Why choosing invert is a board level
> decision? If it "should be used" then why it is not used always?
>
Because these features are not applicable to all chips, such as 
'fractional-division',

which is currently supported only by 2K1500 and 2K2000, and for 
Loongson-3 series

CPUs,  'cts-invert' and 'dtr-invert' are not needed. More importantly, 
for future chip

designs, these issues may no longer exist.

>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>> +  - interrupts
>>>> +  - clocks
>>>> +
>>>> +allOf:
>>>> +  - $ref: serial.yaml
>>>> +
>>>> +unevaluatedProperties: false
>>>> +
>>>> +examples:
>>>> +  - |
>>>> +    #include <dt-bindings/interrupt-controller/irq.h>
>>>> +    #include <dt-bindings/clock/loongson,ls2k-clk.h>
>>>> +
>>>> +    serial@1fe001e0 {
>>>> +        compatible = "loongson,ls7a-uart";
>>>> +        reg = <0x0 0x1fe001e0 0x0 0x10>;
>>>> +        clock-frequency = <100000000>;
>>>> +        interrupt-parent = <&liointc>;
>>>> +        interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
>>>> +        fractional-division;
>>>> +        rts-invert;
>>>> +        dtr-invert;
>>>> +    };
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index 8766f3e5e87e..a6306327dba5 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -13189,6 +13189,13 @@ S:	Maintained
>>>>    F:	Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml
>>>>    F:	drivers/i2c/busses/i2c-ls2x.c
>>>>    
>>>> +LOONGSON UART DRIVER
>>>> +M:	Haowei Zheng<zhenghaowei@loongson.cn>
>>>> +L:	linux-serial@vger.kernel.org
>>>> +S:	Maintained
>>>> +F:	Documentation/devicetree/bindings/serial/loongson,ls7a-uart.yaml
>>>> +F:	drivers/tty/serial/8250/8250_loongson.c
>>> There is no such file.
>>>
>>> Best regards,
>>> Krzysztof
>> The file "drivers/tty/serial/8250/8250_loongson.c" will be created in
>> the patch
>>
>> "tty: serial: 8250: Add loongson uart driver support". Is it
>> inappropriate to reference it here?
> Apply this patch and run get_maintainers self tests. What do you see?
>
> Of course it is not appropriate here. The file does not exist.
>
> Best regards,
> Krzysztof

I got it, I  will include it in the next patch.


Best regards,

Haowei Zheng

