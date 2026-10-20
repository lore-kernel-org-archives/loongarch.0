Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792482457;
	b=x/ViQ4I50LFvow2gDYxMUssuXtWHGU4y5l9SYmfLOsjFBQFsH3/aVU5LZREqGt16tDdN
	 6L21PiOhvq5RkyiWUSC/5w+Cw9/Cp5pWJkuJ3S5n0l2NzpOgRbbH8qhuKZRcMYPHE4evX
	 B0sj3L7PP/x9/hmY9qBeH+Pwu3B0mOsjegqsY/oouNz68EuFHyotUCcnGHTLRy0IuqURG
	 8eJAMmtVejw6GOuZDeWYp2Uem/sIhz3GaWKFyoKV/9VvuZ65qIqrSWThWHgNE9EjJeIwF
	 a/Rm7pLHU7QLsYUhH7XAL03kRpNWYRX/sgAI5/9s8yuJCTJQ+0bAf/sK6+bopW8axDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482457;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=l9NeIHrubLPAjYxVhmVCTAvWZsv/vnJfAYa6hLXKzoI=;
	b=M6GCdDYrnHQbKJzMO2ToX4FZ/jUzoXon9e//fCsuCti99nzkRLf7qELRuRDsLeFUn/Z9
	 GMqcb9IXQK5Hrp10KiPEbO6YbjcCcE6a+RvVjbBB6Gn7OT9MuUSrlEFGBNov42J85LXCV
	 i5B3AJ6a5kt2+e2rwIpIOeHO2GM/PXwckIFUQhecZPDuAOJ75Q/xdTCQpfPt1DFohlc2u
	 BMTmolqJ7vE7whlKJsIvMtvbFMWuJTkI44ao0G7hn8VFx83bKyWPl8Ur8jMLKAVwIpBuf
	 iXWzTFRc55B0kLeW/Xzzx+rMBtzR6R7givx5TYpV3O67cby122eaRLdr+dQ7BEvUAuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lbmg7nwO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8093606A319
	for <loongarch@lists.linux.dev>; Tue, 20 Oct 2026 07:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lbmg7nwO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 632771F000C8
	for <loongarch@lists.linux.dev>; Tue, 20 Oct 2026 07:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792482456;
	bh=l9NeIHrubLPAjYxVhmVCTAvWZsv/vnJfAYa6hLXKzoI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lbmg7nwOp/uoUE1iYdeQjad+yWX32mbhDyHnriFcT+3Rp48Kbb6vW3RmnyKNQ6ost
	 YSSUNqZ+ePHfpgIhJztIustnq72yifu9uSxRK1EQi82uWKInD9pK20RI4p3wQFu8WG
	 ysSS6uft6K8gUOYCET95jMAN2JT4OGYjJw2fLHefNkGN+vSsU+DkZiuXefnuOQz5WG
	 lE0ByCLEsAS/jpyFCUXOWJEvjby0V4eBB7wmpLf1kPpOlnK+1LZMF/H/NKfIAYUbgx
	 PuCqBLxY60e6MOW05dJnaGsdO+7hlpARP0Tv644C9SXb3/IbHAXj7KFsyq50OIpSW2
	 Q6XmROwf9jS/Q==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b1aa377c61so3547186a12.3
        for <loongarch@lists.linux.dev>; Tue, 20 Oct 2026 00:47:36 -0700 (PDT)
X-Gm-Message-State: AFq9FYJrKwVR1W++WYsSu2u9Sy6QPVHbA61bSo6jwwKWy7DEnG9L3hPq
	3kVExPvJTy/OMvgW4kD5+N7/lQJRGkxqCnLU1iKFoDxrPTUMxnnzg7gImEFTPKVxygHnmc2dPj7
	hCb3w24AHiQ8mkf6cG/6ZcJvlZ5JUCA4=
X-Received: by 2002:a05:6402:13c4:b0:6b1:d2ee:392f with SMTP id
 4fb4d7f45d1cf-6b3a81a7587mr5587643a12.25.1792482454819; Tue, 20 Oct 2026
 00:47:34 -0700 (PDT)
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261012080448.134274-1-haoran.jiang@linux.dev>
 <CAAhV-H5jO2HYT+64usWxCuDYu3oVLV__vkBL3J8MpOKEGKL_XQ@mail.gmail.com>
 <4c3a6be6aeef21fc2a19c3525f87485322c47a57@linux.dev> <CAAhV-H6o9SrtdPx6g7-rFXSc8BcowR+Umdt60me62BEwFo_EHg@mail.gmail.com>
 <e6e123b78ffe040e80800db1c4aafbbfd20d2f56@linux.dev>
In-Reply-To: <e6e123b78ffe040e80800db1c4aafbbfd20d2f56@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 20 Oct 2026 15:47:23 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4KLo_jATwME61BLTPC8ns5ahRDme9s2C8GMvH1BkSmJQ@mail.gmail.com>
X-Gm-Features: AclHuK_eue81h3-BB0clg5YqVUGAVktFxUZTwZ1icgMK2Ej4LS-FUaTVD_rPHy4
Message-ID: <CAAhV-H4KLo_jATwME61BLTPC8ns5ahRDme9s2C8GMvH1BkSmJQ@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: add KASAN_VMALLOC support
To: haoran.jiang@linux.dev
Cc: loongarch@lists.linux.dev, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, kernel@xen0n.name, 
	Haoran Jiang <jianghaoran@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 10:37=E2=80=AFAM <haoran.jiang@linux.dev> wrote:
>
> 2026=E5=B9=B410=E6=9C=8817=E6=97=A5 16:24, "Huacai Chen" <chenhuacai@kern=
el.org mailto:chenhuacai@kernel.org?to=3D%22Huacai%20Chen%22%20%3Cchenhuaca=
i%40kernel.org%3E > =E5=86=99=E5=88=B0:
>
>
> >
> > On Fri, Oct 16, 2026 at 11:05 PM <haoran.jiang@linux.dev> wrote:
> >
> > >
> > > 2026=E5=B9=B410=E6=9C=8814=E6=97=A5 12:43, "Huacai Chen" <chenhuacai@=
kernel.org mailto:chenhuacai@kernel.org?to=3D%22Huacai%20Chen%22%20%3Cchenh=
uacai%40kernel.org%3E > =E5=86=99=E5=88=B0:
> > >
> > >  Hi, Haoran,
> > >
> > >  On Mon, Oct 12, 2026 at 4:05 PM <haoran.jiang@linux.dev> wrote:
> > >
> > >  >
> > >  > From: Haoran Jiang <jianghaoran@kylinos.cn>
> > >  >
> > >  > For the page table of the VMALLOC shadow region,
> > >  > only a partial page table needs to be established,
> > >  > allowing the complete page table entries to be
> > >  > populated on demand during use.
> > >  >
> > >  > ---
> > >  > 1,Through the kasan_shallow_populate_pgd/p4d/pud/pmd/pte functions=
,
> > >  > page tables are established for the modules and vmalloc regions,
> > >  > but the page tables are not fully populated; the complete page
> > >  > tables are established automatically when vmalloc is used.
> > >  >
> > >  Why also change modules together with vmalloc regions? Because they
> > >  can both alloc/free dynamically, and the current approch can only
> > >  handle "one time" for modules?
> > >
> > >  The shadow memory for modules regions is the same as that of vmalloc=
 regions=EF=BC=8C
> > >  full page tables can be built on demand during usage. Memory is allo=
cated
> > >  when loading modules, and the shadow memory of the allocated memory =
establishes
> > >  complete page tables via `kasan_populate_vmalloc_do`
> > >  (load_module->execmem_alloc->kasan_populate_vmalloc_do), similar to =
riscv and arm64.
> > >
> > The current code can also handle modules, so I want to know the
> > difference. I guess the current code can only handle a module loading
> > once, but this patch makes it possible to load/unload modules
> > repeatedly. But I'm not sure. Anyway, I don't want something to become
> > worse.
> >
>
> 1,With the current approach, the shadow page tables for the modules
> region are established via `kasan_map_populate` and `KASAN_VMALLOC=3Dn`.
> A test module performs an out-of-bounds write to a global array. After
> repeated `insmod`/`rmmod` cycles, the test module reports false positives=
.
> This is because the current flow does not properly clean up the shadow da=
ta.
>
>
>
> Taking x86 as an example, since x86 can be configured with KASAN_VMALLOC=
=3Dn,
> when KASAN_VMALLOC=3Dn, the correct flow is as follows:
x86 has some trouble implementing KASAN_VMALLOC? Or does x86's
solution have its advantage?

Huacai
>
> execmem_arch_setup -> flags =3D EXECMEM_KASAN_SHADOW, the flag is set to =
EXECMEM_KASAN_SHADOW,
> and the subsequent flow should select the correct path based on the EXECM=
EM_KASAN_SHADOW flag.
>
> insmod -> execmem_vmalloc -> (kasan && (kasan_alloc_module_shadow(p, size=
, GFP_KERNEL)
> -> register_global -> kasan_poison-> rmmod -> kasan_free_module_shadow
> -> vfree(kasan_mem_to_shadow(vm->addr));
>
> This flow it establishes the shadow page tables, then poisons them,
> and cleans up the shadow data when the module is unloaded.
>
>
>
> However, the current situation on LoongArch is as follows:
>
> execmem_arch_setup -> does not set EXECMEM_KASAN_SHADOW
>
> insmod -> execmem_vmalloc -> does not call kasan_alloc_module_shadow
> -> register_global -> kasan_poison-> rmmod -> kasan_free_module_shadow
> -> does not call vfree(kasan_mem_to_shadow(vm->addr));
>
> LoongArch does not set EXECMEM_KASAN_SHADOW during initialization, which
> causes the shadow data not to be properly cleaned up at unload time,
> potentially leading to false positives the next time a module is loaded.
>
>
>
> On RISC-V/arm64, KASAN_VMALLOC is enabled by default, and the shadow page
> tables for the module region are established and torn down via
> kasan_populate_vmalloc_do/kasan_release_vmalloc. This is exactly
> the approach that kasan_shallow_populate aims to implement.
>
>
>
> 2,kasan_shallow_populate requires fewer page tables than kasan_map_popula=
te,
> and it can also save memory during initialization.
>
>
> > >
> > > >
> > >  > If the address is pgd-aligned, the page table is established
> > >  > down to the pgd level; if it is pud-aligned, it is established
> > >  > down to the pud level, and so on. While establishing the
> > >  > /pgd/pud/pmd levels, the page table entries must be initialized
> > >  > to none. For example, a pmd entry of none is an invalid_pte_table.
> > >  > Only in this way can the correct page tables be established at
> > >  > use time. At the same time, boundary issues must be considered
> > >  > when the address is not aligned. For example, mem_to_shadow(MALLOC=
_END)
> > >  > and mem_to_shadow(vmemmap) are in the same pmd, and the region
> > >  > [mem_to_shadow(vmemmap), mem_to_shadow(VMEMMAP_END)] needs to be
> > >  > mapped to page 0. To avoid affecting the mem_to_shadow(vmemmap) re=
gion,
> > >  > only the pmd entries for [mem_to_shadow(MALLOC_END) & PMD_MASK, me=
m_to_shadow(MALLOC_END)]
> > >  > need to be initialized to invalid_pte_table. The remaining pmd ent=
ries are left as they are.
> > >  >
> > >  kasan_pgd_populate(early) populate the page table to early shadow
> > >  page, kasan_pgd_populate(!early) populate the page table to normal
> > >  shadow page, and kasan_shallow_populate() populate the page table to
> > >  invalid_{pud,pmd,pte}_table?
> > >
> > >  It seems you are do similar work as RISCV, and RISCV use three APIs
> > >  for this purpose: kasan_{,early,shallow}_populate_pgd(). But LoongAr=
ch
> > >  use the same API for the 1st and 2nd purpose, can we add a "shallow"
> > >  parameter to kasan_pgd_populate() so we can also handle the 3th
> > >  purpose?
> > >
> > >  Yes. `kasan_shallow_populate()` builds incomplete shadow page tables=
 for vmalloc and modules
> > >  regions and needs to handle boundaries. As an example:
> > >  `mem_to_shadow(VMALLOC_END)` and `mem_to_shadow(vmemmap)` share one =
PTE table.
> > >  The PTE entry for `mem_to_shadow(VMALLOC_END)` must be none, whereas=
 the PTE entry
> > >  for `mem_to_shadow(vmemmap)` points to `early_shadow_page`. The fina=
l page table
> > >  layout is shown below
> > >
> > >  pte +------
> > >  +------------------+
> > >  |early_shadow_page |
> > >  pmd +------------------+
> > >  +----------------+ |early_shadow_page |
> > >  |early_shadow_pte| +------------------+
> > >  +----------------+ | global |
> > >  | ptep |-----------+------------------+
> > >  +----------------+
> > >  | ... | pte
> > >  +----------------+ +--------------+
> > >  | ... | | global |
> > >  pgd +----------------+ +--------------+
> > >  +------------------+ | ptep |---------------| global |
> > >  | pmdp +----------+----------------+ +--------------+
> > >  +------------------+ pmd
> > >  | pmdp |----------+--------------+
> > >  +------------------+ |invalid_pte |
> > >  | | +--------------+
> > >  | ... | |invalid_pte |
> > >  | | +--------------+
> > >  +------------------+
> > >  | ... |
> > >  +------------------+ pmd
> > >  | ... | +------------+
> > >  +------------------+ | invalid_pte|
> > >  | ... | +------------+
> > >  +------------------+ | invalid_pte|
> > >  | pmdp |---------- +------------+
> > >  +------------------+
> > >  | ... |
> > >  +------------------+
> > >
> > >  `kasan_pgd_populate()` can handle the third case by adding a paramet=
er. I will implement this in the next version.
> > >
> > >  >
> > >  > 2,The removal of kasan_populate_early_shadow(mem_to_shadow((void *=
)VMALLOC_START),
> > >  > mem_to_shadow((void *)KFENCE_AREA_END)) achieves the same effect a=
s
> > >  > kasan_pgd_populate(KASAN_SHADOW_START, KASAN_SHADOW_END, NUMA_NO_N=
ODE, true);
> > >  > both map this region to a shared zero page. (KASAN_SHADOW_START, K=
ASAN_SHADOW_END)
> > >  > already covers (mem_to_shadow((void *)VMALLOC_START), mem_to_shado=
w((void *)KFENCE_AREA_END)).
> > >  > Other architectures such as arm64/riscv need kasan_populate_early_=
shadow
> > >  > because clear_shadow(KASAN_SHADOW_START, KASAN_SHADOW_END) is perf=
ormed before
> > >  > kasan_populate_early_shadow, so the reserved region must be mapped=
 to the zero
> > >  > page again. On LoongArch, however, the entire shadow space is firs=
t mapped to
> > >  > page 0 via kasan_pgd_populate, and then page tables are establishe=
d for the
> > >  > required regions, which is simpler and clearer.
> > >  >
> > >  > 3,pgd_none/p4d_none/pmd_none/pte_none were added to the definition=
s of
> > >  > __pgd_none/__p4d_none/__pud_none/__pmd_none/__pte_none respectivel=
y
> > >  > because kasan_populate_early_vm_area_shadow requires them.
> > >  > kasan_populate_early_vm_area_shadow establishes complete KASAN sha=
dow
> > >  > page table mappings for the early vmalloc regions before vmalloc_i=
nit.
> > >  > At this point, complete page tables need to be established, but
> > >  > kasan_populate_early_vm_area_shadow is called after step 1, at whi=
ch time
> > >  >
> > >  I'm a little confusing here. What is "step 1" here?
> > >
> > >  Step 1 refers to `kasan_shallow_populate()`. The page tables created=
 after
> > >  `kasan_shallow_populate()` are shown in the figure above. We need to=
 check
> > >  for empty entries using /pgd_none/p4d_none/pmd_none/pone_pte(). Only=
 then
> > >  can `kasan_map_populate()` build the full page tables.
> > >  `kasan_populate_early_vm_area_shadow()` runs after
> > >  `kasan_shallow_populate()` but before `vmalloc_init()`.
> > >  At this stage, page tables for vmalloc regions cannot be automatical=
ly
> > >  populated on demand, so we need to build full page tables here.
> > >
> > Then it is better to use `kasan_shallow_populate()` rather than `step 1=
`.
> >
> > Huacai
> >
> > >
> > > >
> > >  > only incomplete page tables have been established for the vmalloc =
region.
> > >  > The condition for a page table entry to be none requires the
> > >  > pgd_none/p4d_none/pmd_none/pte_none checks. Only by correctly dete=
rmining
> > >  > whether an entry is none can the complete page tables be establish=
ed properly.
> > >  >
> > >  > Test=EF=BC=9A
> > >  >
> > >  > https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-l=
oongson.git
> > >  >
> > >  > CONFIG_KUNIT=3Dy
> > >  >
> > >  > CONFIG_KASAN_KUNIT_TEST=3Dm
> > >  >
> > >  > Add `kunit.enable=3D1 kasan_multi_shot` to the cmdline.
> > >  >
> > >  > Test with 3-level 16K pages and 4-level 4K pages respectively.
> > >  >
> > >  > before this patch:
> > >  >
> > >  > ...
> > >  >
> > >  > [ 502.760009] ok 68 vmalloc_oob # SKIP Test requires CONFIG_KASAN_=
VMALLOC=3Dy
> > >  >
> > >  > ...
> > >  >
> > >  > [ 504.016000] # kasan: pass:49 fail:0 skip:26 total:75
> > >  > [ 504.016092] # Totals: pass:49 fail:0 skip:26 total:75
> > >  > [ 504.016171] ok 1 kasan
> > >  >
> > >  > after this patch:
> > >  >
> > >  > ...
> > >  >
> > >  > [ 531.630760] ok 68 vmalloc_oob
> > >  >
> > >  > ...
> > >  >
> > >  > [ 532.891057] # kasan: pass:50 fail:0 skip:25 total:75
> > >  > [ 532.891142] # Totals: pass:50 fail:0 skip:25 total:75
> > >  > [ 532.891219] ok 1 kasan
> > >  >
> > >  > Signed-off-by: Haoran Jiang <jianghaoran@kylinos.cn>
> > >  >
> > >  > ---
> > >  > arch/loongarch/Kconfig | 2 +
> > >  > arch/loongarch/mm/kasan_init.c | 173 +++++++++++++++++++++++++++++=
+---
> > >  > 2 files changed, 164 insertions(+), 11 deletions(-)
> > >  >
> > >  > diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> > >  > index 2067d1f2ad7a..c95c6fd8a138 100644
> > >  > --- a/arch/loongarch/Kconfig
> > >  > +++ b/arch/loongarch/Kconfig
> > >  > @@ -119,6 +119,7 @@ config LOONGARCH
> > >  > select HAVE_ARCH_JUMP_LABEL
> > >  > select HAVE_ARCH_JUMP_LABEL_RELATIVE
> > >  > select HAVE_ARCH_KASAN if 64BIT
> > >  > + select HAVE_ARCH_KASAN_VMALLOC
> > >  >
> > >  I think this should be limited by 64BIT.
> > >
> > >  Huacai
> > >
> > >  I will fix this in the next revision.
> > >
> > >  >
> > >  > select HAVE_ARCH_KFENCE if 64BIT
> > >  > select HAVE_ARCH_KGDB if PERF_EVENTS
> > >  > select HAVE_ARCH_KSTACK_ERASE
> > >  > @@ -187,6 +188,7 @@ config LOONGARCH
> > >  > select HOTPLUG_SMT if HOTPLUG_CPU
> > >  > select IRQ_FORCED_THREADING
> > >  > select IRQ_LOONGARCH_CPU
> > >  > + select KASAN_VMALLOC if KASAN
> > >  > select LOCK_MM_AND_FIND_VMA
> > >  > select MMU_GATHER_MERGE_VMAS if MMU
> > >  > select MMU_GATHER_RCU_TABLE_FREE
> > >  > diff --git a/arch/loongarch/mm/kasan_init.c b/arch/loongarch/mm/ka=
san_init.c
> > >  > index 92ca0ba86406..962c37316200 100644
> > >  > --- a/arch/loongarch/mm/kasan_init.c
> > >  > +++ b/arch/loongarch/mm/kasan_init.c
> > >  > @@ -17,28 +17,28 @@ static pgd_t kasan_pg_dir[PTRS_PER_PGD] __init=
data __aligned(PAGE_SIZE);
> > >  > #define __pgd_none(early, pgd) (0)
> > >  > #else
> > >  > #define __pgd_none(early, pgd) (early ? (pgd_val(pgd) =3D=3D 0) : =
\
> > >  > -(__pa(pgd_val(pgd)) =3D=3D (unsigned long)__pa(kasan_early_shadow=
_p4d)))
> > >  > +((__pa(pgd_val(pgd)) =3D=3D (unsigned long)__pa(kasan_early_shado=
w_p4d)) || pgd_none(pgd)))
> > >  > #endif
> > >  >
> > >  > #ifdef __PAGETABLE_PUD_FOLDED
> > >  > #define __p4d_none(early, p4d) (0)
> > >  > #else
> > >  > #define __p4d_none(early, p4d) (early ? (p4d_val(p4d) =3D=3D 0) : =
\
> > >  > -(__pa(p4d_val(p4d)) =3D=3D (unsigned long)__pa(kasan_early_shadow=
_pud)))
> > >  > +((__pa(p4d_val(p4d)) =3D=3D (unsigned long)__pa(kasan_early_shado=
w_pud)) || p4d_none(p4d)))
> > >  > #endif
> > >  >
> > >  > #ifdef __PAGETABLE_PMD_FOLDED
> > >  > #define __pud_none(early, pud) (0)
> > >  > #else
> > >  > #define __pud_none(early, pud) (early ? (pud_val(pud) =3D=3D 0) : =
\
> > >  > -(__pa(pud_val(pud)) =3D=3D (unsigned long)__pa(kasan_early_shadow=
_pmd)))
> > >  > +((__pa(pud_val(pud)) =3D=3D (unsigned long)__pa(kasan_early_shado=
w_pmd)) || pud_none(pud)))
> > >  > #endif
> > >  >
> > >  > #define __pmd_none(early, pmd) (early ? (pmd_val(pmd) =3D=3D 0) : =
\
> > >  > -(__pa(pmd_val(pmd)) =3D=3D (unsigned long)__pa(kasan_early_shadow=
_pte)))
> > >  > +((__pa(pmd_val(pmd)) =3D=3D (unsigned long)__pa(kasan_early_shado=
w_pte)) || pmd_none(pmd)))
> > >  >
> > >  > #define __pte_none(early, pte) (early ? pte_none(pte) : \
> > >  > -((pte_val(pte) & _PFN_MASK) =3D=3D (unsigned long)__pa(kasan_earl=
y_shadow_page)))
> > >  > +(((pte_val(pte) & _PFN_MASK) =3D=3D (unsigned long)__pa(kasan_ear=
ly_shadow_page)) || pte_none(pte)))
> > >  >
> > >  > static void *mem_to_shadow(const void *addr)
> > >  > {
> > >  > @@ -242,6 +242,160 @@ static void __init kasan_map_populate(unsign=
ed long start, unsigned long end,
> > >  > kasan_pgd_populate(start & PAGE_MASK, PAGE_ALIGN(end), node, false=
);
> > >  > }
> > >  >
> > >  > +static void __init kasan_shallow_populate_pte(pmd_t *pmdp, unsign=
ed long addr,
> > >  > + unsigned long end, int node)
> > >  > +{
> > >  > + unsigned long next;
> > >  > + pte_t *ptep =3D pte_offset_kernel(pmdp, addr);
> > >  > +
> > >  > + do {
> > >  > + next =3D addr + PAGE_SIZE;
> > >  > + if (__pte_none(false, ptep_get(ptep)))
> > >  > + pte_clear(&init_mm, addr, ptep);
> > >  > + } while (ptep++, addr =3D next, addr !=3D end);
> > >  > +}
> > >  > +
> > >  > +static void __init kasan_shallow_populate_pmd(pud_t *pudp, unsign=
ed long addr,
> > >  > + unsigned long end, int node)
> > >  > +{
> > >  > + unsigned long next;
> > >  > + pmd_t *pmdp =3D pmd_offset(pudp, addr);
> > >  > +
> > >  > + do {
> > >  > + next =3D pmd_addr_end(addr, end);
> > >  > +
> > >  > + if (__pmd_none(false, pmdp_get(pmdp))) {
> > >  > + phys_addr_t pte_phys =3D kasan_alloc_zeroed_page(node);
> > >  > +
> > >  > + if (IS_ALIGNED(addr, PMD_SIZE) && end - addr >=3D PMD_SIZE) {
> > >  > + kernel_pte_init(__va(pte_phys));
> > >  > + pmd_populate_kernel(NULL, pmdp, (pte_t *)__va(pte_phys));
> > >  > + continue;
> > >  > + } else {
> > >  > + memcpy(__va(pte_phys), kasan_early_shadow_pte,
> > >  > + sizeof(kasan_early_shadow_pte));
> > >  > + pmd_populate_kernel(NULL, pmdp, (pte_t *)__va(pte_phys));
> > >  > + }
> > >  > + }
> > >  > + kasan_shallow_populate_pte(pmdp, addr, next, node);
> > >  > + } while (pmdp++, addr =3D next, addr !=3D end);
> > >  > +}
> > >  > +
> > >  > +static void __init kasan_shallow_populate_pud(p4d_t *p4dp, unsign=
ed long addr,
> > >  > + unsigned long end, int node)
> > >  > +{
> > >  > + unsigned long next;
> > >  > + pud_t *pudp =3D pud_offset(p4dp, addr);
> > >  > +
> > >  > + do {
> > >  > + next =3D pud_addr_end(addr, end);
> > >  > +
> > >  > + if (__pud_none(false, pudp_get(pudp))) {
> > >  > +
> > >  > + phys_addr_t pmd_phys =3D kasan_alloc_zeroed_page(node);
> > >  > +
> > >  > + if (IS_ALIGNED(addr, PUD_SIZE) && end - addr >=3D PUD_SIZE) {
> > >  > +#ifndef __PAGETABLE_PMD_FOLDED
> > >  > + pmd_init(__va(pmd_phys));
> > >  > +#endif
> > >  > + pud_populate(&init_mm, pudp, (pmd_t *)__va(pmd_phys));
> > >  > + continue;
> > >  > + } else {
> > >  > + memcpy(__va(pmd_phys), kasan_early_shadow_pmd,
> > >  > + sizeof(kasan_early_shadow_pmd));
> > >  > + pud_populate(&init_mm, pudp, (pmd_t *)__va(pmd_phys));
> > >  > +
> > >  > + }
> > >  > + }
> > >  > +
> > >  > + kasan_shallow_populate_pmd(pudp, addr, next, node);
> > >  > + } while (pudp++, addr =3D next, addr !=3D end);
> > >  > +}
> > >  > +
> > >  > +static void __init kasan_shallow_populate_p4d(pgd_t *pgdp, unsign=
ed long addr,
> > >  > + unsigned long end, int node)
> > >  > +{
> > >  > + unsigned long next;
> > >  > + p4d_t *p4dp =3D p4d_offset(pgdp, addr);
> > >  > +
> > >  > + do {
> > >  > + next =3D p4d_addr_end(addr, end);
> > >  > +
> > >  > + if (__p4d_none(false, p4dp_get(p4dp))) {
> > >  > +
> > >  > + phys_addr_t pud_phys =3D kasan_alloc_zeroed_page(node);
> > >  > +
> > >  > + if (IS_ALIGNED(addr, P4D_SIZE) && end - addr >=3D P4D_SIZE) {
> > >  > +#ifndef __PAGETABLE_PUD_FOLDED
> > >  > + pud_init(__va(pud_phys));
> > >  > +#endif
> > >  > + p4d_populate(&init_mm, p4dp, (pud_t *)__va(pud_phys));
> > >  > + continue;
> > >  > + } else {
> > >  > + memcpy(__va(pud_phys), kasan_early_shadow_pud,
> > >  > + sizeof(kasan_early_shadow_pud));
> > >  > + p4d_populate(&init_mm, p4dp, (pud_t *)__va(pud_phys));
> > >  > + }
> > >  > + }
> > >  > + kasan_shallow_populate_pud(p4dp, addr, next, node);
> > >  > + } while (p4dp++, addr =3D next, addr !=3D end);
> > >  > +}
> > >  > +
> > >  > +static void __init kasan_shallow_populate_pgd(unsigned long addr,
> > >  > + unsigned long end, int node)
> > >  > +{
> > >  > + unsigned long next;
> > >  > + pgd_t *pgdp;
> > >  > +
> > >  > + pgdp =3D pgd_offset_k(addr);
> > >  > +
> > >  > + do {
> > >  > + next =3D pgd_addr_end(addr, end);
> > >  > +
> > >  > + if (__pgd_none(false, pgdp_get(pgdp))) {
> > >  > +
> > >  > + phys_addr_t p4d_phys =3D kasan_alloc_zeroed_page(node);
> > >  > +
> > >  > + if (IS_ALIGNED(addr, PGDIR_SIZE) && end - addr >=3D PGDIR_SIZE) =
{
> > >  > + pgd_init(__va(p4d_phys));
> > >  > + pgd_populate(&init_mm, pgdp, (p4d_t *)__va(p4d_phys));
> > >  > + continue;
> > >  > + } else {
> > >  > + memcpy(__va(p4d_phys), kasan_early_shadow_p4d,
> > >  > + sizeof(kasan_early_shadow_p4d));
> > >  > + pgd_populate(&init_mm, pgdp, (p4d_t *)__va(p4d_phys));
> > >  > + }
> > >  > + }
> > >  > +
> > >  > + kasan_shallow_populate_p4d(pgdp, addr, next, node);
> > >  > + } while (pgdp++, addr =3D next, addr !=3D end);
> > >  > +}
> > >  > +
> > >  > +static void __init kasan_shallow_populate(unsigned long start, un=
signed long end, int node)
> > >  > +{
> > >  > + unsigned long vaddr =3D (unsigned long)start & PAGE_MASK;
> > >  > + unsigned long vend =3D PAGE_ALIGN((unsigned long)end);
> > >  > +
> > >  > + kasan_shallow_populate_pgd(vaddr, vend, node);
> > >  > +}
> > >  > +
> > >  > +#ifdef CONFIG_KASAN_VMALLOC
> > >  > +void __init kasan_populate_early_vm_area_shadow(void *start, unsi=
gned long size)
> > >  > +{
> > >  > + unsigned long shadow_start, shadow_end;
> > >  > +
> > >  > + if (!is_vmalloc_or_module_addr(start))
> > >  > + return;
> > >  > +
> > >  > + shadow_start =3D (unsigned long)mem_to_shadow(start);
> > >  > + shadow_start =3D ALIGN_DOWN(shadow_start, PAGE_SIZE);
> > >  > + shadow_end =3D (unsigned long)mem_to_shadow(start + size);
> > >  > + shadow_end =3D ALIGN(shadow_end, PAGE_SIZE);
> > >  > +
> > >  > + kasan_map_populate(shadow_start, shadow_end, NUMA_NO_NODE);
> > >  > +}
> > >  > +#endif
> > >  > +
> > >  > asmlinkage void __init kasan_early_init(void)
> > >  > {
> > >  > BUILD_BUG_ON(!IS_ALIGNED(KASAN_SHADOW_START, PGDIR_SIZE));
> > >  > @@ -297,9 +451,6 @@ void __init kasan_init(void)
> > >  > /* Maps everything to a single page of zeroes */
> > >  > kasan_pgd_populate(KASAN_SHADOW_START, KASAN_SHADOW_END, NUMA_NO_N=
ODE, true);
> > >  >
> > >  > - kasan_populate_early_shadow(mem_to_shadow((void *)VMALLOC_START)=
,
> > >  > - mem_to_shadow((void *)KFENCE_AREA_END));
> > >  > -
> > >  > /* Populate the linear mapping */
> > >  > for_each_mem_range(i, &pa_start, &pa_end) {
> > >  > void *start =3D (void *)phys_to_virt(pa_start);
> > >  > @@ -309,9 +460,9 @@ void __init kasan_init(void)
> > >  > (unsigned long)mem_to_shadow(end), NUMA_NO_NODE);
> > >  > }
> > >  >
> > >  > - /* Populate modules mapping */
> > >  > - kasan_map_populate((unsigned long)mem_to_shadow((void *)MODULES_=
VADDR),
> > >  > - (unsigned long)mem_to_shadow((void *)MODULES_END), NUMA_NO_NODE)=
;
> > >  > + kasan_shallow_populate((unsigned long)mem_to_shadow((void *)MODU=
LES_VADDR),
> > >  > + (unsigned long)mem_to_shadow((void *)VMALLOC_END), NUMA_NO_NODE)=
;
> > >  > +
> > >  > /*
> > >  > * KAsan may reuse the contents of kasan_early_shadow_pte directly,=
 so we
> > >  > * should make sure that it maps the zero page read-only.
> > >  > --
> > >  > 2.43.0
> > >  >
> > >
> >
