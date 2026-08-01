Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41C96220F2A
	for <loongarch@lists.linux.dev>; Sat,  1 Aug 2026 09:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785575733; cv=none; b=J7EoySrSiRqc5gGtvOlJAdWXvEL3jBWjTPUi5OsiQDHdxwOmFud7XnebWAI7AQ8sT1EyC/mdTUqTzrJMC/NdAaobXdRlCh29bpcHwMfOVJH+RFH4Crm2XMd4qL6CBCLok6NAED/B3mPUdmMLoDIEs9tgIFL5hSE7tJjYBQgrTO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785575733; c=relaxed/simple;
	bh=1sIj31XGIGfiwz/3YwRkey3AgWt6qmcgdCdG7Rb2KVs=;
	h=From:Subject:To:Cc:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=mHwlBRj9l6XTFlSuLnU66V5OYg01s6Bdjdo1hx3qSbMbL4fX/pCnNw+qJ4CR/F3piX3PvymnwoC4Dt3+X5ZgLLF9Yzfrf64GIzE0UD5z2e18wMEIZgMwZLfr2RK+D1Sfr6lz4wsr8iExe/nAgVaHnHt0m3torlG23SmsNQkyvWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.101])
	by gateway (Coremail) with SMTP id _____8BxXZsvuW1qt3YJAA--.8432S3;
	Sat, 01 Aug 2026 17:15:28 +0800 (CST)
Received: from [10.20.42.101] (unknown [10.20.42.101])
	by front1 (Coremail) with SMTP id qMiowJBxWsQvuW1qSskfAA--.15497S3;
	Sat, 01 Aug 2026 17:15:27 +0800 (CST)
From: Hongliang Wang <wanghongliang@loongson.cn>
Subject: Re: [PATCH v8 2/2] i2c: ls2x: Add clocks property parsing and adjust
 bus speed
To: Xi Ruoyao <xry111@xry111.site>, Binbin Zhou <zhoubinbin@loongson.cn>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 loongarch@lists.linux.dev, Huacai Chen <chenhuacai@loongson.cn>,
 stable@vger.kernel.org
References: <20260721122604.12717-1-wanghongliang@loongson.cn>
 <20260721122604.12717-3-wanghongliang@loongson.cn>
 <affa49c80b0762b5b9e6ae4f4fa4ae787afecbd8.camel@xry111.site>
Message-ID: <d9e83dc2-6cd0-c22c-20ce-a1a97a414866@loongson.cn>
Date: Sat, 1 Aug 2026 17:12:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <affa49c80b0762b5b9e6ae4f4fa4ae787afecbd8.camel@xry111.site>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowJBxWsQvuW1qSskfAA--.15497S3
X-CM-SenderInfo: pzdqwxxrqjzxhdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxXFykWr4DCF48CrW8KFy3Awc_yoWrtrWfpF
	WDCFWrGr4q9rsFgrsIqa48ZFyayws5JaykCF17t3WxW3Z3Arn5X3Wftr909F48ur92gayx
	Za4DWrZxCFyqvrXCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Jr0_Gr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67
	vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
	wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc4
	0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
	xVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
	1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU25EfUUUU
	U

Hi Ruoyao,

On 2026/7/29 下午4:09, Xi Ruoyao wrote:
> On Tue, 2026-07-21 at 20:26 +0800, Hongliang Wang wrote:
>> The i2c-ls2x driver supports dts and acpi parameter passing.
>>
>> In dts, uses clock framework, by parsing clocks property to
>> get i2c bus reference clock, and define the div of reference
>> clock by device data.
>>
>> In acpi, by passing clocks property to describe i2c bus reference
>> clock and clock-div property to describe the div of reference clock.
>>
>> Based on i2c bus reference clock(clock_a), i2c bus speed(clock_s)
>> and div, calculate the prcescale of i2c divider register. The
>> calculation formula is
>>
>> prcescale = (clock_a*10)/(div*clock_s)-1
>>
>> Reviewed-by: Huacai Chen<chenhuacai@loongson.cn>
>> Cc:stable@vger.kernel.org
>> Signed-off-by: Hongliang Wang<wanghongliang@loongson.cn>
> This resolves the jittery touchpad input on the EAECIS NL60R laptop.
>
> Tested-by: Xi Ruoyao<xry111@xry111.site>
Thank you for testing!
>> ---
>>   drivers/i2c/busses/i2c-ls2x.c | 40 ++++++++++++++++++++++++++++++++---
>>   1 file changed, 37 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-ls2x.c b/drivers/i2c/busses/i2c-ls2x.c
>> index b475dd27b7af..25f8301ae14f 100644
>> --- a/drivers/i2c/busses/i2c-ls2x.c
>> +++ b/drivers/i2c/busses/i2c-ls2x.c
>> @@ -12,6 +12,7 @@
>>   
>>   #include <linux/bitfield.h>
>>   #include <linux/bits.h>
>> +#include <linux/clk.h>
>>   #include <linux/completion.h>
>>   #include <linux/device.h>
>>   #include <linux/iopoll.h>
>> @@ -63,11 +64,19 @@
>>   /* The default bus frequency, which is an empirical value */
>>   #define LS2X_I2C_FREQ_STD	(33 * HZ_PER_KHZ)
>>   
>> +/* The div of i2c reference clock on LS2K0500/2K1000/2K2000 */
>> +#define LS2X_I2C_2K_CLOCK_DIV	40
>> +
>> +/* The div of i2c reference clock on LS7A1000/7A2000 */
>> +#define LS2X_I2C_7A_CLOCK_DIV	50
>> +
>>   struct ls2x_i2c_priv {
>>   	struct i2c_adapter	adapter;
>>   	void __iomem		*base;
>>   	struct i2c_timings	i2c_t;
>>   	struct completion	cmd_complete;
>> +	unsigned int		div;
>> +	unsigned int		pclk;
>>   };
>>   
>>   /*
>> @@ -107,12 +116,13 @@ static void ls2x_i2c_adjust_bus_speed(struct ls2x_i2c_priv *priv)
>>   	else
>>   		t->bus_freq_hz = LS2X_I2C_FREQ_STD;
>>   
>> +	val = (priv->pclk * 10) / (priv->div * t->bus_freq_hz) - 1;
>> +
>>   	/*
>>   	 * According to the chip manual, we can only access the registers as bytes,
>>   	 * otherwise the high bits will be truncated.
>>   	 * So set the I2C frequency with a sequential writeb() instead of writew().
>>   	 */
>> -	val = LS2X_I2C_PCLK_FREQ / (5 * t->bus_freq_hz) - 1;
>>   	writeb(FIELD_GET(GENMASK(7, 0), val), priv->base + I2C_LS2X_PRER_LO);
>>   	writeb(FIELD_GET(GENMASK(15, 8), val), priv->base + I2C_LS2X_PRER_HI);
>>   }
>> @@ -287,6 +297,7 @@ static const struct i2c_algorithm ls2x_i2c_algo = {
>>   static int ls2x_i2c_probe(struct platform_device *pdev)
>>   {
>>   	int ret, irq;
>> +	struct clk *clk;
>>   	struct i2c_adapter *adap;
>>   	struct ls2x_i2c_priv *priv;
>>   	struct device *dev = &pdev->dev;
>> @@ -304,6 +315,29 @@ static int ls2x_i2c_probe(struct platform_device *pdev)
>>   	if (irq < 0)
>>   		return irq;
>>   
>> +	if (dev_of_node(dev)) {
>> +		clk = devm_clk_get_optional_enabled(dev, NULL);
>> +		if (IS_ERR(clk))
>> +			return PTR_ERR(clk);
>> +		if (clk)
>> +			priv->pclk = clk_get_rate(clk);
>> +		else
>> +			priv->pclk = LS2X_I2C_PCLK_FREQ;
>> +
>> +		priv->div = (unsigned long)device_get_match_data(dev);
>> +		if (!priv->div)
>> +			priv->div = LS2X_I2C_2K_CLOCK_DIV;
>> +	} else {
>> +		/* clocks and clock-div are only ACPI properties. */
>> +		ret = device_property_read_u32(dev, "clocks", &priv->pclk);
>> +		if (ret)
>> +			priv->pclk = LS2X_I2C_PCLK_FREQ;
>> +
>> +		ret = device_property_read_u32(dev, "clock-div", &priv->div);
>> +		if (ret || !priv->div)
>> +			priv->div = LS2X_I2C_7A_CLOCK_DIV;
>> +	}
>> +
>>   	/* Add the i2c adapter */
>>   	adap = &priv->adapter;
>>   	adap->retries = 5;
>> @@ -349,8 +383,8 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ls2x_i2c_pm_ops,
>>   				 ls2x_i2c_suspend, ls2x_i2c_resume, NULL);
>>   
>>   static const struct of_device_id ls2x_i2c_id_table[] = {
>> -	{ .compatible = "loongson,ls2k-i2c" },
>> -	{ .compatible = "loongson,ls7a-i2c" },
>> +	{ .compatible = "loongson,ls2k-i2c", .data = (void *)LS2X_I2C_2K_CLOCK_DIV, },
>> +	{ .compatible = "loongson,ls7a-i2c", .data = (void *)LS2X_I2C_7A_CLOCK_DIV, },
>>   	{ /* sentinel */ }
>>   };
>>   MODULE_DEVICE_TABLE(of, ls2x_i2c_id_table);
Best regards,
Hongliang Wang

