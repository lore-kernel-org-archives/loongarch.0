Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71D3B14265
	for <loongarch@lists.linux.dev>; Mon, 13 May 2024 06:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715582326; cv=none; b=SjujRpDpQU7zg/4h7mq+WlA5wdMI/IbCCylRkGscqS+P4Zrq5k3mcgY3miaHecTJ2j0j5u3vLbH/MdWPdJ+Mi5pPFfaqxTg0b319DzzNG5fLIHohfp7CxfGjS/UrgQZyy99yKHtXPRGf+L5FX4XPO2fg4yYDgwrpPK/dGwVB67I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715582326; c=relaxed/simple;
	bh=TOKtOi8SMh5KrsAoqKzTKP4dRMSjSWxiBPerZzBEDYQ=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=XwAb/wdafSIia2Ct8H/3RyFkbsYRhsp6y2mdGZaedELmaXx+2VRnglXBzbiq0/oAbaNlYcxmvYnD1DRUO1PzR7tUtkeRgoJw5TpnyhVBDPbFL2YXaPVAK2SXdK7UfzsZSN8OTqyWOsKZS9zlcenuKQFvR9cMcEbhTrdrkFse70Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.24])
	by gateway (Coremail) with SMTP id _____8Dxd_BvtUFmkBIMAA--.30044S3;
	Mon, 13 May 2024 14:38:40 +0800 (CST)
Received: from [10.20.42.24] (unknown [10.20.42.24])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cx4VVstUFmqqIcAA--.34663S3;
	Mon, 13 May 2024 14:38:39 +0800 (CST)
Subject: Re: [PATCH 1/2] docs: Add advanced extended IRQ model description
To: Dongliang Mu <mudongliangabcd@gmail.com>
Cc: chenhuacai@kernel.org, kernel@xen0n.name, corbet@lwn.net,
 alexs@kernel.org, siyanteng@loongson.cn, loongarch@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240507122228.5288-1-zhangtianyang@loongson.cn>
 <CAD-N9QV82w1_7ksGAWJDNVcRDyKHLgiEbx13b3sr4cTazobW5g@mail.gmail.com>
From: Tianyang Zhang <zhangtianyang@loongson.cn>
Message-ID: <5648b40a-51fa-612d-d102-e2948866174f@loongson.cn>
Date: Mon, 13 May 2024 14:38:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAD-N9QV82w1_7ksGAWJDNVcRDyKHLgiEbx13b3sr4cTazobW5g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:AQAAf8Cx4VVstUFmqqIcAA--.34663S3
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxXw15Aw4UAr1UXryrAr1fGrX_yoW7JFy7pr
	9xGF9avF48G345Wr17Jr48Wr13Jw1fK3WDtF1xKry8Xr1qyr1DJr1Utr1kXFW7G348Ar1j
	qFW5Kw1DAw1UA3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUP2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r12
	6r1DMcIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
	1lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxG
	rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8nmRUUUUU
	U==


在 2024/5/9 上午10:24, Dongliang Mu 写道:
> On Tue, May 7, 2024 at 8:24 PM Tianyang Zhang <zhangtianyang@loongson.cn> wrote:
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
>> +
>> +In this model, IPI (Inter-Processor Interrupt) and CPU Local Timer interrupt go
>> +to CPUINTC directly, CPU UARTS interrupts go to LIOINTC, MSI interrupts go to AVEC,
>> +and then go to CPUINTC, Other devices interrupts go to PCH-PIC/PCH-LPC and gathered
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
>> diff --git a/Documentation/translations/zh_CN/arch/loongarch/irq-chip-model.rst b/Documentation/translations/zh_CN/arch/loongarch/irq-chip-model.rst
>> index f1e9ab18206c..7ccde82dd666 100644
>> --- a/Documentation/translations/zh_CN/arch/loongarch/irq-chip-model.rst
>> +++ b/Documentation/translations/zh_CN/arch/loongarch/irq-chip-model.rst
>> @@ -9,9 +9,8 @@
>>   LoongArch的IRQ芯片模型（层级关系）
>>   ==================================
>>
>> -目前，基于LoongArch的处理器（如龙芯3A5000）只能与LS7A芯片组配合工作。LoongArch计算机
>> -中的中断控制器（即IRQ芯片）包括CPUINTC（CPU Core Interrupt Controller）、LIOINTC（
>> -Legacy I/O Interrupt Controller）、EIOINTC（Extended I/O Interrupt Controller）、
>> +LoongArch计算机中的中断控制器（即IRQ芯片）包括CPUINTC（CPU Core Interrupt Controller）、
>> +LIOINTC（Legacy I/O Interrupt Controller）、EIOINTC（Extended I/O Interrupt Controller）、
>>   HTVECINTC（Hyper-Transport Vector Interrupt Controller）、PCH-PIC（LS7A芯片组的主中
>>   断控制器）、PCH-LPC（LS7A芯片组的LPC中断控制器）和PCH-MSI（MSI中断控制器）。
>>
>> @@ -87,6 +86,38 @@ PCH-LPC/PCH-MSI，然后被EIOINTC统一收集，再直接到达CPUINTC::
>>       | Devices |
>>       +---------+
>>
>> +高级扩展IRQ模型
>> +=======================
>> +
>> +在这种模型里面，IPI（Inter-Processor Interrupt）和CPU本地时钟中断直接发送到CPUINTC，
>> +CPU串口（UARTs）中断发送到LIOINTC，MSI中断发送到AVEC,而后通过AVEC送达CPUINTC，而
> AVEC is followed by an English comma (Translation: AVEC 后面一个英文逗号)
> Dongliang Mu
Ok, I will follow the advice
>> +其他所有设备的中断则分别发送到所连接的PCH-PIC/PCH-LPC，然后由EIOINTC统一收集，再直
>> +接到达CPUINTC::
>> +
>> + +-----+     +--------------------------+     +-------+
>> + | IPI | --> |           CPUINTC        | <-- | Timer |
>> + +-----+     +--------------------------+     +-------+
>> +              ^        ^             ^
>> +              |        |             |
>> +      +--------+  +---------+ +---------+     +-------+
>> +      | AVEC   |  | EIOINTC | | LIOINTC | <-- | UARTs |
>> +      +--------+  +---------+ +---------+     +-------+
>> +              ^        ^
>> +              |        |
>> +      +---------+  +-------------+
>> +      |   MSI   |  |   PCH-PIC   |
>> +      +---------+  +-------------+
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
>>   ACPI相关的定义
>>   ==============
>>
>> --
>> 2.20.1
>>
>>

