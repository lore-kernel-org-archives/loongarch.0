Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D21551CAA7D
	for <loongarch@lists.linux.dev>; Thu, 20 Feb 2025 11:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740050169; cv=none; b=rMzFNEx5ZLrGMrg53PYImdISmnAR+nDbjGPls7Om3zqZIapzycrm5i4bUnJoQU6oOosXIyliIB8/uGaQ+eMadqdVDd35lTel5F+l0k22wUPtdexSI8WEafwG97jb/mTG+iJe81u1oU4GVcOd5+nAxM+T18EGlLP6KWwKrsRMO5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740050169; c=relaxed/simple;
	bh=tmGgvBNAnq61lJyHREpltjLswH1cV6NcConZTvqEWJ0=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=hZSACKAz65pRi8BrHSGk+wSLwbjM+ETmQRqs7KxkbloCU5bKub0NasOptdC/pTTl0DNMQYIq0SpZOFJTFNG2lTQ1raJFELQ1ZhkO9jAh2rVSt2xJuIaAOR/S7mkTo37Ho7JtZxHzIlMiNvox7n+mbKKfWjE/Xx8/04yLnlQ735g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.164])
	by gateway (Coremail) with SMTP id _____8CxbWvzDrdncTh8AA--.17585S3;
	Thu, 20 Feb 2025 19:16:03 +0800 (CST)
Received: from [10.20.42.164] (unknown [10.20.42.164])
	by front1 (Coremail) with SMTP id qMiowMBxm8TwDrdnwzEeAA--.6689S2;
	Thu, 20 Feb 2025 19:16:02 +0800 (CST)
Subject: Re: [PATCH V3 2/6] MAINTAINERS: Add maintainer for Loongson Security
 Module driver
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: lee@kernel.org, herbert@gondor.apana.org.au, davem@davemloft.net,
 peterhuewe@gmx.de, jarkko@kernel.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-crypto@vger.kernel.org, jgg@ziepe.ca,
 linux-integrity@vger.kernel.org
References: <20250219073214.16866-1-zhaoqunqin@loongson.cn>
 <20250219073214.16866-3-zhaoqunqin@loongson.cn>
 <82eadd04-26ed-4560-9a9d-2a55ab72a84b@molgen.mpg.de>
From: Qunqin Zhao <zhaoqunqin@loongson.cn>
Message-ID: <57261bdc-412d-1f0b-4847-3fd0d4828c55@loongson.cn>
Date: Thu, 20 Feb 2025 19:16:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <82eadd04-26ed-4560-9a9d-2a55ab72a84b@molgen.mpg.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowMBxm8TwDrdnwzEeAA--.6689S2
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7tr13Kw1xGFy7KryDZFykXrc_yoW8Ar4DpF
	1kAanxCr97Kw4Ikws7Ga4Yka45Z3s7Cr17JFnFga4kuasFyw1qqF4j9F1q9FnrXF48Wr4x
	try2yr45uF4UuacCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Eb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17
	McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7
	I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8
	JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14
	v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY
	67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2
	IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_
	Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8hiSPUUUUU==


在 2025/2/19 下午3:48, Paul Menzel 写道:
> Dear Qunqin,
>
>
> Thank you for your patch, and for wanting to maintain this code. Two 
> minor things should you resend:
>
> I found it quite useful to have the maintainer name in the 
> summary/title as often only the `git log --oneline` output is used in 
> change-logs. I suggest:
>
> MAINTAINERS: Add Qunqin Zhao for new Loongson Security Module driver

Hi, Paul,  thanks for your comments.

I took a look at the git log of MAINTAINERS file.  It is rare to put the 
maintainer's name on the title when adding a new entry.

The usual practice should be "Add entry for Loongson Security Module 
driver".

>
> Am 19.02.25 um 08:32 schrieb Qunqin Zhao:
>> This patch adds an entry for Loongson Security Module driver in the list
>> of Maintainers.
>
> Maintainers could be spelled lowercase.

OK.

BR, Qunqin.

>
>> Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>
>> ---
>>   MAINTAINERS | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 5583df569c..cd6c029398 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -13494,6 +13494,13 @@ S:    Maintained
>>   F: Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml
>>   F:    drivers/i2c/busses/i2c-ls2x.c
>>   +LOONGSON SECURITY MODULE DRIVER
>> +M:    Qunqin Zhao <zhaoqunqin@loongson.cn>
>> +L:    loongarch@lists.linux.dev
>> +S:    Maintained
>> +F:    drivers/mfd/ls6000se.c
>> +F:    include/linux/mfd/ls6000se.h
>> +
>>   LOONGSON-2 SOC SERIES CLOCK DRIVER
>>   M:    Yinbo Zhu <zhuyinbo@loongson.cn>
>>   L:    linux-clk@vger.kernel.org
>
>
> Kind regards,
>
> Paul

