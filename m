Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52EAC1A267
	for <loongarch@lists.linux.dev>; Mon, 15 Sep 2025 08:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757926106; cv=none; b=MfxKKn/n9i6iiTM4kYDZOUpW+dRJUS8/2LZpKlxHITRxQ1Xd7sR9PwwxTaU1go5jdn4ToDU5vjuqXu6xMxss3Y2vU/PVL3Sx92GguCBUXTv621yB5dZSki5QMlJ2laMY9MRBbVnUzJ/46SXdTEARlAPj/zYNBPKL2yJ2jFegQYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757926106; c=relaxed/simple;
	bh=LBmWcJyeHzo3TXNkMja5Tk62h8BTmwr6j9mQmrCb43c=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=JJpqF7I8+fVI6HEQ5b4AR9dorug8fm5aSqFpFrvN0OdBBF3PZrVXY2bmhBJwgjfVOWXhmIE44QWpqz8SWd/J52T+ECoBZXwr/kw8yS4HRo9v9oE2YIZkf9Io1khmbq/ljKiJ4daossl0o7d7luUpy1R1bhwvwROJaAW4BkC3RY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxB9HU0sdoSXUKAA--.22245S3;
	Mon, 15 Sep 2025 16:48:20 +0800 (CST)
Received: from [10.130.10.66] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJCxH8LS0sdod++WAA--.33937S3;
	Mon, 15 Sep 2025 16:48:19 +0800 (CST)
Subject: Re: [PATCH v1 2/2] LoongArch: Return 0 for user tasks in
 arch_stack_walk_reliable()
To: Miroslav Benes <mbenes@suse.cz>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>, Xi Zhang <zhangxi@kylinos.cn>,
 live-patching@vger.kernel.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250909113106.22992-1-yangtiezhu@loongson.cn>
 <20250909113106.22992-3-yangtiezhu@loongson.cn>
 <alpine.LSU.2.21.2509111541590.29971@pobox.suse.cz>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <2b3235b7-87a5-9146-9f31-4668dda207b2@loongson.cn>
Date: Mon, 15 Sep 2025 16:48:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <alpine.LSU.2.21.2509111541590.29971@pobox.suse.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxH8LS0sdod++WAA--.33937S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7JF1kuF15CFWrWr43Gw43twc_yoWDArb_Zw
	nrAFykuw1jqanxAw48tay5ArZ0kw4Fyry8XrZ5tr1ay3s3Z348Jrs7Kr97uasxJr4qyFnx
	Krn8JrWSyryS9osvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbxkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8j-e5UU
	UUU==

On 2025/9/11 下午9:44, Miroslav Benes wrote:
> Hi,
> 
> On Tue, 9 Sep 2025, Tiezhu Yang wrote:
> 
>> When testing the kernel live patching with "modprobe livepatch-sample",
>> there is a timeout over 15 seconds from "starting patching transition"
>> to "patching complete", dmesg shows "unreliable stack" for user tasks
>> in debug mode. When executing "rmmod livepatch-sample", there exists
>> the similar issue.
>>
>> Like x86, arch_stack_walk_reliable() should return 0 for user tasks.
>> It is necessary to set regs->csr_prmd as task->thread.csr_prmd first,
>> then use user_mode() to check whether the task is in userspace.
> 
> it is a nice optimization for sure, but "unreliable stack" messages point
> to a fact that the unwinding of these tasks is probably suboptimal and
> could be improved, no?

Yes, makes sense, I will fix "unreliable stack" in the next version.

> It would also be nice to include these messages (not for all tasks) to the
> commit message.

OK, will do it.

Thanks,
Tiezhu

