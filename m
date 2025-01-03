Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E350622F19
	for <loongarch@lists.linux.dev>; Fri,  3 Jan 2025 01:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735866670; cv=none; b=No774+APZi6UX5uSbRAW63xsqHvgRDZCOLOdhO6D5tBuOCiqZIOQuyjV6CPc3lFHUaKt6Mdvfi5bbeQrTpi/vJVVKNKu+OG9eS2mDqYeprgp7GnZHRhVXqOiHsp1tBh+6cOmEXfezV39NEvDZzpQx4EuCAbhPRy4b9XvjFXaZ/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735866670; c=relaxed/simple;
	bh=GYuUvnVbU/+wEqfe7u10lOwnnROhVDqOuZdKfHV8k7Q=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=Xq36LGS6+4VIVEp1awZ9AZQqUb/mdX3Yfk8PKIzMSp4c723sgFzwzswpMEup25QD12QxF9cTzVpTRT8oFz2+F2O7Hqzapm1lDcLAITZlHjDGp2X+2AfrEUcN24NTf0JKQ6WiQfM95OPMwsbvHQH7p1jEq0tIfQsXk2zxU/8dAGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.24])
	by gateway (Coremail) with SMTP id _____8CxTOIgOXdn0W1dAA--.51705S3;
	Fri, 03 Jan 2025 09:10:56 +0800 (CST)
Received: from [10.20.42.24] (unknown [10.20.42.24])
	by front1 (Coremail) with SMTP id qMiowMBxXccdOXdnkfcRAA--.18171S3;
	Fri, 03 Jan 2025 09:10:56 +0800 (CST)
Subject: Re: [PATCH V2] irqchip/loongarch-avec:Add multi-nodes topology
 support
To: Huacai Chen <chenhuacai@kernel.org>
Cc: kernel@xen0n.name, tglx@linutronix.de, loongarch@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241230021503.14012-1-zhangtianyang@loongson.cn>
 <CAAhV-H56tOfi1oqnwh1O94Z3sAS7sAbeKQ_U_O6AD98YVq6F=w@mail.gmail.com>
From: Tianyang Zhang <zhangtianyang@loongson.cn>
Message-ID: <367e4c5e-eeea-f0ba-0a63-d7d92aa35d7b@loongson.cn>
Date: Fri, 3 Jan 2025 09:10:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H56tOfi1oqnwh1O94Z3sAS7sAbeKQ_U_O6AD98YVq6F=w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowMBxXccdOXdnkfcRAA--.18171S3
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxWr1fXw17Zw1DJryfJr47GFX_yoW5Gw4fpa
	98Xayjyr4UKa4xWrZIq34DXryayF4xKrZrta4xG3WfXrWDCr9rWFy8Xr909Fyku3yku3W0
	vr48JF47u3W5ZacCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1EksDUU
	UUU==


在 2024/12/31 下午3:56, Huacai Chen 写道:
> Hi, Tianyang,
>
> On Mon, Dec 30, 2024 at 10:15 AM Tianyang Zhang
> <zhangtianyang@loongson.cn> wrote:
>> avecintc_init() enables the Advanced Interrupt Controller (AVEC) of
>> the boot CPU node, but nothing enables the AVEC on secondary nodes.
>>
>> Move the enablement to the CPU hotplug callback so that secondary
>> nodes get the AVEC enabled too. In theory enabling it once per node
>> would be sufficient, but redundant enabling does no hard, so keep the
>> code simple and do it unconditionally.
>>
>> Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
>> ---
>>   drivers/irqchip/irq-loongarch-avec.c | 17 +++++++++++++----
>>   1 file changed, 13 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/irqchip/irq-loongarch-avec.c b/drivers/irqchip/irq-loongarch-avec.c
>> index 0f6e465dd309..988d3e02ac54 100644
>> --- a/drivers/irqchip/irq-loongarch-avec.c
>> +++ b/drivers/irqchip/irq-loongarch-avec.c
>> @@ -56,6 +56,15 @@ struct avecintc_data {
>>          unsigned int            moving;
>>   };
>>
>> +static inline void avecintc_enable(void)
>> +{
>> +       u64 value;
>> +
>> +       value = iocsr_read64(LOONGARCH_IOCSR_MISC_FUNC);
>> +       value |= IOCSR_MISC_FUNC_AVEC_EN;
>> +       iocsr_write64(value, LOONGARCH_IOCSR_MISC_FUNC);
>> +}
>> +
>>   static inline void avecintc_ack_irq(struct irq_data *d)
>>   {
>>   }
>> @@ -127,6 +136,8 @@ static int avecintc_cpu_online(unsigned int cpu)
>>
>>          guard(raw_spinlock)(&loongarch_avec.lock);
>>
>> +       avecintc_enable();
>> +
>>          irq_matrix_online(loongarch_avec.vector_matrix);
>>
>>          pending_list_init(cpu);
>> @@ -339,7 +350,6 @@ static int __init irq_matrix_init(void)
>>   static int __init avecintc_init(struct irq_domain *parent)
>>   {
>>          int ret, parent_irq;
>> -       unsigned long value;
>>
>>          raw_spin_lock_init(&loongarch_avec.lock);
>>
>> @@ -378,14 +388,13 @@ static int __init avecintc_init(struct irq_domain *parent)
>>                                    "irqchip/loongarch/avecintc:starting",
>>                                    avecintc_cpu_online, avecintc_cpu_offline);
>>   #endif
>> -       value = iocsr_read64(LOONGARCH_IOCSR_MISC_FUNC);
>> -       value |= IOCSR_MISC_FUNC_AVEC_EN;
>> -       iocsr_write64(value, LOONGARCH_IOCSR_MISC_FUNC);
>> +       avecintc_enable();
>>
>>          return ret;
>>
>>   out_remove_domain:
>>          irq_domain_remove(loongarch_avec.domain);
>> +       loongarch_avec.domain = NULL;
> This is unnecessary, since no one checks it, and there is no memory
> leak even if without it.
>
> Huacai
Ok. I got it, thanks
>
>>   out_free_handle:
>>          irq_domain_free_fwnode(loongarch_avec.fwnode);
>>   out:
>> --
>> 2.20.1
>>

