Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AEB15C6
	for <loongarch@lists.linux.dev>; Fri, 31 Mar 2023 03:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1680233130; bh=882S7QFXm5n//3nqg1xYTL7PCI7LqWbNY4wq4uGr7zQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WNZASJgpIHXh9KJlbjD56lxOmxbZB+osCc6R7kMJHZYmvRy2Zm8SpMIxRbNC/39Vb
	 8rTs98eR2BeIqLbs5BSGsDF19vOfL9GVOkdbZO1PPeRnsegeyD9UbTgaDSpmOpSpSx
	 B7PAnZZg9qD9ySM3brfMZUiA3hMSMfShWuCJF3yw=
Received: from [100.100.33.167] (unknown [220.248.53.61])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 3C0A560148;
	Fri, 31 Mar 2023 11:25:30 +0800 (CST)
Message-ID: <0942af8b-64f5-2ed5-d8dc-a56a0761741e@xen0n.name>
Date: Fri, 31 Mar 2023 11:25:29 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH] LoongArch: Fix build error if CONFIG_SUSPEND is not set
Content-Language: en-US
To: Huacai Chen <chenhuacai@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, Xuefeng Li <lixuefeng@loongson.cn>,
 Guo Ren <guoren@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn,
 Randy Dunlap <rdunlap@infradead.org>, Tiezhu Yang <yangtiezhu@loongson.cn>
References: <20230331025322.442337-1-chenhuacai@loongson.cn>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <20230331025322.442337-1-chenhuacai@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023/3/31 10:53, Huacai Chen wrote:
> We can see the following build error on LoongArch if CONFIG_SUSPEND is
> not set:
> 
>    ld: drivers/acpi/sleep.o: in function 'acpi_pm_prepare':
>    sleep.c:(.text+0x2b8): undefined reference to 'loongarch_wakeup_start'
> 
> Here is the call trace:
> 
>    acpi_pm_prepare()
>      __acpi_pm_prepare()
>        acpi_sleep_prepare()
>          acpi_get_wakeup_address()
>            loongarch_wakeup_start()
> 
> Root cause: loongarch_wakeup_start() is defined in arch/loongarch/power/
> suspend_asm.S which is only built under CONFIG_SUSPEND. In order to fix
> the build error, just let acpi_get_wakeup_address() return 0 if CONFIG_
> SUSPEND is not set.
> 
> Fixes: 366bb35a8e48 ("LoongArch: Add suspend (ACPI S3) support")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Link: https://lore.kernel.org/all/11215033-fa3c-ecb1-2fc0-e9aeba47be9b@infradead.org/
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>   arch/loongarch/include/asm/acpi.h | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/loongarch/include/asm/acpi.h b/arch/loongarch/include/asm/acpi.h
> index 4198753aa1d0..976a810352c6 100644
> --- a/arch/loongarch/include/asm/acpi.h
> +++ b/arch/loongarch/include/asm/acpi.h
> @@ -41,8 +41,11 @@ extern void loongarch_suspend_enter(void);
>   
>   static inline unsigned long acpi_get_wakeup_address(void)
>   {
> +#ifdef CONFIG_SUSPEND
>   	extern void loongarch_wakeup_start(void);
>   	return (unsigned long)loongarch_wakeup_start;
> +#endif
> +	return 0UL;
>   }
>   
>   #endif /* _ASM_LOONGARCH_ACPI_H */

Reviewed-by: WANG Xuerui <git@xen0n.name>

Thanks!

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

