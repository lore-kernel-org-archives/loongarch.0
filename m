Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF23517BB5
	for <loongarch@lists.linux.dev>; Wed, 27 Mar 2024 01:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711501756; cv=none; b=S5gfwVgYRIhsXRki+klpmWzGgHvJQrTMKdLUDy1A/FLnKFPv7XnCnnAApmrKiMitM/HTtHJuTZlJSXe2gepD5HdzvP9iQOFoYNMT08HI3QDe9G5FLD/2z/U4vFZaBv1Hoq5AwYFMPqYnfNGWET7W6oHs0uua9KRKWibVVltJgPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711501756; c=relaxed/simple;
	bh=oYSMMACKnE94OhuF6KDrNencMCMsiO4LmGCxzYQmj50=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=g3MlnDMcwJ1Xe15TCEk8efU7YazeAuiW2itHkfGC6+6fzwi0TjbAygC81eqwNVjYRecNlLt9bP3leWgJl5olhqYnYim/fg+GnDeM2+3sK/xO3SQTLED2o9VarrpSnnX8y1vju1FLNKQ3scJsR26p3HYU8n1ibn0d95Kw3gXDVO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.173])
	by gateway (Coremail) with SMTP id _____8Axeei3cQNmeZoeAA--.52467S3;
	Wed, 27 Mar 2024 09:09:11 +0800 (CST)
Received: from [10.20.42.173] (unknown [10.20.42.173])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxdRGwcQNmeY5pAA--.750S3;
	Wed, 27 Mar 2024 09:09:06 +0800 (CST)
Subject: Re: [PATCH] LoongArch: Give chance to build under !CONFIG_SMP
To: loongson-kernel@lists.loongnix.cn, Huacai Chen <chenhuacai@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Arnd Bergmann <arnd@arndb.de>,
 Marc Zyngier <maz@kernel.org>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240326062101.9822-1-yangtiezhu@loongson.cn>
 <55494710-ddaa-c35a-f6cd-5baf98b13931@loongson.cn>
 <9d557c37-d376-40c3-0630-4e904db27528@loongson.cn>
From: maobibo <maobibo@loongson.cn>
Message-ID: <dd5eb61b-8adf-4289-7342-7711e87dba0e@loongson.cn>
Date: Wed, 27 Mar 2024 09:09:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <9d557c37-d376-40c3-0630-4e904db27528@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxdRGwcQNmeY5pAA--.750S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxJrWUXr13tw4DKF45tFW3CFX_yoW5JF1kpF
	Wkta1UKF4kur1vkw1kJa4DuFyFyr15Ja47Gr15Wa4kJ39xJr1Sgr4jgwn09FWDZrsaq3W0
	vrW3Ga1fuFy5XrgCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWU
	AwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx
	k0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
	AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
	cVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI
	8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v2
	6r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jepB-UUUUU=



On 2024/3/27 上午5:30, Tiezhu Yang wrote:
> Hi Bibo,
> 
> On 3/26/24 20:58, maobibo wrote:
>>
>>
>> On 2024/3/26 下午2:21, Tiezhu Yang wrote:
>>> In the current code, SMP is selected in Kconfig for LoongArch, the users
>>> can not unset it, this is reasonable for a multiprocessor machine. 
>>> But as
>>> the help info of config SMP said, if you have a system with only one 
>>> CPU,
>>> say N. On a uniprocessor machine, the kernel will run faster if you 
>>> say N
>>> here.
>>>
>>> The Loongson-2K0500 is a single-core CPU for applications like 
>>> industrial
>>> control, printing terminals, and BMC (Baseboard Management Controller),
>>> there are many development boards, products and solutions on the market,
>>> so it is better and necessary to give a chance to build under 
>>> !CONFIG_SMP
>>> for a uniprocessor machine.
> 
> ...
> 
>>> +++ b/arch/loongarch/include/asm/smp.h
>>> @@ -6,6 +6,7 @@
>>>   #ifndef __ASM_SMP_H
>>>   #define __ASM_SMP_H
>>> +#ifdef CONFIG_SMP
>>>   #include <linux/atomic.h>
>>>   #include <linux/bitops.h>
>>>   #include <linux/linkage.h>
>>> @@ -101,4 +102,8 @@ static inline void __cpu_die(unsigned int cpu)
>>>   }
>>>   #endif
>>> +#else /* !CONFIG_SMP */
>>> +#define cpu_logical_map(cpu)    0
>> It is unsafe here though physical cpuid of BSP is 0 always.
>> It is better to use __cpu_logical_map[cpu] or read_csr_cpuid()
>>
>>> +#endif
If kernel run with AMP mode where each cpu has its separate kernel img, 
physical cpuid of BSP will be not 0.
> 
> ...
> 
>>> +++ b/arch/loongarch/power/suspend.c
>>> @@ -44,7 +44,9 @@ void loongarch_common_resume(void)
>>>   {
>>>       sync_counter();
>>>       local_flush_tlb_all();
>>> +#ifdef CONFIG_HAVE_SETUP_PER_CPU_AREA
>>>       csr_write64(per_cpu_offset(0), PERCPU_BASE_KS);
>>> +#endif
>> It is another issue, CONFIG_HAVE_SETUP_PER_CPU_AREA should not depend 
>> on NUMA. PERCPU_BASE_KS should be set even for UP.
> 
> Thanks for your review and suggestions.
> 
> Let me wait for some days, if no more comments, I will address in v3 
> since the v2 has been sent.
It is fine to me. Do something is better than do nothing, only that we 
should be careful and it will take much time.

Regards
Bibo Mao
> 
> Thanks,
> Tiezhu
> 
> _______________________________________________
> Loongson-kernel mailing list -- loongson-kernel@lists.loongnix.cn
> To unsubscribe send an email to loongson-kernel-leave@lists.loongnix.cn

