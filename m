Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793103215;
	b=P32wJHUeEIkvT4LyEU6WsHjMr0rpqa7ZqBOpe3Kl8gvTmRR7m4aChoVkPbSeFXAzeWBa
	 vUBXJNsTYz+gLH8/Y94mfFeIzdwpu8BlZTiInOzxvcKHkLu7nqJOjBWdYiiUvqyNFZCIK
	 HSNhkSCk5iNyBtIRkfr48bCJEs9wA9TzgrkZRUIKd2pbmgoUSJ4ZKPbBuKmwhao53DR8g
	 2lugpZyI5rhCuzWnMeA3TEDHAFX7tUIfgbD5nvt4cOej/Z+uMfnv6eBktfQ+e5j1QXKhe
	 hSvqi005zS+ErFEJ5LMr8aw4KNTyC1MI1kU/dHeWS23w+wuVGdugL4LJKPjzUcpqd6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103215;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=UqgubOSrlWvHKhI1cqoT/fdRktbJuQr2VeGa7H2doB0=;
	b=3kicCG6GuN2ZjBLiLwP7bNFTyYwKe497advGh/nUo4P55XzlXy3n68XDQ/tn5bi0KooI
	 VG1UAMYmDwybw2B7jxPVp4em4jzHtvo91ivsV+1SDvT5acDpIh904ocDQRK10ZlLnW5lA
	 UMBHNTS0N12JuIQFwUP7ERsju5cHvoVmsv7olvqJac9gFVqglVAVE+vE8HCZH4UyCj1Yh
	 1r5EPwdjGidKxWXbp5jve30rOMliu8l9hbPLh51NwJEfER8Qbwlx0q/ARG06oRW8m0zdZ
	 0QbLhvYHNmeiQBEUaLmpOhlbLoydWv3Sq1z+j5027LgZRo2FmB5XyS3v9FepZ0XyNsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b="RBTg/FKM";
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698EB60A260A;
	Tue, 27 Oct 2026 12:13:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 698EB60A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=RBTg/FKM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UqgubOSrlWvHKhI1cqoT/fdRktbJuQr2VeGa7H2doB0=; b=RBTg/FKMjiMJhvBeWjtZ6CZIY9
	rvPo1ckUCe6w+h0QiGzd+6cZ2SX9h4XjdR9cge27tpZKPnYIX66xu0ynCGVEVN17tU71OKLzHYeUd
	YqLq2zAJnig/4jV33IsJ4SPBSdrisjLfFdiJlsjpW5dPMWCs+MvV7MeJYcTUbpvu4bgIGirMrhNRT
	rfQtF87hxPbl4GLZG512PZKdcraOJ9bUOs97wFlIO/vsRNJjr0Xeic51ZjNa4hLcU1g1mU3TtvmU/
	TMvXw7zT4HnYQe+O4c+SJwwIKJjffebWKGrSbkUjU7VknhliRZuEvq3AGqvm5+9EA7IZvX/8NaQPB
	FB/pcf5A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLg3R-0000000EufN-04F8;
	Tue, 27 Oct 2026 12:13:25 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9C1633014C0; Tue, 27 Oct 2026 13:13:23 +0100 (CET)
Date: Tue, 27 Oct 2026 13:13:23 +0100
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
Message-ID: <20261027121323.GO2668564@noisy.programming.kicks-ass.net>
References: <20260227194302.274384-1-kas@kernel.org>
 <20260227194302.274384-14-kas@kernel.org>
 <ebc7bde1-f52e-4da8-b16f-822d6c0a4d74@kernel.org>
 <at_f43oDv73y-t7O@thinkstation>
 <f97a8d33-50b2-4a86-8381-ee840cdfa2f9@kernel.org>
 <20261027110028.GH2668564@noisy.programming.kicks-ass.net>
 <auCKv_omLGRc6wv2@thinkstation>
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
In-Reply-To: <auCKv_omLGRc6wv2@thinkstation>

On Tue, Oct 27, 2026 at 12:00:47PM +0000, Kiryl Shutsemau wrote:

> Fair enough. Here's some context.
> 
> HVO (HugeTLB Vmemmap Optimization) frees most of the memmap of a hugetlb
> folio by remapping the struct pages after the first vmemmap page to a
> shared page, mapped read-only.
> 
> Every lockless get of a page reference (e.g. page cache lookup, PFN
> scanners) relies on page_ref_add_unless_zero(), which is
> atomic_add_unless(&page->_refcount, nr, 0).
> 
> The page can be freed and reused between finding it and the get; the
> zero refcount is what makes the get fail. The race:
> 
>   lockless get                        other CPU
>   c = atomic_read(&page->_refcount)
>   c != 0
>                                       page freed
>                                       page allocated as a hugetlb tail
>                                       HVO remaps it read-only
>   try_cmpxchg(&page->_refcount, &c, c + nr)
>     -> write fault on read-only vmemmap

I missed a little something here; page->_refcount is in the page-frame;
how does the page itself being RO affect this?

