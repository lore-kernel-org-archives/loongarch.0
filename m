Received: from mta0.migadu.com (out-94.mta0.migadu.com [91.218.175.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C1F3C1D7D
	for <loongarch@lists.linux.dev>; Fri, 16 Oct 2026 15:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792163104; cv=none; b=Pr1uLKMavh1lPqlUz2bOYiwA8vNM+i/fa4f3tCOSbSkVwErHdGCuXy18vRV5N9/kpopMaA3S73d5lbxTRZu0f39b+m+xe45Cn3hQpopcNFd+7H/VuOSNyWthaFCUN+MTmJsbjAhpjvqxSEDbwJoPiUMVkH7oEOHF4bSqsw28rI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792163104; c=relaxed/simple;
	bh=3PUy0Q9YdbnO0nF7MQzC3t4hINWEgnoq5LgvEdt6mX0=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=bueIGyt+jh2DJKKNJAPZGV3kU1bJeXXusKF9hyxA+lAVdo9LWcIrMhdURDjWm0N6zz336Aa7gNiqIicfxhsTMTPN2TQ1dNqp/EVXnDUeu4aciqOSo/GsRFT375p0KAfcsBYx3W11VAs/G8ngLruxESRrGQ3gWK7diiy2UELdjBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pUWALQY4; arc=none smtp.client-ip=91.218.175.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pUWALQY4"
X-Envelope-To: loongarch@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=3PUy0Q9YdbnO0nF7MQzC3t4hINWEgnoq5LgvEdt6mX0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792163097; v=1; x=1792767897;
 b=pUWALQY4jEw049f9xcwUjrHcdWeq7XIhveVvTAu7TaJVtQ6Ebyfu7BwLHvsX05hn0ai+bWxl
 NNf6dx9rtql6VWkhdbKtGrXfQucppFfCTf3sKUo1KM9crt6dHTr1m5VN6ShOGdLPNvA62uA8FJy
 ysTD1AeHx67rzl+Mx1R+1B6I=
X-Envelope-To: loongarch@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 1a5e5d6d016d774e;
	Fri, 16 Oct 2026 15:04:57 +0000
X-Mizu-Trace-ID: 1a5e5d6d016d774e
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 16 Oct 2026 15:04:55 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: haoran.jiang@linux.dev
Message-ID: <4c3a6be6aeef21fc2a19c3525f87485322c47a57@linux.dev>
TLS-Required: No
Subject: Re: [PATCH] LoongArch: add KASAN_VMALLOC support
To: "Huacai Chen" <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, kasan-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, kernel@xen0n.name, "Haoran Jiang"
 <jianghaoran@kylinos.cn>
In-Reply-To: <CAAhV-H5jO2HYT+64usWxCuDYu3oVLV__vkBL3J8MpOKEGKL_XQ@mail.gmail.com>
References: <20261012080448.134274-1-haoran.jiang@linux.dev>
 <CAAhV-H5jO2HYT+64usWxCuDYu3oVLV__vkBL3J8MpOKEGKL_XQ@mail.gmail.com>

2026=E5=B9=B410=E6=9C=8814=E6=97=A5 12:43, "Huacai Chen" <chenhuacai@kern=
el.org mailto:chenhuacai@kernel.org?to=3D%22Huacai%20Chen%22%20%3Cchenhua=
cai%40kernel.org%3E > =E5=86=99=E5=88=B0:


>=20
>=20Hi, Haoran,
>=20
>=20On Mon, Oct 12, 2026 at 4:05 PM <haoran.jiang@linux.dev> wrote:
>=20
>=20>=20
>=20> From: Haoran Jiang <jianghaoran@kylinos.cn>
> >=20
>=20>  For the page table of the VMALLOC shadow region,
> >  only a partial page table needs to be established,
> >  allowing the complete page table entries to be
> >  populated on demand during use.
> >=20
>=20>  ---
> >  1,Through the kasan_shallow_populate_pgd/p4d/pud/pmd/pte functions,
> >  page tables are established for the modules and vmalloc regions,
> >  but the page tables are not fully populated; the complete page
> >  tables are established automatically when vmalloc is used.
> >=20
>=20Why also change modules together with vmalloc regions? Because they
> can both alloc/free dynamically, and the current approch can only
> handle "one time" for modules?
>=20

The=20shadow memory for modules regions is the same as that of vmalloc re=
gions=EF=BC=8C
full page tables can be built on demand during usage. Memory is allocated=
=20
when=20loading modules, and the shadow memory of the allocated memory est=
ablishes=20
complete=20page tables via `kasan_populate_vmalloc_do`=20
(load_module->execmem_alloc->kasan_populate_vmalloc_do),=20similar to ris=
cv and arm64.

> >=20
>=20> If the address is pgd-aligned, the page table is established
> >  down to the pgd level; if it is pud-aligned, it is established
> >  down to the pud level, and so on. While establishing the
> >  /pgd/pud/pmd levels, the page table entries must be initialized
> >  to none. For example, a pmd entry of none is an invalid_pte_table.
> >  Only in this way can the correct page tables be established at
> >  use time. At the same time, boundary issues must be considered
> >  when the address is not aligned. For example, mem_to_shadow(MALLOC_E=
ND)
> >  and mem_to_shadow(vmemmap) are in the same pmd, and the region
> >  [mem_to_shadow(vmemmap), mem_to_shadow(VMEMMAP_END)] needs to be
> >  mapped to page 0. To avoid affecting the mem_to_shadow(vmemmap) regi=
on,
> >  only the pmd entries for [mem_to_shadow(MALLOC_END) & PMD_MASK, mem_=
to_shadow(MALLOC_END)]
> >  need to be initialized to invalid_pte_table. The remaining pmd entri=
es are left as they are.
> >=20
>=20kasan_pgd_populate(early) populate the page table to early shadow
> page, kasan_pgd_populate(!early) populate the page table to normal
> shadow page, and kasan_shallow_populate() populate the page table to
> invalid_{pud,pmd,pte}_table?
>=20
>=20It seems you are do similar work as RISCV, and RISCV use three APIs
> for this purpose: kasan_{,early,shallow}_populate_pgd(). But LoongArch
> use the same API for the 1st and 2nd purpose, can we add a "shallow"
> parameter to kasan_pgd_populate() so we can also handle the 3th
> purpose?
>=20

Yes.=20`kasan_shallow_populate()` builds incomplete shadow page tables fo=
r vmalloc and modules
regions and needs to handle boundaries. As an example:=20
`mem_to_shadow(VMALLOC_END)`=20and `mem_to_shadow(vmemmap)` share one PTE=
 table.=20
The=20PTE entry for `mem_to_shadow(VMALLOC_END)` must be none, whereas th=
e PTE entry=20
for=20`mem_to_shadow(vmemmap)` points to `early_shadow_page`. The final p=
age table=20
layout=20is shown below



                                                                  pte    =
                                                                         =
                       +------=20
=20                                                          +-----------=
-------+
                                                           |early_shadow_=
page |
                                  pmd                      +-------------=
-----+
                              +----------------+           |early_shadow_=
page |=20
=20                             |early_shadow_pte|           +-----------=
-------+
                              +----------------+           |     global  =
     |=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20
=20                             |    ptep        |-----------+-----------=
-------+=20
=20                             +----------------+
                              |    ...         |                     pte
                              +----------------+               +---------=
-----+
                              |    ...         |               |     glob=
al   |
     pgd                      +----------------+               +---------=
-----+
+------------------+          |    ptep        |---------------|     glob=
al   |=20=20=20
|=20     pmdp        +----------+----------------+               +-------=
-------+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
+------------------+=20               pmd=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
|=20     pmdp        |----------+--------------+=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
+------------------+=20         |invalid_pte   |=20=20
|=20                 |          +--------------+=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
|=20      ...        |          |invalid_pte   |
|                  |          +--------------+
+------------------+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20
|=20      ...        |=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20
+------------------+=20               pmd=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20
|=20      ...        |           +------------+
+------------------+           | invalid_pte|=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20
|=20      ...        |           +------------+=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
+------------------+=20          | invalid_pte|=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
|=20     pmdp        |---------- +------------+=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
+------------------+=20=20=20=20
|=20      ...        |
+------------------+


`kasan_pgd_populate()` can handle the third case by adding a parameter. I=
 will implement this in the next version.=20=20



>=20>=20
>=20> 2,The removal of kasan_populate_early_shadow(mem_to_shadow((void *)=
VMALLOC_START),
> >  mem_to_shadow((void *)KFENCE_AREA_END)) achieves the same effect as
> >  kasan_pgd_populate(KASAN_SHADOW_START, KASAN_SHADOW_END, NUMA_NO_NOD=
E, true);
> >  both map this region to a shared zero page. (KASAN_SHADOW_START, KAS=
AN_SHADOW_END)
> >  already covers (mem_to_shadow((void *)VMALLOC_START), mem_to_shadow(=
(void *)KFENCE_AREA_END)).
> >  Other architectures such as arm64/riscv need kasan_populate_early_sh=
adow
> >  because clear_shadow(KASAN_SHADOW_START, KASAN_SHADOW_END) is perfor=
med before
> >  kasan_populate_early_shadow, so the reserved region must be mapped t=
o the zero
> >  page again. On LoongArch, however, the entire shadow space is first =
mapped to
> >  page 0 via kasan_pgd_populate, and then page tables are established =
for the
> >  required regions, which is simpler and clearer.
> >=20
>=20>  3,pgd_none/p4d_none/pmd_none/pte_none were added to the definition=
s of
> >  __pgd_none/__p4d_none/__pud_none/__pmd_none/__pte_none respectively
> >  because kasan_populate_early_vm_area_shadow requires them.
> >  kasan_populate_early_vm_area_shadow establishes complete KASAN shado=
w
> >  page table mappings for the early vmalloc regions before vmalloc_ini=
t.
> >  At this point, complete page tables need to be established, but
> >  kasan_populate_early_vm_area_shadow is called after step 1, at which=
 time
> >=20
>=20I'm a little confusing here. What is "step 1" here?

Step 1 refers to `kasan_shallow_populate()`. The page tables created afte=
r=20
`kasan_shallow_populate()`=20are shown in the figure above. We need to ch=
eck=20
for=20empty entries using /pgd_none/p4d_none/pmd_none/pone_pte(). Only th=
en=20
can=20`kasan_map_populate()` build the full page tables.
`kasan_populate_early_vm_area_shadow()` runs after=20
`kasan_shallow_populate()`=20but before `vmalloc_init()`.=20
At=20this stage, page tables for vmalloc regions cannot be automatically=
=20
populated=20on demand, so we need to build full page tables here.


>=20
>=20>=20
>=20> only incomplete page tables have been established for the vmalloc r=
egion.
> >  The condition for a page table entry to be none requires the
> >  pgd_none/p4d_none/pmd_none/pte_none checks. Only by correctly determ=
ining
> >  whether an entry is none can the complete page tables be established=
 properly.
> >=20
>=20>  Test=EF=BC=9A
> >=20
>=20>  https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-l=
oongson.git
> >=20
>=20>  CONFIG_KUNIT=3Dy
> >=20
>=20>  CONFIG_KASAN_KUNIT_TEST=3Dm
> >=20
>=20>  Add `kunit.enable=3D1 kasan_multi_shot` to the cmdline.
> >=20
>=20>  Test with 3-level 16K pages and 4-level 4K pages respectively.
> >=20
>=20>  before this patch:
> >=20
>=20>  ...
> >=20
>=20>  [ 502.760009] ok 68 vmalloc_oob # SKIP Test requires CONFIG_KASAN_=
VMALLOC=3Dy
> >=20
>=20>  ...
> >=20
>=20>  [ 504.016000] # kasan: pass:49 fail:0 skip:26 total:75
> >  [ 504.016092] # Totals: pass:49 fail:0 skip:26 total:75
> >  [ 504.016171] ok 1 kasan
> >=20
>=20>  after this patch:
> >=20
>=20>  ...
> >=20
>=20>  [ 531.630760] ok 68 vmalloc_oob
> >=20
>=20>  ...
> >=20
>=20>  [ 532.891057] # kasan: pass:50 fail:0 skip:25 total:75
> >  [ 532.891142] # Totals: pass:50 fail:0 skip:25 total:75
> >  [ 532.891219] ok 1 kasan
> >=20
>=20>  Signed-off-by: Haoran Jiang <jianghaoran@kylinos.cn>
> >=20
>=20>  ---
> >  arch/loongarch/Kconfig | 2 +
> >  arch/loongarch/mm/kasan_init.c | 173 ++++++++++++++++++++++++++++++-=
--
> >  2 files changed, 164 insertions(+), 11 deletions(-)
> >=20
>=20>  diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> >  index 2067d1f2ad7a..c95c6fd8a138 100644
> >  --- a/arch/loongarch/Kconfig
> >  +++ b/arch/loongarch/Kconfig
> >  @@ -119,6 +119,7 @@ config LOONGARCH
> >  select HAVE_ARCH_JUMP_LABEL
> >  select HAVE_ARCH_JUMP_LABEL_RELATIVE
> >  select HAVE_ARCH_KASAN if 64BIT
> >  + select HAVE_ARCH_KASAN_VMALLOC
> >=20
>=20I think this should be limited by 64BIT.
>=20
>=20Huacai

I will fix this in the next revision.

>=20
>=20>=20
>=20> select HAVE_ARCH_KFENCE if 64BIT
> >  select HAVE_ARCH_KGDB if PERF_EVENTS
> >  select HAVE_ARCH_KSTACK_ERASE
> >  @@ -187,6 +188,7 @@ config LOONGARCH
> >  select HOTPLUG_SMT if HOTPLUG_CPU
> >  select IRQ_FORCED_THREADING
> >  select IRQ_LOONGARCH_CPU
> >  + select KASAN_VMALLOC if KASAN
> >  select LOCK_MM_AND_FIND_VMA
> >  select MMU_GATHER_MERGE_VMAS if MMU
> >  select MMU_GATHER_RCU_TABLE_FREE
> >  diff --git a/arch/loongarch/mm/kasan_init.c b/arch/loongarch/mm/kasa=
n_init.c
> >  index 92ca0ba86406..962c37316200 100644
> >  --- a/arch/loongarch/mm/kasan_init.c
> >  +++ b/arch/loongarch/mm/kasan_init.c
> >  @@ -17,28 +17,28 @@ static pgd_t kasan_pg_dir[PTRS_PER_PGD] __initda=
ta __aligned(PAGE_SIZE);
> >  #define __pgd_none(early, pgd) (0)
> >  #else
> >  #define __pgd_none(early, pgd) (early ? (pgd_val(pgd) =3D=3D 0) : \
> >  -(__pa(pgd_val(pgd)) =3D=3D (unsigned long)__pa(kasan_early_shadow_p=
4d)))
> >  +((__pa(pgd_val(pgd)) =3D=3D (unsigned long)__pa(kasan_early_shadow_=
p4d)) || pgd_none(pgd)))
> >  #endif
> >=20
>=20>  #ifdef __PAGETABLE_PUD_FOLDED
> >  #define __p4d_none(early, p4d) (0)
> >  #else
> >  #define __p4d_none(early, p4d) (early ? (p4d_val(p4d) =3D=3D 0) : \
> >  -(__pa(p4d_val(p4d)) =3D=3D (unsigned long)__pa(kasan_early_shadow_p=
ud)))
> >  +((__pa(p4d_val(p4d)) =3D=3D (unsigned long)__pa(kasan_early_shadow_=
pud)) || p4d_none(p4d)))
> >  #endif
> >=20
>=20>  #ifdef __PAGETABLE_PMD_FOLDED
> >  #define __pud_none(early, pud) (0)
> >  #else
> >  #define __pud_none(early, pud) (early ? (pud_val(pud) =3D=3D 0) : \
> >  -(__pa(pud_val(pud)) =3D=3D (unsigned long)__pa(kasan_early_shadow_p=
md)))
> >  +((__pa(pud_val(pud)) =3D=3D (unsigned long)__pa(kasan_early_shadow_=
pmd)) || pud_none(pud)))
> >  #endif
> >=20
>=20>  #define __pmd_none(early, pmd) (early ? (pmd_val(pmd) =3D=3D 0) : =
\
> >  -(__pa(pmd_val(pmd)) =3D=3D (unsigned long)__pa(kasan_early_shadow_p=
te)))
> >  +((__pa(pmd_val(pmd)) =3D=3D (unsigned long)__pa(kasan_early_shadow_=
pte)) || pmd_none(pmd)))
> >=20
>=20>  #define __pte_none(early, pte) (early ? pte_none(pte) : \
> >  -((pte_val(pte) & _PFN_MASK) =3D=3D (unsigned long)__pa(kasan_early_=
shadow_page)))
> >  +(((pte_val(pte) & _PFN_MASK) =3D=3D (unsigned long)__pa(kasan_early=
_shadow_page)) || pte_none(pte)))
> >=20
>=20>  static void *mem_to_shadow(const void *addr)
> >  {
> >  @@ -242,6 +242,160 @@ static void __init kasan_map_populate(unsigned=
 long start, unsigned long end,
> >  kasan_pgd_populate(start & PAGE_MASK, PAGE_ALIGN(end), node, false);
> >  }
> >=20
>=20>  +static void __init kasan_shallow_populate_pte(pmd_t *pmdp, unsign=
ed long addr,
> >  + unsigned long end, int node)
> >  +{
> >  + unsigned long next;
> >  + pte_t *ptep =3D pte_offset_kernel(pmdp, addr);
> >  +
> >  + do {
> >  + next =3D addr + PAGE_SIZE;
> >  + if (__pte_none(false, ptep_get(ptep)))
> >  + pte_clear(&init_mm, addr, ptep);
> >  + } while (ptep++, addr =3D next, addr !=3D end);
> >  +}
> >  +
> >  +static void __init kasan_shallow_populate_pmd(pud_t *pudp, unsigned=
 long addr,
> >  + unsigned long end, int node)
> >  +{
> >  + unsigned long next;
> >  + pmd_t *pmdp =3D pmd_offset(pudp, addr);
> >  +
> >  + do {
> >  + next =3D pmd_addr_end(addr, end);
> >  +
> >  + if (__pmd_none(false, pmdp_get(pmdp))) {
> >  + phys_addr_t pte_phys =3D kasan_alloc_zeroed_page(node);
> >  +
> >  + if (IS_ALIGNED(addr, PMD_SIZE) && end - addr >=3D PMD_SIZE) {
> >  + kernel_pte_init(__va(pte_phys));
> >  + pmd_populate_kernel(NULL, pmdp, (pte_t *)__va(pte_phys));
> >  + continue;
> >  + } else {
> >  + memcpy(__va(pte_phys), kasan_early_shadow_pte,
> >  + sizeof(kasan_early_shadow_pte));
> >  + pmd_populate_kernel(NULL, pmdp, (pte_t *)__va(pte_phys));
> >  + }
> >  + }
> >  + kasan_shallow_populate_pte(pmdp, addr, next, node);
> >  + } while (pmdp++, addr =3D next, addr !=3D end);
> >  +}
> >  +
> >  +static void __init kasan_shallow_populate_pud(p4d_t *p4dp, unsigned=
 long addr,
> >  + unsigned long end, int node)
> >  +{
> >  + unsigned long next;
> >  + pud_t *pudp =3D pud_offset(p4dp, addr);
> >  +
> >  + do {
> >  + next =3D pud_addr_end(addr, end);
> >  +
> >  + if (__pud_none(false, pudp_get(pudp))) {
> >  +
> >  + phys_addr_t pmd_phys =3D kasan_alloc_zeroed_page(node);
> >  +
> >  + if (IS_ALIGNED(addr, PUD_SIZE) && end - addr >=3D PUD_SIZE) {
> >  +#ifndef __PAGETABLE_PMD_FOLDED
> >  + pmd_init(__va(pmd_phys));
> >  +#endif
> >  + pud_populate(&init_mm, pudp, (pmd_t *)__va(pmd_phys));
> >  + continue;
> >  + } else {
> >  + memcpy(__va(pmd_phys), kasan_early_shadow_pmd,
> >  + sizeof(kasan_early_shadow_pmd));
> >  + pud_populate(&init_mm, pudp, (pmd_t *)__va(pmd_phys));
> >  +
> >  + }
> >  + }
> >  +
> >  + kasan_shallow_populate_pmd(pudp, addr, next, node);
> >  + } while (pudp++, addr =3D next, addr !=3D end);
> >  +}
> >  +
> >  +static void __init kasan_shallow_populate_p4d(pgd_t *pgdp, unsigned=
 long addr,
> >  + unsigned long end, int node)
> >  +{
> >  + unsigned long next;
> >  + p4d_t *p4dp =3D p4d_offset(pgdp, addr);
> >  +
> >  + do {
> >  + next =3D p4d_addr_end(addr, end);
> >  +
> >  + if (__p4d_none(false, p4dp_get(p4dp))) {
> >  +
> >  + phys_addr_t pud_phys =3D kasan_alloc_zeroed_page(node);
> >  +
> >  + if (IS_ALIGNED(addr, P4D_SIZE) && end - addr >=3D P4D_SIZE) {
> >  +#ifndef __PAGETABLE_PUD_FOLDED
> >  + pud_init(__va(pud_phys));
> >  +#endif
> >  + p4d_populate(&init_mm, p4dp, (pud_t *)__va(pud_phys));
> >  + continue;
> >  + } else {
> >  + memcpy(__va(pud_phys), kasan_early_shadow_pud,
> >  + sizeof(kasan_early_shadow_pud));
> >  + p4d_populate(&init_mm, p4dp, (pud_t *)__va(pud_phys));
> >  + }
> >  + }
> >  + kasan_shallow_populate_pud(p4dp, addr, next, node);
> >  + } while (p4dp++, addr =3D next, addr !=3D end);
> >  +}
> >  +
> >  +static void __init kasan_shallow_populate_pgd(unsigned long addr,
> >  + unsigned long end, int node)
> >  +{
> >  + unsigned long next;
> >  + pgd_t *pgdp;
> >  +
> >  + pgdp =3D pgd_offset_k(addr);
> >  +
> >  + do {
> >  + next =3D pgd_addr_end(addr, end);
> >  +
> >  + if (__pgd_none(false, pgdp_get(pgdp))) {
> >  +
> >  + phys_addr_t p4d_phys =3D kasan_alloc_zeroed_page(node);
> >  +
> >  + if (IS_ALIGNED(addr, PGDIR_SIZE) && end - addr >=3D PGDIR_SIZE) {
> >  + pgd_init(__va(p4d_phys));
> >  + pgd_populate(&init_mm, pgdp, (p4d_t *)__va(p4d_phys));
> >  + continue;
> >  + } else {
> >  + memcpy(__va(p4d_phys), kasan_early_shadow_p4d,
> >=20=20+ sizeof(kasan_early_shadow_p4d));
> >  + pgd_populate(&init_mm, pgdp, (p4d_t *)__va(p4d_phys));
> >  + }
> >  + }
> >  +
> >  + kasan_shallow_populate_p4d(pgdp, addr, next, node);
> >  + } while (pgdp++, addr =3D next, addr !=3D end);
> >  +}
> >  +
> >  +static void __init kasan_shallow_populate(unsigned long start, unsi=
gned long end, int node)
> >  +{
> >  + unsigned long vaddr =3D (unsigned long)start & PAGE_MASK;
> >  + unsigned long vend =3D PAGE_ALIGN((unsigned long)end);
> >  +
> >  + kasan_shallow_populate_pgd(vaddr, vend, node);
> >  +}
> >  +
> >  +#ifdef CONFIG_KASAN_VMALLOC
> >  +void __init kasan_populate_early_vm_area_shadow(void *start, unsign=
ed long size)
> >  +{
> >  + unsigned long shadow_start, shadow_end;
> >  +
> >  + if (!is_vmalloc_or_module_addr(start))
> >  + return;
> >  +
> >  + shadow_start =3D (unsigned long)mem_to_shadow(start);
> >  + shadow_start =3D ALIGN_DOWN(shadow_start, PAGE_SIZE);
> >  + shadow_end =3D (unsigned long)mem_to_shadow(start + size);
> >  + shadow_end =3D ALIGN(shadow_end, PAGE_SIZE);
> >  +
> >  + kasan_map_populate(shadow_start, shadow_end, NUMA_NO_NODE);
> >  +}
> >  +#endif
> >  +
> >  asmlinkage void __init kasan_early_init(void)
> >  {
> >  BUILD_BUG_ON(!IS_ALIGNED(KASAN_SHADOW_START, PGDIR_SIZE));
> >  @@ -297,9 +451,6 @@ void __init kasan_init(void)
> >  /* Maps everything to a single page of zeroes */
> >  kasan_pgd_populate(KASAN_SHADOW_START, KASAN_SHADOW_END, NUMA_NO_NOD=
E, true);
> >=20
>=20>  - kasan_populate_early_shadow(mem_to_shadow((void *)VMALLOC_START)=
,
> >  - mem_to_shadow((void *)KFENCE_AREA_END));
> >  -
> >  /* Populate the linear mapping */
> >  for_each_mem_range(i, &pa_start, &pa_end) {
> >  void *start =3D (void *)phys_to_virt(pa_start);
> >  @@ -309,9 +460,9 @@ void __init kasan_init(void)
> >  (unsigned long)mem_to_shadow(end), NUMA_NO_NODE);
> >  }
> >=20
>=20>  - /* Populate modules mapping */
> >  - kasan_map_populate((unsigned long)mem_to_shadow((void *)MODULES_VA=
DDR),
> >  - (unsigned long)mem_to_shadow((void *)MODULES_END), NUMA_NO_NODE);
> >  + kasan_shallow_populate((unsigned long)mem_to_shadow((void *)MODULE=
S_VADDR),
> >  + (unsigned long)mem_to_shadow((void *)VMALLOC_END), NUMA_NO_NODE);
> >  +
> >  /*
> >  * KAsan may reuse the contents of kasan_early_shadow_pte directly, s=
o we
> >  * should make sure that it maps the zero page read-only.
> >  --
> >  2.43.0
> >
>
