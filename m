Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A52C1115
	for <loongarch@lists.linux.dev>; Mon, 22 May 2023 09:00:20 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.176])
	by gateway (Coremail) with SMTP id _____8DxyOkjL2tkjt8KAA--.18862S3;
	Mon, 22 May 2023 17:00:19 +0800 (CST)
Received: from [10.20.42.176] (unknown [10.20.42.176])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxFLUhL2tk89xuAA--.55826S3;
	Mon, 22 May 2023 17:00:17 +0800 (CST)
Subject: Re: [PATCH V1 4/4] irqchip/loongson-liointc: Add
 IRQCHIP_SKIP_SET_WAKE flag
To: loongson-kernel@lists.loongnix.cn
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@loongson.cn>,
 Yinbo Zhu <zhuyinbo@loongson.cn>
References: <20230520063818.27208-1-lvjianmin@loongson.cn>
 <20230520063818.27208-5-lvjianmin@loongson.cn>
 <CAAhV-H6BBCXpF2uOehwz1gsMdb6vcjHsCYsp+soL+Tzy-bfxQg@mail.gmail.com>
From: Jianmin Lv <lvjianmin@loongson.cn>
Message-ID: <853bc63c-24ec-a004-ea29-1c58f45ca996@loongson.cn>
Date: Mon, 22 May 2023 17:00:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H6BBCXpF2uOehwz1gsMdb6vcjHsCYsp+soL+Tzy-bfxQg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxFLUhL2tk89xuAA--.55826S3
X-CM-SenderInfo: 5oymxthqpl0qxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7KrW8Zr1rAr15ArW7KF43trb_yoW8AF1Dpr
	43A3WqkF4UJryUZanxKr4UJ3WUZan5XrZ7tay5KFyI9FyDGw1DJF1kZF13ur4fAw45GF12
	9F4rGry8WF45CrUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bfkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2kK
	e7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280
	aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2
	xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xF
	xVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWw
	C2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Xr0_
	Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJV
	WUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIY
	CTnIWIevJa73UjIFyTuYvjxU4AhLUUUUU



On 2023/5/20 下午4:43, Huacai Chen wrote:
> Hi, Jianmin,
> 
> On Sat, May 20, 2023 at 2:38 PM Jianmin Lv <lvjianmin@loongson.cn> wrote:
>>
>> From: Yinbo Zhu <zhuyinbo@loongson.cn>
>>
>> Liointc doesn't require specific logic to work with wakeup IRQs,
>> and no irq_set_wake callback is needed. To allow registered IRQs
>> from liointc to be used as a wakeup-source, and ensure irq_set_irq_wake()
>> works well, the flag IRQCHIP_SKIP_SET_WAKE should be added.
> Maybe using LIOINTC instead of Liointc/liointc is better in commit
> message. Except this small issue, for the whole series,
> Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
> 
Ok, I'll change it, thanks.

>>
>> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
>> Signed-off-by: Jianmin Lv <lvjianmin@loongson.cn>
>> ---
>>   drivers/irqchip/irq-loongson-liointc.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/irqchip/irq-loongson-liointc.c b/drivers/irqchip/irq-loongson-liointc.c
>> index 9a9c2bf048a3..dbd1ccce0fb2 100644
>> --- a/drivers/irqchip/irq-loongson-liointc.c
>> +++ b/drivers/irqchip/irq-loongson-liointc.c
>> @@ -291,6 +291,7 @@ static int liointc_init(phys_addr_t addr, unsigned long size, int revision,
>>          ct->chip.irq_mask = irq_gc_mask_disable_reg;
>>          ct->chip.irq_mask_ack = irq_gc_mask_disable_reg;
>>          ct->chip.irq_set_type = liointc_set_type;
>> +       ct->chip.flags = IRQCHIP_SKIP_SET_WAKE;
>>
>>          gc->mask_cache = 0;
>>          priv->gc = gc;
>> --
>> 2.31.1
>>
>>
> _______________________________________________
> Loongson-kernel mailing list -- loongson-kernel@lists.loongnix.cn
> To unsubscribe send an email to loongson-kernel-leave@lists.loongnix.cn
> 

