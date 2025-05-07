Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA35979E1
	for <loongarch@lists.linux.dev>; Wed,  7 May 2025 01:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746581745; cv=none; b=UWhiUcBKN9dv9e2MSFo18VYqPut3FdLnkfGYTXfSh+vIM0XfmGY0rYJt3lGjUN+HdGDZPSqf+GwIv9OouBma+dJNymynsOjZXYo+aLqwTdY5QRbwdk9GqnY5Xxj2kxyNDeMWHs96lU3c32/G5hCs1+L/sev5H0zd96mmKayxAWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746581745; c=relaxed/simple;
	bh=zgD0KtQ6+c4Xt135Y5OUFoybXsZd/9SqcHvNmny7ARQ=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=Kf0JA4XcUehnTq25kcCzvcKFSxXSrOwMzyD8sHHrXGj2M1dB9bMR3y9OhDriHQdDWq8dXv9pMTT1vTfd/a708eIpFy/GBNcsz69Z/PJbVX5xkYd6LI3esZnKrn6BnNlArh/uC9LAyTxf+CuQ+pDr0f2wqqCeVYD5jMIsz0PXsk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.164])
	by gateway (Coremail) with SMTP id _____8CxieDquBpoEI_XAA--.47789S3;
	Wed, 07 May 2025 09:35:38 +0800 (CST)
Received: from [10.20.42.164] (unknown [10.20.42.164])
	by front1 (Coremail) with SMTP id qMiowMAxTsXduBpoXMO4AA--.49926S2;
	Wed, 07 May 2025 09:35:28 +0800 (CST)
Subject: Re: [PATCH v9 4/5] tpm: Add a driver for Loongson TPM device
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: lee@kernel.org, herbert@gondor.apana.org.au, davem@davemloft.net,
 peterhuewe@gmx.de, jarkko@kernel.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-crypto@vger.kernel.org, jgg@ziepe.ca,
 linux-integrity@vger.kernel.org, pmenzel@molgen.mpg.de,
 Yinggang Gu <guyinggang@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>
References: <20250506031947.11130-1-zhaoqunqin@loongson.cn>
 <20250506031947.11130-5-zhaoqunqin@loongson.cn>
 <2nuadbg5awe6gvagxg7t5ewvxsbmiq4qrcrycvnrmt2etzq2ke@6oyzavctwrma>
From: Qunqin Zhao <zhaoqunqin@loongson.cn>
Message-ID: <0b148f09-d20d-b6be-d31b-6c8a553658c9@loongson.cn>
Date: Wed, 7 May 2025 09:33:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <2nuadbg5awe6gvagxg7t5ewvxsbmiq4qrcrycvnrmt2etzq2ke@6oyzavctwrma>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowMAxTsXduBpoXMO4AA--.49926S2
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7uw4DJr43GF43AFyfWrW3urX_yoW8Xw4DpF
	WfCa1UGFs8Kr18CwsrJrWfZry3ZrZ5XFWDXFWDA347Crn8Awn5J34UZr4vv3WDAF48Gw1I
	vFWI9rWF93Z8uFgCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
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


在 2025/5/6 下午10:13, Stefano Garzarella 写道:
> On Tue, May 06, 2025 at 11:19:46AM +0800, Qunqin Zhao wrote:
>> Loongson Security Engine supports random number generation, hash,
>> symmetric encryption and asymmetric encryption. Based on these
>> encryption functions, TPM2 have been implemented in the Loongson
>> Security Engine firmware. This driver is responsible for copying data
>> into the memory visible to the firmware and receiving data from the
>> firmware.
>>
>> Co-developed-by: Yinggang Gu <guyinggang@loongson.cn>
>> Signed-off-by: Yinggang Gu <guyinggang@loongson.cn>
>> Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>
>> Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
>> Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
>> ---
>> v9: "tpm_loongson_driver" --> "tpm_loongson"
>>    "depends on CRYPTO_DEV_LOONGSON_SE" --> "depends on MFD_LOONGSON_SE"
>>
...
>> +static int tpm_loongson_recv(struct tpm_chip *chip, u8 *buf, size_t 
>> count)
>> +{
>> +    struct loongson_se_engine *tpm_engine = 
>> dev_get_drvdata(&chip->dev);
>> +    struct tpm_loongson_cmd *cmd_ret = tpm_engine->command_ret;
>> +
>> +    memcpy(buf, tpm_engine->data_buffer, cmd_ret->data_len);
>
> Should we limit the memcpy to `count`?
>
> I mean, can happen that `count` is less than `cmd_ret->data_len`?

Hi, Stefan, thanks for your comment.

Firmware ensures "cmd_ret->data_len" will be less than TPM_BUFSIZE,  so 
this would never happen.

BR, Qunqin.

>
> Thanks,
> Stefano

