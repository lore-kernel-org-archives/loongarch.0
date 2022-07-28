Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E8B1101
	for <loongarch@lists.linux.dev>; Thu, 28 Jul 2022 09:25:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38C3EC433D6
	for <loongarch@lists.linux.dev>; Thu, 28 Jul 2022 09:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659000307;
	bh=7pq/2Z60GYWXwFYneAORoRndD27DanVgbiYGcaR6gLk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ffMQFUj302iUtf3No5xdZTKyr38PfuNjv35jUAOBYxbQpNOaYu5z1qie/PPrwudVp
	 rbor1vghIWM3G77lJrAH1ar/K9X8EzGnc9e8/UWwcqBQUJClCdBAXm5ooTEhvWwumk
	 nqWNMZknE4HIUKhEpEMEaSDf5b46pcxY5XBNcKVtb9D7GXve33Rx3pdiwh9bXodyFe
	 XEg3bRfmARBEBSYJiMwKWc/Xd5bITzO99wuWYIPrtYKdWbh4BZVGGcGNj9G+JeF806
	 5OBqXWTaqiT/tRN1vGY4LeozcX0cGiLJGgnRmws4Ijuhc3+ZSH82D/StYdeoCaOheq
	 jGKkfn69WhEcg==
Received: by mail-vs1-f42.google.com with SMTP id x125so1057956vsb.13
        for <loongarch@lists.linux.dev>; Thu, 28 Jul 2022 02:25:07 -0700 (PDT)
X-Gm-Message-State: AJIora/z8xFvegfzFCPU1jAmYqPmksnK1qJd6euDtO6SwwoX2Z8Gzyet
	FE1EtaHvc1jtrqi8vwU06vheHNpQXxlvsWwb4VE=
X-Google-Smtp-Source: AGRyM1vyH+nsbqzZjGAJ6qBx3wXBi1+dUz0jOf3JsHZ5+CvaVM8g+iopMUmY8qoZiCb4cLiRSfo3Wa34/mRjVsyJuuo=
X-Received: by 2002:a67:d599:0:b0:358:6371:4cfb with SMTP id
 m25-20020a67d599000000b0035863714cfbmr6080587vsj.78.1659000306050; Thu, 28
 Jul 2022 02:25:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220721130419.1904711-1-chenhuacai@loongson.cn>
 <20220721130419.1904711-4-chenhuacai@loongson.cn> <20220722091604.GD18125@willie-the-truck>
In-Reply-To: <20220722091604.GD18125@willie-the-truck>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 28 Jul 2022 17:24:52 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7sWvcVCNtzKscnYK5q0+MqdZiuywuy=_7oB7iLN9pQTA@mail.gmail.com>
Message-ID: <CAAhV-H7sWvcVCNtzKscnYK5q0+MqdZiuywuy=_7oB7iLN9pQTA@mail.gmail.com>
Subject: Re: [PATCH V5 3/4] mm/sparse-vmemmap: Generalise vmemmap_populate_hugepages()
To: Will Deacon <will@kernel.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Arnd Bergmann <arnd@arndb.de>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, loongarch@lists.linux.dev, 
	linux-arch <linux-arch@vger.kernel.org>, Xuefeng Li <lixuefeng@loongson.cn>, 
	Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linux-MM <linux-mm@kvack.org>, "open list:MIPS" <linux-mips@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	Feiyang Chen <chenfeiyang@loongson.cn>
Content-Type: text/plain; charset="UTF-8"

Hi, Will,

On Fri, Jul 22, 2022 at 5:16 PM Will Deacon <will@kernel.org> wrote:
>
> On Thu, Jul 21, 2022 at 09:04:18PM +0800, Huacai Chen wrote:
> > diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
> > index 0abcb0a5f1b5..eafd084b8e19 100644
> > --- a/mm/sparse-vmemmap.c
> > +++ b/mm/sparse-vmemmap.c
> > @@ -694,6 +694,69 @@ int __meminit vmemmap_populate_basepages(unsigned long start, unsigned long end,
> >       return vmemmap_populate_range(start, end, node, altmap, NULL);
> >  }
> >
> > +void __weak __meminit vmemmap_set_pmd(pmd_t *pmd, void *p, int node,
> > +                                   unsigned long addr, unsigned long next)
> > +{
> > +}
> > +
> > +int __weak __meminit vmemmap_check_pmd(pmd_t *pmd, int node, unsigned long addr,
> > +                                    unsigned long next)
> > +{
> > +     return 0;
> > +}
> > +
> > +int __meminit vmemmap_populate_hugepages(unsigned long start, unsigned long end,
> > +                                      int node, struct vmem_altmap *altmap)
> > +{
> > +     unsigned long addr;
> > +     unsigned long next;
> > +     pgd_t *pgd;
> > +     p4d_t *p4d;
> > +     pud_t *pud;
> > +     pmd_t *pmd;
> > +
> > +     for (addr = start; addr < end; addr = next) {
> > +             next = pmd_addr_end(addr, end);
> > +
> > +             pgd = vmemmap_pgd_populate(addr, node);
> > +             if (!pgd)
> > +                     return -ENOMEM;
> > +
> > +             p4d = vmemmap_p4d_populate(pgd, addr, node);
> > +             if (!p4d)
> > +                     return -ENOMEM;
> > +
> > +             pud = vmemmap_pud_populate(p4d, addr, node);
> > +             if (!pud)
> > +                     return -ENOMEM;
> > +
> > +             pmd = pmd_offset(pud, addr);
> > +             if (pmd_none(READ_ONCE(*pmd))) {
> > +                     void *p;
> > +
> > +                     p = vmemmap_alloc_block_buf(PMD_SIZE, node, altmap);
> > +                     if (p) {
> > +                             vmemmap_set_pmd(pmd, p, node, addr, next);
> > +                             continue;
> > +                     } else if (altmap) {
> > +                             /*
> > +                              * No fallback: In any case we care about, the
> > +                              * altmap should be reasonably sized and aligned
> > +                              * such that vmemmap_alloc_block_buf() will always
> > +                              * succeed. If there is no more space in the altmap
> > +                              * and we'd have to fallback to PTE (highly unlikely).
>
> Can you tweak the last couple of sentences please, as they don't make sense
> to me? To be specific, I'd suggest replacing:
>
>   "If there is no more space in the altmap and we'd have to fallback to PTE
>   (highly unlikely). That could indicate an altmap-size configuration
>   issue."
>
> with something like:
>
>   "For consistency with the PTE case, return an error here as failure could
>    indicate a configuration issue with the size of the altmap."
>
> With that:
>
> Acked-by: Will Deacon <will@kernel.org>
OK, I will send V5, thanks.

Huacai
>
> Will
