Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662AA336EC5
	for <loongarch@lists.linux.dev>; Thu, 29 Jan 2026 07:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769670251; cv=none; b=BXPFCowVq8DZIXIYc62YGD+ulQCYOdxw9FWp2Pba428CVt442hKmZnPtlbH+fnzn+lL5/i9B4fCtV+BDWQRmcH96SViPOcrMMGF5Yg3qxSMlalRonI2AfDis/XWqgtzXmLybPTKEZwwX6ZDiGsioka/iORjLdytryd3B+ZCiVkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769670251; c=relaxed/simple;
	bh=cPzl9zJeJmoSKjfHPK5mtg5Ff4GhMD/bOuGqJKt3wnc=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Yr9y+ONZOuP4osfNdjyqDhszz6ISh4v3ehe0A6zsWeHO4niDzU9E6Mh5b1MtMgeRayFBYjsYeF+8AYXmOyszO9Jvjmpab1Eri5gXwP/PGAvKBLGJ3VEsU9q59c1GocgihdNwMvXOrAU0V1VZh9c0G2+HPONpdLtySiI0Dos5rUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Iob+/9N6; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Iob+/9N6"
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769670247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3vg92+QaCjCV3/Bar3U+6CnYR1oFAyAXYUL9A8jeWm8=;
	b=Iob+/9N6mglmQ5CwLaS9ocAUEvMwsKem7aRvOHuqJ5HnZvpj1vwXZDUrnsWiKKeNk39mkq
	UFbqDvLd2nu/cRKHcmggetWBLn3vX8rXwHqI8Rpjn1DgVQV7NLjb4HAmSLVSB61+LJXKgu
	aJVVdIpvm/M8OWL50qQK1YgMS9HnhjY=
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
In-Reply-To: <5AFAE2FC-7274-4A23-AE92-797D5B69AA8B@nvidia.com>
Date: Thu, 29 Jan 2026 15:03:21 +0800
Cc: Kiryl Shutsemau <kas@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Matthew Wilcox <willy@infradead.org>,
 Usama Arif <usamaarif642@gmail.com>,
 Frank van der Linden <fvdl@google.com>,
 Oscar Salvador <osalvador@suse.de>,
 Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
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
Message-Id: <8CDE3AB8-EF51-4D53-A1D2-6084A7613E9A@linux.dev>
References: <20260128135500.22121-1-kas@kernel.org>
 <20260128135500.22121-10-kas@kernel.org>
 <B4674CF0-7534-462B-A761-D9124234BFE4@linux.dev>
 <3DA11168-5E37-4CE9-9934-CD1CAF3085D6@nvidia.com>
 <1A08D224-E1AC-4FE5-B1D0-1BAE2D5FF31E@linux.dev>
 <5AFAE2FC-7274-4A23-AE92-797D5B69AA8B@nvidia.com>
To: Zi Yan <ziy@nvidia.com>
X-Migadu-Flow: FLOW_OUT



> On Jan 29, 2026, at 11:29, Zi Yan <ziy@nvidia.com> wrote:
>=20
> On 28 Jan 2026, at 22:23, Muchun Song wrote:
>=20
>>> On Jan 29, 2026, at 11:10, Zi Yan <ziy@nvidia.com> wrote:
>>>=20
>>> On 28 Jan 2026, at 22:00, Muchun Song wrote:
>>>=20
>>>>> On Jan 28, 2026, at 21:54, Kiryl Shutsemau <kas@kernel.org> wrote:
>>>>>=20
>>>>> If page->compound_info encodes a mask, it is expected that vmemmap =
to be
>>>>> naturally aligned to the maximum folio size.
>>>>>=20
>>>>> Trigger a BUG() for CONFIG_DEBUG_VM=3Dy or WARN() otherwise.
>>>>>=20
>>>>> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
>>>>> Acked-by: Zi Yan <ziy@nvidia.com>
>>>>> ---
>>>>> mm/sparse.c | 13 +++++++++++++
>>>>> 1 file changed, 13 insertions(+)
>>>>>=20
>>>>> diff --git a/mm/sparse.c b/mm/sparse.c
>>>>> index b5b2b6f7041b..9c0f4015778c 100644
>>>>> --- a/mm/sparse.c
>>>>> +++ b/mm/sparse.c
>>>>> @@ -600,6 +600,19 @@ void __init sparse_init(void)
>>>>> BUILD_BUG_ON(!is_power_of_2(sizeof(struct mem_section)));
>>>>> memblocks_present();
>>>>>=20
>>>>> +  if (compound_info_has_mask()) {
>>>>> +   unsigned long alignment;
>>>>> +   bool aligned;
>>>>> +
>>>>> +   alignment =3D MAX_FOLIO_NR_PAGES * sizeof(struct page);
>>>>> +   aligned =3D IS_ALIGNED((unsigned long) pfn_to_page(0), =
alignment);
>>>>> +
>>>>> +   if (IS_ENABLED(CONFIG_DEBUG_VM))
>>>>> +   BUG_ON(!aligned);
>>>>> +   else
>>>>> +   WARN_ON(!aligned);
>>>>=20
>>>> Since you=E2=80=99ve fixed all the problematic architectures, I =
don=E2=80=99t believe
>>>> we=E2=80=99ll ever hit the WARN or BUG here anymore.
>>>>=20
>>>> I think we can now simplify the code further and just use =
VM_BUG_ON:
>>>> if any architecture changes in the future, the misalignment will be
>>>> caught during testing, so we won=E2=80=99t need to worry about it =
at run-time.
>>>>=20
>>>=20
>>> VM_WARN_ON should be sufficient, since bots should report warnings
>>> from any patch/change.
>>=20
>> I=E2=80=99m not sure a WARN will get developers=E2=80=99 attention, =
since the message
>> is unlikely to have any visible consequences and only fires on
>> allocations with a special order.
>=20
> If a developer misses the WARN and the patch gets into linux-mm or =
linux-next,
> kernel test robot runs selftests on the kernel and reports any =
warnings
> to the mailing list. Do we have any related test in selftests/mm? That =
should
> help us catch anything if a developer does not catch it.

I looked at the selftest and it doesn=E2=80=99t seem to have a test that
allocates at MAX_FOLIO_ORDER and checks that it works correctly.

>=20
> Best Regards,
> Yan, Zi


