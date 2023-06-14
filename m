Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5396E7FC
	for <loongarch@lists.linux.dev>; Wed, 14 Jun 2023 13:52:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57C7AC433CB;
	Wed, 14 Jun 2023 13:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686750736;
	bh=VwaE4ixu2oYgT8bWCqZd/sCxt5Vr7LA6FKY2uA7+iKA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pvu46WaEl54YKxvYrg17S6Us5Z+6jc6ZyxloGDXNG3sVbWCAn8khJSWsZ739VwfPP
	 KwSYnW5Cb22U/hoqAU+3FM5yWaAmL/GvAe5O+LdrEw3/pZtxxI5c7cLPpLdtEqXk8T
	 Fbh9NCB++t1sBODF7SprarK+tEpzTtUTE1tfwFFFrABefWFeIYBfx1eKkeOd7kHivF
	 njsBTw00M7iYLOdiQBjB3A+VyNpSzWxaS2T8NQnbhp/VhP28ksnHBcMgphMjijMkdr
	 wBr5rhU0/C9m5DU9+5BLMiU/dcdSlTsxTG9cV+YRjI8bVXWZYj/RDtOKkEZB/GxHIp
	 Of8H4nZJFOgvQ==
Date: Wed, 14 Jun 2023 16:51:38 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
	Hugh Dickins <hughd@google.com>
Subject: Re: [PATCH v4 07/34] mm: Convert ptlock_alloc() to use ptdescs
Message-ID: <20230614135138.GF52412@kernel.org>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-8-vishal.moola@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612210423.18611-8-vishal.moola@gmail.com>

On Mon, Jun 12, 2023 at 02:03:56PM -0700, Vishal Moola (Oracle) wrote:
> This removes some direct accesses to struct page, working towards
> splitting out struct ptdesc from struct page.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  include/linux/mm.h | 6 +++---
>  mm/memory.c        | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 088b7664f897..e6f1be2a405e 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2825,7 +2825,7 @@ static inline void pagetable_clear(void *x)
>  #if USE_SPLIT_PTE_PTLOCKS
>  #if ALLOC_SPLIT_PTLOCKS
>  void __init ptlock_cache_init(void);
> -extern bool ptlock_alloc(struct page *page);
> +bool ptlock_alloc(struct ptdesc *ptdesc);
>  extern void ptlock_free(struct page *page);
>  
>  static inline spinlock_t *ptlock_ptr(struct page *page)
> @@ -2837,7 +2837,7 @@ static inline void ptlock_cache_init(void)
>  {
>  }
>  
> -static inline bool ptlock_alloc(struct page *page)
> +static inline bool ptlock_alloc(struct ptdesc *ptdesc)
>  {
>  	return true;
>  }
> @@ -2867,7 +2867,7 @@ static inline bool ptlock_init(struct page *page)
>  	 * slab code uses page->slab_cache, which share storage with page->ptl.
>  	 */
>  	VM_BUG_ON_PAGE(*(unsigned long *)&page->ptl, page);
> -	if (!ptlock_alloc(page))
> +	if (!ptlock_alloc(page_ptdesc(page)))
>  		return false;
>  	spin_lock_init(ptlock_ptr(page));
>  	return true;
> diff --git a/mm/memory.c b/mm/memory.c
> index 80ce9dda2779..ba9579117686 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -5934,14 +5934,14 @@ void __init ptlock_cache_init(void)
>  			SLAB_PANIC, NULL);
>  }
>  
> -bool ptlock_alloc(struct page *page)
> +bool ptlock_alloc(struct ptdesc *ptdesc)
>  {
>  	spinlock_t *ptl;
>  
>  	ptl = kmem_cache_alloc(page_ptl_cachep, GFP_KERNEL);
>  	if (!ptl)
>  		return false;
> -	page->ptl = ptl;
> +	ptdesc->ptl = ptl;
>  	return true;
>  }
>  
> -- 
> 2.40.1
> 
> 

-- 
Sincerely yours,
Mike.
