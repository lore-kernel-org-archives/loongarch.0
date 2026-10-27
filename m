Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102460;
	b=ANHa8+2vePS0Gn5XyfAUJpL/bL1iQJ/9uDZH4OOHnj2+4mkjXPOtz2Q/pW9AuwbVylNl
	 8TkssEWu4HExaYRQRLSU/XMT140QJBQ7IfR2gcblGQrLcJuKGTz9ls/cR601wC0kmc1v5
	 TS6KCNMiU/wiCMQdqwauU1gReYsGU2qtrvjSoib0Qud8RwdZ6yKa8k/yPfd8hHtZMEi6H
	 zAr5Yx4+qMwwdhp5NFYORGBarMgToC+BNEx6P8AR50PvxefzkfGOKkLINLwxNv7D23ocw
	 oXJnuaLX7Tl709mP+wboRfMcy3pckL0buh43kECIMDNVNJfy9wJa1PHXEuR3A5cWiaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102460;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=dDx8AqQR7Bt04x47N4Mn7I+5GyazYzKkWgOX6VGjETw=;
	b=tOCtxEyT9Gpq64pXAhMPME9X8dU99G3qqiqoft4S1Vbp8h5m4s1Y9AXRw7RXvUuz2sia
	 DqGedxD2T2fr58N835F2CE3dxrAh7JMbeiBdETq1B057gUwLNT9rbR69H+LpTsHC0Rqmi
	 mAUeKZud9VoKPne01fKei2FPjrypxhBq5Yxeme24TDpp/2Sdd4nYYrXrIaWY5Ap/e89nh
	 kVrITDc/JxuzxvQlscyhBZafdbQNuMM83J52xMdHFIwJex361S1FtzZqDzCQzKDfETnau
	 5ZYXMsMM/VO4ASFGiKiVLngc+JhXRFtK2INxmmZS1kMC2KYA9AnZjA+NWSF7tAvDGAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jE63xTYV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A8560A2618;
	Tue, 27 Oct 2026 12:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jE63xTYV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3EC41F031E1;
	Tue, 27 Oct 2026 12:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793102459;
	bh=dDx8AqQR7Bt04x47N4Mn7I+5GyazYzKkWgOX6VGjETw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jE63xTYVQ0bibITRR3idWdLNB/lPlEiAJf2NmaLSuVI/gJQQ7RO3OaHmOhMV6Ojr9
	 sk8vTmAIHS4gaGSFXAxR37yAk4nzk0JEu+2xnTi/HIq70PLfKWGKpNDldKREmEhRvl
	 1ZSpXqOV5Hb4InOQA8omnK75bsNKJWDlGhlwP2t2OTWWZzx681syLUz2Lfcl/aZS1n
	 fhjBHMJ7ELsOHVqCBge7nsM70rbeBgt341a9KIjObMyPz4g6SAcQ03VaiJcrcPiQy6
	 8MrfVO+qbUvtdtGKgEIF5Rgcw5d0i6a94lmNt3WuWxkuFVyBL6j4H8RpBHRm4WwFtp
	 mti1GaNrDEpJw==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.ams.internal (Postfix) with ESMTP id 8FE7B198004A;
	Tue, 27 Oct 2026 08:00:51 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Tue, 27 Oct 2026 08:00:56 -0400
X-ME-Sender: <xms:c5Lgaq4ZQ8PwRI6i8KZZ_1a6MgmY4_VesoUflYDHSL2klFgmKl_XCQ>
    <xme:c5LgamPZbqnQcO4ydCIVaMh5FlnCPCvs4Nls_1hUAQsz_hXgDP0mUHpd4gMun1l23
    aoqEGdpHPflsvBWWkmRFVvFZ46y-dJJbw_0Kv-2xFMTptN0dANIn10Mew>
X-ME-Received: <xmr:c5LgaoOocCkfxbkL7h0hX7WHNWFKHnO7qeuY6KqD6MnKFqfV-K3nEGTnJCk>
X-ME-Proxy-Cause: dmFkZTGHFpKX1jiTMwU/zLbcEjLtIgjP4no/7v6bzBUeW+iOChjTDC5KyxGRFFAGyYBVcq
    qDgTGrfkugTguLv1RZoJPJRr9TFt84gWeCibTTWFwj5ZCc1ZWzs9CxSp62O2K2EwuxAUbo
    t1k0grfABMn2r699FuJ54BYDMKqUIzytxfVuu3Pv+ozDzSzCSbs5qNndCkNU8ysF6dywu0
    7ir0xiOJauMuW0PI3TTom1GP5lzHCkiVdVm/wbI7Mh2bsHmfdZ9qiz7UnzJbshS7dD3SAj
    FJF6UHO5XlbXu5vOXahQzNWbxOY0K/r58pyyCQ3L4G2o9SOXGGn43GlSykDAch+nsvX3Jt
    kwyErHX2W4JyRwVIzJrBweuq3ibwyyf2rh1I+q3aOExNytzviQrhW9tHhAHTjgEs2FOURH
    rBIVgNuQydHIqHVoC79wNa139/ZhZTxS6pcjs+hIpekPuC9KsYpMHb/cFYYQuk5K21Qwy8
    3YhELuibEcG+sx0aoxBsRrokS/KwVE6xjGZogYNnN+xMSSCGdpZDTR9Cuf4eyPO37dhHq8
    OV5xIrviy1SDa5VuIRXn3oO5irYRxiD2Xv2saxgkM+CAuuMc4HOZC/3S6lBOA90KJVMONR
    zYaeVC0vzVxJIy4ALo/WOBQtU9hUDJA4knUKijzmUApI95YbTeE1XV2EUwXg
X-ME-Proxy: <xmx:c5LgahXesNhO5LwQW3G7qm95Acm7DvWrFEvwCsldGMnrrnzg_a7VAg>
    <xmx:c5LgaguovOSbfLSwNhnV63uBaNcmTlSppEy4UeEzkU4qaWdWxRGC4Q>
    <xmx:c5LgaiaB71F57mviESnuAAsfdKVaXCoeB32JzcLcKb4i2u1NqwWZKw>
    <xmx:c5Lgaj40Dq6YSJHHAAbcrvdPML-1M5LVAPFoVg5PjhrMRqLJ0OFesg>
    <xmx:c5Lgajpo3RXifYMNLmrNAeFLHwirY6SjVQCuJnsbZNyiU49MdBxhHSSP>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 Oct 2026 08:00:49 -0400 (EDT)
Date: Tue, 27 Oct 2026 12:00:47 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Muchun Song <muchun.song@linux.dev>, 
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
	linux-riscv@lists.infradead.org, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCHv7 13/18] mm: Drop fake head checks
Message-ID: <auCKv_omLGRc6wv2@thinkstation>
References: <20260227194302.274384-1-kas@kernel.org>
 <20260227194302.274384-14-kas@kernel.org>
 <ebc7bde1-f52e-4da8-b16f-822d6c0a4d74@kernel.org>
 <at_f43oDv73y-t7O@thinkstation>
 <f97a8d33-50b2-4a86-8381-ee840cdfa2f9@kernel.org>
 <20261027110028.GH2668564@noisy.programming.kicks-ass.net>
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
In-Reply-To: <20261027110028.GH2668564@noisy.programming.kicks-ass.net>

On Tue, Oct 27, 2026 at 12:00:28PM +0100, Peter Zijlstra wrote:
> On Tue, Oct 27, 2026 at 12:37:13AM +0100, David Hildenbrand (Arm) wrote:
> > On 10/27/26 00:25, Kiryl Shutsemau wrote:
> > > On Mon, Oct 26, 2026 at 06:45:48PM +0100, David Hildenbrand (Arm) wrote:
> > >> On 2/27/26 20:42, Kiryl Shutsemau (Meta) wrote:
> > >>> From: Kiryl Shutsemau <kas@kernel.org>
> > >>>
> > >>> With fake head pages eliminated in the previous commit, remove the
> > >>> supporting infrastructure:
> > >>>
> > >>>   - page_fixed_fake_head(): no longer needed to detect fake heads;
> > >>>   - page_is_fake_head(): no longer needed;
> > >>>   - page_count_writable(): no longer needed for RCU protection;
> > >>>   - RCU read_lock in page_ref_add_unless(): no longer needed;
> > >>
> > >> I have an AI report that removing RCU read-lock was wrong.
> > > 
> > > Ughh. Yes, it is a real bug.
> > > 
> > > My reasoning in the commit message was wrong. Nothing stops a
> > > speculative get from writing to one after the remap. On x86 even a
> > > failing cmpxchg faults there.
> > > 
> > > The fix I have in mind is to let the atomic fault.
> > > 
> > > If the update faults, the struct page is a read-only HVO tail with a
> > > zero refcount, so the get just fails. An exception table entry on the
> > > cmpxchg handles it. No RCU on either side, and the fast path stays the
> > > same lock cmpxchg loop.
> > > 
> > > Only x86, riscv and loongarch have HVO. Below is x86 only, to show the
> > > idea; riscv and loongarch need the same primitive in their LL/SC
> > > fetch_add_unless().
> > > 
> > > Lightly tested on x86 by hitting a real HVO tail page.
> > > 
> > > Does it look sane?
> > 
> > I'm sure x86 folks will have an opinion :) . Let me CC them whether something
> > like that would be acceptable.
> 
> This looks quite terrible, doubly so because I have no idea what its
> trying to fix. Please try and justify this insanity.

Fair enough. Here's some context.

HVO (HugeTLB Vmemmap Optimization) frees most of the memmap of a hugetlb
folio by remapping the struct pages after the first vmemmap page to a
shared page, mapped read-only.

Every lockless get of a page reference (e.g. page cache lookup, PFN
scanners) relies on page_ref_add_unless_zero(), which is
atomic_add_unless(&page->_refcount, nr, 0).

The page can be freed and reused between finding it and the get; the
zero refcount is what makes the get fail. The race:

  lockless get                        other CPU
  c = atomic_read(&page->_refcount)
  c != 0
                                      page freed
                                      page allocated as a hugetlb tail
                                      HVO remaps it read-only
  try_cmpxchg(&page->_refcount, &c, c + nr)
    -> write fault on read-only vmemmap

The refcount is zero by then and the compare fails, but LOCK CMPXCHG
writes anyway.

Before v7.1, HVO mapped the tail vmemmap pages to the head vmemmap page
of the same folio. The first struct page in each of them read as the
head, with PG_head and the head's refcount: a fake head. A get on a fake
head of a folio in use always tried the write, not only in a race, so
page_ref_add_unless() checked for fake heads before the atomic.

Back then, the race above was closed by bd225530a4c7: rcu_read_lock()
around the read and the cmpxchg, and synchronize_rcu() in HVO before the
remap. The refcounts are already zero by then, so the get either
finishes its cmpxchg before the remap or reads zero and bails.

Since v7.1, tails encode the head as a mask instead of a pointer, so
tails of the same order are identical and HVO maps them to one page of
real tails, shared by the zone. Fake heads are gone, and every read-only
struct page is a tail with a zero refcount. The race is not gone, but
32c440d67e6c and 01b1d0ffb6f7 dropped the RCU on both sides anyway, on
the wrong belief that it was only there for fake heads. That is what
David reported.

One fix is to put the RCU back. It works, but it means rcu_read_lock()
around every get that goes through page_ref_add_unless_zero(), GUP-fast
included, and synchronize_rcu() on hugetlb allocation and freeing,
including surplus allocation at fault time. So I am exploring other
options.

The fixup is one of them. With the new layout, a fault on that CMPXCHG
can only be a write to an HVO tail, so the refcount is zero and the get
fails, and the fault only happens in the window above. With GCC the loop
compiles to the same code as before; clang adds a SETE/TEST per call
site.

Writing this, I just realized that we have another option -- map the
shared tail page writable. A failing LOCK CMPXCHG writes back the value
it read, and the get never changes a zero refcount, so the race becomes
harmless. The cost is the protection: the page is shared by every
hugetlb folio of that order in the zone, so a stray write to any tail
silently corrupts all of them instead of oopsing.


And yes, I know, HVO is an ugly hack, like most of hugetlb. But it
works, and it gives back about 16MB of memmap for every 1GB hugetlb
page.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
