Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105245;
	b=vEaHuy44x4pbILKboHJmg8/B+hphg/v2Zo9gD3lQSFawsRXr168Kj9JjAcPdjeHD2nFZ
	 Ec2xforIyPSsdY0oZ4fO9R1UjQ3+TGZq4em2t9W1bj6w4Vkw/5TBHBpZ15SeT+mhiWy1i
	 owcTywh8Krg91C7w1prc8J+wD9knhXdzB8u1tKwfmOTmDTKjNaSl1T6L572NbN0H6hk6d
	 7HYFdjVd7QYFb5nRHrAZen12U4z/zPeJG19d33f/IuofyfI4WN0LhImfUqKTqEj9JDCfg
	 C8hIAhYY5+iEQXoiCPxftAupBkQbmgLjjpTYcNj9M46TODgxAKTeWEDyDI9y0eupwAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105245;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=ZAIpqRoqpXgz0RZ4h56d9mqozECvPzO+I5VTSFmMVtE=;
	b=0nOgqZoSNjM5YoE5EWbsIAKpyFAtNPhQ7P61BT8off3AKM+hLjE24sO3AZfrqMG795sx
	 dUpqDzBB9SnSIHatwtVBeouXGvo3dnKa48vPlTHO2+gX9d49Zi7jQIUMHykCS2We8/FHq
	 /BP1NzcrAe/f5ve1UycuJLcBhwl2fNKYY5b1XVJfVSool2oELhKQtyhs7gSjs1phrfy9j
	 ewAAFoszOv02HLEDoteSxxJYakEAPB3/V/SQsVat0d2JUfhZsTyYdlarIrRXd/dtl5Twl
	 Ol8d3HhvLM2U971pvFWt+bBUte+iji8TxjLOlkehLQ4dF7TEgb0tJu8VoAaPR9WvAWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Jyj7jOfk;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C086606A324;
	Tue, 27 Oct 2026 12:47:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C086606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Jyj7jOfk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZAIpqRoqpXgz0RZ4h56d9mqozECvPzO+I5VTSFmMVtE=; b=Jyj7jOfkJ3zLI2c3I5M3M46Zcb
	WnQwrAXczn6dCAXUP2nPsq8E8i4il+VDWbyZfBRt8ElhZD9EVM6bXkMkelsrdJ6GzzFT4JrQ5k2fE
	HvVnSCOOT/hXlFM44HSRfoB2SmByDM8uZCyGDhQCZ+RrkIY7H6uL+6RPWVddoEEJjx5K1r3Iyl0nd
	vf+topQ1atCH+2NeREP/q708/GzItGv7B/7PC01xV58kaLhrw/a23RC3l/wqMvZJY6z4eOIVSBW1D
	Nyi69d6JupfANQy+NhPNHkUsyGxbDvh2Y367Cb8T+P55YFRuWNaiZfelZ5Y9LdXhYPpImn2EH/+UO
	I8j9sT5A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgaD-0000000DbOb-1oue;
	Tue, 27 Oct 2026 12:47:17 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id F1B43300A9A; Tue, 27 Oct 2026 13:47:16 +0100 (CET)
Date: Tue, 27 Oct 2026 13:47:16 +0100
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
Message-ID: <20261027124716.GC2668804@noisy.programming.kicks-ass.net>
References: <20260227194302.274384-1-kas@kernel.org>
 <20260227194302.274384-14-kas@kernel.org>
 <ebc7bde1-f52e-4da8-b16f-822d6c0a4d74@kernel.org>
 <at_f43oDv73y-t7O@thinkstation>
 <f97a8d33-50b2-4a86-8381-ee840cdfa2f9@kernel.org>
 <20261027110028.GH2668564@noisy.programming.kicks-ass.net>
 <auCKv_omLGRc6wv2@thinkstation>
 <f3f3aca9-bdb7-4aec-9099-9fb63a60e61d@kernel.org>
 <auCZFckDfBMrlfxV@thinkstation>
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
In-Reply-To: <auCZFckDfBMrlfxV@thinkstation>

On Tue, Oct 27, 2026 at 12:31:09PM +0000, Kiryl Shutsemau wrote:
> On Tue, Oct 27, 2026 at 01:05:58PM +0100, David Hildenbrand (Arm) wrote:
> > > Writing this, I just realized that we have another option -- map the
> > > shared tail page writable. A failing LOCK CMPXCHG writes back the value
> > > it read, and the get never changes a zero refcount, so the race becomes
> > > harmless. The cost is the protection: the page is shared by every
> > > hugetlb folio of that order in the zone, so a stray write to any tail
> > > silently corrupts all of them instead of oopsing.
> > 
> > Right. Without HVO we would just corrupt pages in the single folio (which is
> > also not nice).
> > 
> > I'm also questioning whether we need this RO protection all the time active.
> 
> What do you have in mind? RO only under a debug option, or switching the
> tail page to RO some time after the remap?
> 
> If it is the delay, a grace period alone does not close the race. We
> would need rcu_read_lock() back around the get, and then it is the old
> scheme with the wait taken off the allocation path.

So it used to be; back when Nick introduced try_get_page, that it was
only allowed with IRQs disabled.

And looking at gup.c now, I see gup_fast_pgd_range() still has
local_irq_save/restore around it.

So what do you need that rcu crud for?
