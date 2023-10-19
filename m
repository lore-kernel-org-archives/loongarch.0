Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F03127449
	for <loongarch@lists.linux.dev>; Thu, 19 Oct 2023 13:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+IMmcpQ"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-991c786369cso1276395566b.1
        for <loongarch@lists.linux.dev>; Thu, 19 Oct 2023 06:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697721755; x=1698326555; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R8cshwpkgCLbTspjqCkooWC3GYTc/d734V8fjxUCe9U=;
        b=O+IMmcpQ3o8FZoeZE1iJvcmjJ+QlcIIFPgq3KonH4H+H4AkB4wJXgYp5RRA9E86rCV
         362Z5R2h/dNHAId0I269Wgu1r33Hio3NkOuH1btBtOy9qn39wz6dPksttnovhsyUkKsH
         uJcD/zd2sYc/xmrVGMZkQuD9y8G1qEuSNrj7YrrW0pAJYb/mXMvrRHSEVF+RVpOn/yDy
         pT+/Znfm61RUZjakR2dJSaOrK2rEo5lY4h02ao5RYOlLD8KVwuuYdJfhrW3tE970tmkm
         cC2o/HFcMPiTCsoLMvIXuz1h2vByyVzZ8vwf9MYf3MZrKyadz67PGhY7eneHUl5dNh7N
         W2bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697721755; x=1698326555;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R8cshwpkgCLbTspjqCkooWC3GYTc/d734V8fjxUCe9U=;
        b=WUNvlvBD135fbEjDxbUpjYhjGEp88QpE5CtqfVzBWFoF/9iJxV6mWugWeJtMnVrBIV
         dA0P3gGg/+H4jrBHsuAhgV2rnnWTld6WRlvphraovdi/87Igpn12Hjtqo/chnDjmq5cj
         ogfdzVqKtFzjj2w9mOtoP9Wq0Aze21q8d4b6/Af0a3pOcPKAnb6Q+gKWguR9bfCUuOOL
         crdcb7hwVmX31G6KZJG1sdJrdJYFKy8DghuXn/iMFP7vO1Le1c/4esL3WMh79je4DOs3
         pr5RcGp39mkJqF4MSbDJ42BLP+KIUTd8WkETULNTxW1dO1aelkUcvc7CQsWjxvTtJ/gu
         Tm1A==
X-Gm-Message-State: AOJu0YzX7RQt+LpgFoGHZZCav2Hk9uCWk11s9BcF9lurid5TTo5KwP11
	8rizkYfbDshL86KAPjbt+478/RQcNCCJ0zd1VII=
X-Google-Smtp-Source: AGHT+IFPL/1FhYZwjLu6LkmXsGrA81vCOzj3CTlwBJoJIEQ18X/ItdKqq5VrIGrSD1ZtYqQYtpfFY5X5OPQFNKtCuQM=
X-Received: by 2002:a17:907:2d0f:b0:9ae:6a51:87c3 with SMTP id
 gs15-20020a1709072d0f00b009ae6a5187c3mr1975859ejc.9.1697721755248; Thu, 19
 Oct 2023 06:22:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231017083033.118643-1-zhiguangni01@gmail.com> <20231019073625.GB2824@kernel.org>
In-Reply-To: <20231019073625.GB2824@kernel.org>
From: Liam Ni <zhiguangni01@gmail.com>
Date: Thu, 19 Oct 2023 21:22:23 +0800
Message-ID: <CACZJ9cWTCrUciq4S8Z=x+_aH23RuRhwAyiP8hYvmkavWnnUV6Q@mail.gmail.com>
Subject: Re: [PATCH V5] NUMA: optimize detection of memory with no node id
 assigned by firmware
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, chenhuacai@kernel.org, kernel@xen0n.name, 
	dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org, 
	hpa@zytor.com, akpm@linux-foundation.org, maobibo@loongson.cn, 
	chenfeiyang@loongson.cn, zhoubinbin@loongson.cn
Content-Type: text/plain; charset="UTF-8"

Thanks, I will prepare V6 based on your suggestion.


On Thu, 19 Oct 2023 at 15:36, Mike Rapoport <rppt@kernel.org> wrote:
>
> On Tue, Oct 17, 2023 at 04:30:33PM +0800, Liam Ni wrote:
> > Sanity check that makes sure the nodes cover all memory loops over
> > numa_meminfo to count the pages that have node id assigned by the firmware,
> > then loops again over memblock.memory to find the total amount of memory
> > and in the end checks that the difference between the total memory and
> > memory that covered by nodes is less than some threshold. Worse, the loop
> > over numa_meminfo calls __absent_pages_in_range() that also partially
> > traverses memblock.memory.
> >
> > It's much simpler and more efficient to have a single traversal of
> > memblock.memory that verifies that amount of memory not covered by nodes is
> > less than a threshold.
> >
> > Introduce memblock_validate_numa_coverage() that does exactly that and use
> > it instead of numa_meminfo_cover_memory().
> >
> > Signed-off-by: Liam Ni <zhiguangni01@gmail.com>
> > ---
> >  arch/loongarch/kernel/numa.c | 28 +---------------------------
> >  arch/x86/mm/numa.c           | 34 ++--------------------------------
> >  include/linux/memblock.h     |  1 +
> >  mm/memblock.c                | 34 ++++++++++++++++++++++++++++++++++
> >  4 files changed, 38 insertions(+), 59 deletions(-)
> >
> > diff --git a/arch/loongarch/kernel/numa.c b/arch/loongarch/kernel/numa.c
> > index cb00804826f7..fca94d16be34 100644
> > --- a/arch/loongarch/kernel/numa.c
> > +++ b/arch/loongarch/kernel/numa.c
> > @@ -226,32 +226,6 @@ static void __init node_mem_init(unsigned int node)
> >
> >  #ifdef CONFIG_ACPI_NUMA
> >
> > -/*
> > - * Sanity check to catch more bad NUMA configurations (they are amazingly
> > - * common).  Make sure the nodes cover all memory.
> > - */
> > -static bool __init numa_meminfo_cover_memory(const struct numa_meminfo *mi)
> > -{
> > -     int i;
> > -     u64 numaram, biosram;
> > -
> > -     numaram = 0;
> > -     for (i = 0; i < mi->nr_blks; i++) {
> > -             u64 s = mi->blk[i].start >> PAGE_SHIFT;
> > -             u64 e = mi->blk[i].end >> PAGE_SHIFT;
> > -
> > -             numaram += e - s;
> > -             numaram -= __absent_pages_in_range(mi->blk[i].nid, s, e);
> > -             if ((s64)numaram < 0)
> > -                     numaram = 0;
> > -     }
> > -     max_pfn = max_low_pfn;
> > -     biosram = max_pfn - absent_pages_in_range(0, max_pfn);
> > -
> > -     BUG_ON((s64)(biosram - numaram) >= (1 << (20 - PAGE_SHIFT)));
> > -     return true;
> > -}
> > -
> >  static void __init add_node_intersection(u32 node, u64 start, u64 size, u32 type)
> >  {
> >       static unsigned long num_physpages;
> > @@ -396,7 +370,7 @@ int __init init_numa_memory(void)
> >               return -EINVAL;
> >
> >       init_node_memblock();
> > -     if (numa_meminfo_cover_memory(&numa_meminfo) == false)
> > +     if (memblock_validate_numa_coverage(SZ_1M >> 12) == false)
>
> No magic constants please.
> Either use
>
>         SZ_1M >> PAGE_SIZE
>
> here, or make threshold in bytes and convert it to number of pages in
> memblock_validate_numa_coverage().
>
> Besides, no need to compare to false,
>
>         if (!memblock_validate_numa_coverage())
>
> will do
>
> >               return -EINVAL;
> >
> >       for_each_node_mask(node, node_possible_map) {
> > diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
> > index 2aadb2019b4f..95376e7c263e 100644
> > --- a/arch/x86/mm/numa.c
> > +++ b/arch/x86/mm/numa.c
> > @@ -447,37 +447,6 @@ int __node_distance(int from, int to)
> >  }
> >  EXPORT_SYMBOL(__node_distance);
> >
> > -/*
> > - * Sanity check to catch more bad NUMA configurations (they are amazingly
> > - * common).  Make sure the nodes cover all memory.
> > - */
> > -static bool __init numa_meminfo_cover_memory(const struct numa_meminfo *mi)
> > -{
> > -     u64 numaram, e820ram;
> > -     int i;
> > -
> > -     numaram = 0;
> > -     for (i = 0; i < mi->nr_blks; i++) {
> > -             u64 s = mi->blk[i].start >> PAGE_SHIFT;
> > -             u64 e = mi->blk[i].end >> PAGE_SHIFT;
> > -             numaram += e - s;
> > -             numaram -= __absent_pages_in_range(mi->blk[i].nid, s, e);
> > -             if ((s64)numaram < 0)
> > -                     numaram = 0;
> > -     }
> > -
> > -     e820ram = max_pfn - absent_pages_in_range(0, max_pfn);
> > -
> > -     /* We seem to lose 3 pages somewhere. Allow 1M of slack. */
> > -     if ((s64)(e820ram - numaram) >= (1 << (20 - PAGE_SHIFT))) {
> > -             printk(KERN_ERR "NUMA: nodes only cover %LuMB of your %LuMB e820 RAM. Not used.\n",
> > -                    (numaram << PAGE_SHIFT) >> 20,
> > -                    (e820ram << PAGE_SHIFT) >> 20);
> > -             return false;
> > -     }
> > -     return true;
> > -}
> > -
> >  /*
> >   * Mark all currently memblock-reserved physical memory (which covers the
> >   * kernel's own memory ranges) as hot-unswappable.
> > @@ -583,7 +552,8 @@ static int __init numa_register_memblks(struct numa_meminfo *mi)
> >                       return -EINVAL;
> >               }
> >       }
> > -     if (!numa_meminfo_cover_memory(mi))
> > +
> > +     if (!memblock_validate_numa_coverage(SZ_1M >> 12))
> >               return -EINVAL;
> >
> >       /* Finally register nodes. */
> > diff --git a/include/linux/memblock.h b/include/linux/memblock.h
> > index 1c1072e3ca06..727242f4b54a 100644
> > --- a/include/linux/memblock.h
> > +++ b/include/linux/memblock.h
> > @@ -120,6 +120,7 @@ int memblock_physmem_add(phys_addr_t base, phys_addr_t size);
> >  void memblock_trim_memory(phys_addr_t align);
> >  bool memblock_overlaps_region(struct memblock_type *type,
> >                             phys_addr_t base, phys_addr_t size);
> > +bool memblock_validate_numa_coverage(const u64 threshold_pages);
> >  int memblock_mark_hotplug(phys_addr_t base, phys_addr_t size);
> >  int memblock_clear_hotplug(phys_addr_t base, phys_addr_t size);
> >  int memblock_mark_mirror(phys_addr_t base, phys_addr_t size);
> > diff --git a/mm/memblock.c b/mm/memblock.c
> > index 0863222af4a4..4f1f2d8a8119 100644
> > --- a/mm/memblock.c
> > +++ b/mm/memblock.c
> > @@ -734,6 +734,40 @@ int __init_memblock memblock_add(phys_addr_t base, phys_addr_t size)
> >       return memblock_add_range(&memblock.memory, base, size, MAX_NUMNODES, 0);
> >  }
> >
> > +/**
> > + * memblock_validate_numa_coverage - calculating memory with no node id assigned by firmware
> > + * @threshold_pages: threshold memory of no node id assigned
> > + *
> > + * calculating memory with no node id assigned by firmware,
> > + * If the number is less than the @threshold_pages, it returns true,
> > + * otherwise it returns false.
> > + *
> > + * Return:
> > + * true on success, false on failure.
> > + */
>
> I'd suggest the below version:
>
> /**
>  * memblock_validate_numa_coverage - check if amount of memory with
>  * no node ID assigned is less than a threshold
>  * @threshold_pages: maximal number of pages that can have unassigned node
>  * ID (in pages).
>  *
>  * A buggy firmware may report memory that does not belong to any node.
>  * Check if amount of such memory is below @threshold_pages.
>  *
>  * Return: true on success, false on failure.
>  */
>
> > +bool __init_memblock memblock_validate_numa_coverage(const u64 threshold_pages)
> > +{
> > +     unsigned long nr_pages = 0;
> > +     unsigned long start_pfn, end_pfn, mem_size_mb;
> > +     int nid, i;
> > +
> > +     /* calculate lose page */
> > +     for_each_mem_pfn_range(i, MAX_NUMNODES, &start_pfn, &end_pfn, &nid) {
> > +             if (nid == NUMA_NO_NODE)
> > +                     nr_pages += end_pfn - start_pfn;
> > +     }
> > +
> > +     if (nr_pages >= threshold_pages) {
> > +             mem_size_mb = memblock_phys_mem_size() >> 20;
> > +             pr_err("NUMA: no nodes coverage for %luMB of %luMB RAM\n",
> > +                    (nr_pages << PAGE_SHIFT) >> 20, mem_size_mb);
> > +             return false;
> > +     }
> > +
> > +     return true;
> > +}
> > +
> > +
> >  /**
> >   * memblock_isolate_range - isolate given range into disjoint memblocks
> >   * @type: memblock type to isolate range for
> > --
> > 2.25.1
> >
>
> --
> Sincerely yours,
> Mike.
