Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793783704;
	b=HaX8GYHJa2ZPn9xZaaVQVzBYeEPOop5G4pIGmnxGdzvzPWHMscSwaUuM0X+F4qvih9y5
	 JUvBv3qOsR+mYoqqKCr9Q+e3kVMV4qB9Fxx3Xg/QeEa9acQiajQLVDELZs2HrwkWDEUGc
	 3WrFdksSsqkET5/RKdpDRMIe6ZR6MkxeyaGK9oACS5qOAYH3MnVtIkk59e0ueAIoNAOg0
	 4WH1FWGgwwUdgsL4g40IoKi9rTrbU7mGiYUYAEG17FN9YKUm6M51Xlyx5nam0ZAI+UV/j
	 RkrNntq0f4mxUG4ZFnJxZZNgusRyszELxInOgbGEOSBw14r0jLvS6chfiMNZumfAdxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783704;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=zCFfm843u8/elBaIEdb8AzgdS0+hlymbLUHyiHn895g=;
	b=a4wiJduvCRF4k5DcvsPPEmY1MAbCTOtr2Ug3FsfmptU08gzeyLuq4R2ERNW8JNopjWn+
	 Y89vclGIRtB9gmaOAkSoFSpFhieonfY2aNJpupTtqe3fAuczvTqCoWMbGuocc5neus43R
	 iIysQcdgKyDTGUNflenQIPB6t465wpOIWTV7pBu8hicuEDlFnTvOuFfP7kgs5oX1ZlumN
	 NnYH9vP6sjnFxAKsG4PVaJIamTs89qjdcb3anpBgeuoXLXGgv8+IaFre9I7hb/7LBQUxa
	 V+J6nazggm1Dtj1qjO34KJRRlXKn8R0Gr/TVuD79Xe04CfsFj3lOj0S5cGdN5T5nL8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P2VyHUmX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B4F606A32C;
	Wed,  4 Nov 2026 09:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P2VyHUmX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 072401F0093A;
	Wed,  4 Nov 2026 09:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793783704;
	bh=zCFfm843u8/elBaIEdb8AzgdS0+hlymbLUHyiHn895g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P2VyHUmXOTKNccAWnsWQzGG4kjE2tHG11Fb3k5VTve3RIeyUyrwUL6y/DUqe2KhQ/
	 qrdaEjdMIbUev3XrFs+Ls+dcv7bDqqET0CWUGdq/PmXijGJQq5eGEBsqUFp7f4O3FF
	 zkyaL6jGtaLRL1x1xmXnnAxmpV30wJdXL4j2Wf6q6nw3Y6o5RWboW6zeaQVeNsJpnE
	 Au61t1i1IcpHhkQnpCSZ7l++U97L6h/DZiEvqExZdwhTGZk5z6xJoYaMNmSXL0FeUK
	 QxXsgpg9iBETtbilcbZd5els7i48g2auyc00OUb6m5WFc0k0/IJbg2ClCjAlasEjB+
	 jMKZz7T9gjomA==
Date: Wed, 4 Nov 2026 10:14:57 +0100
From: "Oscar Salvador (SUSE)" <osalvador@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	Kiryl Shutsemau <kas@kernel.org>, Mike Rapoport <rppt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Sashiko <sashiko-bot@kernel.org>,
	linux-mm@kvack.org, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm/hugetlb: fix validation of unsupported HugeTLB
 orders
Message-ID: <aur3kWpnFAOaX8nE@localhost.localdomain>
References: <20261104071858.757793-1-songmuchun@bytedance.com>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104071858.757793-1-songmuchun@bytedance.com>

On Wed, Nov 04, 2026 at 03:18:57PM +0800, Muchun Song wrote:
> Commit 7ce6048d3a7d ("loongarch: drop ranges for definition of
> ARCH_FORCE_MAX_ORDER") removed the ARCH_FORCE_MAX_ORDER ranges for
> LoongArch. Besides dropping unreasonable upper limits, this allowed
> values below the architecture defaults.
> 
> With 16KB pages, LoongArch defaults ARCH_FORCE_MAX_ORDER to 11,
> matching HUGETLB_PAGE_ORDER. Forcing it to 10 while enabling HugeTLB
> permits order-11 HugeTLB folios even though MAX_FOLIO_ORDER is 10.
> LoongArch does not select ARCH_HAS_GIGANTIC_PAGE, so this violates the
> generic MM assumption that folios cannot exceed MAX_PAGE_ORDER.
> 
> This invalid configuration is accepted by Kconfig.
> BUILD_BUG_ON_INVALID() does not reject it either because it only checks
> whether the expression is valid and never evaluates the comparison.
> Detection is left to the runtime warning in hugetlb_add_hstate(), after
> earlier boot paths may already have used the invalid configuration.
> 
> When an invalid HugeTLB order can be identified at build time, reject it
> there. Otherwise, reject it at runtime before the mismatch propagates
> further. Use MAYBE_BUILD_BUG_ON() so constant violations fail the build
> while dynamically determined orders are checked at runtime.
> 
> Fixes: 7ce6048d3a7d ("loongarch: drop ranges for definition of ARCH_FORCE_MAX_ORDER")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/sashiko-outbox-192874@kernel.org/
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> Suggested-by: Huacai Chen <chenhuacai@kernel.org>

Acked-by: Oscar Salvador <osalvador@suse.de>

> ---
> v2:
> - Move the order check after hugepages_supported() to avoid a false
>   PowerPC BUG_ON() (suggested by Sashiko)
> ---
>  mm/hugetlb.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 779b1de33c78..b49130eb7ad8 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -4197,7 +4197,6 @@ static int __init hugetlb_init(void)
>  
>  	BUILD_BUG_ON(sizeof_field(struct page, private) * BITS_PER_BYTE <
>  			__NR_HPAGEFLAGS);
> -	BUILD_BUG_ON_INVALID(HUGETLB_PAGE_ORDER > MAX_FOLIO_ORDER);
>  
>  	if (!hugepages_supported()) {
>  		if (hugetlb_max_hstate || default_hstate_max_huge_pages)
> @@ -4205,6 +4204,8 @@ static int __init hugetlb_init(void)
>  		return 0;
>  	}
>  
> +	MAYBE_BUILD_BUG_ON(HUGETLB_PAGE_ORDER > MAX_FOLIO_ORDER);
> +
>  	/*
>  	 * Make sure HPAGE_SIZE (HUGETLB_PAGE_ORDER) hstate exists.  Some
>  	 * architectures depend on setup being done here.
> 
> base-commit: 74d73ffcffe03804f97e9fb82301dadf75671282
> -- 
> 2.54.0
> 

-- 
Oscar Salvador
SUSE Labs
