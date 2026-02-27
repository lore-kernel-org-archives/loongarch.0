Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD8F1A9F97;
	Fri, 27 Feb 2026 21:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772226547; cv=none; b=oaz3aFxRhZeNkypTzLrCjcrcetnZDksR50M/8uRF7AmuiCBKcsEkN8KEiqyBFGw/U8zo7Fn6ey+MijY8qkUWpJudRF2+TDLgFTD8jKpa2ECxo8qp4N3j82306w9+dRZj9iXQWR2h0Q4vXxK18/Uh3Jk44OOForHPsFsuE3CDFuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772226547; c=relaxed/simple;
	bh=xjkcwnrAWf8OrFv2bcOg2en4S/OMGTVvWvqpKRZcaDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JeBTZf/Um981+qUoeDDTbLiYoyp/TzfY7dCxpd9OjZsb24qpceyNd98pNPA9+ggQtUu9JSi95u1RMviAeflyhMQt+80zouIfUiGC+ROsZNeH1XLwDfHthtPtdd5G2YK3nmFTkxdueZUkphhf8hklNRuaRn5KCtvacYPWXx8Oby8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=R4nGnP1c; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="R4nGnP1c"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=4FuBhsUwwCOInnqB7O2GDaXeBFXb9h+2Obvf7L/ta9E=; b=R4nGnP1cbd2DInksjBWnv/d0gZ
	ddMiXwJQ6PFlTGSrO4IoZMGFmmQIXDaYGedozjGH+yn4XfqDSkk3Jv/s5ir9UPpsNZ41AQfWI07Sm
	BPaRF8DKchzsIFPxz1dfIz6y5nluh+GHF0qVxD6DBS/bsTV/EPpJ+n7dV/La/vzpCqXyKlIwaRlEQ
	DU1I3pxQAzNCEcAysnohMM6ujLMLvuXbsH21wqKxEAczIZ2Y9XrLBT7p0moUXfnhGzWbZeg3VkqhL
	pYwcZes5wDl9MlmKLnO7r1XeNP9XgUXeHaHblD3R/rFKyxxsvcRd+3/Z7uFLH1uQnyTv7h+3nlUSZ
	LOywukdw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw54u-00000009A1r-3Ob7;
	Fri, 27 Feb 2026 21:08:52 +0000
Message-ID: <7d4ece82-2d92-4e97-851b-822816cfd800@infradead.org>
Date: Fri, 27 Feb 2026 13:08:51 -0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv7 17/18] hugetlb: Update vmemmap_dedup.rst
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <muchun.song@linux.dev>, David Hildenbrand <david@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Usama Arif <usamaarif642@gmail.com>,
 Frank van der Linden <fvdl@google.com>
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
References: <20260227194302.274384-1-kas@kernel.org>
 <20260227194302.274384-18-kas@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260227194302.274384-18-kas@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/27/26 11:42 AM, Kiryl Shutsemau (Meta) wrote:
> From: Kiryl Shutsemau <kas@kernel.org>
> 
> Update the documentation regarding vmemmap optimization for hugetlb to
> reflect the changes in how the kernel maps the tail pages.
> 
> Fake heads no longer exist. Remove their description.
> 
> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
> Reviewed-by: Muchun Song <muchun.song@linux.dev>
> Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
> ---
>  Documentation/mm/vmemmap_dedup.rst | 60 +++++++++++++-----------------
>  1 file changed, 26 insertions(+), 34 deletions(-)
> 
> diff --git a/Documentation/mm/vmemmap_dedup.rst b/Documentation/mm/vmemmap_dedup.rst
> index 1863d88d2dcb..4aaef36d8971 100644
> --- a/Documentation/mm/vmemmap_dedup.rst
> +++ b/Documentation/mm/vmemmap_dedup.rst
> @@ -124,33 +124,35 @@ Here is how things look before optimization::
>   |           |
>   +-----------+
>  
> -The value of page->compound_info is the same for all tail pages. The first
> -page of ``struct page`` (page 0) associated with the HugeTLB page contains the 4
> -``struct page`` necessary to describe the HugeTLB. The only use of the remaining
> -pages of ``struct page`` (page 1 to page 7) is to point to page->compound_info.
> -Therefore, we can remap pages 1 to 7 to page 0. Only 1 page of ``struct page``
> -will be used for each HugeTLB page. This will allow us to free the remaining
> -7 pages to the buddy allocator.
> +The first page of ``struct page`` (page 0) associated with the HugeTLB page
> +contains the 4 ``struct page`` necessary to describe the HugeTLB. The remaining
> +pages of ``struct page`` (page 1 to page 7) are tail pages.
> +
> +The optimization is only applied when the size of the struct page is a power-of-2

                  end that ^^ sentence with a period                      power of 2.

> +In this case, all tail pages of the same order are identical. See
> +compound_head(). This allows us to remap the tail pages of the vmemmap to a
> +shared, read-only page. The head page is also remapped to a new page. This
> +allows the original vmemmap pages to be freed.


-- 
~Randy

