Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2546515B0F2
	for <loongarch@lists.linux.dev>; Fri,  7 Jun 2024 08:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717748880; cv=none; b=R6drJHnSHMa1iEf1Eb4YFoMlseBHi7nXqH+h7Wzx6sU2clhkW/MOF/65evtFShwOEQJk6gNmJ4SX0vrlZYlalLcCLBzKpDfUlDNTsTTa310OsuF9MVGpSh+6c4M0IbgsAIHpGWS3KkPYRJ/YI6m+Tes4YVKND2BEKfwwxOoHkgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717748880; c=relaxed/simple;
	bh=Or08tgJatMBimDOvvOL+jV/6+kzJPxInmXeHJi2dsgk=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=fE4CicZx3WdKC6ahNOvkbdmlRBDZoO8SANVLQi5jXyXfmqgTS0k8HfYHd/mtD/d5QaFURRujgCI28Iw6dtEw9ND0/qqk2FU2KsCO3j4+sbk119TSH9uYWtio+4o5bm7MI7nQ4dpZzFxNvRMz613jKPZ0oSh47aTDtWzD86SEMM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxyOmMxGJmdpEEAA--.6263S3;
	Fri, 07 Jun 2024 16:27:56 +0800 (CST)
Received: from [10.130.0.191] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxZcWKxGJmvvwXAA--.49123S3;
	Fri, 07 Jun 2024 16:27:55 +0800 (CST)
Subject: Re: [PATCH 2/3] LoongArch: Trigger user-space watchpoints correctly
To: Jinyang He <hejinyang@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn
References: <20240529013019.15235-1-lihui@loongson.cn>
 <20240529013019.15235-3-lihui@loongson.cn>
 <883d526a-76c1-e93d-eac5-9152ebda5bfb@loongson.cn>
From: Hui Li <lihui@loongson.cn>
Message-ID: <1b993833-d259-4acb-f5e0-794644cc7bc0@loongson.cn>
Date: Fri, 7 Jun 2024 16:27:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <883d526a-76c1-e93d-eac5-9152ebda5bfb@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxZcWKxGJmvvwXAA--.49123S3
X-CM-SenderInfo: 5olk3xo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxKF4fXw1fGr1UWr1fZFW7ZFc_yoWxJr43pr
	92yFyvqrZ8Gr4kGw12qw1UAry5Jr12qa1DGwn5Ja4jyr47Jr1Ygr18Wr1qgF4UCw4xJryF
	yr15Xrn29F4UZFXCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw
	1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8r9
	N3UUUUU==



On 2024/5/29 下午7:33, Jinyang He wrote:
> On 2024-05-29 09:30, Hui Li wrote:
> 
>> In the current code, gdb can successfully set the watchpoint through
>> ptrace interface, But watchpoint will not be triggered.
>>
>> When debugging the following code using gdb,
>>
>> lihui@bogon:~$ cat test.c
>>    #include <stdio.h>
>>    int a = 0;
>>    int main()
>>    {
>>      printf("start test\n");
>>      a = 1;
>>      printf("a = %d\n", a);
>>      printf("end test\n");
>>      return 0;
>>    }
>> lihui@bogon:~$ gcc -g test.c -o test
>> lihui@bogon:~$ gdb test
>> ...
>> (gdb) start
>> ...
>> Temporary breakpoint 1, main () at test.c:5
>> 5        printf("start test\n");
>> (gdb) watch a
>> Hardware watchpoint 2: a
>> (gdb) c
>> Continuing.
>> start test
>> a = 1
>> end test
>> [Inferior 1 (process 1154) exited normally]
>>
>> No watchpoints were triggered, the root causes are:
>>
>> 1. The kernel uses perf_event and hw_breakpoint framework to control
>>     watchpoint. But the perf_event corresponding to watchpoint is not
>>     enabled, it needs to be enabled according to watchpoint control 
>> register.
>>
>> 2. The global enable control for all watchpoints is the WE bit of 
>> CSR.CRMD,
>>     and hardware sets the value to 0 when an exception is triggered. When
>>     the ERTN instruction is executed to return, the hardware restores the
>>     value of the PWE field of CSR.PRMD here. So, before a thread 
>> containing
>>     watchpoints be scheduled, the PWE field of CSR.PRMD needs to be 
>> set to 1.
>>
>> Modify the relevant code to solve the above problem. Enable the 
>> watchpoints in
>> the user-space thread.
>>
>> All changes according to the LoongArch Reference Manual:
>> https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.html#control-and-status-registers-related-to-watchpoints 
>>
>> https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.html#basic-control-and-status-registers 
>>
>>
>> with this patch:
>>
>> lihui@bogon:~$ gdb test
>> ...
>> (gdb) start
>> ...
>> Temporary breakpoint 1, main () at test.c:5
>> 5        printf("start test\n");
>> (gdb) watch a
>> Hardware watchpoint 2: a
>> (gdb) c
>> Continuing.
>> start test
>>
>> Hardware watchpoint 2: a
>>
>> Old value = 0
>> New value = 1
>> main () at test.c:7
>> 7        printf("a = %d\n", a);
>> (gdb) c
>> Continuing.
>> a = 1
>> end test
>>
>> Signed-off-by: Hui Li <lihui@loongson.cn>
>> ---
>>   arch/loongarch/kernel/hw_breakpoint.c |  4 +++-
>>   arch/loongarch/kernel/ptrace.c        | 16 +++++++++++++---
>>   2 files changed, 16 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/loongarch/kernel/hw_breakpoint.c 
>> b/arch/loongarch/kernel/hw_breakpoint.c
>> index 2d311aff91af..01cd0b051225 100644
>> --- a/arch/loongarch/kernel/hw_breakpoint.c
>> +++ b/arch/loongarch/kernel/hw_breakpoint.c
>> @@ -517,7 +517,9 @@ void hw_breakpoint_thread_switch(struct 
>> task_struct *next)
>>           if (!((regs->csr_era ^ addr) & ~mask))
>>               csr_write32(CSR_FWPC_SKIP, LOONGARCH_CSR_FWPS);
>>           regs->csr_prmd |= CSR_PRMD_PWE;
>> -    } else {
>> +    } else if (test_tsk_thread_flag(next, TIF_LOAD_WATCH))
>> +                regs->csr_prmd |= CSR_PRMD_PWE;
> 
> It means enable PWE without update bp regs when switch to another task.
> 
> Will there be any critical situations with other task having set HW 
> breakpoints before?


Thanks for your reviewing.

Because enabling the PWE operation and setting watch regs operation not 
in one function.

I will move the enable PWE operation to hw_breakpoint_control().


> 
> 
>> +    else {
>>           /* Update breakpoints */
>>           update_bp_registers(regs, 1, 0);
>>           /* Update watchpoints */
>> diff --git a/arch/loongarch/kernel/ptrace.c 
>> b/arch/loongarch/kernel/ptrace.c
>> index 16b756c6049b..328510bf60e1 100644
>> --- a/arch/loongarch/kernel/ptrace.c
>> +++ b/arch/loongarch/kernel/ptrace.c
>> @@ -589,6 +589,8 @@ static int ptrace_hbp_set_ctrl(unsigned int 
>> note_type,
>>       struct perf_event *bp;
>>       struct perf_event_attr attr;
>>       struct arch_hw_breakpoint_ctrl ctrl;
>> +        struct thread_info *ti = task_thread_info(tsk);
>> +        int hbp_enable = uctrl & CTRL_PLV_ENABLE;
> 
> ./scripts/checkpatch.pl
> 
> 
>>       bp = ptrace_hbp_get_initialised_bp(note_type, tsk, idx);
>>       if (IS_ERR(bp))
>> @@ -608,9 +610,17 @@ static int ptrace_hbp_set_ctrl(unsigned int 
>> note_type,
>>           return -EINVAL;
>>       }
>> -    err = ptrace_hbp_fill_attr_ctrl(note_type, ctrl, &attr);
>> -    if (err)
>> -        return err;
>> +       if (hbp_enable == CTRL_PLV_ENABLE) {
> 
> The uctrl is comes form user_buf, here means the PLV{0,1,2,3} should all 
> be 1?
> 
> That looks strange.
> 
> 
> Thanks,
> 
> Jinyang


This is modified to use PLV3 as a constraint.

And a comments from our internal review, a simple judgment is added in 
ptrace_hbp_set_addr()

	/* Kernel-space address cannot be monitored by user-space */
	if ((addr & XKPRANGE) == XKPRANGE)
		return -EINVAL;

to ensure that kernel-space address cannot be monitored in user mode.


I will send the v2 version to make these changes next week.


Thanks,

Hui


> 
>> +        err = ptrace_hbp_fill_attr_ctrl(note_type, ctrl, &attr);
>> +        if (err)
>> +            return err;
>> +        attr.disabled = 0;
>> +        set_ti_thread_flag(ti, TIF_LOAD_WATCH);
>> +    }
>> +    else {
>> +        attr.disabled = 1;
>> +        clear_ti_thread_flag(ti, TIF_LOAD_WATCH);
>> +    }
>>       return modify_user_hw_breakpoint(bp, &attr);
>>   }
> 

