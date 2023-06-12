Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E8B01381
	for <loongarch@lists.linux.dev>; Mon, 12 Jun 2023 01:45:20 +0000 (UTC)
Received: from loongson.cn (unknown [10.180.13.22])
	by gateway (Coremail) with SMTP id _____8DxTuupeIZkz1UDAA--.7338S3;
	Mon, 12 Jun 2023 09:45:13 +0800 (CST)
Received: from [10.180.13.22] (unknown [10.180.13.22])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxK8qoeIZkT6gUAA--.51150S3;
	Mon, 12 Jun 2023 09:45:12 +0800 (CST)
Message-ID: <525b814e-3ae2-cfe2-f2fd-8560928c45bc@loongson.cn>
Date: Mon, 12 Jun 2023 09:44:47 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/3] ASoC: Add support for Loongson I2S controller
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn,
 linux-kernel@vger.kernel.org
References: <20230605120934.2306548-1-mengyingkun@loongson.cn>
 <f88a4985-0dc1-4599-8656-2029c0825495@sirena.org.uk>
From: Yingkun Meng <mengyingkun@loongson.cn>
In-Reply-To: <f88a4985-0dc1-4599-8656-2029c0825495@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8DxK8qoeIZkT6gUAA--.51150S3
X-CM-SenderInfo: 5phqw55lqjy33q6o00pqjv00gofq/1tbiAQAADGSFuYEC2QABsO
X-Coremail-Antispam: 1Uk129KBj93XoW7tr18Kr48Jw4UWw1xJF1UArc_yoW8Cr1kpr
	WUuFy3KF12qr4FyF1DtFy8XFy5AFZxtr15Aw4DJr47ZrnI93s5trW8KFWFkF9xCr92yr4j
	vw48X3y0kws0yFXCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zwZ7UU
	UUU==


On 2023/6/5 21:17, Mark Brown wrote:
> On Mon, Jun 05, 2023 at 08:09:32PM +0800, YingKun Meng wrote:
>
>> +			regmap_read_poll_timeout_atomic(i2s->regmap,
>> +						LS_I2S_CTRL, val,
>> +						!(val & I2S_CTRL_MCLK_READY),
>> +						10, 2000);
> The driver is waiting for status bits to change in the regmap but...


Break condition reversed. Fixed in new version.

>
>> +		pr_err("buf len not multiply of period len\n");
> Use dev_ functions to log things please.


OK.

>> +static const struct regmap_config loongson_i2s_regmap_config = {
>> +	.reg_bits = 32,
>> +	.reg_stride = 4,
>> +	.val_bits = 32,
>> +	.max_register = 0x110,
>> +	.cache_type = REGCACHE_FLAT,
>> +};
> ...there are no volatile registers in the regmap so we will never read
> from the hardware.  I don't understand how this can work?
>

The I2S controller has two private DMA controllers to transfer the audio
data.
Its register set is divided into two parts: I2S control registers and
DMA control registers.

1) The I2S control registers are used to config I2S parameters, accessed
by regmap API. So we don't need to read back.

2) The DMA control registers are used to maintain the status of audio
data transmission.
These registers isn't maintained by regmap. They are accessed using
readx()/writex() APIs.

>> +	i2s->reg_base = pci_iomap(pdev, BAR_NUM, 0);
>> +	if (!i2s->reg_base) {
>> +		dev_err(&pdev->dev, "pci_iomap_error\n");
>> +		ret = -EIO;
>> +		goto err_release;
>> +	}
> pcim_iomap()?


OK.

>> +	dev_set_name(&pdev->dev, "%s", loongson_i2s_dai.name);
> Don't log static information like this, it just adds noise and makes the
> boot slower.


Removed in new version. Its original purpose is to set a fixed value for
platform component name, and match this value in machine driver.

>> +	pci_disable_device(pdev);
> pcim_enable_device() too.


OK.

