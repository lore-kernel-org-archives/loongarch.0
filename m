Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14BF15FA9E
	for <loongarch@lists.linux.dev>; Fri, 10 May 2024 09:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715332767; cv=none; b=gzaufXVMIogrvxikFPKtGBygYRE1TA4fyxZpJB/PoJHElzvzd479XGv/cbSF+SoFfKLU0FTHHl/Qj/AjyDFGIeTySEoj1S0tR/PQkvvR45uwLOqEQ6ISece+tHsw75xV2rotYYLHGW+IXRL/Ck1nr7jfU7FriNDV+uHNZ2QwDZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715332767; c=relaxed/simple;
	bh=4ikwhSOG2kr9jeHmsF3QaKrCUASm16FF8rgh+Txf5Gc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T1OD+36tZB94O3GO2TWXkodjgB5GvdAhcAH99CR5IAuuv9r2zdvcLuanxfDkewZiKEiB3YtWVzq2ybJbIbYpPakSHmL2v0eap1O1eN6c41yuWdZ7v1g6oocSTEjPJ3ltOZp9vCspDtahdltSsWzZqzVG9drSa8jJpStCZ4LaUUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f0ZOfk+C; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f0ZOfk+C"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-51f3761c96aso2225400e87.3
        for <loongarch@lists.linux.dev>; Fri, 10 May 2024 02:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715332764; x=1715937564; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fwcye2cmMvVkzOb2RmQWM8DhgejhAa5fax0EB+I/fqo=;
        b=f0ZOfk+CXR9OG0CXJUpDeU0R3pQ+7ybjyy+9m4ljHTKFvkJeQsp4T7vclF6u9i71/H
         sBOrPUW62d04L6dhWiiThclGgj5jYuZfktbGQnnGBRmLqFdfgVKFjnzoavL2bvPhH5DP
         H+M5Ze0xhDPN9MDA7XRFJWs+dTdGO6h3mVkzmf+IWYUYG9NQPZMFgmOCkpw2s4c2vjsZ
         SiSKemZCLDYA9kTRRMsxRcCWBY0t6PgDjAtXWZwKP9pbX3+vZrPwuobZu8+xnpYFqRRm
         tkYs2V1GK4VO2vAoM6En9T5xgdsGehrIdsUKGv+VTYFy+6fpUV2TTCUxrH1y9vJraM+m
         BtJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715332764; x=1715937564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fwcye2cmMvVkzOb2RmQWM8DhgejhAa5fax0EB+I/fqo=;
        b=KQuh0EDL3ZhEX8eJLCVuTSFsPU7ykHfdJfqwANTCVWFB7MJuoKiXdKGF/bYiBei+Qv
         hj/lCUTFkO0ksVhVe5wfwNUsX0MAoognQOgVh+tr1425ONnE04I2oXc7XOcxM34Vu8/h
         +Zu+h1qa9IfINVVvZnDjqGAnEaAh77i8MsaxvY9jtPg0Sl0rMIN8OcpjmZe1BFJbFFt9
         cFOv8i0R1IlLnVSn0dEyQiVmaV2iousV3a1YK2uIRg/Bj+RdQIydIv3g+VEndn/SRpup
         izZGhQIv3VelZ/sjKDVTkOLoO71Y8jS6yUvVgf7UyPbwOyGEaxLCjsm4Il8SOafaVyOJ
         fd2g==
X-Forwarded-Encrypted: i=1; AJvYcCXQ8CMZDDorMQMHnR5weVYkoK2ixZPBOH6qgkQORmtwTauHGElFEohrilCkAJ5wBV2z0Tyq8go6aRSTvzrBv/v4WkU4bhazXWD3
X-Gm-Message-State: AOJu0Yxp0EHKaZZuwDAm5mm688RtuXwpbPWD6sjMvau0vXqU6zEurmbm
	CqukqoM+P59ApOv9NsOfwyLf/ICcRxqJlxJT1eLdB6zPuNydjr5yPpVQ5mJJOcXuXYBPs3DjkTd
	pr4pNrSvyFBwi/5nsNvM6c0qPdzw=
X-Google-Smtp-Source: AGHT+IHc8ejS+uh+vZ4ONq0UjpSRCAJS/lYZfonb8VrowpLbGOm9rPid8UtfVuCRbn1pG5g/TjPFUolkPn0uDb6PLKo=
X-Received: by 2002:a05:6512:3e01:b0:515:d1a6:1b07 with SMTP id
 2adb3069b0e04-5220fc7bdc8mr2561142e87.15.1715332763829; Fri, 10 May 2024
 02:19:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240506155120.83105-1-libang.li@antgroup.com>
 <20240506155120.83105-6-libang.li@antgroup.com> <eb41fcb3-7207-40a8-9b49-0825a2e74e86@arm.com>
In-Reply-To: <eb41fcb3-7207-40a8-9b49-0825a2e74e86@arm.com>
From: Lance Yang <ioworker0@gmail.com>
Date: Fri, 10 May 2024 17:19:12 +0800
Message-ID: <CAK1f24mNZ5=HubBNcnuabzWAEqAALnnKVd3N9D5+jNBjxO6p+w@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] mm: Add update_mmu_tlb_range()
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Bang Li <libang.li@antgroup.com>, akpm@linux-foundation.org, 
	chenhuacai@kernel.org, tsbogend@alpha.franken.de, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, chris@zankel.net, jcmvbkbc@gmail.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org, david@redhat.com, libang.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2024 at 5:05=E2=80=AFPM Ryan Roberts <ryan.roberts@arm.com>=
 wrote:
>
> On 06/05/2024 16:51, Bang Li wrote:
> > After the commit 19eaf44954df ("mm: thp: support allocation of anonymou=
s
> > multi-size THP"), it may need to batch update tlb of an address range
> > through the update_mmu_tlb function. We can simplify this operation by
> > adding the update_mmu_tlb_range function, which may also reduce the
> > execution of some unnecessary code in some architectures.
> >
> > Signed-off-by: Bang Li <libang.li@antgroup.com>
> > ---
> >  include/linux/pgtable.h | 8 ++++++++
> >  mm/memory.c             | 4 +---
> >  2 files changed, 9 insertions(+), 3 deletions(-)
> >
> > diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> > index 18019f037bae..869bfe6054f1 100644
> > --- a/include/linux/pgtable.h
> > +++ b/include/linux/pgtable.h
> > @@ -737,6 +737,14 @@ static inline void update_mmu_tlb(struct vm_area_s=
truct *vma,
> >  #define __HAVE_ARCH_UPDATE_MMU_TLB
> >  #endif
>
> Given you are implementing update_mmu_tlb_range() in all the arches that
> currently override update_mmu_tlb() I wonder if it would be cleaner to re=
move
> update_mmu_tlb() from all those arches, and define generically, removing =
the
> ability for arches to override it:

Sounds great! Let's get it done.

>
> static inline void update_mmu_tlb(struct vm_area_struct *vma,
>                                 unsigned long address, pte_t *ptep)
> {
>         update_mmu_tlb_range(vma, address, ptep, 1);
> }
>
> >
> > +#ifndef __HAVE_ARCH_UPDATE_MMU_TLB_RANGE
> > +static inline void update_mmu_tlb_range(struct vm_area_struct *vma,
> > +                             unsigned long address, pte_t *ptep, unsig=
ned int nr)
> > +{
> > +}
> > +#define __HAVE_ARCH_UPDATE_MMU_TLB_RANGE
> > +#endif
>
> Then you could use the modern override scheme as Lance suggested and you =
won't
> have any confusion with __HAVE_ARCH_UPDATE_MMU_TLB because it won't exist=
 anymore.

+1. It might be better to use the modern override scheme :)

Thanks,
Lance

>
> > +
> >  /*
> >   * Some architectures may be able to avoid expensive synchronization
> >   * primitives when modifications are made to PTE's which are already
> > diff --git a/mm/memory.c b/mm/memory.c
> > index eea6e4984eae..2d53e29cf76e 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -4421,7 +4421,6 @@ static vm_fault_t do_anonymous_page(struct vm_fau=
lt *vmf)
> >       vm_fault_t ret =3D 0;
> >       int nr_pages =3D 1;
> >       pte_t entry;
> > -     int i;
> >
> >       /* File mapping without ->vm_ops ? */
> >       if (vma->vm_flags & VM_SHARED)
> > @@ -4491,8 +4490,7 @@ static vm_fault_t do_anonymous_page(struct vm_fau=
lt *vmf)
> >               update_mmu_tlb(vma, addr, vmf->pte);
> >               goto release;
> >       } else if (nr_pages > 1 && !pte_range_none(vmf->pte, nr_pages)) {
> > -             for (i =3D 0; i < nr_pages; i++)
> > -                     update_mmu_tlb(vma, addr + PAGE_SIZE * i, vmf->pt=
e + i);
> > +             update_mmu_tlb_range(vma, addr, vmf->pte, nr_pages);
>
> I certainly agree that this will be a useful helper to have. I expect the=
re will
> be more users in future.
>
> >               goto release;
> >       }
> >
>
