Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37E2AEC2
	for <loongarch@lists.linux.dev>; Sun, 26 Nov 2023 12:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from loongson.cn (unknown [112.20.112.120])
	by gateway (Coremail) with SMTP id _____8CxRugsOWNl09s8AA--.1555S3;
	Sun, 26 Nov 2023 20:25:16 +0800 (CST)
Received: from [192.168.100.8] (unknown [112.20.112.120])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxvdwpOWNlg9tMAA--.39177S3;
	Sun, 26 Nov 2023 20:25:14 +0800 (CST)
Message-ID: <4f9a4d75-7052-4314-bbd1-838a642b80ab@loongson.cn>
Date: Sun, 26 Nov 2023 20:25:13 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/9] net: stmmac: Add Loongson DWGMAC definitions
Content-Language: en-US
To: Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>
Cc: hkallweit1@gmail.com, peppe.cavallaro@st.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, Jose.Abreu@synopsys.com,
 chenhuacai@loongson.cn, linux@armlinux.org.uk, dongbiao@loongson.cn,
 guyinggang@loongson.cn, netdev@vger.kernel.org, loongarch@lists.linux.dev,
 chris.chenfeiyang@gmail.com
References: <cover.1699533745.git.siyanteng@loongson.cn>
 <87011adcd39f20250edc09ee5d31bda01ded98b5.1699533745.git.siyanteng@loongson.cn>
 <2e1197f9-22f6-4189-8c16-f9bff897d567@lunn.ch>
 <df17d5e9-2c61-47e3-ba04-64b7110a7ba6@loongson.cn>
 <9c2806c7-daaa-4a2d-b69b-245d202d9870@lunn.ch>
 <8d82761e-c978-4763-a765-f6e0b57ec6a6@loongson.cn>
 <7dde9b88-8dc5-4a35-a6e3-c56cf673e66d@lunn.ch>
 <3amgiylsqdngted6tts6msman54nws3jxvkuq2kcasdqfa5d7j@kxxitnckw2gp>
From: Yanteng Si <siyanteng@loongson.cn>
In-Reply-To: <3amgiylsqdngted6tts6msman54nws3jxvkuq2kcasdqfa5d7j@kxxitnckw2gp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxvdwpOWNlg9tMAA--.39177S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoW7AF4rAFWkCr13Wr1UCw1DCFX_yoW8tF13pa
	13Ca4kKF1kKr4UCw4xA3W5XFy8ArWFyay5KrW5Wr4UuasxKw1SvryxKw4S9a45Ar97Gw4j
	vr48Ga45AF9Y9FXCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUyCb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64vIr4
	1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
	67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
	8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
	v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j8yCJUUUUU=


在 2023/11/25 00:44, Serge Semin 写道:
> On Fri, Nov 24, 2023 at 03:51:08PM +0100, Andrew Lunn wrote:
>>> In general, we split one into two.
>>>
>>> the details are as follows：
>>>
>>> DMA_INTR_ENA_NIE = DMA_INTR_ENA_NIE_LOONGSON= DMA_INTR_ENA_TX_NIE +
>>> DMA_INTR_ENA_RX_NIE
>> What does the documentation from Synopsys say about the bit you have
>> used for DMA_INTR_ENA_NIE_LOONGSON? Is it marked as being usable by IP
>> integrators for whatever they want, or is it marked as reserved?
>>
>> I'm just wondering if we are heading towards a problem when the next
>> version of this IP assigns the bit to mean something else.
> That's what I started to figure out in my initial message:
> Link: https://lore.kernel.org/netdev/gxods3yclaqkrud6jxhvcjm67vfp5zmuoxjlr6llcddny7zwsr@473g74uk36xn/
> but Yanteng for some reason ignored all my comments.

Sorry, I always keep your review comments in mind, and even this version 
of the patch is

largely based on your previous comments. Please give me some more time 
and I promise

to answer your comments before the next patch is made.

>
> Anyway AFAICS this Loongson GMAC has NIE and AIE flags defined differently:
> DW GMAC: NIE - BIT(16) - all non-fatal Tx and Rx errors,
>           AIE - BIT(15) - all fatal Tx, Rx and Bus errors.
> Loongson GMAC: NIE - BIT(18) | BIT(17) - one flag for Tx and another for Rx errors.
>                 AIE - BIT(16) | BIT(15) - Tx, Rx and don't know about the Bus errors.
> So the Loongson GMAC has not only NIE/AIE flags re-defined, but
> also get to occupy two reserved in the generic DW GMAC bits: BIT(18) and BIT(17).
>
> Moreover Yanteng in his patch defines DMA_INTR_NORMAL as a combination
> of both _generic_ DW and Loongson-specific NIE flags and
> DMA_INTR_ABNORMAL as a combination of both _generic_ DW and
> Loongson-specific AIE flags. At the very least it doesn't look
> correct, since _generic_ DW GMAC NIE flag BIT(16) is defined as a part
> of the Loongson GMAC AIE flags set.

We will consider this seriously, please give us some more time, and of 
course, we

are looking forward to your opinions on this problem.


I hope you can accept my apologies, Please allow me to say sorry again.


Thanks for your review!


Thanks,

Yanteng

>
> -Serge(y)
>
>> 	Andrew

