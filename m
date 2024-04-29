Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87B24174A
	for <loongarch@lists.linux.dev>; Mon, 29 Apr 2024 11:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714389832; cv=none; b=T7m/aFN/tf5tJYaCeVx9g6xfFIMX1ABsd+Fqm9uyI6VBuFLtg6JVESUW0fzWJIOC+6OgCnJtWEJawRsVzJu7n5K8yTbZoEqb0PDOssNXSduexXsLFdNFPocSGSLUmeDeE31gzkBXO/xDw72hfR00hvozfUHtD8lfJk+p7DRavLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714389832; c=relaxed/simple;
	bh=aqXHscrRfcuVMryQ0VmPAD470hPq8NqBWV6Twu76Fgk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PdZXFDua1I7O0cVKLQckGGgEERKBh74wFhG3C6kbKgXokgEjx4i2Ex5Of0RwI0KxlEGrf5VvPjamlxm92yNBtbXHrg8JcY56UBZC3rngXnI4I92txNL5B/vtERcemxBep5+uDhAHdHeHKO53xUE3qSEABvmohNP5jh8nEq7mZQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YYwGrCfN; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YYwGrCfN"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-571bddddbc2so5147377a12.1
        for <loongarch@lists.linux.dev>; Mon, 29 Apr 2024 04:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714389829; x=1714994629; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5KI8jwSeT1iJj/UBYCVNCpYpjMdWJYZrUv0ljjTWL48=;
        b=YYwGrCfN5Q/gxYLTH7CIRp6MQZ6rEq5A9LrsSjWTL0PzNW7ITJe3IO21YhmrG9u66k
         p0gfCsHFpzHLs8zrhmsEKa+rX/YVPx4p/Zi3fpMOodu+c4YzHTdhmRVV+ipePkjZdLCh
         l1mdUKHKR+b2Cf4BgGXK8czRriNXZOM+W1Rz2ClbCucz58tVu+NNoVFpuAztiYGY+f3f
         tY1L4qyTgt75H0XN9Agwbjha8rDBGRorEuPxWtnKIlIkofSeBhrfxyAAhz5HWGYhxOml
         S7YR+rZDz9XvRobLmEKIXtsgc4VzT3PaJAeeqkKuMX50SyDQEHMrM5KGaOc8dOyYbKHS
         1dYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714389829; x=1714994629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5KI8jwSeT1iJj/UBYCVNCpYpjMdWJYZrUv0ljjTWL48=;
        b=JT4ynAqiwt97snu+nnMtoDrWQbklADJFu3odCZ27WGis+VbwhM4U8RCDwgcfOYQazy
         winpcV0UI3N5H3er6INfaiFGTl3tPIZXZdXOMdfuMSHQaEVYZf1Lb/XKYouj8oekpdl5
         hcR8lBJzPd9Z09zqXO9A4aMOq0cmmWTJDePVRqtp0USChWprcVhMpAxTm2cyujd/hNri
         vyRQYG3Iima/HfOxXpBSE6sbZqCvlZFXrahvQNwkjugQPk/YO28KrTl30CCOx1VsceMm
         SwmXvJuhS/m3wGUYcpoBLdoCZzbj3V2Ot7NfuXf4HvUN9FAkXfp2mPX2N4hGfhq2pBzl
         R15Q==
X-Forwarded-Encrypted: i=1; AJvYcCXc0Z/UvbJ6TjsonPeWYEBquBc1UptBWKVI0mPZFHhgdnjEcI3mCF7IDP67IRjEJDR0Nygs8PjGzA0ffINdB9Zs6/XiLLKP89XZ
X-Gm-Message-State: AOJu0YxN5qX/w81vw3kwdII5tltcGH81UMM/HAdGsObc5VvM45hwYykK
	Bz/0RL3zx9tiZ+TJz2Vp3pafU079/GK2MpeWggFqP1F+frejnwpRUnICcl1CcakbL45P0pyo9RX
	JhjRnvgdlcqozzTZyauTClHMFpho=
X-Google-Smtp-Source: AGHT+IG2L6VHSgjPSI/ILsTX8RnUhW7ZCUeTXF2zruE9lvX81lsZxzWjLYduBB8ybTFePpHpcWjpPPLOGxbnBtFwaHY=
X-Received: by 2002:a50:8a89:0:b0:568:a30c:2db5 with SMTP id
 j9-20020a508a89000000b00568a30c2db5mr5612851edj.40.1714389824240; Mon, 29 Apr
 2024 04:23:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240429103346.59115-1-libang.li@antgroup.com> <20240429103346.59115-6-libang.li@antgroup.com>
In-Reply-To: <20240429103346.59115-6-libang.li@antgroup.com>
From: Lance Yang <ioworker0@gmail.com>
Date: Mon, 29 Apr 2024 19:23:32 +0800
Message-ID: <CAK1f24n4usJm4=e0+jrTxGtRjqTJZvn4gBp8d_vU=p2CrU=TsA@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] mm: Add update_mmu_tlb_range()
To: Bang Li <libang.li@antgroup.com>
Cc: akpm@linux-foundation.org, chenhuacai@kernel.org, 
	tsbogend@alpha.franken.de, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	chris@zankel.net, jcmvbkbc@gmail.com, david@redhat.com, ryan.roberts@arm.com, 
	libang.linux@gmail.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Bang,

On Mon, Apr 29, 2024 at 6:36=E2=80=AFPM Bang Li <libang.li@antgroup.com> wr=
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
>  include/linux/pgtable.h | 5 +++++
>  mm/memory.c             | 4 +---
>  2 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 18019f037bae..73411dfebf7a 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -734,6 +734,11 @@ static inline void update_mmu_tlb(struct vm_area_str=
uct *vma,
>                                 unsigned long address, pte_t *ptep)
>  {
>  }
> +
> +static inline void update_mmu_tlb_range(struct vm_area_struct *vma,
> +                               unsigned long address, pte_t *ptep, unsig=
ned int nr)
> +{
> +}
>  #define __HAVE_ARCH_UPDATE_MMU_TLB
>  #endif

IMO, it might be better to use a separate definition to determine whether
update_mmu_tlb_range() is overridden by a specific architecture.

Thanks,
Lance

>
> diff --git a/mm/memory.c b/mm/memory.c
> index 6647685fd3c4..1f0ca362b82a 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -4396,7 +4396,6 @@ static vm_fault_t do_anonymous_page(struct vm_fault=
 *vmf)
>         vm_fault_t ret =3D 0;
>         int nr_pages =3D 1;
>         pte_t entry;
> -       int i;
>
>         /* File mapping without ->vm_ops ? */
>         if (vma->vm_flags & VM_SHARED)
> @@ -4465,8 +4464,7 @@ static vm_fault_t do_anonymous_page(struct vm_fault=
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
