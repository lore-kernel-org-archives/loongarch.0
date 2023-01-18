Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7D321FCC
	for <loongarch@lists.linux.dev>; Wed, 18 Jan 2023 04:23:32 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxCepAdMdjcEICAA--.6730S3;
	Wed, 18 Jan 2023 12:23:28 +0800 (CST)
Received: from [10.130.0.135] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Bxjb47dMdj0SMbAA--.56222S3;
	Wed, 18 Jan 2023 12:23:25 +0800 (CST)
Subject: Re: [PATCH v12 4/5] LoongArch: Mark some assembler symbols as
 non-kprobe-able
To: Huacai Chen <chenhuacai@kernel.org>
References: <1674007261-9198-1-git-send-email-yangtiezhu@loongson.cn>
 <1674007261-9198-5-git-send-email-yangtiezhu@loongson.cn>
 <CAAhV-H7Dt5MhaMU1=D9HxPFR+xjjoQG6RguaYMydy=v_jvrtiA@mail.gmail.com>
Cc: WANG Xuerui <kernel@xen0n.name>, Masami Hiramatsu <mhiramat@kernel.org>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <48f0508f-3908-c6ca-c8ba-7c12dd6b3f11@loongson.cn>
Date: Wed, 18 Jan 2023 12:23:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H7Dt5MhaMU1=D9HxPFR+xjjoQG6RguaYMydy=v_jvrtiA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8Bxjb47dMdj0SMbAA--.56222S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxCF1rCr4DCw4ktFWDKr4kZwb_yoW5Cr47pF
	1DAFs5KFs5Gr1fZry7tw1Yv3yqqws7KF1293W29FW8Cr47WF1Uury09398WFyftw47KrWF
	vFn5JasI9FWUJa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bIxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2
	IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F4U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487Mx
	AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
	Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwI
	xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8
	JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcV
	C2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU83UUUUUUUU==



On 01/18/2023 12:14 PM, Huacai Chen wrote:
> If memcpy should be blacklisted, then what about memset and memmove?

According to the test results, there are no problems to probe
memset and memmove, so no need to blacklist them for now,
blacklist memcpy is because it may cause recursive exceptions,
there is a detailed discussion in the following link:

https://lore.kernel.org/lkml/20230114143859.7ccc45c1c5d9ce302113ab0a@kernel.org/

Thanks,
Tiezhu

>
> Huacai
>
> On Wed, Jan 18, 2023 at 10:01 AM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>>
>> Some assembler symbols are not kprobe safe, such as handle_syscall
>> (used as syscall exception handler), *memcpy* (may cause recursive
>> exceptions), they can not be instrumented, just blacklist them for
>> kprobing.
>>
>> Here is a related problem and discussion:
>> Link: https://lore.kernel.org/lkml/20230114143859.7ccc45c1c5d9ce302113ab0a@kernel.org/
>>
>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>> ---
>>  arch/loongarch/include/asm/asm.h | 10 ++++++++++
>>  arch/loongarch/kernel/entry.S    |  1 +
>>  arch/loongarch/lib/memcpy.S      |  3 +++
>>  3 files changed, 14 insertions(+)
>>
>> diff --git a/arch/loongarch/include/asm/asm.h b/arch/loongarch/include/asm/asm.h
>> index 40eea6a..f591b32 100644
>> --- a/arch/loongarch/include/asm/asm.h
>> +++ b/arch/loongarch/include/asm/asm.h
>> @@ -188,4 +188,14 @@
>>  #define PTRLOG         3
>>  #endif
>>
>> +/* Annotate a function as being unsuitable for kprobes. */
>> +#ifdef CONFIG_KPROBES
>> +#define _ASM_NOKPROBE(name)                            \
>> +       .pushsection "_kprobe_blacklist", "aw";         \
>> +       .quad   name;                                   \
>> +       .popsection
>> +#else
>> +#define _ASM_NOKPROBE(name)
>> +#endif
>> +
>>  #endif /* __ASM_ASM_H */
>> diff --git a/arch/loongarch/kernel/entry.S b/arch/loongarch/kernel/entry.S
>> index d53b631..55e23b1 100644
>> --- a/arch/loongarch/kernel/entry.S
>> +++ b/arch/loongarch/kernel/entry.S
>> @@ -67,6 +67,7 @@ SYM_FUNC_START(handle_syscall)
>>
>>         RESTORE_ALL_AND_RET
>>  SYM_FUNC_END(handle_syscall)
>> +_ASM_NOKPROBE(handle_syscall)
>>
>>  SYM_CODE_START(ret_from_fork)
>>         bl      schedule_tail           # a0 = struct task_struct *prev
>> diff --git a/arch/loongarch/lib/memcpy.S b/arch/loongarch/lib/memcpy.S
>> index 7c07d59..3b7e1de 100644
>> --- a/arch/loongarch/lib/memcpy.S
>> +++ b/arch/loongarch/lib/memcpy.S
>> @@ -17,6 +17,7 @@ SYM_FUNC_START(memcpy)
>>         ALTERNATIVE     "b __memcpy_generic", \
>>                         "b __memcpy_fast", CPU_FEATURE_UAL
>>  SYM_FUNC_END(memcpy)
>> +_ASM_NOKPROBE(memcpy)
>>
>>  EXPORT_SYMBOL(memcpy)
>>
>> @@ -41,6 +42,7 @@ SYM_FUNC_START(__memcpy_generic)
>>  2:     move    a0, a3
>>         jr      ra
>>  SYM_FUNC_END(__memcpy_generic)
>> +_ASM_NOKPROBE(__memcpy_generic)
>>
>>  /*
>>   * void *__memcpy_fast(void *dst, const void *src, size_t n)
>> @@ -93,3 +95,4 @@ SYM_FUNC_START(__memcpy_fast)
>>  3:     move    a0, a3
>>         jr      ra
>>  SYM_FUNC_END(__memcpy_fast)
>> +_ASM_NOKPROBE(__memcpy_fast)
>> --
>> 2.1.0
>>

