Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2851E511
	for <loongarch@lists.linux.dev>; Sat,  7 Oct 2023 16:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="tjDTEUPw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=e6r4ZECyO9EqgE0zmF10A/TBUvrf32/knhNgMfcTMpc=; b=tjDTEUPwILW4Bcxjb8LgjBeOcw
	lqC/TEiUs36rn/1SswqXLPigaxpC/u813h4qlKONpc7jdvwfKh6SycnqIFfFGIO+fj6LrmmXhxQI8
	PI7ogAxinHUjDWsXFXLwDB0/XYNWTKC5obe16CQE9P1SYtGpVYzg00r3Hr8oEcR6SZBXPtvfczBOg
	fOlhTu9YpPwGkn1hNMRJlkNFh9ghKubr9EoO1ot8M+QMsK6prcCevqPNmlQf+ukokrFMo/vPcIzke
	t98teuyDXl2Rhm7Tn6q68OAxB/uLuQVPkLVpwqe7pjxvKev/YhO//vpl/Lnq/pv7uU6M9H6odijv5
	07KQyfIQ==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qp9wq-007imV-2l;
	Sat, 07 Oct 2023 16:14:36 +0000
Message-ID: <9f7931dd-3c0e-4bc2-988e-1fb3549e440e@infradead.org>
Date: Sat, 7 Oct 2023 09:14:36 -0700
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH linux-next] LoongArch: mm: Export symbol for
 invalid_pud_table.
Content-Language: en-US
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list : LOONGARCH" <loongarch@lists.linux.dev>,
 KVM list <kvm@vger.kernel.org>, maobibo@loongson.cn,
 Huacai Chen <chenhuacai@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>
References: <20231007075303.263407-1-zhaotianrui@loongson.cn>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20231007075303.263407-1-zhaotianrui@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/7/23 00:53, Tianrui Zhao wrote:
> Export symbol for invalid_pud_table, so it can be used
> by the files in other directories.
> 
> And this can resolve the problem caused in:
> https://lore.kernel.org/lkml/20230927030959.3629941-5-zhaotianrui@loongson.cn/
> ERROR: modpost: "invalid_pud_table" [arch/loongarch/kvm/kvm.ko] undefined!
> 
> Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  arch/loongarch/mm/init.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/loongarch/mm/init.c b/arch/loongarch/mm/init.c
> index f3fe8c06ba4d..ddf1330c924c 100644
> --- a/arch/loongarch/mm/init.c
> +++ b/arch/loongarch/mm/init.c
> @@ -240,6 +240,7 @@ pgd_t swapper_pg_dir[_PTRS_PER_PGD] __section(".bss..swapper_pg_dir");
>  pgd_t invalid_pg_dir[_PTRS_PER_PGD] __page_aligned_bss;
>  #ifndef __PAGETABLE_PUD_FOLDED
>  pud_t invalid_pud_table[PTRS_PER_PUD] __page_aligned_bss;
> +EXPORT_SYMBOL(invalid_pud_table);
>  #endif
>  #ifndef __PAGETABLE_PMD_FOLDED
>  pmd_t invalid_pmd_table[PTRS_PER_PMD] __page_aligned_bss;

-- 
~Randy
