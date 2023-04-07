Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47DEB4408
	for <loongarch@lists.linux.dev>; Fri,  7 Apr 2023 12:02:34 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Axu5dXBjBk8d4XAA--.37202S3;
	Fri, 07 Apr 2023 20:02:32 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxC75WBjBk_18YAA--.24086S3;
	Fri, 07 Apr 2023 20:02:31 +0800 (CST)
Subject: Re: [RFC PATCH 2/3] LoongArch: Add larch_insn_gen_break() to generate
 break insn
To: WANG Xuerui <kernel@xen0n.name>, Youling Tang <tangyouling@loongson.cn>
References: <1680833701-1727-1-git-send-email-yangtiezhu@loongson.cn>
 <1680833701-1727-3-git-send-email-yangtiezhu@loongson.cn>
 <0d309725-3b91-6902-de67-08bda48ccf57@loongson.cn>
 <ab4f20ff-6aeb-f343-c4dc-24c46919176c@xen0n.name>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <9433a12a-b24b-4438-fdc8-0213522c71ba@loongson.cn>
Date: Fri, 7 Apr 2023 20:02:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ab4f20ff-6aeb-f343-c4dc-24c46919176c@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8DxC75WBjBk_18YAA--.24086S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7KF4kWF47WryruFWkuFyUZFb_yoW8Kryfpr
	1DAF15Zrs8W3yrG34vqw15ZF4Sqw4kWr4qqF4DJ3y3GrW7Xrn8tFn2gryakFyYvw4jgay0
	q3ZFgFWIva4jyaDanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bfAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
	x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2kK
	e7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280
	aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62
	AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI
	1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_Jr
	Wlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j
	6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr
	0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUv
	cSsGvfC2KfnxnUUI43ZEXa7IU8eT5JUUUUU==



On 04/07/2023 05:51 PM, WANG Xuerui wrote:
> On 2023/4/7 10:30, Youling Tang wrote:
>> /* snip */
>>
>>> diff --git a/arch/loongarch/kernel/kprobes.c
>>> b/arch/loongarch/kernel/kprobes.c
>>> index 08c78d2..a5c3712 100644
>>> --- a/arch/loongarch/kernel/kprobes.c
>>> +++ b/arch/loongarch/kernel/kprobes.c
>>> @@ -4,19 +4,8 @@
>>>  #include <linux/preempt.h>
>>>  #include <asm/break.h>
>>>
>>> -static const union loongarch_instruction breakpoint_insn = {
>>> -    .reg0i15_format = {
>>> -        .opcode = break_op,
>>> -        .immediate = BRK_KPROBE_BP,
>>> -    }
>>> -};
>>> -
>>> -static const union loongarch_instruction singlestep_insn = {
>>> -    .reg0i15_format = {
>>> -        .opcode = break_op,
>>> -        .immediate = BRK_KPROBE_SSTEPBP,
>>> -    }
>>> -};
>>> +#define breakpoint_insn larch_insn_gen_break(BRK_KPROBE_BP)
>>> +#define singlestep_insn larch_insn_gen_break(BRK_KPROBE_SSTEPBP)
>>
>> IMO, Defined as KPROBE_BP_INSN, KPROBE_SSTEPBP_INSN may be better.
>
> Are you suggesting to hardcode the instruction words for those two BREAK
> flavors?

I think what Youling said is:

#define KPROBE_BP_INSN         larch_insn_gen_break(BRK_KPROBE_BP)
#define KPROBE_SSTEPBP_INSN    larch_insn_gen_break(BRK_KPROBE_SSTEPBP)

> I don't think it's better because even more structured info is
> lost, and the compiler would generate the same code (if not, it's the
> compiler that's to be fixed).
>
> Actually, I don't know why this commit was necessary in the first place.
> For the very least, it consisted of two logical changes (pass around
> instruction words instead of unions; and change the BREAK insns to make
> them words) that should get split;

Yes, thanks for your suggestion, I will split it into two patches
in the next version.

> but again, the generated code should
> be identical anyway, so it seems a lot of churn for no benefit and
> reduced readability.
>

Define and use larch_insn_gen_break() is to avoid hardcoding the
uprobe break instruction in patch #3.

We do not like the following definitions:

#define UPROBE_SWBP_INSN	0x002a000c
#define UPROBE_XOLBP_INSN	0x002a000d

Using larch_insn_gen_break() seems better:

#define UPROBE_SWBP_INSN	larch_insn_gen_break(BRK_UPROBE_BP)
#define UPROBE_XOLBP_INSN	larch_insn_gen_break(BRK_UPROBE_XOLBP)

Thanks,
Tiezhu

