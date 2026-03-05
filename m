Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D159382372;
	Thu,  5 Mar 2026 10:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772707174; cv=none; b=QPRquy4g3W90gTfl9PYZ5oRWqrjpotB0tEkfI5oXsUjKvCu4OegXbKYG+XY5tLHihCxCkD3ZYcJ4c/nmV4eSWV4WBWDaaqTyIVsPC0s37s7gmd7Cq/UzdxeFQb3zcAfmlq5Nj8KHAaWuPW/ManljaKg6o7UbwzweZGaZ4KuNFM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772707174; c=relaxed/simple;
	bh=yLfptqTDk4ppieFzMpM96UgVSqab44mE8I9wfLOH+bc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NHBFfPVkvVYIbblwBSwUEZwFWaBEFeLcJj/wU6NEej+Rr+XH6pvpY8uWYdz2g94r/OuBPCmrDRQClkblauSt694T8Wc6Ef42eUspj+Lecl8Ny/qmyFryctCy2TPsspNMEhwbMQHNAD56m8L6IHnOwqK1wgOBEKOmtNiEhhhplkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IQbCwe5N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IQbCwe5N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5AA6C116C6;
	Thu,  5 Mar 2026 10:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772707173;
	bh=yLfptqTDk4ppieFzMpM96UgVSqab44mE8I9wfLOH+bc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IQbCwe5Ngtpjc11y94f+iiN0bnx2c6hl5J9XXzGCcGX5Ek/NgjSyC6js5DKRzdIRW
	 gfofayEar1e+FGrRJjJZ8J4hGI6Jc4d3HEysbPobJ6KbR9bepk8mYYNRsdMuNNfhER
	 V8uO2ZExYPS3uS5ncQsdOW/mVOpIu+dxbq0zOm0fgkKf3Ue1nbrE1CxOkZqfNwFFzh
	 JeUTDD9DDcdMJ2a2RqXgJKAKUAQNVaxDCeNSpcatjVu0b3R700v6+VuqYcy4EFKKg/
	 3v5j0nmNtuk8N4pINihLyhRnfFdYYz0evRLP1BaSa0rFuzt6rFPh78W49y2/cZUfXo
	 5bXuXtwxubnHg==
Message-ID: <6b95ce49-383a-4a73-bdea-c3b8c36e9686@kernel.org>
Date: Thu, 5 Mar 2026 11:39:26 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv7 12/18] mm/hugetlb: Remove fake head pages
Content-Language: en-US
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <muchun.song@linux.dev>, David Hildenbrand <david@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Usama Arif <usamaarif642@gmail.com>,
 Frank van der Linden <fvdl@google.com>
Cc: Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi Yan <ziy@nvidia.com>,
 Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, kernel-team@meta.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
References: <20260227194302.274384-1-kas@kernel.org>
 <20260227194302.274384-13-kas@kernel.org>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
In-Reply-To: <20260227194302.274384-13-kas@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/27/26 20:42, Kiryl Shutsemau (Meta) wrote:
> From: Kiryl Shutsemau <kas@kernel.org>
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
> Allocate a single page of initialized tail struct pages per zone
> per order in the vmemmap_tails[] array in struct zone. All huge pages of
> that order in the zone share this tail page, mapped read-only into their
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

LGTM, glad you found a way to do the per-zone tails and not pessimize
page_zonenum().

Reviewed-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>

