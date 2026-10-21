Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792567420;
	b=oJxZgpwFRYu2Ab/2xElE4K6u4p2rlSMvhfQfeRyYllDxmqkPnGgHf7+OwL4TU+D2AaVj
	 wNeS8FjC9Jfh9ncSoA9A7uBgTbdMzwftm+rfFHiRZ75WUouyMUwbbVuY7zLCTLX6HbDKY
	 9hZ/mmiM+TPn0taTtJSQFYvULjtj4RruMZzlgVRKr01/kCNoL0ZZkmKyBqUPh09fvHd2Z
	 uJOwsgsbnHGky1iZkeDGWd2pN9D51qXHhuUt7fvIohHr1yI91TBjtip8PONG9UBlteaX8
	 Ed83DjjOLJsRffGncGyl4vVTJFi7CepUzCU0ot5TH/lRXfjKMmxZSS5I/N3ImoPuryA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792567420;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=V+x0xV+m3eowwe+TjUl+RzSOGyPXS0tHlwPVyxSEpj4=;
	b=wS2sBHO7QFmGZM2Hxx67gKEipb5e2qMVyImgq9ByvWdYiwVI8iJX7+Lj0+Ukz+JR8GkX
	 4Z8itxtwO0RnHQfOKWg6+Rc5ART+YtXDsHKcVYhqH7odYQd6n2ay7wUKJekrr4O9JSBZx
	 wdU7ysWzCwItmb8tSj5obHmJlvnAfd6+lRV0Y7KsdKwEWdS4j/pBrCAkKvfd+7BO+2HV4
	 AO5R5FCfQw6fL+B5NRlr/Ox1zBmNPV/1P0gDOs0llEIDKZFcDxpi5vQL04iStQMzBfSeL
	 H/9KUc6gP89/C4nxI9FOqfmeM0OF+Nm3zXaaR8uejiUBO8C9ks0nLHkHLUUe7Jt8f6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="Uupz13u/";
	arc=none smtp.remote-ip=95.215.58.7
Received: from mta1.migadu.com (out-7.mta1.migadu.com [95.215.58.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10B4606A31B
	for <loongarch@lists.linux.dev>; Wed, 21 Oct 2026 07:23:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E10B4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Uupz13u/
X-Envelope-To: loongarch@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=vAkhRjN3hG8UHJdcYxjaq6dYwJWiOCLtDD81+R6ZVdg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792567416; v=1; x=1793172216;
 b=Uupz13u/huvTPXtfj5UL2RUGGuj9gRhFyayYMngHIrAKvI8yhLQIqXdU6dWE68GUunb+D0ZD
 kin0NqoDCIYojx7nTOOJyR9EKkAXWwbV2iZDncmz6DzaqGderKfeuTJM7SkqmT1uA8M07J/8GFe
 ayf2WyUfnncmWYct1aNB5XUw=
X-Envelope-To: loongarch@lists.linux.dev
Received: by mta11.migadu.com with ESMTPS id 281913562dc98e21;
	Wed, 21 Oct 2026 07:23:36 +0000
X-Mizu-Trace-ID: 281913562dc98e21
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [RFC PATCH] LoongArch: mm: avoid backing vmemmap beyond max_pfn
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261021062115.116922-1-guanwentao@uniontech.com>
Date: Wed, 21 Oct 2026 15:23:21 +0800
Cc: chenhuacai@kernel.org,
 kernel@xen0n.name,
 loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org,
 akpm@linux-foundation.org,
 rppt@kernel.org,
 david@kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <EB4B2A6B-147E-4E7A-BAD7-A7C4699AF46E@linux.dev>
References: <20261021062115.116922-1-guanwentao@uniontech.com>
To: Wentao Guan <guanwentao@uniontech.com>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 21, 2026, at 14:21, Wentao Guan <guanwentao@uniontech.com> =
wrote:
>=20
> A PMD maps 32MiB of vmemmap on LoongArch with 16KiB base pages, while =
a
> 512MiB section only needs 2MiB.  vmemmap_populate() is called for each
> section and vmemmap_populate_hugepages() installs a PMD mapping for =
the
> whole PMD, so the last PMD also backs struct pages for PFNs beyond
> max_pfn.
>=20
> On a 34GiB system 160MiB of vmemmap is mapped although 136MiB is
> needed.  The extra 24MiB describes PFNs that do not exist.

Your commit messages are very detailed, but I don't really understand =
the
problem you're trying to solve. What issue did you run into, and what =
was
the resulting impact?

Thanks,
Muchun

>=20
> Other architectures handle this differently.  On x86, arm64 with 4KiB
> pages, and riscv, the PMD covers exactly one section's vmemmap, so the
> huge page path never maps beyond the populated range; x86 tracks
> partially used PMDs with PAGE_UNUSED for memory hotremove.  arm64 uses
> base pages for 16KiB and 64KiB kernels.  s390 deliberately keeps using
> 1MiB frames even for partially used PMDs because vmemmap_populate() is
> called per section and falling back would add page tables.  powerpc
> radix falls back to base pages only when the altmap cannot back a full
> PMD or the allocation fails, and powerpc hash maps the vmemmap with =
the
> linear mapping page size, which can exceed a section as well.
>=20
> With 16KiB pages the LoongArch PMD is 16 times the vmemmap of one
> section.  Moving the whole vmemmap to base pages, as arm64 does for
> 16KiB and 64KiB, would also remove the tail, but it would give up PMD
> mappings for the 128MiB that is fully populated.  Use base pages only
> for the PMD that extends beyond pfn_to_page(max_pfn) and keep huge
> mappings for the rest.
>=20
> The altmap case is left alone because max_pfn does not describe it.
>=20
> Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
> ---
> arch/loongarch/mm/init.c | 5 +++++
> 1 file changed, 5 insertions(+)
>=20
> diff --git a/arch/loongarch/mm/init.c b/arch/loongarch/mm/init.c
> index 4b46c5d30708d..bb7a17bdb0e51 100644
> --- a/arch/loongarch/mm/init.c
> +++ b/arch/loongarch/mm/init.c
> @@ -146,6 +146,11 @@ int __meminit vmemmap_populate(unsigned long =
start, unsigned long end,
> #if CONFIG_PGTABLE_LEVELS =3D=3D 2
> 	return vmemmap_populate_basepages(start, end, node, NULL);
> #else
> + 	unsigned long vmemmap_end =3D (unsigned =
long)pfn_to_page(max_pfn);
> +
> + 	if (!altmap && (start & PMD_MASK) + PMD_SIZE > vmemmap_end)
> + 		return vmemmap_populate_basepages(start, end, node, =
NULL);
> +
> 	return vmemmap_populate_hugepages(start, end, node, NULL);
> #endif
> }
> --=20
> 2.39.5
>=20

