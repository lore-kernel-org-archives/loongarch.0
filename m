Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F437347C7
	for <loongarch@lists.linux.dev>; Fri, 22 May 2026 03:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779418946; cv=none; b=sXlJyYNoBRmMTLyDQxp9Fci2pznb2oRq4wFZfV2Ngjssn2chsWcFhCDLztYHIILSBOgBWCNU0/uzok2G/eShvfsWuxYVW9eOak+p/u8gtLtIzpzBEMwQZo27h492MnOEkK02JR66oEbmuPAYrys8poBfZo3Ad8I+L62bqLy+LG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779418946; c=relaxed/simple;
	bh=kAmoLhl6uNSWIiJmSgULRj1hIoNOKKag7z2GoRgPQDA=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=IBL84Wr3vKUdBwE6b3kc8TYYpb1cAuvOZ07EzUmnNJz5LU7Idhr63+D2QWIy6mQ8I49GngGQv31K0VNDb652guz6NOOzoSyB3RKJDPEnJ6zlSGNL2BEBxxbF8rNvXF397fY6AVabjm2LUr00tuPXfj7YE7UnEzgCWs19AIrFnuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Bxt3g4xw9q0UAMAA--.11095S3;
	Fri, 22 May 2026 11:02:16 +0800 (CST)
Received: from [10.130.40.83] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJCxGOA1xw9qLDeMAA--.3587S3;
	Fri, 22 May 2026 11:02:14 +0800 (CST)
Subject: Re: [PATCH v1 0/4] Fix ftrace and kprobes issues for LoongArch
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Lisa Robinson <lisa@bytefly.space>, WANG Rui <r@hev.cc>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260512082029.2131-1-yangtiezhu@loongson.cn>
 <e7100f76-01f4-0dce-f774-045163d10f30@loongson.cn>
 <CAAhV-H7aR3NBpTk8Nbg0bphuXoDXa+xjo=bMLbrApm-SwvJYOw@mail.gmail.com>
 <CAAhV-H7LcrUY0rKV7Q6XZs2U6K_DEo0ammbiEBf=YsJ1-tVfYw@mail.gmail.com>
 <dc609ede-d955-c907-fad9-13e3ddb8a784@loongson.cn>
 <CAAhV-H57233=4Sr+yRDsxp6WaTiDj3OdBqG34WE5dR+HLE_5mg@mail.gmail.com>
 <c4e4cd61-b909-dfb8-c265-437b86d6c2e7@loongson.cn>
 <CAAhV-H4bLHQo7tkZt2j_=cai03wFKubV9Bg8LeCshz=ZQEmdag@mail.gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <a52b3ffc-a5bd-b119-3587-1109c8630a95@loongson.cn>
Date: Fri, 22 May 2026 11:02:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H4bLHQo7tkZt2j_=cai03wFKubV9Bg8LeCshz=ZQEmdag@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxGOA1xw9qLDeMAA--.3587S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWruFWfZw1fAr17tr43CF1Dtwc_yoW8JrW5pr
	sIya40yaykGw1xZrsF93WvqFy3Zr1DJry8JrZ7KF15Aw15Gw1rtryIvF47GFWUur1v9w4F
	9r4vqa97ua4kAFcCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Fb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AK
	xVWUtVW8ZwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
	AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI
	42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMI
	IF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2
	KfnxnUUI43ZEXa7IU8zwZ7UUUUU==

On 2026/5/22 上午10:40, Huacai Chen wrote:
> On Fri, May 22, 2026 at 10:17 AM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>>
>> On 2026/5/21 下午8:52, Huacai Chen wrote:
>>> On Thu, May 21, 2026 at 10:37 AM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>>
>> ...
>>
>>> OK, but I want to remove preempt_enable_no_resched() in Patch#4
>>> because all other architectures have no.
>>
>> As the commit message said, this is to balance the preemption count.
>>
>> We don't want to be preempted for the entire duration of kprobe
>> processing, preempt_disable() is called at the start of
>> kprobe_breakpoint_handler(), so preempt_enable_no_resched()
>> should also be called at each exit path.
> You are entering the panic path, who cares about preemption at this
> point? On the other hand, keeping preemption disabled is better,
> because nobody wants the "last state" to be corrupted by preemption.

If you look at it from this angle, no objection from me.

If there are no objections from the other people, you can
remove the code and the description in the commit message.

"2. Balancing the preemption count with preempt_enable_no_resched() to
    maintain preemption balance before the system halts."

Thanks,
Tiezhu

