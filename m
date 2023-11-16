Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC1BD50B
	for <loongarch@lists.linux.dev>; Thu, 16 Nov 2023 07:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xen0n.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xen0n.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xen0n.name header.i=@xen0n.name header.b="NAJxJYVj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1700118545; bh=tLhZrpx6yt9jl3oYPUFGvwS/PimaF07PQj+3E4RHTU8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NAJxJYVjQm26NZG+m5Gq3p4yf4vzA96hBHGaXLL4vN84pBTNOZzXQqpv1RT5AzzH5
	 i718fYipP+pbE9L4+Sn5t7iZ2291u8V4jr3de9NKezzrBPdfH+qrQ1+lNdaYx/KA/R
	 NI4nyRiAEXK2aXiz8IpMlugqQxMhQSw7qwlJ7hIs=
Received: from [IPV6:240e:388:8d26:bf00:6f50:1e00:d62c:dcf9] (unknown [IPv6:240e:388:8d26:bf00:6f50:1e00:d62c:dcf9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id C53276018A;
	Thu, 16 Nov 2023 15:09:05 +0800 (CST)
Message-ID: <21c772c3-b1ad-49c4-b6ca-204cb65042de@xen0n.name>
Date: Thu, 16 Nov 2023 15:09:05 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] LoongArch: Implement stable timer shutdown interface
Content-Language: en-US
To: Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20231114114656.1003841-1-maobibo@loongson.cn>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <20231114114656.1003841-1-maobibo@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Sorry for the late review but here we go:

On 11/14/23 19:46, Bibo Mao wrote:
> When cpu is hotplug out, cpu is in idle state and function
"When a CPU is hot-unplugged, it is put into idle state and the function 
... is called"
> arch_cpu_idle_dead is called. Timer interrupt for this processor should
> be disabled, else there will be timer interrupt for the dead cpu. Also
> this prevents vcpu to schedule out during halt-polling flow when system
> is running in vm mode, since there is pending timer interrupt.

The logical relationship is a bit unclear, is my paraphrasing correct in 
your opinion?

"Timer interrupt for this processor should be disabled, else a pending 
timer interrupt will prevent the vCPU from scheduling out during the 
halt-polling flow when system is running in VM mode"

(I don't immediately know what a "schedule out" is. Is that a 
translation artifact or some KVM jargon?)

>
> This patch adds detailed implementation for timer shutdown interface, so
> that timer will be disabled when cpu is plug-out.

Missing some definite articles too.

"This patch implements the timer shutdown interface so that the timer 
will be properly disabled when a CPU is hot-unplugged"

Is this version better?

>
> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
> ---
>   arch/loongarch/kernel/time.c | 9 ++-------
>   1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/arch/loongarch/kernel/time.c b/arch/loongarch/kernel/time.c
> index 3064af94db9c..2920770e30a9 100644
> --- a/arch/loongarch/kernel/time.c
> +++ b/arch/loongarch/kernel/time.c
> @@ -58,7 +58,7 @@ static int constant_set_state_oneshot(struct clock_event_device *evt)
>   	return 0;
>   }
>   
> -static int constant_set_state_oneshot_stopped(struct clock_event_device *evt)
> +static int constant_set_state_shutdown(struct clock_event_device *evt)
>   {
>   	unsigned long timer_config;
>   
> @@ -90,11 +90,6 @@ static int constant_set_state_periodic(struct clock_event_device *evt)
>   	return 0;
>   }
>   
> -static int constant_set_state_shutdown(struct clock_event_device *evt)
> -{
> -	return 0;
> -}
> -
>   static int constant_timer_next_event(unsigned long delta, struct clock_event_device *evt)
>   {
>   	unsigned long timer_config;
> @@ -161,7 +156,7 @@ int constant_clockevent_init(void)
>   	cd->rating = 320;
>   	cd->cpumask = cpumask_of(cpu);
>   	cd->set_state_oneshot = constant_set_state_oneshot;
> -	cd->set_state_oneshot_stopped = constant_set_state_oneshot_stopped;
> +	cd->set_state_oneshot_stopped = constant_set_state_shutdown;
>   	cd->set_state_periodic = constant_set_state_periodic;
>   	cd->set_state_shutdown = constant_set_state_shutdown;
>   	cd->set_next_event = constant_timer_next_event;
>
> base-commit: 9bacdd8996c77c42ca004440be610692275ff9d0

Otherwise LGTM (regarding the renaming of 
constant_set_state_oneshot_stopped, both it and the removed 
constant_set_state_shutdown only has one usage respectively, and looking 
at the function body it's arguably more appropriate to let it take the 
"shutdown" name: it's just clearing the enable bit from the CSR.TCFG and 
nothing else).

With the nits addressed:

Reviewed-by: WANG Xuerui <git@xen0n.name>

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

