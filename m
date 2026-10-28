Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793174815;
	b=LVK4Sbdl9OM843F5QdNMCU/NEbVS6yMwwSD9aWsxkUnehHOTYsaStOIYEhO9gwsM+Blu
	 pc+l07zWQlVOUkDnmfnQaUcthmv7QzS5J0PqgfW44HeHlhnNN28hkaxMu+5iOGRbew4qf
	 nrCmIH4JoDpA5QHL4C8QrB7JWPYGctp/xbgaF7McY3nyBIfKbL9Sx7nlFNFJw77ZNEMOx
	 sjE8Tr7w4xwhigw4nk/a4LW1MY9WIXM4fvuyeJgNbZzzafLWFP+T1t/l/Hr/UaCAs0LQj
	 aFQQf1kMH9NT/dS+JMtOB4GbGtmJKdrz3XXJ8KhK0IhQeuRzC/CJ02QBJPw4+29J4Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793174815;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=c240DR83JuR63BMG4/5b1ZEcsT+lI3V8H+zMAtuhVW4=;
	b=U04QJ6AM6gFhWXlIWLf1JBNuIJoX/dT0ePMsErcbdQD+8ajNdVBAGv5hAbYGnSQRflEG
	 1L0Z8u4IV6kuDE9veYNewUVZIdtFIlmr3WSKgC7k5EtYtAQW0ECt8jrNDAimiY8JOav/k
	 /sFnUed99Bn3W9kcfadbmUwwxhCutRp2QF4W04FF9rz9eOiW3K/GUSWxP3K53JJaAbnRf
	 cS5PXQqQ5xAe3mElr73JV7fI4a/Z22RvtaemUZNKpbA1Rk8rj1aaUlmayQebbj4Fr2H0s
	 Usyji3xtLAryTgH4aWy9Oq1xTy+mc7javCaLm4uqf33+jWeiRXxO2Bj/7Wg4lRGTUVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=JeUmYbrV;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064F0606A31A;
	Wed, 28 Oct 2026 08:06:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 064F0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=JeUmYbrV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=c240DR83JuR63BMG4/5b1ZEcsT+lI3V8H+zMAtuhVW4=; b=JeUmYbrVJ5hVNkMe52I30pmZwb
	L+n8t3cHN2+9FUJIQE15d3lhvXFlG4ucACiZ0nBTW+0PzzZLkZNMT67Ef8gqakJ4JJPxpvHRdamWC
	JVoCh5fhQu1TgksInJTUjpzBJ3rbH4WH1gVgyCb8kuRXJw9sn7t33KaNmdCLZ8WEaw0ZjnR8ocks8
	CU8OoqRi4TMb/SF3TUlzO/5+tzoBDD1Qp2K1+Uaukof1vxIdis56J+A6BLdVKWz01rJQzblygcKN1
	gZxkSxBjuuVpqKS7RL1cwX500QdpU5nvVEqkWZi25MP4gCisv7FCpv3jk/mgXBHj/enb6KgwlrH7C
	GvanlsQw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLyg8-000000025sx-1dmn;
	Wed, 28 Oct 2026 08:06:36 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4FE7A30120E; Wed, 28 Oct 2026 09:06:35 +0100 (CET)
Date: Wed, 28 Oct 2026 09:06:35 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Muchun Song <muchun.song@linux.dev>
Cc: Kiryl Shutsemau <kas@kernel.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
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
Message-ID: <20261028080635.GD2668804@noisy.programming.kicks-ass.net>
References: <f97a8d33-50b2-4a86-8381-ee840cdfa2f9@kernel.org>
 <20261027110028.GH2668564@noisy.programming.kicks-ass.net>
 <auCKv_omLGRc6wv2@thinkstation>
 <f3f3aca9-bdb7-4aec-9099-9fb63a60e61d@kernel.org>
 <auCZFckDfBMrlfxV@thinkstation>
 <070DDE5C-2183-4A8B-AC2D-891CAE15E581@linux.dev>
 <d7a634b6-8668-4753-8bfc-e9334dde705e@kernel.org>
 <4A32F5E6-977D-4720-8723-B19AFBC08FCF@linux.dev>
 <auDkbDlgSZxqlk2G@thinkstation>
 <7cb3dd91-f518-49b6-b311-9ec807b3c63b@linux.dev>
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
In-Reply-To: <7cb3dd91-f518-49b6-b311-9ec807b3c63b@linux.dev>

On Wed, Oct 28, 2026 at 10:38:22AM +0800, Muchun Song wrote:
> 
> 
> On 2026/10/28 01:51, Kiryl Shutsemau wrote:
> > On Tue, Oct 27, 2026 at 10:03:54PM +0800, Muchun Song wrote:
> > > Therefore, I am kind of leaning towards removing the RO protection
> > > and restoring RW permissions to solve the race.
> > Okay, what about this:
> > 
> >  From e23ab850837b53cc79d57d58f1cfb4266e745c3d Mon Sep 17 00:00:00 2001
> > From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> > Date: Tue, 27 Oct 2026 17:23:47 +0000
> > Subject: [PATCH] mm/hugetlb_vmemmap: map the shared tail page writable
> > 
> > page_ref_add_unless_zero() reads the refcount and then updates it with
> > a cmpxchg.  A lockless get, such as a page cache lookup or a PFN
> > scanner, can read a non-zero refcount from a page that is then freed
> > and reused as a hugetlb tail page.  If HVO remaps its struct page to
> > the shared tail page in between, the cmpxchg writes to read-only
> > vmemmap:
> > 
> >      CPU0 (lockless get)               CPU1
> >      c = atomic_read(&page->_refcount)
> >                                        page freed
> >                                        page allocated as a hugetlb tail
> >                                        HVO remaps the struct page RO
> >      try_cmpxchg(&page->_refcount, &c, c + 1)
> >        -> write fault on read-only vmemmap
> > 
> > The refcount is zero by then and the compare fails, but LOCK CMPXCHG on
> > x86 writes anyway.  The kernel oopses when hugetlb pages are allocated
> 
> Is this an X86-specific issue? If not, I suggest a more generic
> description.

AFAICT most architectures that implement single compare-and-swap
instructions are affected, with the possible exception of s390.

That is, sparc, arm64-lse, riscv-Zacas, loonarch-amocas, openrisc (and
ia64 for those people keeping the out-of-tree port alive) all require
write protection to begin cmpxchg.

All the LL/SC architectures should be fine, they'll never get to the SC
part.
