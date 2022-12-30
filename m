Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36F571FA0
	for <loongarch@lists.linux.dev>; Fri, 30 Dec 2022 05:58:30 +0000 (UTC)
Received: from loongson.cn (unknown [111.9.175.10])
	by gateway (Coremail) with SMTP id _____8CxI_D+fa5jDW4JAA--.21148S3;
	Fri, 30 Dec 2022 13:58:23 +0800 (CST)
Received: from [10.136.12.26] (unknown [111.9.175.10])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxsOT6fa5j3_cPAA--.52516S3;
	Fri, 30 Dec 2022 13:58:20 +0800 (CST)
Subject: Re: [PATCH] LoongArch: Fix irq enable in exception handlers
To: Qi Hu <huqi@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20221221074238.6699-1-hejinyang@loongson.cn>
 <CAAhV-H6VX=d1oymY0rh-mwOPMuBsYd7C9RzQat8BmmnrJ7apng@mail.gmail.com>
 <8eaea09e-67b0-5e51-4632-2c31a4c56a3e@loongson.cn>
 <CAAhV-H7maW1YWhfvCzYVix=aCMMFbx0KkGodaBjka4ThunBO5Q@mail.gmail.com>
 <1c578efd-ae8a-2d80-e505-a09b1a2f7eaa@loongson.cn>
 <b267cab1-3df4-6263-9c83-0061f20dd4a4@loongson.cn>
 <2364400d-bb1e-cbe2-8a65-adbe87186938@loongson.cn>
 <7a028a4d-71f0-7064-cc1c-0ca50749ef2e@loongson.cn>
From: Jinyang He <hejinyang@loongson.cn>
Message-ID: <2190a195-53bb-09a8-9130-101c040edd09@loongson.cn>
Date: Fri, 30 Dec 2022 13:58:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <7a028a4d-71f0-7064-cc1c-0ca50749ef2e@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:AQAAf8BxsOT6fa5j3_cPAA--.52516S3
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoW3CFyxZr4UJF45JFyfGryUZFb_yoWDCFW3pr
	1kAF1UJryUJr18Jr1Utr1jyryUtr1Ut3WUXr1UJFy8Jr4qyr1qqr18Xr1jgr1UAr48Jr1U
	Xr1Utr17ZF1UJFUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bfAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	n4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
	ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E
	87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0V
	AS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km
	07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r
	1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWU
	JVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r
	1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUv
	cSsGvfC2KfnxnUUI43ZEXa7IU88Ma5UUUUU==


On 2022-12-29 14:54, Qi Hu wrote:
>
> On 2022/12/29 14:13, Jinyang He wrote:
>> On 2022-12-29 00:51, Qi Hu wrote:
>>
>>>
>>> On 2022/12/27 18:10, Jinyang He wrote:
>>>> On 2022-12-27 17:52, Huacai Chen wrote:
>>>>
>>>>> On Tue, Dec 27, 2022 at 5:30 PM Jinyang He <hejinyang@loongson.cn> 
>>>>> wrote:
>>>>>>
>>>>>> On 2022-12-27 15:37, Huacai Chen wrote:
>>>>>>> Hi, Jinyang,
>>>>>>>
>>>>>>> Move die_if_kernel to irq disabled context to solve what?
>>>>>> For more strict logical. If the code flow go to die in 
>>>>>> die_if_kernel(),
>>>>>> its interrupt state is enable, that means it may cause schedule.
>>>>>> So I think it is better to call die_if_kernel() firstly.
>>>>> die_if_kernel is called with irq enabled in old kernels for several
>>>>> years, and has no problems.
>>>>
>>>>
>>>> I think because it never call die() in die_if_kernel(). What I do
>>>> emphasize is that there needs to be more strict logic here than
>>>> it worked well in the past. I bet if die_if_kernel() was removed,
>>>> it will still work well in the future.
>>>>
>>>>
>>>>>
>>>>>>
>>>>>>>    And LBT is
>>>>>>> surely allowed to be triggered in kernel context.
>>>>>> I'm not familar with lbt, I just not see any lbt codes in kernel. 
>>>>>> Plz,
>>>>>> how lbt exception triggered, and how kernel trigger lbt exception?
>>>>> You can ask Huqi for more details, and this was discussed publicly 
>>>>> last week.
>>>>
>>>> To: Qi Hu
>>>>
>>>>
>>>> Hi,
>>>>
>>>>
>>>> We really need some help. Can you give us some ideas?
>>>>
>>>>
>>>> Thanks,
>>>>
>>>> Jinyang
>>>>
>>> Huacai is correct. The LBT disable exception (BTD) can be triggered 
>>> in kernel context.
>>>
>>> If the CSR.ENEU.BTE == 0 [^1], the LBT instructions (these [^2] will 
>>> be used in the kernel) will trigger the exception.
>>>
>>> Unfortunately, when you want to do some fpu_{save, restore}, you 
>>> need to use some LBT instructions [^3] [^4]. So if FPD is triggered, 
>>> LBT might still not be enabled, and the 'do_lbt' will be called in 
>>> the kernel context.
>>>
>>> Hope the information can help. Thanks.
>>>
>>>
>>> [1] 
>>> https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.html#extended-component-unit-enable
>>>
>>> [2] 
>>> https://github.com/loongson/linux/pull/4/files#diff-381d03cf86e2796d280e2fc82c005409d5e44b4bbbf90dd0dc17f5f0fa5553f1R140-R184
>>>
>>> [3] 
>>> https://github.com/loongson/linux/pull/4/files#diff-381d03cf86e2796d280e2fc82c005409d5e44b4bbbf90dd0dc17f5f0fa5553f1R218-R230
>>>
>>> [4] 
>>> https://github.com/loongson/linux/pull/4/files#diff-381d03cf86e2796d280e2fc82c005409d5e44b4bbbf90dd0dc17f5f0fa5553f1R236-R263
>>>
>>>
>> Hi,
>>
>>
>> That's helpful. Thanks!
>>
>>
>> But I still wonder if SXD or ASXD have the same possibility of being 
>> triggered in the kernel mode by sc_save_{lsx, lasx} or other place. 
>> Do we need remove these die_if_kernel codes in do_lasx() and do_lsx()?
>>
>>
>> Jinyang
>>
> Hi Jinyang,
>
> I think only BTD has this tricky situation, because there is some 
> overlap between FPD/SXD/ASXD and BTD.
>
> So, in my view, SXD or ASXD will not be triggered in kernel mode.
>
> Thanks.
>
>
> Qi

Got it. Thanks for your help. And I'll fix my patch in next version.


Jinyang


>
>>
>>> Qi
>>>
>>>>
>>>>> Huacai
>>>>>>
>>>>>> Thanks,
>>>>>>
>>>>>> Jinyang
>>>>>>
>>>>>>
>>>>>>> Huacai
>>>>>>>
>>>>>>> On Wed, Dec 21, 2022 at 3:43 PM Jinyang He 
>>>>>>> <hejinyang@loongson.cn> wrote:
>>>>>>>> The interrupt state can be got by regs->csr_prmd. Once previous
>>>>>>>> interrupt state is disable, we shouldn't enable interrupt if we
>>>>>>>> triggered exception which can be triggered in kernel mode. So
>>>>>>>> conditionally enable interrupt. For those do_\exception which
>>>>>>>> can not triggered in kernel mode but need enable interrupt, call
>>>>>>>> die_if_kernel() firstly. And for do_lsx, do_lasx and do_lbt cannot
>>>>>>>> triggered in kernel mode, too.
>>>>>>>>
>>>>>>>> Signed-off-by: Jinyang He <hejinyang@loongson.cn>
>>>>>>>> ---
>>>>>>>>    arch/loongarch/kernel/traps.c | 19 ++++++++++---------
>>>>>>>>    1 file changed, 10 insertions(+), 9 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/arch/loongarch/kernel/traps.c 
>>>>>>>> b/arch/loongarch/kernel/traps.c
>>>>>>>> index 1ea14f6c18d3..3ac7b32d1e15 100644
>>>>>>>> --- a/arch/loongarch/kernel/traps.c
>>>>>>>> +++ b/arch/loongarch/kernel/traps.c
>>>>>>>> @@ -340,9 +340,9 @@ asmlinkage void noinstr do_fpe(struct 
>>>>>>>> pt_regs *regs, unsigned long fcsr)
>>>>>>>>
>>>>>>>>           /* Clear FCSR.Cause before enabling interrupts */
>>>>>>>>           write_fcsr(LOONGARCH_FCSR0, fcsr & ~mask_fcsr_x(fcsr));
>>>>>>>> -       local_irq_enable();
>>>>>>>>
>>>>>>>>           die_if_kernel("FP exception in kernel code", regs);
>>>>>>>> +       local_irq_enable();
>>>>>>>>
>>>>>>>>           sig = SIGFPE;
>>>>>>>>           fault_addr = (void __user *) regs->csr_era;
>>>>>>>> @@ -432,7 +432,8 @@ asmlinkage void noinstr do_bp(struct 
>>>>>>>> pt_regs *regs)
>>>>>>>>           unsigned long era = exception_era(regs);
>>>>>>>>           irqentry_state_t state = irqentry_enter(regs);
>>>>>>>>
>>>>>>>> -       local_irq_enable();
>>>>>>>> +       if (regs->csr_prmd & CSR_PRMD_PIE)
>>>>>>>> +               local_irq_enable();
>>>>>>>>           current->thread.trap_nr = read_csr_excode();
>>>>>>>>           if (__get_inst(&opcode, (u32 *)era, user))
>>>>>>>>                   goto out_sigsegv;
>>>>>>>> @@ -514,7 +515,8 @@ asmlinkage void noinstr do_ri(struct 
>>>>>>>> pt_regs *regs)
>>>>>>>>           unsigned int __user *era = (unsigned int __user 
>>>>>>>> *)exception_era(regs);
>>>>>>>>           irqentry_state_t state = irqentry_enter(regs);
>>>>>>>>
>>>>>>>> -       local_irq_enable();
>>>>>>>> +       if (regs->csr_prmd & CSR_PRMD_PIE)
>>>>>>>> +               local_irq_enable();
>>>>>>>>           current->thread.trap_nr = read_csr_excode();
>>>>>>>>
>>>>>>>>           if (notify_die(DIE_RI, "RI Fault", regs, 0, 
>>>>>>>> current->thread.trap_nr,
>>>>>>>> @@ -606,8 +608,8 @@ asmlinkage void noinstr do_fpu(struct 
>>>>>>>> pt_regs *regs)
>>>>>>>>    {
>>>>>>>>           irqentry_state_t state = irqentry_enter(regs);
>>>>>>>>
>>>>>>>> -       local_irq_enable();
>>>>>>>>           die_if_kernel("do_fpu invoked from kernel context!", 
>>>>>>>> regs);
>>>>>>>> +       local_irq_enable();
>>>>>>>>           BUG_ON(is_lsx_enabled());
>>>>>>>>           BUG_ON(is_lasx_enabled());
>>>>>>>>
>>>>>>>> @@ -623,13 +625,13 @@ asmlinkage void noinstr do_lsx(struct 
>>>>>>>> pt_regs *regs)
>>>>>>>>    {
>>>>>>>>           irqentry_state_t state = irqentry_enter(regs);
>>>>>>>>
>>>>>>>> +       die_if_kernel("do_lsx invoked from kernel context!", 
>>>>>>>> regs);
>>>>>>>>           local_irq_enable();
>>>>>>>>           if (!cpu_has_lsx) {
>>>>>>>>                   force_sig(SIGILL);
>>>>>>>>                   goto out;
>>>>>>>>           }
>>>>>>>>
>>>>>>>> -       die_if_kernel("do_lsx invoked from kernel context!", 
>>>>>>>> regs);
>>>>>>>>           BUG_ON(is_lasx_enabled());
>>>>>>>>
>>>>>>>>           preempt_disable();
>>>>>>>> @@ -645,14 +647,13 @@ asmlinkage void noinstr do_lasx(struct 
>>>>>>>> pt_regs *regs)
>>>>>>>>    {
>>>>>>>>           irqentry_state_t state = irqentry_enter(regs);
>>>>>>>>
>>>>>>>> +       die_if_kernel("do_lasx invoked from kernel context!", 
>>>>>>>> regs);
>>>>>>>>           local_irq_enable();
>>>>>>>>           if (!cpu_has_lasx) {
>>>>>>>>                   force_sig(SIGILL);
>>>>>>>>                   goto out;
>>>>>>>>           }
>>>>>>>>
>>>>>>>> -       die_if_kernel("do_lasx invoked from kernel context!", 
>>>>>>>> regs);
>>>>>>>> -
>>>>>>>>           preempt_disable();
>>>>>>>>           init_restore_lasx();
>>>>>>>>           preempt_enable();
>>>>>>>> @@ -666,6 +667,7 @@ asmlinkage void noinstr do_lbt(struct 
>>>>>>>> pt_regs *regs)
>>>>>>>>    {
>>>>>>>>           irqentry_state_t state = irqentry_enter(regs);
>>>>>>>>
>>>>>>>> +       die_if_kernel("do_lbt invoked from kernel context!", 
>>>>>>>> regs);
>>>>>>>>           local_irq_enable();
>>>>>>>>           force_sig(SIGILL);
>>>>>>>>           local_irq_disable();
>>>>>>>> @@ -677,7 +679,6 @@ asmlinkage void noinstr do_reserved(struct 
>>>>>>>> pt_regs *regs)
>>>>>>>>    {
>>>>>>>>           irqentry_state_t state = irqentry_enter(regs);
>>>>>>>>
>>>>>>>> -       local_irq_enable();
>>>>>>>>           /*
>>>>>>>>            * Game over - no way to handle this if it ever 
>>>>>>>> occurs. Most probably
>>>>>>>>            * caused by a fatal error after another 
>>>>>>>> hardware/software error.
>>>>>>>> @@ -685,8 +686,8 @@ asmlinkage void noinstr do_reserved(struct 
>>>>>>>> pt_regs *regs)
>>>>>>>>           pr_err("Caught reserved exception %u on pid:%d [%s] - 
>>>>>>>> should not happen\n",
>>>>>>>>                   read_csr_excode(), current->pid, current->comm);
>>>>>>>>           die_if_kernel("do_reserved exception", regs);
>>>>>>>> +       local_irq_enable();
>>>>>>>>           force_sig(SIGUNUSED);
>>>>>>>> -
>>>>>>>>           local_irq_disable();
>>>>>>>>
>>>>>>>>           irqentry_exit(regs, state);
>>>>>>>> -- 
>>>>>>>> 2.34.3
>>>>>>>>
>>>>>>
>>>>
>>>
>>

