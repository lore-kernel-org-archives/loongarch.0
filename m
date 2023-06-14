Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFDB53D6C
	for <loongarch@lists.linux.dev>; Wed, 14 Jun 2023 09:14:54 +0000 (UTC)
Received: from loongson.cn (unknown [10.180.13.22])
	by gateway (Coremail) with SMTP id _____8AxX+sMhYlkcg8FAA--.10763S3;
	Wed, 14 Jun 2023 17:14:52 +0800 (CST)
Received: from [10.180.13.22] (unknown [10.180.13.22])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxduQLhYlkyW0aAA--.9439S3;
	Wed, 14 Jun 2023 17:14:51 +0800 (CST)
Message-ID: <978fa726-e194-2162-e10d-aed3a1c756e8@loongson.cn>
Date: Wed, 14 Jun 2023 17:14:27 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [ PATCH v2 2/3] ASoC: loongson: Add Loongson ASoC Sound Card
 Support
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, loongarch@lists.linux.dev,
 loongson-kernel@lists.loongnix.cn
References: <20230612090046.3039532-1-mengyingkun@loongson.cn>
 <1568e064-606e-4f56-951f-429a87a3a2d9@sirena.org.uk>
From: Yingkun Meng <mengyingkun@loongson.cn>
In-Reply-To: <1568e064-606e-4f56-951f-429a87a3a2d9@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxduQLhYlkyW0aAA--.9439S3
X-CM-SenderInfo: 5phqw55lqjy33q6o00pqjv00gofq/1tbiAQACDGSIXIIXpwABsM
X-Coremail-Antispam: 1Uk129KBj9xXoWrurW3ZrWUJr1DWF1kGFW7trc_yoWxAFX_uF
	4rWFn2ywnxCr4qq3yrGr4DXr4IkF1ayFn3Kw1Y93W3AF1xGa92kFykXr1ru393Za95JasI
	v395X3say3y7ZosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbxkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AK
	xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8l38UUU
	UUU==


On 2023/6/13 03:06, Mark Brown wrote:
> On Mon, Jun 12, 2023 at 05:00:46PM +0800, YingKun Meng wrote:
>
>> +	if (ls_card->mclk_fs) {
>> +		mclk = ls_card->mclk_fs * params_rate(params);
>> +		ret = snd_soc_dai_set_sysclk(cpu_dai, 0, mclk,
>> +					     SND_SOC_CLOCK_OUT);
>> +		if (ret < 0) {
>> +			dev_err(codec_dai->dev, "cpu_dai clock not set\n");
>> +			return ret;
>> +		}
> Does this need to be in the machine driver - this isn't configuring an
> external clock, it's just within the SoC, so presumably the driver for
> the SoC DAI can just set itself up.


I think so. The driver for the SoC DAI cannot obtain the MCLK frequency of
I2S bus from the clock subsystem.

