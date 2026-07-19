Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8889443;
	Sun, 19 Jul 2026 08:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784451363; cv=none; b=vEVpmoZEEnQ4Dz6GqvTTzRBl1bUvAYTde1diTmozootjoRHB4TaqwQw2zpLjElcBzdMgm6c/J1r3D+2EV9hoprkAjEDe3DKoRBuiI770RMjJ8ZztfEZJqhWUdFrioHMDHv9C94X0qL6Tqlg4ZnpzOCRF7goVXf0NQdkg/uyT7VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784451363; c=relaxed/simple;
	bh=WBK38m7uuYBj/o1y4P/HB9NX/kd40mJa1DPvjDQAJ2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SSdZwBGHRIMgIOrrIIEdbGi54zxIhDjXSVsjsbABuokP+YWhHMzlOqbYYOCG6N1O6Q9NRH+DPXvBdZAtcQJexqc2I3KthBGsNBIkgyf0fe1s1pzNKtfbm0VfkvnEW4ymDsy87yeXjZqEx1XXh5cF4/8ncRit27zTZHHoW725S7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UKlIHd3G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UKlIHd3G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0CAA1F000E9;
	Sun, 19 Jul 2026 08:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784451362;
	bh=2U5qRrAFa9bh5Xmu1DmWsyCaZmGr6MmPtt2A5WCS8eI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UKlIHd3GXV7IU3Wzd4zgNGbWboOz3yZfmmQ4qfqEiPSWD1qHhrj4/uqYPPX9vX8b9
	 +R+xQOrMW7VIqDEg0DNU+UiuC0v849p7ryJ04TXG/C5rsbVME4u26eoM7/XOjhvXuS
	 Gq+yd6Xh0+TLCsNtLXrs2suu8LIjACy+526imMnPBAF/8FeI4YZkeFnV1IR3AUbUTc
	 716I8AShlrSiF3OVnjSrdRp1s+oMzwFZ/DcgQ/5Loto0FG0DZk2NqQJ1HvtxRHGibL
	 IuwYTFgBf6X1CyzZysQ5JX7i746Mo0A6A1tRG/ZW63Xe0yPj61oHO9R39VflM/MY96
	 HI6d5Zv98HXZg==
Date: Sun, 19 Jul 2026 11:55:56 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>, linux-mm@kvack.org,
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] mm/execmem: Print size, align and caller on
 allocation failure
Message-ID: <alyRHFN9T0FIDBl2@kernel.org>
References: <20260717075715.25513-1-yangtiezhu@loongson.cn>
 <20260717075715.25513-2-yangtiezhu@loongson.cn>
 <20260717113730.787867964b1c3a7c645bb0e0@linux-foundation.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717113730.787867964b1c3a7c645bb0e0@linux-foundation.org>

On Fri, Jul 17, 2026 at 11:37:30AM -0700, Andrew Morton wrote:
> On Fri, 17 Jul 2026 15:57:14 +0800 Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
> 
> > The current execmem_vmalloc() function reports an allocation failure
> > with a simplistic "unable to allocate memory" message. This notifies
> > the user that an error occurred, but it acts as a black box during
> > debugging.
> > 
> > Enhance pr_warn_ratelimited() within execmem_vmalloc() to explicitly
> > print the requested allocation size, alignment constraints, and the
> > symbolic caller.
> > 
> > This diagnostic visibility is valuable for analyzing the root cause
> > of allocation failures and tracking misbehaving subsystems without
> > inducing log pollution.
> 
> Have you actually encountered this?  GFP_KERNEL allocation failures are
> supposed to be very rare.

Looking at the second patch, it's quite possible. The allocation is limited
to module addresses which was only 256M on loongarch and could have been
exhausted.

> > ...
> >
> > --- a/mm/execmem.c
> > +++ b/mm/execmem.c
> > @@ -50,7 +50,9 @@ static void *execmem_vmalloc(struct execmem_range *range, size_t size,
> >  	}
> >  
> >  	if (!p) {
> > -		pr_warn_ratelimited("unable to allocate memory\n");
> > +		pr_warn_ratelimited("unable to allocate memory, "
> > +				    "size=%zu, align=%u, caller is %pS\n",
> > +				     size, align, __builtin_return_address(0));
> >  		return NULL;
> >  	}
> 
> This seems to be duplicating the information which the page allocator
> can emit.  Perhaps we should remove the __GFP_NOWARN in there?

Right, page allocator/vmalloc reports would be more useful, for example

"vmalloc_node_range for size %lu failed: Address range restricted to %#lx - %#lx"

was most probably the cause of allocation failures.

But we cannot remove __GFP_NOWARN unconditionally though, because execmem has
fallbacks for some of the allocation failures and I don't think the
complexity required to detect when __GFP_NOWARN should be cleared does not
justify one-off case.

Besides, nowadays there are other tools (e.g. BPF based) except printk that
allow debugging such issue, so I don't see much value in extending this
error message or clearing __GFP_NOWARN sometimes.

-- 
Sincerely yours,
Mike.
