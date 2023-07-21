Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D60338F
	for <loongarch@lists.linux.dev>; Fri, 21 Jul 2023 02:21:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4868C433CD
	for <loongarch@lists.linux.dev>; Fri, 21 Jul 2023 02:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689906111;
	bh=Knykh+EInv5Zscnlld9bQtU12JlWCpMs2wWNQ/ZqOlQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ebHf21S4abJsCKDrMcF1DFgXGdNCxtQ6vNOxjzV+wW2xLxPKhgJpz7ttfqm1pFcBn
	 Xx7+Q6hzNUhLrDo+kJqVLtet2/w4Zr9xAf+sQ47apvJtn2d5ZOtOWemsoeixYvZEEG
	 zHqMqoRGg/3RLYannVNdkBTj71nKrNT8uYXwhWcTAuwp+M5/ax4kfXH+XZISRniZu8
	 VwdXGFNB/7zRXBSyM5qssHHp0JFLaus0NcgNw4+1Jocl9TithnCPmV5LCw5Y0JTIJq
	 +0UdSBOJ9rR27TH1Clht4SS4nF2Te7sh3c7ojfTM6v2WOnZ3gWJMmcyiSlzvkIf8Cs
	 nGBInY0B6fn0g==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-51a52a7d859so5417631a12.0
        for <loongarch@lists.linux.dev>; Thu, 20 Jul 2023 19:21:51 -0700 (PDT)
X-Gm-Message-State: ABy/qLZMyLS8gyq6aMaP+Rx68pddS2VX9LPmZlL80/MmZ2ZB2pdEaK0z
	v6BcCZBy8SAbDmNJCsA/F7aWo6sgmTzVCJItr0Y=
X-Google-Smtp-Source: APBJJlFdMHymPppbp4bieRhk8hzMGPkLrj8SjadLTG/PCdpI8c49Hm2AWycJxXpXcv51IHfniIvPH/B0R20onpkcqxo=
X-Received: by 2002:aa7:d1c3:0:b0:51d:e185:a211 with SMTP id
 g3-20020aa7d1c3000000b0051de185a211mr581293edp.21.1689906109831; Thu, 20 Jul
 2023 19:21:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230719082732.2189747-1-lienze@kylinos.cn> <20230719082732.2189747-2-lienze@kylinos.cn>
 <CAAhV-H5pWmd2owMgH9hiqxoWpeAOKGv_=j2V-urA+D87_uCMyg@mail.gmail.com> <87pm4mf1xl.fsf@kylinos.cn>
In-Reply-To: <87pm4mf1xl.fsf@kylinos.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 21 Jul 2023 10:21:38 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4+8_gBMMdLhx=uEAsCN5wK7kFONsKDyGPqm0kxW8FU=A@mail.gmail.com>
Message-ID: <CAAhV-H4+8_gBMMdLhx=uEAsCN5wK7kFONsKDyGPqm0kxW8FU=A@mail.gmail.com>
Subject: Re: [PATCH 1/4] LoongArch: mm: Add page table mapped mode support
To: Enze Li <lienze@kylinos.cn>
Cc: kernel@xen0n.name, loongarch@lists.linux.dev, glider@google.com, 
	elver@google.com, akpm@linux-foundation.org, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, zhangqing@loongson.cn, yangtiezhu@loongson.cn, 
	dvyukov@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 21, 2023 at 10:12=E2=80=AFAM Enze Li <lienze@kylinos.cn> wrote:
>
> On Wed, Jul 19 2023 at 11:29:37 PM +0800, Huacai Chen wrote:
>
> > Hi, Enze,
> >
> > On Wed, Jul 19, 2023 at 4:34=E2=80=AFPM Enze Li <lienze@kylinos.cn> wro=
te:
> >>
> >> According to LoongArch documentation online, there are two types of ad=
dress
> >> translation modes: direct mapped address translation mode (direct mapp=
ed mode)
> >> and page table mapped address translation mode (page table mapped mode=
).
> >>
> >> Currently, the upstream code only supports DMM (Direct Mapped Mode).
> >> This patch adds a function that determines whether PTMM (Page Table
> >> Mapped Mode) should be used, and also adds the corresponding handler
> >> funcitons for both modes.
> >>
> >> For more details on the two modes, see [1].
> >>
> >> [1]
> >> https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.h=
tml#virtual-address-space-and-address-translation-mode
> >>
> >> Signed-off-by: Enze Li <lienze@kylinos.cn>
> >> ---
> >>  arch/loongarch/include/asm/page.h    | 10 ++++++++++
> >>  arch/loongarch/include/asm/pgtable.h |  6 ++++++
> >>  arch/loongarch/mm/pgtable.c          | 25 +++++++++++++++++++++++++
> >>  3 files changed, 41 insertions(+)
> >>
> >> diff --git a/arch/loongarch/include/asm/page.h b/arch/loongarch/includ=
e/asm/page.h
> >> index 26e8dccb6619..05919be15801 100644
> >> --- a/arch/loongarch/include/asm/page.h
> >> +++ b/arch/loongarch/include/asm/page.h
> >> @@ -84,7 +84,17 @@ typedef struct { unsigned long pgprot; } pgprot_t;
> >>  #define sym_to_pfn(x)          __phys_to_pfn(__pa_symbol(x))
> >>
> >>  #define virt_to_pfn(kaddr)     PFN_DOWN(PHYSADDR(kaddr))
> >> +
> >> +#ifdef CONFIG_64BIT
> >> +#define virt_to_page(kaddr)                                          =
  \
> >> +({                                                                   =
  \
> >> +       is_PTMM_addr((unsigned long)kaddr) ?                          =
  \
> >> +       PTMM_virt_to_page((unsigned long)kaddr) :                     =
  \
> >> +       DMM_virt_to_page((unsigned long)kaddr);                       =
  \
> >> +})
> > 1, Rename these helpers to
> > is_dmw_addr()/dmw_virt_to_page()/tlb_virt_to_page() will be better.
> > 2, These helpers are so simple so can be defined as inline function or
> > macros in page.h.
>
> Hi Huacai,
>
> Except for tlb_virt_to_page(), the remaining two modifications are easy.
>
> I've run into a lot of problems when trying to make tlb_virt_to_page()
> as a macro or inline function.  That's because we need to export this
> symbol in order for it to be used by the module that called the
> virt_to_page() function, other wise, we got the following errors,
>
> -----------------------------------------------------------------------
>   MODPOST Module.symvers
> ERROR: modpost: "tlb_virt_to_page" [fs/hfsplus/hfsplus.ko] undefined!
> ERROR: modpost: "tlb_virt_to_page" [fs/smb/client/cifs.ko] undefined!
> ERROR: modpost: "tlb_virt_to_page" [crypto/gcm.ko] undefined!
> ERROR: modpost: "tlb_virt_to_page" [crypto/ccm.ko] undefined!
> ERROR: modpost: "tlb_virt_to_page" [crypto/essiv.ko] undefined!
> ERROR: modpost: "tlb_virt_to_page" [lib/crypto/libchacha20poly1305.ko] un=
defined!
> ERROR: modpost: "tlb_virt_to_page" [drivers/gpu/drm/ttm/ttm.ko] undefined=
!
> ERROR: modpost: "tlb_virt_to_page" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]=
 undefined!
> ERROR: modpost: "tlb_virt_to_page" [drivers/scsi/iscsi_tcp.ko] undefined!
> ERROR: modpost: "tlb_virt_to_page" [drivers/scsi/qla2xxx/qla2xxx.ko] unde=
fined!
> WARNING: modpost: suppressed 44 unresolved symbol warnings because there =
were too many)
> -----------------------------------------------------------------------
>
> It seems to me that wrapping it into a common function might be the only
> way to successfully compile or link with this modification.
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> --- a/arch/loongarch/include/asm/pgtable.h
> +++ b/arch/loongarch/include/asm/pgtable.h
> @@ -360,6 +360,8 @@ static inline void pte_clear(struct mm_struct *mm, un=
signed long addr, pte_t *pt
>  #define PMD_T_LOG2     (__builtin_ffs(sizeof(pmd_t)) - 1)
>  #define PTE_T_LOG2     (__builtin_ffs(sizeof(pte_t)) - 1)
>
> +inline struct page *tlb_virt_to_page(unsigned long kaddr);
> +
>
> --- a/arch/loongarch/mm/pgtable.c
> +++ b/arch/loongarch/mm/pgtable.c
> @@ -9,6 +9,12 @@
>  #include <asm/pgtable.h>
>  #include <asm/tlbflush.h>
>
> +inline struct page *tlb_virt_to_page(unsigned long kaddr)
> +{
> +       return pte_page(*virt_to_kpte(kaddr));
> +}
> +EXPORT_SYMBOL_GPL(tlb_virt_to_page);
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>
> WDYT?
>
> Best Regards,
> Enze
If you define "static inline" functions in page.h, there will be no problem=
s.

Huacai
>
> > 3, CONFIG_64BIT can be removed here.
> >
> > Huacai
> >
> >> +#else
> >>  #define virt_to_page(kaddr)    pfn_to_page(virt_to_pfn(kaddr))
> >> +#endif
> >>
> >>  extern int __virt_addr_valid(volatile void *kaddr);
> >>  #define virt_addr_valid(kaddr) __virt_addr_valid((volatile void *)(ka=
ddr))
> >> diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/inc=
lude/asm/pgtable.h
> >> index ed6a37bb55b5..0fc074b8bd48 100644
> >> --- a/arch/loongarch/include/asm/pgtable.h
> >> +++ b/arch/loongarch/include/asm/pgtable.h
> >> @@ -360,6 +360,12 @@ static inline void pte_clear(struct mm_struct *mm=
, unsigned long addr, pte_t *pt
> >>  #define PMD_T_LOG2     (__builtin_ffs(sizeof(pmd_t)) - 1)
> >>  #define PTE_T_LOG2     (__builtin_ffs(sizeof(pte_t)) - 1)
> >>
> >> +#ifdef CONFIG_64BIT
> >> +struct page *DMM_virt_to_page(unsigned long kaddr);
> >> +struct page *PTMM_virt_to_page(unsigned long kaddr);
> >> +bool is_PTMM_addr(unsigned long kaddr);
> >> +#endif
> >> +
> >>  extern pgd_t swapper_pg_dir[];
> >>  extern pgd_t invalid_pg_dir[];
> >>
> >> diff --git a/arch/loongarch/mm/pgtable.c b/arch/loongarch/mm/pgtable.c
> >> index 36a6dc0148ae..4c6448f996b6 100644
> >> --- a/arch/loongarch/mm/pgtable.c
> >> +++ b/arch/loongarch/mm/pgtable.c
> >> @@ -9,6 +9,31 @@
> >>  #include <asm/pgtable.h>
> >>  #include <asm/tlbflush.h>
> >>
> >> +#ifdef CONFIG_64BIT
> >> +/* DMM stands for Direct Mapped Mode. */
> >> +struct page *DMM_virt_to_page(unsigned long kaddr)
> >> +{
> >> +       return pfn_to_page(virt_to_pfn(kaddr));
> >> +}
> >> +EXPORT_SYMBOL_GPL(DMM_virt_to_page);
> >> +
> >> +/* PTMM stands for Page Table Mapped Mode. */
> >> +struct page *PTMM_virt_to_page(unsigned long kaddr)
> >> +{
> >> +       return pte_page(*virt_to_kpte(kaddr));
> >> +}
> >> +EXPORT_SYMBOL_GPL(PTMM_virt_to_page);
> >> +
> >> +bool is_PTMM_addr(unsigned long kaddr)
> >> +{
> >> +       if (unlikely((kaddr & GENMASK(BITS_PER_LONG - 1, cpu_vabits)) =
=3D=3D
> >> +                    GENMASK(BITS_PER_LONG - 1, cpu_vabits)))
> >> +               return true;
> >> +       return false;
> >> +}
> >> +EXPORT_SYMBOL_GPL(is_PTMM_addr);
> >> +#endif
> >> +
> >>  pgd_t *pgd_alloc(struct mm_struct *mm)
> >>  {
> >>         pgd_t *ret, *init;
> >> --
> >> 2.34.1
> >>
> >>
>
