Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDBE17FF
	for <loongarch@lists.linux.dev>; Mon,  6 Mar 2023 03:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1678073757; bh=VUQNUraGLbD0xchZYnzzx8R6+Jx7Jbqf5zAc2EnfQRc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SYml2qj++0af4Qc/lBOyUIC4miP+40onItr1fu8Udir2+3hie00GyCH83cXWl26p4
	 /OceGAMTS66Xp5/qFDXFVVuxmCBK6+cz56aG0/o0lZmtIs9yTpaCuS7xx50dSerY/S
	 h9AMLaomjcN7NRGzHyz1WvwLs0zREW4N6+xMeuEY=
Received: from [100.100.57.122] (unknown [58.34.185.106])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 38FC960B17;
	Mon,  6 Mar 2023 11:35:57 +0800 (CST)
Message-ID: <5523441e-6845-8e6b-52dd-aa7f1b444fd9@xen0n.name>
Date: Mon, 6 Mar 2023 11:35:56 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3] drivers: loongson: fix memory leak in
 loongson2_guts_probe
Content-Language: en-US
To: Dongliang Mu <dzm91@hust.edu.cn>, Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: loongarch@lists.linux.dev
References: <20230306032854.254700-1-dzm91@hust.edu.cn>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <20230306032854.254700-1-dzm91@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023/3/6 11:28, Dongliang Mu wrote:
> drivers/soc/loongson/loongson2_guts.c:150 loongson2_guts_probe()
> warn: 'guts->regs' from ioremap() not released on lines: 131,135,139,143.
> 
> Fix this by modifying ioremap to devm_ioremap.
> 
> Note that, this patch is not tested due to the loongson architecture.
> 
> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>

You may retain the R-b tags from Huacai and me, since v3 -> v2 changes 
was trivial.

But in this case the maintainer (Yinbo) could be aware of this when 
applying the patch locally, so you won't have to resend this time. You 
may do better for your future patches though, and thanks for your patience!

> ---
> v2->v3: change res->end - res->start + 1 to resource_size(res)
> v1->v2: instead of modifying error handling code, directly change
> ioremap to devm_ioremap.
> ---
>   drivers/soc/loongson/loongson2_guts.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/loongson/loongson2_guts.c b/drivers/soc/loongson/loongson2_guts.c
> index bace4bc8e03b..ffee5a55a985 100644
> --- a/drivers/soc/loongson/loongson2_guts.c
> +++ b/drivers/soc/loongson/loongson2_guts.c
> @@ -107,7 +107,7 @@ static int loongson2_guts_probe(struct platform_device *pdev)
>   	guts->little_endian = of_property_read_bool(np, "little-endian");
>   
>   	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	guts->regs = ioremap(res->start, res->end - res->start + 1);
> +	guts->regs = devm_ioremap(dev, res->start, resource_size(res));
>   	if (IS_ERR(guts->regs))
>   		return PTR_ERR(guts->regs);
>   

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

