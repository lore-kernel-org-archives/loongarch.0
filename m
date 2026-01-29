Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E863570AB
	for <loongarch@lists.linux.dev>; Thu, 29 Jan 2026 03:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769655655; cv=none; b=fDIIv8Kb9BhJBt1ExaeYCYG8iwL84fFQ4Navj/CXIgHZ6NQdLjcOdvvnVYE92mDiJz/DcC6M6YPpN5jW7LBGksG8KTcQvs3ET9Xi9KJygZ2KEdueSiSRDUQDqaEojSySLI05iXpIgCJhGPK6S43daZTdUDR8qbUFn4TROTzVCXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769655655; c=relaxed/simple;
	bh=NRZ9PhVlXB6FNUcerK6/GSwv8BhzYewqQTIuiwxRw1o=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=WhMbuxWA9n0ESbBEmiVCfM5ZE0tr5dIMJL7EvB5Te5qUw2NdBqA0oVj8PjzEJHZ1eI6QVRoee42urb+0bqror49DfWtBYW1J7zBpkLyrOXA8QHOukckjOSi6RRIo08B5lK12IQeTAIzGYlPdvkbKeEXt8dYXn/G2McA9trXBpWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kGqKVANv; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kGqKVANv"
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769655650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iLgsJJ2DJ+t6b/hazprnCVEL54/CGelmOLPvH7wJObs=;
	b=kGqKVANvKr8PZg++xZhG7iMds+BlyQUvRkODZXgyoNViIuAV23ppanBy4xDGgWkoto+6Ia
	qN+ffnsYEqzRetMcVO4Mcvf+Vsqa2mdwGQBVnS2PiSH7oAYdUwxJwOV58otZFJelHA6tG2
	KKoBUdiQdqErcwgsiLlY8mNzRmPEOC0=
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCHv5 09/17] mm/sparse: Check memmap alignment for
 compound_info_has_mask()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20260128135500.22121-10-kas@kernel.org>
Date: Thu, 29 Jan 2026 11:00:07 +0800
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
Content-Transfer-Encoding: quoted-printable
Message-Id: <B4674CF0-7534-462B-A761-D9124234BFE4@linux.dev>
References: <20260128135500.22121-1-kas@kernel.org>
 <20260128135500.22121-10-kas@kernel.org>
To: Kiryl Shutsemau <kas@kernel.org>
X-Migadu-Flow: FLOW_OUT



> On Jan 28, 2026, at 21:54, Kiryl Shutsemau <kas@kernel.org> wrote:
>=20
> If page->compound_info encodes a mask, it is expected that vmemmap to =
be
> naturally aligned to the maximum folio size.
>=20
> Trigger a BUG() for CONFIG_DEBUG_VM=3Dy or WARN() otherwise.
>=20
> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
> Acked-by: Zi Yan <ziy@nvidia.com>
> ---
> mm/sparse.c | 13 +++++++++++++
> 1 file changed, 13 insertions(+)
>=20
> diff --git a/mm/sparse.c b/mm/sparse.c
> index b5b2b6f7041b..9c0f4015778c 100644
> --- a/mm/sparse.c
> +++ b/mm/sparse.c
> @@ -600,6 +600,19 @@ void __init sparse_init(void)
> BUILD_BUG_ON(!is_power_of_2(sizeof(struct mem_section)));
> 	memblocks_present();
>=20
> + 	if (compound_info_has_mask()) {
> + 		unsigned long alignment;
> + 		bool aligned;
> +
> + 		alignment =3D MAX_FOLIO_NR_PAGES * sizeof(struct page);
> + 		aligned =3D IS_ALIGNED((unsigned long) pfn_to_page(0), =
alignment);
> +
> + 		if (IS_ENABLED(CONFIG_DEBUG_VM))
> + 			BUG_ON(!aligned);
> + 		else
> + 			WARN_ON(!aligned);

Since you=E2=80=99ve fixed all the problematic architectures, I don=E2=80=99=
t believe
we=E2=80=99ll ever hit the WARN or BUG here anymore.

I think we can now simplify the code further and just use VM_BUG_ON:
if any architecture changes in the future, the misalignment will be
caught during testing, so we won=E2=80=99t need to worry about it at =
run-time.

> + 	}
> +
> 	pnum_begin =3D first_present_section_nr();
> 	nid_begin =3D sparse_early_nid(__nr_to_section(pnum_begin));
>=20
> --=20
> 2.51.2
>=20

