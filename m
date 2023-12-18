Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D169D134A1
	for <loongarch@lists.linux.dev>; Mon, 18 Dec 2023 10:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.112.193])
	by gateway (Coremail) with SMTP id _____8BxK+lsGoBloAcCAA--.10780S3;
	Mon, 18 Dec 2023 18:09:48 +0800 (CST)
Received: from [192.168.100.8] (unknown [112.20.112.193])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxkuNqGoBl3Q0KAA--.47878S3;
	Mon, 18 Dec 2023 18:09:47 +0800 (CST)
Message-ID: <46ffe0a3-f870-431d-aff3-69ccb0c93615@loongson.cn>
Date: Mon, 18 Dec 2023 18:09:46 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/9] net: stmmac: Pass stmmac_priv and chan in some
 callbacks
To: Andrew Lunn <andrew@lunn.ch>
Cc: hkallweit1@gmail.com, peppe.cavallaro@st.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, fancer.lancer@gmail.com,
 Jose.Abreu@synopsys.com, chenhuacai@loongson.cn, linux@armlinux.org.uk,
 guyinggang@loongson.cn, netdev@vger.kernel.org, loongarch@lists.linux.dev,
 chris.chenfeiyang@gmail.com
References: <cover.1702458672.git.siyanteng@loongson.cn>
 <361389e731d14e3e2094f6ff5501597e9f762f34.1702458672.git.siyanteng@loongson.cn>
 <759f33f0-e75a-406b-9318-272e50f2ec3b@lunn.ch>
Content-Language: en-US
From: Yanteng Si <siyanteng@loongson.cn>
In-Reply-To: <759f33f0-e75a-406b-9318-272e50f2ec3b@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxkuNqGoBl3Q0KAA--.47878S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Cw1rGr1rWrWfXF18Aw43Jwc_yoW8GF45pF
	1fJ3s3Gas5trWfXa1kJr4DXryUJF1xJw18XF1xGFn2ya1Yyr12qr1vg3yvgryUAFZ2gw15
	Jr4jqF1DZrWUJrbCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07UE-erUUUUU=


在 2023/12/16 21:01, Andrew Lunn 写道:
>> -static void sun8i_dwmac_enable_dma_transmission(void __iomem *ioaddr)
>> +static void sun8i_dwmac_enable_dma_transmission(void __iomem *ioaddr, u32 chan)
>
>>   
>> -	stmmac_enable_dma_transmission(priv, priv->ioaddr);
>> +	stmmac_enable_dma_transmission(priv, priv->ioaddr, queue);
> As i've said a few times, i don't know this driver.
>
> Is it a queue or is it a chan? Is this change consistent with the
> reset of the code base?

It is a chan, but there is only queue here. so we refer to dwmac4:

static void dwmac4_rx_watchdog(struct stmmac_priv *priv, void __iomem 
*ioaddr,
                    u32 riwt, u32 queue)
{
     const struct dwmac4_addrs *dwmac4_addrs = priv->plat->dwmac4_addrs;

     writel(riwt, ioaddr + DMA_CHAN_RX_WATCHDOG(dwmac4_addrs, queue));
}

---------------------------------------------------------------------------------

@@ -271,12 +299,13 @@ static int dwmac1000_get_hw_feature(void __iomem 
*ioaddr,
  static void dwmac1000_rx_watchdog(struct stmmac_priv *priv,
                    void __iomem *ioaddr, u32 riwt, u32 queue)
  {
-    writel(riwt, ioaddr + DMA_RX_WATCHDOG);
+    writel(riwt, ioaddr + DMA_CHAN_RX_WATCHDOG(queue));
  }


We also use queue instead of chan.


Thanks,

Yanteng

>        Andrew

