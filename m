Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CE1B3C089
	for <loongarch@lists.linux.dev>; Tue, 21 Nov 2023 09:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from loongson.cn (unknown [112.20.112.120])
	by gateway (Coremail) with SMTP id _____8BxuOiRflxlG4Q7AA--.16244S3;
	Tue, 21 Nov 2023 17:55:29 +0800 (CST)
Received: from [192.168.100.8] (unknown [112.20.112.120])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxS9yNflxlJkxIAA--.27100S3;
	Tue, 21 Nov 2023 17:55:27 +0800 (CST)
Message-ID: <df17d5e9-2c61-47e3-ba04-64b7110a7ba6@loongson.cn>
Date: Tue, 21 Nov 2023 17:55:24 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/9] net: stmmac: Add Loongson DWGMAC definitions
To: Andrew Lunn <andrew@lunn.ch>
Cc: hkallweit1@gmail.com, peppe.cavallaro@st.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, fancer.lancer@gmail.com,
 Jose.Abreu@synopsys.com, chenhuacai@loongson.cn, linux@armlinux.org.uk,
 dongbiao@loongson.cn, guyinggang@loongson.cn, netdev@vger.kernel.org,
 loongarch@lists.linux.dev, chris.chenfeiyang@gmail.com
References: <cover.1699533745.git.siyanteng@loongson.cn>
 <87011adcd39f20250edc09ee5d31bda01ded98b5.1699533745.git.siyanteng@loongson.cn>
 <2e1197f9-22f6-4189-8c16-f9bff897d567@lunn.ch>
Content-Language: en-US
From: Yanteng Si <siyanteng@loongson.cn>
In-Reply-To: <2e1197f9-22f6-4189-8c16-f9bff897d567@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxS9yNflxlJkxIAA--.27100S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoWxArykur1DWr13tF17AF1xXrc_yoW5uFyUp3
	yUZa98Gr1ktr4fJw4xGan0vFyrX3y5tFyUC3WrWry3uay3u34a9rWjqFWjvF9xGa1kWa4f
	tr40k3WDCF90qacCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07URa0PUUUUU=

Hi Andrew,

在 2023/11/12 04:07, Andrew Lunn 写道:
>> +#ifdef	CONFIG_DWMAC_LOONGSON
>> +#define DMA_INTR_ABNORMAL	(DMA_INTR_ENA_AIE_LOONGSON | DMA_INTR_ENA_AIE | \
>> +				DMA_INTR_ENA_FBE | DMA_INTR_ENA_UNE)
>> +#else
>>   #define DMA_INTR_ABNORMAL	(DMA_INTR_ENA_AIE | DMA_INTR_ENA_FBE | \
>>   				DMA_INTR_ENA_UNE)
>> +#endif
> The aim is to produce one kernel which runs on all possible
> variants. So we don't like to see this sort of #ifdef. Please try to
> remove them.

We now run into a tricky problem: we only have a few register 
definitions(DMA_XXX_LOONGSON)

that are not the same as the dwmac1000 register definition.


In this case, if we use these "#ifdef", it will reuse most of the 
dwmac1000 code to

reduce maintenance stress, at the cost of sacrificing a little 
readability; If we created

a new xxx_dma.h, it would add a new set of code similar to dwmac1000, 
which is exactly

what the v4 patch did, which was great for readability, but it also made 
the code more

maintenance stress, and we got reviews complaining in v4. That is, we 
need to find a

balance between readability and maintainability.


however， we haven't yet come up with a way to do both, so it would be 
great if you

could give us some advice on this.


v4:<https://lore.kernel.org/loongarch/cover.1692696115.git.chenfeiyang@loongson.cn/>

>
>> @@ -167,7 +167,7 @@ int dwmac_dma_interrupt(struct stmmac_priv *priv, void __iomem *ioaddr,
>>   	struct stmmac_txq_stats *txq_stats = &priv->xstats.txq_stats[chan];
>>   	int ret = 0;
>>   	/* read the status register (CSR5) */
>> -	u32 intr_status = readl(ioaddr + DMA_STATUS);
>> +	u32 intr_status = readl(ioaddr + DMA_CHAN_STATUS(chan));
>>   
> Please break this patch up. Changes like the above are simple to
> understand. So have one patch which just adds these macros and makes
> use of them.
OK!
>
>>   #ifdef DWMAC_DMA_DEBUG
>>   	/* Enable it to monitor DMA rx/tx status in case of critical problems */
>> @@ -182,7 +182,7 @@ int dwmac_dma_interrupt(struct stmmac_priv *priv, void __iomem *ioaddr,
>>   		intr_status &= DMA_STATUS_MSK_TX;
>>   
>>   	/* ABNORMAL interrupts */
>> -	if (unlikely(intr_status & DMA_STATUS_AIS)) {
>> +	if (unlikely(intr_status & DMA_ABNOR_INTR_STATUS)) {
> However, this is not obviously correct. You need to explain in the
> commit message why this change is needed.
>
> Lots of small patches make the understanding easier.

Because Loongson has two AIS, so:


#ifdef    CONFIG_DWMAC_LOONGSON
...
#define DMA_ABNOR_INTR_STATUS        (DMA_STATUS_TX_AIS_LOONGSON | 
DMA_STATUS_RX_AIS_LOONGSON)
...
#else
...
#define DMA_ABNOR_INTR_STATUS        DMA_STATUS_AIS
...
#endif

>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> index 7371713c116d..aafc75fa14a0 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> @@ -7062,6 +7062,7 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
>>   	/* dwmac-sun8i only work in chain mode */
>>   	if (priv->plat->flags & STMMAC_FLAG_HAS_SUN8I)
>>   		chain_mode = 1;
>> +
>>   	priv->chain_mode = chain_mode;
> Please avoid white space changes.

OK!


Thanks for your review!


Thanks,

Yanteng

>
>         Andrew

