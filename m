Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CC81A9F91;
	Sun, 15 Feb 2026 23:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771197259; cv=none; b=k9nZ6f6a2/OJtg56r+7rjNyMHZl59OENNYU31C2AVN5/JJ7nNSiC3yUuQcRcWt/qfrTopddeZs/wx/U/BXlajGs3sjrZpwkO+8y9Js7UTYsiIO2PZzHMmpCEVeDLq2U6KEc+/yBmLFxCtlCjVAQ8VgTpl1dCxdetSGbs8aNoesM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771197259; c=relaxed/simple;
	bh=F0LAK3YWrgUb4yAqU75Ie/YcGfuVcgaDhx8BTx15Wbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A7HFue/SWUAJSY5FPoAj0jV8R6ELmqJWR7aRvNQTlt8FflQm2N1mBac1LTi8A2ulFK0KilyObaeJWOHK0frHBxiOQOFp76POq3IdW3BbtACOxH1qbfjjBtKq8qzqTJW4Z0+g2L+gSchR010e6P9SrQ6INWqps3x0izKM/Ld8who=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Tq38ZBkw; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Tq38ZBkw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Orx67w0OdZsiD/sxqMgXoLutvDapJy44psufStBNd34=; b=Tq38ZBkwHinLdgKHuJ2F6wb0Lw
	nuKJ0utimPTEs5necEg4OiOp93omwKGRX71185wTqzVACW8X/Btm5RQFtI2l9t/0LXp/dZlyaIOLM
	GehWSFz/SBsnkXJyZynrq8iJyDwnyPiZ75nYhPdeisBx/mBVpuALLKyyepWJzVzLGdsoKKXUpVTrP
	UiG1h5BkIqArcpktGdrJGEQfcuC7wHIfdw2rR8FSTBse3ekOr3x0SqqKT2TOwpGA16cFQh9WQ4mcJ
	1LELudn4ti3SdkfASP4GSMU16UMLBkxEsG2Ob5cpm0F+uWJ/zPQ4zd/VuW57a7wmiDUp7TXRaurH9
	jJ6U3oAw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrlJH-00000001duk-2IlM;
	Sun, 15 Feb 2026 23:13:51 +0000
Date: Sun, 15 Feb 2026 23:13:51 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@redhat.com>,
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
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCHv6 08/17] mm: Make page_zonenum() use head page
Message-ID: <aZJTLwV2SaaKu1k_@casper.infradead.org>
References: <20260202155634.650837-1-kas@kernel.org>
 <20260202155634.650837-9-kas@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202155634.650837-9-kas@kernel.org>

On Mon, Feb 02, 2026 at 03:56:24PM +0000, Kiryl Shutsemau wrote:
> With the upcoming changes to HVO, a single page of tail struct pages
> will be shared across all huge pages of the same order on a node. Since
> huge pages on the same node may belong to different zones, the zone
> information stored in shared tail page flags would be incorrect.
> 
> Always fetch zone information from the head page, which has unique and
> correct zone flags for each compound page.

You're right that different pages in the same folio can have different
zone number.  But does it matter ... or to put it another way, why is
returning the zone number of the head page the correct way to resolve
this?

Arguably, the caller is asking for the zone number of _this page_, and
does not care about the zone number of the head page.  It would be good
to have a short discussion of this in the commit message (but probably
not worth putting this in a comment).
