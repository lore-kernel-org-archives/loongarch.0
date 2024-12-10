Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68545382
	for <loongarch@lists.linux.dev>; Tue, 10 Dec 2024 01:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733794106; cv=none; b=cGf6c/EgO6Nt3nV8uDY0znqo2Mr5H3D7eQZO/zTQcU3BqHc1dQhKbQABXI1QpTZwkX67gpaR+rX5NOnjpcO5Y0mGx5h2VaY8BaDyjfPBubjdHf59tSysshn3aTgqexqDJTSEIgb4ivlDCBDDeLOkcJRYXmsba3P4mMCo3IbZ6ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733794106; c=relaxed/simple;
	bh=OPKnQ4yQl6LR6oOeamgI087F9tEA7PLQBdB9WGOpfSE=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=CwerjdcRLe+ocSTJqjOt2YKg7UnUBYUD9jkkDiGwCWOV7hpKcwIujRy/yu05QPIP4kIQ6t9ePnkxLuZgKpBFZ6GU7nixQHZIPp1C471Z70V9aEj5IKc6t160Ocq0KdZ7mxmxCD4yKHSWbu/XjkgDP4PpvLVhG0uMmeXjkE0YJBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.24])
	by gateway (Coremail) with SMTP id _____8CxieAzmVdntJtUAA--.32790S3;
	Tue, 10 Dec 2024 09:28:19 +0800 (CST)
Received: from [10.20.42.24] (unknown [10.20.42.24])
	by front1 (Coremail) with SMTP id qMiowMAxDEcymVdnvY59AA--.6452S3;
	Tue, 10 Dec 2024 09:28:18 +0800 (CST)
Subject: Re: [PATCH] irqchip/loongarch-avec:Add multi-nodes topology support
To: Huacai Chen <chenhuacai@kernel.org>
Cc: kernel@xen0n.name, tglx@linutronix.de, loongarch@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241207033146.20938-1-zhangtianyang@loongson.cn>
 <CAAhV-H4VAyD+=Btt9S6HrN6-sVQJqe1_jeLPS13UR1kxXJ8S5w@mail.gmail.com>
From: Tianyang Zhang <zhangtianyang@loongson.cn>
Message-ID: <697baf2d-3381-3511-c7f5-971532788eb8@loongson.cn>
Date: Tue, 10 Dec 2024 09:28:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H4VAyD+=Btt9S6HrN6-sVQJqe1_jeLPS13UR1kxXJ8S5w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowMAxDEcymVdnvY59AA--.6452S3
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxGrW7uw15Kw43Jr4xAFyrAFc_yoW5ZrW5pa
	98Jay5Ar4Uta4fWr9xt3yDZFyaqr4fKrZrta4xC3WxWrZ8CF1DWFy0gry5ZF18uws7u3W0
	vF48JFy7u3W5AFgCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Fb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AK
	xVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
	AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI
	42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMI
	IF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2
	KfnxnUUI43ZEXa7IU8wNVDUUUUU==

Hi, Huacai

在 2024/12/7 下午5:11, Huacai Chen 写道:
> Hi, Tianyang,
>
> On Sat, Dec 7, 2024 at 11:31 AM Tianyang Zhang
> <zhangtianyang@loongson.cn> wrote:
>> This patch enables the advanced interrupt controller function under
>> multiple-node of 3C600. The topology of the advanced interrupt controller
>> is consistent with NUMA node. We check the enable status of the node where
>> each CPU is located once when it goes online, which may cause some
>> additional operations, but it can ensure that the advanced interrupt
>> controller can still be used in situations where some CPUs cannot start
> The whole can be reworded:
>
> Currently we only enable one chip's advanced interrupt controller
> (AVEC) in hardware, so multi-chip machines with Loongson-3C6000 don't
> work. This patch enables it for every chip (In theory every chip needs
> to be enabled only once, but for simplicity we enable it on every core
> in the CPU online hooks).
Ok, I got it, thanks
>
>> Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
>> ---
>>   drivers/irqchip/irq-loongarch-avec.c | 20 ++++++++++++++++----
>>   1 file changed, 16 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/irqchip/irq-loongarch-avec.c b/drivers/irqchip/irq-loongarch-avec.c
>> index 0f6e465dd309..9e30198fa7e4 100644
>> --- a/drivers/irqchip/irq-loongarch-avec.c
>> +++ b/drivers/irqchip/irq-loongarch-avec.c
>> @@ -56,6 +56,18 @@ struct avecintc_data {
>>          unsigned int            moving;
>>   };
>>
>> +static inline void avecintc_enable(void)
>> +{
>> +       u64 value;
>> +
>> +       if (!loongarch_avec.domain)
>> +               return;
> Is there any reason to check this? If domain is NULL, avecintc_init()
> fails, there is no chance to execute this function.
>
> Huacai
Yes, you are right , it's redundancy, thanks
>
>> +
>> +       value = iocsr_read64(LOONGARCH_IOCSR_MISC_FUNC);
>> +       value |= IOCSR_MISC_FUNC_AVEC_EN;
>> +       iocsr_write64(value, LOONGARCH_IOCSR_MISC_FUNC);
>> +}
>> +
>>   static inline void avecintc_ack_irq(struct irq_data *d)
>>   {
>>   }
>> @@ -127,6 +139,8 @@ static int avecintc_cpu_online(unsigned int cpu)
>>
>>          guard(raw_spinlock)(&loongarch_avec.lock);
>>
>> +       avecintc_enable();
>> +
>>          irq_matrix_online(loongarch_avec.vector_matrix);
>>
>>          pending_list_init(cpu);
>> @@ -339,7 +353,6 @@ static int __init irq_matrix_init(void)
>>   static int __init avecintc_init(struct irq_domain *parent)
>>   {
>>          int ret, parent_irq;
>> -       unsigned long value;
>>
>>          raw_spin_lock_init(&loongarch_avec.lock);
>>
>> @@ -378,14 +391,13 @@ static int __init avecintc_init(struct irq_domain *parent)
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
>>   out_free_handle:
>>          irq_domain_free_fwnode(loongarch_avec.fwnode);
>>   out:
>> --
>> 2.20.1
>>

