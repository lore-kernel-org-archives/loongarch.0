Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4999E626CB
	for <loongarch@lists.linux.dev>; Mon, 13 May 2024 06:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715582428; cv=none; b=QHlE3wM0c3ah/nRORcxV2ROq+ut0+nkTO/CeihGMLht9cwC4bqb0R3Npsh6eRFRZs4aSBV+GjCnbGJR2G4ZzIBkXshYD2fefXG399gUPlT+auweIFyNviR7LplY9PoqMphGDvJjAj646QjwkYWVjS93z1iy21AGuEIQwTYi+UUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715582428; c=relaxed/simple;
	bh=s3KEVO2WVfNjujMY5GX/FpbgTHgOuPOWDdwQwaLheY0=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=H8ULXHvqITEKjwqhYnYcXZUpZvm7ZmzyDmT+oJ7UoUxST/g0Pe5iFgPuEUmS8nTF9KkBqioKjtwhmdcGb39F17bCX4A3W+c5IDZXC7m/yfkMva1pPbWvVUtENjmegUtEvr1cko7UWGDbeLahssj2JDskDlUq47kP3nXusTVHdOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.24])
	by gateway (Coremail) with SMTP id _____8Ax5erYtUFmxxIMAA--.18021S3;
	Mon, 13 May 2024 14:40:24 +0800 (CST)
Received: from [10.20.42.24] (unknown [10.20.42.24])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxlFbXtUFmMqMcAA--.35005S3;
	Mon, 13 May 2024 14:40:24 +0800 (CST)
Subject: Re: [PATCH 1/2] docs: Add advanced extended IRQ model description
To: Randy Dunlap <rdunlap@infradead.org>, chenhuacai@kernel.org,
 kernel@xen0n.name, corbet@lwn.net, alexs@kernel.org, siyanteng@loongson.cn
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240507122228.5288-1-zhangtianyang@loongson.cn>
 <c1f1b699-71ad-409a-a843-afe42640626a@infradead.org>
From: Tianyang Zhang <zhangtianyang@loongson.cn>
Message-ID: <a72f2d5b-ed6d-1b47-ac99-5c99f9cf257b@loongson.cn>
Date: Mon, 13 May 2024 14:40:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <c1f1b699-71ad-409a-a843-afe42640626a@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:AQAAf8BxlFbXtUFmMqMcAA--.35005S3
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Kw13GrWxury7JF43tw18Zwc_yoW8try3pr
	Z3GF9avFs7t343WF13Jr1UXr13Jw1fJanrKF1xKry8Xw1qvr1Dtr1UXrykXFWUG340yr1j
	qFW5G34DCw1UA3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Ib4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
	AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E
	14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4
	CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4U
	MIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF
	4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnI
	WIevJa73UjIFyTuYvjxUwMKuUUUUU


在 2024/5/9 上午6:29, Randy Dunlap 写道:
> Hi--
>
> On 5/7/24 5:22 AM, Tianyang Zhang wrote:
>>  From 3C6000, Loongarch began to support advanced extended
>> interrupt mode, in which each CPU has an independent interrupt
>> vector number.This will enhance the architecture's ability
>> to support modern devices
>>
>> Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
>> ---
>>   .../arch/loongarch/irq-chip-model.rst         | 33 +++++++++++++++++
>>   .../zh_CN/arch/loongarch/irq-chip-model.rst   | 37 +++++++++++++++++--
>>   2 files changed, 67 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/arch/loongarch/irq-chip-model.rst b/Documentation/arch/loongarch/irq-chip-model.rst
>> index 7988f4192363..79228741d1b9 100644
>> --- a/Documentation/arch/loongarch/irq-chip-model.rst
>> +++ b/Documentation/arch/loongarch/irq-chip-model.rst
>> @@ -85,6 +85,39 @@ to CPUINTC directly::
>>       | Devices |
>>       +---------+
>>   
>> +Advanced Extended IRQ model
>> +=======================
> The === underline line needs to be at least as long as the line above it.
I will repair this problem
>> +
>> +In this model, IPI (Inter-Processor Interrupt) and CPU Local Timer interrupt go
>> +to CPUINTC directly, CPU UARTS interrupts go to LIOINTC, MSI interrupts go to AVEC,
>> +and then go to CPUINTC, Other devices interrupts go to PCH-PIC/PCH-LPC and gathered
>                    CPUINTC.
Thank you for the reminder
>> +by EIOINTC, and then go to CPUINTC directly::
>> +
>> + +-----+     +--------------------------+     +-------+
>> + | IPI | --> |           CPUINTC        | <-- | Timer |
>> + +-----+     +--------------------------+     +-------+
>> +              ^        ^             ^
>> +              |        |             |
>> +      +--------+  +---------+ +---------+     +-------+
>> +      | AVEC   |  | EIOINTC | | LIOINTC | <-- | UARTs |
>> +      +--------+  +---------+ +---------+     +-------+
>> +           ^            ^
>> +           |            |
>> +         +---------+  +---------+
>> +         |   MSI   |  | PCH-PIC |
>> +         +---------+  +---------+
>> +            ^          ^       ^
>> +            |          |       |
>> +    +---------+ +---------+ +---------+
>> +    | Devices | | PCH-LPC | | Devices |
>> +    +---------+ +---------+ +---------+
>> +                     ^
>> +                     |
>> +                +---------+
>> +                | Devices |
>> +                +---------+
>> +
>> +
>>   ACPI-related definitions
>>   ========================
>>   
> thanks.



