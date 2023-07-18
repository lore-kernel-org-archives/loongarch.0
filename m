Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55D210789
	for <loongarch@lists.linux.dev>; Tue, 18 Jul 2023 14:31:32 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5703d12ab9aso61286197b3.2
        for <loongarch@lists.linux.dev>; Tue, 18 Jul 2023 07:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689690691; x=1692282691;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rjpIeqow7KavnD0/SRlgq73LQricx6uLDxJMeUQiZ4Q=;
        b=PPKZxxlbX67hKoW02aRYjLt7DnZCbtwFM52WyDMWojmxap2OFcv4VhrJtfyoOPmaY5
         K3dJSnLIcwzPAUuVeAVZE15JOcbVf/Qk9xdCGyrEZo01HRCrRhKm9glg7WIENRWIlzkW
         1HXFRWSXZ2Fd8fnQpyJVPZFoZ46mf5PgkuFBA6+w2T2zku8i2GfGbTAe81O7LAsxB8A6
         kXkizNhQjyq3zL101Xsj2UU6LDY34TOft7WkNZNGNcEoEQwO84n5ZOBk2ijX78886e8/
         I66q5/Avp/9sseOt8mtApcdHGoPNhCPiUukAB3GtCkY6OGImiwuASUlXC0o61p15M4k8
         sYqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689690691; x=1692282691;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rjpIeqow7KavnD0/SRlgq73LQricx6uLDxJMeUQiZ4Q=;
        b=Z1wcf1SCWePVVHRdWTl8Dr2ZqN+f07Kd19paZE96qjHgoNgs79SVuJtHtBI6mch3Ve
         tOc72wYVI28j7E6NCCRRmXCkc1LFZaw8vZEBKoBw3gOC7VbwsIRe+cfnkqPrfaMwHXNS
         Ry03m2z2KnDCJT+xM5G6k67oCQ5yhbDL6JMhJjhGhfS+5dwQW/PYCJgMh2GhmIVOgb+0
         GcEOoBZvTlC1B9/U0DrF7OV6UsZ0w6pYpxcQVC1fNO6lo1qPBpg9zTLi7on6KdKmIwcp
         94vuFW0sPrBtah2dFirs8SqMAe8c8n3QIo5R6FhfGHmflLw74snrABMLPRqiya0Ck1FL
         h4Ug==
X-Gm-Message-State: ABy/qLZVrebqWz3CWm0lI64WJ75p3lVQ6BsqWX81LwLF5XGFuXqt/xkd
	4Bd/RjlzMqsOGqzmkQ9h8FBYAXH+9+sORayeYag=
X-Google-Smtp-Source: APBJJlHbP2K9+0wdcMRs1ip81cmcwyNZLOlC7o4iriCt43sinSc0iTV9tvvNKQBkROzB3Os0KlriLnI/3+rVCADyVIc=
X-Received: by 2002:a5b:4d2:0:b0:cf0:8fde:c326 with SMTP id
 u18-20020a5b04d2000000b00cf08fdec326mr35365ybp.42.1689690691401; Tue, 18 Jul
 2023 07:31:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230710141408.9998-1-zhiguangni01@gmail.com>
In-Reply-To: <20230710141408.9998-1-zhiguangni01@gmail.com>
From: Liam Ni <zhiguangni01@gmail.com>
Date: Tue, 18 Jul 2023 22:31:20 +0800
Message-ID: <CACZJ9cXGhMhmVCJ6Yn9GHGjY3KAGi+Px9Sr63_+inwU6Fg99nA@mail.gmail.com>
Subject: Re: [PATCH V3] [PATCH V3] NUMA:Improve the efficiency of calculating
 pages loss
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev
Cc: zhoubinbin@loongson.cn, chenfeiyang@loongson.cn, jiaxun.yang@flygoat.com, 
	rppt@kernel.org, akpm@linux-foundation.org, hpa@zytor.com, x86@kernel.org, 
	bp@alien8.de, mingo@redhat.com, tglx@linutronix.de, peterz@infradead.org, 
	luto@kernel.org, dave.hansen@linux.intel.com, kernel@xen0n.name, 
	chenhuacai@kernel.org
Content-Type: text/plain; charset="UTF-8"

Friendly ping

On Mon, 10 Jul 2023 at 22:14, Liam Ni <zhiguangni01@gmail.com> wrote:
>
> The number of pages in memblock that doesn't have the node
> assigned,which also means that these pages are not in numa_info.
> So these pages can represent the number of lose pages.
>
> V2:https://lore.kernel.org/all/20230619075315.49114-1-zhiguangni01@gmail.com/
> V1:https://lore.kernel.org/all/20230615142016.419570-1-zhiguangni01@gmail.com/
>
> Signed-off-by: Liam Ni <zhiguangni01@gmail.com>
> ---
>  arch/loongarch/kernel/numa.c | 23 ++++++++---------------
>  arch/x86/mm/numa.c           | 26 +++++++-------------------
>  include/linux/mm.h           |  1 +
>  mm/mm_init.c                 | 20 ++++++++++++++++++++
>  4 files changed, 36 insertions(+), 34 deletions(-)
>
> diff --git a/arch/loongarch/kernel/numa.c b/arch/loongarch/kernel/numa.c
> index 708665895b47..0239891e4d19 100644
> --- a/arch/loongarch/kernel/numa.c
> +++ b/arch/loongarch/kernel/numa.c
> @@ -262,25 +262,18 @@ static void __init node_mem_init(unsigned int node)
>   * Sanity check to catch more bad NUMA configurations (they are amazingly
>   * common).  Make sure the nodes cover all memory.
>   */
> -static bool __init numa_meminfo_cover_memory(const struct numa_meminfo *mi)
> +static bool __init memblock_validate_numa_coverage(const u64 limit)
>  {
> -       int i;
> -       u64 numaram, biosram;
> +       u64 lo_pg;
>
> -       numaram = 0;
> -       for (i = 0; i < mi->nr_blks; i++) {
> -               u64 s = mi->blk[i].start >> PAGE_SHIFT;
> -               u64 e = mi->blk[i].end >> PAGE_SHIFT;
> +       lo_pg = max_pfn - calculate_without_node_pages_in_range();
>
> -               numaram += e - s;
> -               numaram -= __absent_pages_in_range(mi->blk[i].nid, s, e);
> -               if ((s64)numaram < 0)
> -                       numaram = 0;
> +       /* We seem to lose 3 pages somewhere. Allow 1M of slack. */
> +       if (lo_pg >= limit) {
> +               pr_err("NUMA: We lost 1m size page.\n");
> +               return false;
>         }
> -       max_pfn = max_low_pfn;
> -       biosram = max_pfn - absent_pages_in_range(0, max_pfn);
>
> -       BUG_ON((s64)(biosram - numaram) >= (1 << (20 - PAGE_SHIFT)));
>         return true;
>  }
>
> @@ -428,7 +421,7 @@ int __init init_numa_memory(void)
>                 return -EINVAL;
>
>         init_node_memblock();
> -       if (numa_meminfo_cover_memory(&numa_meminfo) == false)
> +       if (memblock_validate_numa_coverage(SZ_1M) == false)
>                 return -EINVAL;
>
>         for_each_node_mask(node, node_possible_map) {
> diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
> index 2aadb2019b4f..14feec144675 100644
> --- a/arch/x86/mm/numa.c
> +++ b/arch/x86/mm/numa.c
> @@ -451,30 +451,18 @@ EXPORT_SYMBOL(__node_distance);
>   * Sanity check to catch more bad NUMA configurations (they are amazingly
>   * common).  Make sure the nodes cover all memory.
>   */
> -static bool __init numa_meminfo_cover_memory(const struct numa_meminfo *mi)
> +static bool __init memblock_validate_numa_coverage(const u64 limit)
>  {
> -       u64 numaram, e820ram;
> -       int i;
> +       u64 lo_pg;
>
> -       numaram = 0;
> -       for (i = 0; i < mi->nr_blks; i++) {
> -               u64 s = mi->blk[i].start >> PAGE_SHIFT;
> -               u64 e = mi->blk[i].end >> PAGE_SHIFT;
> -               numaram += e - s;
> -               numaram -= __absent_pages_in_range(mi->blk[i].nid, s, e);
> -               if ((s64)numaram < 0)
> -                       numaram = 0;
> -       }
> -
> -       e820ram = max_pfn - absent_pages_in_range(0, max_pfn);
> +       lo_pg = max_pfn - calculate_without_node_pages_in_range();
>
>         /* We seem to lose 3 pages somewhere. Allow 1M of slack. */
> -       if ((s64)(e820ram - numaram) >= (1 << (20 - PAGE_SHIFT))) {
> -               printk(KERN_ERR "NUMA: nodes only cover %LuMB of your %LuMB e820 RAM. Not used.\n",
> -                      (numaram << PAGE_SHIFT) >> 20,
> -                      (e820ram << PAGE_SHIFT) >> 20);
> +       if (lo_pg >= limit) {
> +               pr_err("NUMA: We lost 1m size page.\n");
>                 return false;
>         }
> +
>         return true;
>  }
>
> @@ -583,7 +571,7 @@ static int __init numa_register_memblks(struct numa_meminfo *mi)
>                         return -EINVAL;
>                 }
>         }
> -       if (!numa_meminfo_cover_memory(mi))
> +       if (!memblock_validate_numa_coverage(SZ_1M))
>                 return -EINVAL;
>
>         /* Finally register nodes. */
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 0daef3f2f029..b32457ad1ae3 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -3043,6 +3043,7 @@ unsigned long __absent_pages_in_range(int nid, unsigned long start_pfn,
>                                                 unsigned long end_pfn);
>  extern unsigned long absent_pages_in_range(unsigned long start_pfn,
>                                                 unsigned long end_pfn);
> +extern unsigned long calculate_without_node_pages_in_range(void);
>  extern void get_pfn_range_for_nid(unsigned int nid,
>                         unsigned long *start_pfn, unsigned long *end_pfn);
>
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index 3ddd18a89b66..13a4883787e3 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -1132,6 +1132,26 @@ static void __init adjust_zone_range_for_zone_movable(int nid,
>         }
>  }
>
> +/**
> + * @start_pfn: The start PFN to start searching for holes
> + * @end_pfn: The end PFN to stop searching for holes
> + *
> + * Return: Return the number of page frames without node assigned within a range.
> + */
> +unsigned long __init calculate_without_node_pages_in_range(void)
> +{
> +       unsigned long num_pages;
> +       unsigned long start_pfn, end_pfn;
> +       int nid, i;
> +
> +       for_each_mem_pfn_range(i, MAX_NUMNODES, &start_pfn, &end_pfn, &nid) {
> +               if (nid == NUMA_NO_NODE)
> +                       num_pages += end_pfn - start_pfn;
> +       }
> +
> +       return num_pages;
> +}
> +
>  /*
>   * Return the number of holes in a range on a node. If nid is MAX_NUMNODES,
>   * then all holes in the requested range will be accounted for.
> --
> 2.25.1
>
