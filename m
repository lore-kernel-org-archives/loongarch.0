Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B7193C02
	for <loongarch@lists.linux.dev>; Mon,  6 Mar 2023 12:03:33 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.170])
	by gateway (Coremail) with SMTP id _____8DxUOWS1gVkAc0IAA--.10931S3;
	Mon, 06 Mar 2023 20:03:30 +0800 (CST)
Received: from [10.20.42.170] (unknown [10.20.42.170])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Bxyr2R1gVks5BMAA--.2932S3;
	Mon, 06 Mar 2023 20:03:29 +0800 (CST)
Message-ID: <029a5993-b993-ab73-0a14-0df9b0ddf3da@loongson.cn>
Date: Mon, 6 Mar 2023 20:03:29 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH V3] LoongArch: Provide kernel fpu functions
Content-Language: en-US
To: Huacai Chen <chenhuacai@loongson.cn>, Arnd Bergmann <arnd@arndb.de>,
 Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-arch@vger.kernel.org,
 Xuefeng Li <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>,
 Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
References: <20230306095934.609589-1-chenhuacai@loongson.cn>
From: maobibo <maobibo@loongson.cn>
In-Reply-To: <20230306095934.609589-1-chenhuacai@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Bxyr2R1gVks5BMAA--.2932S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxAF1fCF1rKrWDCw4DWr1ftFb_yoW5Zry3pF
	ZIkFs5GrZ5Cr92v3sxJa4j9r98Jw4kGw1ag3W3GFyrAF4jgF1DWr4vqr9rXFyjva18K3y0
	qFn5K39xK3WDJwUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bxkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64
	kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCF04
	k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
	MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr4
	1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1l
	IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
	A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zwZ7UUUUU==



在 2023/3/6 17:59, Huacai Chen 写道:
> Provide kernel_fpu_begin()/kernel_fpu_end() to allow the kernel itself
> to use fpu. They can be used by some other kernel components, e.g., the
> AMDGPU graphic driver for DCN.
Since kernel is compiled with -msoft-float, I guess hw fpu will not be
used in kernel by present:). However it is deserved to try.
> 
> Reported-by: WANG Xuerui <kernel@xen0n.name>
> Tested-by: WANG Xuerui <kernel@xen0n.name>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
> V2: Use non-GPL exports and update commit messages.
> V3: Add spaces for coding style.
> 
>  arch/loongarch/include/asm/fpu.h |  3 +++
>  arch/loongarch/kernel/Makefile   |  2 +-
>  arch/loongarch/kernel/kfpu.c     | 41 ++++++++++++++++++++++++++++++++
>  3 files changed, 45 insertions(+), 1 deletion(-)
>  create mode 100644 arch/loongarch/kernel/kfpu.c
> 
> diff --git a/arch/loongarch/include/asm/fpu.h b/arch/loongarch/include/asm/fpu.h
> index 358b254d9c1d..192f8e35d912 100644
> --- a/arch/loongarch/include/asm/fpu.h
> +++ b/arch/loongarch/include/asm/fpu.h
> @@ -21,6 +21,9 @@
>  
>  struct sigcontext;
>  
> +extern void kernel_fpu_begin(void);
> +extern void kernel_fpu_end(void);
> +
>  extern void _init_fpu(unsigned int);
>  extern void _save_fp(struct loongarch_fpu *);
>  extern void _restore_fp(struct loongarch_fpu *);
> diff --git a/arch/loongarch/kernel/Makefile b/arch/loongarch/kernel/Makefile
> index 78d4e3384305..9a72d91cd104 100644
> --- a/arch/loongarch/kernel/Makefile
> +++ b/arch/loongarch/kernel/Makefile
> @@ -13,7 +13,7 @@ obj-y		+= head.o cpu-probe.o cacheinfo.o env.o setup.o entry.o genex.o \
>  obj-$(CONFIG_ACPI)		+= acpi.o
>  obj-$(CONFIG_EFI) 		+= efi.o
>  
> -obj-$(CONFIG_CPU_HAS_FPU)	+= fpu.o
> +obj-$(CONFIG_CPU_HAS_FPU)	+= fpu.o kfpu.o
>  
>  obj-$(CONFIG_ARCH_STRICT_ALIGN)	+= unaligned.o
>  
> diff --git a/arch/loongarch/kernel/kfpu.c b/arch/loongarch/kernel/kfpu.c
> new file mode 100644
> index 000000000000..cd2a18fecdcc
> --- /dev/null
> +++ b/arch/loongarch/kernel/kfpu.c
> @@ -0,0 +1,41 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2023 Loongson Technology Corporation Limited
> + */
> +
> +#include <linux/cpu.h>
> +#include <linux/init.h>
> +#include <asm/fpu.h>
> +#include <asm/smp.h>
> +
> +static DEFINE_PER_CPU(bool, in_kernel_fpu);
> +
> +void kernel_fpu_begin(void)
> +{
> +	if (this_cpu_read(in_kernel_fpu))
> +		return;
> +
> +	preempt_disable();
> +	this_cpu_write(in_kernel_fpu, true);
> +
> +	if (!is_fpu_owner())
> +		enable_fpu();
> +	else
> +		_save_fp(&current->thread.fpu);
Do we need initialize fcsr rather than using random fcsr value
of other processes? There may be fpu exception enabled by
other tasks.

Regards
Bibo,mao
> +}
> +EXPORT_SYMBOL(kernel_fpu_begin);
> +
> +void kernel_fpu_end(void)
> +{
> +	if (!this_cpu_read(in_kernel_fpu))
> +		return;
> +
> +	if (!is_fpu_owner())
> +		disable_fpu();
> +	else
> +		_restore_fp(&current->thread.fpu);
> +
> +	this_cpu_write(in_kernel_fpu, false);
> +	preempt_enable();
> +}
> +EXPORT_SYMBOL(kernel_fpu_end);

