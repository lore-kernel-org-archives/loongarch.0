Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 864DA2E401;
	Fri,  3 Jan 2025 02:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735871213; cv=none; b=cleNNJ4t+60NLguRmOsQxo7K1IYEGi4Gf7KmS7LNMPVNU7A4KoxzHCmUQ+sDRqIFfF4giDwen3X3hWjArj50vCwYo4FiJTLJpGF1dMAvl3LuodTBI+JtF/0veCs8OJRIbSPnvrJqkkq/EYeSpzXwze80Vp/jTAXUqpROtW0jWT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735871213; c=relaxed/simple;
	bh=YBbTTdEA3PpkpouTjoNS6ru/EpuCY6k40UOdzdPEnzc=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=YPfCVo//ZgHaMYoa9dagPIXItufeGsZ9OtJ+4BRAd+v5hb2ELMcYxVXwj+jwrrSHGXXrXlods53RnvFWyHHQUDfN7W0bCu8pRIhPgRQ4KxgX9w0ZnVvY68G6gyJT57/ESG0gYBe2ZeJmcUkRVJ794UDJD9vNWqxuPn8fQNAqqHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.164])
	by gateway (Coremail) with SMTP id _____8CxC+LnSndndXFdAA--.52390S3;
	Fri, 03 Jan 2025 10:26:47 +0800 (CST)
Received: from [10.20.42.164] (unknown [10.20.42.164])
	by front1 (Coremail) with SMTP id qMiowMBxnsfiSndnNQQSAA--.9934S2;
	Fri, 03 Jan 2025 10:26:44 +0800 (CST)
Subject: Re: [PATCH V2 RESEND] soc: loongson: add Loongson Security Module
 driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: arnd@arndb.de, olof@lixom.net, soc@kernel.org, soc@lists.linux.dev,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, xry111@xry111.site,
 christophe.jaillet@wanadoo.fr
References: <20241224072500.15669-1-zhaoqunqin@loongson.cn>
 <f9138082-1d17-4247-b365-7cb4eef88879@kernel.org>
From: Zhao Qunqin <zhaoqunqin@loongson.cn>
Message-ID: <22cb222a-a34d-b2ff-88cf-2e9433aed310@loongson.cn>
Date: Fri, 3 Jan 2025 10:25:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <f9138082-1d17-4247-b365-7cb4eef88879@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowMBxnsfiSndnNQQSAA--.9934S2
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Kw1rAr47Zr17CFWxCry5WrX_yoW8Ar1rpF
	4DtasayFZ8Gr1Skws3tw1IyFyrAayFkr47WFWagr1DZr98Za47XF1fCF45AFsrZryrGFyI
	vFW3G3yqkFs8ZrgCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8xuctUU
	UUU==


在 2024/12/28 下午7:02, Krzysztof Kozlowski 写道:
> On 24/12/2024 08:25, Qunqin Zhao wrote:
>> This driver supports Loongson Security Module, which
>> provides the control for it's hardware encryption
>> acceleration child devices.
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
OK
>> Only ACPI firmware is supported.
>>
>> Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>
> I don't get why you are sending this to soc. This is loongson specific
> and is supposed to go via Loongson maintainers.
>
> And why is this a resend?

There are no platform-specific maintainers, So I initially sent the 
patch to Arnd,

but didn't receive a response from Arnold, so I resent the patch and added

soc@kernel.org to the mailing list.

>> ---
>> Changes in v2:
>> 	- Removed useless memset() in probe.
>> 	- Cleaned up coding style.
>> 	- Corrected the spelling.
>>
>>   MAINTAINERS                        |   7 +
>>   drivers/soc/loongson/Kconfig       |   9 +
>>   drivers/soc/loongson/Makefile      |   1 +
>>   drivers/soc/loongson/loongson_se.c | 523 +++++++++++++++++++++++++++++
>>   include/soc/loongson/se.h          | 135 ++++++++
>
> include/linux/soc/... or just keep it private to the driver. Why this
> has to be exposed to other users?

Looks like  include/linux/soc... is more suitable than include/soc/...

This driver is the base of other users,  one user will be added in next 
revision.

And may I ask which one do you think is more suitable to place this 
basic driver under SOC or MFD ?


Thanks.

> Best regards,
> Krzysztof

