Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73F221F30AD
	for <loongarch@lists.linux.dev>; Mon, 29 Dec 2025 03:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766980615; cv=none; b=HoT58xMtP0/LCTV7FJbPEen8mDNkvRH/6LH0mBRdBHIjbgWTkN6gs1a8j/65lf/p/3m3fu5k3GOEivUWqoXusTQY9O4jL2yj8BWrvjHk/tB1BNs8I2T8EokQVak0lDjP8yh8dlqRnWVDIINwklg05bIvF0JQRht8I5tEWDEwXYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766980615; c=relaxed/simple;
	bh=auME+iOUeBLbnYL2aNtxKWeY0Dek3Zio5HMa2rdq8bc=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=XLGp+GyZ1fMi0uol0jifrJ1MjUkGbNBDWM3W9cEP+rQedOyyjJ0WO9DNHKsAR6HJ4jYY1eCI4AVxX1jyY0TH3hVHW8X8o8RSjj/ok1J8kBQpiMQ/CX3wsp9iQpYzJLVi5v3Gx5KyEQlUdPP3g4TvWv1R+vUe/VeLYMxiPUoRpzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.126])
	by gateway (Coremail) with SMTP id _____8Axz8P9+1FpyvsDAA--.12883S3;
	Mon, 29 Dec 2025 11:56:45 +0800 (CST)
Received: from [10.20.42.126] (unknown [10.20.42.126])
	by front1 (Coremail) with SMTP id qMiowJCxPML5+1FpyQ0GAA--.14067S3;
	Mon, 29 Dec 2025 11:56:43 +0800 (CST)
Subject: Re: [PATCH V3 2/2] LoongArch: KVM: fix "unreliable stack" issue
To: Jinyang He <hejinyang@loongson.cn>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Cc: stable@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Tianrui Zhao <zhaotianrui@loongson.cn>,
 Bibo Mao <maobibo@loongson.cn>, Charlie Jenkins <charlie@rivosinc.com>,
 Thomas Gleixner <tglx@linutronix.de>, Tiezhu Yang <yangtiezhu@loongson.cn>
References: <20251227012712.2921408-1-lixianglai@loongson.cn>
 <20251227012712.2921408-3-lixianglai@loongson.cn>
 <08143343-cb10-9376-e7df-68ad854b9275@loongson.cn>
From: lixianglai <lixianglai@loongson.cn>
Message-ID: <9e1a8d4f-251f-f78e-01a3-5c483249fac8@loongson.cn>
Date: Mon, 29 Dec 2025 11:53:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <08143343-cb10-9376-e7df-68ad854b9275@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowJCxPML5+1FpyQ0GAA--.14067S3
X-CM-SenderInfo: 5ol0xt5qjotxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW3JFyUZF4xAr1kAFy8Xw4UJrc_yoWDJw1Upw
	nayFs0yFWDC3s5Xw4UGFyDAryftF4kJ3WUWrn7JFyrJr1UGryYqF18Xw1q9r9rXw48JFyk
	Xa4UXrn8ZrWDJagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
	AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8Zw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU25Ef
	UUUUU

Hi Jinyang:
> On 2025-12-27 09:27, Xianglai Li wrote:
>
>> Insert the appropriate UNWIND macro definition into the kvm_exc_entry in
>> the assembly function to guide the generation of correct ORC table 
>> entries,
>> thereby solving the timeout problem of loading the livepatch-sample 
>> module
>> on a physical machine running multiple vcpus virtual machines.
>>
>> While solving the above problems, we have gained an additional benefit,
>> that is, we can obtain more call stack information
>>
>> Stack information that can be obtained before the problem is fixed:
>> [<0>] kvm_vcpu_block+0x88/0x120 [kvm]
>> [<0>] kvm_vcpu_halt+0x68/0x580 [kvm]
>> [<0>] kvm_emu_idle+0xd4/0xf0 [kvm]
>> [<0>] kvm_handle_gspr+0x7c/0x700 [kvm]
>> [<0>] kvm_handle_exit+0x160/0x270 [kvm]
>> [<0>] kvm_exc_entry+0x100/0x1e0
>>
>> Stack information that can be obtained after the problem is fixed:
>> [<0>] kvm_vcpu_block+0x88/0x120 [kvm]
>> [<0>] kvm_vcpu_halt+0x68/0x580 [kvm]
>> [<0>] kvm_emu_idle+0xd4/0xf0 [kvm]
>> [<0>] kvm_handle_gspr+0x7c/0x700 [kvm]
>> [<0>] kvm_handle_exit+0x160/0x270 [kvm]
>> [<0>] kvm_exc_entry+0x104/0x1e4
>> [<0>] kvm_enter_guest+0x38/0x11c
>> [<0>] kvm_arch_vcpu_ioctl_run+0x26c/0x498 [kvm]
>> [<0>] kvm_vcpu_ioctl+0x200/0xcf8 [kvm]
>> [<0>] sys_ioctl+0x498/0xf00
>> [<0>] do_syscall+0x98/0x1d0
>> [<0>] handle_syscall+0xb8/0x158
>>
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Xianglai Li <lixianglai@loongson.cn>
>> ---
>> Cc: Huacai Chen <chenhuacai@kernel.org>
>> Cc: WANG Xuerui <kernel@xen0n.name>
>> Cc: Tianrui Zhao <zhaotianrui@loongson.cn>
>> Cc: Bibo Mao <maobibo@loongson.cn>
>> Cc: Charlie Jenkins <charlie@rivosinc.com>
>> Cc: Xianglai Li <lixianglai@loongson.cn>
>> Cc: Thomas Gleixner <tglx@linutronix.de>
>> Cc: Tiezhu Yang <yangtiezhu@loongson.cn>
>>
>>   arch/loongarch/kvm/switch.S | 28 +++++++++++++++++++---------
>>   1 file changed, 19 insertions(+), 9 deletions(-)
>>
>> diff --git a/arch/loongarch/kvm/switch.S b/arch/loongarch/kvm/switch.S
>> index 93845ce53651..a3ea9567dbe5 100644
>> --- a/arch/loongarch/kvm/switch.S
>> +++ b/arch/loongarch/kvm/switch.S
>> @@ -10,6 +10,7 @@
>>   #include <asm/loongarch.h>
>>   #include <asm/regdef.h>
>>   #include <asm/unwind_hints.h>
>> +#include <linux/kvm_types.h>
>>     #define HGPR_OFFSET(x)        (PT_R0 + 8*x)
>>   #define GGPR_OFFSET(x)        (KVM_ARCH_GGPR + 8*x)
>> @@ -110,9 +111,9 @@
>>        * need to copy world switch code to DMW area.
>>        */
>>       .text
>> +    .p2align PAGE_SHIFT
>>       .cfi_sections    .debug_frame
>>   SYM_CODE_START(kvm_exc_entry)
>> -    .p2align PAGE_SHIFT
>>       UNWIND_HINT_UNDEFINED
>>       csrwr    a2,   KVM_TEMP_KS
>>       csrrd    a2,   KVM_VCPU_KS
>> @@ -170,6 +171,7 @@ SYM_CODE_START(kvm_exc_entry)
>>       /* restore per cpu register */
>>       ld.d    u0, a2, KVM_ARCH_HPERCPU
>>       addi.d    sp, sp, -PT_SIZE
>> +    UNWIND_HINT_REGS
>>         /* Prepare handle exception */
>>       or    a0, s0, zero
>> @@ -200,7 +202,7 @@ ret_to_host:
>>       jr      ra
>>     SYM_CODE_END(kvm_exc_entry)
>> -EXPORT_SYMBOL(kvm_exc_entry)
>> +EXPORT_SYMBOL_FOR_KVM(kvm_exc_entry)
>>     /*
>>    * int kvm_enter_guest(struct kvm_run *run, struct kvm_vcpu *vcpu)
>> @@ -215,6 +217,14 @@ SYM_FUNC_START(kvm_enter_guest)
>>       /* Save host GPRs */
>>       kvm_save_host_gpr a2
>>   +    /*
>> +     * The csr_era member variable of the pt_regs structure is required
>> +     * for unwinding orc to perform stack traceback, so we need to put
>> +     * pc into csr_era member variable here.
>> +     */
>> +    pcaddi    t0, 0
>> +    st.d    t0, a2, PT_ERA
> Hi, Xianglai,
>
> It should use `SYM_CODE_START` to mark the `kvm_enter_guest` rather than
> `SYM_FUNC_START`, since the `SYM_FUNC_START` is used to mark "C-likely"
> asm functionw. 

Ok, I will use SYM_CODE_START to mark kvm_enter_guest in the next version.

> I guess the kvm_enter_guest is something like exception
> handler becuase the last instruction is "ertn". So usually it should
> mark UNWIND_HINT_REGS where can find last frame info by "$sp".
> However, all info is store to "$a2", this mark should be
>   `UNWIND_HINT sp_reg=ORC_REG_A2(???) type=UNWIND_HINT_TYPE_REGS`.
> I don't konw why save this function internal PC here by `pcaddi t0, 0`,
> and I think it is no meaning(, for exception handler, they save last PC
> by read CSR.ERA). The `kvm_enter_guest` saves registers by
> "$a2"("$sp" - PT_REGS) beyond stack ("$sp"), it is dangerous if IE
> is enable. So I wonder if there is really a stacktrace through this 
> function?
>
The stack backtracking issue in switch.S is rather complex because it 
involves the switching between cpu root-mode and guest-mode:
Real stack backtracking should be divided into two parts:
part 1:
     [<0>] kvm_enter_guest+0x38/0x11c
     [<0>] kvm_arch_vcpu_ioctl_run+0x26c/0x498 [kvm]
     [<0>] kvm_vcpu_ioctl+0x200/0xcf8 [kvm]
     [<0>] sys_ioctl+0x498/0xf00
     [<0>] do_syscall+0x98/0x1d0
     [<0>] handle_syscall+0xb8/0x158

part 2:
     [<0>] kvm_vcpu_block+0x88/0x120 [kvm]
     [<0>] kvm_vcpu_halt+0x68/0x580 [kvm]
     [<0>] kvm_emu_idle+0xd4/0xf0 [kvm]
     [<0>] kvm_handle_gspr+0x7c/0x700 [kvm]
     [<0>] kvm_handle_exit+0x160/0x270 [kvm]
     [<0>] kvm_exc_entry+0x104/0x1e4


In "part 1", after executing kvm_enter_guest, the cpu switches from 
root-mode to guest-mode.
In this case, stack backtracking is indeed very rare.

In "part 2", the cpu switches from the guest-mode to the root-mode,
and most of the stack backtracking occurs during this phase.

To obtain the longest call chain, we save pc in kvm_enter_guest to 
pt_regs.csr_era,
and after restoring the sp of the root-mode cpu in kvm_exc_entry,
The ORC entry was re-established using "UNWIND_HINT_REGS",
  and then we obtained the following stack backtrace as we wanted:

     [<0>] kvm_vcpu_block+0x88/0x120 [kvm]
     [<0>] kvm_vcpu_halt+0x68/0x580 [kvm]
     [<0>] kvm_emu_idle+0xd4/0xf0 [kvm]
     [<0>] kvm_handle_gspr+0x7c/0x700 [kvm]
     [<0>] kvm_handle_exit+0x160/0x270 [kvm]
     [<0>] kvm_exc_entry+0x104/0x1e4
     [<0>] kvm_enter_guest+0x38/0x11c
     [<0>] kvm_arch_vcpu_ioctl_run+0x26c/0x498 [kvm]
     [<0>] kvm_vcpu_ioctl+0x200/0xcf8 [kvm]
     [<0>] sys_ioctl+0x498/0xf00
     [<0>] do_syscall+0x98/0x1d0
     [<0>] handle_syscall+0xb8/0x158

Doing so is equivalent to ignoring the details of the cpu root-mode and 
guest-mode switching.
About what you said in the IE enable phase is dangerous,
interrupts are always off during the cpu root-mode and guest-mode 
switching in kvm_enter_guest and kvm_exc_entry.

Thanks!
Xianglai.

> Jinyang
>
>
>> +
>>       addi.d    a2, a1, KVM_VCPU_ARCH
>>       st.d    sp, a2, KVM_ARCH_HSP
>>       st.d    tp, a2, KVM_ARCH_HTP
>> @@ -225,7 +235,7 @@ SYM_FUNC_START(kvm_enter_guest)
>>       csrwr    a1, KVM_VCPU_KS
>>       kvm_switch_to_guest
>>   SYM_FUNC_END(kvm_enter_guest)
>> -EXPORT_SYMBOL(kvm_enter_guest)
>> +EXPORT_SYMBOL_FOR_KVM(kvm_enter_guest)
>>     SYM_FUNC_START(kvm_save_fpu)
>>       fpu_save_csr    a0 t1
>> @@ -233,7 +243,7 @@ SYM_FUNC_START(kvm_save_fpu)
>>       fpu_save_cc    a0 t1 t2
>>       jr              ra
>>   SYM_FUNC_END(kvm_save_fpu)
>> -EXPORT_SYMBOL(kvm_save_fpu)
>> +EXPORT_SYMBOL_FOR_KVM(kvm_save_fpu)
>>     SYM_FUNC_START(kvm_restore_fpu)
>>       fpu_restore_double a0 t1
>> @@ -241,7 +251,7 @@ SYM_FUNC_START(kvm_restore_fpu)
>>       fpu_restore_cc       a0 t1 t2
>>       jr                 ra
>>   SYM_FUNC_END(kvm_restore_fpu)
>> -EXPORT_SYMBOL(kvm_restore_fpu)
>> +EXPORT_SYMBOL_FOR_KVM(kvm_restore_fpu)
>>     #ifdef CONFIG_CPU_HAS_LSX
>>   SYM_FUNC_START(kvm_save_lsx)
>> @@ -250,7 +260,7 @@ SYM_FUNC_START(kvm_save_lsx)
>>       lsx_save_data   a0 t1
>>       jr              ra
>>   SYM_FUNC_END(kvm_save_lsx)
>> -EXPORT_SYMBOL(kvm_save_lsx)
>> +EXPORT_SYMBOL_FOR_KVM(kvm_save_lsx)
>>     SYM_FUNC_START(kvm_restore_lsx)
>>       lsx_restore_data a0 t1
>> @@ -258,7 +268,7 @@ SYM_FUNC_START(kvm_restore_lsx)
>>       fpu_restore_csr  a0 t1 t2
>>       jr               ra
>>   SYM_FUNC_END(kvm_restore_lsx)
>> -EXPORT_SYMBOL(kvm_restore_lsx)
>> +EXPORT_SYMBOL_FOR_KVM(kvm_restore_lsx)
>>   #endif
>>     #ifdef CONFIG_CPU_HAS_LASX
>> @@ -268,7 +278,7 @@ SYM_FUNC_START(kvm_save_lasx)
>>       lasx_save_data  a0 t1
>>       jr              ra
>>   SYM_FUNC_END(kvm_save_lasx)
>> -EXPORT_SYMBOL(kvm_save_lasx)
>> +EXPORT_SYMBOL_FOR_KVM(kvm_save_lasx)
>>     SYM_FUNC_START(kvm_restore_lasx)
>>       lasx_restore_data a0 t1
>> @@ -276,7 +286,7 @@ SYM_FUNC_START(kvm_restore_lasx)
>>       fpu_restore_csr   a0 t1 t2
>>       jr                ra
>>   SYM_FUNC_END(kvm_restore_lasx)
>> -EXPORT_SYMBOL(kvm_restore_lasx)
>> +EXPORT_SYMBOL_FOR_KVM(kvm_restore_lasx)
>>   #endif
>>     #ifdef CONFIG_CPU_HAS_LBT

