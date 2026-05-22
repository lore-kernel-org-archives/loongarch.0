Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 661A81D63F3
	for <loongarch@lists.linux.dev>; Fri, 22 May 2026 03:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779421583; cv=none; b=mwHwLprmMGgoiN3rOGgeVdbJWLYlabDZXE6XzDcqKJU566RMALqh0YwXIjnYNL0flKEJ/X03PbViLSH7uX9NaUXMljT56Q2KZfFCpAO9Og+e7BEZBQsn/TB/NOAqKvsp3dRvS8Co7NY0wgUa4kDt4w4soAQowAAeJ1c37yuS4T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779421583; c=relaxed/simple;
	bh=M0XmnJv53KNUcwwsi7tWGFt+AcUS34x3Doz/+8739w0=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=G3EwVIDlv8zWPdX4qHKEfN4GrOqcKTgHtsHcSBsKm5BA62B1MmkeWEhGnwEUojkexqbbVPIuxddhgYVriGz199HZR+K9+Gkj/ywltsfypp9R6egDieAtqzBka5HpjbU0v+sjNhoyW+f1fOP6SmtlFcs7TS5qMJKrcuTxKNmxY2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.164])
	by gateway (Coremail) with SMTP id _____8BxzemI0Q9qNEMMAA--.34017S3;
	Fri, 22 May 2026 11:46:16 +0800 (CST)
Received: from [10.20.42.164] (unknown [10.20.42.164])
	by front1 (Coremail) with SMTP id qMiowJBxrsKB0Q9qvjyMAA--.62394S2;
	Fri, 22 May 2026 11:46:11 +0800 (CST)
Subject: Re: [PATCH] crypto: loongson - Select CRYPTO_RNG
To: Eric Biggers <ebiggers@kernel.org>, Huacai Chen <chenhuacai@kernel.org>
Cc: linux-crypto@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 Yinggang Gu <guyinggang@loongson.cn>, Lee Jones <lee@kernel.org>,
 kernel test robot <lkp@intel.com>, stable@vger.kernel.org
References: <20260522022525.12976-1-ebiggers@kernel.org>
 <CAAhV-H5cDnWKxBobwRErRyvG8671e6VXsBe6w1RkX9rfn7CVFA@mail.gmail.com>
 <20260522025722.GD5937@quark>
From: Qunqin Zhao <zhaoqunqin@loongson.cn>
Message-ID: <d71adfa1-8895-e741-b72f-c5e99d5fb9e6@loongson.cn>
Date: Fri, 22 May 2026 11:41:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260522025722.GD5937@quark>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowJBxrsKB0Q9qvjyMAA--.62394S2
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWrKF13CrW8AF4ktryxJw1rKrX_yoW8Jry3pa
	y3G3WUCFs8GrWfCanFg3Wxuas0kws3ZrW3KFWUC34Yvrs0vr1UXr1IgFZxWa4qyryFkrW7
	Kr98t3yY9a4UCacCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU92b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4
	CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAF
	wI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zV
	AF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4l
	IxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCw
	CI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVF
	xhVjvjDU0xZFpf9x07j1WlkUUUUU=


在 2026/5/22 上午10:57, Eric Biggers 写道:
> On Fri, May 22, 2026 at 10:52:42AM +0800, Huacai Chen wrote:
>> On Fri, May 22, 2026 at 10:26 AM Eric Biggers <ebiggers@kernel.org> wrote:
>>> This driver registers a rng_alg, so it requires CRYPTO_RNG.
>>>
>>> Fixes: 766b2d724c8d ("crypto: loongson - add Loongson RNG driver support")
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Closes: https://lore.kernel.org/oe-kbuild-all/202605201622.qWOiiZTV-lkp@intel.com/
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
>> Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
>>> ---
>>>   drivers/crypto/loongson/Kconfig | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
> By the way, do any of the loongson people have any comment on what they
> think the point of this driver is?  It's not registered with the actual

To provide an AF_ALG-based random number generation interface for other 
modules and user-space programs.

Thanks,

Qunqin

> hwrng subsystem, but rather the pointless crypto_rng system which no one
> uses.  So if it was intended to provide entropy for /dev/urandom etc.,
> that isn't what it's doing.

>
> Can we just delete this driver?
>
> - Eric

