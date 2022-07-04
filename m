Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29D223B5
	for <loongarch@lists.linux.dev>; Mon,  4 Jul 2022 09:27:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9AECC3411E;
	Mon,  4 Jul 2022 09:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656926826;
	bh=hH3spFHQdwa+gBgAQj1zYN9yiX7A+GyWbQNkSUNtmqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tPgH5MviYy9ljQGlgk2YGIiFgQ8NkEu/yXE76JqtS8NDw6dJRXw0NALaVYioW0QRv
	 sO7GRsJSFEvCL37fwZTrUV1KRtLzjUd1qcAjSbNHezIvUyPFhpNOdR7R65xhA1Bzna
	 xdh4ctJKv6zSFXk1dw18xyL9kStkntDYzzEnIPp/Gw4DO5bMUPhipv3D099StIfaYg
	 op2O9GNXgwghxWt0W6k1nPUVzGeYaifFqQdn7NcCRy5D7iijvfoOasn133QL4+KyD7
	 qdeWKZuMu8Hl5DMVRekLenYO0rMF8Cmq8lY0fT/jDIcYYM8DJiIfO1RJD7jq2fzpI6
	 aGn3RxHukrnKg==
Date: Mon, 4 Jul 2022 10:26:58 +0100
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
Subject: Re: [PATCH V3 3/4] mm/sparse-vmemmap: Generalise
 vmemmap_populate_hugepages()
Message-ID: <20220704092658.GA31220@willie-the-truck>
References: <20220702080021.1167190-1-chenhuacai@loongson.cn>
 <20220702080021.1167190-4-chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220702080021.1167190-4-chenhuacai@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Sat, Jul 02, 2022 at 04:00:20PM +0800, Huacai Chen wrote:
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
> +void __meminit vmemmap_set_pmd(pmd_t *pmd, void *p, int node,
> +			       unsigned long addr, unsigned long next)
> +{
> +	pmd_set_huge(pmd, __pa(p), __pgprot(PROT_SECT_NORMAL));
> +}
> +
> +int __meminit vmemmap_check_pmd(pmd_t *pmd, int node, unsigned long addr,
> +				unsigned long next)
> +{
> +	vmemmap_verify((pte_t *)pmd, node, addr, next);
> +	return 1;
> +}

nit, but please can you use 'pmdp' instead of 'pmd' for the pointers? We're
pretty consistent elsewhere for arch/arm64 and it makes the READ_ONCE()
usage easier to follow once functions end up loading the entry.

Thanks,

Will
