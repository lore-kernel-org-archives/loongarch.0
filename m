Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009103D7D67
	for <loongarch@lists.linux.dev>; Thu,  5 Feb 2026 13:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770299429; cv=none; b=Hf53GTw26K53WUKRhvefuNJnL2PcJl5vBV+jovGHAvtCETus0djpS7SO7Ukq4VQLGi73IAId/kQ4An/qaWWLcZVOTUMOCbQKt3kJFdNENmrkpVvaCorAkJjdHTHm+OUfRO8kx6GCwqcNjov88InW8DXeW5PILTVmHs17Apcv+Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770299429; c=relaxed/simple;
	bh=3TY2LvtZnrCiQseYdsb0tgxnCGw9BQjaOFOmpcNjY34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GT2d33mUe5Bu2tyNShezRaZRsvAjEfPFrw2W/crrPf6NSt2FxcBfgue25SFVokjrh6+g0DxUxZYUTqOjkytHLn5XZW7PAqD+VcrUK84xswzqJm//fSe6BEUeFW88VswgGVSwDYWWEcwp2etNY6LEm+5UpEKOfyTTmLCxAnMAK/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nZjt/qf9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nZjt/qf9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CDAEC4AF0B;
	Thu,  5 Feb 2026 13:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770299428;
	bh=3TY2LvtZnrCiQseYdsb0tgxnCGw9BQjaOFOmpcNjY34=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nZjt/qf9VJzwFHOgqySxuAcrbSQuBulW3qm/ouJrbXrHLZ8x9pa9nwMgX+3jZo6mU
	 N4ifhi7PUe9zhliFzPLyXsxoVeLSXF0e6ob9+MuKAQ7Jn5iQvx59m8BbNQ/6fYZIVm
	 RfSeKPKJpsbdoiBt8Jne2ISM9DDP5cLeWA++u6OsBmvof7sYwh2DvltqJMX0/AGT7/
	 FyaXn8CIRNnAgm3tAUjjNoO6gUIwFlX/CNrNgoDO7hTBW0CJ3kXk4QORwkTGwf6LGu
	 v/sYAB0S2Keapjr6rAebNdO7eGUqPtTHQEhj33GWQpAsdidUkrLHNZg7J2BH4rWzLf
	 y7+WUGfjW0+ng==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 0D54DF40068;
	Thu,  5 Feb 2026 08:50:27 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Thu, 05 Feb 2026 08:50:27 -0500
X-ME-Sender: <xms:IqCEaZf6StkWfOqu8wFSOZeK9vXsBWrdIeava6LuaFgh6MhYGi-y-w>
    <xme:IqCEaQ5qls25rtsGHqFrm2Ttf2ZPHFXPplBaTUa4iYpfpLkNRd7SjVQfMZkBxqdaP
    5jbZJcwMo_ziIilnQwc0Y2dZ5ffYmh-ZBxRxDMc4_GMbK_-ACh8Ncw>
X-ME-Received: <xmr:IqCEaZebtFCUBddCzka2qZR1s7YPqIztazpkzNjE7oPAi1YH8moJgmlpqubZNA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukeehgeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepmfhirhihlhcu
    ufhhuhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnhepueeijeeiffekheeffffftdekleefleehhfefhfduheejhedvffeluedvudefgfek
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirh
    hilhhlodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieduudeivdeiheeh
    qddvkeeggeegjedvkedqkhgrsheppehkvghrnhgvlhdrohhrghesshhhuhhtvghmohhvrd
    hnrghmvgdpnhgspghrtghpthhtohepheegpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegurghvihgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrkhhpmheslhhinh
    hugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepmhhutghhuhhnrdhsohhn
    gheslhhinhhugidruggvvhdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrggurd
    horhhgpdhrtghpthhtohepuhhsrghmrggrrhhifheigedvsehgmhgrihhlrdgtohhmpdhr
    tghpthhtohepfhhvughlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehoshgrlhhvrg
    guohhrsehsuhhsvgdruggvpdhrtghpthhtoheprhhpphhtsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehvsggrsghkrgesshhushgvrdgtii
X-ME-Proxy: <xmx:IqCEaXAGHKZMBJS6DUsJ98T7WyuRMoEUVJhkNCQ9KG1MejXV8BfpSw>
    <xmx:I6CEaVHlKYRyqwTh2vTVJYQ9F735Nv0bH_bNCRQM-oWLhwZ-9a_fqg>
    <xmx:I6CEafjBkfUHcOHA-WfHtJvjD79HzFhOUFGs7C8chXL6k23xFLRu_A>
    <xmx:I6CEaXs9Qf8A_cpGbYT3ZbCh3Xs_yGK5n3wyq6EE5VNQ2zEc4GNTkw>
    <xmx:I6CEaV-n2W8zWDLDGHDrciU6x5-ShBKOSo7gnftoJrzCpdjBdgcLcSiJ>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Feb 2026 08:50:25 -0500 (EST)
Date: Thu, 5 Feb 2026 13:50:18 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: "David Hildenbrand (arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Muchun Song <muchun.song@linux.dev>, Matthew Wilcox <willy@infradead.org>, 
	Usama Arif <usamaarif642@gmail.com>, Frank van der Linden <fvdl@google.com>, 
	Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Zi Yan <ziy@nvidia.com>, Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, kernel-team@meta.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCHv6 05/17] riscv/mm: Align vmemmap to maximal folio size
Message-ID: <aYSe0TAIzxJ9i1Wy@thinkstation>
References: <20260202155634.650837-1-kas@kernel.org>
 <20260202155634.650837-6-kas@kernel.org>
 <1b80b189-b549-40ba-800c-8037ce12b081@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b80b189-b549-40ba-800c-8037ce12b081@kernel.org>

On Wed, Feb 04, 2026 at 05:50:23PM +0100, David Hildenbrand (arm) wrote:
> On 2/2/26 16:56, Kiryl Shutsemau wrote:
> > The upcoming change to the HugeTLB vmemmap optimization (HVO) requires
> > struct pages of the head page to be naturally aligned with regard to the
> > folio size.
> > 
> > Align vmemmap to MAX_FOLIO_NR_PAGES.
> 
> I think neither that statement nor the one in the patch description is
> correct?
> 
> "MAX_FOLIO_NR_PAGES * sizeof(struct page)" is neither the maximum folio size
> nor MAX_FOLIO_NR_PAGES.
> 
> It's the size of the memmap that a large folio could span at maximum.
> 
> 
> Assuming we have a 16 GiB folio, the calculation would give us
> 
> 	4194304 * sizeof(struct page)
> 
> Which could be something like (assuming 80 bytes)
> 
> 	335544320
> 
> -> not even a power of 2, weird? (for HVO you wouldn't care as HVO would be
> disabled, but that aliment is super weird?)
> 
> 
> Assuming 64 bytes, it would be a power of two (as 64 is a power of two).
> 
> 	268435456 (1<< 28)
> 
> 
> Which makes me wonder whether there is a way to avoid sizeof(struct page)
> here completely.

I don't think we can. See the other thread.

What about using roundup_pow_of_two(sizeof(struct page)) here.

> Or limit the alignment to the case where HVO is actually active and
> sizeof(struct page) makes any sense?

The annoying part of HVO is that it is unknown at compile-time if it
will be used. You can compile kernel with HVO that will no be activated
due to non-power-of-2 sizeof(struct page) because of a debug config option.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
