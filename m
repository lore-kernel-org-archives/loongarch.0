Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 863171A23A6
	for <loongarch@lists.linux.dev>; Wed, 13 Aug 2025 02:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755052072; cv=none; b=NtRE3hh+RJyHCwQ2Uu92mVciI7gvE5YmaMoYVDSqk8nXXFmq5RViQ9FTidEJojQsS/FA/dcRpPpRlBLjklawquyYZCGy6ti8K/VcVTs9INC8YEyyv6HzMJd505VIebubpNfpuiFC/aTuLYbFkSC8TKT56y+9tLgEFzPpFGh2nqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755052072; c=relaxed/simple;
	bh=vQqCnulobDtum9Nm5dEE3ld/dGdzrbZpX65x+QIw8DM=;
	h=Subject:From:To:Cc:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=munFbIEkRCw5JDeUBVRBP2SqlsW8c1zJGOVGYhR57N5CFvZuwLZJFYo94bSuK2Yqfc6UvE4xQ1RTLrS1IEnt4iqzXsuSZ8GnA/I05gCNmk3UiI/3jB2BvbY2UM9fFfrjeIcul+H4ozFD/grT4myCwY+qOV1c8o42Q2iVzqYr2uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.126])
	by gateway (Coremail) with SMTP id _____8AxLOIi+JtoLS4_AQ--.13204S3;
	Wed, 13 Aug 2025 10:27:46 +0800 (CST)
Received: from [10.20.42.126] (unknown [10.20.42.126])
	by front1 (Coremail) with SMTP id qMiowJAxvsEf+JtoXhNIAA--.34377S3;
	Wed, 13 Aug 2025 10:27:45 +0800 (CST)
Subject: Re: [PATCH] LoongArch: time: Fix the issue of high cpu usage of vcpu
 threads in virtual machines
From: lixianglai <lixianglai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>,
 Peter Zijlstra <peterz@infradead.org>, Bibo Mao <maobibo@loongson.cn>,
 Song Gao <gaosong@loongson.cn>, Tianrui Zhao <zhaotianrui@loongson.cn>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250812090056.771379-1-lixianglai@loongson.cn>
 <CAAhV-H7pXxFR8PnAOv8CirotXUSPgbb7AEsHU0VGh_YMFFoyJA@mail.gmail.com>
 <da4311b0-7e8e-647a-260f-1733878cf394@loongson.cn>
 <CAAhV-H7uhvZeZ9L40AWuRN7t4JAFLNDj4YUOZ_K-oPrCcnpEjA@mail.gmail.com>
 <13a54d23-24c2-8e59-77ac-900a63cd38ef@loongson.cn>
Message-ID: <61c858da-8c5e-7652-e580-fc51c211ebb0@loongson.cn>
Date: Wed, 13 Aug 2025 10:26:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <13a54d23-24c2-8e59-77ac-900a63cd38ef@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowJAxvsEf+JtoXhNIAA--.34377S3
X-CM-SenderInfo: 5ol0xt5qjotxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxKry8WFWkAw4DWw4kWw18CrX_yoWxAFWDpr
	WkAF1UJrW5Grn7Xr1jqw1UXry3tr18J3W7Xr1xJF1UArsFyryFgF4jqr1qgF18JrWrJr1U
	Xr1rXr17uF4UJrXCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Yb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67
	vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v2
	6r1q6r43MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
	CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF
	0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
	AIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIev
	Ja73UjIFyTuYvjxU7_MaUUUUU

Hi Huacai Chen:
>> On Tue, Aug 12, 2025 at 8:50 PM lixianglai <lixianglai@loongson.cn> 
>> wrote:
>>>
>>>
>>> Hi Huacai Chen:
>>>> Hi, Xianglai,
>>>>
>>>> There is something that can be improved.
>>>>
>>>> On Tue, Aug 12, 2025 at 5:24 PM Xianglai Li 
>>>> <lixianglai@loongson.cn> wrote:
>>>>> When the cpu is offline, the timer under loongarch is not 
>>>>> correctly closed,
>>>>> resulting in an excessively high cpu usage rate of the offline 
>>>>> vcpu thread
>>>>> in the virtual machine.
>>>>>
>>>>> To correctly close the timer, we have made the following 
>>>>> modifications:
>>>>>
>>>>> Register the cpu hotplug timer start event for loongarch.This 
>>>>> event will
>>>>> be called to close the timer when the cpu is offline.
>>>>>
>>>>> Clear the timer interrupt when the timer is turned off
>>>>>
>>>>> Signed-off-by: Xianglai Li <lixianglai@loongson.cn>
>>>>> ---
>>>>>    arch/loongarch/kernel/time.c | 20 ++++++++++++++++++++
>>>>>    include/linux/cpuhotplug.h   |  1 +
>>>>>    2 files changed, 21 insertions(+)
>>>>>
>>>>> diff --git a/arch/loongarch/kernel/time.c 
>>>>> b/arch/loongarch/kernel/time.c
>>>>> index 367906b10f81..4daa11512eba 100644
>>>>> --- a/arch/loongarch/kernel/time.c
>>>>> +++ b/arch/loongarch/kernel/time.c
>>>>> @@ -12,6 +12,7 @@
>>>>>    #include <linux/kernel.h>
>>>>>    #include <linux/sched_clock.h>
>>>>>    #include <linux/spinlock.h>
>>>>> +#include <linux/cpu.h>
>>>>>
>>>>>    #include <asm/cpu-features.h>
>>>>>    #include <asm/loongarch.h>
>>>>> @@ -86,6 +87,9 @@ static int constant_set_state_shutdown(struct 
>>>>> clock_event_device *evt)
>>>>>           timer_config &= ~CSR_TCFG_EN;
>>>>>           csr_write64(timer_config, LOONGARCH_CSR_TCFG);
>>>>>
>>>>> +       /* Clear Timer Interrupt */
>>>>> +       write_csr_tintclear(CSR_TINTCLR_TI);
>>>>> +
>>>>>           raw_spin_unlock(&state_lock);
>>>>>
>>>>>           return 0;
>>>>> @@ -208,8 +212,17 @@ int __init constant_clocksource_init(void)
>>>>>           return res;
>>>>>    }
>>>>>
>>>>> +static int arch_timer_dying_cpu(unsigned int cpu)
>>>> We can use arch_timer_dying() for short. And then add an
>>>> arch_timer_starting() like this:
>>>>
>>>> static int arch_timer_starting(unsigned int cpu)
>>>> {
>>>>           set_csr_ecfg(ECFGF_TIMER);
>>>>
>>>>           return 0;
>>>> }
>>>>
>>>> Though ECFGF_TIMER may be enabled in other places, for syntax we 
>>>> need it here.
>>>>
>>>>> +{
>>>>> +       constant_set_state_shutdown(NULL);
>>>>> +
>>>>> +       return 0;
>>>>> +}
>>>>> +
>>>>>    void __init time_init(void)
>>>>>    {
>>>>> +       int err;
>>>>> +
>>>>>           if (!cpu_has_cpucfg)
>>>>>                   const_clock_freq = cpu_clock_freq;
>>>>>           else
>>>>> @@ -220,4 +233,11 @@ void __init time_init(void)
>>>>>           constant_clockevent_init();
>>>>>           constant_clocksource_init();
>>>>>           pv_time_init();
>>>>> +
>>>>> +       err = 
>>>>> cpuhp_setup_state_nocalls(CPUHP_AP_LOONGARCH_ARCH_TIMER_STARTING,
>>>>> + "loongarch/timer:starting",
>>>>> +                                       NULL, arch_timer_dying_cpu);
>>>> Then we need use cpuhp_setup_state() here, because we have a startup
>>>> function now.
>>>>
>>>> And "loongarch/timer:starting" should be
>>>> "clockevents/loongarch/timer:starting" like others.
>>>>
>>>> And the whole should be moved to the last of
>>>> constant_clockevent_init() because it is clockevent specific.
>>> like this?
>>>
>>> @@ -164,6 +182,10 @@ int constant_clockevent_init(void)
>>>
>>>           timer_irq_installed = 1;
>>>
>>> + cpuhp_setup_state(CPUHP_AP_LOONGARCH_ARCH_TIMER_STARTING,
>>> + "clockevents/loongarch/timer:starting",
>>> +                         arch_timer_starting, arch_timer_dying_cpu);
>>> +
>>>           sync_counter();
>>>
>>>
>>> I was wondering whether it should be placed before or after the
>>> "timer_irq_installed" judgment
>> Should be after "timer_irq_installed" because we only need to run once.
>>
>> The best place is after pr_info("Constant clock event device 
>> register\n");
>
> Got it!
>> And there is another question:
>> Should we move "write_csr_tintclear(CSR_TINTCLR_TI)" from
>> constant_set_state_shutdown() to arch_timer_dying()?
>
> We may not need to do this. If the context in which the timer is
> turned off is to disable interrupts, and the last timing period just
> arrives during this process, when the interrupt is re-enabled,
> an additional interrupt will be triggered and the next timing expiration
> time will be filled. This is not in line with expectations.
> Isn't it more reasonable to clean up the interrupt flag after turning off
> the timer instead of just doing so cpu offline context cleaning.
>

This is my personal opinion, but I just trace the process of cpu offline 
and need to clear the timer interrupt.
Because is not particularly proficient in of the overall system 
architecture, I might have a one-sided view.
Do you have a better suggestion?

Thanks!
Xianglai.

> Thanks!
> Xianglai.
>
>>
>> Huacai
>>
>>>
>>>>> +       if (err)
>>>>> +               pr_info("cpu hotplug event register failed");
>>>> This is not so useful, because the error isn't fatal.
>>>>
>>>>
>>>> Huacai
>>>>
>>>>> +
>>>>>    }
>>>>> diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
>>>>> index edfa61d80702..6606c1546afc 100644
>>>>> --- a/include/linux/cpuhotplug.h
>>>>> +++ b/include/linux/cpuhotplug.h
>>>>> @@ -159,6 +159,7 @@ enum cpuhp_state {
>>>>>           CPUHP_AP_PERF_ARM_STARTING,
>>>>>           CPUHP_AP_PERF_RISCV_STARTING,
>>>>>           CPUHP_AP_ARM_L2X0_STARTING,
>>>>> +       CPUHP_AP_LOONGARCH_ARCH_TIMER_STARTING,
>>>>>           CPUHP_AP_EXYNOS4_MCT_TIMER_STARTING,
>>>>>           CPUHP_AP_ARM_ARCH_TIMER_STARTING,
>>>>>           CPUHP_AP_ARM_ARCH_TIMER_EVTSTRM_STARTING,
>>>>>
>>>>> base-commit: 53e760d8949895390e256e723e7ee46618310361
>>>>> -- 
>>>>> 2.39.1
>>>>>
>>>
>

