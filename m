Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDF434753A;
	Thu, 30 Apr 2026 03:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777519559; cv=none; b=OwNTz+mdhpchiMD+k9yr+S2vGRLy97zYFdotsbFFTtTQAZZD1NLOhbD6dXGSL8i6hKKa5xa71EXJJ33YjNfBEEZcjGW9wUf7nfIugaY+imHekhEHcqlqU5kjEer7cNrcPa76Oh7aWlccGbQxipNl6oo6v+OvCb2FfivdAS42Ldc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777519559; c=relaxed/simple;
	bh=Gdp4vkpY3OWdrZmj6MnO4StGWD3Debys2l2muIOhkFA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=J4i0mGyZKZnmSU1NFeKuq0lP2JYUVUdBu56LKtXo13/K+Tbq9OvbQIc9qUBepcpSIZwiQGmPDS5im3OjucFEilye6EJclQ75MWTHJ5xdHZQLsr4NWIPKFI//U5n8BLbjVWvZ+WOWToMguY20n4cqvfS9OqA51J8KhvDtbREY9pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sCAQnthw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sCAQnthw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3783C2BCC4;
	Thu, 30 Apr 2026 03:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519558;
	bh=Gdp4vkpY3OWdrZmj6MnO4StGWD3Debys2l2muIOhkFA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=sCAQnthw0OckKXZO6x/qlAXlkm3PLrDJ5UCQPIaxPTmeHXivI8BUebUCMqXtrSrS5
	 ycbZA6dI+TYjbkodgrkOGHjHHCi3vWD9sR/+qZxRozBig6oZj0B4quAoubPGs1jyyt
	 PG6udE2/TwpTXZH1+QlMFNDx6O0VW/7j5EmGWb+ZOet5eD+DEcj3LIRbpsxwkXJyq4
	 1dIKTmZznzAI1yNeEJ2sgsW6b3umMsdpQHghvmJyFdZ/QNVV8/VS4eFOTe5NCMEBAQ
	 LVMpV68lCDytpgtZlgzNQLnEzJdciZiKTtVC9Gh/yuSwg6kNujg/UbaaOArleSR8dZ
	 zcS9ACifyzHeg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FCD33809A07;
	Thu, 30 Apr 2026 03:25:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCHv7 RESEND 00/17] mm: Eliminate fake head pages from vmemmap
 optimization
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <177751951380.2274119.11967025926304588817.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:13 +0000
References: <20260227194302.274384-1-kas@kernel.org>
In-Reply-To: <20260227194302.274384-1-kas@kernel.org>
To: Kiryl Shutsemau (Meta) <kas@kernel.org>
Cc: linux-riscv@lists.infradead.org, akpm@linux-foundation.org,
 muchun.song@linux.dev, david@kernel.org, willy@infradead.org,
 usamaarif642@gmail.com, fvdl@google.com, osalvador@suse.de, rppt@kernel.org,
 vbabka@suse.cz, lorenzo.stoakes@oracle.com, ziy@nvidia.com, bhe@redhat.com,
 mhocko@suse.com, hannes@cmpxchg.org, corbet@lwn.net, chenhuacai@kernel.org,
 kernel@xen0n.name, palmer@dabbelt.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, kernel-team@meta.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 loongarch@lists.linux.dev

Hello:

This series was applied to riscv/linux.git (fixes)
by Andrew Morton <akpm@linux-foundation.org>:

On Fri, 27 Feb 2026 19:42:38 +0000 you wrote:
> This series removes "fake head pages" from the HugeTLB vmemmap
> optimization (HVO) by changing how tail pages encode their relationship
> to the head page.
> 
> It simplifies compound_head() and page_ref_add_unless(). Both are in the
> hot path.
> 
> [...]

Here is the summary with links:
  - [PATCHv7,01/18] mm: Move MAX_FOLIO_ORDER definition to mmzone.h
    https://git.kernel.org/riscv/c/a2c77ec320a9
  - [PATCHv7,02/18] mm: Change the interface of prep_compound_tail()
    https://git.kernel.org/riscv/c/f0369fb13619
  - [PATCHv7,03/18] mm: Rename the 'compound_head' field in the 'struct page' to 'compound_info'
    https://git.kernel.org/riscv/c/d50569612c29
  - [PATCHv7,04/18] mm: Move set/clear_compound_head() next to compound_head()
    https://git.kernel.org/riscv/c/67c79a5af051
  - [PATCHv7,05/18] riscv/mm: Align vmemmap to maximal folio size
    https://git.kernel.org/riscv/c/476849b0fba4
  - [PATCHv7,06/18] LoongArch/mm: Align vmemmap to maximal folio size
    https://git.kernel.org/riscv/c/2969b42c8f99
  - [PATCHv7,07/18] mm: Rework compound_head() for power-of-2 sizeof(struct page)
    https://git.kernel.org/riscv/c/8c846c879e22
  - [PATCHv7,08/18] mm/sparse: Check memmap alignment for compound_info_has_mask()
    https://git.kernel.org/riscv/c/9f94db4c7eaa
  - [PATCHv7,09/18] mm/hugetlb: Defer vmemmap population for bootmem hugepages
    https://git.kernel.org/riscv/c/209e6d9eb13a
  - [PATCHv7,10/18] mm/hugetlb: Refactor code around vmemmap_walk
    https://git.kernel.org/riscv/c/c0b495b91a47
  - [PATCHv7,11/18] x86/vdso: Undefine CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP for vdso32
    https://git.kernel.org/riscv/c/76351f2f0c27
  - [PATCHv7,12/18] mm/hugetlb: Remove fake head pages
    https://git.kernel.org/riscv/c/622026e87c40
  - [PATCHv7,13/18] mm: Drop fake head checks
    https://git.kernel.org/riscv/c/32c440d67e6c
  - [PATCHv7,14/18] hugetlb: Remove VMEMMAP_SYNCHRONIZE_RCU
    https://git.kernel.org/riscv/c/01b1d0ffb6f7
  - [PATCHv7,15/18] mm/hugetlb: Remove hugetlb_optimize_vmemmap_key static key
    https://git.kernel.org/riscv/c/da3e2d1ca43d
  - [PATCHv7,16/18] mm: Remove the branch from compound_head()
    https://git.kernel.org/riscv/c/66b2a3d9ae46
  - [PATCHv7,17/18] hugetlb: Update vmemmap_dedup.rst
    (no matching commit)
  - [PATCHv7,18/18] mm/slab: Use compound_head() in page_slab()
    https://git.kernel.org/riscv/c/8231e4c040fb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


