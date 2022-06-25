Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B541617C8
	for <loongarch@lists.linux.dev>; Sat, 25 Jun 2022 09:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1656149608; bh=MqOf1y2AncNqP1So9tmRsvBiLoAtHgVGmgQedh4Hyew=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OL4dcYM9Z2RPa87feOAQEfHNJpCkkfjiPHb5X9G3NhseL+iPpAay5ettPln0nOGnr
	 Eo8WAkDhZtd5qTa9LgDEXCyy/6XwIg1LKiF53490hxl5QgMUPf2125ILgDXa7V1kVF
	 TOmOJdJMI2sKY5KSVsz2iA/x/zzmIs0BDIgD94b8=
Received: from [192.168.9.172] (unknown [101.228.137.40])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 7F3E660723;
	Sat, 25 Jun 2022 17:33:28 +0800 (CST)
Message-ID: <c737a16e-81ee-de53-bf2c-352592a06821@xen0n.name>
Date: Sat, 25 Jun 2022 17:33:28 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:103.0) Gecko/20100101
 Thunderbird/103.0a1
Subject: Re: [PATCH] LoongArch: Fix EENTRY/MERRENTRY setting in
 setup_tlb_handler()
Content-Language: en-US
To: Huacai Chen <chenhuacai@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, Xuefeng Li <lixuefeng@loongson.cn>,
 Guo Ren <guoren@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20220623091412.2479084-1-chenhuacai@loongson.cn>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <20220623091412.2479084-1-chenhuacai@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/23/22 17:14, Huacai Chen wrote:
> setup_tlb_handler() is expected to set per-cpu exception handlers, but
> it only set the TLBRENTRY successfully because of copy & paste errors,
> so fix it.
>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>   arch/loongarch/mm/tlb.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/mm/tlb.c b/arch/loongarch/mm/tlb.c
> index 6d050973241c..0cb2f2aa88aa 100644
> --- a/arch/loongarch/mm/tlb.c
> +++ b/arch/loongarch/mm/tlb.c
> @@ -289,7 +289,8 @@ void setup_tlb_handler(int cpu)
>   		pcpu_handlers[cpu] = virt_to_phys(addr);
>   		memcpy((void *)addr, (void *)eentry, vec_sz);
>   		local_flush_icache_range((unsigned long)addr, (unsigned long)addr + vec_sz);
> -		csr_write64(pcpu_handlers[cpu], LOONGARCH_CSR_TLBRENTRY);
> +		csr_write64(pcpu_handlers[cpu], LOONGARCH_CSR_EENTRY);
> +		csr_write64(pcpu_handlers[cpu], LOONGARCH_CSR_MERRENTRY);
>   		csr_write64(pcpu_handlers[cpu] + 80*VECSIZE, LOONGARCH_CSR_TLBRENTRY);
>   	}
>   #endif

Kinda interesting no problem showed up on my devbox so far...

Reviewed-by: WANG Xuerui <git@xen0n.name>

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

