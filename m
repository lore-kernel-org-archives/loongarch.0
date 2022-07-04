Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0255F28E1
	for <loongarch@lists.linux.dev>; Mon,  4 Jul 2022 10:29:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A86ABC341D6
	for <loongarch@lists.linux.dev>; Mon,  4 Jul 2022 10:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656930577;
	bh=S1U7c4vumgaGxKIy+Le6U140pOZn3tAuCvMMwQCWlN8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IZwvcqpOF372czI8gtJbB/SdCPkAimnJnkhBW/En4r1NZrW0u2J1+WHMwoUIu+wRU
	 wguCC2iT/oy0oRQ1ii2t/CWWWKkHT57+4BArh3EDutEZMnyVCRPY00KRRfMQQUAYfX
	 qZQMYBk0etV8ZOaN5iy1R5fxXvu4nayOuJEjCWOO7uOEg9eyp7ebCPkLXVQyYWEQ+E
	 Z7yxB0B8Acw5gw6xlxYGCOk6ZRqEc9wpMfy2e4QQBeunLjA6QR+wQ+uAQYE4zFgrE2
	 eqcM8lkUPX7Gykmyv77q5hBMcUWwCursu9QZ7OgG85O4u86lONwQ8TALs1vJWwcImb
	 m9Gt2xlVx7XSQ==
Received: by mail-vs1-f54.google.com with SMTP id o190so8566705vsc.5
        for <loongarch@lists.linux.dev>; Mon, 04 Jul 2022 03:29:37 -0700 (PDT)
X-Gm-Message-State: AJIora8606FCDjrUczT5+yta4MsEDm+alI1OluxaQGHUU8k3XE7yU1ee
	9mnRk9S9d07Y+e2+cWL+5lUxsaOmUURDCRUtVKk=
X-Google-Smtp-Source: AGRyM1u6JhNTB0gLDTipOeQ1swPjdH1oGdRVztg+QzNFmuvStQcIc7FWyLglppo/lfxYQ9Nz+IHL4JIBdjCw/e1muuY=
X-Received: by 2002:a67:f958:0:b0:354:3f56:8a2d with SMTP id
 u24-20020a67f958000000b003543f568a2dmr15408042vsq.59.1656930576462; Mon, 04
 Jul 2022 03:29:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220702080021.1167190-1-chenhuacai@loongson.cn>
 <20220702080021.1167190-4-chenhuacai@loongson.cn> <20220704092658.GA31220@willie-the-truck>
In-Reply-To: <20220704092658.GA31220@willie-the-truck>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 4 Jul 2022 18:29:24 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4qxBsbXN3Si+ovWSidA=GV8bg58cPTbp8Y4UzPwFhY0g@mail.gmail.com>
Message-ID: <CAAhV-H4qxBsbXN3Si+ovWSidA=GV8bg58cPTbp8Y4UzPwFhY0g@mail.gmail.com>
Subject: Re: [PATCH V3 3/4] mm/sparse-vmemmap: Generalise vmemmap_populate_hugepages()
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

On Mon, Jul 4, 2022 at 5:27 PM Will Deacon <will@kernel.org> wrote:
>
> On Sat, Jul 02, 2022 at 04:00:20PM +0800, Huacai Chen wrote:
> > From: Feiyang Chen <chenfeiyang@loongson.cn>
> >
> > Generalise vmemmap_populate_hugepages() so ARM64 & X86 & LoongArch can
> > share its implementation.
> >
> > Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > ---
> >  arch/arm64/mm/mmu.c      | 53 ++++++-----------------
> >  arch/loongarch/mm/init.c | 63 ++++++++-------------------
> >  arch/x86/mm/init_64.c    | 92 ++++++++++++++--------------------------
> >  include/linux/mm.h       |  6 +++
> >  mm/sparse-vmemmap.c      | 54 +++++++++++++++++++++++
> >  5 files changed, 124 insertions(+), 144 deletions(-)
> >
> > diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> > index 626ec32873c6..b080a65c719d 100644
> > --- a/arch/arm64/mm/mmu.c
> > +++ b/arch/arm64/mm/mmu.c
> > @@ -1158,49 +1158,24 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
> >       return vmemmap_populate_basepages(start, end, node, altmap);
> >  }
> >  #else        /* !ARM64_KERNEL_USES_PMD_MAPS */
> > +void __meminit vmemmap_set_pmd(pmd_t *pmd, void *p, int node,
> > +                            unsigned long addr, unsigned long next)
> > +{
> > +     pmd_set_huge(pmd, __pa(p), __pgprot(PROT_SECT_NORMAL));
> > +}
> > +
> > +int __meminit vmemmap_check_pmd(pmd_t *pmd, int node, unsigned long addr,
> > +                             unsigned long next)
> > +{
> > +     vmemmap_verify((pte_t *)pmd, node, addr, next);
> > +     return 1;
> > +}
>
> nit, but please can you use 'pmdp' instead of 'pmd' for the pointers? We're
> pretty consistent elsewhere for arch/arm64 and it makes the READ_ONCE()
> usage easier to follow once functions end up loading the entry.
OK, I will change to pmdp for ARM64, thanks.

Huacai
>
> Thanks,
>
> Will
