Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BF371A5BB4
	for <loongarch@lists.linux.dev>; Sun, 14 Dec 2025 13:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765718127; cv=none; b=rX2MxMvx70ZeL1XbD5Y0h9zoThimrxNmgS9L7z3kkp3crFlwdrgmPOAXoIcgwEFbNTFpTk7gEE5+pTSVm92EWZ/GZlvYlt0m/4oLKE+lwfchIEMng2vJgsJQEMy+qOlQolsHdiiwu1/HL8nju5uQcb56yBpVafFpL92H6lhDI/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765718127; c=relaxed/simple;
	bh=wMNQY7wHVtz3KGb1+B1JRbL927bt3/UHSXKPbQq3CuM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pcv/szK34d6m8swbj7Wf0Vo+dNVQzciaNCaR8D0gD0jFzh5VQDeu8U5KSPK8PmKcAjwXUVggU1JitN2CDGzow9sO/rIBGRQThYI7koaQDaYl/RuY+4+KkfuVvBXPxakzajHQjPab7kFIWe5B/UBcW2iu+uZw+b4WRtjyaLF2m2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [117.22.160.58])
	by gateway (Coremail) with SMTP id _____8CxHvBouD5pswsuAA--.33395S3;
	Sun, 14 Dec 2025 21:15:20 +0800 (CST)
Received: from [192.168.0.111] (unknown [117.22.160.58])
	by front1 (Coremail) with SMTP id qMiowJDxqcBkuD5pij9JAQ--.39739S3;
	Sun, 14 Dec 2025 21:15:20 +0800 (CST)
Message-ID: <87eac880-d1c0-272c-8a9e-98cb4ac8541e@loongson.cn>
Date: Sun, 14 Dec 2025 21:15:29 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v1] LoongArch: Remove unnecessary checks in bt_address()
Content-Language: en-US
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251209061809.15994-1-yangtiezhu@loongson.cn>
 <CAAhV-H6zjWXjjuoOkRov4886E82QRH=3NnkhP2e4hroSJr1UXg@mail.gmail.com>
 <92bf0e88-da14-20ce-137a-3e7777e19af3@loongson.cn>
 <ba1494da-a407-3acb-a5d1-8fbd9498b6c6@loongson.cn>
 <a1674623-4c08-1f4d-3e4e-5511b579e9ea@loongson.cn>
 <CAAhV-H4UpzqUiEi7Qfc2qtU1hm=yR9hYfaUGfrAtQssrk6qWOA@mail.gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
In-Reply-To: <CAAhV-H4UpzqUiEi7Qfc2qtU1hm=yR9hYfaUGfrAtQssrk6qWOA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxqcBkuD5pij9JAQ--.39739S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Ar15JFyfJFW5uF18Zr1fAFc_yoW5Jry7pF
	yxGayUWFZrKrWUGrsFgr1Fqryayr9xXF10gr4DGFn5C3Z0vr1fCF4UC3y5ua48tr18Wa18
	Zw4jyFZxAayYyFgCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j8yCJU
	UUUU=

On 12/13/25 20:24, Huacai Chen wrote:
> On Wed, Dec 10, 2025 at 4:00 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>>
>> On 2025/12/10 上午10:25, Bibo Mao wrote:
>>>
>>>
>>> On 2025/12/10 上午9:28, Tiezhu Yang wrote:
>>>> On 2025/12/9 下午4:30, Huacai Chen wrote:
>>>>> Hi, Tiezhu,
>>>>>
>>>>> On Tue, Dec 9, 2025 at 2:18 PM Tiezhu Yang <yangtiezhu@loongson.cn>
>>>>> wrote:
>>>>>>
>>>> ...
>>>>>>           extern unsigned long eentry;
>>>>>>
>>>>>> -       if (__kernel_text_address(ra))
>>>>>> -               return ra;
>>>>>> -
>>>>>> -       if (__module_text_address(ra))
>>>>>> -               return ra;
>>>>> I think the correct way is to remove the __module_text_address()
>>>>> condition but keep the __kernel_text_address() condition. Then return
>>>>> 0 at the end of this function, and remove the __kernel_text_address()
>>>>> condition out of this function.
>>>>
>>>> It can not remove the check of __kernel_text_address() after calling
>>>> bt_address() because it needs to validate the calculated address for
>>>> exception, then no need to keep the __kernel_text_address() condition
>>>> in bt_address() because it will check the PC outside bt_address().
>>>           state->pc = bt_address(pc);
>>>           if (!state->pc) {
>>>                   pr_err("cannot find unwind pc at %p\n", (void *)pc);
>>>                   goto err;
>>>           }
>>>
>>>           if (!__kernel_text_address(state->pc))
>>>                   goto err;
>>> I guess that you both comes from different views :) one treats these
>>> piece of code into one, one only views function bt_address().
>>>
>>> Especially with if (!state->pc), how could this happen?
>>
>> IMO, state->pc will be not 0 forever in practice, this check is just an
>> error path and can be removed too if possible.
> bt_address() return ra both in "good path" and "bad path" is strange.
> I still suggest using my method, but move __kernel_text_address()
> after the "if (ra >= eentry && ra < eentry +  EXCCODE_INT_END *
> VECSIZE)" block to verify the modified ra.

I am OK if you mean like this:

static inline unsigned long bt_address(unsigned long ra)
{
	extern unsigned long eentry;

	if (ra >= eentry && ra < eentry +  EXCCODE_INT_END * VECSIZE) {
		...
		ra = func + offset;
	}

	if (__kernel_text_address(ra))
		return ra;

	return 0;
}

bool unwind_next_frame(struct unwind_state *state)
{
	...
	state->pc = bt_address(pc);
	if (!state->pc) {
		pr_err("cannot find unwind pc at %p\n", (void *)pc);
		goto err;
	}

	return true;
	...
}

If so, I will send v2 later.

Thanks,
Tiezhu

