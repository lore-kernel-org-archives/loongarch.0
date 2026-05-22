Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCA8C1E2834
	for <loongarch@lists.linux.dev>; Fri, 22 May 2026 06:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779432347; cv=none; b=qChgmQYnL+wnpNApNKJEk/WECzMtE6+5mSnvKJA18fvGd0PL0X55lOnmJN41VjJgDwkopMZiYaUn0Ru6vgLMitVx15vOMC6bFQYcV8uFmqOQK6WNNWpu4T5t7xHxhTDXX8K+YFjEY/npfVkuq3b3Kt325s5ZWinoMmceSqI1WI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779432347; c=relaxed/simple;
	bh=NEAJcMATb6PnnmILQbJ6cbR5u4L0C5MRxeUZ1TwkXWE=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=k1AE8E+UxnjIaPFJZ+ZmdZbzGyu4b5rg+UVlKJNza0OHvhZZ2KQAqYunwosbaLnu5M2PgLQuBEPkb7T7J1J2k3xWNbuX6gYWaH0R7DFvzMX8mEN3Dr7oR2rLN1udw7UVYuJGJKWz7sNovb50z+lpJyCgpAWxmPECllbdZAR9DN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.164])
	by gateway (Coremail) with SMTP id _____8Bxt3iP+w9qJksMAA--.11169S3;
	Fri, 22 May 2026 14:45:35 +0800 (CST)
Received: from [10.20.42.164] (unknown [10.20.42.164])
	by front1 (Coremail) with SMTP id qMiowJDxhcCL+w9qrE2MAA--.50900S2;
	Fri, 22 May 2026 14:45:32 +0800 (CST)
Subject: Re: [PATCH] crypto: loongson - Select CRYPTO_RNG
To: Eric Biggers <ebiggers@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>, linux-crypto@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, Yinggang Gu <guyinggang@loongson.cn>,
 Lee Jones <lee@kernel.org>, kernel test robot <lkp@intel.com>,
 stable@vger.kernel.org
References: <20260522022525.12976-1-ebiggers@kernel.org>
 <CAAhV-H5cDnWKxBobwRErRyvG8671e6VXsBe6w1RkX9rfn7CVFA@mail.gmail.com>
 <20260522025722.GD5937@quark>
 <d71adfa1-8895-e741-b72f-c5e99d5fb9e6@loongson.cn>
 <20260522040310.GF5937@quark>
From: Qunqin Zhao <zhaoqunqin@loongson.cn>
Message-ID: <bc3acf15-808d-4141-7f1f-4a7a7f856c6c@loongson.cn>
Date: Fri, 22 May 2026 14:40:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260522040310.GF5937@quark>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowJDxhcCL+w9qrE2MAA--.50900S2
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7ur4xCw4rWryDuFW3Kry5ZFc_yoW8uF13pa
	y7G3WDCF4UtrWS9w1vgw1xWFyY9w4fXrW5uF45J34rZr909F18Xr4IqF4qga4qyrn5Gr17
	trWjqr1aga4UCagCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
	AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8Zw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zw
	Z7UUUUU==


在 2026/5/22 下午12:03, Eric Biggers 写道:
> On Fri, May 22, 2026 at 11:41:15AM +0800, Qunqin Zhao wrote:
>> 在 2026/5/22 上午10:57, Eric Biggers 写道:
>>> On Fri, May 22, 2026 at 10:52:42AM +0800, Huacai Chen wrote:
>>>> On Fri, May 22, 2026 at 10:26 AM Eric Biggers <ebiggers@kernel.org> wrote:
>>>>> This driver registers a rng_alg, so it requires CRYPTO_RNG.
>>>>>
>>>>> Fixes: 766b2d724c8d ("crypto: loongson - add Loongson RNG driver support")
>>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>>> Closes: https://lore.kernel.org/oe-kbuild-all/202605201622.qWOiiZTV-lkp@intel.com/
>>>>> Cc: stable@vger.kernel.org
>>>>> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
>>>> Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
>>>>> ---
>>>>>    drivers/crypto/loongson/Kconfig | 1 +
>>>>>    1 file changed, 1 insertion(+)
>>>>>
>>> By the way, do any of the loongson people have any comment on what they
>>> think the point of this driver is?  It's not registered with the actual
>> To provide an AF_ALG-based random number generation interface for other
>> modules and user-space programs.
>>
>> Thanks,
>>
>> Qunqin
> AF_ALG is a userspace interface; it's not available for in-kernel use.
> If you mean using crypto_rng directly, note that no kernel code actually
> uses it other than the tests, the implementation of AF_ALG, and the
> FIPS-specific code which uses drbg.c specifically.
>
> So, the first half of your justification doesn't make any sense.
>
> As far as the second half: why would a userspace program do that instead
> of just using the regular Linux RNG (/dev/urandom)?
>
> AFAIK, the only reason to use a HW RNG directly is for certification
> reasons.
>
> However, there's also already an interface for that: /dev/hw_random.
>
> So AF_ALG seems completely redundant for this case.

To be honest, I previously assumed that the `hw_random` was designed 
strictly and exclusively for the TRNG mode.

Is it architecturally acceptable or common practice for a PRNG mode to 
utilize `hw_random` as well?

Thanks,

Qunqin

>
> - Eric

