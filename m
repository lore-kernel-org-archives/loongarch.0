Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D337E2F2E
	for <loongarch@lists.linux.dev>; Mon, 10 Feb 2025 06:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739167671; cv=none; b=t657D0QxiyMy+u7ThOiKOXKGU7GKu+cXevLq1kJiI7ITFQUcg9ogBEYeMVSHAwbTMSRw2mbb1MKLCpdqMgbw4AxG5NlzajlX0xxTAFAVL4OGkVs2H93+gNApjSeia5ipGLpP5P05cz570wuQnt1S+RwSfzdR6BGRgzr6zaX0GR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739167671; c=relaxed/simple;
	bh=2ckOBtZ0SayfkUiAGTScq7nP6Ree1sZ/P3eqOOPh5i4=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=pSY9vsT1EoEVE4gopsXkpkkvrUDillbJ002vUzgr6h9VLFzxhONpqoTH530DesmanmU8gDFmLLbXkM8DYIAXdFHnxd4GA0hUJaDHpA2clKUrhPREyaqBlwbWF6n/m25GsafguYkaQdFPpZYdHgjY/x+k1fhs/hfC4aZbhSu84aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Bx7eKxl6ln3PlwAA--.26729S3;
	Mon, 10 Feb 2025 14:07:45 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMCxPsevl6lnzsAJAA--.38660S3;
	Mon, 10 Feb 2025 14:07:44 +0800 (CST)
Subject: Re: [PATCH v6 0/9] Add jump table support for objtool on LoongArch
To: Josh Poimboeuf <jpoimboe@kernel.org>
References: <20241217010905.13054-1-yangtiezhu@loongson.cn>
 <ef1e3e7c-0117-175c-5a85-091382696748@loongson.cn>
 <20250115013444.anzoct6gvs56m225@jpoimboe>
Cc: Huacai Chen <chenhuacai@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, loongarch@lists.linux.dev,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <4612bfd8-442e-fecb-240f-46e735b48540@loongson.cn>
Date: Mon, 10 Feb 2025 14:07:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250115013444.anzoct6gvs56m225@jpoimboe>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowMCxPsevl6lnzsAJAA--.38660S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7ur4Uur45Zw4ktrW5uF4rZwc_yoW8GrykpF
	W5GFW29F4kJrWUX3WkKw1agFySqw4ftr1xXr45WrW5Aa1qq3W5tr4fZw4YgFWqgr4YvFyI
	ya1fJa4q9F4DArXCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw
	1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zw
	Z7UUUUU==

On 01/15/2025 09:34 AM, Josh Poimboeuf wrote:
> On Sat, Jan 11, 2025 at 02:57:42PM +0800, Tiezhu Yang wrote:
>> Hi Josh and Peter,
>>
>> On 12/17/2024 09:08 AM, Tiezhu Yang wrote:
>>> This version is based on tip/tip.git objtool/core branch [1], add some weak
>>> and arch-specific functions to make the generic code more readable, tested
>>> with the latest upstream mainline Binutils, GCC and Clang.
>>
>> ...
>>
>>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/log/?h=objtool/core
>>>
>>> Tiezhu Yang (9):
>>>   objtool: Handle various symbol types of rodata
>>>   objtool: Handle different entry size of rodata
>>>   objtool: Handle PC relative relocation type
>>>   objtool: Handle unreachable entry of rodata
>>>   objtool/LoongArch: Add support for switch table
>>>   objtool/LoongArch: Add support for goto table
>>>   LoongArch: Enable jump table for objtool
>>>   LoongArch: Convert unreachable() to BUG()
>>>   drm/amd/display: Mark dc_fixpt_from_fraction() noinline
>>
>> Are you OK with the first 8 patches?
>> What's the merge plan for this series?
>
> Sorry, my inbox is still reeling from the holidays.  I will review this
> soon.

What are the status of the first 8 patches?
What is the next step? Is there anything else to be done here?
I would really appreciate any advice on how to get this merged.

Thanks,
Tiezhu

