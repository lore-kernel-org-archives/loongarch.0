Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68EAE944D
	for <loongarch@lists.linux.dev>; Fri, 24 Nov 2023 08:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from loongson.cn (unknown [111.9.175.10])
	by gateway (Coremail) with SMTP id _____8AxTevjXmBlUIY8AA--.49265S3;
	Fri, 24 Nov 2023 16:29:24 +0800 (CST)
Received: from [10.136.12.26] (unknown [111.9.175.10])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Axji_fXmBlCnpLAA--.35916S3;
	Fri, 24 Nov 2023 16:29:21 +0800 (CST)
Subject: Re: [PATCH] LoongArch: Check unwind_error() in show_backtrace()
To: Hengqi Chen <hengqi.chen@gmail.com>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
 kernel@xen0n.name, Tiezhu Yang <yangtiezhu@loongson.cn>
References: <20231124014822.7894-1-hengqi.chen@gmail.com>
 <cdc62ae9-87f0-c9c8-a37a-d2fe24c224af@loongson.cn>
 <CAAhV-H6xZBWzuPBSMDAmiuL=VV39Z9HJ+e0i0+BQuJo63b9ekg@mail.gmail.com>
 <8f54c95e-ec45-3b9a-013c-b7521a2eb685@loongson.cn>
 <CAAhV-H54EQe8AkqxTKDCEx8Np4mnanNNNek0412+M-hB=LkUVQ@mail.gmail.com>
From: Jinyang He <hejinyang@loongson.cn>
Message-ID: <7e516467-bb86-f139-78d4-f0c64718b2ff@loongson.cn>
Date: Fri, 24 Nov 2023 16:29:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H54EQe8AkqxTKDCEx8Np4mnanNNNek0412+M-hB=LkUVQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:AQAAf8Axji_fXmBlCnpLAA--.35916S3
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoW3Xw1ftw1rAw1kJF43Cw4fCrX_yoW3GF4Upr
	98AFnIkrW8JryIq3srKryUZrWDtr1DuF12gF1kJF15CF1vqr12qryjvFyj9Fs0yrZ5Ja40
	qFs5Jrya9a1UJagCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw
	1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jb
	_-PUUUUU=


On 2023-11-24 15:17, Huacai Chen wrote:
> On Fri, Nov 24, 2023 at 3:11 PM Jinyang He <hejinyang@loongson.cn> wrote:
>> On 2023-11-24 14:27, Huacai Chen wrote:
>>
>>> Hi, Jinyang,
>>>
>>> On Fri, Nov 24, 2023 at 10:34 AM Jinyang He <hejinyang@loongson.cn> wrote:
>>>> On 2023-11-24 09:48, Hengqi Chen wrote:
>>>>> While tracking down the CPU stall issues ([0]), I saw
>>>>> that show_backtrace() stuck in an infinite loop ([1]):
>>>>>
>>>>>      [  153.610816] Call Trace:
>>>>>      [  153.610929] [<9000000002723eb8>] show_stack+0x5c/0x180
>>>>>      [  153.611252] [<90000000038e9954>] dump_stack_lvl+0x60/0x88
>>>>>      [  153.611349] [<90000000038cf8ec>] rcu_dump_cpu_stacks+0xf8/0x150
>>>>>      [  153.611452] [<90000000027dc5dc>] rcu_sched_clock_irq+0x69c/0xf10
>>>>>      [  153.611585] [<90000000027f0dfc>] update_process_times+0x6c/0xb4
>>>>>      [  153.611696] [<9000000002801fb8>] tick_nohz_highres_handler+0x54/0xe0
>>>>>      [  153.611808] [<90000000027f1898>] __hrtimer_run_queues+0x178/0x344
>>>>>      [  153.611909] [<90000000027f29dc>] hrtimer_interrupt+0x108/0x28c
>>>>>      [  153.612009] [<90000000027269c4>] constant_timer_interrupt+0x38/0x48
>>>>>      [  153.612113] [<90000000027b7824>] __handle_irq_event_percpu+0x68/0x24c
>>>>>      [  153.612223] [<90000000027b7a20>] handle_irq_event_percpu+0x18/0x6c
>>>>>      [  153.612327] [<90000000027bdae0>] handle_percpu_irq+0x54/0x88
>>>>>      [  153.612420] [<90000000027b6af8>] generic_handle_domain_irq+0x28/0x40
>>>>>      [  153.612524] [<9000000003085b0c>] handle_cpu_irq+0x6c/0xa8
>>>>>      [  153.612621] [<90000000038e9c28>] handle_loongarch_irq+0x30/0x48
>>>>>      [  153.612721] [<90000000038e9cc0>] do_vint+0x80/0xb4
>>>>>      [  153.612906] [<90000000038e9cc0>] do_vint+0x80/0xb4
>>>>>      [  153.612985] [<90000000038e9cc0>] do_vint+0x80/0xb4
>>>>>      [  153.613066] [<90000000038e9cc0>] do_vint+0x80/0xb4
>>>>>      [  153.613150] [<90000000038e9cc0>] do_vint+0x80/0xb4
>>>>>      ...
>>>>>
>>>>> This is because the unwinder does not stop immediately when
>>>>> it reaches non-kernel stackframe at which point it sets
>>>>> unwind_state::error.
>>>> Hi, Hengqi,
>>>>
>>>>
>>>> I think we can set `state->stack_info.type = STACK_TYPE_UNKNOWN` in
>>>> next_frame() where set `state->error = true`.
>>>>
>>>> Stack type change to unknown also indicate that the unwind should stop.
>>> In this way arch_stack_walk() don't need to call unwind_error() any
>>> more?
>> Yes. But I think we should not set error in next_frame `if
>> (user_mode(regs) || !__kernel_text_address(pc))`, because it indicate it
>> should be user stack. Set `state->stack_info.type = STACK_TYPE_UNKNOWN`
>> is ok, or call get_stack_info() may also be ok. See [1] and follows,
>>
>>
>>>    But then what is the real difference between unwind_done() and
>>> unwind_error()?
>> unwind_done() means we should finish unwind because stack type is
>> unexpected, not in irq stack or in task stack. Usually unwind exit when
>> it meets user stack, it is probably a normal exit. In most cases it
>> should be a flag of normal exit.
>> unwind_error() means we should finish unwind because something
>> unexpected which maybe caused by previous wrong unwind. For ORC
>> unwinder, we may meet unexpected ORC info and set error. unwind_error()
>> shows stack is unreliable.
> Then you mean replace `state->error = true` with
> `state->stack_info.type = STACK_TYPE_UNKNOWN` rather than add
> `state->stack_info.type = STACK_TYPE_UNKNOWN` after  `state->error =
> true` in Tiezhu's patch? If so, I suggest you submit a patch because
> Hengqi may also be confusing (but I'm not sure) here.

Hi, Hengqi,


I created a diff as follows. But I couldn't test it by the way mentioned 
in [2],

(and I always got the right result in Qemu). Can you test it in your way?

As Huacai said, if you're confused about this, I'm happy to submit this 
diff as well.

diff --git a/arch/loongarch/kernel/stacktrace.c 
b/arch/loongarch/kernel/stacktrace.c
index 92270f14db94..f623feb2129f 100644
--- a/arch/loongarch/kernel/stacktrace.c
+++ b/arch/loongarch/kernel/stacktrace.c
@@ -32,7 +32,7 @@ void arch_stack_walk(stack_trace_consume_fn 
consume_entry, void *cookie,
      }

      for (unwind_start(&state, task, regs);
-         !unwind_done(&state) && !unwind_error(&state); 
unwind_next_frame(&state)) {
+         !unwind_done(&state); unwind_next_frame(&state)) {
          addr = unwind_get_return_address(&state);
          if (!addr || !consume_entry(cookie, addr))
              break;
diff --git a/arch/loongarch/kernel/unwind.c b/arch/loongarch/kernel/unwind.c
index ba324ba76fa1..a463d6961344 100644
--- a/arch/loongarch/kernel/unwind.c
+++ b/arch/loongarch/kernel/unwind.c
@@ -28,6 +28,5 @@ bool default_next_frame(struct unwind_state *state)

      } while (!get_stack_info(state->sp, state->task, info));

-    state->error = true;
      return false;
  }
diff --git a/arch/loongarch/kernel/unwind_prologue.c 
b/arch/loongarch/kernel/unwind_prologue.c
index 55afc27320e1..929ae240280a 100644
--- a/arch/loongarch/kernel/unwind_prologue.c
+++ b/arch/loongarch/kernel/unwind_prologue.c
@@ -227,7 +227,7 @@ static bool next_frame(struct unwind_state *state)
      } while (!get_stack_info(state->sp, state->task, info));

  out:
-    state->error = true;
+    state->stack_info.type = STACK_TYPE_UNKNOWN;
      return false;
  }


[2] 
https://lore.kernel.org/all/8a44ad71-68d2-4926-892f-72bfc7a67e2a@roeck-us.net/

Thanks,

Jinyang


> Huacai
>>
>> [1]
>> https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git/tree/arch/x86/kernel/unwind_orc.c?h=loongarch-next#n678
>>
>>
>> Jinyang
>>
>>
>>> Huacai
>>>
>>>> The patch way makes us need fix the other place where call unwind_XXX().
>>>>
>>>> Seems commit 370a3b8f5874 ("LoongArch: Check unwind_error() in
>>>> arch_stack_walk()") can be improved.
>>>>
>>>>
>>>> Thanks,
>>>>
>>>> Jinyang
>>>>
>>>>
>>>>> Add the missing unwind_error() check
>>>>> to resolve the issue.
>>>>>
>>>>>      [0]: https://lore.kernel.org/loongarch/CAEyhmHT6UOryPZi7eEfw01Y_CjAqxy8NM6eKkdvdojJqB9P7eQ@mail.gmail.com/T/#u
>>>>>      [1]: https://github.com/chenhengqi/public/blob/main/verifier_movsx
>>>>>
>>>>> Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
>>>>> ---
>>>>>     arch/loongarch/kernel/traps.c | 3 ++-
>>>>>     1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
>>>>> index aebfc3733a76..63bf24295e3d 100644
>>>>> --- a/arch/loongarch/kernel/traps.c
>>>>> +++ b/arch/loongarch/kernel/traps.c
>>>>> @@ -65,7 +65,8 @@ static void show_backtrace(struct task_struct *task, const struct pt_regs *regs,
>>>>>
>>>>>         printk("%sCall Trace:", loglvl);
>>>>>         for (unwind_start(&state, task, pregs);
>>>>> -           !unwind_done(&state); unwind_next_frame(&state)) {
>>>>> +         !unwind_done(&state) && !unwind_error(&state);
>>>>> +          unwind_next_frame(&state)) {
>>>>>                 addr = unwind_get_return_address(&state);
>>>>>                 print_ip_sym(loglvl, addr);
>>>>>         }

