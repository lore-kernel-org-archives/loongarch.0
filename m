Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 076F04A24
	for <loongarch@lists.linux.dev>; Sat,  7 Dec 2024 06:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733551446; cv=none; b=ADikqwn6sw1Rh0hiHsGTml3hd/vfe0rBBFfUBKSgwLTohJqcGyl4hnITHdoPAby+MiQaIx6iTPoNsGOpMxw/c/rDyz0LvlM4XjI1Ab6S9uiFTRJdVf3sh6rv3C4dNcWYVCnPXqqUTgbZobKBjDbC8l9vdjJ7qYr6e8XsCkuxO/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733551446; c=relaxed/simple;
	bh=YseTBCdknFeKunaNhZVzKTtsFPafjj38mjutfiqsZfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sj8alB8pCN+6uvN5B1rXOn0Lw2a0SvLUIKUapas8UQM7ZChpBgqrDcZ6fTW6liXgHBEIKyZdiBbIpBuNaPHmlHc4yLI4YkAi7PhW1zoKr7iE2tZ7MBTRkOkl4IM4osbpb1RSoAvIuMFGm7mYrGbnJVscEcO+llfW2/uh3cO//l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [111.207.111.194])
	by gateway (Coremail) with SMTP id _____8DxDeNP5VNnK8VSAA--.28768S3;
	Sat, 07 Dec 2024 14:03:59 +0800 (CST)
Received: from [10.180.13.127] (unknown [111.207.111.194])
	by front1 (Coremail) with SMTP id qMiowMDxSMFO5VNncah5AA--.10777S2;
	Sat, 07 Dec 2024 14:03:59 +0800 (CST)
Message-ID: <455c5236-c5de-4138-bb23-04abb57a9a89@loongson.cn>
Date: Sat, 7 Dec 2024 14:03:58 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irqchip/loongarch-avec:Add multi-nodes topology support
To: Tianyang Zhang <zhangtianyang@loongson.cn>, chenhuacai@kernel.org,
 kernel@xen0n.name, tglx@linutronix.de
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241207033146.20938-1-zhangtianyang@loongson.cn>
Content-Language: en-US
From: Ming Wang <wangming01@loongson.cn>
In-Reply-To: <20241207033146.20938-1-zhangtianyang@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowMDxSMFO5VNncah5AA--.10777S2
X-CM-SenderInfo: 5zdqwzxlqjiio6or00hjvr0hdfq/1tbiAQEEEmdTfkADlwACsK
X-Coremail-Antispam: 1Uk129KBj93XoW7Ww1UAry7GrW8Gw17Xw15ZFc_yoW5JF1rpa
	y5Za45Jr4Ut3Z7Wr9xK34DZFy3Xr4fK39rta43C3W7WrZ8GryDWFy0qF98ZF18C397Z3WF
	vr4xJF4Uu3W5ZFgCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804V
	CY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AK
	xVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcV
	AKI48JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
	wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc4
	0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
	xVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
	1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU2g18DUUU
	U



On 2024/12/7 11:31, Tianyang Zhang wrote:
> This patch enables the advanced interrupt controller function under
> multiple-node of 3C600. The topology of the advanced interrupt controller
I think '3c600' is a typo. Shouldn't it be '3c6000'?
> is consistent with NUMA node. We check the enable status of the node where
> each CPU is located once when it goes online, which may cause some
> additional operations, but it can ensure that the advanced interrupt
> controller can still be used in situations where some CPUs cannot start
> 
> Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
> ---
>   drivers/irqchip/irq-loongarch-avec.c | 20 ++++++++++++++++----
>   1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-loongarch-avec.c b/drivers/irqchip/irq-loongarch-avec.c
> index 0f6e465dd309..9e30198fa7e4 100644
> --- a/drivers/irqchip/irq-loongarch-avec.c
> +++ b/drivers/irqchip/irq-loongarch-avec.c
> @@ -56,6 +56,18 @@ struct avecintc_data {
>   	unsigned int		moving;
>   };
>   
> +static inline void avecintc_enable(void)
> +{
> +	u64 value;
> +
> +	if (!loongarch_avec.domain)
> +		return;
> +
> +	value = iocsr_read64(LOONGARCH_IOCSR_MISC_FUNC);
> +	value |= IOCSR_MISC_FUNC_AVEC_EN;
> +	iocsr_write64(value, LOONGARCH_IOCSR_MISC_FUNC);
> +}
> +
>   static inline void avecintc_ack_irq(struct irq_data *d)
>   {
>   }
> @@ -127,6 +139,8 @@ static int avecintc_cpu_online(unsigned int cpu)
>   
>   	guard(raw_spinlock)(&loongarch_avec.lock);
>   
> +	avecintc_enable();
> +
>   	irq_matrix_online(loongarch_avec.vector_matrix);
>   
>   	pending_list_init(cpu);
> @@ -339,7 +353,6 @@ static int __init irq_matrix_init(void)
>   static int __init avecintc_init(struct irq_domain *parent)
>   {
>   	int ret, parent_irq;
> -	unsigned long value;
>   
>   	raw_spin_lock_init(&loongarch_avec.lock);
>   
> @@ -378,14 +391,13 @@ static int __init avecintc_init(struct irq_domain *parent)
>   				  "irqchip/loongarch/avecintc:starting",
>   				  avecintc_cpu_online, avecintc_cpu_offline);
>   #endif
> -	value = iocsr_read64(LOONGARCH_IOCSR_MISC_FUNC);
> -	value |= IOCSR_MISC_FUNC_AVEC_EN;
> -	iocsr_write64(value, LOONGARCH_IOCSR_MISC_FUNC);
> +	avecintc_enable();
>   
>   	return ret;
>   
>   out_remove_domain:
>   	irq_domain_remove(loongarch_avec.domain);
> +	loongarch_avec.domain = NULL;
>   out_free_handle:
>   	irq_domain_free_fwnode(loongarch_avec.fwnode);
>   out:

