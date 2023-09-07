Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE336A29
	for <loongarch@lists.linux.dev>; Thu,  7 Sep 2023 01:37:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56E52C433C8
	for <loongarch@lists.linux.dev>; Thu,  7 Sep 2023 01:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694050656;
	bh=2u555ySjYeyb0mDPSMPeSdZiOThzSFjp6psMrJQw+Ww=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Km07+jcCtXOOqmBVCEbfD+zDlXl4UBhmJiAbp2HG7JOA2ye4QwpJYygnt18y1pAJ6
	 9OiMgpsTnLRRr311MQnfBsoeM2adRHj1lp9cgTOQTPXkG0KMMoDGSsPP+1NXB3U5z/
	 b/rM0bc4jGexDVDBAECbYTtzc0QaT7HOiu3OJ9tCAsFHEqgCAn/NZTyDuZSVcrQfYp
	 3uxYGzghtX5y4s9FWQXLKiOs7C7TiwgA0HtzBgtUV1zhXc2Q7lqE9OoKyKffVZAefb
	 LunamMcskFJExMo3A/dWpIwNj/5YkavGU4Kvow6BvoFuL2CUdsEnl15a7dVurPe2EG
	 a5em1+IW5RvLg==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-52683da3f5cso459424a12.3
        for <loongarch@lists.linux.dev>; Wed, 06 Sep 2023 18:37:36 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw6R2Osh+lLiMViVw+nl2XPIkFCsMoF5g6frVqxwXOw4bpNlvCh
	j+XefL0bfBtvMY89tRWCfJ0cqscQL8rj8zt+/Sk=
X-Google-Smtp-Source: AGHT+IFT5eIF7hr2d1Izhkban6u/0ccIOUynWf3nt7AdlxQABaEmUDuhNTN/LkPRJj2uZdfYn1qxrn1YEcQ2Y2qloLs=
X-Received: by 2002:aa7:cd64:0:b0:523:47b0:9077 with SMTP id
 ca4-20020aa7cd64000000b0052347b09077mr3599846edb.38.1694050654555; Wed, 06
 Sep 2023 18:37:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230907012209.2451090-1-maobibo@loongson.cn>
In-Reply-To: <20230907012209.2451090-1-maobibo@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 7 Sep 2023 09:37:22 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6fZZxP3pehyPBsvZNmJb1LCmawd0Jve24MTfBMNjUM2A@mail.gmail.com>
Message-ID: <CAAhV-H6fZZxP3pehyPBsvZNmJb1LCmawd0Jve24MTfBMNjUM2A@mail.gmail.com>
Subject: Re: [PATCH v2] LoongArch: Code cleanup with zero page
To: Bibo Mao <maobibo@loongson.cn>
Cc: WANG Xuerui <kernel@xen0n.name>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Queued for loongarch-next with the old title "LoongArch: Use static
defined zero page rather than allocated" since it is more clear,
thanks.

Huacai

On Thu, Sep 7, 2023 at 9:22=E2=80=AFAM Bibo Mao <maobibo@loongson.cn> wrote=
:
>
> Like other popular architectures, zero page is defined in kernel
> BSS data segment, rather than dynamically allocated. It is simpler.
> Also this patch removes macro __HAVE_COLOR_ZERO_PAGE and variable
> zero_page_mask since there is only one page for zeo_page usage.
>
> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
> ---
> Changes in v2:
>  1. Combine two simple patches into one
>  2. Refine implementation about macro ZERO_PAGE(vaddr)
>
> ---
>  arch/loongarch/include/asm/mmzone.h  |  2 --
>  arch/loongarch/include/asm/pgtable.h |  9 ++-------
>  arch/loongarch/kernel/numa.c         |  1 -
>  arch/loongarch/mm/init.c             | 28 +---------------------------
>  4 files changed, 3 insertions(+), 37 deletions(-)
>
> diff --git a/arch/loongarch/include/asm/mmzone.h b/arch/loongarch/include=
/asm/mmzone.h
> index fe67d0b4b33d..2b9a90727e19 100644
> --- a/arch/loongarch/include/asm/mmzone.h
> +++ b/arch/loongarch/include/asm/mmzone.h
> @@ -13,6 +13,4 @@ extern struct pglist_data *node_data[];
>
>  #define NODE_DATA(nid) (node_data[(nid)])
>
> -extern void setup_zero_pages(void);
> -
>  #endif /* _ASM_MMZONE_H_ */
> diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/includ=
e/asm/pgtable.h
> index 06963a172319..189156d8435c 100644
> --- a/arch/loongarch/include/asm/pgtable.h
> +++ b/arch/loongarch/include/asm/pgtable.h
> @@ -69,13 +69,8 @@ struct vm_area_struct;
>   * ZERO_PAGE is a global shared page that is always zero; used
>   * for zero-mapped memory areas etc..
>   */
> -
> -extern unsigned long empty_zero_page;
> -extern unsigned long zero_page_mask;
> -
> -#define ZERO_PAGE(vaddr) \
> -       (virt_to_page((void *)(empty_zero_page + (((unsigned long)(vaddr)=
) & zero_page_mask))))
> -#define __HAVE_COLOR_ZERO_PAGE
> +extern unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)];
> +#define ZERO_PAGE(vaddr)       (virt_to_page(empty_zero_page))
>
>  /*
>   * TLB refill handlers may also map the vmalloc area into xkvrange.
> diff --git a/arch/loongarch/kernel/numa.c b/arch/loongarch/kernel/numa.c
> index 708665895b47..6f464d49f0c2 100644
> --- a/arch/loongarch/kernel/numa.c
> +++ b/arch/loongarch/kernel/numa.c
> @@ -470,7 +470,6 @@ void __init mem_init(void)
>  {
>         high_memory =3D (void *) __va(get_num_physpages() << PAGE_SHIFT);
>         memblock_free_all();
> -       setup_zero_pages();     /* This comes from node 0 */
>  }
>
>  int pcibus_to_node(struct pci_bus *bus)
> diff --git a/arch/loongarch/mm/init.c b/arch/loongarch/mm/init.c
> index 3b7d8129570b..628ebe42b519 100644
> --- a/arch/loongarch/mm/init.c
> +++ b/arch/loongarch/mm/init.c
> @@ -35,33 +35,8 @@
>  #include <asm/pgalloc.h>
>  #include <asm/tlb.h>
>
> -/*
> - * We have up to 8 empty zeroed pages so we can map one of the right col=
our
> - * when needed.         Since page is never written to after the initial=
ization we
> - * don't have to care about aliases on other CPUs.
> - */
> -unsigned long empty_zero_page, zero_page_mask;
> +unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)] __page_=
aligned_bss;
>  EXPORT_SYMBOL(empty_zero_page);
> -EXPORT_SYMBOL(zero_page_mask);
> -
> -void setup_zero_pages(void)
> -{
> -       unsigned int order, i;
> -       struct page *page;
> -
> -       order =3D 0;
> -
> -       empty_zero_page =3D __get_free_pages(GFP_KERNEL | __GFP_ZERO, ord=
er);
> -       if (!empty_zero_page)
> -               panic("Oh boy, that early out of memory?");
> -
> -       page =3D virt_to_page((void *)empty_zero_page);
> -       split_page(page, order);
> -       for (i =3D 0; i < (1 << order); i++, page++)
> -               mark_page_reserved(page);
> -
> -       zero_page_mask =3D ((PAGE_SIZE << order) - 1) & PAGE_MASK;
> -}
>
>  void copy_user_highpage(struct page *to, struct page *from,
>         unsigned long vaddr, struct vm_area_struct *vma)
> @@ -106,7 +81,6 @@ void __init mem_init(void)
>         high_memory =3D (void *) __va(max_low_pfn << PAGE_SHIFT);
>
>         memblock_free_all();
> -       setup_zero_pages();     /* Setup zeroed pages.  */
>  }
>  #endif /* !CONFIG_NUMA */
>
> --
> 2.27.0
>
>
