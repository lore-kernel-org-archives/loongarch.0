Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C23266BA
	for <loongarch@lists.linux.dev>; Tue, 26 Sep 2023 15:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1695741991; bh=QsqRgvKUnL6W0NEHrtVeuczEAWjiUjF19Ug8WTjaTXE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dkRllyLpdnpiqce7rLwaswg120DWfCzh/EDuHTOHdQSkNDgloICRzpypSge7K6Ljr
	 B7rDry8mGd/OtmEqvoCiZoUL4HjortUwuXJAqnQIF94l8jqQjqXSpN3ytFfZhojO6v
	 IWn5Nem208jOWslFl47iaXp7DvBBnc/q8VJr1YsA=
Received: from [IPV6:240e:388:8d29:7200:439e:6305:2d94:4764] (unknown [IPv6:240e:388:8d29:7200:439e:6305:2d94:4764])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 5A225600B5;
	Tue, 26 Sep 2023 23:26:31 +0800 (CST)
Message-ID: <4abf8ddb-ff93-436f-a834-39e7f4d7a503@xen0n.name>
Date: Tue, 26 Sep 2023 23:26:30 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] LoongArch: numa: Fix high_memory calculation
To: Huacai Chen <chenhuacai@loongson.cn>, Arnd Bergmann <arnd@arndb.de>,
 Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-arch@vger.kernel.org,
 Xuefeng Li <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
 loongson-kernel@lists.loongnix.cn, stable@vger.kernel.org,
 Chong Qiao <qiaochong@loongson.cn>
References: <20230926121031.1901760-1-chenhuacai@loongson.cn>
Content-Language: en-US
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <20230926121031.1901760-1-chenhuacai@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/26/23 20:10, Huacai Chen wrote:
> high_memory is the virtual address of the 'highest physical address' in
> the system. But __va(get_num_physpages() << PAGE_SHIFT) is not what we
> want because there may be holes in the physical address space. On the
> other hand, max_low_pfn is calculated from memblock_end_of_DRAM(), which
> is exactly corresponding to the highest physical address, so use it for
> high_memory calculation.
>
> Cc: <stable@vger.kernel.org>
Which commit is this patch intended to amend? A "Fixes:" tag may be 
helpful for stable backporting.
> Signed-off-by: Chong Qiao <qiaochong@loongson.cn>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>   arch/loongarch/kernel/numa.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/kernel/numa.c b/arch/loongarch/kernel/numa.c
> index c7d33c489e04..6e65ff12d5c7 100644
> --- a/arch/loongarch/kernel/numa.c
> +++ b/arch/loongarch/kernel/numa.c
> @@ -436,7 +436,7 @@ void __init paging_init(void)
>   
>   void __init mem_init(void)
>   {
> -	high_memory = (void *) __va(get_num_physpages() << PAGE_SHIFT);
> +	high_memory = (void *) __va(max_low_pfn << PAGE_SHIFT);
>   	memblock_free_all();
>   }
>   

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

