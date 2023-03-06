Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479B87E
	for <loongarch@lists.linux.dev>; Mon,  6 Mar 2023 02:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1678069638; bh=MpPZN7N9R3QdG3r1SIgebPmdNiwfksXkOOP8VhiaGyg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eJP9ViJcHgzZguSD9T5ZRyhfokZ3cGkRpZlOaNjjLtM+F4wiJ184vBtl+FceJix9C
	 gzrsjqvUzS6j1meeE7W7MvUjUqM1yvuzHkIlag4KfMG/yVIGFmc/MRVmXN5DN7+eH0
	 BLs0AOODZhGsa+WE8ePsHfbYlLyZI8D/MdrL6fUA=
Received: from [100.100.57.122] (unknown [58.34.185.106])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id A083F600A6;
	Mon,  6 Mar 2023 10:27:17 +0800 (CST)
Message-ID: <20622cce-7bd0-fd2a-16b1-064f572d52dc@xen0n.name>
Date: Mon, 6 Mar 2023 10:27:16 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] drivers: loongson: fix memory leak in
 loongson2_guts_probe/remove
Content-Language: en-US
To: Dongliang Mu <dzm91@hust.edu.cn>, Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20230306012201.242413-1-dzm91@hust.edu.cn>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <20230306012201.242413-1-dzm91@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 2023/3/6 09:22, Dongliang Mu wrote:
> drivers/soc/loongson/loongson2_guts.c:150 loongson2_guts_probe()
> warn: 'guts->regs' from ioremap() not released on lines: 131,135,139,143.
> 
> Fix this by invoking iounmap() in the error handling code and the remove
> function.
> 
> Note that, this patch is not tested due to the loongson architecture.

I can't test either, AFAIK no one outside of Loongson have working 
LoongArch Loongson-2 hardware running new world system. Yinbo will have 
to take care of this.

> 
> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn> > ---
>   drivers/soc/loongson/loongson2_guts.c | 18 +++++++++++++-----
>   1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/soc/loongson/loongson2_guts.c b/drivers/soc/loongson/loongson2_guts.c
> index bace4bc8e03b..ba330adb555c 100644
> --- a/drivers/soc/loongson/loongson2_guts.c
> +++ b/drivers/soc/loongson/loongson2_guts.c
> @@ -98,6 +98,7 @@ static int loongson2_guts_probe(struct platform_device *pdev)
>   	const struct loongson2_soc_die_attr *soc_die;
>   	const char *machine;
>   	u32 svr;
> +	int rc = -ENOMEM;
>   
>   	/* Initialize guts */
>   	guts = devm_kzalloc(dev, sizeof(*guts), GFP_KERNEL);
> @@ -128,19 +129,21 @@ static int loongson2_guts_probe(struct platform_device *pdev)
>   		soc_dev_attr.family = devm_kasprintf(dev, GFP_KERNEL, "Loongson");
>   	}
>   	if (!soc_dev_attr.family)
> -		return -ENOMEM;
> +		goto iounmap;
>   	soc_dev_attr.soc_id = devm_kasprintf(dev, GFP_KERNEL,
>   					     "svr:0x%08x", svr);
>   	if (!soc_dev_attr.soc_id)
> -		return -ENOMEM;
> +		goto iounmap;
>   	soc_dev_attr.revision = devm_kasprintf(dev, GFP_KERNEL, "%d.%d",
>   					       (svr >>  4) & 0xf, svr & 0xf);
>   	if (!soc_dev_attr.revision)
> -		return -ENOMEM;
> +		goto iounmap;

Instead of so many goto's, it's probably better to just change the 
ioremap to devm_ioremap and let the driver core take care of the rest. 
Much more maintainable this way IMO.

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

