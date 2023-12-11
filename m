Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E61C421A01
	for <loongarch@lists.linux.dev>; Mon, 11 Dec 2023 09:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.109.254])
	by gateway (Coremail) with SMTP id _____8AxZfAO3XZlIAAAAA--.18S3;
	Mon, 11 Dec 2023 17:57:34 +0800 (CST)
Received: from [192.168.100.8] (unknown [112.20.109.254])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxfS+4zHZldVpbAA--.5265S3;
	Mon, 11 Dec 2023 16:47:53 +0800 (CST)
Message-ID: <54242b04-0f9f-4384-a0c9-1add2b15c2d7@loongson.cn>
Date: Mon, 11 Dec 2023 16:47:52 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/9] net: stmmac: dwmac-loongson: Add full PCI support
To: Andrew Lunn <andrew@lunn.ch>
Cc: hkallweit1@gmail.com, peppe.cavallaro@st.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, fancer.lancer@gmail.com,
 Jose.Abreu@synopsys.com, chenhuacai@loongson.cn, linux@armlinux.org.uk,
 dongbiao@loongson.cn, guyinggang@loongson.cn, netdev@vger.kernel.org,
 loongarch@lists.linux.dev, chris.chenfeiyang@gmail.com
References: <cover.1699533745.git.siyanteng@loongson.cn>
 <0e9dd61f05571b01de369e449106db3ac2dd56da.1699533745.git.siyanteng@loongson.cn>
 <52a727bb-29d0-4d5c-9043-95903f7b9892@lunn.ch>
Content-Language: en-US
From: Yanteng Si <siyanteng@loongson.cn>
In-Reply-To: <52a727bb-29d0-4d5c-9043-95903f7b9892@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxfS+4zHZldVpbAA--.5265S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Cr1xGFy8Gr1xAr1fXF1DArc_yoW8Ww4xp3
	95AF15ZrykXry7uayUZayxJ3W8Xr48Zry8Cw47Cr12v3WFvr1ftF15KrW7CryxArZIkw40
	9w1jqF4vkFsYkacCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUyGb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Jr0_Gr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrw
	CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
	14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
	IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxK
	x2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI
	0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8xuctUUUUU==


在 2023/11/12 04:24, Andrew Lunn 写道:
>> -	res.irq = of_irq_get_byname(np, "macirq");
>> -	if (res.irq < 0) {
>> -		dev_err(&pdev->dev, "IRQ macirq not found\n");
>> -		ret = -ENODEV;
>> -		goto err_disable_msi;
>> -	}
>> -
>> -	res.wol_irq = of_irq_get_byname(np, "eth_wake_irq");
>> -	if (res.wol_irq < 0) {
>> -		dev_info(&pdev->dev,
>> -			 "IRQ eth_wake_irq not found, using macirq\n");
>> -		res.wol_irq = res.irq;
>> -	}
>> -
>> -	res.lpi_irq = of_irq_get_byname(np, "eth_lpi");
>> -	if (res.lpi_irq < 0) {
>> -		dev_err(&pdev->dev, "IRQ eth_lpi not found\n");
>> -		ret = -ENODEV;
>> -		goto err_disable_msi;
>> +	if (np) {
>> +		res.irq = of_irq_get_byname(np, "macirq");
>> +		if (res.irq < 0) {
>> +			dev_err(&pdev->dev, "IRQ macirq not found\n");
>> +			ret = -ENODEV;
>> +			goto err_disable_msi;
>> +		}
>> +
>> +		res.wol_irq = of_irq_get_byname(np, "eth_wake_irq");
>> +		if (res.wol_irq < 0) {
>> +			dev_info(&pdev->dev,
>> +				 "IRQ eth_wake_irq not found, using macirq\n");
>> +			res.wol_irq = res.irq;
>> +		}
>> +
>> +		res.lpi_irq = of_irq_get_byname(np, "eth_lpi");
>> +		if (res.lpi_irq < 0) {
>> +			dev_err(&pdev->dev, "IRQ eth_lpi not found\n");
>> +			ret = -ENODEV;
>> +			goto err_disable_msi;
>> +		}
> This is where a refactoring patch is useful. Have one patch which
> moves this code into a helper function. The commit message can say it
> just moves code around, but there is no functional change. The second
> patch then moves the call to the helper inside the if (np).

Thanks for your advice!


In fact, we have already done this in <[PATCH v5 6/9] net: stmmac: 
dwmac-loongson: Add MSI support>, and the function is 
loongson_dwmac_config_legacy().


Thanks,

Yanteng


>
>        Andrew

