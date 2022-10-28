Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F21FA7B
	for <loongarch@lists.linux.dev>; Fri, 28 Oct 2022 05:27:18 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Bxnrc1aFtjtQUDAA--.6688S3;
	Fri, 28 Oct 2022 13:27:17 +0800 (CST)
Received: from [10.130.0.63] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxBlc0aFtj8S0GAA--.3614S3;
	Fri, 28 Oct 2022 13:27:17 +0800 (CST)
Subject: Re: [PATCH v5 10/10] LoongArch/ftrace: Fix unwind state when option
 func_stack_trace
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jeff Xie <xiehuan09@gmail.com>, Jinyang He <hejinyang@loongson.cn>
References: <20220919031910.15512-1-zhangqing@loongson.cn>
 <CAAhV-H7G53unX8CBN637kmpKBfYuJb4RZnFXOuVnPCq4xNav3Q@mail.gmail.com>
From: Qing Zhang <zhangqing@loongson.cn>
Message-ID: <9e4e00b1-f252-ce89-05f2-6f4ab31a225b@loongson.cn>
Date: Fri, 28 Oct 2022 13:27:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H7G53unX8CBN637kmpKBfYuJb4RZnFXOuVnPCq4xNav3Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8AxBlc0aFtj8S0GAA--.3614S3
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxXw17KF4rWF4xWFyUuw43GFg_yoWrurWrpF
	95CF95Ca1FgryI9rnFqrn09r95Crnayr12gryDta4rCFnFqF4fArnYv3s8uan8JrWkGF1x
	ZF1rCrya9w45ta7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bI8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2
	IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r1j6r4U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487Mx
	AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
	Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwI
	xGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8
	JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
	C2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7MmhUUUUU



On 2022/10/28 上午10:56, Huacai Chen wrote:
> Hi, Qing,
> 
> Can this patch be squashed to a previous one?
>
ok, I'll combine this patch with the previous patch.

Thanks
- Qing

> Huacai
> 
> On Mon, Sep 19, 2022 at 11:19 AM Qing Zhang <zhangqing@loongson.cn> wrote:
>>
>> Ftrace plays like function head exception, prologue analysis will stop soon
>> because PC is at entry.
>>
>>     90000000004c5a54 <callee>:
>>     90000000004c5a54:    03400000  andi   $zero, $zero, 0x0   ==>move  t0, ra
>>     90000000004c5a58:    03400000  andi   $zero, $zero, 0x0   ==>bl callsite
>> ==>90000000004c5a5c:    02fcc063  addi.d $sp, $sp, -208(0xf30)
>>     ...
>>
>> When encountering ftrace_call, save trace function ra at PT_ERA, save
>> parent ra at PT_R1, At this time, pc is the position after the two nops
>> of callee. There is no conventional prologue operation between this
>> position and the function entry, so we need to reset the first flag to
>> make the caller continue to unwind.
>>
>> testing method:
>>    echo path_openat > ./set_ftrace_filter
>>    echo 1 > ./options/func_stack_trace
>>    echo function > ./current_tracer
>>
>> Reported-by: Jeff Xie <xiehuan09@gmail.com>
>> Tested-by: Jinyang He <hejinyang@loongson.cn>
>> Tested-by: Jeff Xie <xiehuan09@gmail.com>
>> Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
>> ---
>>   arch/loongarch/include/asm/unwind.h     |  2 +-
>>   arch/loongarch/kernel/unwind_prologue.c | 35 +++++++++++++++++++++----
>>   2 files changed, 31 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/loongarch/include/asm/unwind.h b/arch/loongarch/include/asm/unwind.h
>> index f66b07c3e6a1..f2b52b9ea93d 100644
>> --- a/arch/loongarch/include/asm/unwind.h
>> +++ b/arch/loongarch/include/asm/unwind.h
>> @@ -20,7 +20,7 @@ struct unwind_state {
>>          char type; /* UNWINDER_XXX */
>>          struct stack_info stack_info;
>>          struct task_struct *task;
>> -       bool first, error;
>> +       bool first, error, is_ftrace;
>>          int graph_idx;
>>          unsigned long sp, pc, ra;
>>   };
>> diff --git a/arch/loongarch/kernel/unwind_prologue.c b/arch/loongarch/kernel/unwind_prologue.c
>> index f77f3b6f3f06..4fb4923b68cc 100644
>> --- a/arch/loongarch/kernel/unwind_prologue.c
>> +++ b/arch/loongarch/kernel/unwind_prologue.c
>> @@ -14,9 +14,7 @@ unsigned long unwind_get_return_address(struct unwind_state *state)
>>
>>          if (unwind_done(state))
>>                  return 0;
>> -       else if (state->type)
>> -               return state->pc;
>> -       else if (state->first)
>> +       else if (state->type || state->first)
>>                  return state->pc;
>>
>>          return *(unsigned long *)(state->sp);
>> @@ -42,16 +40,41 @@ static bool unwind_by_guess(struct unwind_state *state)
>>          return false;
>>   }
>>
>> +static inline void unwind_state_fixup(struct unwind_state *state)
>> +{
>> +#ifdef CONFIG_FUNCTION_TRACER
>> +       static unsigned long ftrace_case = (unsigned long)ftrace_call + 4;
>> +
>> +       if (state->pc == ftrace_case)
>> +               state->is_ftrace = true;
>> +#endif
>> +}
>> +
>>   static bool unwind_by_prologue(struct unwind_state *state)
>>   {
>>          struct stack_info *info = &state->stack_info;
>>          union loongarch_instruction *ip, *ip_end;
>>          unsigned long frame_size = 0, frame_ra = -1;
>>          unsigned long size, offset, pc = state->pc;
>> +       struct pt_regs *regs;
>>
>>          if (state->sp >= info->end || state->sp < info->begin)
>>                  return false;
>>
>> +       if (state->is_ftrace) {
>> +               /*
>> +                * As we meet ftrace_regs_entry, reset first flag like first doing
>> +                * tracing, Prologue analysis will stop soon because PC is at entry.
>> +                */
>> +               regs = (struct pt_regs *)state->sp;
>> +               state->pc = regs->csr_era;
>> +               state->ra = regs->regs[1];
>> +               state->sp = regs->regs[3];
>> +               state->first = true;
>> +               state->is_ftrace = false;
>> +               return true;
>> +       }
>> +
>>          if (!kallsyms_lookup_size_offset(pc, &size, &offset))
>>                  return false;
>>
>> @@ -97,7 +120,7 @@ static bool unwind_by_prologue(struct unwind_state *state)
>>
>>          state->pc = *(unsigned long *)(state->sp + frame_ra);
>>          state->sp = state->sp + frame_size;
>> -       return !!__kernel_text_address(state->pc);
>> +       goto out;
>>
>>   first:
>>          state->first = false;
>> @@ -106,7 +129,9 @@ static bool unwind_by_prologue(struct unwind_state *state)
>>
>>          state->pc = state->ra;
>>
>> -       return !!__kernel_text_address(state->ra);
>> +out:
>> +       unwind_state_fixup(state);
>> +       return !!__kernel_text_address(state->pc);
>>   }
>>
>>   void unwind_start(struct unwind_state *state, struct task_struct *task,
>> --
>> 2.36.1
>>

