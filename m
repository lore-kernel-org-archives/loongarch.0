Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 596B4358A4
	for <loongarch@lists.linux.dev>; Mon,  9 Oct 2023 14:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from loongson.cn (unknown [10.20.42.43])
	by gateway (Coremail) with SMTP id _____8CxrusRDyRlVlYwAA--.24387S3;
	Mon, 09 Oct 2023 22:32:49 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Bx7twMDyRliescAA--.61602S3;
	Mon, 09 Oct 2023 22:32:44 +0800 (CST)
Message-ID: <4f1af31b-15be-cb47-6b34-45de1b5696be@loongson.cn>
Date: Mon, 9 Oct 2023 22:32:44 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] loongarch/mm: disable WUC for pgprot_writecombine as
 same as ioremap_wc
To: Icenowy Zheng <uwu@icenowy.me>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Weihao Li <liweihao@loongson.cn>, "Mike Rapoport (IBM)" <rppt@kernel.org>,
 Jun Yi <yijun@loongson.cn>, Baoquan He <bhe@redhat.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 David Hildenbrand <david@redhat.com>,
 Hongchen Zhang <zhanghongchen@loongson.cn>,
 Binbin Zhou <zhoubinbin@loongson.cn>, Zhen Lei <thunder.leizhen@huawei.com>,
 Tiezhu Yang <yangtiezhu@loongson.cn>, Thomas Gleixner <tglx@linutronix.de>,
 Zhihong Dong <donmor3000@hotmail.com>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20231009042841.635366-1-uwu@icenowy.me>
Content-Language: en-US
From: Sui Jingfeng <suijingfeng@loongson.cn>
In-Reply-To: <20231009042841.635366-1-uwu@icenowy.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8Bx7twMDyRliescAA--.61602S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxWr4kJw1fKr15XrWfWryUurX_yoWrAr1rpF
	9rZryktFs5GFnayrnFyryq9r1UArs7GasFga4UKryDZFyjqr109w40yrWDZa48Z393CrW0
	qF4F9r1DZF4qy3cCm3ZEXasCq-sJn29KB7ZKAUJUUUU3529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUP2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVWxJr0_GcWln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r12
	6r1DMcIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
	1lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxG
	rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8Dl1DUUUU
	U==

Hi,


On 2023/10/9 12:28, Icenowy Zheng wrote:
> Currently the code disables WUC only disables it for ioremap_wc(), which
> is only used when mapping writecombine pages like ioremap() (mapped to
> the kernel space). For VRAM mapped in TTM/GEM, it's mapped with a
> crafted pgprot with pgprot_writecombine() function, which isn't
> corrently disabled now.
>
> Disable WUC for pgprot_writecombine() (fallback to SUC) too.
>
> This improves AMDGPU driver stability on Loongson 3A5000 machines.
>
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
> Changes since v1:
> - Removed _WC macros
> - Mention ioremap_wc in commit message
>
>   arch/loongarch/include/asm/io.h           |  5 ++---
>   arch/loongarch/include/asm/pgtable-bits.h |  4 +++-
>   arch/loongarch/kernel/setup.c             | 10 +++++-----
>   3 files changed, 10 insertions(+), 9 deletions(-)
>
> diff --git a/arch/loongarch/include/asm/io.h b/arch/loongarch/include/asm/io.h
> index 0dcb36b32cb25..290aad87a8847 100644
> --- a/arch/loongarch/include/asm/io.h
> +++ b/arch/loongarch/include/asm/io.h
> @@ -52,10 +52,9 @@ static inline void __iomem *ioremap_prot(phys_addr_t offset, unsigned long size,
>    * @offset:    bus address of the memory
>    * @size:      size of the resource to map
>    */
> -extern pgprot_t pgprot_wc;
> -
>   #define ioremap_wc(offset, size)	\
> -	ioremap_prot((offset), (size), pgprot_val(pgprot_wc))
> +	ioremap_prot((offset), (size), pgprot_val( \
> +		wc_enabled ? PAGE_KERNEL_WUC : PAGE_KERNEL_SUC))
>   
>   #define ioremap_cache(offset, size)	\
>   	ioremap_prot((offset), (size), pgprot_val(PAGE_KERNEL))
> diff --git a/arch/loongarch/include/asm/pgtable-bits.h b/arch/loongarch/include/asm/pgtable-bits.h
> index 35348d4c4209a..a3d827701736d 100644
> --- a/arch/loongarch/include/asm/pgtable-bits.h
> +++ b/arch/loongarch/include/asm/pgtable-bits.h
> @@ -92,6 +92,8 @@
>   
>   #ifndef __ASSEMBLY__
>   
> +extern bool wc_enabled;
> +
>   #define _PAGE_IOREMAP		pgprot_val(PAGE_KERNEL_SUC)
>   
>   #define pgprot_noncached pgprot_noncached
> @@ -111,7 +113,7 @@ static inline pgprot_t pgprot_writecombine(pgprot_t _prot)
>   {
>   	unsigned long prot = pgprot_val(_prot);
>   
> -	prot = (prot & ~_CACHE_MASK) | _CACHE_WUC;
> +	prot = (prot & ~_CACHE_MASK) | (wc_enabled ? _CACHE_WUC : _CACHE_SUC);
>   
>   	return __pgprot(prot);
>   }
> diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
> index 7783f0a3d742c..465c1dbb6f4b4 100644
> --- a/arch/loongarch/kernel/setup.c
> +++ b/arch/loongarch/kernel/setup.c
> @@ -161,19 +161,19 @@ static void __init smbios_parse(void)
>   }
>   
>   #ifdef CONFIG_ARCH_WRITECOMBINE
> -pgprot_t pgprot_wc = PAGE_KERNEL_WUC;
> +bool wc_enabled = true;
>   #else
> -pgprot_t pgprot_wc = PAGE_KERNEL_SUC;
> +bool wc_enabled;
>   #endif
>   
> -EXPORT_SYMBOL(pgprot_wc);
> +EXPORT_SYMBOL(wc_enabled);
>   
>   static int __init setup_writecombine(char *p)
>   {
>   	if (!strcmp(p, "on"))
> -		pgprot_wc = PAGE_KERNEL_WUC;
> +		wc_enabled = true;
>   	else if (!strcmp(p, "off"))
> -		pgprot_wc = PAGE_KERNEL_SUC;
> +		wc_enabled = false;
>   	else
>   		pr_warn("Unknown writecombine setting \"%s\".\n", p);
>   


Good catch!

But this will make the write combine(WC) mappings completely unusable on LoongArch.
This is nearly equivalent to say that LoongArch don't support write combine at all.
But the write combine(WC) mappings works fine for software based drm drivers,
such as drm/loongson and drm/ast etc. Even include drm/radeon and drm/amdgpu with
pure software rendering setup (by putting Option "Accel" "off" into 10-amdgpu.conf
or 10-radeon.conf) After merge this patch, the performance drop dramatically for
2D software rendering based display controller drivers.

Well, this patch itself is a good catch, as it is a fix for the commit <16c52e503043>
("LoongArch: Make WriteCombine configurable for ioremap()"). But I'm afraid that
both of this commit and the <16c52e503043> commit are not a *real* fix write combine
related issue on LoongArch. It just negative sidestep of the real problem.

