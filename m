Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 210C61802A
	for <loongarch@lists.linux.dev>; Tue, 19 Dec 2023 12:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.110.252])
	by gateway (Coremail) with SMTP id _____8CxuegKjoFlzpsCAA--.13087S3;
	Tue, 19 Dec 2023 20:35:22 +0800 (CST)
Received: from [192.168.100.8] (unknown [112.20.110.252])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxG+QGjoFlq1EAAA--.2197S3;
	Tue, 19 Dec 2023 20:35:19 +0800 (CST)
Message-ID: <885a8904-9412-411d-9995-7d3ff350f309@loongson.cn>
Date: Tue, 19 Dec 2023 20:35:17 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/9] stmmac: Add Loongson platform support
Content-Language: en-US
To: Serge Semin <fancer.lancer@gmail.com>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, peppe.cavallaro@st.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, Jose.Abreu@synopsys.com,
 chenhuacai@loongson.cn, linux@armlinux.org.uk, guyinggang@loongson.cn,
 netdev@vger.kernel.org, loongarch@lists.linux.dev,
 chris.chenfeiyang@gmail.com
References: <cover.1702458672.git.siyanteng@loongson.cn>
 <pwdr6mampxe33jpqdf6o5xczgd4qkdttqj4tvionxl7qbry2ek@hpadl7wi4zni>
From: Yanteng Si <siyanteng@loongson.cn>
In-Reply-To: <pwdr6mampxe33jpqdf6o5xczgd4qkdttqj4tvionxl7qbry2ek@hpadl7wi4zni>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxG+QGjoFlq1EAAA--.2197S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoWxZF47GF1fWFyrCw1rZr18Zwc_yoW5KF4Dpr
	W7Za4YgrZrtr1xA3ZYyw1DXry5Way3tr4UWa1ftr1fCFWq9ryjq34a9FWY9Fy7Zrs8uFy2
	qF1UCr1qk3WDArgCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I
	0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcCD7UUUUU


在 2023/12/14 23:15, Serge Semin 写道:
> Hi Yanteng
>
> On Wed, Dec 13, 2023 at 06:12:22PM +0800, Yanteng Si wrote:
>> v6:
>>
>> * Refer to Serge's suggestion:
>>    - Add new platform feature flag:
>>      include/linux/stmmac.h:
>>      +#define STMMAC_FLAG_HAS_LGMAC			BIT(13)
>>
>>    - Add the IRQs macros specific to the Loongson Multi-channels GMAC:
>>       drivers/net/ethernet/stmicro/stmmac/dwmac_dma.h:
>>       +#define DMA_INTR_ENA_NIE_LOONGSON 0x00060000	/* Normal Loongson Tx/Rx Summary */
>>       #define DMA_INTR_ENA_NIE 0x00010000	/* Normal Summary */
>>       ...
>>
>>    - Drop all of redundant changes that don't require the
>>      prototypes being converted to accepting the stmmac_priv
>>      pointer.
>>
>> * Refer to andrew's suggestion:
>>    - Drop white space changes.
>>    - break patch up into lots of smaller parts.
>>       Some small patches have been put into another series as a preparation
>>       see <https://lore.kernel.org/loongarch/cover.1702289232.git.siyanteng@loongson.cn/T/#t>
>>       
>>       *note* : This series of patches relies on the three small patches above.
>> * others
>>    - Drop irq_flags changes.
>>    - Changed patch order.
> Thanks for submitting the updated series. I'll have a closer look at
> it on the next week.

I have prepared a new patch version and will CC you soon, so you can go 
straight

to the v7.


Thank,

Yanteng

>
> -Serge(y)
>
>>
>>
>> v4 -> v5:
>>
>> * Remove an ugly and useless patch (fix channel number).
>> * Remove the non-standard dma64 driver code, and also remove
>>    the HWIF entries, since the associated custom callbacks no
>>    longer exist.
>> * Refer to Serge's suggestion: Update the dwmac1000_dma.c to
>>    support the multi-DMA-channels controller setup.
>>
>> See:
>> v4: <https://lore.kernel.org/loongarch/cover.1692696115.git.chenfeiyang@loongson.cn/>
>> v3: <https://lore.kernel.org/loongarch/cover.1691047285.git.chenfeiyang@loongson.cn/>
>> v2: <https://lore.kernel.org/loongarch/cover.1690439335.git.chenfeiyang@loongson.cn/>
>> v1: <https://lore.kernel.org/loongarch/cover.1689215889.git.chenfeiyang@loongson.cn/>
>>
>> Yanteng Si (9):
>>    net: stmmac: Pass stmmac_priv and chan in some callbacks
>>    net: stmmac: dwmac-loongson: Refactor code for loongson_dwmac_probe()
>>    net: stmmac: dwmac-loongson: Add full PCI support
>>    net: stmmac: Add multi-channel supports
>>    net: stmmac: Add Loongson-specific register definitions
>>    net: stmmac: dwmac-loongson: Add MSI support
>>    net: stmmac: dwmac-loongson: Add GNET support
>>    net: stmmac: dwmac-loongson: Disable flow control for GMAC
>>    net: stmmac: Disable coe for some Loongson GNET
>>
>>   drivers/net/ethernet/stmicro/stmmac/common.h  |   1 +
>>   .../ethernet/stmicro/stmmac/dwmac-loongson.c  | 296 ++++++++++++++----
>>   .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c |   2 +-
>>   .../ethernet/stmicro/stmmac/dwmac1000_dma.c   |  61 +++-
>>   .../ethernet/stmicro/stmmac/dwmac100_dma.c    |   2 +-
>>   .../net/ethernet/stmicro/stmmac/dwmac4_dma.c  |   2 +-
>>   .../net/ethernet/stmicro/stmmac/dwmac_dma.h   |  47 ++-
>>   .../net/ethernet/stmicro/stmmac/dwmac_lib.c   |  65 ++--
>>   .../ethernet/stmicro/stmmac/dwxgmac2_dma.c    |   2 +-
>>   drivers/net/ethernet/stmicro/stmmac/hwif.c    |   8 +-
>>   drivers/net/ethernet/stmicro/stmmac/hwif.h    |  11 +-
>>   .../ethernet/stmicro/stmmac/stmmac_ethtool.c  |   6 +
>>   .../net/ethernet/stmicro/stmmac/stmmac_main.c |  13 +-
>>   include/linux/stmmac.h                        |   4 +
>>   14 files changed, 413 insertions(+), 107 deletions(-)
>>
>> -- 
>> 2.31.4
>>

