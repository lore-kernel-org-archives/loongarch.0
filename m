Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED86710FF
	for <loongarch@lists.linux.dev>; Sat,  8 Oct 2022 09:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1665221240; bh=4RXWvHOEFN+CAwbA4Tw1ZvFjHe9LQrVJ2duQJHKG17k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=q3mjswVrpBCbTNjcTk3Yd3hwbrYITzgEg53yTepRDEBTKw4FRC/Z9auWZC0lkwlAN
	 2mU0wwLGUHrU6cRBBKXT9vOAynSizu62c9XRn0R3SHhngWk6B29Yh7Q7YXtdLQOOW5
	 mPlghUjUCe6Rei+jwxYxD4HmC+Pij0gJbj+9/03E=
Received: from [100.100.35.204] (unknown [58.34.185.106])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 9BA07600CE;
	Sat,  8 Oct 2022 17:27:20 +0800 (CST)
Message-ID: <922e6d73-78e5-8852-788b-017d0dbe4df5@xen0n.name>
Date: Sat, 8 Oct 2022 17:27:20 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:107.0)
 Gecko/20100101 Thunderbird/107.0a1
Subject: Re: [PATCH] LoongArch: Do not create sysfs control file for io master
 CPUs
To: Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <1665219579-2501-1-git-send-email-yangtiezhu@loongson.cn>
Content-Language: en-US
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <1665219579-2501-1-git-send-email-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2022/10/8 16:59, Tiezhu Yang wrote:
> Now io master CPUs are not hotpluggable on LoongArch, in the current code,
> only /sys/devices/system/cpu/cpu0/online is not created, let us set the
> hotpluggable field of all the io master CPUs as 0, then prevent to create
> sysfs control file for the other io master CPUs which confuses some user
> space tools. This is similar with commit 9cce844abf07 ("MIPS: CPU#0 is not
> hotpluggable").
> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>   arch/loongarch/kernel/smp.c      |  8 --------
>   arch/loongarch/kernel/topology.c | 12 +++++++++++-
>   2 files changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/loongarch/kernel/smp.c b/arch/loongarch/kernel/smp.c
> index b5fab30..ef89292 100644
> --- a/arch/loongarch/kernel/smp.c
> +++ b/arch/loongarch/kernel/smp.c
> @@ -240,19 +240,11 @@ void loongson3_smp_finish(void)
>   
>   #ifdef CONFIG_HOTPLUG_CPU
>   
> -static bool io_master(int cpu)
> -{
> -	return test_bit(cpu, &loongson_sysconf.cores_io_master);
> -}
> -
>   int loongson3_cpu_disable(void)
>   {
>   	unsigned long flags;
>   	unsigned int cpu = smp_processor_id();
>   
> -	if (io_master(cpu))
> -		return -EBUSY;
> -

Could this get invoked from somewhere other than the sysfs entries that 
"confuse user-space tools", e.g. from somewhere else in kernel land? If 
so (or if we can't rule out the possibility) keeping the guard here 
might prove more prudent.

>   #ifdef CONFIG_NUMA
>   	numa_remove_cpu(cpu);
>   #endif
> diff --git a/arch/loongarch/kernel/topology.c b/arch/loongarch/kernel/topology.c
> index ab1a75c..7e7a77f 100644
> --- a/arch/loongarch/kernel/topology.c
> +++ b/arch/loongarch/kernel/topology.c
> @@ -5,6 +5,7 @@
>   #include <linux/node.h>
>   #include <linux/nodemask.h>
>   #include <linux/percpu.h>
> +#include <asm/bootinfo.h>
>   
>   static DEFINE_PER_CPU(struct cpu, cpu_devices);
>   
> @@ -33,6 +34,11 @@ void arch_unregister_cpu(int cpu)
>   EXPORT_SYMBOL(arch_unregister_cpu);
>   #endif
>   
> +static bool io_master(int cpu)
> +{
> +	return test_bit(cpu, &loongson_sysconf.cores_io_master);
> +}
> +
>   static int __init topology_init(void)
>   {
>   	int i, ret;
> @@ -40,7 +46,11 @@ static int __init topology_init(void)
>   	for_each_present_cpu(i) {
>   		struct cpu *c = &per_cpu(cpu_devices, i);
>   
> -		c->hotpluggable = !!i;
> +		if (io_master(i))
> +			c->hotpluggable = 0;
> +		else
> +			c->hotpluggable = 1;
> +

This is just "c->hotpluggable = !io_master(i);".

>   		ret = register_cpu(c, i);
>   		if (ret < 0)
>   			pr_warn("topology_init: register_cpu %d failed (%d)\n", i, ret);
Other changes should be okay as they are in line with the previous MIPS 
change you referenced, but let's see what Huacai thinks.

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

