Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527F42568
	for <loongarch@lists.linux.dev>; Tue, 26 Jul 2022 13:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1658841163; bh=okIEio93R/fK1/Y3ODfVuGyFbUOuRUZCwDK8aEIyw8A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XYr7mItf8ejuLE3Sqvhym3mHHRQ8g2eJindjziek6fW/gXIGDHR7GFDbVLAfipCSL
	 zDqPfCCxExQtBHzTG6Hxy4nywmIs1Ti+1aiaEyaTl5avloR+RqqXYIVy/10ZIRvxNS
	 sS9Cg54g8O2inAZOg0aabazFLH7CC81X8hbffZEE=
Received: from [100.100.35.250] (unknown [58.34.185.106])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 8A98260104;
	Tue, 26 Jul 2022 21:12:43 +0800 (CST)
Message-ID: <7222c4df-a21d-8149-4618-c1961959244a@xen0n.name>
Date: Tue, 26 Jul 2022 21:12:43 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:104.0)
 Gecko/20100101 Thunderbird/104.0a1
Subject: Re: [PATCH v2 5/6] LoongArch: Simplify "BLT foo, zero" with BLTZ
Content-Language: en-US
To: Jinyang He <hejinyang@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, WANG Xuerui <git@xen0n.name>
References: <20220726122920.2291947-1-kernel@xen0n.name>
 <20220726122920.2291947-6-kernel@xen0n.name>
 <8a2ea087-ac01-e644-3460-0ceb8685e792@loongson.cn>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <8a2ea087-ac01-e644-3460-0ceb8685e792@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2022/7/26 21:02, Jinyang He wrote:
> Is there anything left?
> 
> 
> diff --git a/arch/loongarch/mm/tlbex.S b/arch/loongarch/mm/tlbex.S
> index 7eee40271577..4c7ba5cb4574 100644
> --- a/arch/loongarch/mm/tlbex.S
> +++ b/arch/loongarch/mm/tlbex.S
> @@ -47,7 +47,7 @@ SYM_FUNC_START(handle_tlb_load)
>           * The vmalloc handling is not in the hotpath.
>           */
>          csrrd   t0, LOONGARCH_CSR_BADV
> -       blt     t0, $r0, vmalloc_load
> +       bltz    t0, vmalloc_load
>          csrrd   t1, LOONGARCH_CSR_PGDL
> 
>   vmalloc_done_load:
> @@ -210,7 +210,7 @@ SYM_FUNC_START(handle_tlb_store)
>           * The vmalloc handling is not in the hotpath.
>           */
>          csrrd   t0, LOONGARCH_CSR_BADV
> -       blt     t0, $r0, vmalloc_store
> +       bltz    t0, vmalloc_store
>          csrrd   t1, LOONGARCH_CSR_PGDL
> 
>   vmalloc_done_store:
> @@ -378,7 +378,7 @@ SYM_FUNC_START(handle_tlb_modify)
>           * The vmalloc handling is not in the hotpath.
>           */
>          csrrd   t0, LOONGARCH_CSR_BADV
> -       blt     t0, $r0, vmalloc_modify
> +       bltz    t0, vmalloc_modify
>          csrrd   t1, LOONGARCH_CSR_PGDL
> 
>   vmalloc_done_modify:
> 
> 

Heck. Not even the usage of register ABI names is consistent, maybe I 
over-estimated the code quality in general...

Do you think it'll be better to fix these cases in another series, or 
amend the current series and send v3?

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

