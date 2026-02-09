Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51262F3618;
	Mon,  9 Feb 2026 11:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770637942; cv=none; b=ISM8vCwMNp8SmFB8t9oKRBuHdWdZyePgJSWz2a2FX8pfXpLuSTDk+QY2B53vBfFqx9BC0fxPZe9aXlWFQ33SSdS41ZP2oMBp7ZSLZv23vidBoZWqjnxktzw6hA4sEP91oCKIb0Zwfuk7KdQ+kUlxQ7hbBm7HH86FIsHzuwNSybg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770637942; c=relaxed/simple;
	bh=/oVfWEPDEAt5G8rJ12d4rW+JXmSiJVKmDZMLxp+j8rQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GYn6Mbnt4ZYzz0vEFrKZkpSJ6z3sRy6gADZGs95QGYjK4IG27hqgfYwEoJggIQgTN2be0DEnGTpNwjG9xTcOhhiFOfObVfkAUj07xG3uSTfqWs0sxCyFUUKYL8GC6NHeCGRhw7PKPMl338dxOmrLiZabP4lOirtFDD03FCZ1d9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hH1QHvfK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hH1QHvfK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DA5EC116C6;
	Mon,  9 Feb 2026 11:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770637941;
	bh=/oVfWEPDEAt5G8rJ12d4rW+JXmSiJVKmDZMLxp+j8rQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hH1QHvfKc7CEJbSL0jt1YJJAqkMs759E290lV0qaNYFiNewfF2Ti/nUXuSSLl6rbc
	 wxaeDRbEkGrHOS6hoDtZ9lGQZtbRiCKPU2RrNffy06KwcfMMsZsXJ67vfP2LPwyf/H
	 uqyaL6pGSPycCvB41OiJtW95NihkBpCG7/k57aJJQ2Veom3VNwRF0sNgT7HJFF7ojp
	 u407lKJtbEoLyPWvbYZ6ECZJqjDKWWMuyESJo9WIs4TteL2FqbsNtAI0g86D5mhTFn
	 vXPBSmYoWrii+48+QrwZFcDJSCq5sQbs92l08YQzuXpg9wQ6TQSoVGWvv+1jF7OVGv
	 GyXhG+FdGllNQ==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 7F447F40068;
	Mon,  9 Feb 2026 06:52:19 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 09 Feb 2026 06:52:19 -0500
X-ME-Sender: <xms:c8qJaRnGgHcwQlUzKxM0pi1M6-sooBlwZEoLpFUFMGR7HRbHFqyO3Q>
    <xme:c8qJaQiJeXcg7jUEq21SU_9vYrWiTR0pldGbxPvjkRdWUvaC-puVBUk87Zn_-b_jp
    pPi1wIM1DBsogn1-UA00mdLWYjp3bRgG40OSLBt7rdrxECqYpa-K0w>
X-ME-Received: <xmr:c8qJaSuWjkk_xgUOyTKjFMNbnGwBGVYvtdWmNUhZy39Lahey-cfTbWuxswkiog>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduleeijeefucetufdoteggodetrf
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
X-ME-Proxy: <xmx:c8qJafBxveFtzYJ6sUMVxdezrYUNbFteSL281M5auAzdFoY-ZftXtw>
    <xmx:c8qJaVVAfx-CKI9XWQgj2X8tsJxQcG_EWguwGOVW9HLLVWHHcfZnVg>
    <xmx:c8qJadJJiU55uXizmOjCpiQQscs8mVm0de_3HA4JnGZLPHwuHr7zOA>
    <xmx:c8qJaeVyZ1n4cPaoHrIWYehWghRX-6E3bvjJAlBHqxqmt7qbPfbzgw>
    <xmx:c8qJaWSArh7v-pa87OwkWLqvR1MBp2DxJl5d6Rv7stWO7ti6O7oPdFzq>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Feb 2026 06:52:16 -0500 (EST)
Date: Mon, 9 Feb 2026 11:52:11 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
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
Subject: Re: [PATCHv6 08/17] mm: Make page_zonenum() use head page
Message-ID: <aYnJCnE5vooLROnu@thinkstation>
References: <20260202155634.650837-1-kas@kernel.org>
 <20260202155634.650837-9-kas@kernel.org>
 <e5831f0b-88c5-4a20-82b3-6e5952388132@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5831f0b-88c5-4a20-82b3-6e5952388132@kernel.org>

On Thu, Feb 05, 2026 at 02:10:40PM +0100, David Hildenbrand (Arm) wrote:
> On 2/2/26 16:56, Kiryl Shutsemau wrote:
> > With the upcoming changes to HVO, a single page of tail struct pages
> > will be shared across all huge pages of the same order on a node. Since
> > huge pages on the same node may belong to different zones, the zone
> > information stored in shared tail page flags would be incorrect.
> > 
> > Always fetch zone information from the head page, which has unique and
> > correct zone flags for each compound page.
> > 
> > Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
> > Acked-by: Zi Yan <ziy@nvidia.com>
> > ---
> >   include/linux/mmzone.h | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> > index be8ce40b5638..192143b5cdc0 100644
> > --- a/include/linux/mmzone.h
> > +++ b/include/linux/mmzone.h
> > @@ -1219,6 +1219,7 @@ static inline enum zone_type memdesc_zonenum(memdesc_flags_t flags)
> >   static inline enum zone_type page_zonenum(const struct page *page)
> >   {
> > +	page = compound_head(page);
> >   	return memdesc_zonenum(page->flags);
> 
> We end up calling page_zonenum() without holding a reference.
> 
> Given that _compound_head() does a READ_ONCE(), this should work even if we
> see concurrent page freeing etc.
> 
> However, this change implies that we now perform a compound page lookup for
> every PageHighMem() [meh], page_zone() [quite some users in the buddy,
> including for pageblock access and page freeing].
> 
> That's a nasty compromise for making HVO better? :)
> 
> We should likely limit that special casing to kernels that really rquire it
> (HVO).

I will add compound_info_has_mask() check.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
