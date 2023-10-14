Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C6DB2586
	for <loongarch@lists.linux.dev>; Sat, 14 Oct 2023 09:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxxPCTXSplUf4xAA--.31888S3;
	Sat, 14 Oct 2023 17:21:23 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Ax3tyQXSplKREkAA--.9803S3;
	Sat, 14 Oct 2023 17:21:21 +0800 (CST)
Subject: Re: [PATCH v2 8/8] LoongArch: Add ORC unwinder support
To: Huacai Chen <chenhuacai@kernel.org>
References: <1696856590-30298-1-git-send-email-yangtiezhu@loongson.cn>
 <1696856590-30298-9-git-send-email-yangtiezhu@loongson.cn>
 <CAAhV-H4pVRLPZ9OrfvV-UbPm1kRRJ0gpTqRtVbDd-eA5WzUaXg@mail.gmail.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <bd40004b-10af-3c06-5ae0-750850f31446@loongson.cn>
Date: Sat, 14 Oct 2023 17:21:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H4pVRLPZ9OrfvV-UbPm1kRRJ0gpTqRtVbDd-eA5WzUaXg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Ax3tyQXSplKREkAA--.9803S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxJw4UGryfXFWxKry8Zw4rXrc_yoWrKr45pF
	WDuFs2qF4kKF1qyr1jqw15ZrWDt3s7G343WFn8Ga409w4vqrnrGrsF9rZ8WF1qgF48t3yS
	vF1rW3yIqF45AacCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAF
	wI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4
	CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JV
	WxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU20PS
	UUUUU



On 10/11/2023 12:37 PM, Huacai Chen wrote:
> Hi, Tiezhu,
>
> Maybe "LoongArch: Add ORC stack unwinder support" is better.

OK, will modify it.

>
> On Mon, Oct 9, 2023 at 9:03 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>>
>> The kernel CONFIG_UNWINDER_ORC option enables the ORC unwinder, which is
>> similar in concept to a DWARF unwinder. The difference is that the format
>> of the ORC data is much simpler than DWARF, which in turn allows the ORC
>> unwinder to be much simpler and faster.

...

>> +ifdef CONFIG_OBJTOOL
>> +# https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ecb802d02eeb
>> +# https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=816029e06768
>> +ifeq ($(shell as --help 2>&1 | grep -e '-mthin-add-sub'),)
>> +  $(error Sorry, you need a newer gas version with -mthin-add-sub option)
> I prefer no error out here, because without this option we can still
> built a runnable kernel.

I agree with you that it is better to not error out to stop compilation,
but there are many objtool warnings during the compile process with old
binutils, so it is necessary to give a warning so that the users know
what happened and how to fix the lots of objtool warnings.

That is to say, I would prefer to replace "error" with "warning".

>> +endif
>> +KBUILD_AFLAGS  += $(call cc-option,-mthin-add-sub) $(call cc-option,-Wa$(comma)-mthin-add-sub)
>> +KBUILD_CFLAGS  += $(call cc-option,-mthin-add-sub) $(call cc-option,-Wa$(comma)-mthin-add-sub)
>> +KBUILD_CFLAGS  += -fno-optimize-sibling-calls -fno-jump-tables -falign-functions=4
>> +endif

...

>> +#define ORC_REG_BP                     3
> Use FP instead of BP in this patch, too.

OK, will do it.

>
>> +#define ORC_REG_MAX                    4

...

>> +.macro UNWIND_HINT_UNDEFINED
>
>> +       UNWIND_HINT type=UNWIND_HINT_TYPE_UNDEFINED
>> +.endm
> We don't need to set sp_reg=ORC_REG_UNDEFINED for UNWIND_HINT_UNDEFINED?

Yes, no need to set sp_reg, the instructions marked with UNDEFINED
are blind spots in ORC coverage, it is no related with stack trace,
this is similar with x86.

>
>> +
>> +.macro UNWIND_HINT_EMPTY
>> +       UNWIND_HINT sp_reg=ORC_REG_UNDEFINED type=UNWIND_HINT_TYPE_CALL
>> +.endm
> We don't need to define UNWIND_HINT_END_OF_STACK?

Yes, it is useless now.

>
>> +
>> +.macro UNWIND_HINT_REGS
>> +       UNWIND_HINT sp_reg=ORC_REG_SP type=UNWIND_HINT_TYPE_REGS
>> +.endm
>> +
>> +.macro UNWIND_HINT_FUNC
>> +       UNWIND_HINT sp_reg=ORC_REG_SP type=UNWIND_HINT_TYPE_CALL
>> +.endm
> We don't need to set sp_offset for UNWIND_HINT_REGS and UNWIND_HINT_FUNC?

sp_offset is 0 by default, no need to set it unless you need to change
its value, see include/linux/objtool.h
.macro UNWIND_HINT type:req sp_reg=0 sp_offset=0 signal=0

>
>> +
>> +#endif /* __ASSEMBLY__ */

...

>> diff --git a/arch/loongarch/kernel/entry.S b/arch/loongarch/kernel/entry.S
>> index 65518bb..e43115f 100644
>> --- a/arch/loongarch/kernel/entry.S
>> +++ b/arch/loongarch/kernel/entry.S
>> @@ -14,11 +14,13 @@
>>  #include <asm/regdef.h>
>>  #include <asm/stackframe.h>
>>  #include <asm/thread_info.h>
>> +#include <asm/unwind_hints.h>
>>
>>         .text
>>         .cfi_sections   .debug_frame
>>         .align  5
>> -SYM_FUNC_START(handle_syscall)
>> +SYM_CODE_START(handle_syscall)
> Why?
>

see include/linux/linkage.h
FUNC -- C-like functions (proper stack frame etc.)
CODE -- non-C code (e.g. irq handlers with different, special stack etc.)

>> +       UNWIND_HINT_UNDEFINED
>>         csrrd           t0, PERCPU_BASE_KS

...

>> diff --git a/arch/loongarch/kernel/head.S b/arch/loongarch/kernel/head.S
>> index 53b883d..5664390 100644
>> --- a/arch/loongarch/kernel/head.S
>> +++ b/arch/loongarch/kernel/head.S
>> @@ -43,6 +43,7 @@ SYM_DATA(kernel_offset, .long _kernel_offset);
>>         .align 12
>>
>>  SYM_CODE_START(kernel_entry)                   # kernel entry point
>> +       UNWIND_HINT_EMPTY
> I'm not sure but I think this isn't needed, because
> "OBJECT_FILES_NON_STANDARD_head.o               :=y"

Yes, you are right, will remove it.

>
>>
>>         /* Config direct window and set PG */

...

>>  void __init setup_arch(char **cmdline_p)
>>  {
>> +       unwind_init();
> I think this line should be after cpu_probe().

I am OK to do this change, but if so, there are no stack trace before
cpu_probe() for the early code.

>
>>         cpu_probe();
>>
>>         init_environ();

...

>> diff --git a/arch/loongarch/power/Makefile b/arch/loongarch/power/Makefile
>> index 58151d0..bbd1d47 100644
>> --- a/arch/loongarch/power/Makefile
>> +++ b/arch/loongarch/power/Makefile
>> @@ -1,3 +1,5 @@
>> +OBJECT_FILES_NON_STANDARD_suspend_asm.o := y
> hibernate_asm.o has no problem?

Yes, only suspend_asm.o has one warning, just ignore it.

Thanks,
Tiezhu

