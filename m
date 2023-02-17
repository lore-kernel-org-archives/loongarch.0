Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54E2D376
	for <loongarch@lists.linux.dev>; Fri, 17 Feb 2023 02:36:24 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Bxddgm6O5jbZoBAA--.3118S3;
	Fri, 17 Feb 2023 10:36:22 +0800 (CST)
Received: from [10.130.0.63] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxC74j6O5j4vg0AA--.32272S3;
	Fri, 17 Feb 2023 10:36:19 +0800 (CST)
Subject: Re: [PATCH v3 2/3] LoongArch: Add ptrace single step support
To: WANG Xuerui <kernel@xen0n.name>, Youling Tang <tangyouling@loongson.cn>,
 Jinyang He <hejinyang@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Oleg Nesterov <oleg@redhat.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20230215092358.30368-1-zhangqing@loongson.cn>
 <20230215092358.30368-3-zhangqing@loongson.cn>
 <2b759af4-4047-4ac6-acbb-42e91c14fb48@loongson.cn>
 <42a352da-936a-bf7e-994f-6d884a230646@loongson.cn>
 <469f1228-dd70-a183-3135-4e3b2e9165f7@xen0n.name>
From: Qing Zhang <zhangqing@loongson.cn>
Message-ID: <772afe6e-cfa8-3dd9-236b-5f9e2dcbe680@loongson.cn>
Date: Fri, 17 Feb 2023 10:36:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <469f1228-dd70-a183-3135-4e3b2e9165f7@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxC74j6O5j4vg0AA--.32272S3
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvAXoW3ZF4xXr4DZw47uryxAw43Wrg_yoW8Jr17Ao
	W7KF1ftr1rXr4jgr1UA3yDJF1ayw1UGrnrtryUC3sxJF10yw17Z3yUJry5tay7WF18Wr1U
	G34UXrW0vFW7Xr95n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXasCq-sGcSsGvf
	J3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnRJU
	UUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s
	0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1U
	M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4
	xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8
	JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8w
	CF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j
	6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64
	vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_
	Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0x
	vEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8j-e5UUUUU==

Hi, forks,
On 2023/2/16 下午2:57, WANG Xuerui wrote:
> On 2023/2/16 11:13, Youling Tang wrote:
>>
>>
>> On 02/16/2023 10:07 AM, Jinyang He wrote:
>>>
>>> On 2023-02-15 17:23, Qing Zhang wrote:
>>>> Use the generic ptrace_resume code for PTRACE_SYSCALL, PTRACE_CONT,
>>>> PTRACE_KILL and PTRACE_SINGLESTEP. This implies defining
>>>> arch_has_single_step in  and implementing the
>>>> user_enable_single_step and user_disable_single_step functions.
>>>>
>>>> LongArch has no hardware single-step register. the hardware single-step
>>>> function multiplex fetch instruction watchpoint(FWPS) and specifies 
>>>> that
>>>> the next instruction must trigger the watch exception by setting the
>>>> mask bit.
>>>>
>>>> Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
>>>> ---
>>>>   arch/loongarch/include/asm/processor.h |  3 ++
>>>>   arch/loongarch/include/asm/ptrace.h    |  2 +
>>>>   arch/loongarch/kernel/hw_breakpoint.c  | 35 +++++++++++--
>>>>   arch/loongarch/kernel/ptrace.c         | 68 
>>>> ++++++++++++++++++++++++++
>>>>   arch/loongarch/kernel/traps.c          | 20 ++++++--
>>>>   5 files changed, 120 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/arch/loongarch/include/asm/processor.h
>>>> b/arch/loongarch/include/asm/processor.h
>>>> index db060c5a976f..3ea0f1910c23 100644
>>>> --- a/arch/loongarch/include/asm/processor.h
>>>> +++ b/arch/loongarch/include/asm/processor.h
>>>> @@ -131,6 +131,9 @@ struct thread_struct {
>>>>       struct perf_event    *hbp_break[LOONGARCH_MAX_BRP];
>>>>       struct perf_event    *hbp_watch[LOONGARCH_MAX_WRP];
>>>>   +    /* Used by ptrace single_step */
>>>> +    unsigned long single_step;
>>>> +
>>>>       /*
>>>>        * FPU & vector registers, must be at last because
>>>>        * they are conditionally copied at fork().
>>>> diff --git a/arch/loongarch/include/asm/ptrace.h
>>>> b/arch/loongarch/include/asm/ptrace.h
>>>> index 58596c4f8a0f..66a0e6c480a3 100644
>>>> --- a/arch/loongarch/include/asm/ptrace.h
>>>> +++ b/arch/loongarch/include/asm/ptrace.h
>>>> @@ -150,4 +150,6 @@ static inline void user_stack_pointer_set(struct
>>>> pt_regs *regs,
>>>>       regs->regs[3] = val;
>>>>   }
>>>>   +#define arch_has_single_step()        (1)
>>>> +
>>>>   #endif /* _ASM_PTRACE_H */
>>>> diff --git a/arch/loongarch/kernel/hw_breakpoint.c
>>>> b/arch/loongarch/kernel/hw_breakpoint.c
>>>> index 6431cd319c32..94967b887d92 100644
>>>> --- a/arch/loongarch/kernel/hw_breakpoint.c
>>>> +++ b/arch/loongarch/kernel/hw_breakpoint.c
>>>> @@ -153,6 +153,22 @@ static int hw_breakpoint_slot_setup(struct
>>>> perf_event **slots, int max_slots,
>>>>    */
>>>>   void flush_ptrace_hw_breakpoint(struct task_struct *tsk)
>>>>   {
>>>> +    int i;
>>>> +    struct thread_struct *t = &tsk->thread;
>>>> +
>>>> +    for (i = 0; i < LOONGARCH_MAX_BRP; i++) {
>>>> +        if (t->hbp_break[i]) {
>>>> +            unregister_hw_breakpoint(t->hbp_break[i]);
>>>> +            t->hbp_break[i] = NULL;
>>>> +        }
>>>> +    }
>>>> +
>>>> +    for (i = 0; i < LOONGARCH_MAX_WRP; i++) {
>>>> +        if (t->hbp_watch[i]) {
>>>> +            unregister_hw_breakpoint(t->hbp_watch[i]);
>>>> +            t->hbp_watch[i] = NULL;
>>>> +        }
>>>> +    }
>>>>   }
>>>>     void ptrace_hw_copy_thread(struct task_struct *tsk)
>>>> @@ -498,11 +514,20 @@ arch_initcall(arch_hw_breakpoint_init);
>>>>   void hw_breakpoint_thread_switch(struct task_struct *next)
>>>>   {
>>>>       struct pt_regs *regs = task_pt_regs(next);
>>>> -
>>>> -    /* Update breakpoints */
>>>> -    update_bp_registers(regs, 1, 0);
>>>> -    /* Update watchpoints */
>>>> -    update_bp_registers(regs, 1, 1);
>>>> +    u64 addr, mask;
>>>> +
>>>> +    if (test_bit(TIF_SINGLESTEP, &task_thread_info(next)->flags)) {
>>>> +        addr = read_wb_reg(CSR_CFG_ADDR, 0, 0);
>>>> +        mask = read_wb_reg(CSR_CFG_MASK, 0, 0);
>>>> +        if ((task_pt_regs(next)->csr_era & ~mask) == (addr & ~mask))
>>>> +            csr_write32(0x10000, LOONGARCH_CSR_FWPS);
>>>> +        regs->csr_prmd |= CSR_PRMD_PWE;
>>>> +    } else {
>>>> +        /* Update breakpoints */
>>>> +        update_bp_registers(regs, 1, 0);
>>>> +        /* Update watchpoints */
>>>> +        update_bp_registers(regs, 1, 1);
>>>> +    }
>>>>   }
>>>>     void hw_breakpoint_pmu_read(struct perf_event *bp)
>>>> diff --git a/arch/loongarch/kernel/ptrace.c
>>>> b/arch/loongarch/kernel/ptrace.c
>>>> index bee4194177fd..52a3ee4366f4 100644
>>>> --- a/arch/loongarch/kernel/ptrace.c
>>>> +++ b/arch/loongarch/kernel/ptrace.c
>>>> @@ -20,6 +20,7 @@
>>>>   #include <linux/context_tracking.h>
>>>>   #include <linux/elf.h>
>>>>   #include <linux/errno.h>
>>>> +#include <linux/hw_breakpoint.h>
>>>>   #include <linux/mm.h>
>>>>   #include <linux/ptrace.h>
>>>>   #include <linux/regset.h>
>>>> @@ -30,6 +31,7 @@
>>>>   #include <linux/stddef.h>
>>>>   #include <linux/seccomp.h>
>>>>   #include <linux/uaccess.h>
>>>> +#include <linux/thread_info.h>
>>>>     #include <asm/byteorder.h>
>>>>   #include <asm/cpu.h>
>>>> @@ -39,6 +41,7 @@
>>>>   #include <asm/page.h>
>>>>   #include <asm/pgtable.h>
>>>>   #include <asm/processor.h>
>>>> +#include <asm/ptrace.h>
>>>>   #include <asm/reg.h>
>>>>   #include <asm/syscall.h>
>>>>   @@ -541,3 +544,68 @@ long arch_ptrace(struct task_struct *child,
>>>> long request,
>>>>         return ret;
>>>>   }
>>>> +
>>>> +void ptrace_triggered(struct perf_event *bp,
>>>> +              struct perf_sample_data *data, struct pt_regs *regs)
>>>> +{
>>>> +    struct perf_event_attr attr;
>>>> +
>>>> +    attr = bp->attr;
>>>> +    attr.disabled = true;
>>>> +    modify_user_hw_breakpoint(bp, &attr);
>>>> +}
>>>> +
>>>> +static int set_single_step(struct task_struct *tsk, unsigned long 
>>>> addr)
>>>> +{
>>>> +    struct thread_struct *thread = &tsk->thread;
>>>> +    struct perf_event *bp;
>>>> +    struct perf_event_attr attr;
>>>> +    struct arch_hw_breakpoint *info;
>>>> +
>>>> +    bp = thread->hbp_break[0];
>>>> +    if (!bp) {
>>>> +        ptrace_breakpoint_init(&attr);
>>>> +
>>>> +        attr.bp_addr = addr;
>>>> +        attr.bp_len = HW_BREAKPOINT_LEN_8;
>>>> +        attr.bp_type = HW_BREAKPOINT_X;
>>>> +
>>>> +        bp = register_user_hw_breakpoint(&attr, ptrace_triggered,
>>>> +                         NULL, tsk);
>>>> +        if (IS_ERR(bp))
>>>> +            return PTR_ERR(bp);
>>>> +
>>>> +        thread->hbp_break[0] = bp;
>>>> +    } else {
>>>> +        int err;
>>>> +
>>>> +        attr = bp->attr;
>>>> +        attr.bp_addr = addr;
>>>> +        /* reenable breakpoint */
>>>> +        attr.disabled = false;
>>>> +        err = modify_user_hw_breakpoint(bp, &attr);
>>>> +        if (unlikely(err))
>>>> +            return err;
>>>> +
>>>> +        csr_write64(attr.bp_addr, LOONGARCH_CSR_IB0ADDR);
>>>> +    }
>>>> +    info = counter_arch_bp(bp);
>>>> +    info->mask = 0xffffffffffff;
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +/* ptrace API */
>>>> +void user_enable_single_step(struct task_struct *task)
>>>> +{
>>>> +    struct thread_info *ti = task_thread_info(task);
>>>> +
>>>> +    set_single_step(task, task_pt_regs(task)->csr_era);
>>>> +    task->thread.single_step = task_pt_regs(task)->csr_era;
>>>> +    set_ti_thread_flag(ti, TIF_SINGLESTEP);
>>>> +}
>>>> +
>>>> +void user_disable_single_step(struct task_struct *task)
>>>> +{
>>>> +    clear_tsk_thread_flag(task, TIF_SINGLESTEP);
>>>> +}
>>>> diff --git a/arch/loongarch/kernel/traps.c
>>>> b/arch/loongarch/kernel/traps.c
>>>> index 2b133079e0f3..56d7d076153c 100644
>>>> --- a/arch/loongarch/kernel/traps.c
>>>> +++ b/arch/loongarch/kernel/traps.c
>>>> @@ -511,9 +511,23 @@ asmlinkage void noinstr do_watch(struct pt_regs
>>>> *regs)
>>>>   #ifdef CONFIG_HAVE_HW_BREAKPOINT
>>>>       irqentry_state_t state = irqentry_enter(regs);
>>>>   -    breakpoint_handler(regs);
>>>> -    watchpoint_handler(regs);
>>>> -    force_sig(SIGTRAP);
>>>> +    if (test_tsk_thread_flag(current, TIF_SINGLESTEP)) {
>>>> +        int llbit = (csr_read32(LOONGARCH_CSR_LLBCTL) & 0x1);
>>>> +        unsigned long pc = regs->csr_era;
>>>> +
>>>> +        if (llbit) {
>>>
>>> Hi, Qing,
>>>
>>>
>>> It should be noted here. When the ll-sc combo is encountered, it is
>>> regarded as an single instruction. So donnot clear llbit and reset
>>> CSR.FWPS.Skip until the llsc execution is completed.
>>>
>>>> +            csr_write32(0x10000, LOONGARCH_CSR_FWPS);
>>>> +            csr_write32(0x4, LOONGARCH_CSR_LLBCTL);
>>>> +        } else if (pc == current->thread.single_step) {
>>> Note here as well. Because 3A5000 has a strange hardware issue that
>>> certain insns are occasionally not skipped when CSR.FWPS.Skip is set,
>>> such as fld.d/fst.d. Singlestep needs compare whether the csr_era is
>>> equal to the value of singlestep which last time set, as in most case
>>>
>>> they should be not equal.
>>
>> BTW, I prefer to separate this special processing from this patch (for
>> example, add two patchs in this series, add special processing of
>> instructions such as LL-SC, and FLD.D/FST.D, etc.), and add
>> corresponding test cases to describe the phenomenon and reason, this
>> is conducive to everyone's understanding of the code.
>>
In order to ensure the integrity of the patch function,
it is better to add comments without splitting.
>>>
>>>
>>> And for this condition expression, some potentially strange insns may
>>> cause bugs. For example, "b 0" or "jr rd" where rd is equal to its PC
>>> will cause cannot stop the singlestep. These insns is so strange that
>>> we did not consider in OW. However, I think we should consider this
>>> case for robustness in upstream.
>>>
>>
>> I don't know if there will be instructions like "b 0" or "jr rd (rd =
>> pc)" in the executable file after linking?
> FWIW `jirl A, A, 0` is apparently ubiquitous in the old world:
> 
> $ objdump -d 
> ~/loongnix-sysroot/usr/lib/loongarch64-linux-gnu/libc_nonshared.a | grep 
> -E 'jirl\s+\$(..), \$\1'
>    20:   4c000021        jirl            $ra, $ra, 0
>    24:   4c000021        jirl            $ra, $ra, 0
>     c:   4c000021        jirl            $ra, $ra, 0
> 
> One of the occurrences is in __stack_chk_fail_local, guess how popular 
> it is among the whole old world...
> 
> But fortunately a quick check against my Gentoo sysroot yielded nothing, 
> so perhaps the new world as a whole isn't going to be affected. I've 
> checked some of the *older* (i.e. before 2022) new world sysroots I have 
> at hand and they seemed not affected either.
> 
> As for `b 0`, they are kinda already signifying some panic/abort/halt 
> condition, at least in a few projects that I've studied/ported.
> 
> But IMO the kernel shouldn't get DoS'd even if userland gets stuck in 
> things like this, so some kind of workaround should still be necessary.
> 
Got it, the fix is already in v4.

Thanks,
-Qing

