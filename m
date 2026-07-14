Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A40494A19
	for <loongarch@lists.linux.dev>; Tue, 14 Jul 2026 15:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784042184; cv=none; b=eGDU1WDWhQgGCRelXv5BL35h8n0BvWtcqCDmiPeWOGEo5D0nRN/OmQzlL7JOpzTveqgDBC8bTODyZ1xqxo7J0K/tBHHwj55G9TqDNVew+HYKfOYUqWa12Br3g7ZljEHajs5WwegUVl87WMcrdKZ1fVzxI4vXXrrPu/yQfWnFTyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784042184; c=relaxed/simple;
	bh=b+EJlyZCjRd+zn9R4Sh1X4jRP+azN9ASK6QXE0fMCOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EKCVQhWkCc962xZdAqDXWnrT9h4lVeduQAgDOH07mRlkpjE7AcwPCrAg29PPdHTeCrMRIXjAPTHgl90DUJ3LSeuOtDi5tNVXk404Jvo6Vw1AJvnpASP9D6pEUbJoUN5E30DzhtK+6lo6dcJMlYTFe8J2YCcqKfl3vKo1nuYKqyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UlI74VHR; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UlI74VHR"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-37e0a189b0bso997625a91.1
        for <loongarch@lists.linux.dev>; Tue, 14 Jul 2026 08:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784042182; x=1784646982; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fwuFYnIFntaeyFiFTCtuOmdD45sxN5bbxj7Gff2yTa4=;
        b=UlI74VHRo1IQAUwemIIaUOTnQSENZ6ca0T+qwE5945PPIBl4xm/rUh99ldoLqZcqJ6
         LxJ7SrKYwOCNygUPpH/Y/Z461tyEvQamU8bTLKEihtzkUAkrlwi1pgfimWWGGVvJ8C5s
         WS7lF7h4b7xTwt1r4zXkCWARH4uL8IVh9ZX2LrEs5ONBZ5ALZ96qaoCYzcyqKsS8x3XM
         i2xppeJVNpGU0p+uBhsIChEMiAO+H2uh5/DvfGzXVqywCjS+4x2VZDBYa/ScyJu1ylhP
         stvBC0+gXf5z6NKsBXyEWcnGGEoulNDcGBwBAsHn6Sk54ZoFIf1iJIXIOFishnR9EjMJ
         qy7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784042182; x=1784646982;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fwuFYnIFntaeyFiFTCtuOmdD45sxN5bbxj7Gff2yTa4=;
        b=JyCBAKfsLDyrgXR47cik/rqJqM4zYXVOx83nv0/7jpKzbrTdrzylhkm2e5dYvYvG93
         9/CrqOI1Em4vm/TtzQJ9vpSikkdgmB9AZUNVAF4FT3fJCpGebfFk4KKo9G1z1ygZC+q5
         yaEp8jPN03Xoi+tKd9ksyC/mSq4qskPupJatBYpFlkDIiZe7m9/zTK+sqDG3nWu4Opyz
         ahEQDOJ0Uu18bUbY4SHMnv7PhdQgJURG+WlJeOI8R7blWShbiaF4lPlh7jW8D6fkGvmK
         zNgJ6ns0vLO2c+3rO+q761b50Yw1yeTZWOSDvwrsSwfAaRYXe0gqRI7yNERD9aYlTfxq
         T6rA==
X-Forwarded-Encrypted: i=1; AHgh+Rp3bAnb/DZ/Ns+gep+B9LPl48anMS/XjAg3mHGzk856gS4L7SpwPbrkjAr+Mbi+1qwCFSY8ypj2Wk4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyefO/wGVuR93g+nRDf34dO5HFMsphw9G7tnOWGicWqU/Z7/GiA
	XaWna+rmANhQHzh0mLlLCbHUd8facEj6Btyd4qpraMrpl0p1QhM+jFZg
X-Gm-Gg: AfdE7cnPeJ677zlTCkGuODZlAYsD76xLfk/oZ7jxAgAx3kMpp7xzFJDMIZbwXFbzuZ8
	aB/b5JLUM3qXPaP3MvLh4Xajq0URpNRjE6a8b4l4kqCGAUq8VilEedU2T6WjqzgZdhAiyyxhlUf
	OBcPnohv/1fHApJKtnwO1BvYY3fti3N4WVMko7YmbsaNG42bvaIDw8c7cfkVeuVN1YWRxxct7WM
	lb3GTpFaSYmnGaZvLAjCl+pKaW1woTlehN/7+W0ztPuDGv3o8g/Hm84e6DjN/vgXI3+PzYNiyHC
	v6ixd8Z9OXRXg2VjT5Px3xyyfQVcn7AvXHBnqndGG/NFgZa345cnGF7ZhkQCbDOgm+IxM5DviS2
	AXGhspzVBDKQxC0Iff7KF02maxP2K+IagZMz0TIIdzszGRoLtSVPJVd9qpgLzKAeUXZRK8hBXcJ
	2nGOTekcnk6vtSVNKJEV0QxH9j8kqWhsQnHOUHs1M0W5Zv
X-Received: by 2002:a17:90b:2e8f:b0:380:8b14:d8e1 with SMTP id 98e67ed59e1d1-38dc7b3f8ccmr13234040a91.24.1784042181685;
        Tue, 14 Jul 2026 08:16:21 -0700 (PDT)
Received: from fedora ([2601:644:937c:6c90:6d4e:7b2d:4a39:fb0c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b4b97661sm49794403eec.7.2026.07.14.08.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 08:16:20 -0700 (PDT)
Date: Tue, 14 Jul 2026 08:16:16 -0700
From: Vishal Moola <vishal.moola@gmail.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	linux-s390@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>, sparclinux@vger.kernel.org,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-um@lists.infradead.org, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ning Sun <ning.sun@intel.com>, x86@kernel.org,
	tboot-devel@lists.sourceforge.net, Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	linux-efi@vger.kernel.org, Alistair Popple <apopple@nvidia.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH 14/22] mm: set page table page type when allocated
Message-ID: <alZSwAM4pwmMOeaD@fedora>
References: <20260714-remove_pgtable_cdtor-v1-0-44be8a7685d7@arm.com>
 <20260714-remove_pgtable_cdtor-v1-14-44be8a7685d7@arm.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714-remove_pgtable_cdtor-v1-14-44be8a7685d7@arm.com>

On Tue, Jul 14, 2026 at 03:04:03PM +0100, Kevin Brodsky wrote:
> As a step towards removing pagetable ctor/dtor calls for kernel
> mm's, move the page type updates from the ctor/dtor to
> pagetable_{alloc,free}.

Thanks for doing this patchset.

We should switch over from __folio_set_pgtable() to __SetPagePgtable()
in this patch. Ptdescs and folios should be treated as distinctly
independent of each other.

Eventually, we want to replace the memcg accounting as well, but
there's no existing API for that right now. Lets leave that as is for
now; this patchset is big enough already ;)

> __pagetable_ctor() is now empty so remove it;
> pagetable_{pud,p4d,pgd}_ctor() will be removed at a later stage.
> 
> The ctor is normally called after pagetable_alloc() (and dtor before
> pagetable_free()) so this patch should have no functional effect in
> most cases. Where calls to ctor/dtor are currently missing (e.g.
> x86's split_large_page()), this patch will ensure the page type is
> set correctly.
> 
> This patch is based on Matthew's earlier implementation linked
> below, with the difference that when freeing the page type is
> cleared in __pagetable_free(), meaning that the update is delayed
> until the pages are actually freed in the
> CONFIG_ASYNC_KERNEL_PGTABLE_FREE case. This shouldn't matter in
> practice.
> 
> Suggested-by: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> Link: https://lore.kernel.org/r/20251113140448.1814860-4-willy@infradead.org
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>  include/linux/mm.h | 17 ++---------------
>  1 file changed, 2 insertions(+), 15 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 361a0d7b74c5..94f0fb1c662a 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -3684,6 +3684,7 @@ static inline struct ptdesc *pagetable_alloc_noprof(gfp_t gfp, unsigned int orde
>  	if (!page)
>  		return NULL;
>  
> +	__folio_set_pgtable(page_folio(page));
>  	lruvec_stat_add_folio(page_folio(page), NR_PAGETABLE);
>  
>  	return page_ptdesc(page);
> @@ -3694,6 +3695,7 @@ static inline void __pagetable_free(struct ptdesc *pt)
>  {
>  	struct page *page = ptdesc_page(pt);
>  
> +	__folio_clear_pgtable(page_folio(page));
>  	lruvec_stat_sub_folio(page_folio(page), NR_PAGETABLE);
>  
>  	__free_pages(page, compound_order(page));
> @@ -3799,19 +3801,9 @@ static inline bool ptlock_init(struct ptdesc *ptdesc) { return true; }
>  static inline void ptlock_free(struct ptdesc *ptdesc) {}
>  #endif /* defined(CONFIG_SPLIT_PTE_PTLOCKS) */
>  
> -static inline void __pagetable_ctor(struct ptdesc *ptdesc)
> -{
> -	struct folio *folio = ptdesc_folio(ptdesc);
> -
> -	__folio_set_pgtable(folio);
> -}
> -
>  static inline void pagetable_dtor(struct ptdesc *ptdesc)
>  {
> -	struct folio *folio = ptdesc_folio(ptdesc);
> -
>  	ptlock_free(ptdesc);
> -	__folio_clear_pgtable(folio);
>  }
>  
>  static inline void pagetable_dtor_free(struct ptdesc *ptdesc)
> @@ -3825,7 +3817,6 @@ static inline bool pagetable_pte_ctor(struct mm_struct *mm,
>  {
>  	if (!mm_is_kernel(mm) && !ptlock_init(ptdesc))
>  		return false;
> -	__pagetable_ctor(ptdesc);
>  	return true;
>  }
>  
> @@ -3917,7 +3908,6 @@ static inline bool pagetable_pmd_ctor(struct mm_struct *mm,
>  	if (!mm_is_kernel(mm) && !pmd_ptlock_init(ptdesc))
>  		return false;
>  	ptdesc_pmd_pts_init(ptdesc);
> -	__pagetable_ctor(ptdesc);
>  	return true;
>  }
>  
> @@ -3942,17 +3932,14 @@ static inline spinlock_t *pud_lock(struct mm_struct *mm, pud_t *pud)
>  
>  static inline void pagetable_pud_ctor(struct ptdesc *ptdesc)
>  {
> -	__pagetable_ctor(ptdesc);
>  }
>  
>  static inline void pagetable_p4d_ctor(struct ptdesc *ptdesc)
>  {
> -	__pagetable_ctor(ptdesc);
>  }
>  
>  static inline void pagetable_pgd_ctor(struct ptdesc *ptdesc)
>  {
> -	__pagetable_ctor(ptdesc);
>  }
>  
>  extern void __init pagecache_init(void);
> 
> -- 
> 2.51.2
> 
