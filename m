Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0FD32ED17B
	for <loongarch@lists.linux.dev>; Mon, 29 Dec 2025 07:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766992257; cv=none; b=Zp16ceKMFh8BVQVi9OpLfO5tpI2/XQLPEf73E3UJ09CkJwyL4XOTfxcLoRB/K5CIXigeHhwBV8MknT0n1R4XFpP3Ie3EdZA9ehOnnr8LE2CEFjqXLYJvygcJsXQ98yosOTqcAMfVwPMKheQtBDgd2t71zXci1oMcp5MM6lMq48o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766992257; c=relaxed/simple;
	bh=al5GYxfpxY29juK7EsSY5GVxtT8qw8/4U40XL1sS5uw=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=B6wxdhWbnr89+XESSzBXEz/7b3a4E8XhXdMe/hT0LH9qfsWL3DLuLijqoENH/w0xpbAAMFD135Dxt9ICj5OI03QdyI5SKEXR2IyRwxGzJjuuLFHQehXW9y4TYOnrj1ZQLtt/dK5asaJNWCaWJ1zb3HKyX4y1qTNDKiCzYvn8xBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [111.9.175.10])
	by gateway (Coremail) with SMTP id _____8Axy8J0KVJpbgUEAA--.12351S3;
	Mon, 29 Dec 2025 15:10:44 +0800 (CST)
Received: from [10.136.12.26] (unknown [111.9.175.10])
	by front1 (Coremail) with SMTP id qMiowJDxSMFwKVJpTBoGAA--.2560S3;
	Mon, 29 Dec 2025 15:10:43 +0800 (CST)
Subject: Re: [PATCH V3 2/2] LoongArch: KVM: fix "unreliable stack" issue
To: lixianglai <lixianglai@loongson.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, stable@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Charlie Jenkins <charlie@rivosinc.com>, Thomas Gleixner
 <tglx@linutronix.de>, Tiezhu Yang <yangtiezhu@loongson.cn>
References: <20251227012712.2921408-1-lixianglai@loongson.cn>
 <20251227012712.2921408-3-lixianglai@loongson.cn>
 <08143343-cb10-9376-e7df-68ad854b9275@loongson.cn>
 <9e1a8d4f-251f-f78e-01a3-5c483249fac8@loongson.cn>
From: Jinyang He <hejinyang@loongson.cn>
Message-ID: <dec5cb06-6858-20f2-facb-d5e7f44f5d16@loongson.cn>
Date: Mon, 29 Dec 2025 15:10:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <9e1a8d4f-251f-f78e-01a3-5c483249fac8@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowJDxSMFwKVJpTBoGAA--.2560S3
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoW3JFy5Aw43WFy8Ww48uw4Dtrc_yoWfXF13pw
	nayFsxtrWDt34kAw4UK3WDAryIqrW8G3W7Wr1xXFy8Ar4DZr1Yqr48Xw1v9ryDA3y8WFyU
	XFW5t3WDZa1DAFcCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
	ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8cz
	VUUUUUU==


On 2025-12-29 11:53, lixianglai wrote:
> Hi Jinyang:
>> On 2025-12-27 09:27, Xianglai Li wrote:
>>
>>> Insert the appropriate UNWIND macro definition into the 
>>> kvm_exc_entry in
>>> the assembly function to guide the generation of correct ORC table 
>>> entries,
>>> thereby solving the timeout problem of loading the livepatch-sample 
>>> module
>>> on a physical machine running multiple vcpus virtual machines.
>>>
>>> While solving the above problems, we have gained an additional benefit,
>>> that is, we can obtain more call stack information
>>>
>>> Stack information that can be obtained before the problem is fixed:
>>> [<0>] kvm_vcpu_block+0x88/0x120 [kvm]
>>> [<0>] kvm_vcpu_halt+0x68/0x580 [kvm]
>>> [<0>] kvm_emu_idle+0xd4/0xf0 [kvm]
>>> [<0>] kvm_handle_gspr+0x7c/0x700 [kvm]
>>> [<0>] kvm_handle_exit+0x160/0x270 [kvm]
>>> [<0>] kvm_exc_entry+0x100/0x1e0
>>>
>>> Stack information that can be obtained after the problem is fixed:
>>> [<0>] kvm_vcpu_block+0x88/0x120 [kvm]
>>> [<0>] kvm_vcpu_halt+0x68/0x580 [kvm]
>>> [<0>] kvm_emu_idle+0xd4/0xf0 [kvm]
>>> [<0>] kvm_handle_gspr+0x7c/0x700 [kvm]
>>> [<0>] kvm_handle_exit+0x160/0x270 [kvm]
>>> [<0>] kvm_exc_entry+0x104/0x1e4
>>> [<0>] kvm_enter_guest+0x38/0x11c
>>> [<0>] kvm_arch_vcpu_ioctl_run+0x26c/0x498 [kvm]
>>> [<0>] kvm_vcpu_ioctl+0x200/0xcf8 [kvm]
>>> [<0>] sys_ioctl+0x498/0xf00
>>> [<0>] do_syscall+0x98/0x1d0
>>> [<0>] handle_syscall+0xb8/0x158
>>>
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Xianglai Li <lixianglai@loongson.cn>
>>> ---
>>> Cc: Huacai Chen <chenhuacai@kernel.org>
>>> Cc: WANG Xuerui <kernel@xen0n.name>
>>> Cc: Tianrui Zhao <zhaotianrui@loongson.cn>
>>> Cc: Bibo Mao <maobibo@loongson.cn>
>>> Cc: Charlie Jenkins <charlie@rivosinc.com>
>>> Cc: Xianglai Li <lixianglai@loongson.cn>
>>> Cc: Thomas Gleixner <tglx@linutronix.de>
>>> Cc: Tiezhu Yang <yangtiezhu@loongson.cn>
>>>
>>>   arch/loongarch/kvm/switch.S | 28 +++++++++++++++++++---------
>>>   1 file changed, 19 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/arch/loongarch/kvm/switch.S b/arch/loongarch/kvm/switch.S
>>> index 93845ce53651..a3ea9567dbe5 100644
>>> --- a/arch/loongarch/kvm/switch.S
>>> +++ b/arch/loongarch/kvm/switch.S
>>> @@ -10,6 +10,7 @@
>>>   #include <asm/loongarch.h>
>>>   #include <asm/regdef.h>
>>>   #include <asm/unwind_hints.h>
>>> +#include <linux/kvm_types.h>
>>>     #define HGPR_OFFSET(x)        (PT_R0 + 8*x)
>>>   #define GGPR_OFFSET(x)        (KVM_ARCH_GGPR + 8*x)
>>> @@ -110,9 +111,9 @@
>>>        * need to copy world switch code to DMW area.
>>>        */
>>>       .text
>>> +    .p2align PAGE_SHIFT
>>>       .cfi_sections    .debug_frame
>>>   SYM_CODE_START(kvm_exc_entry)
>>> -    .p2align PAGE_SHIFT
>>>       UNWIND_HINT_UNDEFINED
>>>       csrwr    a2,   KVM_TEMP_KS
>>>       csrrd    a2,   KVM_VCPU_KS
>>> @@ -170,6 +171,7 @@ SYM_CODE_START(kvm_exc_entry)
>>>       /* restore per cpu register */
>>>       ld.d    u0, a2, KVM_ARCH_HPERCPU
>>>       addi.d    sp, sp, -PT_SIZE
>>> +    UNWIND_HINT_REGS
>>>         /* Prepare handle exception */
>>>       or    a0, s0, zero
>>> @@ -200,7 +202,7 @@ ret_to_host:
>>>       jr      ra
>>>     SYM_CODE_END(kvm_exc_entry)
>>> -EXPORT_SYMBOL(kvm_exc_entry)
>>> +EXPORT_SYMBOL_FOR_KVM(kvm_exc_entry)
>>>     /*
>>>    * int kvm_enter_guest(struct kvm_run *run, struct kvm_vcpu *vcpu)
>>> @@ -215,6 +217,14 @@ SYM_FUNC_START(kvm_enter_guest)
>>>       /* Save host GPRs */
>>>       kvm_save_host_gpr a2
>>>   +    /*
>>> +     * The csr_era member variable of the pt_regs structure is 
>>> required
>>> +     * for unwinding orc to perform stack traceback, so we need to put
>>> +     * pc into csr_era member variable here.
>>> +     */
>>> +    pcaddi    t0, 0
>>> +    st.d    t0, a2, PT_ERA
>> Hi, Xianglai,
>>
>> It should use `SYM_CODE_START` to mark the `kvm_enter_guest` rather than
>> `SYM_FUNC_START`, since the `SYM_FUNC_START` is used to mark "C-likely"
>> asm functionw. 
>
> Ok, I will use SYM_CODE_START to mark kvm_enter_guest in the next 
> version.
>
>> I guess the kvm_enter_guest is something like exception
>> handler becuase the last instruction is "ertn". So usually it should
>> mark UNWIND_HINT_REGS where can find last frame info by "$sp".
>> However, all info is store to "$a2", this mark should be
>>   `UNWIND_HINT sp_reg=ORC_REG_A2(???) type=UNWIND_HINT_TYPE_REGS`.
>> I don't konw why save this function internal PC here by `pcaddi t0, 0`,
>> and I think it is no meaning(, for exception handler, they save last PC
>> by read CSR.ERA). The `kvm_enter_guest` saves registers by
>> "$a2"("$sp" - PT_REGS) beyond stack ("$sp"), it is dangerous if IE
>> is enable. So I wonder if there is really a stacktrace through this 
>> function?
>>
> The stack backtracking issue in switch.S is rather complex because it 
> involves the switching between cpu root-mode and guest-mode:
> Real stack backtracking should be divided into two parts:
> part 1:
>     [<0>] kvm_enter_guest+0x38/0x11c
>     [<0>] kvm_arch_vcpu_ioctl_run+0x26c/0x498 [kvm]
>     [<0>] kvm_vcpu_ioctl+0x200/0xcf8 [kvm]
>     [<0>] sys_ioctl+0x498/0xf00
>     [<0>] do_syscall+0x98/0x1d0
>     [<0>] handle_syscall+0xb8/0x158
>
> part 2:
>     [<0>] kvm_vcpu_block+0x88/0x120 [kvm]
>     [<0>] kvm_vcpu_halt+0x68/0x580 [kvm]
>     [<0>] kvm_emu_idle+0xd4/0xf0 [kvm]
>     [<0>] kvm_handle_gspr+0x7c/0x700 [kvm]
>     [<0>] kvm_handle_exit+0x160/0x270 [kvm]
>     [<0>] kvm_exc_entry+0x104/0x1e4
>
>
> In "part 1", after executing kvm_enter_guest, the cpu switches from 
> root-mode to guest-mode.
> In this case, stack backtracking is indeed very rare.
>
> In "part 2", the cpu switches from the guest-mode to the root-mode,
> and most of the stack backtracking occurs during this phase.
>
> To obtain the longest call chain, we save pc in kvm_enter_guest to 
> pt_regs.csr_era,
> and after restoring the sp of the root-mode cpu in kvm_exc_entry,
> The ORC entry was re-established using "UNWIND_HINT_REGS",
>  and then we obtained the following stack backtrace as we wanted:
>
>     [<0>] kvm_vcpu_block+0x88/0x120 [kvm]
>     [<0>] kvm_vcpu_halt+0x68/0x580 [kvm]
>     [<0>] kvm_emu_idle+0xd4/0xf0 [kvm]
>     [<0>] kvm_handle_gspr+0x7c/0x700 [kvm]
>     [<0>] kvm_handle_exit+0x160/0x270 [kvm]
>     [<0>] kvm_exc_entry+0x104/0x1e4
I found this might be a coincidence—correct behavior due to the incorrect
UNWIND_HINT_REGS mark and unusual stack adjustment.

First, the kvm_enter_guest contains only a single branch instruction, ertn.
It hardware-jump to the CSR.ERA address directly, jump into kvm_exc_entry.

At this point, the stack layout looks like this:
-------------------------------
   frame from call to `kvm_enter_guest`
-------------------------------  <- $sp
   PT_REGS
-------------------------------  <- $a2

Then kvm_exc_entry adjust stack without save any register (e.g. $ra, $sp)
but still marked UNWIND_HINT_REGS.
After the adjustment:
-------------------------------
   frame from call to `kvm_enter_guest`
-------------------------------
   PT_REGS
-------------------------------  <- $a2, new $sp

During unwinding, when the unwinder reaches kvm_exc_entry,
it meets the mark of PT_REGS and correctly recovers
  pc = regs.csr_era, sp = regs.sp, ra = regs.ra

a) Can we avoid "ertn" rather than `jr reg (or jirl ra, reg, 0)`
instead, like call? The kvm_exc_entry cannot back to kvm_enter_guest
if we use "ertn", so should the kvm_enter_guest appear on the stacktrace?

b) Can we adjust $sp before entering kvm_exc_entry? Then we can mark
UNWIND_HINT_REGS at the beginning of kvm_exc_entry, which something
like ret_from_kernel_thread_asm.

> [<0>] kvm_enter_guest+0x38/0x11c
>     [<0>] kvm_arch_vcpu_ioctl_run+0x26c/0x498 [kvm]
>     [<0>] kvm_vcpu_ioctl+0x200/0xcf8 [kvm]
>     [<0>] sys_ioctl+0x498/0xf00
>     [<0>] do_syscall+0x98/0x1d0
>     [<0>] handle_syscall+0xb8/0x158
>
> Doing so is equivalent to ignoring the details of the cpu root-mode 
> and guest-mode switching.
> About what you said in the IE enable phase is dangerous,
> interrupts are always off during the cpu root-mode and guest-mode 
> switching in kvm_enter_guest and kvm_exc_entry.
>

