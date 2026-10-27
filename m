Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793103787;
	b=Q5UEeAgfaygb3KXCwUeaoAZz4EFv79WzOkTT44aZIALznUXAYbteNN8RY31rN12HxnXD
	 9uz8fkRK92NOK0CTLdmvIpWYaV/gBpYjtejDiU1FmfVucXtFo90Bk+9jqIiNrqVqwd1fB
	 uv6SefhhEsDhf48P6E0DoYTDzRoKy9rjzauQkSKf6jmajYaFhhGz41Hc+E4MXKdFX5n8M
	 bdpDiEsDoVfFzKlnM8QLrc5YNcyTE2PGsYJUxb+D2TvCysCeWh4oAJhRMc5hX4ifWGQcs
	 qxdpt5+e+Xa9DxkVE/0EQe6LTZoUN/xAU7+tGPdPJyEQU/3P3D45jFLNDCefVoM53DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103787;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=JH82SQPddTJN7QL/zfTDbgly6+w34WA/Fx2FsS5gJX0=;
	b=jkACxGZL3XhhGFEDWe78GGpoILUdinP7zhaOR8JJ4K54f9s59IBZwl103quQ/86gEiRc
	 ACF3VhV196gsFLfScbE56MtrjylSYzcglbocL3Kjk9o88HVhs5qgP4xFQTnX5DXcdCDS0
	 svxN0qiJdOGwnXujCj50MkzJ2L6TNJxBydrlUxUQW9UXts9SLjjruqRB4ZRnEPEfbquLh
	 NlcpqfeKCWYtOKr2x3E8yjIdsON3V4yD2wdLWJlOvoIXOkgiIEYAPHge0iwiMERlI1gNA
	 0PmDZJszJ43Y6+3D2AHiYj3AfkkY98BGn8EhhCAfzhESAiCioB/PNkOrHy1689z8IKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EvqirSe1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC002606A31D
	for <loongarch@lists.linux.dev>; Tue, 27 Oct 2026 12:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EvqirSe1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 368441F01829;
	Tue, 27 Oct 2026 12:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793103786;
	bh=JH82SQPddTJN7QL/zfTDbgly6+w34WA/Fx2FsS5gJX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EvqirSe1NQX866oBy742Bj9eSePyFBBUrgUWvorX72h1gK+sT59e0+e8AnOmlE0ZA
	 jIIYybOFKWj0wdeKhUhJ+Tell5ZJRuQ215LG8bp1Lk9d4lDK6LwlhZLoITjDrsIP93
	 o2bBZhxuCnKvL85GrV4crUO6TUyDultwvnCXgqCti+YJNOfqnt61k5gMhyhckmgwAJ
	 K4wFHUctnBDyHL5bM9DY0pHVKBUeaeXkAYU0cZKuwh41tjhPg1n9jjJgo2J6Wi+YV8
	 +IXkTZpnLv7vw7MtqBGfSVK/6TnPyR3uoh8yaYYDCNfv0BgROeLHGbeckX4kDXmUup
	 7T6haDkLBicnw==
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfauth.ams.internal (Postfix) with ESMTP id DDFAB198003A;
	Tue, 27 Oct 2026 08:22:58 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Tue, 27 Oct 2026 08:23:03 -0400
X-ME-Sender: <xms:opfgarAkOIR74toP6hkDm4hzLCfGQYFCfhEhfk01zfxeDfHJdt1rxg>
    <xme:opfgah83ME6NZzWbkbNozB2k-g89XlXI5GXyiJwmo8FgcPu4M7R5CJT8nkqZIGw3u
    YoTl63A1oEYW5gfV7RGxJg9MuCA8n0Tgk4ZTJe-S61Zdhh3f7CzbJsg>
X-ME-Received: <xmr:opfgaoDoA_su67fQ0_Fhwb989zrijEY1mAcviOvIPNP1jmGNjiHfZ_C5aEw>
X-ME-Proxy-Cause: dmFkZTGoVod3f+gzQyI5zh1cNfz3B/lNl8CDem1gpH9oo/zANXaPwl4/lEqCJQk8zhtrP8
    e7wY2xOwNY02y862sCUKLrBcae/3k5Mjx6jchUi4fnRUF6UQHpQUbtomDtloc++Mt4EgSn
    6OV9RwY8x6EJTliTPczhJN4bwoD1ZHOdp41L3oJAKvV08FPgHXZUAzX8iM6M1RdDjWD8pR
    flOlcktTO34RfTZi2p3OTP+In8WQYMN3c5GjXWKOEMG60YIxkwPPIpuqZOl4C45T2eDwgW
    PusULDyjW9qdpswwCkeor1T4yxtGU13QXTc9UC8KmEmi1bBuXRU1OfZmyA7pgZDHjUdQlO
    eTlCLrQybSUeUm8OclpYFgHiYR1SQjwWU2EwgbgpPq+uzDLtCMAnmG6d21lxdDOc7zZYVZ
    qpoln6Szr0E9lNDodnbNfhaO7NFtKowYNfwXS+qA3SreBzDEv/1UbkZ20VF5R9kZ8zd5EZ
    EdQkIg1e2QQUmFVzGBmv6m69wiFiq2DKcfJ/YeYzEri9vknsMF1POuw571ZzzSc+60r1IN
    U/Xx4NiWDE5T3vyWJ987ii2GbtrGHqbTbdJAxro2VPZIxLXMz3aKaNBoPaoM1F2ACL6VEb
    P4n2bL+zkmkGncjs+41PFLwOkr/kxOR2XPrab+i03BxCQy4AjAvowYNZ7qNw
X-ME-Proxy: <xmx:opfgatwlOOaO3u-M7qIJwbOTlyvqeCdmAWaZ7aiELloCGUdpNVU7zQ>
    <xmx:opfgavoySzDzAfoxLc1H0-acvIkZ__jv_lnKNrlz01s0emfTeoZHcg>
    <xmx:opfgaoyL1LIDX99Q-sC8wT-79rA1MTeeGbpgpHTuo51O-hl1-nLazw>
    <xmx:opfgahNFbSFQotsSREFgxFAy5ldq_Ws_JeARrpcX72LIH1y3MFysnA>
    <xmx:opfgaieOHSnFuqEoCD4VythpZOMKPLvazSko064KPu3HUzqbpEzy0d__>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 Oct 2026 08:22:57 -0400 (EDT)
Date: Tue, 27 Oct 2026 12:22:56 +0000
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
Message-ID: <auCXVv9yXtaS42w8@thinkstation>
References: <20260227194302.274384-1-kas@kernel.org>
 <20260227194302.274384-14-kas@kernel.org>
 <ebc7bde1-f52e-4da8-b16f-822d6c0a4d74@kernel.org>
 <at_f43oDv73y-t7O@thinkstation>
 <f97a8d33-50b2-4a86-8381-ee840cdfa2f9@kernel.org>
 <20261027110028.GH2668564@noisy.programming.kicks-ass.net>
 <auCKv_omLGRc6wv2@thinkstation>
 <20261027121323.GO2668564@noisy.programming.kicks-ass.net>
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
In-Reply-To: <20261027121323.GO2668564@noisy.programming.kicks-ass.net>

On Tue, Oct 27, 2026 at 01:13:23PM +0100, Peter Zijlstra wrote:
> On Tue, Oct 27, 2026 at 12:00:47PM +0000, Kiryl Shutsemau wrote:
> 
> > Fair enough. Here's some context.
> > 
> > HVO (HugeTLB Vmemmap Optimization) frees most of the memmap of a hugetlb
> > folio by remapping the struct pages after the first vmemmap page to a
> > shared page, mapped read-only.
> > 
> > Every lockless get of a page reference (e.g. page cache lookup, PFN
> > scanners) relies on page_ref_add_unless_zero(), which is
> > atomic_add_unless(&page->_refcount, nr, 0).
> > 
> > The page can be freed and reused between finding it and the get; the
> > zero refcount is what makes the get fail. The race:
> > 
> >   lockless get                        other CPU
> >   c = atomic_read(&page->_refcount)
> >   c != 0
> >                                       page freed
> >                                       page allocated as a hugetlb tail
> >                                       HVO remaps it read-only
> >   try_cmpxchg(&page->_refcount, &c, c + nr)
> >     -> write fault on read-only vmemmap
> 
> I missed a little something here; page->_refcount is in the page-frame;
> how does the page itself being RO affect this?

Emm. I am not sure I follow the question.

The memory itself is not touched. HVO remaps the vmemmap, the array of
struct pages: the part that holds the folio's tail struct pages points
to the shared page, mapped PAGE_KERNEL_RO. So it is the struct page,
and its _refcount, that is read-only.

For a 2M folio with 4K pages, its struct pages take 8 pages of vmemmap;
the last 7 of them map to that one RO page.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
