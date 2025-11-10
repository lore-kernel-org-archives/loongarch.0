Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D7CD26F467
	for <loongarch@lists.linux.dev>; Mon, 10 Nov 2025 12:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762777481; cv=none; b=DiTnD4y1z7wTxRFZ+kl5AYF6xzzzocOXNA2RSm+r1uueWGBajBb+e44UM2zFQJpv5tHYO9bAvlCBptPnqNHibCts4MKx71rf65WgJFvXrA2nfXlNOwMRWz5YwoKLqGW7u1budPsIT0SxbABFDR+rkn7tjStD+9AV+XiMHKj3riE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762777481; c=relaxed/simple;
	bh=5F52AzEPXsCHU2TlETR3GM8Gqw/rYkrelJ/fFBb3pdo=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=Qb8bccdxCuLNOWACAFFwpdP/fbtRjaZgz53RYNWv81tSjwkSOKY9MLR0tQqyVreYQJ8qFciydJYjouCEPioZ97hEJp8lTF/knfDjXK66TkeRJQYA9rsTBb3ITW+bbU0V8u9hluBHjkVtZQ1ZGzpDjlrMKFhxW0ci3uE5dGEBETU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.10.40.23])
	by gateway (Coremail) with SMTP id _____8BxT_B82RFpWXchAA--.6422S3;
	Mon, 10 Nov 2025 20:24:28 +0800 (CST)
Received: from [10.10.40.23] (unknown [10.10.40.23])
	by front1 (Coremail) with SMTP id qMiowJCxG8F52RFpzx0uAQ--.32684S3;
	Mon, 10 Nov 2025 20:24:25 +0800 (CST)
Subject: Re: [PATCH v2 0/2] LoongArch: Refine init_hw_perf_events()
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 akpm@linux-foundation.org, vishal.moola@gmail.com, arnd@arndb.de
References: <20251110025906.17096-1-yangtiezhu@loongson.cn>
 <CAAhV-H4=ZfYfRFE8VYmxyKxTAi8E=YKysG1fzed4kZRWnMUoeA@mail.gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <4deb96d9-509c-3b3f-934f-58de8d29241b@loongson.cn>
Date: Mon, 10 Nov 2025 20:24:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H4=ZfYfRFE8VYmxyKxTAi8E=YKysG1fzed4kZRWnMUoeA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxG8F52RFpzx0uAQ--.32684S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7tFWUuw13AFW7Aw4kZw15WrX_yoW8XFyfpF
	WDAFsI9r4DGrn7ZF4qga18WFyjqF1kWr9IgFy8J3s8uFWDZ3Wvvw18ur4xuF97Xr98KF1j
	qFyfXa4kuFyUA3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j1WlkU
	UUUU=

在 2025/11/10 下午2:48, Huacai Chen 写道:
> V1 was applied last week and now in linux-next, don't do meaningless work.
> 
> Huacai
> 
> On Mon, Nov 10, 2025 at 10:59 AM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>>
>> This version is based on 6.18-rc5, use the proper patch title
>> to make it clear.
>>
>> Tiezhu Yang (2):
>>    LoongArch: Use CPUCFG6_PMNUM_SHIFT to get PMU number
>>    LoongArch: Detect PMU bits via CPUCFG instruction
>>
>>   arch/loongarch/include/asm/loongarch.h | 1 +
>>   arch/loongarch/kernel/perf_event.c     | 7 ++++---
>>   2 files changed, 5 insertions(+), 3 deletions(-)

I do not like to argue with you, but I do not think what you said is
right, there are double standards here.

The code are rebased frequently by you in linux-loongson.git, the latest
is after 6.18-rc5 that is in this week, my patch is also rebased.

You accepted the suggestion of your patch v1 title [1] and send v2 [2]
although v1 has been applied by Andrew, because you think it is a good
suggestion.

I just do the similar and right thing,  but your reply is not polite
and friendly, and also do not do the thing what you should to do as a
maintainer.

[1] 
https://lore.kernel.org/linux-mm/20251108084724.3e389b6597294900347b0476@linux-foundation.org/

[2] 
https://lore.kernel.org/linux-mm/20251109021817.346181-1-chenhuacai@loongson.cn/

[3] 
https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git/commit/?h=loongarch-fixes&id=4c8a7c982772

Thanks,
Tiezhu

