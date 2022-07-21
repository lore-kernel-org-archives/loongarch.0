Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DA91FA5
	for <loongarch@lists.linux.dev>; Thu, 21 Jul 2022 02:08:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0823C385A9
	for <loongarch@lists.linux.dev>; Thu, 21 Jul 2022 02:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658369304;
	bh=x2rMvlfF8THw8fAt70svf2hA+mf9vGMD4Y6bBnFyvts=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BLcuIGvOlv1iapA63NjHjKi18FtlUlcvVlm2hlS40e8fIIRrARqJbKTfVfzG4Qffs
	 B6HvNou9eVk3xD2jdldGn2Niu4MzYx2bzH+cVKdLzaXDahzONuKWbzLLJwafHQpkSo
	 mBeDHa5ql/u2NhOBTInZFjWNsKy6ohS4eEcMapbukDziT8olUpLhyfT0cwXHMNbhAN
	 J0oXfPIIf2dIwpicKXsnLqDuAFMU9YwX9/eTZXX0rNr9Gl8LurDhPcYCnTuAm3L9kB
	 KCvxylzgOt6ZF+NZIFZ5zAuCzKpldUze8pXNJ2/aRkgFGXi61VN4ZRhdftKSbZK6JR
	 ctheXKplI4lTA==
Received: by mail-vs1-f44.google.com with SMTP id x125so266357vsb.13
        for <loongarch@lists.linux.dev>; Wed, 20 Jul 2022 19:08:23 -0700 (PDT)
X-Gm-Message-State: AJIora97/Pu5ZWxgBPQsl9q1fZ0U0YR9f4TetNDEzFab1EYZzL2lzk2A
	CC1a+23ua6AxTHaq2RakCcqPKG6qzKSEhCv3CPY=
X-Google-Smtp-Source: AGRyM1vVxa3lqP8AcFV31tQ5vDERIi/melRduGpdj7d9pTPRjhrmeIjSHfa7BiZMsn6SS4xFD7+MeF8wIBRYRpe7hyQ=
X-Received: by 2002:a05:6102:3543:b0:357:3ae7:bbd0 with SMTP id
 e3-20020a056102354300b003573ae7bbd0mr15376874vss.84.1658369302762; Wed, 20
 Jul 2022 19:08:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220704112526.2492342-1-chenhuacai@loongson.cn>
 <20220704112526.2492342-4-chenhuacai@loongson.cn> <20220705092937.GA552@willie-the-truck>
 <CAAhV-H5r8HDaxt8fkO97in5-eH8X9gokVNervmUWn6km4S0e-w@mail.gmail.com>
 <20220706161736.GC3204@willie-the-truck> <CAAhV-H7uY_KiLJRRjj4+8mewcWbuhvC=zDp5VAs03=BLdSMKLw@mail.gmail.com>
 <CAAhV-H6EziBQ=3SveRvaPxHfbsGpmYrhVHfuBkpLJXn-t-uTZA@mail.gmail.com> <4216f48f-fdf1-ec1e-b963-6f7fe6ba0f63@redhat.com>
In-Reply-To: <4216f48f-fdf1-ec1e-b963-6f7fe6ba0f63@redhat.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 21 Jul 2022 10:08:10 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5chctqBLayAJZOker_Li1db2NTcT9qwMCUYK44tBHVSg@mail.gmail.com>
Message-ID: <CAAhV-H5chctqBLayAJZOker_Li1db2NTcT9qwMCUYK44tBHVSg@mail.gmail.com>
Subject: Re: [PATCH V4 3/4] mm/sparse-vmemmap: Generalise vmemmap_populate_hugepages()
To: David Hildenbrand <david@redhat.com>, Will Deacon <will@kernel.org>, 
	Dan Williams <dan.j.williams@intel.com>, 
	Sudarshan Rajagopalan <quic_sudaraja@quicinc.com>
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

On Wed, Jul 20, 2022 at 5:34 PM David Hildenbrand <david@redhat.com> wrote:
>
> On 14.07.22 14:34, Huacai Chen wrote:
> > Oh, Sudarshan Rajagopalan's Email has changed, Let's update.
> >
> > Huacai
> >
> > On Fri, Jul 8, 2022 at 5:47 PM Huacai Chen <chenhuacai@kernel.org> wrote:
> >>
> >> +Dan Williams
> >> +Sudarshan Rajagopalan
> >>
> >> On Thu, Jul 7, 2022 at 12:17 AM Will Deacon <will@kernel.org> wrote:
> >>>
> >>> On Tue, Jul 05, 2022 at 09:07:59PM +0800, Huacai Chen wrote:
> >>>> On Tue, Jul 5, 2022 at 5:29 PM Will Deacon <will@kernel.org> wrote:
> >>>>> On Mon, Jul 04, 2022 at 07:25:25PM +0800, Huacai Chen wrote:
> >>>>>> diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
> >>>>>> index 33e2a1ceee72..6f2e40bb695d 100644
> >>>>>> --- a/mm/sparse-vmemmap.c
> >>>>>> +++ b/mm/sparse-vmemmap.c
> >>>>>> @@ -686,6 +686,60 @@ int __meminit vmemmap_populate_basepages(unsigned long start, unsigned long end,
> >>>>>>       return vmemmap_populate_range(start, end, node, altmap, NULL);
> >>>>>>  }
> >>>>>>
> >>>>>> +void __weak __meminit vmemmap_set_pmd(pmd_t *pmd, void *p, int node,
> >>>>>> +                                   unsigned long addr, unsigned long next)
> >>>>>> +{
> >>>>>> +}
> >>>>>> +
> >>>>>> +int __weak __meminit vmemmap_check_pmd(pmd_t *pmd, int node, unsigned long addr,
> >>>>>> +                                    unsigned long next)
> >>>>>> +{
> >>>>>> +     return 0;
> >>>>>> +}
> >>>>>> +
> >>>>>> +int __meminit vmemmap_populate_hugepages(unsigned long start, unsigned long end,
> >>>>>> +                                      int node, struct vmem_altmap *altmap)
> >>>>>> +{
> >>>>>> +     unsigned long addr;
> >>>>>> +     unsigned long next;
> >>>>>> +     pgd_t *pgd;
> >>>>>> +     p4d_t *p4d;
> >>>>>> +     pud_t *pud;
> >>>>>> +     pmd_t *pmd;
> >>>>>> +
> >>>>>> +     for (addr = start; addr < end; addr = next) {
> >>>>>> +             next = pmd_addr_end(addr, end);
> >>>>>> +
> >>>>>> +             pgd = vmemmap_pgd_populate(addr, node);
> >>>>>> +             if (!pgd)
> >>>>>> +                     return -ENOMEM;
> >>>>>> +
> >>>>>> +             p4d = vmemmap_p4d_populate(pgd, addr, node);
> >>>>>> +             if (!p4d)
> >>>>>> +                     return -ENOMEM;
> >>>>>> +
> >>>>>> +             pud = vmemmap_pud_populate(p4d, addr, node);
> >>>>>> +             if (!pud)
> >>>>>> +                     return -ENOMEM;
> >>>>>> +
> >>>>>> +             pmd = pmd_offset(pud, addr);
> >>>>>> +             if (pmd_none(READ_ONCE(*pmd))) {
> >>>>>> +                     void *p;
> >>>>>> +
> >>>>>> +                     p = vmemmap_alloc_block_buf(PMD_SIZE, node, altmap);
> >>>>>> +                     if (p) {
> >>>>>> +                             vmemmap_set_pmd(pmd, p, node, addr, next);
> >>>>>> +                             continue;
> >>>>>> +                     } else if (altmap)
> >>>>>> +                             return -ENOMEM; /* no fallback */
> >>>>>
> >>>>> Why do you return -ENOMEM if 'altmap' here? That seems to be different to
> >>>>> what we currently have on arm64 and it's not clear to me why we're happy
> >>>>> with an altmap for the pmd case, but not for the pte case.
> >>>> The generic version is the same as X86. It seems that ARM64 always
> >>>> fallback whether there is an altmap, but X86 only fallback in the no
> >>>> altmap case. I don't know the reason of X86, can Dan Williams give
> >>>> some explaination?
> >>>
> >>> Right, I think we need to understand the new behaviour here before we adopt
> >>> it on arm64.
> >> Hi, Dan,
> >> Could you please tell us the reason? Thanks.
> >>
> >> And Sudarshan,
> >> You are the author of adding a fallback mechanism to ARM64,  do you
> >> know why ARM64 is different from X86 (only fallback in no altmap
> >> case)?
>
> I think that's a purely theoretical issue: I assume that in any case we
> care about, the altmap should be reasonably sized and aligned such that
> this will always succeed.
>
> To me it even sounds like the best idea to *consistently* fail if there
> is no more space in the altmap, even if we'd have to fallback to PTE
> (again, highly unlikely that this is relevant in practice). Could
> indicate an altmap-size configuration issue.

Does David's explanation make things clear? Moreover, I think Dan's
dedicated comments "no fallback" implies that his design is carefully
considered. So I think the generic version using the X86 logic is just
OK.

Huacai
>
> --
> Thanks,
>
> David / dhildenb
>
>
