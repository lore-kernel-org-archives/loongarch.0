Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558D05C97
	for <loongarch@lists.linux.dev>; Sun,  9 Jul 2023 13:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=XtlMj/xZI5fxRI8QHsDdIuiDOXuudEspjl5+tacTkOM=; b=CrdEhIU6Mtm0sMlfLY7rr9daGa
	1hcv6fiqX2SoVpI/A0QU8TPKmTyhYsZctRnUX6sgustbVHxfWe2qzyy//LJ9vtUFWmiaQNFEobNGS
	7/x3ZA36rNmedykyIBQo9mrqJT+9Nnk7FoHzr4hpoKwPg7Kt8vMBYfpgP67sZ5tOv/reLdkHuy3fI
	8uZxLozMOUIOWE8kCdZd5JBWNYwPo+/+yKWXy8Jlq2wXryBD8BYkmY0GdLECjVg6gMZevqCMQmM/6
	2qVSKVLZ3i0qIr/cELTSA1TdgLRcglMRclY28x3WKJ8z0dHZeD1i0OlU6dL56zMm7d2N9fcaohuZd
	ybiU6bGA==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qIUYq-009AbJ-2d;
	Sun, 09 Jul 2023 13:34:48 +0000
Message-ID: <7f0b03e1-886f-5382-9b86-425b86006569@infradead.org>
Date: Sun, 9 Jul 2023 06:34:48 -0700
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] loongarch: Make CONFIG_CMDLINE work with
 CONFIG_CMDLINE_EXTEND and CONFIG_CMDLINE_BOOTLOADER
Content-Language: en-US
To: Dong Zhihong <donmor3000@hotmail.com>, chenhuacai@kernel.org,
 kernel@xen0n.name
Cc: ardb@kernel.org, tangyouling@loongson.cn, zhoubinbin@loongson.cn,
 yangtiezhu@loongson.cn, tglx@linutronix.de, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <MEYP282MB2597CD6E861D659E3218148DD933A@MEYP282MB2597.AUSP282.PROD.OUTLOOK.COM>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <MEYP282MB2597CD6E861D659E3218148DD933A@MEYP282MB2597.AUSP282.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/9/23 06:32, Dong Zhihong wrote:
> This patch tends to fix broken CONFIG_CMDLINE, which is not working with
> CONFIG_CMDLINE_EXTEND or CONFIG_CMDLINE_BOOTLOADER. Some code is absent in
> arch/loongarch/kernel/setup.c, which should handle built-in command lines
> in CONFIG_CMDLINE. The absence of such code causes CONFIG_CMDLINE not
> working if CONFIG_CMDLINE_EXTEND or CONFIG_CMDLINE_BOOTLOADER is set to Y.
> CONFIG_CMDLINE_FORCE is not affected.
> 
> Signed-off-by: Dong Zhihong <donmor3000@hotmail.com>
> ---
>  arch/loongarch/kernel/setup.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
> index 78a00359bde3..504218b94879 100644
> --- a/arch/loongarch/kernel/setup.c
> +++ b/arch/loongarch/kernel/setup.c
> @@ -335,6 +335,22 @@ static void __init bootcmdline_init(char **cmdline_p)
>  	}
>  #endif
>  
> +#ifdef CONFIG_CMDLINE
> +	/*
> +	 * If CONFIG_CMDLINE_BOOTLOADER is enabled then we use thei built-in

	                                                       the

> +	 * command line if no command line given, or we append given command
> +	 * line to the built-in one if CONFIG_CMDLINE_EXTEND is enabled.
> +	 */
> +	if (IS_ENABLED(CONFIG_CMDLINE_EXTEND)) {
> +		strscpy(boot_command_line, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
> +		strlcat(boot_command_line, " ", COMMAND_LINE_SIZE);
> +		strlcat(boot_command_line, init_command_line, COMMAND_LINE_SIZE);
> +	}
> +
> +	if (IS_ENABLED(CONFIG_CMDLINE_BOOTLOADER) && !boot_command_line[0])
> +		strscpy(boot_command_line, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
> +#endif
> +
>  out:
>  	*cmdline_p = boot_command_line;
>  }

-- 
~Randy
