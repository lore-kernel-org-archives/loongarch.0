Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9841762A
	for <loongarch@lists.linux.dev>; Thu, 11 May 2023 01:32:48 +0000 (UTC)
Received: from loongson.cn (unknown [192.168.100.1])
	by gateway (Coremail) with SMTP id _____8CxvOq4RVxkKJgHAA--.12610S3;
	Thu, 11 May 2023 09:32:40 +0800 (CST)
Received: from [0.0.0.0] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxD7+2RVxkuQxVAA--.20458S3;
	Thu, 11 May 2023 09:32:38 +0800 (CST)
Subject: Re: [PATCH v2] LoongArch: Add jump-label implementation
To: Peter Zijlstra <peterz@infradead.org>
References: <1683710206-23905-1-git-send-email-tangyouling@loongson.cn>
 <20230510092723.GK4253@hirez.programming.kicks-ass.net>
Cc: Huacai Chen <chenhuacai@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>,
 WANG Xuerui <kernel@xen0n.name>, Zhangjin Wu <falcon@tinylab.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev
From: Youling Tang <tangyouling@loongson.cn>
Message-ID: <de498202-846d-2997-6226-94d302d846b2@loongson.cn>
Date: Thu, 11 May 2023 09:32:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20230510092723.GK4253@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8DxD7+2RVxkuQxVAA--.20458S3
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxCw4DtF4UJF1ruF43ur1xXwb_yoW5KF1xpF
	yUCa9YkF4kt3WfJr98XrnxZF1Yvws5KF9FqFZ0g34xAFnFv340kF1IkrZ09as2yaykGr42
	v3WYvFZIv3W5taDanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bxxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8JVW8Jr1le2I2
	62IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4
	CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4j6F4UMcvj
	eVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487MxAIw2
	8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
	x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrw
	CI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI
	42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
	80aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUcCD7UUUUU

Hi, Peter

On 05/10/2023 05:27 PM, Peter Zijlstra wrote:
> On Wed, May 10, 2023 at 05:16:46PM +0800, Youling Tang wrote:
>> Add jump-label implementation based on the ARM64 version.
>>
>> Signed-off-by: Youling Tang <tangyouling@loongson.cn>
>
>> diff --git a/arch/loongarch/include/asm/jump_label.h b/arch/loongarch/include/asm/jump_label.h
>> new file mode 100644
>> index 000000000000..2f9fdec256c5
>> --- /dev/null
>> +++ b/arch/loongarch/include/asm/jump_label.h
>> @@ -0,0 +1,51 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (C) 2023 Loongson Technology Corporation Limited
>> + *
>> + * Based on arch/arm64/include/asm/jump_label.h
>> + */
>> +#ifndef __ASM_JUMP_LABEL_H
>> +#define __ASM_JUMP_LABEL_H
>> +
>> +#ifndef __ASSEMBLY__
>> +
>> +#include <linux/types.h>
>> +
>> +#define JUMP_LABEL_NOP_SIZE	4
>> +
>> +static __always_inline bool arch_static_branch(struct static_key * const key,
>> +					       const bool branch)
>> +{
>> +	asm_volatile_goto(
>> +		"1:	nop					\n\t"
>> +		 "	.pushsection	__jump_table, \"aw\"	\n\t"
>> +		 "	.align		3			\n\t"
>> +		 "	.long		1b - ., %l[l_yes] - .	\n\t"
>> +		 "	.quad		%0 - .			\n\t"
>> +		 "	.popsection				\n\t"
>> +		 :  :  "i"(&((char *)key)[branch]) :  : l_yes);
>> +
>> +	return false;
>> +l_yes:
>> +	return true;
>> +}
>> +
>> +static __always_inline bool arch_static_branch_jump(struct static_key * const key,
>> +						    const bool branch)
>> +{
>> +	asm_volatile_goto(
>> +		"1:	b		%l[l_yes]		\n\t"
>> +		 "	.pushsection	__jump_table, \"aw\"	\n\t"
>> +		 "	.align		3			\n\t"
>> +		 "	.long		1b - ., %l[l_yes] - .	\n\t"
>> +		 "	.quad		%0 - .			\n\t"
>> +		 "	.popsection				\n\t"
>> +		 :  :  "i"(&((char *)key)[branch]) :  : l_yes);
>> +
>> +	return false;
>> +l_yes:
>> +	return true;
>> +}
>
> Seems simple enough; one change I did a while ago for the x86 version is
> to put the __jump_table entry generation in a macro so it could be
> shared between the (3 for x86) variants.

Looks better, I will define JUMP_TABLE_ENTRY macro so that
arch_static_branch and arch_static_branch_jump can share.

Thanks,
Youling.

>
> Not saying you have to do that, just saying it's an option.
>
>> +#endif  /* __ASSEMBLY__ */
>> +#endif	/* __ASM_JUMP_LABEL_H */
>
>> diff --git a/arch/loongarch/kernel/jump_label.c b/arch/loongarch/kernel/jump_label.c
>> new file mode 100644
>> index 000000000000..b06245955f7a
>> --- /dev/null
>> +++ b/arch/loongarch/kernel/jump_label.c
>> @@ -0,0 +1,23 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2023 Loongson Technology Corporation Limited
>> + *
>> + * Based on arch/arm64/kernel/jump_label.c
>> + */
>> +#include <linux/jump_label.h>
>> +#include <linux/kernel.h>
>> +#include <asm/inst.h>
>> +
>> +void arch_jump_label_transform(struct jump_entry *entry,
>> +			       enum jump_label_type type)
>> +{
>> +	void *addr = (void *)jump_entry_code(entry);
>> +	u32 insn;
>> +
>> +	if (type == JUMP_LABEL_JMP)
>> +		insn = larch_insn_gen_b(jump_entry_code(entry), jump_entry_target(entry));
>> +	else
>> +		insn = larch_insn_gen_nop();
>> +
>> +	larch_insn_patch_text(addr, insn);
>> +}
>
> This all implies Loongarch is fine with the nop<->b transition (much
> like arm64 is), but I found no actual mention of what transitions are
> valid for the architecture in your inst.c file -- perhaps you could put
> a small comment there to elucidate the occasional reader that doesn't
> have your arch manual memorized?
>
>
> Anyway, as with most RISC implementations it's short and sweet.
>
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
>

