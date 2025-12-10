Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 792CE3009E5
	for <loongarch@lists.linux.dev>; Wed, 10 Dec 2025 08:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765353620; cv=none; b=uClMXr6KEIAXBVXMOF/Brf3z6bme5GZVZ88bJl0vcG/wPLJvnxygBhjgubNBHd/9b0Q1FkUWFh/DL2repdoL+sUEkoAye+nRpOx7Qi2wmJHG4jzRWa7fMsSBzIVeSG4xrk/v10687JLMd5euh4fQqd0IYTwRKAs/7AeSpEK14FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765353620; c=relaxed/simple;
	bh=pvn0Vc4sY8pJyc2+s5a4nJKl1iCKQ/xtJmAIFkrzS+o=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=NO8j1U1TJtbOysBvnf9nAmut4x6P+K4DjvlcK1Hh5tKlsHJfaiFahThcO3KKgTs3x0xdc9ztTOYFybz4Y/SARy+QYWDwQ7UZx3JzpwaDoDQFhdFKWnXO8T3Af5yKmUTqTvvAJ5seZGrz0HEvg/4ZZzbmm9wcHe2cwaxZwgMLsuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Cx6tGDKDlpYe0sAA--.32053S3;
	Wed, 10 Dec 2025 16:00:04 +0800 (CST)
Received: from [10.130.40.83] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJCxH8KCKDlpx7tHAQ--.3707S3;
	Wed, 10 Dec 2025 16:00:03 +0800 (CST)
Subject: Re: [PATCH v1] LoongArch: Remove unnecessary checks in bt_address()
To: Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20251209061809.15994-1-yangtiezhu@loongson.cn>
 <CAAhV-H6zjWXjjuoOkRov4886E82QRH=3NnkhP2e4hroSJr1UXg@mail.gmail.com>
 <92bf0e88-da14-20ce-137a-3e7777e19af3@loongson.cn>
 <ba1494da-a407-3acb-a5d1-8fbd9498b6c6@loongson.cn>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <a1674623-4c08-1f4d-3e4e-5511b579e9ea@loongson.cn>
Date: Wed, 10 Dec 2025 16:00:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ba1494da-a407-3acb-a5d1-8fbd9498b6c6@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxH8KCKDlpx7tHAQ--.3707S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Wryruw17Gry8WF4rGF1xWFX_yoW8AFWDpr
	97KFyUWFyDGr18JrsrKr10qryYyrnxJ3WUWr1UJFn8Gr1qqr12vF1Uuw1jgr1Utr48Xw48
	Ar18Zr47Zay5JFgCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw
	1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jb
	_-PUUUUU=

On 2025/12/10 上午10:25, Bibo Mao wrote:
> 
> 
> On 2025/12/10 上午9:28, Tiezhu Yang wrote:
>> On 2025/12/9 下午4:30, Huacai Chen wrote:
>>> Hi, Tiezhu,
>>>
>>> On Tue, Dec 9, 2025 at 2:18 PM Tiezhu Yang <yangtiezhu@loongson.cn> 
>>> wrote:
>>>>
>> ...
>>>>          extern unsigned long eentry;
>>>>
>>>> -       if (__kernel_text_address(ra))
>>>> -               return ra;
>>>> -
>>>> -       if (__module_text_address(ra))
>>>> -               return ra;
>>> I think the correct way is to remove the __module_text_address()
>>> condition but keep the __kernel_text_address() condition. Then return
>>> 0 at the end of this function, and remove the __kernel_text_address()
>>> condition out of this function.
>>
>> It can not remove the check of __kernel_text_address() after calling
>> bt_address() because it needs to validate the calculated address for
>> exception, then no need to keep the __kernel_text_address() condition
>> in bt_address() because it will check the PC outside bt_address().
>          state->pc = bt_address(pc);
>          if (!state->pc) {
>                  pr_err("cannot find unwind pc at %p\n", (void *)pc);
>                  goto err;
>          }
> 
>          if (!__kernel_text_address(state->pc))
>                  goto err;
> I guess that you both comes from different views :) one treats these 
> piece of code into one, one only views function bt_address().
> 
> Especially with if (!state->pc), how could this happen?

IMO, state->pc will be not 0 forever in practice, this check is just an
error path and can be removed too if possible.

Thanks,
Tiezhu

