Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA97933CEA1
	for <loongarch@lists.linux.dev>; Sat,  7 Feb 2026 20:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770495578; cv=none; b=tk1+/39ZgdAh98WJSWYM5dv6TDPYWchwO4mWUgRsgOKZhE7Y61KUDACakw1slddrpcHRfZzjVVOrf6igmIEqbxMFjaJiN4V/9s9DBE3TAJagoo0ilkKSOhvXMenimHERtT4Dlvdfe4VjbduYm33JD3t7UK7B2qTTa2vJJnmCer4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770495578; c=relaxed/simple;
	bh=YOvcABvi86FBPIGHFRbcrhtefQ+sifLNtLVYHDYqhb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hqp3QoqHqPUt8VQyrMmqiPpkgzZzncN8OBr1B71BwWnkK0i4+TKL+ULFrjjsxheJx5DaHGmOIHDLxyhFCrNIlRieABJIetbl/yHqXblBIgzVXiT8xHBQ8pC1yenKQjnCrs22UXAT+JLmgpNFgTMyXjNZwQKqLnR1M/vgc2FA4Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IhWROiwl; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IhWROiwl"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-482f2599980so38495685e9.0
        for <loongarch@lists.linux.dev>; Sat, 07 Feb 2026 12:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770495576; x=1771100376; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LmE23qjtgb2EulsiY+c7A9BQzukrzPbX/0RgHfT6JCg=;
        b=IhWROiwlyHRJWQkafqQW3rW9Yjb6b9qHs4gT827bgJgCjGCXZd1qio5MRpxMs8Ptf6
         /dj9CxZjw5GKB8qt/yIHBri3xUllwKroGQM92MYFBb5iy8g7Wti8GPQDRNYJfSDpswaL
         KcyzzV+mAs0b2x1ynLaRh0NCXWaLgu4znpzhrV5Vh9CAQrjiHNPhVWU4IoeqIwpX0gie
         e+aXHZF9Bppc+XTUAwbD6fVzRf3F8wY6y08MS0jl6Va5RZG3aYE2adn6vGLOKp3bN+bV
         2Oe29rDRI7YFssdz2TDYiYBNiVdMCMHZNbsV1FZuvhu7Yz1ICwWwgb9M2LUK9OcRrgmL
         9t4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770495576; x=1771100376;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LmE23qjtgb2EulsiY+c7A9BQzukrzPbX/0RgHfT6JCg=;
        b=M6XCS2rgAOJF7As0U8DIBftfV5b6giJXhTHLJ4FCAUuour1fXLT+oncdL1pUYlkcpM
         FByCP+vXqT0SdPto4ratMvkXaOddPIuxcfFVk4bp9ogCZdiMipr6FVTnzqYNZ5WDIj6j
         NXAGHg0F6Yz/DQwA3hds6747ZCUBs8Ch/locAJsKHG7Y91dnQ2rOtpeUfXXUmcK31qKo
         X8KMFRwfLmgKdIMN8wF3qIrU2cAjqvcuDNgoo4xZdVmcEAyDAjYYyc/8K5+4Ss15GZ84
         daRFQVr1ScPDBYHDsH2mbRJAiPKzE1b788LBK2sz028Yqag9+tVark938GrldPx2+bIz
         w4Ig==
X-Forwarded-Encrypted: i=1; AJvYcCXp+cZ1mgx6mLIZ6Hh3UipGNzRVM/M8Euo+OmvfaeuOPfn8F/sx7F1BR9gw3nBVGPuqqfhe//vu1gM=@lists.linux.dev
X-Gm-Message-State: AOJu0YygA7DMCCK5HhYipEWnZijPTQxq4L+IbH0lHN6SMTysagoDOpQr
	JeVER80ngF5qjfZ7m7h+MDM6bChAu5SA8DIruG05i/hlwcfO7Q3H3d6B
X-Gm-Gg: AZuq6aLq4ckaZAudRIEnOZeVAUW5auNh+v33QAVdNDg/AeWuBW9ChtMHYne3INjsTow
	MAhLMxZgfQ4GEcUHRlFdHM+32NJWWS/PvwbOP1gFG/bUCkIUEhOQs8JM/2Pub4Hucm/ivpOolOF
	0UgFxinjI8z132cl1AiGj9VU3NN6SpZnh2KGEIYCOcNmyUZ+YEUt3oJcVycN98B6qomtLZZcTZa
	FvbvZ56JYxM5JXwBZZjID/jj3hx4KaYOPxkVbhxL9uGKSsp1g+1APhU9MrlA1gd6L/UUjIfE7/O
	TgcVTydtMgM+0jMY5NvZs5vvRiSbUR2jX3k8TaA+XbyGlfte5vDE3knHc+2p8X36syyw5IdnalN
	ECw+oypP760/rs3WVPQppiZ8aCYiiMzsBs2g4d6JVeliOqfZ08RLYtjwLFHgcUByGEPNoUL+og/
	rDrjDfJcuW3Sp1x17+by0Sbj8F9t3nTf97eePsykT45DZmA9Sd/z+EB5jQ5mPSWYgKcyd24qseK
	gm+dbv1h+FR5eo=
X-Received: by 2002:a05:600c:4f8a:b0:480:3230:6c9b with SMTP id 5b1f17b1804b1-483201dd004mr94651865e9.7.1770495575929;
        Sat, 07 Feb 2026 12:19:35 -0800 (PST)
Received: from ?IPV6:2a02:6b6f:e752:9400:18cf:c773:ee86:c436? ([2a02:6b6f:e752:9400:18cf:c773:ee86:c436])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483206cc7d3sm131304355e9.5.2026.02.07.12.19.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Feb 2026 12:19:34 -0800 (PST)
Message-ID: <fd80736b-7b2a-4675-82a7-1902705c6361@gmail.com>
Date: Sat, 7 Feb 2026 20:19:34 +0000
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv6 07/17] mm: Rework compound_head() for power-of-2
 sizeof(struct page)
Content-Language: en-GB
To: Kiryl Shutsemau <kas@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <muchun.song@linux.dev>, David Hildenbrand <david@redhat.com>,
 Matthew Wilcox <willy@infradead.org>, Frank van der Linden <fvdl@google.com>
Cc: Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi Yan <ziy@nvidia.com>,
 Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, kernel-team@meta.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
References: <20260202155634.650837-1-kas@kernel.org>
 <20260202155634.650837-8-kas@kernel.org>
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <20260202155634.650837-8-kas@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 02/02/2026 15:56, Kiryl Shutsemau wrote:
> For tail pages, the kernel uses the 'compound_info' field to get to the
> head page. The bit 0 of the field indicates whether the page is a
> tail page, and if set, the remaining bits represent a pointer to the
> head page.
> 
> For cases when size of struct page is power-of-2, change the encoding of
> compound_info to store a mask that can be applied to the virtual address
> of the tail page in order to access the head page. It is possible
> because struct page of the head page is naturally aligned with regards
> to order of the page.
> 
> The significant impact of this modification is that all tail pages of
> the same order will now have identical 'compound_info', regardless of
> the compound page they are associated with. This paves the way for
> eliminating fake heads.
> 
> The HugeTLB Vmemmap Optimization (HVO) creates fake heads and it is only
> applied when the sizeof(struct page) is power-of-2. Having identical
> tail pages allows the same page to be mapped into the vmemmap of all
> pages, maintaining memory savings without fake heads.
> 
> If sizeof(struct page) is not power-of-2, there is no functional
> changes.
> 
> Limit mask usage to HugeTLB vmemmap optimization (HVO) where it makes
> a difference. The approach with mask would work in the wider set of
> conditions, but it requires validating that struct pages are naturally
> aligned for all orders up to the MAX_FOLIO_ORDER, which can be tricky.
> 
> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
> Reviewed-by: Muchun Song <muchun.song@linux.dev>
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> ---

Acked-by: Usama Arif <usamaarif642@gmail.com>

Small nit below:

>  include/linux/page-flags.h | 81 ++++++++++++++++++++++++++++++++++----
>  mm/slab.h                  | 16 ++++++--
>  mm/util.c                  | 16 ++++++--
>  3 files changed, 97 insertions(+), 16 deletions(-)
> 
> diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> index d14a17ffb55b..8f2c7fbc739b 100644
> --- a/include/linux/page-flags.h
> +++ b/include/linux/page-flags.h
> @@ -198,6 +198,29 @@ enum pageflags {
>  
>  #ifndef __GENERATING_BOUNDS_H
>  
> +/*
> + * For tail pages, if the size of struct page is power-of-2 ->compound_info
> + * encodes the mask that converts the address of the tail page address to
> + * the head page address.
> + *
> + * Otherwise, ->compound_info has direct pointer to head pages.
> + */
> +static __always_inline bool compound_info_has_mask(void)
> +{
> +	/*
> +	 * Limit mask usage to HugeTLB vmemmap optimization (HVO) where it
> +	 * makes a difference.
> +	 *
> +	 * The approach with mask would work in the wider set of conditions,
> +	 * but it requires validating that struct pages are naturally aligned
> +	 * for all orders up to the MAX_FOLIO_ORDER, which can be tricky.
> +	 */
> +	if (!IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP))
> +		return false;
> +
> +	return is_power_of_2(sizeof(struct page));
> +}
> +
>  #ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
>  DECLARE_STATIC_KEY_FALSE(hugetlb_optimize_vmemmap_key);
>  
> @@ -210,6 +233,10 @@ static __always_inline const struct page *page_fixed_fake_head(const struct page
>  	if (!static_branch_unlikely(&hugetlb_optimize_vmemmap_key))
>  		return page;
>  
> +	/* Fake heads only exists if compound_info_has_mask() is true */
> +	if (!compound_info_has_mask())
> +		return page;
> +
>  	/*
>  	 * Only addresses aligned with PAGE_SIZE of struct page may be fake head
>  	 * struct page. The alignment check aims to avoid access the fields (
> @@ -223,10 +250,14 @@ static __always_inline const struct page *page_fixed_fake_head(const struct page
>  		 * because the @page is a compound page composed with at least
>  		 * two contiguous pages.
>  		 */
> -		unsigned long head = READ_ONCE(page[1].compound_info);
> +		unsigned long info = READ_ONCE(page[1].compound_info);
>  
> -		if (likely(head & 1))
> -			return (const struct page *)(head - 1);
> +		/* See set_compound_head() */
> +		if (likely(info & 1)) {
> +			unsigned long p = (unsigned long)page;
> +
> +			return (const struct page *)(p & info);
> +		}
>  	}
>  	return page;
>  }
> @@ -281,11 +312,26 @@ static __always_inline int page_is_fake_head(const struct page *page)
>  
>  static __always_inline unsigned long _compound_head(const struct page *page)
>  {
> -	unsigned long head = READ_ONCE(page->compound_info);
> +	unsigned long info = READ_ONCE(page->compound_info);
>  
> -	if (unlikely(head & 1))
> -		return head - 1;
> -	return (unsigned long)page_fixed_fake_head(page);
> +	/* Bit 0 encodes PageTail() */
> +	if (!(info & 1))
> +		return (unsigned long)page_fixed_fake_head(page);
> +
> +	/*
> +	 * If compound_info_has_mask() is false, the rest of compound_info is
> +	 * the pointer to the head page.
> +	 */
> +	if (!compound_info_has_mask())
> +		return info - 1;
> +
> +	/*
> +	 * If compoun_info_has_mask() is true the rest of the info encodes

s/compoun_info_has_mask/compound_info_has_mask/
