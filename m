Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4654B3D6C
	for <loongarch@lists.linux.dev>; Wed, 14 Jun 2023 09:30:19 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5700b37da3fso3355947b3.1
        for <loongarch@lists.linux.dev>; Wed, 14 Jun 2023 02:30:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686735018; x=1689327018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sUg4qrNPX3u1L7teHyX+L+B+2nv6pGpY1jj7jQmio6E=;
        b=QjwyPUGbRM2mOfCBh6iR93+2257t+znGsQmIsBxtw6oBVMSsKkWU2OOUKZ2aaiEbrp
         MO85qPSyPZmmwylu6WrIBdX1xNs9rIwAiHdqPMG+7pnkeAhFGVihWaqmC/CJow6I9lSt
         boaSzAvHq1tanbPyYSsbHvSn/m7l/hvEIrpWTaogmjOBMfLfBMlTwcv8DVit8ZrDwLJh
         e7s9gkuDlaEsohatAC2S+u7RqSU3fBMYTh9+XT8yIe+prluWSaMy+QG9ER1f/XJMn8gK
         gE19ikptSpiBLCQwYu/XWrEr1jeFW2cnHm5aINxGNzliiP1vpdar4qo2z0gfyigrFkVz
         qEgg==
X-Gm-Message-State: AC+VfDyUzTN94qtcY8XJWSGQUGOsIgXKZJ03V2W+6uP3/PmIe/PeoNB3
	7kBYl480PBpBo6kxfohbKOPDJ9H6QRTfkA==
X-Google-Smtp-Source: ACHHUZ6qR0XcFAFC6tnPym4mL/U+sznUJtmFro9ZdMudT79Gsb7qcVZ/+8OK/nYm/djivnmHG3VHKg==
X-Received: by 2002:a81:c30e:0:b0:56c:f0b3:d845 with SMTP id r14-20020a81c30e000000b0056cf0b3d845mr1452173ywk.3.1686735018641;
        Wed, 14 Jun 2023 02:30:18 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id t9-20020a0dea09000000b0056d4649670fsm1397359ywe.133.2023.06.14.02.30.17
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 02:30:17 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5701810884aso442627b3.0
        for <loongarch@lists.linux.dev>; Wed, 14 Jun 2023 02:30:17 -0700 (PDT)
X-Received: by 2002:a25:6b47:0:b0:ba8:2009:ccbb with SMTP id
 o7-20020a256b47000000b00ba82009ccbbmr1338474ybm.46.1686735017346; Wed, 14 Jun
 2023 02:30:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-28-vishal.moola@gmail.com> <e52c7a74-da68-08d2-54e2-f95a8c5b52e7@kernel.org>
In-Reply-To: <e52c7a74-da68-08d2-54e2-f95a8c5b52e7@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jun 2023 11:30:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXPASfLM8St_JZOW3Wke+ickJoo1oDr+orRbTERy=Zgwg@mail.gmail.com>
Message-ID: <CAMuHMdXPASfLM8St_JZOW3Wke+ickJoo1oDr+orRbTERy=Zgwg@mail.gmail.com>
Subject: Re: [PATCH v4 27/34] nios2: Convert __pte_free_tlb() to use ptdescs
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, xen-devel@lists.xenproject.org, 
	kvm@vger.kernel.org, Hugh Dickins <hughd@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dinh,

On Wed, Jun 14, 2023 at 12:17=E2=80=AFAM Dinh Nguyen <dinguyen@kernel.org> =
wrote:
> On 6/12/23 16:04, Vishal Moola (Oracle) wrote:
> > Part of the conversions to replace pgtable constructor/destructors with
> > ptdesc equivalents.
> >
> > Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> > ---
> >   arch/nios2/include/asm/pgalloc.h | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/nios2/include/asm/pgalloc.h b/arch/nios2/include/asm/=
pgalloc.h
> > index ecd1657bb2ce..ce6bb8e74271 100644
> > --- a/arch/nios2/include/asm/pgalloc.h
> > +++ b/arch/nios2/include/asm/pgalloc.h
> > @@ -28,10 +28,10 @@ static inline void pmd_populate(struct mm_struct *m=
m, pmd_t *pmd,
> >
> >   extern pgd_t *pgd_alloc(struct mm_struct *mm);
> >
> > -#define __pte_free_tlb(tlb, pte, addr)                               \
> > -     do {                                                    \
> > -             pgtable_pte_page_dtor(pte);                     \
> > -             tlb_remove_page((tlb), (pte));                  \
> > +#define __pte_free_tlb(tlb, pte, addr)                                =
       \
> > +     do {                                                            \
> > +             pagetable_pte_dtor(page_ptdesc(pte));                   \
> > +             tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));      \
> >       } while (0)
> >
> >   #endif /* _ASM_NIOS2_PGALLOC_H */
>
> Applied!

I don't think you can just apply this patch, as the new functions
were only introduced in [PATCH v4 05/34] of this series.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
