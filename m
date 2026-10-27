Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793104199;
	b=R+PJSjlR7QOdFitGqIvpyQ8s07nGdBQgMCmZ/dqYLGtPfMhS9J4l56WDeXODZ3+KjoZu
	 xuXc5p7xrvqle2Pi6ML1qIS3NvQy+0jeYN/6Kz8JmajksAHwF6Gmyu95STS3WLh13/aRs
	 x0orpMCiRaYQgxjHecpKaoregOwp0jCDlINI06HQJKYiFubJPJxJHAPP4DQrsJ0TDvegQ
	 LE3uXRoj757z2py5y9p/Vm5C0yal2SvHMjkUmP3J3UKuuy4eu3ppXnaDcxo5Mchb5Gnj+
	 lVUNZYtMosEIGUfEGqD76IKCM1iNe5SHBq5nGR+eUeN7SmqUx6hlv7/v2mN1uyps9Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793104199;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=TEtKC47I2aW92wCX8ceE3Qq4fHsnf6t3ajY/y/wrOAM=;
	b=2GrvQ4HK/DzIS8q4iBycIfHFF3wnnA+NioD7h1/SSpIx2TJpdhHABsG97wKoJzwkY0XD
	 1FUt3ckUGV/LR7jGAlstbA/a/W+bPySVun12iDoLpN3/Yd7LEzaW84rhdF0z/WQVGPgF2
	 7xtqxcQKm22OyhIxqKw+UQMmZ9LiECNHRsrzvoJw3CqRFMH+Yu8GHOaKQeYg2KhOT5ThJ
	 NF3ZpyUiBl3hAPj0UQ+pL3hvZ2NqWkqQMFOcIc6d/MX4Orh1UvH3W3bxjLqQ4PfRcnMd8
	 hv89rb7OEa9EQcUpWtvhH/CBpBgIWLNpfES6JLkd5ns44Cbxx/PmBO8EnC+C/ITKN8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=oFz0dNxn;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83403606CB34;
	Tue, 27 Oct 2026 12:29:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83403606CB34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=oFz0dNxn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TEtKC47I2aW92wCX8ceE3Qq4fHsnf6t3ajY/y/wrOAM=; b=oFz0dNxnz56JDogfZNZ3EcKBOe
	p/m3wd/aD1ouGh7D5TT4x8mldu1x54Im/ac1rqMMevZmEidyYtcN+ivOlf2Thn6SpMf5YxmBpAoTQ
	ACQ0QZ5dqhlqIrZJFZjdD32yrkKpxhlXJcDwBYr4es40imisWDbsX65FBBPCyvIXijJMwJJram/IE
	tBMccaHODu2a+6WaIkXlsMgQHpOeXupPOOVG2c+EnHZEn2cTe8Z/8tIneZpBMPZziWd0bkrYlaqgs
	dLt6KjEQnal4f+pZgXQXpUoSzeTKvhdXVCgTa2N2pkLnI3dPR2NYs/RNJlgEklMwTx88Hl7DsRiJc
	aetUoipA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgJJ-0000000DUxD-3wq1;
	Tue, 27 Oct 2026 12:29:50 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 3EE4A300DB9; Tue, 27 Oct 2026 13:29:49 +0100 (CET)
Date: Tue, 27 Oct 2026 13:29:49 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	Matthew Wilcox <willy@infradead.org>,
	Usama Arif <usamaarif642@gmail.com>,
	Frank van der Linden <fvdl@google.com>,
	Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Zi Yan <ziy@nvidia.com>, Baoquan He <bhe@redhat.com>,
	Michal Hocko <mhocko@suse.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	kernel-team@meta.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCHv7 13/18] mm: Drop fake head checks
Message-ID: <20261027122949.GB2668804@noisy.programming.kicks-ass.net>
References: <20260227194302.274384-1-kas@kernel.org>
 <20260227194302.274384-14-kas@kernel.org>
 <ebc7bde1-f52e-4da8-b16f-822d6c0a4d74@kernel.org>
 <at_f43oDv73y-t7O@thinkstation>
 <f97a8d33-50b2-4a86-8381-ee840cdfa2f9@kernel.org>
 <20261027110028.GH2668564@noisy.programming.kicks-ass.net>
 <auCKv_omLGRc6wv2@thinkstation>
 <20261027121323.GO2668564@noisy.programming.kicks-ass.net>
 <auCXVv9yXtaS42w8@thinkstation>
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
In-Reply-To: <auCXVv9yXtaS42w8@thinkstation>

On Tue, Oct 27, 2026 at 12:22:56PM +0000, Kiryl Shutsemau wrote:
> On Tue, Oct 27, 2026 at 01:13:23PM +0100, Peter Zijlstra wrote:
> > On Tue, Oct 27, 2026 at 12:00:47PM +0000, Kiryl Shutsemau wrote:
> > 
> > > Fair enough. Here's some context.
> > > 
> > > HVO (HugeTLB Vmemmap Optimization) frees most of the memmap of a hugetlb
> > > folio by remapping the struct pages after the first vmemmap page to a
> > > shared page, mapped read-only.
> > > 
> > > Every lockless get of a page reference (e.g. page cache lookup, PFN
> > > scanners) relies on page_ref_add_unless_zero(), which is
> > > atomic_add_unless(&page->_refcount, nr, 0).
> > > 
> > > The page can be freed and reused between finding it and the get; the
> > > zero refcount is what makes the get fail. The race:
> > > 
> > >   lockless get                        other CPU
> > >   c = atomic_read(&page->_refcount)
> > >   c != 0
> > >                                       page freed
> > >                                       page allocated as a hugetlb tail
> > >                                       HVO remaps it read-only
> > >   try_cmpxchg(&page->_refcount, &c, c + nr)
> > >     -> write fault on read-only vmemmap
> > 
> > I missed a little something here; page->_refcount is in the page-frame;
> > how does the page itself being RO affect this?
> 
> Emm. I am not sure I follow the question.
> 
> The memory itself is not touched. HVO remaps the vmemmap, the array of
> struct pages: the part that holds the folio's tail struct pages points
> to the shared page, mapped PAGE_KERNEL_RO. So it is the struct page,
> and its _refcount, that is read-only.
> 
> For a 2M folio with 4K pages, its struct pages take 8 pages of vmemmap;
> the last 7 of them map to that one RO page.

Like I just explain to David on IRC; my brain has a 1:1 relation between
PFN and struct page. It makes no sense for struct page to be RO, ever.

Anyway, let me try and figure out how all this works, this is 'weird'.
