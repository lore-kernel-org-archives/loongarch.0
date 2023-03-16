Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4B2376
	for <loongarch@lists.linux.dev>; Thu, 16 Mar 2023 04:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1678941292; bh=Oo6k/PJo2Jxh9vpeXCf8GRdwwmfbRN3ok8oQK918/08=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NY8bWzyGUkx2540c2qPs3j0mJwdb3mDYornIaB4VhA7+ZrnsWTd0ptLt9ScQrE0yh
	 bN4qYMnXdOn7t7XwDLjf2aiKLLKCjhjTC8sTWBez7Ym0660GXKrO5AFxhkuX1SMDtM
	 zfPf7swtMGMlFBK4ojFbXWnGi2QJhoUPJ+5hIhaQ=
Received: from [192.168.9.172] (unknown [101.88.27.125])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 41B3E600D4;
	Thu, 16 Mar 2023 12:34:52 +0800 (CST)
Message-ID: <545d8512-5bc1-5c76-246a-fcad529006a4@xen0n.name>
Date: Thu, 16 Mar 2023 12:34:51 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH V3] LoongArch: Make WriteCombine configurable for
 ioremap()
Content-Language: en-US
To: Huacai Chen <chenhuacai@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, Xuefeng Li <lixuefeng@loongson.cn>,
 Guo Ren <guoren@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
References: <20230315085314.1083141-1-chenhuacai@loongson.cn>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <20230315085314.1083141-1-chenhuacai@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/15/23 16:53, Huacai Chen wrote:
> LoongArch maintains cache coherency in hardware, but when paired with
> LS7A chipsets the WUC attribute (Weak-ordered UnCached, which is similar
> to WriteCombine) is out of the scope of cache coherency machanism for
> PCIe devices (this is a PCIe protocol violation, which may be fixed in
> newer chipsets).
>
> This means WUC can only used for write-only memory regions now, so this
"can only be used for". Same for the Kconfig change.
> option is disabled by default, making WUC silently fallback to SUC for
> ioremap(). You can enable this option if the kernel is ensured to run on
> hardware without this bug.
>
> Kernel parameter writecombine=on/off can be used to override the Kconfig
> option.
We normally want to document this in 
Documentation/admin-guide/kernel-parameters too. This can be done later 
(by you or me).
>
> Suggested-by: WANG Xuerui <kernel@xen0n.name>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
> V2: Add kernel prameter and update commit messages.
> V3: Add a warning message for invalid kernel parameters.
>
>   arch/loongarch/Kconfig          | 16 ++++++++++++++++
>   arch/loongarch/include/asm/io.h |  4 +++-
>   arch/loongarch/kernel/setup.c   | 21 +++++++++++++++++++++
>   3 files changed, 40 insertions(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index 7fd51257e0ed..3ddde336e6a5 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -447,6 +447,22 @@ config ARCH_IOREMAP
>   	  protection support. However, you can enable LoongArch DMW-based
>   	  ioremap() for better performance.
>   
> +config ARCH_WRITECOMBINE
> +	bool "Enable WriteCombine (WUC) for ioremap()"
> +	help
> +	  LoongArch maintains cache coherency in hardware, but when paired
> +	  with LS7A chipsets the WUC attribute (Weak-ordered UnCached, which
> +	  is similar to WriteCombine) is out of the scope of cache coherency
> +	  machanism for PCIe devices (this is a PCIe protocol violation, which
> +	  may be fixed in newer chipsets).
> +
> +	  This means WUC can only used for write-only memory regions now, so
> +	  this option is disabled by default, making WUC silently fallback to
> +	  SUC for ioremap(). You can enable this option if the kernel is ensured
> +	  to run on hardware without this bug.
> +
> +	  You can override this setting via writecombine=on/off boot parameter.
via the ...
> +
>   config ARCH_STRICT_ALIGN
>   	bool "Enable -mstrict-align to prevent unaligned accesses" if EXPERT
>   	default y
> diff --git a/arch/loongarch/include/asm/io.h b/arch/loongarch/include/asm/io.h
> index 402a7d9e3a53..545e2708fbf7 100644
> --- a/arch/loongarch/include/asm/io.h
> +++ b/arch/loongarch/include/asm/io.h
> @@ -54,8 +54,10 @@ static inline void __iomem *ioremap_prot(phys_addr_t offset, unsigned long size,
>    * @offset:    bus address of the memory
>    * @size:      size of the resource to map
>    */
> +extern pgprot_t pgprot_wc;
> +
>   #define ioremap_wc(offset, size)	\
> -	ioremap_prot((offset), (size), pgprot_val(PAGE_KERNEL_WUC))
> +	ioremap_prot((offset), (size), pgprot_val(pgprot_wc))
>   
>   #define ioremap_cache(offset, size)	\
>   	ioremap_prot((offset), (size), pgprot_val(PAGE_KERNEL))
> diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
> index bae84ccf6d36..27f71f9531e1 100644
> --- a/arch/loongarch/kernel/setup.c
> +++ b/arch/loongarch/kernel/setup.c
> @@ -160,6 +160,27 @@ static void __init smbios_parse(void)
>   	dmi_walk(find_tokens, NULL);
>   }
>   
> +#ifdef CONFIG_ARCH_WRITECOMBINE
> +pgprot_t pgprot_wc = PAGE_KERNEL_WUC;
> +#else
> +pgprot_t pgprot_wc = PAGE_KERNEL_SUC;
> +#endif
> +
> +EXPORT_SYMBOL(pgprot_wc);
> +
> +static int __init setup_writecombine(char *p)
> +{
> +	if (!strcmp(p, "on"))
> +		pgprot_wc = PAGE_KERNEL_WUC;
> +	else if (!strcmp(p, "off"))
> +		pgprot_wc = PAGE_KERNEL_SUC;
> +	else
> +		pr_warn("Unknown writecombine setting \"%s\".\n", p);
> +
> +	return 0;
> +}
> +early_param("writecombine", setup_writecombine);
> +
>   static int usermem __initdata;
>   
>   static int __init early_parse_mem(char *p)

With the nits addressed:

Reviewed-by: WANG Xuerui <git@xen0n.name>

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

