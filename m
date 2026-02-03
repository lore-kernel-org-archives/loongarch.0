Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C9A226CF1
	for <loongarch@lists.linux.dev>; Tue,  3 Feb 2026 03:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770089771; cv=none; b=TV72dPvwT3H+Im5TyUzfY3JqbNpxjJmkYNsKFmuQeFVFEU5NKQtKnZ+4RpG2zIPybSAZ/oQrgc3yIjAttixauxIpS9YP3+8vN08VTYj6PBRqg4Y2MrHX38XwfsJhmap9EI6NdReZHmLJ4XjoZH+HJ1pCDxFucxTlovhNqRgj2vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770089771; c=relaxed/simple;
	bh=hYz6UnZl98fvkQAs9RG2iuggv8a2xR1Tt8nipqzQHTs=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=EI0Em27Teh3jXomj0Xywoj59s6YtkAw4Uy+pwJ/ydQ6ulfzok6G4eDc3/tOO8NrWATV2JtUYSanQxlALQgkiUO6k02bkh0bymqqm9I4b3OL7jTwBiuTlmPexb5odeBfDtAHp28XRJ95dS9LRmYMOtYaDof0FKMMekAPX77tH+Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DhVo4INP; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DhVo4INP"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770089766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KJxP6n3p44LkH03IkDqQsgS+GpBo2zU5MsWmp0JlB5A=;
	b=DhVo4INPC4Ons8xaBCpPzhhwL+sntJgmv9IgIoulLAZYf4pzz3ZpnHm6k400LdHZDLpymV
	RE4bhGg4+b+2pq+2qsmy0OYtR5wulCSX8hs4mU+edMcJEJJyb/vV+yKryUukukDMjvejJ5
	5aEU0wJ5Ls+w6TvtZLrP2w07z99oZXw=
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCHv6 09/17] mm/sparse: Check memmap alignment for
 compound_info_has_mask()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20260202155634.650837-10-kas@kernel.org>
Date: Tue, 3 Feb 2026 11:35:24 +0800
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
Message-Id: <C310A603-DB7F-4140-B045-7F1E3CC98C05@linux.dev>
References: <20260202155634.650837-1-kas@kernel.org>
 <20260202155634.650837-10-kas@kernel.org>
To: Kiryl Shutsemau <kas@kernel.org>
X-Migadu-Flow: FLOW_OUT



> On Feb 2, 2026, at 23:56, Kiryl Shutsemau <kas@kernel.org> wrote:
> 
> If page->compound_info encodes a mask, it is expected that vmemmap to be
> naturally aligned to the maximum folio size.
> 
> Add a VM_BUG_ON() to check the alignment.
> 
> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
> Acked-by: Zi Yan <ziy@nvidia.com>

Reviewed-by: Muchun Song <muchun.song@linux.dev>


