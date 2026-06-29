Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301B73BADB1
	for <loongarch@lists.linux.dev>; Mon, 29 Jun 2026 11:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782733450; cv=none; b=uPf8iiqjJUvBAonea0kVf/yUYRt0PlBLFgWeS+S7Gauw6YNCTQn84gHoddmELpjgEIdQ31fY+mX2XnW+CAnmoF0CHHezKUG+oAJJ7/BjMp5lkgn6m7I9gghcwgVsYKvr+Pg+Pio6V2vHiHR13VumbTzHMP6OiEVcki7Pfavwsl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782733450; c=relaxed/simple;
	bh=+gIhZGUGGo7IJ0/XYxjtwQXhRUbMyTRwS992Ojb0MHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eduSzELLs6gW5nGuTyyXS0FZ7H4nBh8EJw2wFuH/aOZyNj5O/2iPbaKM0LxImvkFA8im9C85fZi6lAmS/j7K3gzvvAtu/IgMDzkZnIIYSm4oGy6unhNOhstmtkwhuAwhWG9Y1BAzJl9q6ViyOFbXjDq0C5oR6puAIakoGYvl4sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q8m5WZPQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q8m5WZPQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8D281F000E9;
	Mon, 29 Jun 2026 11:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782733448;
	bh=ViaMG4AIx4t7Xw8EOKV5lY2S4wNOCDcLNhNIuR/tVoE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q8m5WZPQxys7TASSEPS79b1PS7Camd9Fn+c6d1C9gq57MCQiYrcQnCXQfgL5Pom18
	 DEi/W04AGewzD/rKoMQlj7PH7ZlvfhgT5wCxco8mN/yozzeDJebmnwHsmAjUc92Hvw
	 6FvQmlN57DCT6ekazGvEXvtaVtlZGacM99DDCOSxpOBVSleTe4irqCX5KbtC2izNKF
	 T291dor9anDtABM3b/yxgkDP56ANzslcvn4NGksr9xxTxzQ33O68zYsFM+1kAbKewL
	 8f2NZFEXGGeHuNzx86QM2uiAaWdYbAx+u9ZKEshlHOlDMKPf26u4dffwBuDK6k7Dw4
	 85OiP+UwZqwrw==
Date: Mon, 29 Jun 2026 14:43:57 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Will Deacon <will@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	David Hildenbrand <david@kernel.org>,
	Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	WANG Xuerui <kernel@xen0n.name>
Subject: Re: [PATCH 0/6] treewide: remove unnecessary invalid range checks in
 memblock iteration loops
Message-ID: <akJafRKJJBd5Jrv0@kernel.org>
References: <20260621145919.1453-1-ekffu200098@gmail.com>
 <aj426bA-YiOKt06m@kernel.org>
 <CABFDxME8wej3m8T5gn8y4dmpOLZutm=tDTa7ZcfhbWwScTu_5Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABFDxME8wej3m8T5gn8y4dmpOLZutm=tDTa7ZcfhbWwScTu_5Q@mail.gmail.com>

On Fri, Jun 26, 2026 at 07:59:22PM +0900, Sang-Heon Jeon wrote:
> On Fri, Jun 26, 2026 at 5:23 PM Mike Rapoport <rppt@kernel.org> wrote:
> >
> > On Sun, Jun 21, 2026 at 11:59:10PM +0900, Sang-Heon Jeon wrote:
> > > The memblock API guarantees that for_each_mem_range() and
> > > for_each_mem_pfn_range() never return an invalid range, meaning start is
> > > always less than end.
> > >
> > > Several memblock callers still have unnecessary invalid range checks in
> > > their loop bodies, so remove them.
> > >
> > > Sang-Heon Jeon (6):
> > >   arm64: mm: remove unreachable invalid range check in
> > >     kasan_init_shadow()
> > >   LoongArch: remove unreachable invalid range check in kasan_init()
> > >   riscv: remove unreachable invalid range check in
> > >     create_linear_mapping_page_table()
> > >   riscv: remove unreachable invalid range check in kasan_init()
> > >   mm: remove unnecessary empty range check in
> > >     early_calculate_totalpages()
> > >   mm/hugetlb: remove unnecessary empty range check in
> > >     hugetlb_bootmem_set_nodes()
> >
> > I queued this for inclusion into memblock tree.
> 
> Thank you, Mike.
> 
> Could you please review and queue this patch [1] as well? It does the
> same kind of clean up, I just missed it at the time.

Can you please resend them all as a single set?
 
> [1] https://lore.kernel.org/all/20260626032902.703944-1-ekffu200098@gmail.com/
> 
> > >  arch/arm64/mm/kasan_init.c     | 3 ---
> > >  arch/loongarch/mm/kasan_init.c | 3 ---
> > >  arch/riscv/mm/init.c           | 2 --
> > >  arch/riscv/mm/kasan_init.c     | 3 ---
> > >  mm/hugetlb.c                   | 3 +--
> > >  mm/mm_init.c                   | 3 +--
> > >  6 files changed, 2 insertions(+), 15 deletions(-)
> > >
> > > --
> > > 2.43.0
> > >
> >
> > --
> > Sincerely yours,
> > Mike.
> 
> Best Regards,
> Sang-Heon Jeon

-- 
Sincerely yours,
Mike.
