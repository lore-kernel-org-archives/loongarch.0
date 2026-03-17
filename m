Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D596348880;
	Tue, 17 Mar 2026 11:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773746922; cv=none; b=TTv4Q6472E9a2gEgWZeeKvdxdVVftO+XGcwRkFXEF+AwRvcPvBmwihUh2K8wJ/MjPnJlwTBt7vUx0FZ0gW2FY2ntvQ5PpQWs8Xfgib81HbZESHDDjwPThJ51Ym2l08vRv+XSvv+ncj4m52wl1oxjsaifzHV87U+WsboRCFJpgsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773746922; c=relaxed/simple;
	bh=32qbYYZEgqHyAOOKzk5WrymnIe+x73RqYh712Mog1As=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tjx34SGlAbH9Ph8DnMjDnLIEuZd3Gq89Kdt2IGJ8iJgAx5ckcKZIZrbLUN/4bpcvZyGj1ewKDdNauK9K2tP1YR0tMaGZLG/YiRfN3Ltzw2AzpnK9oolTmPQZTTRaGjezzTWxN+UefvuXINSd4zaBsdmGPXoBu8Cm/NhP8p8pfOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hdIGeuR5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hdIGeuR5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0FE9C4CEF7;
	Tue, 17 Mar 2026 11:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773746922;
	bh=32qbYYZEgqHyAOOKzk5WrymnIe+x73RqYh712Mog1As=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hdIGeuR59iiqFhPnWcecegpZD30lBPjH6oyJgNrZ6sTuqfj67G8KwOQMWRpH66ln7
	 Tb+7rKSnyapJxOuOYPf0JqsZH2UEsi7+u7bYXa84wITJpd0GoQExdA157pROiQ0xUG
	 FkP/HT0QhUuw5NL2RQRZavEB2AO8Z6ynUUE65XnPSOjoNXoU74KUjQ+SHXoxtRuIUS
	 TOnUblaSujaS4wEbaEDE+Z0BBhVvhMdSbMomo10xrl9uEkH5esYJK4Bo9jOSvD5lO9
	 UHg+lN1Vc3K6yiC0r5V5MihGfutd9Xtk6BEwYZhd4ijbJ2iH45Yye6vueuxh2SZZSA
	 WmIwjPwb4DRKw==
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id E28B8F40068;
	Tue, 17 Mar 2026 07:28:40 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Tue, 17 Mar 2026 07:28:40 -0400
X-ME-Sender: <xms:6Dq5aRezeypjqaoWwhIQjsBuBEhtrdSNLXG62S2ccj2KBrdeDFlkMQ>
    <xme:6Dq5aY74Fzu_kW2IqbfV7ADlOCPU3a5H6IRhoUJbaJFuIFM6vzTvk6CH4GA_9jHxe
    pdSR_A8fESh31IsvOjhte6pYMvlqQX2L24C8ZGztBbjCN7_vsrTO-o>
X-ME-Received: <xmr:6Dq5aRdI5bQ3PZ3PcWm9JNgk0qQj8TjCz4neksWXvW5aj-IlU9F2Xjfx8kX_RQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdduudefucetufdoteggodetrf
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
X-ME-Proxy: <xmx:6Dq5afB40A8o3F4M6vXhGQivGB23CU8zGa6dY7zbd2L7KjB6TmweRw>
    <xmx:6Dq5adGl3TJC6mmbn9eD1LlxwlRJZfuXH1_ME-MYxf98BtvkMSsgnQ>
    <xmx:6Dq5aXi4DU2MhQ1B_Ii0EIM91z-qBbr92LZM83CYfF-7lQlzf6SkjQ>
    <xmx:6Dq5afsxgNwr3DMB23qGX1nysq_EKzWatd4vzWcPpqaHXuIM_OQKzQ>
    <xmx:6Dq5ad_BUpkXLTbLl-0RPF25cJY_OlBhTA00Q_FsAXEWdi13FUI84bed>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Mar 2026 07:28:38 -0400 (EDT)
Date: Tue, 17 Mar 2026 11:28:34 +0000
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
Subject: Re: [PATCHv7 09/18] mm/hugetlb: Defer vmemmap population for bootmem
 hugepages
Message-ID: <abk58j2bV0sGabEU@thinkstation>
References: <20260227194302.274384-1-kas@kernel.org>
 <20260227194302.274384-10-kas@kernel.org>
 <4e52f70d-e0c3-471f-8073-68c0e9bc94ca@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e52f70d-e0c3-471f-8073-68c0e9bc94ca@kernel.org>

On Mon, Mar 16, 2026 at 05:48:24PM +0100, David Hildenbrand (Arm) wrote:
> On 2/27/26 20:42, Kiryl Shutsemau (Meta) wrote:
> > Currently, the vmemmap for bootmem-allocated gigantic pages is populated
> > early in hugetlb_vmemmap_init_early(). However, the zone information is
> > only available after zones are initialized. If it is later discovered
> > that a page spans multiple zones, the HVO mapping must be undone and
> > replaced with a normal mapping using vmemmap_undo_hvo().
> > 
> > Defer the actual vmemmap population to hugetlb_vmemmap_init_late(). At
> > this stage, zones are already initialized, so it can be checked if the
> > page is valid for HVO before deciding how to populate the vmemmap.
> > 
> > This allows us to remove vmemmap_undo_hvo() and the complex logic
> > required to rollback HVO mappings.
> > 
> > In hugetlb_vmemmap_init_late(), if HVO population fails or if the zones
> > are invalid, fall back to a normal vmemmap population.
> > 
> > Postponing population until hugetlb_vmemmap_init_late() also makes zone
> > information available from within vmemmap_populate_hvo().
> 
> So we'll keep marking the sections as SECTION_IS_VMEMMAP_PREINIT such
> that sparse_init_nid() will still properly skip it and leave population
> to hugetlb_vmemmap_init_late().
> 
> Should we clear SECTION_IS_VMEMMAP_PREINIT in case we run into the
> hugetlb_bootmem_page_zones_valid() scenario?
> 
> I suspect we don't care about SECTION_IS_VMEMMAP_PREINIT after boot and
> can just leave the flag set. (maybe we wan to add a comment in the code?
> above the vmemmap_populate() ?)

I think keeping the flag is right thing to do.

SECTION_IS_VMEMMAP_PREINIT indicates to core-sparse that the section
should not be populated and it will be initialized elsewhere. Even in
!hugetlb_bootmem_page_zones_valid() we take care of it in
hugetlb_vmemmap_init_late().

And, as you mentioned, nobody looks at the flag after boot.

> Nothing else jumped at me
> 
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> 
> -- 
> Cheers,
> 
> David

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
