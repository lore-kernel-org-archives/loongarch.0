Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26E74137C
	for <loongarch@lists.linux.dev>; Sun, 10 Dec 2023 01:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.109.254])
	by gateway (Coremail) with SMTP id _____8Dx_+tpGHVlCD9AAA--.61759S3;
	Sun, 10 Dec 2023 09:46:17 +0800 (CST)
Received: from [192.168.100.8] (unknown [112.20.109.254])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Axzy9oGHVlyfpZAA--.2585S3;
	Sun, 10 Dec 2023 09:46:17 +0800 (CST)
Message-ID: <155320bf-94d0-4e30-9283-d8ad178a323f@loongson.cn>
Date: Sun, 10 Dec 2023 09:46:16 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/9] net: stmmac: dwmac-loongson: Refactor code for
 loongson_dwmac_probe()
To: Andrew Lunn <andrew@lunn.ch>
Cc: hkallweit1@gmail.com, peppe.cavallaro@st.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, fancer.lancer@gmail.com,
 Jose.Abreu@synopsys.com, chenhuacai@loongson.cn, linux@armlinux.org.uk,
 dongbiao@loongson.cn, guyinggang@loongson.cn, netdev@vger.kernel.org,
 loongarch@lists.linux.dev, chris.chenfeiyang@gmail.com
References: <cover.1699533745.git.siyanteng@loongson.cn>
 <5f659ea8ab3a90ab27b99dfa24b05c20f3698545.1699533745.git.siyanteng@loongson.cn>
 <3c59e90d-7e13-43de-a213-b08bc5696ee0@lunn.ch>
Content-Language: en-US
From: Yanteng Si <siyanteng@loongson.cn>
In-Reply-To: <3c59e90d-7e13-43de-a213-b08bc5696ee0@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Axzy9oGHVlyfpZAA--.2585S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoW7urWrWry7uF4fZry8Gw1xJFc_yoW8Zr15pa
	93CFnrtay8Ar9Fvr10qr4xXw1vkr4UAr4UKry2gFZ2y3s5CF1SqFWDKw1Ykas7Cr93Cw4I
	vay0gF409Fs0yrXCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
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


在 2023/11/12 04:19, Andrew Lunn 写道:
> On Fri, Nov 10, 2023 at 05:25:43PM +0800, Yanteng Si wrote:
>> Add a setup() function to initialize data, and simplify code for
>> loongson_dwmac_probe().
> This does not look like a refactoring patch. Such patches just move
> code around, but otherwise leave the code alone. There are real
> changes in here.
>
>> -	if (!of_device_is_compatible(np, "loongson, pci-gmac")) {
>> -		pr_info("dwmac_loongson_pci: Incompatible OF node\n");
>> -		return -ENODEV;
>> -	}
>> -
> This just disappears. Why is it no longer needed?
>
>
>>   	plat = devm_kzalloc(&pdev->dev, sizeof(*plat), GFP_KERNEL);
>>   	if (!plat)
>>   		return -ENOMEM;
>>   
>> +	plat->mdio_bus_data = devm_kzalloc(&pdev->dev,
>> +					   sizeof(*plat->mdio_bus_data),
>> +					   GFP_KERNEL);
>> +	if (!plat->mdio_bus_data)
>> +		return -ENOMEM;
>> +
>> +	plat->dma_cfg = devm_kzalloc(&pdev->dev, sizeof(*plat->dma_cfg),
>> +				     GFP_KERNEL);
>> +	if (!plat->dma_cfg)
>> +		return -ENOMEM;
>> +
>>   	plat->mdio_node = of_get_child_by_name(np, "mdio");
>>   	if (plat->mdio_node) {
>>   		dev_info(&pdev->dev, "Found MDIO subnode\n");
>> -
>> -		plat->mdio_bus_data = devm_kzalloc(&pdev->dev,
>> -						   sizeof(*plat->mdio_bus_data),
>> -						   GFP_KERNEL);
>> -		if (!plat->mdio_bus_data) {
>> -			ret = -ENOMEM;
>> -			goto err_put_node;
>> -		}
> MDIO was conditional, but now is mandatory. Why?
>
>>   	if (ret) {
>> -		dev_err(&pdev->dev, "%s: ERROR: failed to enable device\n", __func__);
>> +		dev_err(&pdev->dev, "%s: ERROR: failed to enable device\n",
>> +			__func__);
> Changes like this are a distraction. The reviewer is trying to
> understand what has changed and why. If you want to make white space
> changes, please do it in a patch of its own.
>
> Please break this patch up into lots of smaller parts, each with a
> good commit messaged explaining what is going on, and importantly,
> why.


OK,Iwillgiveitatry.


Thanks,

Yanteng

>
> 	Andrew

