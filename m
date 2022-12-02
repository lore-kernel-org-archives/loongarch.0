Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3C11C04
	for <loongarch@lists.linux.dev>; Fri,  2 Dec 2022 08:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1669969510; bh=Ye46Fg5eBuOYdIUglann6zign/1mz4qz1cLGfx4nTj8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=G2MeU6gNABJIelvGtyx5+MmmHS/wizejCdW1hz9kFWt/+ckmuGLHyCTEh2laC8421
	 ufFIU9t+z3AHdnsDPNysAEfnPr5NvHkU6KgwlIhcV7NBmYyMc8kQzJmvnQlKkhYc70
	 g0Hj7u4QkhL3u+JcsXvuFBY7duJLiUBvBGWFIrVg=
Received: from [100.100.35.204] (unknown [220.248.53.61])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 17F1E600D1;
	Fri,  2 Dec 2022 16:25:10 +0800 (CST)
Message-ID: <07e0d775-6bb7-051b-9ec9-71153efbdf21@xen0n.name>
Date: Fri, 2 Dec 2022 16:25:09 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0)
 Gecko/20100101 Firefox/109.0 Thunderbird/109.0a1
Subject: Re: [PATCH] LoongArch: export symbol with function
 smp_send_reschedule
To: Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20221202075854.2253116-1-maobibo@loongson.cn>
Content-Language: en-US
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <20221202075854.2253116-1-maobibo@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2022/12/2 15:58, Bibo Mao wrote:
> Function smp_send_reschedule is standard kernel ABI, which is
> defined header file include/linux/smp.h, however on LoongArch
> it is defined as inline function, so that kernel module can
> not use this function.
> 
> Now define smp_send_reschedule as general function, and add
> EXPORT_SYMBOL_GPL on this function, so that kernel modules can
> use it.
> 
> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
> ---
>   arch/loongarch/include/asm/smp.h | 10 ----------
>   arch/loongarch/kernel/smp.c      | 11 +++++++++++
>   2 files changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/loongarch/include/asm/smp.h b/arch/loongarch/include/asm/smp.h
> index 3dd172d9ffea..d82687390b4a 100644
> --- a/arch/loongarch/include/asm/smp.h
> +++ b/arch/loongarch/include/asm/smp.h
> @@ -78,16 +78,6 @@ extern void calculate_cpu_foreign_map(void);
>    */
>   extern void show_ipi_list(struct seq_file *p, int prec);
>   
> -/*
> - * This function sends a 'reschedule' IPI to another CPU.
> - * it goes straight through and wastes no time serializing
> - * anything. Worst case is that we lose a reschedule ...
> - */
> -static inline void smp_send_reschedule(int cpu)
> -{
> -	loongson_send_ipi_single(cpu, SMP_RESCHEDULE);
> -}
> -
>   static inline void arch_send_call_function_single_ipi(int cpu)
>   {
>   	loongson_send_ipi_single(cpu, SMP_CALL_FUNCTION);
> diff --git a/arch/loongarch/kernel/smp.c b/arch/loongarch/kernel/smp.c
> index 6ed72f7ff278..51dd3c3f06cb 100644
> --- a/arch/loongarch/kernel/smp.c
> +++ b/arch/loongarch/kernel/smp.c
> @@ -141,6 +141,17 @@ void loongson_send_ipi_single(int cpu, unsigned int action)
>   	ipi_write_action(cpu_logical_map(cpu), (u32)action);
>   }
>   
> +/*
> + * This function sends a 'reschedule' IPI to another CPU.
> + * it goes straight through and wastes no time serializing
> + * anything. Worst case is that we lose a reschedule ...
> + */
> +void smp_send_reschedule(int cpu)
> +{
> +	loongson_send_ipi_single(cpu, SMP_RESCHEDULE);
> +}
> +EXPORT_SYMBOL_GPL(smp_send_reschedule);
> +

While the change is in itself okay (one less case of mips legacy, 
getting in line with ia64, powerpc and riscv that all EXPORT_SYMBOL_GPL 
this), I'd suggest you batch this patch with the subsequent changes you 
plan to enable with this one, so reviewers would have more context and 
hopefully avoid churn. (I, by my familiarity with Loongson and LoongArch 
development, know you're probably aiming to use this with KVM, but 
others probably don't know, and again it's always better to have more 
context.)

>   void loongson_send_ipi_mask(const struct cpumask *mask, unsigned int action)
>   {
>   	unsigned int i;

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

