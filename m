Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F384D58E
	for <loongarch@lists.linux.dev>; Mon,  6 May 2024 16:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715011650; cv=none; b=beo4M2IaCfttdapPbePtRyZeNyM0nXD7M1kwJw/lpKwuzx0NCFr5ocE2Q2/KIqU25yZKxangKYRfzOegzY/DpRPStIw6BEbM0/oAG1O8L2knq16s6DIt59yPCezOFQXJ5LacN/4PbMe6I5jGLgUfjafMZdP95WpgijISVpCZYLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715011650; c=relaxed/simple;
	bh=Ff54ZvbDcerjWAa+AdrO8cLOqCKnvqp+iB+TgdAhk7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jOT0xD5Yhu3G+NFgJs8N2a1ipHGBWMLsAAOO8hFHMWb7DH7qa1HXIRxvfpPGtlUgsREqtIm5k/M9HmB/IJGfjHKP7/Ud5jGb4mVUNREZYhtCg2XNtXEj2Xy9EWGQaBtEoqm2QdYVyOe5rrhmeP3L/z2FSdh1ppvOX0+A0lA7qzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CSrRJ8FX; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CSrRJ8FX"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-51f29e80800so2296051e87.2
        for <loongarch@lists.linux.dev>; Mon, 06 May 2024 09:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715011647; x=1715616447; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nrl9wYenAkny/KczU5T4LBnOH/HfDi64n5pKG7uxGwQ=;
        b=CSrRJ8FXPTYB0V2BfwbXMGxj75vhlNOg6FurOuirZ44uAFszsUmIEAaM711yaLB1xs
         THZ6eyzCgN+6lFqgyAQ84SuULVNVO1Q/+szvjfU1gbBsoWTm/iUPq9sp0C8i9zQmBOwj
         zDyzUTI0bbGkPLyu1XWwQ7J5OiIehSJbGs8yMdZYT2fUzAZE4QkRv5dutY5UkECNHNFf
         Gx6bXznU9kL+halB75IJy4FAd2i8AzwwrDneKpQBGAAzYx3OTroHgPSuHL3jHCGNHtg3
         ZWAdXpppXwvSDUkW0FpsbR2VoXS9vmRXFyXzEO8hc623lbydFSqXzLeQTgD5/FUUtgH+
         RB5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715011647; x=1715616447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nrl9wYenAkny/KczU5T4LBnOH/HfDi64n5pKG7uxGwQ=;
        b=UdCPcFV2yS65Y0ul2/cAx44FmMKVl+aV07Xw1hZYkkl/x9G2BWw8NZfDttDWjOPRLX
         B0ob1IuIWe4Xr2pesZqfn7+d9BslOntUFJh1Qkcwm30VHiutIdSKgg+8ZbkHuzzy/F07
         s06Wg6PiYKFTwgX1gYWrlcWOrzJQCZhgayoaGefbrpUjvpP+OV90VO8n6qxx5+sz2TIr
         fvCXNDpmL4Ekda7AE9EHlFOlmcme20wuoqQuweXX2SY7szMC2dVUqwg4YO5asvMk0Yej
         SknNaRJDc8d+zFQVJ18uEP0/caS48iG8rP1l1c9hF8Osn7q7EEzFK1yras24GZI49yhs
         4Bfw==
X-Forwarded-Encrypted: i=1; AJvYcCUTc/5jGGkYBF6vg+MwEAA0d7yxlA+B/JVWUfRn5J+FtUtMLZ5rjOGTqGGW81x+9t5tsodnjkaY6b0WaIXpBc0J/WUrvZA7eIpJ
X-Gm-Message-State: AOJu0YxPeuBjvxVTMt0BzOJmZpxkMgERmWsOKXWo4Pe5Vp652Zzpj/5v
	XTVonDxD2GNHXpJBUOODUhtwIxL3v4689mKwYTrYKIhW3Qw67FCKv/p1kO2tX5IaP0254A717qg
	Cc6999SJCChriLACyPha1bV5jRdo=
X-Google-Smtp-Source: AGHT+IGgclVNVqb50qaplhEiNbTTu3K8A0EV3SULEDaW0g40sWnAdxIwfF2EEqRKcTm96OkrR4aESZGXESCCHHFlBzk=
X-Received: by 2002:ac2:562f:0:b0:516:a6ff:2467 with SMTP id
 b15-20020ac2562f000000b00516a6ff2467mr5858381lff.0.1715011646493; Mon, 06 May
 2024 09:07:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240506155120.83105-1-libang.li@antgroup.com> <20240506155120.83105-6-libang.li@antgroup.com>
In-Reply-To: <20240506155120.83105-6-libang.li@antgroup.com>
From: Lance Yang <ioworker0@gmail.com>
Date: Tue, 7 May 2024 00:07:14 +0800
Message-ID: <CAK1f24nX6mvLXiXNJUQWSKKUQ-Avhs0_NU1k8JBhVupOr3W6Mg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] mm: Add update_mmu_tlb_range()
To: Bang Li <libang.li@antgroup.com>
Cc: akpm@linux-foundation.org, chenhuacai@kernel.org, 
	tsbogend@alpha.franken.de, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	chris@zankel.net, jcmvbkbc@gmail.com, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org, david@redhat.com, ryan.roberts@arm.com, 
	libang.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 6, 2024 at 11:52=E2=80=AFPM Bang Li <libang.li@antgroup.com> wr=
ote:
>
> After the commit 19eaf44954df ("mm: thp: support allocation of anonymous
> multi-size THP"), it may need to batch update tlb of an address range
> through the update_mmu_tlb function. We can simplify this operation by
> adding the update_mmu_tlb_range function, which may also reduce the
> execution of some unnecessary code in some architectures.
>
> Signed-off-by: Bang Li <libang.li@antgroup.com>
> ---
>  include/linux/pgtable.h | 8 ++++++++
>  mm/memory.c             | 4 +---
>  2 files changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 18019f037bae..869bfe6054f1 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -737,6 +737,14 @@ static inline void update_mmu_tlb(struct vm_area_str=
uct *vma,
>  #define __HAVE_ARCH_UPDATE_MMU_TLB
>  #endif
>
> +#ifndef __HAVE_ARCH_UPDATE_MMU_TLB_RANGE

IIRC, the contemporary practice is to define a macro with the same name
as the function if it is being overridden.

Thanks,
Lance

> +static inline void update_mmu_tlb_range(struct vm_area_struct *vma,
> +                               unsigned long address, pte_t *ptep, unsig=
ned int nr)
> +{
> +}
> +#define __HAVE_ARCH_UPDATE_MMU_TLB_RANGE
> +#endif
> +
>  /*
>   * Some architectures may be able to avoid expensive synchronization
>   * primitives when modifications are made to PTE's which are already
> diff --git a/mm/memory.c b/mm/memory.c
> index eea6e4984eae..2d53e29cf76e 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -4421,7 +4421,6 @@ static vm_fault_t do_anonymous_page(struct vm_fault=
 *vmf)
>         vm_fault_t ret =3D 0;
>         int nr_pages =3D 1;
>         pte_t entry;
> -       int i;
>
>         /* File mapping without ->vm_ops ? */
>         if (vma->vm_flags & VM_SHARED)
> @@ -4491,8 +4490,7 @@ static vm_fault_t do_anonymous_page(struct vm_fault=
 *vmf)
>                 update_mmu_tlb(vma, addr, vmf->pte);
>                 goto release;
>         } else if (nr_pages > 1 && !pte_range_none(vmf->pte, nr_pages)) {
> -               for (i =3D 0; i < nr_pages; i++)
> -                       update_mmu_tlb(vma, addr + PAGE_SIZE * i, vmf->pt=
e + i);
> +               update_mmu_tlb_range(vma, addr, vmf->pte, nr_pages);
>                 goto release;
>         }
>
> --
> 2.19.1.6.gb485710b
>
