Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59FEE1465B7
	for <loongarch@lists.linux.dev>; Thu, 16 May 2024 12:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715862212; cv=none; b=FJnXEPilde5WTa/qDLHDpOXHcOCUtrqtOOKITODtefDbn+5jdI7h3Sl5aQC0aartBAoRn6nv+P8bHlVIqs4KxJ2UGHb2U5ob4nugbd8i/1SxM7QG5G5pI3h1Y3U7jkie8Hm825BT2q+e5EC2pyRloem2DWcBQvpQXFwFXJu886I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715862212; c=relaxed/simple;
	bh=U4lHo32+qCSB+1PtJ3H6mTSywrpLmZt9GYu1MdcsGdc=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=LfXliTthmrRHTb0eERHoriU+K90shO3pu6qOAVTS5cJpqHZmEHrqoLULpxyjC5it38JRDMqbpQSNROE/3r4qw+S69lRAuAhieXGQWAMYkZQS5Iqr64W7lBShoBG68XVFw6ZC2DMhFXxSZDYuEGyQUOsDik+kDuNf8Qh2O5naTCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.173])
	by gateway (Coremail) with SMTP id _____8Dx2em5+kVmAYYNAA--.20067S3;
	Thu, 16 May 2024 20:23:21 +0800 (CST)
Received: from [10.20.42.173] (unknown [10.20.42.173])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxLLu2+kVmGQEjAA--.2835S3;
	Thu, 16 May 2024 20:23:20 +0800 (CST)
Subject: Re: [PATCH] LoongArch: Add irq_work support via self IPIs
To: Huacai Chen <chenhuacai@loongson.cn>, Arnd Bergmann <arnd@arndb.de>,
 Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-arch@vger.kernel.org,
 Xuefeng Li <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>,
 Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
References: <20240514073232.3694867-1-chenhuacai@loongson.cn>
From: maobibo <maobibo@loongson.cn>
Message-ID: <b1182755-ec71-2add-ad69-72da85cdbb19@loongson.cn>
Date: Thu, 16 May 2024 20:23:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240514073232.3694867-1-chenhuacai@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxLLu2+kVmGQEjAA--.2835S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW3XF4Utr45Cw4xCF1UGrWxAFc_yoW7WrW8pF
	Z0kF4kGr4rGr93AwnIk3W3urn0yrnrWr129F9FkrWxAF12qw1Yvw1vgFyDtF1kGaykW3W0
	9a9akw4FqFW5ZwcCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
	ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jY
	SoJUUUUU=



On 2024/5/14 下午3:32, Huacai Chen wrote:
> Add irq_work support for LoongArch via self IPIs. This make it possible
> to run works in hardware interrupt context, which is a prerequisite for
> NOHZ_FULL.
> 
> Implement:
>   - arch_irq_work_raise()
>   - arch_irq_work_has_interrupt()
> 
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>   arch/loongarch/include/asm/hardirq.h  |  3 ++-
>   arch/loongarch/include/asm/irq_work.h | 10 ++++++++++
>   arch/loongarch/include/asm/smp.h      |  2 ++
>   arch/loongarch/kernel/paravirt.c      |  6 ++++++
>   arch/loongarch/kernel/smp.c           | 14 ++++++++++++++
>   5 files changed, 34 insertions(+), 1 deletion(-)
>   create mode 100644 arch/loongarch/include/asm/irq_work.h
> 
> diff --git a/arch/loongarch/include/asm/hardirq.h b/arch/loongarch/include/asm/hardirq.h
> index d41138abcf26..1d7feb719515 100644
> --- a/arch/loongarch/include/asm/hardirq.h
> +++ b/arch/loongarch/include/asm/hardirq.h
> @@ -12,11 +12,12 @@
>   extern void ack_bad_irq(unsigned int irq);
>   #define ack_bad_irq ack_bad_irq
>   
> -#define NR_IPI	2
> +#define NR_IPI	3
>   
>   enum ipi_msg_type {
>   	IPI_RESCHEDULE,
>   	IPI_CALL_FUNCTION,
> +	IPI_IRQ_WORK,
>   };
>   
>   typedef struct {
> diff --git a/arch/loongarch/include/asm/irq_work.h b/arch/loongarch/include/asm/irq_work.h
> new file mode 100644
> index 000000000000..d63076e9160d
> --- /dev/null
> +++ b/arch/loongarch/include/asm/irq_work.h
> @@ -0,0 +1,10 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_LOONGARCH_IRQ_WORK_H
> +#define _ASM_LOONGARCH_IRQ_WORK_H
> +
> +static inline bool arch_irq_work_has_interrupt(void)
> +{
> +	return IS_ENABLED(CONFIG_SMP);
> +}
> +
> +#endif /* _ASM_LOONGARCH_IRQ_WORK_H */
> diff --git a/arch/loongarch/include/asm/smp.h b/arch/loongarch/include/asm/smp.h
> index 278700cfee88..50db503f44e3 100644
> --- a/arch/loongarch/include/asm/smp.h
> +++ b/arch/loongarch/include/asm/smp.h
> @@ -69,9 +69,11 @@ extern int __cpu_logical_map[NR_CPUS];
>   #define ACTION_BOOT_CPU	0
>   #define ACTION_RESCHEDULE	1
>   #define ACTION_CALL_FUNCTION	2
> +#define ACTION_IRQ_WORK		3
>   #define SMP_BOOT_CPU		BIT(ACTION_BOOT_CPU)
>   #define SMP_RESCHEDULE		BIT(ACTION_RESCHEDULE)
>   #define SMP_CALL_FUNCTION	BIT(ACTION_CALL_FUNCTION)
> +#define SMP_IRQ_WORK		BIT(ACTION_IRQ_WORK)
>   
>   struct secondary_data {
>   	unsigned long stack;
> diff --git a/arch/loongarch/kernel/paravirt.c b/arch/loongarch/kernel/paravirt.c
> index 1633ed4f692f..4272d2447445 100644
> --- a/arch/loongarch/kernel/paravirt.c
> +++ b/arch/loongarch/kernel/paravirt.c
> @@ -2,6 +2,7 @@
>   #include <linux/export.h>
>   #include <linux/types.h>
>   #include <linux/interrupt.h>
> +#include <linux/irq_work.h>
>   #include <linux/jump_label.h>
>   #include <linux/kvm_para.h>
>   #include <linux/static_call.h>
> @@ -97,6 +98,11 @@ static irqreturn_t pv_ipi_interrupt(int irq, void *dev)
>   		info->ipi_irqs[IPI_CALL_FUNCTION]++;
>   	}
>   
> +	if (action & SMP_IRQ_WORK) {
> +		irq_work_run();
> +		info->ipi_irqs[IPI_IRQ_WORK]++;
> +	}
> +
Would you mind adding common api so that pv ipi handler and hw ipi 
handler can call it both? The coming avec MSI interrupt driver has the 
same requirement for ipi.

void do_ipi_demux(unsigned int action)
{
         irq_cpustat_t *info;

         info = this_cpu_ptr(&irq_stat);
         if (action & SMP_RESCHEDULE) {
                 scheduler_ipi();
                 info->ipi_irqs[IPI_RESCHEDULE]++;
         }

         if (action & SMP_CALL_FUNCTION) {
                 generic_smp_call_function_interrupt();
                 info->ipi_irqs[IPI_CALL_FUNCTION]++;
         }

  	if (action & SMP_IRQ_WORK) {
  		irq_work_run();
  		info->ipi_irqs[IPI_IRQ_WORK]++;
}

Regards
Bibo Mao
>   	return IRQ_HANDLED;
>   }
>   
> diff --git a/arch/loongarch/kernel/smp.c b/arch/loongarch/kernel/smp.c
> index 0dfe2388ef41..7366de776f6e 100644
> --- a/arch/loongarch/kernel/smp.c
> +++ b/arch/loongarch/kernel/smp.c
> @@ -13,6 +13,7 @@
>   #include <linux/cpumask.h>
>   #include <linux/init.h>
>   #include <linux/interrupt.h>
> +#include <linux/irq_work.h>
>   #include <linux/profile.h>
>   #include <linux/seq_file.h>
>   #include <linux/smp.h>
> @@ -70,6 +71,7 @@ static DEFINE_PER_CPU(int, cpu_state);
>   static const char *ipi_types[NR_IPI] __tracepoint_string = {
>   	[IPI_RESCHEDULE] = "Rescheduling interrupts",
>   	[IPI_CALL_FUNCTION] = "Function call interrupts",
> +	[IPI_IRQ_WORK] = "IRQ work interrupts",
>   };
>   
>   void show_ipi_list(struct seq_file *p, int prec)
> @@ -217,6 +219,13 @@ void arch_smp_send_reschedule(int cpu)
>   }
>   EXPORT_SYMBOL_GPL(arch_smp_send_reschedule);
>   
> +#ifdef CONFIG_IRQ_WORK
> +void arch_irq_work_raise(void)
> +{
> +	mp_ops.send_ipi_single(smp_processor_id(), ACTION_IRQ_WORK);
> +}
> +#endif
> +
>   static irqreturn_t loongson_ipi_interrupt(int irq, void *dev)
>   {
>   	unsigned int action;
> @@ -234,6 +243,11 @@ static irqreturn_t loongson_ipi_interrupt(int irq, void *dev)
>   		per_cpu(irq_stat, cpu).ipi_irqs[IPI_CALL_FUNCTION]++;
>   	}
>   
> +	if (action & SMP_IRQ_WORK) {
> +		irq_work_run();
> +		per_cpu(irq_stat, cpu).ipi_irqs[IPI_IRQ_WORK]++;
> +	}
> +
>   	return IRQ_HANDLED;
>   }
>   
> 

