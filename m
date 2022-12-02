Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E3B61C2B
	for <loongarch@lists.linux.dev>; Fri,  2 Dec 2022 09:03:28 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.170])
	by gateway (Coremail) with SMTP id _____8AxRPBdv4lj_8ACAA--.6575S3;
	Fri, 02 Dec 2022 17:03:26 +0800 (CST)
Received: from [10.20.42.170] (unknown [10.20.42.170])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxoOJcv4ljhUckAA--.24197S3;
	Fri, 02 Dec 2022 17:03:25 +0800 (CST)
Message-ID: <c5e1b113-f457-2cc7-808b-b13f83adbb2b@loongson.cn>
Date: Fri, 2 Dec 2022 17:03:24 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] LoongArch: export symbol with function
 smp_send_reschedule
Content-Language: en-US
To: WANG Xuerui <kernel@xen0n.name>, Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20221202075854.2253116-1-maobibo@loongson.cn>
 <07e0d775-6bb7-051b-9ec9-71153efbdf21@xen0n.name>
From: maobibo <maobibo@loongson.cn>
In-Reply-To: <07e0d775-6bb7-051b-9ec9-71153efbdf21@xen0n.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxoOJcv4ljhUckAA--.24197S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxWFWkGrW8AF4fGrW3Gw1kAFb_yoW5Zr1rpF
	97Zr1kCr4UWr97Ar90v3yruryrGrs5Gr1aqF43tay8Arnxt3WkZryvqwn0gFyUZ3yIkF1F
	gFWrWwna9FyUA37anT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bfAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
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



在 2022/12/2 16:25, WANG Xuerui 写道:
> On 2022/12/2 15:58, Bibo Mao wrote:
>> Function smp_send_reschedule is standard kernel ABI, which is
>> defined header file include/linux/smp.h, however on LoongArch
>> it is defined as inline function, so that kernel module can
>> not use this function.
>>
>> Now define smp_send_reschedule as general function, and add
>> EXPORT_SYMBOL_GPL on this function, so that kernel modules can
>> use it.
>>
>> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
>> ---
>>   arch/loongarch/include/asm/smp.h | 10 ----------
>>   arch/loongarch/kernel/smp.c      | 11 +++++++++++
>>   2 files changed, 11 insertions(+), 10 deletions(-)
>>
>> diff --git a/arch/loongarch/include/asm/smp.h b/arch/loongarch/include/asm/smp.h
>> index 3dd172d9ffea..d82687390b4a 100644
>> --- a/arch/loongarch/include/asm/smp.h
>> +++ b/arch/loongarch/include/asm/smp.h
>> @@ -78,16 +78,6 @@ extern void calculate_cpu_foreign_map(void);
>>    */
>>   extern void show_ipi_list(struct seq_file *p, int prec);
>>   -/*
>> - * This function sends a 'reschedule' IPI to another CPU.
>> - * it goes straight through and wastes no time serializing
>> - * anything. Worst case is that we lose a reschedule ...
>> - */
>> -static inline void smp_send_reschedule(int cpu)
>> -{
>> -    loongson_send_ipi_single(cpu, SMP_RESCHEDULE);
>> -}
>> -
>>   static inline void arch_send_call_function_single_ipi(int cpu)
>>   {
>>       loongson_send_ipi_single(cpu, SMP_CALL_FUNCTION);
>> diff --git a/arch/loongarch/kernel/smp.c b/arch/loongarch/kernel/smp.c
>> index 6ed72f7ff278..51dd3c3f06cb 100644
>> --- a/arch/loongarch/kernel/smp.c
>> +++ b/arch/loongarch/kernel/smp.c
>> @@ -141,6 +141,17 @@ void loongson_send_ipi_single(int cpu, unsigned int action)
>>       ipi_write_action(cpu_logical_map(cpu), (u32)action);
>>   }
>>   +/*
>> + * This function sends a 'reschedule' IPI to another CPU.
>> + * it goes straight through and wastes no time serializing
>> + * anything. Worst case is that we lose a reschedule ...
>> + */
>> +void smp_send_reschedule(int cpu)
>> +{
>> +    loongson_send_ipi_single(cpu, SMP_RESCHEDULE);
>> +}
>> +EXPORT_SYMBOL_GPL(smp_send_reschedule);
>> +
> 
> While the change is in itself okay (one less case of mips legacy, getting in line with ia64, powerpc and riscv that all EXPORT_SYMBOL_GPL this), I'd suggest you batch this patch with the subsequent changes you plan to enable with this one, so reviewers would have more context and hopefully avoid churn. (I, by my familiarity with Loongson and LoongArch development, know you're probably aiming to use this with KVM, but others probably don't know, and again it's always better to have more context.)
> 

yes, kvm module depends on function smp_send_reschedule, only that it is not mature now. And this function is standard API, not arch specified API, it is normal for modules to use it :)

regards
bibo,mao
>>   void loongson_send_ipi_mask(const struct cpumask *mask, unsigned int action)
>>   {
>>       unsigned int i;
> 

