Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EF9A2F5329
	for <loongarch@lists.linux.dev>; Mon, 15 Sep 2025 08:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757926495; cv=none; b=qECeOSHRhyDhDnVVlK6vSaSsYFXRoFtKUmJUfd1UJ2q8VCxorMf+PtXmMLSa8tuvBqsqP23ZCwg/oi2+kYH5h/nvHcpGcZKcfGMV1K6CGZVKqXhxO8ZuUhwQ8W5jKqU+I3LnzVxlZ+vcvXBG+1QU7kLrXU1CIdcIgMdxaLbu3fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757926495; c=relaxed/simple;
	bh=FqMfWhz6R7kWnn+nzywynCJfDgvX6OtKKVEedLJuU7k=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=QCNw+64Jrv7Nku3BVcHlr3joo2x0feEitRdW9BxBOmLajbGqBmRn4580TluVmGrD1Vokv+H2Dlox2+aW3FcLQSgnsVqJ40fazBBGRtFZo4HWeGUEKQ9h+RBjTqjcseYcu5u55Ser5JLGot5rW4m4CciHASQjGuchNdKN8sIWXbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxT_BY1MdoFXYKAA--.22274S3;
	Mon, 15 Sep 2025 16:54:48 +0800 (CST)
Received: from [10.130.10.66] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJBxTMFX1MdouPGWAA--.32715S3;
	Mon, 15 Sep 2025 16:54:48 +0800 (CST)
Subject: Re: [PATCH v1 2/2] LoongArch: Return 0 for user tasks in
 arch_stack_walk_reliable()
To: Jinyang He <hejinyang@loongson.cn>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>, Xi Zhang <zhangxi@kylinos.cn>,
 live-patching@vger.kernel.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250909113106.22992-1-yangtiezhu@loongson.cn>
 <20250909113106.22992-3-yangtiezhu@loongson.cn>
 <5e45a1a9-4ac3-56ee-1415-0b2128b4ed9a@loongson.cn>
 <c3431ce4-0026-3a05-fa50-281cd34aba4e@loongson.cn>
 <26036193-f570-3a17-e6d3-45ad70704198@loongson.cn>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <47be74ad-c01c-cf79-b7a4-3f05f85c2f71@loongson.cn>
Date: Mon, 15 Sep 2025 16:54:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <26036193-f570-3a17-e6d3-45ad70704198@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxTMFX1MdouPGWAA--.32715S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Zr4UAFW3Kry7KFyxXryUtwc_yoW8Gr18pr
	92gF43KF4kJw1qvF97Kr4kWFyaqa97J3s8Kr1rt34DCr1qqr13GF1xKw45uFZxZrn5K3ya
	vr4jgr95uF4DAagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Ib4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AK
	xVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
	AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E
	14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4
	CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4U
	MIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF
	4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnI
	WIevJa73UjIFyTuYvjxU2nYFDUUUU

On 2025/9/12 上午9:55, Jinyang He wrote:
> On 2025-09-11 19:49, Tiezhu Yang wrote:
> 
>> On 2025/9/10 上午9:11, Jinyang He wrote:
>>> On 2025-09-09 19:31, Tiezhu Yang wrote:
>>>
>>>> When testing the kernel live patching with "modprobe livepatch-sample",
>>>> there is a timeout over 15 seconds from "starting patching transition"
>>>> to "patching complete", dmesg shows "unreliable stack" for user tasks
>>>> in debug mode. When executing "rmmod livepatch-sample", there exists
>>>> the similar issue.

...

>> for this case, get_stack_info() does not return 0 due to in_task_stack()
>> is not true, then goto error, state->stack_info.type = STACK_TYPE_UNKNOWN
>> and state->error = true. In arch_stack_walk_reliable(), the loop will be
>> break and it returns -EINVAL, thus causing unreliable stack.
> The stop position of a complete stack backtrace on LoongArch should be
> the top of the task stack or until the address is_entry_func.
> Otherwise, it is not a complete stack backtrace, and thus I think it
> is an "unreliable stack".
> I'm curious about what the ORC info at this PC.

The unwind process has problem, I have found the root cause and am
working to fix the "unreliable stack" issue, it should and can find
the last frame, and then the user_mode() check is not necessary.

Thanks,
Tiezhu

