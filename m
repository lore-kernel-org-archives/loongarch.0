Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D808B33C9
	for <loongarch@lists.linux.dev>; Mon, 14 Oct 2024 07:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728890493; cv=none; b=XXD0OAlzKBPHhE1b2USpaOgPRKaApV2cKD28ohN5ck7oMDxF32KbMH0bIH8ruZG/8+CDzqerpIMVJL1mtRO2AF7BgETy/yS8IH1Y1RUhMrrJ0jiFwyqg/aep3XEMwIuIV+CzOFqMk0r1+x8t5J0FrMpqR7XWU38UYFcCI3e/E4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728890493; c=relaxed/simple;
	bh=+XjRHuZjF/bjyb2UI9kssv4hU1ZkiUV9lPgi6nt6OtU=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=hKSw39XVL2k7ZuWuhOGxBqDYCasUstlzf84ZHh2x3vLW306ZDfcrenVOT9QqafifPuKMRMF4j136utgneedF8CB17tDw1nohoAEg0LJfhGU6Cz/ft8S/MmReOBNrMfQ8LzRbWDysxr+oZNkkFWQAA2Vid+fc/LEiCu2dyVp9fQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8DxfWt2xgxnuF8aAA--.37869S3;
	Mon, 14 Oct 2024 15:21:26 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowMCxrtdzxgxnwOIoAA--.2980S3;
	Mon, 14 Oct 2024 15:21:25 +0800 (CST)
Subject: Re: [PATCH] LoongArch: Fix cpu hotplug issue
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 lixianglai@loongson.cn, WANG Xuerui <kernel@xen0n.name>
References: <20241014063328.1216497-1-maobibo@loongson.cn>
 <CAAhV-H5_SUnrf0PwOUFOA0EumKvGOmgqUq=Cx61Ub5AW=MPo=A@mail.gmail.com>
From: maobibo <maobibo@loongson.cn>
Message-ID: <24ea8b02-8c94-d561-cef0-01044b610a1e@loongson.cn>
Date: Mon, 14 Oct 2024 15:21:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H5_SUnrf0PwOUFOA0EumKvGOmgqUq=Cx61Ub5AW=MPo=A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCxrtdzxgxnwOIoAA--.2980S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxZw1DWryUWF43Zw1UXrW8AFc_yoWrAFy5pr
	W8CFZ5CwsxXFykW3yrt397Wry5Zr1kKrsIq3W3KFWrCFn8Jr1kAr4vgr98XFyUKw40yr1F
	vF4rWanIvF48J3cCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
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

Huacai,

On 2024/10/14 下午3:05, Huacai Chen wrote:
> Hi, Bibo,
> 
> I'm a little confused, so please correct me if I'm wrong.
> 
> On Mon, Oct 14, 2024 at 2:33 PM Bibo Mao <maobibo@loongson.cn> wrote:
>>
>> On LoongArch system, there are two places to set cpu numa node. One
>> is in arch specified function smp_prepare_boot_cpu(), the other is
>> in generic function early_numa_node_init(). The latter will overwrite
>> the numa node information.
>>
>> However for hot-added cpu, cpu_logical_map() fails to its physical
>> cpuid at beginning since it is not enabled in ACPI MADT table. So
>> function early_cpu_to_node() also fails to get its numa node for
>> hot-added cpu, and generic function early_numa_node_init() will
>> overwrite incorrect numa node.
> For hot-added cpus, we will call acpi_map_cpu() -->
> acpi_map_cpu2node() --> set_cpuid_to_node(), and set_cpuid_to_node()
> operates on __cpuid_to_node[]. So I think early_cpu_to_node() should
> be correct?

__cpuid_to_node[] is correct which is physical cpuid to numa node, 
however cpu_logical_map(cpu) is not set. It fails to get physical cpuid
from logic cpu.

int early_cpu_to_node(int cpu)
{
         int physid = cpu_logical_map(cpu);

<<<<<<<<<<< Here physid is -1.

         if (physid < 0)
                 return NUMA_NO_NODE;

         return __cpuid_to_node[physid];
}

Regards
Bibo Mao
> 
> Huacai
> 
>>
>> Here static array __cpu_to_node and api set_early_cpu_to_node()
>> is added, so that early_cpu_to_node is consistent with function
>> cpu_to_node() for hot-added cpu.
>>
>> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
>> ---
>>   arch/loongarch/include/asm/numa.h |  2 ++
>>   arch/loongarch/kernel/numa.c      | 10 +++++++++-
>>   arch/loongarch/kernel/smp.c       |  1 +
>>   3 files changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/loongarch/include/asm/numa.h b/arch/loongarch/include/asm/numa.h
>> index b5f9de9f102e..e8e6fcfb006a 100644
>> --- a/arch/loongarch/include/asm/numa.h
>> +++ b/arch/loongarch/include/asm/numa.h
>> @@ -50,6 +50,7 @@ static inline void set_cpuid_to_node(int cpuid, s16 node)
>>   }
>>
>>   extern int early_cpu_to_node(int cpu);
>> +extern void set_early_cpu_to_node(int cpu, s16 node);
>>
>>   #else
>>
>> @@ -57,6 +58,7 @@ static inline void early_numa_add_cpu(int cpuid, s16 node)    { }
>>   static inline void numa_add_cpu(unsigned int cpu)              { }
>>   static inline void numa_remove_cpu(unsigned int cpu)           { }
>>   static inline void set_cpuid_to_node(int cpuid, s16 node)      { }
>> +static inline void set_early_cpu_to_node(int cpu, s16 node)    { }
>>
>>   static inline int early_cpu_to_node(int cpu)
>>   {
>> diff --git a/arch/loongarch/kernel/numa.c b/arch/loongarch/kernel/numa.c
>> index 84fe7f854820..62508aace644 100644
>> --- a/arch/loongarch/kernel/numa.c
>> +++ b/arch/loongarch/kernel/numa.c
>> @@ -34,6 +34,9 @@ static struct numa_meminfo numa_meminfo;
>>   cpumask_t cpus_on_node[MAX_NUMNODES];
>>   cpumask_t phys_cpus_on_node[MAX_NUMNODES];
>>   EXPORT_SYMBOL(cpus_on_node);
>> +static s16 __cpu_to_node[NR_CPUS] = {
>> +       [0 ... CONFIG_NR_CPUS - 1] = NUMA_NO_NODE
>> +};
>>
>>   /*
>>    * apicid, cpu, node mappings
>> @@ -117,11 +120,16 @@ int early_cpu_to_node(int cpu)
>>          int physid = cpu_logical_map(cpu);
>>
>>          if (physid < 0)
>> -               return NUMA_NO_NODE;
>> +               return __cpu_to_node[cpu];
>>
>>          return __cpuid_to_node[physid];
>>   }
>>
>> +void set_early_cpu_to_node(int cpu, s16 node)
>> +{
>> +       __cpu_to_node[cpu] = node;
>> +}
>> +
>>   void __init early_numa_add_cpu(int cpuid, s16 node)
>>   {
>>          int cpu = __cpu_number_map[cpuid];
>> diff --git a/arch/loongarch/kernel/smp.c b/arch/loongarch/kernel/smp.c
>> index 9afc2d8b3414..998668be858c 100644
>> --- a/arch/loongarch/kernel/smp.c
>> +++ b/arch/loongarch/kernel/smp.c
>> @@ -512,6 +512,7 @@ void __init smp_prepare_boot_cpu(void)
>>                          set_cpu_numa_node(cpu, node);
>>                  else {
>>                          set_cpu_numa_node(cpu, rr_node);
>> +                       set_early_cpu_to_node(cpu, rr_node);
>>                          rr_node = next_node_in(rr_node, node_online_map);
>>                  }
>>          }
>>
>> base-commit: 6485cf5ea253d40d507cd71253c9568c5470cd27
>> --
>> 2.39.3
>>
>>

