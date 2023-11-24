Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D110528695
	for <loongarch@lists.linux.dev>; Fri, 24 Nov 2023 13:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from loongson.cn (unknown [112.20.112.120])
	by gateway (Coremail) with SMTP id _____8AxjuutoWBl95Q8AA--.51748S3;
	Fri, 24 Nov 2023 21:14:21 +0800 (CST)
Received: from [192.168.100.8] (unknown [112.20.112.120])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxE+SroWBlRZ1LAA--.37806S3;
	Fri, 24 Nov 2023 21:14:20 +0800 (CST)
Message-ID: <8d82761e-c978-4763-a765-f6e0b57ec6a6@loongson.cn>
Date: Fri, 24 Nov 2023 21:14:19 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/9] net: stmmac: Add Loongson DWGMAC definitions
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
Cc: hkallweit1@gmail.com, peppe.cavallaro@st.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, fancer.lancer@gmail.com,
 Jose.Abreu@synopsys.com, chenhuacai@loongson.cn, linux@armlinux.org.uk,
 dongbiao@loongson.cn, guyinggang@loongson.cn, netdev@vger.kernel.org,
 loongarch@lists.linux.dev, chris.chenfeiyang@gmail.com
References: <cover.1699533745.git.siyanteng@loongson.cn>
 <87011adcd39f20250edc09ee5d31bda01ded98b5.1699533745.git.siyanteng@loongson.cn>
 <2e1197f9-22f6-4189-8c16-f9bff897d567@lunn.ch>
 <df17d5e9-2c61-47e3-ba04-64b7110a7ba6@loongson.cn>
 <9c2806c7-daaa-4a2d-b69b-245d202d9870@lunn.ch>
From: Yanteng Si <siyanteng@loongson.cn>
In-Reply-To: <9c2806c7-daaa-4a2d-b69b-245d202d9870@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxE+SroWBlRZ1LAA--.37806S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoW7WF45WryrCrW7uw1rGw17Arc_yoW8Ar4fp3
	4UWayUKr48trs5Gw1Iya98Gr95Jr42ya48Ca15Ww1rW345Xw13CF4jkF1xZas8tFW8X3yx
	Ar40ka15ZrZ5Z3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcyxRUUUUU


在 2023/11/22 11:39, Andrew Lunn 写道:
> On Tue, Nov 21, 2023 at 05:55:24PM +0800, Yanteng Si wrote:
>> Hi Andrew,
>>
>> 在 2023/11/12 04:07, Andrew Lunn 写道:
>>>> +#ifdef	CONFIG_DWMAC_LOONGSON
>>>> +#define DMA_INTR_ABNORMAL	(DMA_INTR_ENA_AIE_LOONGSON | DMA_INTR_ENA_AIE | \
>>>> +				DMA_INTR_ENA_FBE | DMA_INTR_ENA_UNE)
>>>> +#else
>>>>    #define DMA_INTR_ABNORMAL	(DMA_INTR_ENA_AIE | DMA_INTR_ENA_FBE | \
>>>>    				DMA_INTR_ENA_UNE)
>>>> +#endif
>>> The aim is to produce one kernel which runs on all possible
>>> variants. So we don't like to see this sort of #ifdef. Please try to
>>> remove them.
>> We now run into a tricky problem: we only have a few register
>> definitions(DMA_XXX_LOONGSON)
>>
>> that are not the same as the dwmac1000 register definition.
> What does DMA_INTR_ENA_AIE_LOONGSON do? This seems like an interrupt
> mask, and this is enabling an interrupt source? However, i don't see
> this bit being tested in any interrupt status register? Or is it
> hiding in one of the other patches?

In general, we split one into two.

the details are as follows：

DMA_INTR_ENA_NIE = DMA_INTR_ENA_NIE_LOONGSON= DMA_INTR_ENA_TX_NIE + 
DMA_INTR_ENA_RX_NIE

DMA_INTR_ENA_AIE = DMA_INTR_ENA_AIE_LOONGSON= DMA_INTR_ENA_TX_AIE + 
DMA_INTR_ENA_RX_AIE

DMA_STATUS_NIS = DMA_STATUS_TX_NIS_LOONGSON + DMA_STATUS_RX_NIS_LOONGSON

DMA_STATUS_AIS = DMA_STATUS_TX_AIS_LOONGSON + DMA_STATUS_RX_AIS_LOONGSON

DMA_STATUS_FBI = DMA_STATUS_TX_FBI_LOONGSON + DMA_STATUS_RX_FBI_LOONGSON


>
> This is where lots of small patches, with good descriptions helps.

Ok, thanks for your advice, I will try to split it in the next version.


Thanks,

Yanteng

>
>       Andrew

