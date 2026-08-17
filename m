Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2E83DA5C5
	for <loongarch@lists.linux.dev>; Mon, 17 Aug 2026 17:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786987883; cv=none; b=mQOuWdi78tH1w9S0at/5d2WKgRw/WR7nsJfSkWHbqh3EyIaZWcmxeIG4AiYE6rrZ5Na2SRcBiG0Xik7PYNMqdW0Hbw25cTB4A1SEKShcKsYFdcoB4gI7wEr0vgJcC1F+e44RDUWpXSEsHb9iRo8nywLnfOMIq7otQ99WbU4qSoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786987883; c=relaxed/simple;
	bh=XuQIGnNEgl05hW1Pt/SRDZrKnxVKWtgOYyJNVYljJJk=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HbSeIU/bGipqZ83HoqVkInLo1P8XyUb17D62T0dSjLwUZMqVEcvKXTGgmt5fdKMQh8zgIX3/VsRicdaKbgHH/G97ucWksFScJEeI37/MRX4G1NtYIv5XNcMSjjrwcmsk0VIK3ARa0Uy1YBjIXBUpYGMIxL8k2q5Bc7spSDRZghE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=czYM/o43; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="czYM/o43"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b0148201fbso3534364e87.3
        for <loongarch@lists.linux.dev>; Mon, 17 Aug 2026 10:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786987880; x=1787592680; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gdAST+PW7bd2DD1v0YjadB8+zi0iamo4AznH2c9tOUI=;
        b=czYM/o43My4cVj/7aTbFDiRroWGMGOJRxx6RPMSjZ9YXTc4IsI0gJE3nVFwKghhZAb
         5sHTFPhkGBPmKqh2ienXp1ZdjyoQ7+kcc5ORRuhjfWn7No8t0zu4K93SIDMlMCVEXBFV
         7+riLpaKyZMCzMIAo3AVL4O2I/daLpMdbXl98e2tQJjlGiWm+gIecSfQXMu/enMouxzo
         nYyn4cOBbetAavaYngYI9WhOrXwOBlHA7FERZBcZj8NqupD+zEp4AFXwATo5ziScvdbc
         PzTeuzDZxTuQXJ9QHUHCRojchDe/DfHEpsgeefL7LRPz6NtF4NUrk9J0JkR1/ZmmL5Mn
         5vTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786987880; x=1787592680;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gdAST+PW7bd2DD1v0YjadB8+zi0iamo4AznH2c9tOUI=;
        b=bRVcmCOwih8EFq2uAniy/sZnf/E6vMGyRjwU8XaPOT7b5qZ1HphAyVp3DmF+RhlfCe
         WGIZpog3NkNFRztT9DKMTwBQd/xyN6lvUqiLs5nTbGG/8CDrQ0o3F0ukDk605IGJxhfL
         bvE15xHKYzbUh46v6adSuk26ft2w1hMATXoYxzrO+EDiihKJXb70K+T3quibwFPADSah
         neUiIRgdhEFxPmGRRZQ8fsd7LheGgATaj5ay48i8qn/lEnMk5zTsfOyEg/M/Dn1rP+I0
         eR0fCA4iXwi6FnNADmXJh54+WyHFIcKLL/Thle6kQe/VypfVs4kmwURZgV7SuzT1QiWp
         w/2w==
X-Forwarded-Encrypted: i=1; AHgh+Rqu2Fydw2V+U4Q79jY/1+b7IzOulOKTXJhxs1sOY7BsaOy9JJ/FEme68peLT3IgVnfDJ1YKDhpqEh8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyUz5XK5/piVm6KeOAphRf0cGPfyyW2T0GE6ORjTiihM9a/GAGb
	FHleYTOwX3YJZyUkE8LlFEKQGBvMyI1BPC2n3jOoBDNjcCx9czUIwv4K
X-Gm-Gg: AR+sD10iKvsPeLB+of3QmiEvntsQKwB+2lF1C2jXyhrQTbbntXG+sLi1Ux6q+ZTjJlD
	WNBjx6czMrraH7jB1B2z4D2YnqT2P3Navr3c18B0SQToDoeyUsvyGKBkQ/dN36+4h9Wns2fHKNz
	H2OAvF4v1zD1bIiIBzhGb85MkcHRpz88ufFb4EvF8IV3hnt+7b/ZNx5wEQNhAnTssNPiRWoPFoK
	GO+LiNSi+5Q0BVlga2mx1ei3jkWUBJWp6YXggwWX7xAbWPARTrYQRXP/jDmLe+3LGKBJhux16Q3
	GTlx6h3uEO1z2JYdROzCc7onhmu3Pk2fBjA0s/I4S1wg1TR3kJfJ9UxVo0TUAN5d/XAtwR3s82E
	ywicL/d915ckh84tx2RmVZPLM1vJD9TVbEqFViyqzoZsPrLUXJQ3l/1WOeRFScE+M+JCoPyTpt9
	io8PVtcml/jWsrjC65KhMlQnokQg==
X-Received: by 2002:a05:6512:1284:b0:5b2:9358:b854 with SMTP id 2adb3069b0e04-5b459142afbmr3869031e87.42.1786987880080;
        Mon, 17 Aug 2026 10:31:20 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a16b1f1852sm5885691fa.38.2026.08.17.10.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 10:31:19 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Mon, 17 Aug 2026 19:31:17 +0200
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Andy Lutomirski <luto@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Len Brown <lenb@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Vasily Gorbik <gor@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>,
	Will Deacon <will@kernel.org>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: Re: [PATCH 2/6] mm/vmalloc: set area's page_order after allocation
 succeeds
Message-ID: <aoNFZU_QzghDBgbZ@milan>
References: <20260816-execmem-set-vm-perms-v0-2-v1-0-90944a3ad43f@kernel.org>
 <20260816-execmem-set-vm-perms-v0-2-v1-2-90944a3ad43f@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260816-execmem-set-vm-perms-v0-2-v1-2-90944a3ad43f@kernel.org>

On Sun, Aug 16, 2026 at 01:59:25PM +0300, Mike Rapoport (Microsoft) wrote:
> __vmalloc_area_node() calls set_vm_area_page_order() to set area's
> page_order before actually allocating pages to populate the area.
> 
> If allocation of large pages in HUGE_VMAP case fails midway, this leaves
> the area with elevated page_order throughout the cleanup path.
> 
> There is no actual issue with this because the only place that currently
> relies on area->page_order on the cleanup path is the loop calculating
> the direct map alias range in vm_reset_perms() and it anyway skips
> unpopulated pages.
> 
> But having set_vm_area_page_order() in the middle of __vmalloc_area_node()
> makes things very obscure, hard to reason about and error prone against
> future changes of the cleanup path.
> 
> Move the call to set_vm_area_page_order() after __vmalloc_area_node()
> succeeded where page order is guaranteed.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  mm/vmalloc.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 22566e0b6e38..6822f0fe9583 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -3901,8 +3901,7 @@ static void *__vmalloc_area_node(struct vm_struct *area, gfp_t gfp_mask,
>  		goto fail;
>  	}
>  
> -	set_vm_area_page_order(area, page_shift - PAGE_SHIFT);
> -	page_order = vm_area_page_order(area);
> +	page_order = page_shift - PAGE_SHIFT;
>  
>  	/*
>  	 * High-order nofail allocations are really expensive and
> @@ -4106,6 +4105,14 @@ void *__vmalloc_node_range_noprof(unsigned long size, unsigned long align,
>  	if (!ret)
>  		goto fail;
>  
> +	/*
> +	 * Set area->page_order once it's known exactly that the order of the
> +	 * pages the area contains.
> +	 * Even if we succeeded to partially populate the area with large pages,
> +	 * still treat the area as populated with order-0 pages.
> +	 */
> +	set_vm_area_page_order(area, shift - PAGE_SHIFT);
> +
>  	/*
>  	 * Mark the pages as accessible, now that they are mapped.
>  	 * The condition for setting KASAN_VMALLOC_INIT should complement the
> 
> -- 
> 2.53.0
> 
OK, can we just set it right after the:

	area->nr_pages = vm_area_alloc_pages(
			vmalloc_gfp_adjust(gfp_mask, page_order), node,
			page_order, nr_small_pages, area->pages);


succeeds?

I am not sure there is a good reason to move it out of the
__vmalloc_area_node().

--
Uladzislau Rezki
