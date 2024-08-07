Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 765421C8FD1
	for <loongarch@lists.linux.dev>; Wed,  7 Aug 2024 08:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723019030; cv=none; b=eA7ASanQfgyGWoqjmhUcj1O0C5aKR/pfRFd95z+wHjQSwgJ/sQ+dPYAvCY24pX1AmyAgvqj2sH8CmZV+dW+lgQoWrPhpBQEC6jUljZSgaRfkqcQ3b7+S+pG1M+bA5puyO4JD1M3EyXWjNwEYzumzqXbroCsLjHdcBhUf31Z8nF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723019030; c=relaxed/simple;
	bh=ZQYMwzixvYDiYSkoVYrM7PzXcdK9+z4VeEcg+7dgiw8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=YrDKcXIC3kPt48ORM/3ShMLjSYBicO8Wn1nmo0bXyGQCGI8F1YN4p1u3yCsMgAmn24YQ4QRwlNm0zKh6/ORPMkw/stwkNODKpRvkdyRdr5o+iXUqALSeCNudZ0JF3xWdy3vixKrCBBMgQn1b88gWjJ0A2gOUGN20NThxr3bHDho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.4.132])
	by gateway (Coremail) with SMTP id _____8BxrOoSL7Nm1iYKAA--.32165S3;
	Wed, 07 Aug 2024 16:23:46 +0800 (CST)
Received: from [10.20.4.132] (unknown [10.20.4.132])
	by front1 (Coremail) with SMTP id qMiowMAx3eMSL7NmNbUHAA--.11002S2;
	Wed, 07 Aug 2024 16:23:46 +0800 (CST)
Message-ID: <f31609c4-1e47-49bc-9231-5b0353d35dc9@loongson.cn>
Date: Wed, 7 Aug 2024 16:23:46 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
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
Content-Language: en-US
In-Reply-To: <4d1f2426-b43c-4727-8387-f18edf937163@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMAx3eMSL7NmNbUHAA--.11002S2
X-CM-SenderInfo: x2kh0w5kdr4v3l6o00pqjv00gofq/1tbiAQECBGayEXMQKQAAsJ
X-Coremail-Antispam: 1Uk129KBj93XoWxGF1UAw1xGryrArW7WFW8Zrc_yoW5ZF4kpa
	15CanFyr4qqr1xuws7ta4fAFn3Z393JFnrur4Dt34UKa909w1Sqr1ak3WY9397WryUZrW2
	q3Wjk3y7ua15ZrXCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JV
	WxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcHUq
	UUUUU


在 2024/8/4 16:43, Krzysztof Kozlowski 写道:
> On 04/08/2024 08:38,zhenghaowei@loongson.cn wrote:
>
> Due to lack of changelog, I assume you send the same patch, so:
>
> <form letter>
> This is a friendly reminder during the review process.
>
> It seems my or other reviewer's previous comments were not fully
> addressed. Maybe the feedback got lost between the quotes, maybe you
> just forgot to apply it. Please go back to the previous discussion and
> either implement all requested changes or keep discussing them.
>
> Thank you.
> </form letter>
>
> Also:
>
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  fractional-division:
> Where are this and following defined? In which schema?
>
These and the ones below are new definitions, can I use them like this?

+  fractional-division:
+    description: Enables fractional-N division. Currently,
+      only LS2K1500 and LS2K2000 support this feature.
+    type: boolean

>> +    description: Enables fractional-N division. Currently,
>> +      only LS2K1500 and LS2K2000 support this feature.
>> +
>> +  rts-invert:
>> +    description: Inverts the RTS value in the MCR register.
>> +      This should be used on Loongson-3 series CPUs, Loongson-2K
>> +      series CPUs, and Loongson LS7A bridge chips.
>> +
>> +  dtr-invert:
>> +    description: Inverts the DTR value in the MCR register.
>> +      This should be used on Loongson-3 series CPUs, Loongson-2K
>> +      series CPUs, and Loongson LS7A bridge chips.
>> +
>> +  cts-invert:
>> +    description: Inverts the CTS value in the MSR register.
>> +      This should be used on Loongson-2K0500, Loongson-2K1000,
>> +      and Loongson LS7A bridge chips.
>> +
>> +  dsr-invert:
>> +    description: Inverts the DSR value in the MSR register.
>> +      This should be used on Loongson-2K0500, Loongson-2K1000,
>> +      and Loongson LS7A bridge chips.
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +
>> +allOf:
>> +  - $ref: serial.yaml
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +    #include <dt-bindings/clock/loongson,ls2k-clk.h>
>> +
>> +    serial@1fe001e0 {
>> +        compatible = "loongson,ls7a-uart";
>> +        reg = <0x0 0x1fe001e0 0x0 0x10>;
>> +        clock-frequency = <100000000>;
>> +        interrupt-parent = <&liointc>;
>> +        interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
>> +        fractional-division;
>> +        rts-invert;
>> +        dtr-invert;
>> +    };
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 8766f3e5e87e..a6306327dba5 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -13189,6 +13189,13 @@ S:	Maintained
>>   F:	Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml
>>   F:	drivers/i2c/busses/i2c-ls2x.c
>>   
>> +LOONGSON UART DRIVER
>> +M:	Haowei Zheng<zhenghaowei@loongson.cn>
>> +L:	linux-serial@vger.kernel.org
>> +S:	Maintained
>> +F:	Documentation/devicetree/bindings/serial/loongson,ls7a-uart.yaml
>> +F:	drivers/tty/serial/8250/8250_loongson.c
> There is no such file.
>
> Best regards,
> Krzysztof

The file "drivers/tty/serial/8250/8250_loongson.c" will be created in 
the patch

"tty: serial: 8250: Add loongson uart driver support". Is it 
inappropriate to reference it here?


Best regards,

Haowei Zheng

