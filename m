Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1946115A863
	for <loongarch@lists.linux.dev>; Fri,  7 Jun 2024 08:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717748705; cv=none; b=bEEorTi41QQ5BPFZ3zUNwlRyEruqLduKZuktmZ0jUcvJ2LwbTVHm72RATuvanfrOpaNUo1zHV//yBLStcOmvHmrLULda6Yw4UulyDY5XHPO6SkxJA4oSzbJTstFxAK7jAxZq6ryXSkPjrJNBwwlTWfpo0JxDhM1P2b2HAA5DCzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717748705; c=relaxed/simple;
	bh=Lz/Abbez8s8JJiutNRDdpUjcDtvEphNZ/wRG6u8LMzw=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=nY8LtubnwID2vDXSWhOITEevdHxb5HkBXF82NAdVhmsbFuof9flyO0lXRakuaLNdbkBfm+4oRY11pCzxZ4zAUNMvopIdJai4owCo3KK7nfQhYv8Jy0R+gNjk5axAobi3WAp2Eoc+XTt/5yWiR1bqzIYuRF03DZ+etA9pdkvckRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxHuvaw2JmPpEEAA--.19146S3;
	Fri, 07 Jun 2024 16:24:59 +0800 (CST)
Received: from [10.130.0.191] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cx68bZw2JmI_wXAA--.59668S3;
	Fri, 07 Jun 2024 16:24:57 +0800 (CST)
Subject: Re: [PATCH 1/3] LoongArch: ptrace: Fix watchpoint setting error
To: Jinyang He <hejinyang@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn
References: <20240529013019.15235-1-lihui@loongson.cn>
 <20240529013019.15235-2-lihui@loongson.cn>
 <6581186e-28f9-b77e-2ca4-590f6c262612@loongson.cn>
From: Hui Li <lihui@loongson.cn>
Message-ID: <69962c8f-ec7b-e363-0e64-641be5c691e5@loongson.cn>
Date: Fri, 7 Jun 2024 16:24:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <6581186e-28f9-b77e-2ca4-590f6c262612@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Cx68bZw2JmI_wXAA--.59668S3
X-CM-SenderInfo: 5olk3xo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW3WrW8ZF4UZry5KryUJF45XFc_yoW3CFyrpr
	1kJryDtrWUGrn7Gr1Utw1UAFyUJwnrX34DXr15Xa4jyr4UZr1Ygr1UWrn2gr4UCw48Jr18
	tr1jqrnrZF1UJwbCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw
	1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8cz
	VUUUUUU==



On 2024/5/29 下午5:56, Jinyang He wrote:
> 
> On 2024-05-29 09:30, Hui Li wrote:
>> In the current code, when debugging the following code using gdb,
>> "invalid argument ..." message will be displayed.
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
>> Invalid argument setting hardware debug registers
>>
>> The root cause is that the existing kernel ptrace interface
>> has some issues on watchpoint argument parsing and setting.
>> It mainly includes the two types of issues.
>>
>> 1. Some incorrect judgment condition existed in ptrace watchpoints
>>     argument parsing, causing -EINVAL to be returned.
> 
> Which judgment? I see we return -EINVAL if !ctrl.len while 
> LOONGARCH_BREAKPOINT_LEN_8  is zero.
> 
> I think the commit message should clearly point out this/these judgment.
> 
> And I think the test log is too complex.
> 
Thanks for your reviewing.

I will modify the commit message to describe the problem more clearly in v2

> 
>>
>> 2. The watchpoint argument was not set correctly due to unnecessary
>>     addr offset.
> 
> Agree. The address is incorrect by add offset in ptrace_hbp_fill_attr_ctrl.
> 
>
>>
>> Modify the relevant code to solve the above problem. Ensure the watchpont
>> argument is set correctly.
>>
>> All changes according to the LoongArch Reference Manual:
>> https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.html#control-and-status-registers-related-to-watchpoints 
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
>> a = 1
>> ...
>>
>> Signed-off-by: Hui Li <lihui@loongson.cn>
>> ---
>>   arch/loongarch/include/asm/hw_breakpoint.h |  2 +-
>>   arch/loongarch/kernel/hw_breakpoint.c      | 20 ++++----------
>>   arch/loongarch/kernel/ptrace.c             | 32 ++++++++++------------
>>   3 files changed, 21 insertions(+), 33 deletions(-)
>>
>> diff --git a/arch/loongarch/include/asm/hw_breakpoint.h 
>> b/arch/loongarch/include/asm/hw_breakpoint.h
>> index 21447fb1efc7..a8ce580f4fc6 100644
>> --- a/arch/loongarch/include/asm/hw_breakpoint.h
>> +++ b/arch/loongarch/include/asm/hw_breakpoint.h
>> @@ -101,7 +101,7 @@ struct perf_event;
>>   struct perf_event_attr;
>>   extern int arch_bp_generic_fields(struct arch_hw_breakpoint_ctrl ctrl,
>> -                  int *gen_len, int *gen_type, int *offset);
>> +                  int *gen_len, int *gen_type);
>>   extern int arch_check_bp_in_kernelspace(struct arch_hw_breakpoint *hw);
>>   extern int hw_breakpoint_arch_parse(struct perf_event *bp,
>>                       const struct perf_event_attr *attr,
>> diff --git a/arch/loongarch/kernel/hw_breakpoint.c 
>> b/arch/loongarch/kernel/hw_breakpoint.c
>> index fc55c4de2a11..2d311aff91af 100644
>> --- a/arch/loongarch/kernel/hw_breakpoint.c
>> +++ b/arch/loongarch/kernel/hw_breakpoint.c
>> @@ -283,7 +283,7 @@ int arch_check_bp_in_kernelspace(struct 
>> arch_hw_breakpoint *hw)
>>    * to generic breakpoint descriptions.
>>    */
>>   int arch_bp_generic_fields(struct arch_hw_breakpoint_ctrl ctrl,
>> -               int *gen_len, int *gen_type, int *offset)
>> +               int *gen_len, int *gen_type)
>>   {
>>       /* Type */
>>       switch (ctrl.type) {
>> @@ -303,11 +303,6 @@ int arch_bp_generic_fields(struct 
>> arch_hw_breakpoint_ctrl ctrl,
>>           return -EINVAL;
>>       }
>> -    if (!ctrl.len)
>> -        return -EINVAL;
>> -
>> -    *offset = __ffs(ctrl.len);
>> -
>>       /* Len */
>>       switch (ctrl.len) {
>>       case LOONGARCH_BREAKPOINT_LEN_1:
>> @@ -386,22 +381,17 @@ int hw_breakpoint_arch_parse(struct perf_event *bp,
>>                    struct arch_hw_breakpoint *hw)
>>   {
>>       int ret;
>> -    u64 alignment_mask, offset;
>> +    u64 alignment_mask;
>>       /* Build the arch_hw_breakpoint. */
>>       ret = arch_build_bp_info(bp, attr, hw);
>>       if (ret)
>>           return ret;
>> -    if (hw->ctrl.type != LOONGARCH_BREAKPOINT_EXECUTE)
>> -        alignment_mask = 0x7;
>> -    else
>> +    if (hw->ctrl.type == LOONGARCH_BREAKPOINT_EXECUTE) {
>>           alignment_mask = 0x3;
>> -    offset = hw->address & alignment_mask;
>> -
>> -    hw->address &= ~alignment_mask;
>> -    hw->ctrl.len <<= offset;
>> -
>> +        hw->address &= ~alignment_mask;
> 
> hw->address &= ~0x3ul; ?
> 
> How about other types? The hw->address can fixed by hw->ctrl.len I think.
> 
> I suspect that LoongArch only support aligned load or store hw breakpoints.
> 
> 
> Thanks,
> 
> Jinyang

After more test and discussion, the values in MWPCFG1.Vaddr is not must 
have to be aligned.

Thanks,

Hui

> 
>> +    }
>>       return 0;
>>   }
>> diff --git a/arch/loongarch/kernel/ptrace.c 
>> b/arch/loongarch/kernel/ptrace.c
>> index c114c5ef1332..16b756c6049b 100644
>> --- a/arch/loongarch/kernel/ptrace.c
>> +++ b/arch/loongarch/kernel/ptrace.c
>> @@ -494,28 +494,14 @@ static int ptrace_hbp_fill_attr_ctrl(unsigned 
>> int note_type,
>>                        struct arch_hw_breakpoint_ctrl ctrl,
>>                        struct perf_event_attr *attr)
>>   {
>> -    int err, len, type, offset;
>> +    int err, len, type;
>> -    err = arch_bp_generic_fields(ctrl, &len, &type, &offset);
>> +    err = arch_bp_generic_fields(ctrl, &len, &type);
>>       if (err)
>>           return err;
>> -    switch (note_type) {
>> -    case NT_LOONGARCH_HW_BREAK:
>> -        if ((type & HW_BREAKPOINT_X) != type)
>> -            return -EINVAL;
>> -        break;
>> -    case NT_LOONGARCH_HW_WATCH:
>> -        if ((type & HW_BREAKPOINT_RW) != type)
>> -            return -EINVAL;
>> -        break;
>> -    default:
>> -        return -EINVAL;
>> -    }
>> -
>>       attr->bp_len    = len;
>>       attr->bp_type    = type;
>> -    attr->bp_addr    += offset;
>>       return 0;
>>   }
>> @@ -609,7 +595,19 @@ static int ptrace_hbp_set_ctrl(unsigned int 
>> note_type,
>>           return PTR_ERR(bp);
>>       attr = bp->attr;
>> -    decode_ctrl_reg(uctrl, &ctrl);
>> +
>> +    switch (note_type) {
>> +    case NT_LOONGARCH_HW_BREAK:
>> +        ctrl.type = LOONGARCH_BREAKPOINT_EXECUTE;
>> +        ctrl.len = LOONGARCH_BREAKPOINT_LEN_4;
>> +        break;
>> +    case NT_LOONGARCH_HW_WATCH:
>> +        decode_ctrl_reg(uctrl, &ctrl);
>> +        break;
>> +    default:
>> +        return -EINVAL;
>> +    }
>> +
>>       err = ptrace_hbp_fill_attr_ctrl(note_type, ctrl, &attr);
>>       if (err)
>>           return err;
> 

