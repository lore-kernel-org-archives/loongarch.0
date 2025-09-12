Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5FF826281
	for <loongarch@lists.linux.dev>; Fri, 12 Sep 2025 01:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757642143; cv=none; b=uvywxxAZGJ7W+ZtePvtUhbYtKRbKI1c4kVidvUSRvXG45GTETWjA2lehPiioJSkAYMde4sPSYDU3ZjesTjFv1sFh0ZbdKZ+iTt9RTLStFOZUQzmpx0R2u8XppIGd5y87e6ksBZbdcBkttH+mo+oI0xU7jE7LxDVsOeHcf/mxf9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757642143; c=relaxed/simple;
	bh=H9ZSg1qLNmfgG5da1MuBDMB+tIbmes91f5CtXTRbkPw=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=szvvEQJQd7bdAovlV8n5nYsNd+7UpPg11wgooYeI+oWqO+83zTudm2+fDioli/Pn1/Vjj7PWvo9ahibwqlhdStydFaYZa93NsMyvWPIxzgGTI94F3R2jxsc6gYwveBIUnxiUDzZsnpKO+wO3XS6Y6kUEucK/A8m6h5nzJ9ULZYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [111.9.175.10])
	by gateway (Coremail) with SMTP id _____8CxbNKXfcNoMXYJAA--.20290S3;
	Fri, 12 Sep 2025 09:55:35 +0800 (CST)
Received: from [10.136.12.26] (unknown [111.9.175.10])
	by front1 (Coremail) with SMTP id qMiowJAxE+SUfcNok06PAA--.64547S3;
	Fri, 12 Sep 2025 09:55:35 +0800 (CST)
Subject: Re: [PATCH v1 2/2] LoongArch: Return 0 for user tasks in
 arch_stack_walk_reliable()
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>, Xi Zhang <zhangxi@kylinos.cn>,
 live-patching@vger.kernel.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250909113106.22992-1-yangtiezhu@loongson.cn>
 <20250909113106.22992-3-yangtiezhu@loongson.cn>
 <5e45a1a9-4ac3-56ee-1415-0b2128b4ed9a@loongson.cn>
 <c3431ce4-0026-3a05-fa50-281cd34aba4e@loongson.cn>
From: Jinyang He <hejinyang@loongson.cn>
Message-ID: <26036193-f570-3a17-e6d3-45ad70704198@loongson.cn>
Date: Fri, 12 Sep 2025 09:55:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <c3431ce4-0026-3a05-fa50-281cd34aba4e@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowJAxE+SUfcNok06PAA--.64547S3
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Zr1ktw47Gw1rurWUWr4ftFc_yoW5JFW3pr
	ykJ3ZxKrWUJr18tr1UWr1DXFyUJr4kAw1DGr1rJF1UJF1UXr1Ygr4jg3Wj9rsxAr4kJw13
	Ar1Yqrykua17JacCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67
	vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
	wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc4
	0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
	xVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
	1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU70PfDUUU
	U

On 2025-09-11 19:49, Tiezhu Yang wrote:

> On 2025/9/10 上午9:11, Jinyang He wrote:
>> On 2025-09-09 19:31, Tiezhu Yang wrote:
>>
>>> When testing the kernel live patching with "modprobe livepatch-sample",
>>> there is a timeout over 15 seconds from "starting patching transition"
>>> to "patching complete", dmesg shows "unreliable stack" for user tasks
>>> in debug mode. When executing "rmmod livepatch-sample", there exists
>>> the similar issue.
>
> ...
>
>>> @@ -57,9 +62,14 @@ int 
>>> arch_stack_walk_reliable(stack_trace_consume_fn consume_entry,
>>>       }
>>>       regs->regs[1] = 0;
>>>       regs->regs[22] = 0;
>>> +    regs->csr_prmd = task->thread.csr_prmd;
>>>       for (unwind_start(&state, task, regs);
>>>            !unwind_done(&state) && !unwind_error(&state); 
>>> unwind_next_frame(&state)) {
>>> +        /* Success path for user tasks */
>>> +        if (user_mode(regs))
>>> +            return 0;
>>> +
>>>           addr = unwind_get_return_address(&state);
>>>           /*
>> Hi, Tiezhu,
>>
>> We update stack info by get_stack_info when meet ORC_TYPE_REGS in
>> unwind_next_frame. And in arch_stack_walk(_reliable), we always
>> do unwind_done before unwind_next_frame. So is there anything
>> error in get_stack_info which causing regs is user_mode while
>> stack is not STACK_TYPE_UNKNOWN?
>
> When testing the kernel live patching, the error code path in
> unwind_next_frame() is:
>
>   switch (orc->fp_reg) {
>           case ORC_REG_PREV_SP:
>                   p = (unsigned long *)(state->sp + orc->fp_offset);
>                   if (!stack_access_ok(state, (unsigned long)p, 
> sizeof(unsigned long)))
>                           goto err;
>
> for this case, get_stack_info() does not return 0 due to in_task_stack()
> is not true, then goto error, state->stack_info.type = STACK_TYPE_UNKNOWN
> and state->error = true. In arch_stack_walk_reliable(), the loop will be
> break and it returns -EINVAL, thus causing unreliable stack.
The stop position of a complete stack backtrace on LoongArch should be
the top of the task stack or until the address is_entry_func.
Otherwise, it is not a complete stack backtrace, and thus I think it
is an "unreliable stack".
I'm curious about what the ORC info at this PC.

