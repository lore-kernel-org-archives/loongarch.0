Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DF644E04F
	for <loongarch@lists.linux.dev>; Fri, 27 Feb 2026 19:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772221330; cv=none; b=nWFFdo8VC5/lE5wAhR9SfSX5sNqyhdox48xDXM6zqBuTHzKnaPzVEKht6moeiTSvRWbN+OKBmdwZKGc0jq4LRmwTqBl/A0tMY78fI03QzonEXIWlLpw3YK0CXblkmyUU74GQWuEL9vOEG5GL+vcTK/BK+5qU3AwWw23NqbBuRCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772221330; c=relaxed/simple;
	bh=qix5xWTZDms/A62vFZUqjLyjGKPSA6VqMVFDJq6TWjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FS4rx65YrsgfBVyyjXbTZ1qI8ASLNWUu9LxQeWwsnZpL7IWdVOwIeQbGxE5kiOVtHhSHJezhd8VAPUBjnBL91bH7dpPIJSxMZADZHtB7bFVlyRlNdgBZMHSH2dbGWwuzF7xtNmbKlvX2dHyI73WbAwF8gxICjUmys1AecI4c4fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NRJvXF3f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NRJvXF3f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8A62C19421;
	Fri, 27 Feb 2026 19:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772221329;
	bh=qix5xWTZDms/A62vFZUqjLyjGKPSA6VqMVFDJq6TWjI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NRJvXF3fbr382lsZe850hbuq9j2JDOKV2XZPmh+z/rg6YPJmsZJ0SVFAT9XEUXPkc
	 pOXr0I9yUmoutFoqqNA2ucqYDU/wdEGiKNP2owFrRl8s2rNtFR40MafvGtb60kyBA+
	 840cibMCM3XKWjfw+XGo2sdfV9rNrTjo3Q1QzLLXyDx7upGDirSvn5LqSiAnCLffDe
	 3pw/54OCYfvwLR38FAIfiqkwgSprW+Z10tr4sP60IbptX8QkIH0GxoX3hkZxmsUo3i
	 X41ngQO5Z2WYS8My+sW8C1KEtjCaVh8m3TYYPNZbdEyC/2p1ohHKmvE2mxoI0piXiu
	 pGLCAQqEJNz7A==
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id 0F16FF40068;
	Fri, 27 Feb 2026 14:42:08 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Fri, 27 Feb 2026 14:42:08 -0500
X-ME-Sender: <xms:j_OhaZ7T8xofTbSV_wxzruxN-nXeWOHmR9ZUD1N8fdum7Ka9GtazMQ>
    <xme:j_OhaanINzpVNXlZDJYg638MRgHKQ46XBK26arkcwRiDKPsDRV2RWCU4v7MgZ3jwX
    _VssFV-r2qgouJQB_7JssLJfMR2vG6D0MleT2NV1wp59l5i4lkiVAk>
X-ME-Received: <xmr:j_OhabhTJmjGZzRPAgdx-N67m3ARSYHeGQPgi0a6vxPrAPS9vrUeatHTMZkmKQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeelkeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepmfhirhihlhcu
    ufhhuhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnhepueeijeeiffekheeffffftdekleefleehhfefhfduheejhedvffeluedvudefgfek
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirh
    hilhhlodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieduudeivdeiheeh
    qddvkeeggeegjedvkedqkhgrsheppehkvghrnhgvlhdrohhrghesshhhuhhtvghmohhvrd
    hnrghmvgdpnhgspghrtghpthhtohepheegpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoh
    epmhhutghhuhhnrdhsohhngheslhhinhhugidruggvvhdprhgtphhtthhopegurghvihgu
    sehrvgguhhgrthdrtghomhdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrggurd
    horhhgpdhrtghpthhtohepuhhsrghmrggrrhhifheigedvsehgmhgrihhlrdgtohhmpdhr
    tghpthhtohepfhhvughlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehoshgrlhhvrg
    guohhrsehsuhhsvgdruggvpdhrtghpthhtoheprhhpphhtsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehvsggrsghkrgesshhushgvrdgtii
X-ME-Proxy: <xmx:kPOhafnUoUDPlFCZDk2Q6YSXDMzCj3KxenrCgMhAaoYIYmX6Qrgxvw>
    <xmx:kPOhaSqBA9KT8bWFyqwoAM-s_hzFRN_uj898EqG-swi9NYuIvCnGjg>
    <xmx:kPOhaYNCdJ1cD37tHA4NIBWRC7GtH4Iy1Sg8pe6g-XyC34N49zVwYg>
    <xmx:kPOhaUJcDtBW1voctED0w0hVn5SxnOGPTX87wunEpNeAe432yBjBzQ>
    <xmx:kPOhaf1qJWEWG-0cmHQxVXVAKA_1czZ0-hfziyUmT2Cem0dtfjvqENGh>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Feb 2026 14:42:05 -0500 (EST)
Date: Fri, 27 Feb 2026 19:42:01 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
	Muchun Song <muchun.song@linux.dev>, David Hildenbrand <david@redhat.com>, 
	Matthew Wilcox <willy@infradead.org>, Usama Arif <usamaarif642@gmail.com>, 
	Frank van der Linden <fvdl@google.com>
Cc: Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Zi Yan <ziy@nvidia.com>, Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, kernel-team@meta.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCHv7 00/17] mm: Eliminate fake head pages from vmemmap
 optimization
Message-ID: <aaHzKykadJwN7tF1@thinkstation>
References: <20260202155634.650837-1-kas@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202155634.650837-1-kas@kernel.org>

I've screwed up threading in the submission, please ignore.
I will resend properly.

Sorry for this mess. I should have figured out mail by now :/

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
