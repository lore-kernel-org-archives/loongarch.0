Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ED9E7C
	for <loongarch@lists.linux.dev>; Sat, 14 Jan 2023 07:25:45 +0000 (UTC)
Received: from loongson.cn (unknown [192.168.200.1])
	by gateway (Coremail) with SMTP id _____8DxDev3WMJjn5sBAA--.4999S3;
	Sat, 14 Jan 2023 15:25:43 +0800 (CST)
Received: from [0.0.0.0] (unknown [192.168.200.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxbL72WMJjSlAZAA--.46937S3;
	Sat, 14 Jan 2023 15:25:43 +0800 (CST)
Subject: Re: [PATCH 2/4] LoongArch: Add JUMP_LINK_ADDR macro implementation to
 avoid using la.abs
To: Jinyang He <hejinyang@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Xi Ruoyao <xry111@xry111.site>
References: <1673255274-18238-1-git-send-email-tangyouling@loongson.cn>
 <1673255274-18238-3-git-send-email-tangyouling@loongson.cn>
 <c54bc8ac-fcc2-1cd4-56bc-167b094aec45@loongson.cn>
Cc: Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
From: Youling Tang <tangyouling@loongson.cn>
Message-ID: <effce90b-f035-5502-4aa6-0f222406cd17@loongson.cn>
Date: Sat, 14 Jan 2023 15:25:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <c54bc8ac-fcc2-1cd4-56bc-167b094aec45@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxbL72WMJjSlAZAA--.46937S3
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxCw1kJr1rtF1Uur45try8uFg_yoW5Wry3pr
	n8ZF4kGFW8WFn7CFyUtw13urs8Xwn3C3WSg3Zrt342kFsIqryDZw1vyrn8WF1qgw48JF4v
	9F1rWa1aqF4Uta7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bwxFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
	AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF
	7I0E14v26r1j6r4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x
	0267AKxVW8JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE
	44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26rWlOx8S6xCaFVCjc4
	AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vI
	r41l42xK82IY6x8ErcxFaVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14
	v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWI
	evJa73UjIFyTuYvj4RC_MaUUUUU

Hi, Jinyang

On 01/14/2023 02:40 PM, Jinyang He wrote:
>
> On 2023-01-09 17:07, Youling Tang wrote:
>> Add JUMP_LINK_ADDR macro implementation to avoid using la.abs.
>>
>> Signed-off-by: Youling Tang <tangyouling@loongson.cn>
>> ---
>>   arch/loongarch/include/asm/stackframe.h |  8 ++++++++
>>   arch/loongarch/kernel/head.S            | 10 ++++------
>>   arch/loongarch/power/suspend_asm.S      |  5 ++---
>>   3 files changed, 14 insertions(+), 9 deletions(-)
>>
>> diff --git a/arch/loongarch/include/asm/stackframe.h
>> b/arch/loongarch/include/asm/stackframe.h
>> index 96c94035b5d0..f538b3a6d680 100644
>> --- a/arch/loongarch/include/asm/stackframe.h
>> +++ b/arch/loongarch/include/asm/stackframe.h
>> @@ -216,4 +216,12 @@
>>       RESTORE_SP_AND_RET \docfi
>>       .endm
>>   +/* Jump to the virtual address of the link. */
>> +    .macro JUMP_LINK_ADDR
>
> Hi, Youling
>
>
> IMHO the JUMP_CACHE_ADDR is more suitable. And it not clear higt bits,
> although the result always true currently. Lastly, this macro clobbers
> t0 and t1, I'd suggest pass them in as args.

Ok, I will modify it as follows：

         .macro JUMP_CACHE_ADDR temp1 temp2
         li.d    \temp1, CACHE_BASE
         pcaddi  \temp2, 0
         or      \temp1, \temp1, \temp2
         jirl    zero, \temp1, 0xc
         .endm

There is also an alternative name "JUMP_DMW1_ADDR" for discussion.

Thanks,
Youling

>
>
> Thanks,
>
> Jinyang
>
>> +    li.d    t0, CACHE_BASE
>> +    pcaddi    t1, 0
>> +    or    t0, t0, t1
>> +    jirl    zero, t0, 0xc
>> +    .endm
>> +
>>   #endif /* _ASM_STACKFRAME_H */
>> diff --git a/arch/loongarch/kernel/head.S b/arch/loongarch/kernel/head.S
>> index aa6181714ec3..e8a4bf9d7599 100644
>> --- a/arch/loongarch/kernel/head.S
>> +++ b/arch/loongarch/kernel/head.S
>> @@ -52,9 +52,8 @@ SYM_CODE_START(kernel_entry)            # kernel
>> entry point
>>         /* We might not get launched at the address the kernel is
>> linked to,
>>          so we jump there.  */
>> -    la.abs        t0, 0f
>> -    jr        t0
>> -0:
>> +    JUMP_LINK_ADDR
>> +
>>       /* Enable PG */
>>       li.w        t0, 0xb0        # PLV=0, IE=0, PG=1
>>       csrwr        t0, LOONGARCH_CSR_CRMD
>> @@ -106,9 +105,8 @@ SYM_CODE_START(smpboot_entry)
>>       li.d        t0, CSR_DMW1_INIT    # CA, PLV0
>>       csrwr        t0, LOONGARCH_CSR_DMWIN1
>>   -    la.abs        t0, 0f
>> -    jr        t0
>> -0:
>> +    JUMP_LINK_ADDR
>> +
>>       /* Enable PG */
>>       li.w        t0, 0xb0        # PLV=0, IE=0, PG=1
>>       csrwr        t0, LOONGARCH_CSR_CRMD
>> diff --git a/arch/loongarch/power/suspend_asm.S
>> b/arch/loongarch/power/suspend_asm.S
>> index eb2675642f9f..596a682a7924 100644
>> --- a/arch/loongarch/power/suspend_asm.S
>> +++ b/arch/loongarch/power/suspend_asm.S
>> @@ -78,9 +78,8 @@ SYM_INNER_LABEL(loongarch_wakeup_start, SYM_L_GLOBAL)
>>       li.d        t0, CSR_DMW1_INIT    # CA, PLV0
>>       csrwr        t0, LOONGARCH_CSR_DMWIN1
>>   -    la.abs        t0, 0f
>> -    jr        t0
>> -0:
>> +    JUMP_LINK_ADDR
>> +
>>       la.pcrel    t0, acpi_saved_sp
>>       ld.d        sp, t0, 0
>>       SETUP_WAKEUP
>

