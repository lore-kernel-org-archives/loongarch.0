Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913B52F34
	for <loongarch@lists.linux.dev>; Tue,  5 Jul 2022 09:29:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD127C341C7;
	Tue,  5 Jul 2022 09:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657013385;
	bh=kGkmp8dPxzCCK114+0OM+AKFI00s3XSfhycOZJPJOlk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ulmzVpFf4aXRHwq+z6RYvnhTexooB8AMl3S7I2TeN59zwM5eunXVPWgFl9cM57OpW
	 bq6hNbJ1xNpiDZ+Exf8NMU8/+15BNEH8FrQViQJJ2SVWdH9Ahk1ZhB7Rrudygq2+J3
	 bR3rdhguoBudEGLYe5xClBPRn4MDtesG1dATflzPN8t6I4Swf5DAmW3Qxe4pvh79Sm
	 TpdEgrft+3/r5kInwNblNRWn4DzPuHFvVvjZDJ7xs4FZZDYrrun1Sc3RqyAiS9bJSi
	 1bujS052C+AeT6ccnqqZWlaIenIvvTFUk579henLIV1MojIa08mDP2VPX5QcBLYoRt
	 LU5PxHa+sIh5A==
Date: Tue, 5 Jul 2022 10:29:37 +0100
From: Will Deacon <will@kernel.org>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	loongarch@lists.linux.dev, linux-arch@vger.kernel.org,
	Xuefeng Li <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Feiyang Chen <chenfeiyang@loongson.cn>
Subject: Re: [PATCH V4 3/4] mm/sparse-vmemmap: Generalise
 vmemmap_populate_hugepages()
Message-ID: <20220705092937.GA552@willie-the-truck>
References: <20220704112526.2492342-1-chenhuacai@loongson.cn>
 <20220704112526.2492342-4-chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220704112526.2492342-4-chenhuacai@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, Jul 04, 2022 at 07:25:25PM +0800, Huacai Chen wrote:
> From: Feiyang Chen <chenfeiyang@loongson.cn>
> 
> Generalise vmemmap_populate_hugepages() so ARM64 & X86 & LoongArch can
> share its implementation.
> 
> Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>  arch/arm64/mm/mmu.c      | 53 ++++++-----------------
>  arch/loongarch/mm/init.c | 63 ++++++++-------------------
>  arch/x86/mm/init_64.c    | 92 ++++++++++++++--------------------------
>  include/linux/mm.h       |  6 +++
>  mm/sparse-vmemmap.c      | 54 +++++++++++++++++++++++
>  5 files changed, 124 insertions(+), 144 deletions(-)
> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 626ec32873c6..b080a65c719d 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1158,49 +1158,24 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
>  	return vmemmap_populate_basepages(start, end, node, altmap);
>  }
>  #else	/* !ARM64_KERNEL_USES_PMD_MAPS */
> +void __meminit vmemmap_set_pmd(pmd_t *pmdp, void *p, int node,
> +			       unsigned long addr, unsigned long next)
> +{
> +	pmd_set_huge(pmdp, __pa(p), __pgprot(PROT_SECT_NORMAL));
> +}
> +
> +int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node, unsigned long addr,
> +				unsigned long next)
> +{
> +	vmemmap_verify((pte_t *)pmdp, node, addr, next);
> +	return 1;
> +}
> +
>  int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
>  		struct vmem_altmap *altmap)
>  {
> -	unsigned long addr = start;
> -	unsigned long next;
> -	pgd_t *pgdp;
> -	p4d_t *p4dp;
> -	pud_t *pudp;
> -	pmd_t *pmdp;
> -
>  	WARN_ON((start < VMEMMAP_START) || (end > VMEMMAP_END));
> -	do {
> -		next = pmd_addr_end(addr, end);
> -
> -		pgdp = vmemmap_pgd_populate(addr, node);
> -		if (!pgdp)
> -			return -ENOMEM;
> -
> -		p4dp = vmemmap_p4d_populate(pgdp, addr, node);
> -		if (!p4dp)
> -			return -ENOMEM;
> -
> -		pudp = vmemmap_pud_populate(p4dp, addr, node);
> -		if (!pudp)
> -			return -ENOMEM;
> -
> -		pmdp = pmd_offset(pudp, addr);
> -		if (pmd_none(READ_ONCE(*pmdp))) {
> -			void *p = NULL;
> -
> -			p = vmemmap_alloc_block_buf(PMD_SIZE, node, altmap);
> -			if (!p) {
> -				if (vmemmap_populate_basepages(addr, next, node, altmap))
> -					return -ENOMEM;
> -				continue;
> -			}
> -
> -			pmd_set_huge(pmdp, __pa(p), __pgprot(PROT_SECT_NORMAL));
> -		} else
> -			vmemmap_verify((pte_t *)pmdp, node, addr, next);
> -	} while (addr = next, addr != end);
> -
> -	return 0;
> +	return vmemmap_populate_hugepages(start, end, node, altmap);
>  }
>  #endif	/* !ARM64_KERNEL_USES_PMD_MAPS */


I think the arm64 change is mostly ok (thanks!), but I have a question about
the core code you're introducing:

> diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
> index 33e2a1ceee72..6f2e40bb695d 100644
> --- a/mm/sparse-vmemmap.c
> +++ b/mm/sparse-vmemmap.c
> @@ -686,6 +686,60 @@ int __meminit vmemmap_populate_basepages(unsigned long start, unsigned long end,
>  	return vmemmap_populate_range(start, end, node, altmap, NULL);
>  }
>  
> +void __weak __meminit vmemmap_set_pmd(pmd_t *pmd, void *p, int node,
> +				      unsigned long addr, unsigned long next)
> +{
> +}
> +
> +int __weak __meminit vmemmap_check_pmd(pmd_t *pmd, int node, unsigned long addr,
> +				       unsigned long next)
> +{
> +	return 0;
> +}
> +
> +int __meminit vmemmap_populate_hugepages(unsigned long start, unsigned long end,
> +					 int node, struct vmem_altmap *altmap)
> +{
> +	unsigned long addr;
> +	unsigned long next;
> +	pgd_t *pgd;
> +	p4d_t *p4d;
> +	pud_t *pud;
> +	pmd_t *pmd;
> +
> +	for (addr = start; addr < end; addr = next) {
> +		next = pmd_addr_end(addr, end);
> +
> +		pgd = vmemmap_pgd_populate(addr, node);
> +		if (!pgd)
> +			return -ENOMEM;
> +
> +		p4d = vmemmap_p4d_populate(pgd, addr, node);
> +		if (!p4d)
> +			return -ENOMEM;
> +
> +		pud = vmemmap_pud_populate(p4d, addr, node);
> +		if (!pud)
> +			return -ENOMEM;
> +
> +		pmd = pmd_offset(pud, addr);
> +		if (pmd_none(READ_ONCE(*pmd))) {
> +			void *p;
> +
> +			p = vmemmap_alloc_block_buf(PMD_SIZE, node, altmap);
> +			if (p) {
> +				vmemmap_set_pmd(pmd, p, node, addr, next);
> +				continue;
> +			} else if (altmap)
> +				return -ENOMEM; /* no fallback */

Why do you return -ENOMEM if 'altmap' here? That seems to be different to
what we currently have on arm64 and it's not clear to me why we're happy
with an altmap for the pmd case, but not for the pte case.

Will
