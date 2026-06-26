Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CE53E6DC3
	for <loongarch@lists.linux.dev>; Fri, 26 Jun 2026 08:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782462197; cv=none; b=VVaZy++ZeVzK52ZBVTruO2nCBSNl3Ne+liyN16J5ffgVf+mamFG9mKk478WWFcEagH3/YmTPV1vEzwdmhkR90yOwGBSC/5HmUKLpFeDp7kSf9RkZXm4GuUWiSxCszA4H4AAbUJAA86fX67cDRNJl/ihJaeIYt4SGt4XQjOy93wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782462197; c=relaxed/simple;
	bh=TTPY7fD5KfktYCjBoFVmvA6SO6F5OQWS4MhJR0JdB/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ho5FDaZdyjsw4mRGbogUsavmhm4ywHCC8K4o0JZBvWG+TNV2KuGxk5Kolv8gedXoWA/rZPmt+is5AMHtLecicnvho8STQCBw0pqtteZibgq8ml5qYpYLeXcS1RRFct7m/6fTSgFT7xllTkjhyuhgYgUEyG8JLF9yeC6muHcBg7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q0iz61wX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q0iz61wX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50D041F000E9;
	Fri, 26 Jun 2026 08:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782462196;
	bh=BmCZQsSXsYfJR1VBDG7KzxqBWjPcEA12Brcw1hCcOr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q0iz61wX8mF1P/AT5iS0RguEKJoHnJbaf7dG2Xaw/wVTBi4SxVOBIVG9crP2DYbSS
	 9B5P3SKEr70iokd3WQ+CCaYah+LPidn/GAJZipn4uhCWTywct1mVsz3YZ/ftCiTQrE
	 qIKkvlTg8Pcl/XL4UTF/vAUtFR5Hf2bQTiCbSFFd3gE54FeQAVMkILpX728AtqliRP
	 9e4GR/CJT3k+Jc+rLFHTS9efO5Exl1wE+5HVjEfsZQBkSR7kbXAmF71M2tvjQui4IF
	 S6ag1cun9+W4Xim0JhLSIlJgXd4VVCduvxBVUGsqrgxZsPOvLnnwFdNX8U6/QzpZig
	 6wlgRknzBcAQg==
Date: Fri, 26 Jun 2026 11:23:05 +0300
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
Message-ID: <aj426bA-YiOKt06m@kernel.org>
References: <20260621145919.1453-1-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260621145919.1453-1-ekffu200098@gmail.com>

On Sun, Jun 21, 2026 at 11:59:10PM +0900, Sang-Heon Jeon wrote:
> The memblock API guarantees that for_each_mem_range() and
> for_each_mem_pfn_range() never return an invalid range, meaning start is
> always less than end.
> 
> Several memblock callers still have unnecessary invalid range checks in
> their loop bodies, so remove them.
> 
> Sang-Heon Jeon (6):
>   arm64: mm: remove unreachable invalid range check in
>     kasan_init_shadow()
>   LoongArch: remove unreachable invalid range check in kasan_init()
>   riscv: remove unreachable invalid range check in
>     create_linear_mapping_page_table()
>   riscv: remove unreachable invalid range check in kasan_init()
>   mm: remove unnecessary empty range check in
>     early_calculate_totalpages()
>   mm/hugetlb: remove unnecessary empty range check in
>     hugetlb_bootmem_set_nodes()

I queued this for inclusion into memblock tree.

>  arch/arm64/mm/kasan_init.c     | 3 ---
>  arch/loongarch/mm/kasan_init.c | 3 ---
>  arch/riscv/mm/init.c           | 2 --
>  arch/riscv/mm/kasan_init.c     | 3 ---
>  mm/hugetlb.c                   | 3 +--
>  mm/mm_init.c                   | 3 +--
>  6 files changed, 2 insertions(+), 15 deletions(-)
> 
> -- 
> 2.43.0
> 

-- 
Sincerely yours,
Mike.
