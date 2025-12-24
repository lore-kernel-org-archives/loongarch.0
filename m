Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F934330B34
	for <loongarch@lists.linux.dev>; Wed, 24 Dec 2025 09:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766567819; cv=none; b=AXhmpkDGsic4350alXo995VdLiqOLFHcPZ/pwHvYdmBMHou/vo6nEsjz8bhFnzWkrOfZx6NKD7xpt+UCa7b5+dASU94W4F+xNgM3bZbvDNJYCTsnpPlBY6v8rjMCBVv1JGAhrcPUJ5COSk+HxeJDr5tbnOba0SUx+0keseidZtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766567819; c=relaxed/simple;
	bh=ZtWziJiqrZ0cuml3s+jrt4nWYfRTL4Qwsi5NxHwTfqc=;
	h=Subject:From:To:Cc:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=rm8kCVXU2SsoGOSZhAwMHpz8E3xXjaMrRgV++ZqFunMmZltNqOA8jjm7u2c8DsJ9e8D6Bn5EAzOtCimjKImk8BxmxL1nbF0CegnoV/ciCb/jGWqB3UhVWk53oqXOc/V8qWDS/HLU1dZDRZ3fV5OwkWftjTGaq/pmdE07u5hURmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.126])
	by gateway (Coremail) with SMTP id _____8Axy8J_r0tp1LUCAA--.8450S3;
	Wed, 24 Dec 2025 17:16:47 +0800 (CST)
Received: from [10.20.42.126] (unknown [10.20.42.126])
	by front1 (Coremail) with SMTP id qMiowJBxbcJ6r0tpDzUEAA--.9953S3;
	Wed, 24 Dec 2025 17:16:45 +0800 (CST)
Subject: Re: [PATCH V2 2/2] LoongArch: KVM: fix "unreliable stack" issue
From: lixianglai <lixianglai@loongson.cn>
To: Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 yangtiezhu@loongson.cn
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, stable@vger.kernel.org, WANG Xuerui
 <kernel@xen0n.name>, Tianrui Zhao <zhaotianrui@loongson.cn>,
 Charlie Jenkins <charlie@rivosinc.com>, Thomas Gleixner <tglx@linutronix.de>
References: <20251222113409.2343711-1-lixianglai@loongson.cn>
 <20251222113409.2343711-3-lixianglai@loongson.cn>
 <e1f4b85e-0177-91b7-c422-22ed60607260@loongson.cn>
 <CAAhV-H4PehwGm-WwEuu4ZPbQutJR6m62tOSUxLcGQAxR_YX0Eg@mail.gmail.com>
 <7b8799d1-a4b2-58dc-187a-19c772612351@loongson.cn>
 <33541c5f-82ca-c86d-fcf9-437c4071c6b8@loongson.cn>
Message-ID: <9974d03b-bd07-04b0-c1e3-d76123c9cd2f@loongson.cn>
Date: Wed, 24 Dec 2025 17:13:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <33541c5f-82ca-c86d-fcf9-437c4071c6b8@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowJBxbcJ6r0tpDzUEAA--.9953S3
X-CM-SenderInfo: 5ol0xt5qjotxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxZF13WrW8Gry7WrWfWF15Awc_yoWrtFyfp3
	WFyF1DtFWDtw18Jw4Dta4DAFyUtrWkG3WDWr1xJFy8Jr1qgr1YgryUXw1q9F1DJw48GF1k
	XFy5tr9xZayUAwcCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
	ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8j-
	e5UUUUU==

Hi:
> Add yangtiezhu@loongson.cn
>
> Hi :
>>
>>
>> On 2025/12/23 上午10:46, Huacai Chen wrote:
>>> On Tue, Dec 23, 2025 at 9:27 AM Bibo Mao <maobibo@loongson.cn> wrote:
>>>>
>>>>
>>>>
>>>> On 2025/12/22 下午7:34, Xianglai Li wrote:
>>>>> Insert the appropriate UNWIND macro definition into the 
>>>>> kvm_exc_entry in
>>>>> the assembly function to guide the generation of correct ORC table 
>>>>> entries,
>>>>> thereby solving the timeout problem of loading the 
>>>>> livepatch-sample module
>>>>> on a physical machine running multiple vcpus virtual machines.
>>>>>
>>>>> While solving the above problems, we have gained an additional 
>>>>> benefit,
>>>>> that is, we can obtain more call stack information
>>>>>
>>>>> Stack information that can be obtained before the problem is fixed:
>>>>> [<0>] kvm_vcpu_block+0x88/0x120 [kvm]
>>>>> [<0>] kvm_vcpu_halt+0x68/0x580 [kvm]
>>>>> [<0>] kvm_emu_idle+0xd4/0xf0 [kvm]
>>>>> [<0>] kvm_handle_gspr+0x7c/0x700 [kvm]
>>>>> [<0>] kvm_handle_exit+0x160/0x270 [kvm]
>>>>> [<0>] kvm_exc_entry+0x100/0x1e0
>>>>>
>>>>> Stack information that can be obtained after the problem is fixed:
>>>>> [<0>] kvm_vcpu_block+0x88/0x120 [kvm]
>>>>> [<0>] kvm_vcpu_halt+0x68/0x580 [kvm]
>>>>> [<0>] kvm_emu_idle+0xd4/0xf0 [kvm]
>>>>> [<0>] kvm_handle_gspr+0x7c/0x700 [kvm]
>>>>> [<0>] kvm_handle_exit+0x160/0x270 [kvm]
>>>>> [<0>] kvm_exc_entry+0x100/0x1e0
>>>>> [<0>] kvm_arch_vcpu_ioctl_run+0x260/0x488 [kvm]
>>>>> [<0>] kvm_vcpu_ioctl+0x200/0xcd8 [kvm]
>>>>> [<0>] sys_ioctl+0x498/0xf00
>>>>> [<0>] do_syscall+0x94/0x190
>>>>> [<0>] handle_syscall+0xb8/0x158
>>>>>
>>>>> Cc: stable@vger.kernel.org
>>>>> Signed-off-by: Xianglai Li <lixianglai@loongson.cn>
>>>>> ---
>>>>> Cc: Huacai Chen <chenhuacai@kernel.org>
>>>>> Cc: WANG Xuerui <kernel@xen0n.name>
>>>>> Cc: Tianrui Zhao <zhaotianrui@loongson.cn>
>>>>> Cc: Bibo Mao <maobibo@loongson.cn>
>>>>> Cc: Charlie Jenkins <charlie@rivosinc.com>
>>>>> Cc: Xianglai Li <lixianglai@loongson.cn>
>>>>> Cc: Thomas Gleixner <tglx@linutronix.de>
>>>>>
>>>>>    arch/loongarch/kvm/switch.S | 2 ++
>>>>>    1 file changed, 2 insertions(+)
>>>>>
>>>>> diff --git a/arch/loongarch/kvm/switch.S 
>>>>> b/arch/loongarch/kvm/switch.S
>>>>> index 93845ce53651..e3ecb24a3bc5 100644
>>>>> --- a/arch/loongarch/kvm/switch.S
>>>>> +++ b/arch/loongarch/kvm/switch.S
>>>>> @@ -170,6 +170,7 @@ SYM_CODE_START(kvm_exc_entry)
>>>>>        /* restore per cpu register */
>>>>>        ld.d    u0, a2, KVM_ARCH_HPERCPU
>>>>>        addi.d  sp, sp, -PT_SIZE
>>>>> +     UNWIND_HINT_REGS
>>>>>
>>>>>        /* Prepare handle exception */
>>>>>        or      a0, s0, zero
>>>>> @@ -214,6 +215,7 @@ SYM_FUNC_START(kvm_enter_guest)
>>>>>        addi.d  a2, sp, -PT_SIZE
>>>>>        /* Save host GPRs */
>>>>>        kvm_save_host_gpr a2
>>>>> +     st.d    ra, a2, PT_ERA
>>>> Had better add some comments here to show that it is special for 
>>>> unwind
>>>> usage since there is "st.d ra, a2, PT_R1" already in macro
>>>> kvm_save_host_gpr().
>>> Then there is a new problem, why can unwinder not recognize the
>>> instruction in  kvm_save_host_gpr()?
>> maybe it need unwinder owner to answer this question.
>>
> kvm_save_host_gpr() is an assembler macro that has already been 
> executed and is no longer normal on the stack.
> Am I explaining correctly? @tiezhu
>
> I guess you might be wondering why unwinder didn't recognize 
> kvm_enter_guest().
>
> There's something wrong with the logic that we're implementing here 
> that we should put the current pc in era instead of ra.
> This will allow unwind to identify the symbol kvm_enter_guest.
>
> So I will fix it in the next version like this:
>
> @@ -214,6 +215,7 @@ SYM_FUNC_START(kvm_enter_guest)
>        addi.d  a2, sp, -PT_SIZE
>        /* Save host GPRs */
>        kvm_save_host_gpr a2
>
> +    /*
> +     * The csr_era member variable of the pt_regs structure is required
> +     * for unwinding orc to perform stack traceback, so we need to put
> +     * pc into csr_era member variable here.
> +     */
> +    pcaddi    t0, 0
> +    st.d    t0, a2, PT_ERA
> +
>
We discussed it with @tiezhu internally and he was OK with the change!

Thanks,
Xianglai.

> Thanks,
> Xianglai.
>>>
>>> Huacai
>>>>
>>>> Regards
>>>> Bibo Mao
>>>>>
>>>>>        addi.d  a2, a1, KVM_VCPU_ARCH
>>>>>        st.d    sp, a2, KVM_ARCH_HSP
>>>>>
>>>>
>

