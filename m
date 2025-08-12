Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6E2825B1CE
	for <loongarch@lists.linux.dev>; Tue, 12 Aug 2025 12:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755003016; cv=none; b=ENxByCDjjC5uYjM4IH/kyQBWYVTPeXMttq+fDYkxro54ONunZERGRrchRIjgIL4F9vVLu2XFYbUOqG6FShckSjaYAsgisoU6hGIXXQ6wK7jT4ltIuBmTyKtuzwXMFs0aWQLMNIwKwXl8OuY7GNXouApxePs3/xTxVG4QRMNU72w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755003016; c=relaxed/simple;
	bh=BQ9qfFghJkHCuYTaa5QLrx/7K3yz+3ozWDI00+epl04=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=nN2XzWxlKi4sGxyi6aELWb+wOSeW8SFPL+eM5+ELuyFFGMPy5QFod2IETYgGKcQqa5+RKA153o3I50abACKSdK7Yflb9/XgmWMyeu2EeTBBsW4MPqwSGcrG274WHFfIc17IQXE16BOFefaMOWqiN8BIhl1VHn0h65u6ctxcPqCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.126])
	by gateway (Coremail) with SMTP id _____8Bx63F+OJtoSvY+AQ--.53970S3;
	Tue, 12 Aug 2025 20:50:06 +0800 (CST)
Received: from [10.20.42.126] (unknown [10.20.42.126])
	by front1 (Coremail) with SMTP id qMiowJAxE+R6OJtoeaNGAA--.5023S3;
	Tue, 12 Aug 2025 20:50:05 +0800 (CST)
Subject: Re: [PATCH] LoongArch: time: Fix the issue of high cpu usage of vcpu
 threads in virtual machines
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>,
 Peter Zijlstra <peterz@infradead.org>, Bibo Mao <maobibo@loongson.cn>,
 Song Gao <gaosong@loongson.cn>, Tianrui Zhao <zhaotianrui@loongson.cn>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250812090056.771379-1-lixianglai@loongson.cn>
 <CAAhV-H7pXxFR8PnAOv8CirotXUSPgbb7AEsHU0VGh_YMFFoyJA@mail.gmail.com>
From: lixianglai <lixianglai@loongson.cn>
Message-ID: <da4311b0-7e8e-647a-260f-1733878cf394@loongson.cn>
Date: Tue, 12 Aug 2025 20:48:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H7pXxFR8PnAOv8CirotXUSPgbb7AEsHU0VGh_YMFFoyJA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowJAxE+R6OJtoeaNGAA--.5023S3
X-CM-SenderInfo: 5ol0xt5qjotxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxWF1rZr1xCw47Ar15Kw48GrX_yoWrAF45pr
	WkCFs8KrZYkrn2vw13t3srZFy3tw4kGw12vFyfXF17Ar9rZr9YgF40qryq9Fy5Jaykur40
	vw10vrnxuF4DtrXCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67
	vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
	wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc4
	0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
	xVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
	1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7_MaUUUU
	U



Hi Huacai Chen:
> Hi, Xianglai,
>
> There is something that can be improved.
>
> On Tue, Aug 12, 2025 at 5:24 PM Xianglai Li <lixianglai@loongson.cn> wrote:
>> When the cpu is offline, the timer under loongarch is not correctly closed,
>> resulting in an excessively high cpu usage rate of the offline vcpu thread
>> in the virtual machine.
>>
>> To correctly close the timer, we have made the following modifications:
>>
>> Register the cpu hotplug timer start event for loongarch.This event will
>> be called to close the timer when the cpu is offline.
>>
>> Clear the timer interrupt when the timer is turned off
>>
>> Signed-off-by: Xianglai Li <lixianglai@loongson.cn>
>> ---
>>   arch/loongarch/kernel/time.c | 20 ++++++++++++++++++++
>>   include/linux/cpuhotplug.h   |  1 +
>>   2 files changed, 21 insertions(+)
>>
>> diff --git a/arch/loongarch/kernel/time.c b/arch/loongarch/kernel/time.c
>> index 367906b10f81..4daa11512eba 100644
>> --- a/arch/loongarch/kernel/time.c
>> +++ b/arch/loongarch/kernel/time.c
>> @@ -12,6 +12,7 @@
>>   #include <linux/kernel.h>
>>   #include <linux/sched_clock.h>
>>   #include <linux/spinlock.h>
>> +#include <linux/cpu.h>
>>
>>   #include <asm/cpu-features.h>
>>   #include <asm/loongarch.h>
>> @@ -86,6 +87,9 @@ static int constant_set_state_shutdown(struct clock_event_device *evt)
>>          timer_config &= ~CSR_TCFG_EN;
>>          csr_write64(timer_config, LOONGARCH_CSR_TCFG);
>>
>> +       /* Clear Timer Interrupt */
>> +       write_csr_tintclear(CSR_TINTCLR_TI);
>> +
>>          raw_spin_unlock(&state_lock);
>>
>>          return 0;
>> @@ -208,8 +212,17 @@ int __init constant_clocksource_init(void)
>>          return res;
>>   }
>>
>> +static int arch_timer_dying_cpu(unsigned int cpu)
> We can use arch_timer_dying() for short. And then add an
> arch_timer_starting() like this:
>
> static int arch_timer_starting(unsigned int cpu)
> {
>          set_csr_ecfg(ECFGF_TIMER);
>
>          return 0;
> }
>
> Though ECFGF_TIMER may be enabled in other places, for syntax we need it here.
>
>> +{
>> +       constant_set_state_shutdown(NULL);
>> +
>> +       return 0;
>> +}
>> +
>>   void __init time_init(void)
>>   {
>> +       int err;
>> +
>>          if (!cpu_has_cpucfg)
>>                  const_clock_freq = cpu_clock_freq;
>>          else
>> @@ -220,4 +233,11 @@ void __init time_init(void)
>>          constant_clockevent_init();
>>          constant_clocksource_init();
>>          pv_time_init();
>> +
>> +       err = cpuhp_setup_state_nocalls(CPUHP_AP_LOONGARCH_ARCH_TIMER_STARTING,
>> +                                       "loongarch/timer:starting",
>> +                                       NULL, arch_timer_dying_cpu);
> Then we need use cpuhp_setup_state() here, because we have a startup
> function now.
>
> And "loongarch/timer:starting" should be
> "clockevents/loongarch/timer:starting" like others.
>
> And the whole should be moved to the last of
> constant_clockevent_init() because it is clockevent specific.

like this?

@@ -164,6 +182,10 @@ int constant_clockevent_init(void)

         timer_irq_installed = 1;

+       cpuhp_setup_state(CPUHP_AP_LOONGARCH_ARCH_TIMER_STARTING,
+                         "clockevents/loongarch/timer:starting",
+                         arch_timer_starting, arch_timer_dying_cpu);
+
         sync_counter();


I was wondering whether it should be placed before or after the 
"timer_irq_installed" judgment


>> +       if (err)
>> +               pr_info("cpu hotplug event register failed");
> This is not so useful, because the error isn't fatal.
>
>
> Huacai
>
>> +
>>   }
>> diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
>> index edfa61d80702..6606c1546afc 100644
>> --- a/include/linux/cpuhotplug.h
>> +++ b/include/linux/cpuhotplug.h
>> @@ -159,6 +159,7 @@ enum cpuhp_state {
>>          CPUHP_AP_PERF_ARM_STARTING,
>>          CPUHP_AP_PERF_RISCV_STARTING,
>>          CPUHP_AP_ARM_L2X0_STARTING,
>> +       CPUHP_AP_LOONGARCH_ARCH_TIMER_STARTING,
>>          CPUHP_AP_EXYNOS4_MCT_TIMER_STARTING,
>>          CPUHP_AP_ARM_ARCH_TIMER_STARTING,
>>          CPUHP_AP_ARM_ARCH_TIMER_EVTSTRM_STARTING,
>>
>> base-commit: 53e760d8949895390e256e723e7ee46618310361
>> --
>> 2.39.1
>>

