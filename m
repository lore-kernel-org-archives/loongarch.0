Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4FEC2D4
	for <loongarch@lists.linux.dev>; Thu, 30 Mar 2023 05:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=VCGbx8f8mZ4f+Oc3MYt9gYuTabHETbusbeoQWfjTJCY=; b=a7U486FMdHlAa5DmHVqF5bLjWD
	IaCxCSjfp70l82t+KpzxPB4EoUozux2YX+8P6h9haG7d/tGP0zMad3VNgPNSa4byKAEf8n1skgrVz
	lcXCPXiXLt6INOJMlivxY8XPHvRSKn3L1ZvO2ttcWRTsZR7P0PrAT3s+S+4EOXLX2i1jmUiYAQkRk
	ZUsyIATkn+I2TCvok9RD+GLE2N0I/eBz2LsqWmC/ohOjduLQl9hh4uD+WEVimtHI9BuG7w6i4veyx
	t7KzZFNRnGdfBukQ7qTEoF1VwSzqzy4vEqDO1xvOIkZPXKxS5ukUPXTJE79TkYGtHND1GeqUO6sia
	1qm0MsUA==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1phkyv-002eYC-0s;
	Thu, 30 Mar 2023 05:37:53 +0000
Message-ID: <5d12e0fa-2a40-dc24-ee70-677d5242fd7b@infradead.org>
Date: Wed, 29 Mar 2023 22:37:50 -0700
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: loongarch wakeup build error
Content-Language: en-US
To: Tiezhu Yang <yangtiezhu@loongson.cn>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev
References: <11215033-fa3c-ecb1-2fc0-e9aeba47be9b@infradead.org>
 <af6281f5-9c6c-d2d7-5978-b637b8d18473@loongson.cn>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <af6281f5-9c6c-d2d7-5978-b637b8d18473@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 3/29/23 20:33, Tiezhu Yang wrote:
> 
> 
> On 03/30/2023 06:55 AM, Randy Dunlap wrote:
>> Hi,
>>
>> I don't know if this has been reported previously, so here goes.
>>
>> When CONFIG_SUSPEND is not set:
>>
>> loongarch64-linux-ld: drivers/acpi/sleep.o: in function `acpi_pm_prepare':
>> sleep.c:(.text+0x278): undefined reference to `loongarch_wakeup_start'
>> loongarch64-linux-ld: sleep.c:(.text+0x27c): undefined reference to `loongarch_wakeup_start'
>> loongarch64-linux-ld: sleep.c:(.text+0x27c): undefined reference to `loongarch_wakeup_start'
>>
>> A complete randconfig file is attached.
>>
> 
> I can reproduce this build error on LoongArch.
> 
> Here is the call trace:
> 
> acpi_pm_prepare()
>   __acpi_pm_prepare()
>     acpi_sleep_prepare()
>       acpi_get_wakeup_address()
>         loongarch_wakeup_start()
> 
> 
> loongarch_wakeup_start() is defined in arch/loongarch/power/suspend_asm.S
> which is built under CONFIG_SUSPEND. In order to fix the build error, just
> define a empty loongarch_wakeup_start() if CONFIG_SUSPEND is not set.
> 
> diff --git a/arch/loongarch/include/asm/acpi.h b/arch/loongarch/include/asm/acpi.h
> index 4198753aa1d0..7b812a836a5a 100644
> --- a/arch/loongarch/include/asm/acpi.h
> +++ b/arch/loongarch/include/asm/acpi.h
> @@ -39,9 +39,14 @@ extern int loongarch_acpi_suspend(void);
>  extern int (*acpi_suspend_lowlevel)(void);
>  extern void loongarch_suspend_enter(void);
> 
> +#ifdef CONFIG_SUSPEND
> +extern void loongarch_wakeup_start(void);
> +#else
> +static inline void loongarch_wakeup_start(void) {}
> +#endif
> +
>  static inline unsigned long acpi_get_wakeup_address(void)
>  {
> -    extern void loongarch_wakeup_start(void);
>      return (unsigned long)loongarch_wakeup_start;
>  }
> 
> If the above change makes sense, I will send a formal patch later.

LGTM and builds cleanly.
Thanks.

-- 
~Randy
