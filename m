Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 280CB21CA1E
	for <loongarch@lists.linux.dev>; Wed, 30 Apr 2025 09:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746004327; cv=none; b=kxbutUzvtmRi/4SlONaJgKWai4B7eYxS3hR9LJ5YRUo1LXmV4jiMwLkOLWi1tFFwdbhR5aCEaJaC9MFEK7FoRGZX4h/DNJEBvfFDtzg1H/sKBOB5GZg+dbBaLsjYDmnr+pLndCXidv8WqCpFDMogrFrpLtCi6uXm244ZIbieoM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746004327; c=relaxed/simple;
	bh=Qk0DryjXIt3ss4um7MXcOMei15BeSthVbi80x1XAoCM=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=k2ahWLqTTKiMZf4iWn8lEK9pop68h/QaFVhRzusee4YTrze8UKhbbYAUE/coQ+COm7YNJ7efJLYu7kKiREgvmSwR6P+7wSNywr0bpIvT06r7g3T5wWQY3dftY1Ti+/cH0qxhwOooA75pJZPs+NYQR5dAfdaSceYKXSMX46eC9sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.164])
	by gateway (Coremail) with SMTP id _____8Bx32tg6RFo_P_KAA--.8958S3;
	Wed, 30 Apr 2025 17:12:00 +0800 (CST)
Received: from [10.20.42.164] (unknown [10.20.42.164])
	by front1 (Coremail) with SMTP id qMiowMAxHsdb6RFocwSgAA--.44342S2;
	Wed, 30 Apr 2025 17:11:57 +0800 (CST)
Subject: Re: [PATCH v8 0/5] Add Loongson Security Engine chip driver
To: Lee Jones <lee@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, jarkko@kernel.org
Cc: davem@davemloft.net, peterhuewe@gmx.de, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-crypto@vger.kernel.org, jgg@ziepe.ca,
 linux-integrity@vger.kernel.org, pmenzel@molgen.mpg.de
References: <20250418093506.1349-1-zhaoqunqin@loongson.cn>
 <CAAhV-H608_ddH0g0gyFCZSTVxYHOBqLXrtGYxZ1eoXX6eCcEuA@mail.gmail.com>
 <75bb29fa-6d77-6f95-eec4-ee183190da17@loongson.cn>
 <aBHc2tT2-Duj3_-A@gondor.apana.org.au>
 <6b7385ce-d8ad-1be9-4503-55460f40fe72@loongson.cn>
 <CAAhV-H6ku=imPGqaFrey6hCMwXSL4Qsoif9Rv=Gko2R1CBtGmw@mail.gmail.com>
 <20250430085809.GD1567507@google.com>
From: Qunqin Zhao <zhaoqunqin@loongson.cn>
Message-ID: <0f2a34ce-3e4b-7dda-4835-34bfd0ef60fc@loongson.cn>
Date: Wed, 30 Apr 2025 17:10:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250430085809.GD1567507@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowMAxHsdb6RFocwSgAA--.44342S2
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7tFy7Cr4rWrW8WrWfKrWrtFc_yoW8Wr1kpF
	47Jay2kF4Dtr4Fk3sFqr48AFyYy3s3tryFgr98Gas5Zas0vFyrAw4UGFWjkFWDZ3W8Jr1j
	vF48AayS9F15ZabCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1D
	McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7
	I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCF
	x2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVW8ZVWrXwC20s026c02F40E14v26r
	1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij
	64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr
	0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j7BMNUUUUU=


在 2025/4/30 下午4:58, Lee Jones 写道:
> On Wed, 30 Apr 2025, Huacai Chen wrote:
>
>> On Wed, Apr 30, 2025 at 4:47 PM Qunqin Zhao <zhaoqunqin@loongson.cn> wrote:
>>>
>>> 在 2025/4/30 下午4:18, Herbert Xu 写道:
>>>> On Wed, Apr 30, 2025 at 04:14:40PM +0800, Qunqin Zhao wrote:
>>>>> Sorry to bother you, may i ask is it fine to move  the Security Engine base
>>>>> driver[Patch v8 1/5] to drivers/crypto ?
>>>>>
>>>>> The base driver uses MFD  interface  to register child device(tpm, rng) , as
>>>>> done in
>>>>>
>>>>> "drivers/iio/common/ssp_sensors/ssp_dev.c" and
>>>>> "drivers/firmware/xilinx/zynqmp.c".
>>>>>
>>>>> Thank you, and I look forward to hearing from you.
>>>> I don't mind at this point in time.  But if this driver were to
>>>> develop features way outside of the Crypto API in future then I
>>>> may change my mind.
>>> Hi, Herbert, thanks for your reply.
>>>
>>> In future it just add child platform devices  name(sm2, sm3, sm4) to
>>> "struct  mfd_cell engines".
>>>
>>>
>>> Hi, Huaci
>>>
>>> Let's go via Herbert's crypto tree for the base driver patch under
>>> drivers/crypto/loongson/,
>>>
>>> What do you think of it?
>> In my opinion drivers/mfd is better, because another user is in
>> drivers/char rather than drivers/crypto.
>>
>> But if moving to drivers/crypto is what Lee Jones wants, then everything is OK.
> You can move the driver, but then you must not reference or use the MFD API.

Then looks like i should move it back to drivers/mfd,  will do that in 
next revision.

Thank you very much for everyone's replies.

BR, Qunqin.

>

