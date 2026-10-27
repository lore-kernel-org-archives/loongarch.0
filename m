Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105366;
	b=sNem6u19f0W/Dbt0mRXxW0rMgHYODB2GeDednAqLYOqr3lboAGnif0+uEa2EzzsgTlQF
	 rTc5qb/cz074LWnx3YJpnlvVHmJxui3Q2kmGxkpjalyTAGy2jz7rmj0w0H8WjMcG4A3Y8
	 nTsaXC57qK0utElsGJG2j424c8z1yb5y9GUWirXvPtKq7x1Ar7ZUvGCKEyT3hbT1Le+NJ
	 aTnjQRhNTRxeIOZRL4GE+BduNCVepJvQSvkAJZ8FXa6aNszAkX3QtIK6098RQDCs89xZ1
	 rT6bwbPF4j2TzyWkk30VvW9h2eNQ+B0/Oi9ylo8Je2Pyb1DKxZeXYH/g/5oac1StVnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105366;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=HfrXUsdFLQaA5FckFCHh54cFFOWKpmXuI7Yv4I221sM=;
	b=U2RJHptoh61FyZ9sRK00vg5kVUBa2PHPmcW+UiUFviTVScG8bgjzZv16N0gXub59FhyL
	 3CLrJNQyGYaGlMFWL5E35WLSE07y+3u+oadSq519JISAZGJa306xLfwD6/eHdoi/gtA6L
	 1NSmGF8JZ/mXRDTZNWeKWBPdpPygdc3CWNMMiq5bSZ+gDG6jKdhXu4T6420cbUKK6t1Ea
	 AJ8wLluNAh1QdQHDej/hHhqpA6fFcBUVvdYTxQIjD1uAYwxRvYHcHqAiiNDHvtDOHzX8m
	 ik9Tt9Unx/ilPjoJYd+HRtYmzF+P/sWBxkCWtEKFFiPPxCgxVsDHmrNyKvNjNxRizIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b="T/hTRzGA";
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D06606A31D;
	Tue, 27 Oct 2026 12:49:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83D06606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=T/hTRzGA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HfrXUsdFLQaA5FckFCHh54cFFOWKpmXuI7Yv4I221sM=; b=T/hTRzGAYoLrX/cxLl9a0ZtIHX
	KKT8aT75ShKu+I4Xl9h/suO7DJBk6ZDvX7y8gpHvZKBWFcAaRJUoOoQ6byNN8AYceqohUlmEKQL2Q
	hF6V2vtojiWISCS0NgQrAc6cHJ6PW0/H6fvBQJQI0r+Fv9nRKRi2CNAwsALVWiukr77b1bWPwwsRN
	nq/J4MlbBa/Wmfk/kg3e5yC+7zuFml9XGs+eaBF2D7MyccDwycJEL3pjInXFuJ7MhJgxQvojgnODz
	8xmSHxzRrxE7n7izu6v0pXqscvEgRAafGRks0Pz4L4+vp3cAbHDEgasf3uWaK3tTLXNFyCFtdVIij
	rMnFZbdQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgcA-0000000ExlX-2MLY;
	Tue, 27 Oct 2026 12:49:18 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 17B62300A9A; Tue, 27 Oct 2026 13:49:17 +0100 (CET)
Date: Tue, 27 Oct 2026 13:49:17 +0100
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
Message-ID: <20261027124917.GA2669272@noisy.programming.kicks-ass.net>
References: <20260227194302.274384-1-kas@kernel.org>
 <20260227194302.274384-14-kas@kernel.org>
 <ebc7bde1-f52e-4da8-b16f-822d6c0a4d74@kernel.org>
 <at_f43oDv73y-t7O@thinkstation>
 <f97a8d33-50b2-4a86-8381-ee840cdfa2f9@kernel.org>
 <20261027110028.GH2668564@noisy.programming.kicks-ass.net>
 <auCKv_omLGRc6wv2@thinkstation>
 <f3f3aca9-bdb7-4aec-9099-9fb63a60e61d@kernel.org>
 <auCZFckDfBMrlfxV@thinkstation>
 <20261027124716.GC2668804@noisy.programming.kicks-ass.net>
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
In-Reply-To: <20261027124716.GC2668804@noisy.programming.kicks-ass.net>

On Tue, Oct 27, 2026 at 01:47:17PM +0100, Peter Zijlstra wrote:
> On Tue, Oct 27, 2026 at 12:31:09PM +0000, Kiryl Shutsemau wrote:
> > On Tue, Oct 27, 2026 at 01:05:58PM +0100, David Hildenbrand (Arm) wrote:
> > > > Writing this, I just realized that we have another option -- map the
> > > > shared tail page writable. A failing LOCK CMPXCHG writes back the value
> > > > it read, and the get never changes a zero refcount, so the race becomes
> > > > harmless. The cost is the protection: the page is shared by every
> > > > hugetlb folio of that order in the zone, so a stray write to any tail
> > > > silently corrupts all of them instead of oopsing.
> > > 
> > > Right. Without HVO we would just corrupt pages in the single folio (which is
> > > also not nice).
> > > 
> > > I'm also questioning whether we need this RO protection all the time active.
> > 
> > What do you have in mind? RO only under a debug option, or switching the
> > tail page to RO some time after the remap?
> > 
> > If it is the delay, a grace period alone does not close the race. We
> > would need rcu_read_lock() back around the get, and then it is the old
> > scheme with the wait taken off the allocation path.
> 
> So it used to be; back when Nick introduced try_get_page, that it was
> only allowed with IRQs disabled.
> 
> And looking at gup.c now, I see gup_fast_pgd_range() still has
> local_irq_save/restore around it.
> 
> So what do you need that rcu crud for?

Also; as long as the synchronize_rcu() only lives when a debug option is
on, that sounds like a win. Debug stuff has costs, news at 11 and all
that.
