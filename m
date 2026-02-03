Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC0A395243
	for <loongarch@lists.linux.dev>; Tue,  3 Feb 2026 09:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770112282; cv=none; b=MYvxHmc2C+b640x9BpIzYxVlNrKVBTt3OMwaquhjhAbvCZlq7+q28CadFBaEiFCQ68XnGtVlTeeIgyHedVEaq0gMvtuzMGghXTngqhGTvdIlKcRZGxygKuXV4OWjLG99Q0rroR+Kic51gq857HEy7FVwBPyZsNkCu0YOatzNZcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770112282; c=relaxed/simple;
	bh=JB37f7aWRV58dvpxkW8UNrxVvq8Wiv2PvuKT2/vvQio=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=GDhW8r5fAG+h79szuy8JYd+AnMlqgg6SQUVx7jE3774dJ4S7dlRxTiELRrJfe8+9sk6kHekByB3mhhP+o+m9AAJ5JwAqBaNA8chMUAZrxU3IIfGWRVaV068RKKlhYPQiPOiMX7T6QXfZUTntnbsO8Sw8uEQfTSRV5M1cLnsizIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ESMSiqS5; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ESMSiqS5"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770112277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9LMV/UqSLQLqZskyhJdWEgGaTiL2QvED1GhTKVUM7dY=;
	b=ESMSiqS5ORHZuZjWRltobDFH6KzSxY4kRV2ycmTIHL0HadXikXjnfkOnrlbsP1Fbvat2zN
	JZTwdZTssymJkx5X6YALhYhxOhEzwJWov3PuvlVQpLQ6w9EYcqwmDE8Gi3nwvqdiTDy9DL
	vJ9KphjIGx1nE1AgsHx+O2A8hJQWtX0=
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCHv6 11/17] mm/hugetlb: Remove fake head pages
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20260202155634.650837-12-kas@kernel.org>
Date: Tue, 3 Feb 2026 17:50:34 +0800
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Matthew Wilcox <willy@infradead.org>,
 Usama Arif <usamaarif642@gmail.com>,
 Frank van der Linden <fvdl@google.com>,
 Oscar Salvador <osalvador@suse.de>,
 Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Zi Yan <ziy@nvidia.com>,
 Baoquan He <bhe@redhat.com>,
 Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 kernel-team@meta.com,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org,
 loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Message-Id: <1FFEED62-343D-433C-BB81-EB646D066AC9@linux.dev>
References: <20260202155634.650837-1-kas@kernel.org>
 <20260202155634.650837-12-kas@kernel.org>
To: Kiryl Shutsemau <kas@kernel.org>
X-Migadu-Flow: FLOW_OUT



> On Feb 2, 2026, at 23:56, Kiryl Shutsemau <kas@kernel.org> wrote:
> 
> HugeTLB Vmemmap Optimization (HVO) reduces memory usage by freeing most
> vmemmap pages for huge pages and remapping the freed range to a single
> page containing the struct page metadata.
> 
> With the new mask-based compound_info encoding (for power-of-2 struct
> page sizes), all tail pages of the same order are now identical
> regardless of which compound page they belong to. This means the tail
> pages can be truly shared without fake heads.
> 
> Allocate a single page of initialized tail struct pages per NUMA node
> per order in the vmemmap_tails[] array in pglist_data. All huge pages of
> that order on the node share this tail page, mapped read-only into their
> vmemmap. The head page remains unique per huge page.
> 
> Redefine MAX_FOLIO_ORDER using ilog2(). The define has to produce a
> compile-constant as it is used to specify vmemmap_tail array size.
> For some reason, compiler is not able to solve get_order() at
> compile-time, but ilog2() works.
> 
> Avoid PUD_ORDER to define MAX_FOLIO_ORDER as it adds dependency to
> <linux/pgtable.h> which generates hard-to-break include loop.
> 
> This eliminates fake heads while maintaining the same memory savings,
> and simplifies compound_head() by removing fake head detection.
> 
> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>

Reviewed-by: Muchun Song <muchun.song@linux.dev>


