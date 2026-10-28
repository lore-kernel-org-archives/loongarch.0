Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197028;
	b=pNqL0PgrsjrL458ziDHAm4wxeamdTCVMYZPwlu50cRNNasLK8QFNjQGRBhJ7xkm6Erbk
	 vbTtVfrdHfkCW2Qkz+QYDHbiezbA8OMB73zMgzkYVp6SHiXULu5aiBj0W3PT+ypsL0gZa
	 NZbR6EanTUsiFYWgP7Smvb/yrAb3w3/YpN/7hFiRo2N9TgreOqQFQPAU0Y+VkYx55AC4V
	 IdWLJ2jjmeOgPf4mlxsEqil3eh3mBq3h598SgHYtpxITSuXvlJKmRb1lcf5bWobLNEVq2
	 NRe7wMhfML8Kpo9H6mOUaMhhxs7QoB2NHzYj4bGnqrAnafpvYwP+QewqLyde6rb5Vrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197028;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=KjE+Uii9HdIaARV62zaMQ61CIuncPf7bH8UJ3pdaQYA=;
	b=UHq6R46b1fNVVd1rlAPxrpXkftsKVTBKWACXf+uoXX6PD2hTivYq0IY/nUKDvZ07sC9N
	 RPpGElkQp6NNqSUE/IbMRSIVt11rpwe0YQzP4cforWuBGt/ixTyQLuXTEswK/w+qtbAWp
	 MYiLDjK2qn1Vr9beKS/3MyvViFvluwwV4jmtebB5Ick9RtpgBNWjOfHKjkpJJ28daO5yx
	 uxTqa8rm5Dpc4pHVf8LreTnNB9yhDdLRT3LGiSu9/mbH21eV1x9QDR1Y6nttL/GmJHXHO
	 +xLXlk+HrLn584jP8lb8LebNVSVRZwXc4rqarDhpRR/OXJljAfR6POAqPivRVA+Cf1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zcdh2eIB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A32E606A31D
	for <loongarch@lists.linux.dev>; Wed, 28 Oct 2026 14:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zcdh2eIB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01E6A1F031E0;
	Wed, 28 Oct 2026 14:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793197028;
	bh=KjE+Uii9HdIaARV62zaMQ61CIuncPf7bH8UJ3pdaQYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zcdh2eIBUKC4hwGul8m2X99COtLyRxU9I1tM3K8HNMrbYYnTTWhdHlgLZ8oc9hQ0E
	 hkij64PMlw2B35u30Io3tH3HsD0bNhhXsgX59QJdkIQoqrmwecSDeQzG4blmv9KCKs
	 zpbyI7gIirKXkwF2M7UlINaw/GRVFmWIbS7pSH3TIHgpDG7aJwpWbBcAaNwEJGxUg/
	 UUvr1CGfqhw8l0QXJXNBe42SvHDAw91meYdE2y4qqF/osXsIl4NB3bv5lDIrCwlYfD
	 WJwEisb3g4Fv+JB51XtPrQYsW8TA6hHI6AdqdFh3MOkHtw1CHYKUBb2HdzBgS8AyGI
	 CnOSlmOc8ymzQ==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.ams.internal (Postfix) with ESMTP id D36591980047;
	Wed, 28 Oct 2026 10:17:00 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Wed, 28 Oct 2026 10:17:05 -0400
X-ME-Sender: <xms:3APiarzKAOrcCYp85okUrZ2ipEC1s0_1ePxXIfY-lxyVQMiegoW3RA>
    <xme:3APialnQLfKLFrYVeEEVADA0jAmf6HH1ltvAfNtwvNPkBuO2C5Cpsma4S1o5FTtj9
    VyCwbXtl-zUXNXPceKZODaNKjyKNXXbQUbQBhiWJHMUBUfJzNv-7Mn_>
X-ME-Received: <xmr:3APiakHTaLOPvpay-J_NhtjKgcQ_ww__mVDZ3LIB3wD_2Z2fanEzh75cX_w>
X-ME-Proxy-Cause: dmFkZTFBUCDrd/5ordvcAtkU6JjR9vrPimb+UYxK8G9IVcsl+hsz6Ui5my93/MGWrjS87u
    fXqSgPXckr17WjUL+tJxx9X6tIeCr9bfJMhwSdRRpKBvQHhzUHHeuF90VW3GvmiAwMBcQx
    Rf2Yec/qkpxdmRN0gn81nfMEtgtzr9xle+Sqvm4msx4Gu47eXQusCRI+UTCHDaQLpM88Zw
    rA2KSpwrrNtwy3hNsymytz/3zQf5zrQhLIfZgGCnRsgT13HdYXLGRb5Hfufh9/xN00Sw7j
    VoUYeEMtfP62ZRJRgpiIZ1sb8H4pSmNadcRIVzTJpNxYLEIHjCh6+OIkfWTl5h6WIw54gA
    KE6JNmsl7DeQ0Kg8mW/mO/uEfAd5ourm2uLsVrQyqhxYxZW46VXJE/JyALAdTsn4tHLHQR
    9J3XB/OTW36iz9yadG/flUPik6iZcWFmEGKzsegO1g5puDzneN2xiaetmpoWF0UM5wnKqK
    MFQ06f2mDmplk9n8JKhi5ClQ5Fqm71Y2Jgt/24wpthhs2MF+1PFVTNqTJDk2AJWHnLl5y8
    ++hBW9M77S9dYUxy+BMYF15QXjLxOsg3nNoK+b02p8kN9M/KDQpW6b5xHKMmV9hna2Qdc4
    F2kZ6V+Uw0HniFG7WD/kBET6ZxUz0YZm4Xr7zmI/BK6THBFe4X3S7pitIvXA
X-ME-Proxy: <xmx:3APiavvE6bgdYAFNatLpfiwUmYDHEf2Vhcf47WwzCbXrTusVjOa3qQ>
    <xmx:3APiavmbcczH63JKhRwHD1r6QjyCYmIrLFH_oanCxvKE4F4WEB5DrA>
    <xmx:3APianwxi9Dw8YGSVfLzE8GTkVg27tEhM9sqm9dz5SzZi_IXUNaZCA>
    <xmx:3APiatyMDZq22FQv9KsG6a4USfJlj0dx88WiiH47AEK5QjqspxFgHA>
    <xmx:3APiaoAX3LCP0OQaKpTMG_-mBpGkeN7sa6qxLJajKmYN5axko5dE0bEh>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Oct 2026 10:16:59 -0400 (EDT)
Date: Wed, 28 Oct 2026 14:16:58 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Muchun Song <muchun.song@linux.dev>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
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
Message-ID: <auIDteFAFYTihu4_@thinkstation>
References: <f3f3aca9-bdb7-4aec-9099-9fb63a60e61d@kernel.org>
 <auCZFckDfBMrlfxV@thinkstation>
 <070DDE5C-2183-4A8B-AC2D-891CAE15E581@linux.dev>
 <d7a634b6-8668-4753-8bfc-e9334dde705e@kernel.org>
 <4A32F5E6-977D-4720-8723-B19AFBC08FCF@linux.dev>
 <auDkbDlgSZxqlk2G@thinkstation>
 <7cb3dd91-f518-49b6-b311-9ec807b3c63b@linux.dev>
 <20261028080635.GD2668804@noisy.programming.kicks-ass.net>
 <auHxIORufMbldrBr@thinkstation>
 <20261028133439.GK2668804@noisy.programming.kicks-ass.net>
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
In-Reply-To: <20261028133439.GK2668804@noisy.programming.kicks-ass.net>

On Wed, Oct 28, 2026 at 02:34:39PM +0100, Peter Zijlstra wrote:
> > Only architectures with HVO matter here: x86-64, riscv and loongarch.
> > arm64 has had it disabled since 060a2c92d1b6.
> 
> Per that commit, could it be re-enabled now that its no longer marked RO?

No. The problem there is the PFN change on a live vmemmap PTE, which
needs break-before-make on arm64. Dropping RO only removes the
permission change.

James Houghton is working on it with an Access Flag trick:

https://lore.kernel.org/r/20261003002123.505555-1-jthoughton@google.com

arm64 will need the writable tail too: its atomic_fetch_add_unless() is
a CAS loop.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
