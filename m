Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D608824BBEE
	for <loongarch@lists.linux.dev>; Mon, 17 Aug 2026 04:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786939452; cv=none; b=t7/xP8wqq34eS+OOjAR1o1u7SQ256+kSIjecp2NEgnJbUDoBD4uzjsiMRfPa1GfqCURXsYmuUfuTXtVF/hgvafy7LKIqqc89LOMY6u2GQfbR9DiTyEUr8MF7GixIcYhS8w5HOFcSLAiYwQzKMC1tWurn3myhXU87o5ShMrKiLJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786939452; c=relaxed/simple;
	bh=JMO161agt4UOo1iIL8s2FVGrZ9q+Z0IhgEB0TUpUjCg=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=aBRRNuIgUfViI9L5DuwTiCAJYhKxPNWF1vOR+3bNllWtoBQ+SCCmP8ePbgGw8L1Y9etVXrtHUNmOY6rE7WTT4VHT/hPnop2llOTiXgt7tnGrW1F/1jXZcgpvRU69Ac1BPAHjc3Pb5onf5TsedbqfAliyHbs4W2WtMzqYI/me0wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8BxhvA4iIJq2L0BAA--.5299S3;
	Mon, 17 Aug 2026 12:04:08 +0800 (CST)
Received: from [10.130.40.83] (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJAx3c43iIJqrHsHAA--.49061S2;
	Mon, 17 Aug 2026 12:04:08 +0800 (CST)
Subject: Re: bpf selftests timer_lockup intermittently locks up kernel
To: Vincent Li <vincent.mc.li@gmail.com>, bpf <bpf@vger.kernel.org>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Eduard Zingerman
 <eddyz87@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>,
 loongarch@lists.linux.dev
References: <CAK3+h2xOSEZUHhou7N2cRL-aGrZCNSm45g+P7thObMe+fpgYCA@mail.gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <d06a7557-fb51-2be9-63cd-3269533476b2@loongson.cn>
Date: Mon, 17 Aug 2026 12:04:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAK3+h2xOSEZUHhou7N2cRL-aGrZCNSm45g+P7thObMe+fpgYCA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAx3c43iIJqrHsHAA--.49061S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrurykuF1UGw4rtryxXr4kZrc_yoWftrcEga
	1vyryjyw4rJr4Yy3WDt3WFvF97ta1DXFy8WrW5Jry2qw1SqFWrArsagas0vFyaqF4ktF9x
	WFn5tFyFvry7ZosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbxkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8
	Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU82g43UU
	UUU==

On 2025/8/25 上午2:26, Vincent Li wrote:
> Hi,
> 
> I am running bpf selftests on a Loonarch PC and observed intermittent
> kernel lockup by timer_lockup, then I can repeat the lockup just by
> running the timer_lockup in while loop every 5 seconds, I could not
> find a good x86 machine to test, and I think this might be
> architecture independent. I don't have a good way to capture any
> kernel log messages for the PC after the kernel hangs, and I had to
> power reset the PC.

...

> #458     timer_lockup:FAIL
> Caught signal #11!

I recently spent some time investigating this and
managed to reliably reproduce the issue.

After adjusting some kernel configs and parameters,
I successfully captured the call trace.

The following patch fixes the issue, feel free to
test it:

LoongArch: Fix __smp_mb__{before,after}_atomic()
https://lore.kernel.org/loongarch/20260817035908.460-1-yangtiezhu@loongson.cn/

Thanks,
Tiezhu

