Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B6D3ACEEC;
	Thu,  5 Feb 2026 11:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770291359; cv=none; b=WiI72baLD9M0SXV01IYfyxVTEx1rX4qGSYw8a93IDcSfX7WxgtjVzhEof4AmMjOEZObzrktKjc8AOQDepzBMSVH9kjm7YEfUYHqXnbGlM1vpNV2+47bklPy2qeOlh+m8nz24Cutnaqyi72nhl1bNZH36iU6G1WlJTJu5ZAXY3UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770291359; c=relaxed/simple;
	bh=3sMz1aXuuijzMsHvvObi2VXR9fx4WgEVichiU4CKZDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XyEVBkFM/nOZrxDLQdzJdiAz+8oGfvCVz8mLLiXpTneWp4iobIsR6ZhM9w4B443rwyhtfGSO9B31gp432HzWakGHPdGs5JJ52IJ8nJJSfnfLbGqkcZe1PthzQZSmJpUlsQRkLQ2wEJmh0OLvhbVgqPY3xcDFnqn17+s+5uU//B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cu7s1t/w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cu7s1t/w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E695BC4CEF7;
	Thu,  5 Feb 2026 11:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770291359;
	bh=3sMz1aXuuijzMsHvvObi2VXR9fx4WgEVichiU4CKZDM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cu7s1t/w6916Ya6ixpS6ttgjpMI2URV57aNBympnofTya/gxFpRRp61I06akmavdL
	 eQu0GohOQWs/g6dXAoYwIi5nj7gz2j0M7LOYJZJ5sO9IqcKJrdbCLpskJNbMSlFWLX
	 UG82wzpZSIE1w8UVOTbUcAxsMVVkI/nPtrOynuoG/DJFIg48BaVfjnNV+Nmj2kH21A
	 EQ3LaZKgCM/XBi+WtrdE/qdIFQLWJC8TURH7/eQznHgVg9EwRXhzMmSgN1/e7LpGdL
	 He24meVNRkv/Ke8oXQ6sEJ2GN+y3q74OQtXvENKyJXDzJ3ctLSrOyGZyQdaKGC3nch
	 Pv/Wt/rESj1UQ==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id EDAACF4006C;
	Thu,  5 Feb 2026 06:35:56 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 05 Feb 2026 06:35:56 -0500
X-ME-Sender: <xms:nICEaW_GvSSBINXf0ofq_x-yLSb58h8Og9sxOg20LDUUqtVKPd2rGw>
    <xme:nICEaS84tMRreNW5lZJAPhpBScOsKOGhe6iSr3R_x1nVEK-b0PtH-38d0qQvhAlfd
    3s4NizCjv59vM_uLsgD3MC1EKHuXUlovGPmlKJdkjJUzkee04UF42Q>
X-ME-Received: <xmr:nICEaVquclR8ZwZTFgdXvcQmyteANYL9y2MDtUACN47OUj1NDZeNvAxb9eMqNA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukeehvddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefmihhrhihl
    ucfuhhhuthhsvghmrghuuceokhgrsheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtth
    gvrhhnpeeigfdvtdekveejhfehtdduueeuieekjeekvdfggfdtkeegieevjedvgeetvdeh
    gfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehkih
    hrihhllhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeiudduiedvieeh
    hedqvdekgeeggeejvdekqdhkrghspeepkhgvrhhnvghlrdhorhhgsehshhhuthgvmhhovh
    drnhgrmhgvpdhnsggprhgtphhtthhopeehiedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepuggrvhhiugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghkphhmsehlih
    hnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehmuhgthhhunhdrshho
    nhhgsehlihhnuhigrdguvghvpdhrtghpthhtohepuggrvhhiugesrhgvughhrghtrdgtoh
    hmpdhrtghpthhtohepfihilhhlhiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthho
    pehushgrmhgrrghrihhfieegvdesghhmrghilhdrtghomhdprhgtphhtthhopehfvhgulh
    esghhoohhglhgvrdgtohhmpdhrtghpthhtohepohhsrghlvhgrughorhesshhushgvrdgu
    vgdprhgtphhtthhopehrphhptheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:nICEaexJkDciWL0gFKUnWwSDONB_D9Vg9IWhiPLedXxhJBnzDgZGKg>
    <xmx:nICEaUn-QwjMmOgHFazrgt66R5nUW1MxGWRvDl-sNftjNrODSjgR2w>
    <xmx:nICEaanFFBKtYwPiT8WBYCH1FdMASU4t8LDB18cpKxTCSriwe6BV7g>
    <xmx:nICEaazz6wcm51a7dwkOdM8i3af2JSfws-k5O4hX_h4YlCy-sTkk0g>
    <xmx:nICEaRZub43Z5DZ1aTG6jE-RP89KGBpGg0cgqYFgv_KJH-iiJipqwpQ_>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Feb 2026 06:35:54 -0500 (EST)
Date: Thu, 5 Feb 2026 11:35:50 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: "David Hildenbrand (arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Muchun Song <muchun.song@linux.dev>, David Hildenbrand <david@redhat.com>, 
	Matthew Wilcox <willy@infradead.org>, Usama Arif <usamaarif642@gmail.com>, 
	Frank van der Linden <fvdl@google.com>, Oscar Salvador <osalvador@suse.de>, 
	Mike Rapoport <rppt@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi Yan <ziy@nvidia.com>, Baoquan He <bhe@redhat.com>, 
	Michal Hocko <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jonathan Corbet <corbet@lwn.net>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kernel-team@meta.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCHv6 02/17] mm: Change the interface of prep_compound_tail()
Message-ID: <aYR-YULI3lBtl9y_@thinkstation>
References: <20260202155634.650837-1-kas@kernel.org>
 <20260202155634.650837-3-kas@kernel.org>
 <a61bc0a8-cf5a-418a-aeb4-96553b87f043@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a61bc0a8-cf5a-418a-aeb4-96553b87f043@kernel.org>

On Wed, Feb 04, 2026 at 05:14:12PM +0100, David Hildenbrand (arm) wrote:
> On 2/2/26 16:56, Kiryl Shutsemau wrote:
> > Instead of passing down the head page and tail page index, pass the tail
> > and head pages directly, as well as the order of the compound page.
> > 
> > This is a preparation for changing how the head position is encoded in
> > the tail page.
> > 
> > Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
> > Reviewed-by: Muchun Song <muchun.song@linux.dev>
> > Reviewed-by: Zi Yan <ziy@nvidia.com>
> > ---
> >   include/linux/page-flags.h |  4 +++-
> >   mm/hugetlb.c               |  8 +++++---
> >   mm/internal.h              | 12 ++++++------
> >   mm/mm_init.c               |  2 +-
> >   mm/page_alloc.c            |  2 +-
> >   5 files changed, 16 insertions(+), 12 deletions(-)
> > 
> > diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> > index f7a0e4af0c73..8a3694369e15 100644
> > --- a/include/linux/page-flags.h
> > +++ b/include/linux/page-flags.h
> > @@ -865,7 +865,9 @@ static inline bool folio_test_large(const struct folio *folio)
> >   	return folio_test_head(folio);
> >   }
> > -static __always_inline void set_compound_head(struct page *page, struct page *head)
> > +static __always_inline void set_compound_head(struct page *page,
> > +					      const struct page *head,
> > +					      unsigned int order)
> 
> Two tab indents please on second+ parameter list whenever you touch code.

Do we have this coding style preference written down somewhere?

-tip tree wants the opposite. Documentation/process/maintainer-tip.rst:

	When splitting function declarations or function calls, then please align
	the first argument in the second line with the first argument in the first
	line::

I want the editor to do The Right Thing™ without my brain involvement.
Having different coding styles in different corners of the kernel makes
it hard.

> 
> >   {
> >   	WRITE_ONCE(page->compound_head, (unsigned long)head + 1);
> >   }
> > diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> > index 6e855a32de3d..54ba7cd05a86 100644
> 
> 
> [...]
> 
> > diff --git a/mm/internal.h b/mm/internal.h
> > index d67e8bb75734..037ddcda25ff 100644
> > --- a/mm/internal.h
> > +++ b/mm/internal.h
> > @@ -879,13 +879,13 @@ static inline void prep_compound_head(struct page *page, unsigned int order)
> >   		INIT_LIST_HEAD(&folio->_deferred_list);
> >   }
> > -static inline void prep_compound_tail(struct page *head, int tail_idx)
> > +static inline void prep_compound_tail(struct page *tail,
> 
> Just wondering whether we should call this "struct page *page" for
> consistency with set_compound_head().
> 
> Or alternatively, call it also "tail" in set_compound_head().

I will take the alternative path :)

> 
> > +				      const struct page *head,
> > +				      unsigned int order)
> 
> Two tab indent, then this fits into two lines in total.
> 
> >   {
> > -	struct page *p = head + tail_idx;
> > -
> > -	p->mapping = TAIL_MAPPING;
> > -	set_compound_head(p, head);
> > -	set_page_private(p, 0);
> > +	tail->mapping = TAIL_MAPPING;
> > +	set_compound_head(tail, head, order);
> > +	set_page_private(tail, 0);
> >   }
> Only nits, in general LGTM
> 
> Acked-by: David Hildenbrand (arm) <david@kernel.org>

Thanks!

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
