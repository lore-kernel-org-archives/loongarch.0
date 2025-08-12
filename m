Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA3C02E7641
	for <loongarch@lists.linux.dev>; Tue, 12 Aug 2025 10:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754995850; cv=none; b=rQTwGiLZ3UPFW5503h8OyZ9RZ+rPHSHaHwwaT/qjnXo3Ld7lzmqZMcX0crvo+PABJWGr9eAhUpSlcQxQPfr2fJVxjFUoFnSdM1KF5X65QSUDYz3w0zUUw9VnUV6xFoS7PwYQb8AsjcEqN5uVdr3aBcfsdntWUb/HvdSbgElQXhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754995850; c=relaxed/simple;
	bh=kPnB99pQiUhV3Oo0icKYUmjWyuqBMOn8KUPUwJ75h4M=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=qPV3d39KCC+KxoWo6H1eWNh3gFUMcr/zPS/2Q76h83mgW5lDN2p7RX+kmm3t5F2e2KrlnXw///ZXJks8QiEzBdOqwuxuhsnNHc28kHO1rQrT9t1341kTQPKy6oN4sINFMGtHUF6NWpXl7YELqfF/xCo9tBYuV4ugvVgO3mbzEbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8DxCeGDHJtopu4+AQ--.12794S3;
	Tue, 12 Aug 2025 18:50:43 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJCxM+R_HJto02lGAA--.3184S3;
	Tue, 12 Aug 2025 18:50:42 +0800 (CST)
Subject: Re: [PATCH] LoongArch: time: Fix the issue of high cpu usage of vcpu
 threads in virtual machines
To: Xianglai Li <lixianglai@loongson.cn>, Huacai Chen
 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>,
 Song Gao <gaosong@loongson.cn>, Tianrui Zhao <zhaotianrui@loongson.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250812090056.771379-1-lixianglai@loongson.cn>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <f271abd3-e1b6-0968-abf8-6f1b74e21f65@loongson.cn>
Date: Tue, 12 Aug 2025 18:48:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250812090056.771379-1-lixianglai@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxM+R_HJto02lGAA--.3184S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxWF47trWDtFy3Zr48JF4fZwc_yoW5Cw1kpr
	WDCFs3trWFkrn29w1ay3sFvF13Ww4kGr42vasrWF17Ar9rZFyrWF4kKr98tF15Wa97Zw42
	93W09rsIkayqqrXCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67
	vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
	wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc4
	0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
	xVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
	1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7_MaUUUU
	U



On 2025/8/12 下午5:00, Xianglai Li wrote:
> When the cpu is offline, the timer under loongarch is not correctly closed,
> resulting in an excessively high cpu usage rate of the offline vcpu thread
> in the virtual machine.
> 
> To correctly close the timer, we have made the following modifications:
> 
> Register the cpu hotplug timer start event for loongarch.This event will
> be called to close the timer when the cpu is offline.
> 
> Clear the timer interrupt when the timer is turned off
During timer is turned off, timer interrupt may be arriving. Here adding 
EOI with timer after disabling it so that there is no pending timer 
interrupt when offline cpu is halted state.
> 
> Signed-off-by: Xianglai Li <lixianglai@loongson.cn>
> ---
>   arch/loongarch/kernel/time.c | 20 ++++++++++++++++++++
>   include/linux/cpuhotplug.h   |  1 +
>   2 files changed, 21 insertions(+)
> 
> diff --git a/arch/loongarch/kernel/time.c b/arch/loongarch/kernel/time.c
> index 367906b10f81..4daa11512eba 100644
> --- a/arch/loongarch/kernel/time.c
> +++ b/arch/loongarch/kernel/time.c
> @@ -12,6 +12,7 @@
>   #include <linux/kernel.h>
>   #include <linux/sched_clock.h>
>   #include <linux/spinlock.h>
> +#include <linux/cpu.h>
>   
>   #include <asm/cpu-features.h>
>   #include <asm/loongarch.h>
> @@ -86,6 +87,9 @@ static int constant_set_state_shutdown(struct clock_event_device *evt)
>   	timer_config &= ~CSR_TCFG_EN;
>   	csr_write64(timer_config, LOONGARCH_CSR_TCFG);
>   
> +	/* Clear Timer Interrupt */
> +	write_csr_tintclear(CSR_TINTCLR_TI);
> +
>   	raw_spin_unlock(&state_lock);
>   
>   	return 0;
> @@ -208,8 +212,17 @@ int __init constant_clocksource_init(void)
>   	return res;
>   }
>   
> +static int arch_timer_dying_cpu(unsigned int cpu)
> +{
NULL is a little strange here, how about something like this?

         struct clock_event_device *evt;

         evt = this_cpu_ptr(constant_clockevent_device);
         constant_set_state_shutdown(evt);

Regards
Bibo Mao

> +	constant_set_state_shutdown(NULL);
> +
> +	return 0;
> +}
> +
>   void __init time_init(void)
>   {
> +	int err;
> +
>   	if (!cpu_has_cpucfg)
>   		const_clock_freq = cpu_clock_freq;
>   	else
> @@ -220,4 +233,11 @@ void __init time_init(void)
>   	constant_clockevent_init();
>   	constant_clocksource_init();
>   	pv_time_init();
> +
> +	err = cpuhp_setup_state_nocalls(CPUHP_AP_LOONGARCH_ARCH_TIMER_STARTING,
> +					"loongarch/timer:starting",
> +					NULL, arch_timer_dying_cpu);
> +	if (err)
> +		pr_info("cpu hotplug event register failed");
> +
>   }
> diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
> index edfa61d80702..6606c1546afc 100644
> --- a/include/linux/cpuhotplug.h
> +++ b/include/linux/cpuhotplug.h
> @@ -159,6 +159,7 @@ enum cpuhp_state {
>   	CPUHP_AP_PERF_ARM_STARTING,
>   	CPUHP_AP_PERF_RISCV_STARTING,
>   	CPUHP_AP_ARM_L2X0_STARTING,
> +	CPUHP_AP_LOONGARCH_ARCH_TIMER_STARTING,
>   	CPUHP_AP_EXYNOS4_MCT_TIMER_STARTING,
>   	CPUHP_AP_ARM_ARCH_TIMER_STARTING,
>   	CPUHP_AP_ARM_ARCH_TIMER_EVTSTRM_STARTING,
> 
> base-commit: 53e760d8949895390e256e723e7ee46618310361
> 

