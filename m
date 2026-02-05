Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115EA3D7D92
	for <loongarch@lists.linux.dev>; Thu,  5 Feb 2026 13:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770299558; cv=none; b=LYORWZC4wrhMWB5Qh8Gfhz6JsP9JncPQVKtLyTNrqJ7a+r+TizQR8YbN8fYdY22AKQ55NrZHUdAUgLB02kNWMUbAwJ1+gD/4AGgg0X/Kya5dKlx6fMaoYFar6QFkPnrEjtR592kREzp4L9wWd/KwZraHVg2/mv98pjmntLuIrZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770299558; c=relaxed/simple;
	bh=SWTU0hoYf/UnGmVIbKL9BuYlq2a5aSmIMAh2fyWcba8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k2+PfVRPdfvmrXbPi4EmYczfcQbF5Hi1ukpLnwMPkpHJW6kUganO5lEknyznKp0RJagKlq4JUu9WC5Wxsi1pT7DU2tGq71OEzPu2zryRmnX7hN6q35cRgbhWzcvwBSrQyZ4qIIgqM6Lk8nnLCzlafPbQqGpmgBWzDjSLlt1cpNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dM0Gmo0F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dM0Gmo0F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99E5EC19424;
	Thu,  5 Feb 2026 13:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770299557;
	bh=SWTU0hoYf/UnGmVIbKL9BuYlq2a5aSmIMAh2fyWcba8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dM0Gmo0FQRM8/2QgttKwZQQ5VBJJWNQpZ3R8/pJR+k47WeSw+6xob6IePg7c8NVGq
	 8IWO+25yjWE+v2GwhhPyPEHm+MvOkW6Ft1Vg0kYRifMsymaZXkc2NiSspvzzak0STm
	 Bz2H1o1hQkL54s3jE8ES0o6w/BsMMMTAREdcHUml/SCA98S5J7IbFTp8O9OVcOGHhC
	 GJFKF2070FpFX4nJhsGsS92MvYGdhvghXYqrYsWn4SnpH/evJx1vSnQTUpRRy8gtvM
	 Tmp8EBT8MoeNaxpgOfuZ8Ai4WTOx7rrL0GA0CniC3TUwcC/maeO1c1SAaur1Zx0hPE
	 UPkKx5Sqm1Klg==
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id BA787F40068;
	Thu,  5 Feb 2026 08:52:36 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Thu, 05 Feb 2026 08:52:36 -0500
X-ME-Sender: <xms:pKCEaZTYTZ4IdYhPmFOtDhYpWfv4VFHVKZqyS-hSNC4z-tE8UR0vew>
    <xme:pKCEaWfpyO5I-lTzDqJVQOdI5AoM4kEpvx0mv0EgMXwJIhd1OJyrVgj7O33_oTnr0
    qNJjcVrzz3R_PAMsVcMZpZEbzO8-mi1x_xqOV80kF4S-1tGt5mHFdE>
X-ME-Received: <xmr:pKCEaZ74g6CGqmIPHCouJ15dBueoscoDiYdrYOV8edikmGPwvoxiCNcWt9fpAw>
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
X-ME-Proxy: <xmx:pKCEaeeur9pRhbizjFCCinU-IuCYrPMXf4IBShFFSog8cvq7XVScQQ>
    <xmx:pKCEaYAfHScjWLu3e9YOFE8w4RCHICCAsBJ9eTDkLVfyndU7yW3xOA>
    <xmx:pKCEaSHx5WhMPKTaoiKiwPhHa0FF22br4dAcmB3NaDUAA6t-_JUcvQ>
    <xmx:pKCEaYip_49tpAQBrIqS3y5WPakF-TN_GGYetR1lV7ES2iPnMSSq-g>
    <xmx:pKCEacs12NYuU7aC8364rHxeHnpUOW0I17oXjZq81pJTM6rj4qukWIfw>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Feb 2026 08:52:34 -0500 (EST)
Date: Thu, 5 Feb 2026 13:52:30 +0000
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
Subject: Re: [PATCHv6 06/17] LoongArch/mm: Align vmemmap to maximal folio size
Message-ID: <aYSgQknBNs5r-Tf5@thinkstation>
References: <20260202155634.650837-1-kas@kernel.org>
 <20260202155634.650837-7-kas@kernel.org>
 <2ce0e684-de54-43ec-be7d-c58bbffb3f4e@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ce0e684-de54-43ec-be7d-c58bbffb3f4e@kernel.org>

On Wed, Feb 04, 2026 at 05:56:45PM +0100, David Hildenbrand (arm) wrote:
> On 2/2/26 16:56, Kiryl Shutsemau wrote:
> > The upcoming change to the HugeTLB vmemmap optimization (HVO) requires
> > struct pages of the head page to be naturally aligned with regard to the
> > folio size.
> > 
> > Align vmemmap to MAX_FOLIO_NR_PAGES.
> > 
> > Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
> > ---
> >   arch/loongarch/include/asm/pgtable.h | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
> > index c33b3bcb733e..f9416acb9156 100644
> > --- a/arch/loongarch/include/asm/pgtable.h
> > +++ b/arch/loongarch/include/asm/pgtable.h
> > @@ -113,7 +113,8 @@ extern unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)];
> >   	 min(PTRS_PER_PGD * PTRS_PER_PUD * PTRS_PER_PMD * PTRS_PER_PTE * PAGE_SIZE, (1UL << cpu_vabits) / 2) - PMD_SIZE - VMEMMAP_SIZE - KFENCE_AREA_SIZE)
> >   #endif
> > -#define vmemmap		((struct page *)((VMALLOC_END + PMD_SIZE) & PMD_MASK))
> > +#define VMEMMAP_ALIGN	max(PMD_SIZE, MAX_FOLIO_NR_PAGES * sizeof(struct page))
> > +#define vmemmap		((struct page *)(ALIGN(VMALLOC_END, VMEMMAP_ALIGN)))
> 
> 
> Same comment, the "MAX_FOLIO_NR_PAGES * sizeof(struct page)" is just black magic here
> and the description of the situation is wrong.
> 
> Maybe you want to pull the magic "MAX_FOLIO_NR_PAGES * sizeof(struct page)" into the core and call it
> 
> #define MAX_FOLIO_VMEMMAP_ALIGN	(MAX_FOLIO_NR_PAGES * sizeof(struct page))
> 
> But then special case it base on (a) HVO being configured in an (b) HVO being possible
> 
> #ifdef HUGETLB_PAGE_OPTIMIZE_VMEMMAP && is_power_of_2(sizeof(struct page)

This would require some kind of asm-offsets.c/bounds.c magic to pull the
struct page size condition to the preprocessor level.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
