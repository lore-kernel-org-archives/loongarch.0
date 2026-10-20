Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792489227;
	b=TlxRyZKRV+wS7UCOdraMMePf7k22PET1sjmjHcAOP1+VhMdd/g0xA8v0YGQ0hNBlTgTH
	 oq/VKjJOyBuP+KUVdksLvbrJAto13+DO/eB/fXqD93lBzX+do6eH0SyJ0IJNjkDF991BK
	 /h5v69oDhoBPITLFoMRSLCxrBQWk22lz4OXmjxtmVR7FTN+FPSVieEQgRwHehw6HUgKc1
	 a4m+r2NZpViHR9hmDsb9j4+vHW1ilrQ9SQHTeo3Ojq2/zQGdDn28OkGeOz1rypnUa6ZEO
	 9wTazoFAky5yNZB27BbyHUSnK1dXDf6JIcNQdidjAuZqAah3SSuRsaeQPOacrMutNyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489227;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=xCB7xhspOtRZBylxVErZ6ts9gz33gVjNP2Et2kJugSw=;
	b=eizEYRr5nzmjveJ4weErRfYuCG25ePv7LvVQAs0RC+9ZMyHSZRjSJKixJ1jCCAT4IEg0
	 nPhWmdRp9f0GdWwcxU0rSe9FZLq5oiWcvlZrm/YT9xcmNoVScOgDzIY5CxdLmEVLSIcvN
	 VOVTlsInwocHAPX5OiFAKCdIGKGfe8GD3e/25zSFPZg1YFgzqst8RJTqozPATaOkkkWOg
	 mcreq5NtKwJZd5JMdpckEAqoPQQYs/aCJ+qOplA2J21Sow1NRRFdTJDps1j309DmSkP7d
	 VWLIyKAmMBxn3QL1KopRaucxpcNj4iZaTsE/TJeNIuVEnA+/CPLBv6xCMn5S1KXWtAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=apyiPlzr;
	arc=none smtp.remote-ip=91.218.175.246
Received: from mta0.migadu.com (out-246.mta0.migadu.com [91.218.175.246])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E949606A319
	for <loongarch@lists.linux.dev>; Tue, 20 Oct 2026 09:40:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E949606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=apyiPlzr
X-Envelope-To: loongarch@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=6C3S1/taLdccL47/LQ5JGKzfO1grSf6NstUDNMAj3YU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792489224; v=1; x=1793094024;
 b=apyiPlzrafUrNQG3zVJ3RaMnPXPe8OIJq06PqhslkKpSkTnVzSCwOMVCHEZeqF/5Zo6rO535
 m0daLLA47KG1XFNmOH+PCJ+MEti/FRhsf0Gm/AxHG7MCnaEPKhkryrE4xyXLzfsvCAECtED0Qfv
 qxquuXPYLLvH2/WrZHd6NHGg=
X-Envelope-To: loongarch@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 79b66d64f3c51cc9;
	Tue, 20 Oct 2026 09:40:23 +0000
X-Mizu-Trace-ID: 79b66d64f3c51cc9
X-Migadu-Flow: FLOW_OUT
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Date: Tue, 20 Oct 2026 09:40:23 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: haoran.jiang@linux.dev
Message-ID: <1c828920cc9803090c8c33e4179a779843c61a49@linux.dev>
TLS-Required: No
Subject: Re: [PATCH] LoongArch: add KASAN_VMALLOC support
To: "Huacai Chen" <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, kasan-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, kernel@xen0n.name, "Haoran Jiang"
 <jianghaoran@kylinos.cn>
In-Reply-To: <CAAhV-H4KLo_jATwME61BLTPC8ns5ahRDme9s2C8GMvH1BkSmJQ@mail.gmail.com>
References: <20261012080448.134274-1-haoran.jiang@linux.dev>
 <CAAhV-H5jO2HYT+64usWxCuDYu3oVLV__vkBL3J8MpOKEGKL_XQ@mail.gmail.com>
 <4c3a6be6aeef21fc2a19c3525f87485322c47a57@linux.dev>
 <CAAhV-H6o9SrtdPx6g7-rFXSc8BcowR+Umdt60me62BEwFo_EHg@mail.gmail.com>
 <e6e123b78ffe040e80800db1c4aafbbfd20d2f56@linux.dev>
 <CAAhV-H4KLo_jATwME61BLTPC8ns5ahRDme9s2C8GMvH1BkSmJQ@mail.gmail.com>

2026=E5=B9=B410=E6=9C=8820=E6=97=A5 15:47, "Huacai Chen" <chenhuacai@kern=
el.org mailto:chenhuacai@kernel.org?to=3D%22Huacai%20Chen%22%20%3Cchenhua=
cai%40kernel.org%3E > =E5=86=99=E5=88=B0:


>=20
>=20On Tue, Oct 20, 2026 at 10:37 AM <haoran.jiang@linux.dev> wrote:
>=20
>=20>=20
>=20> 2026=E5=B9=B410=E6=9C=8817=E6=97=A5 16:24, "Huacai Chen" <chenhuaca=
i@kernel.org mailto:chenhuacai@kernel.org?to=3D%22Huacai%20Chen%22%20%3Cc=
henhuacai%40kernel.org%3E > =E5=86=99=E5=88=B0:
> >=20
>=20>  On Fri, Oct 16, 2026 at 11:05 PM <haoran.jiang@linux.dev> wrote:
> >=20
>=20>  >
> >  > 2026=E5=B9=B410=E6=9C=8814=E6=97=A5 12:43, "Huacai Chen" <chenhuac=
ai@kernel.org mailto:chenhuacai@kernel.org?to=3D%22Huacai%20Chen%22%20%3C=
chenhuacai%40kernel.org%3E > =E5=86=99=E5=88=B0:
> >  >
> >  > Hi, Haoran,
> >  >
> >  > On Mon, Oct 12, 2026 at 4:05 PM <haoran.jiang@linux.dev> wrote:
> >  >
> >  > >
> >  > > From: Haoran Jiang <jianghaoran@kylinos.cn>
> >  > >
> >  > > For the page table of the VMALLOC shadow region,
> >  > > only a partial page table needs to be established,
> >  > > allowing the complete page table entries to be
> >  > > populated on demand during use.
> >  > >
> >  > > ---
> >  > > 1,Through the kasan_shallow_populate_pgd/p4d/pud/pmd/pte functio=
ns,
> >  > > page tables are established for the modules and vmalloc regions,
> >  > > but the page tables are not fully populated; the complete page
> >  > > tables are established automatically when vmalloc is used.
> >  > >
> >  > Why also change modules together with vmalloc regions? Because the=
y
> >  > can both alloc/free dynamically, and the current approch can only
> >  > handle "one time" for modules?
> >  >
> >  > The shadow memory for modules regions is the same as that of vmall=
oc regions=EF=BC=8C
> >  > full page tables can be built on demand during usage. Memory is al=
located
> >  > when loading modules, and the shadow memory of the allocated memor=
y establishes
> >  > complete page tables via `kasan_populate_vmalloc_do`
> >  > (load_module->execmem_alloc->kasan_populate_vmalloc_do), similar t=
o riscv and arm64.
> >  >
> >  The current code can also handle modules, so I want to know the
> >  difference. I guess the current code can only handle a module loadin=
g
> >  once, but this patch makes it possible to load/unload modules
> >  repeatedly. But I'm not sure. Anyway, I don't want something to beco=
me
> >  worse.
> >=20
>=20>  1,With the current approach, the shadow page tables for the module=
s
> >  region are established via `kasan_map_populate` and `KASAN_VMALLOC=
=3Dn`.
> >  A test module performs an out-of-bounds write to a global array. Aft=
er
> >  repeated `insmod`/`rmmod` cycles, the test module reports false posi=
tives.
> >  This is because the current flow does not properly clean up the shad=
ow data.
> >=20
>=20>  Taking x86 as an example, since x86 can be configured with KASAN_V=
MALLOC=3Dn,
> >  when KASAN_VMALLOC=3Dn, the correct flow is as follows:
> >=20
>=20x86 has some trouble implementing KASAN_VMALLOC? Or does x86's
> solution have its advantage?
>=20
>=20Huacai
>=20

On=20x86, KASAN_VMALLOC is a configurable option; both implementations ar=
e supported.

> >=20
>=20> execmem_arch_setup -> flags =3D EXECMEM_KASAN_SHADOW, the flag is s=
et to EXECMEM_KASAN_SHADOW,
> >  and the subsequent flow should select the correct path based on the =
EXECMEM_KASAN_SHADOW flag.
> >=20
>=20>  insmod -> execmem_vmalloc -> (kasan && (kasan_alloc_module_shadow(=
p, size, GFP_KERNEL)
> >  -> register_global -> kasan_poison-> rmmod -> kasan_free_module_shad=
ow
> >  -> vfree(kasan_mem_to_shadow(vm->addr));
> >=20
>=20>  This flow it establishes the shadow page tables, then poisons them=
,
> >  and cleans up the shadow data when the module is unloaded.
> >=20
>=20>  However, the current situation on LoongArch is as follows:
> >=20
>=20>  execmem_arch_setup -> does not set EXECMEM_KASAN_SHADOW
> >=20
>=20>  insmod -> execmem_vmalloc -> does not call kasan_alloc_module_shad=
ow
> >  -> register_global -> kasan_poison-> rmmod -> kasan_free_module_shad=
ow
> >  -> does not call vfree(kasan_mem_to_shadow(vm->addr));
> >=20
>=20>  LoongArch does not set EXECMEM_KASAN_SHADOW during initialization,=
 which
> >  causes the shadow data not to be properly cleaned up at unload time,
> >  potentially leading to false positives the next time a module is loa=
ded.
> >=20
>=20>  On RISC-V/arm64, KASAN_VMALLOC is enabled by default, and the shad=
ow page
> >  tables for the module region are established and torn down via
> >  kasan_populate_vmalloc_do/kasan_release_vmalloc. This is exactly
> >  the approach that kasan_shallow_populate aims to implement.
> >=20
>=20>  2,kasan_shallow_populate requires fewer page tables than kasan_map=
_populate,
> >  and it can also save memory during initialization.
> >=20
>=20>  >
> >  > >
> >  > > If the address is pgd-aligned, the page table is established
> >  > > down to the pgd level; if it is pud-aligned, it is established
> >  > > down to the pud level, and so on. While establishing the
> >  > > /pgd/pud/pmd levels, the page table entries must be initialized
> >  > > to none. For example, a pmd entry of none is an invalid_pte_tabl=
e.
> >  > > Only in this way can the correct page tables be established at
> >  > > use time. At the same time, boundary issues must be considered
> >  > > when the address is not aligned. For example, mem_to_shadow(MALL=
OC_END)
> >  > > and mem_to_shadow(vmemmap) are in the same pmd, and the region
> >  > > [mem_to_shadow(vmemmap), mem_to_shadow(VMEMMAP_END)] needs to be
> >  > > mapped to page 0. To avoid affecting the mem_to_shadow(vmemmap) =
region,
> >  > > only the pmd entries for [mem_to_shadow(MALLOC_END) & PMD_MASK, =
mem_to_shadow(MALLOC_END)]
> >  > > need to be initialized to invalid_pte_table. The remaining pmd e=
ntries are left as they are.
> >  > >
> >  > kasan_pgd_populate(early) populate the page table to early shadow
> >  > page, kasan_pgd_populate(!early) populate the page table to normal
> >  > shadow page, and kasan_shallow_populate() populate the page table =
to
> >  > invalid_{pud,pmd,pte}_table?
> >  >
> >  > It seems you are do similar work as RISCV, and RISCV use three API=
s
> >  > for this purpose: kasan_{,early,shallow}_populate_pgd(). But Loong=
Arch
> >  > use the same API for the 1st and 2nd purpose, can we add a "shallo=
w"
> >  > parameter to kasan_pgd_populate() so we can also handle the 3th
> >  > purpose?
> >  >
> >  > Yes. `kasan_shallow_populate()` builds incomplete shadow page tabl=
es for vmalloc and modules
> >  > regions and needs to handle boundaries. As an example:
> >  > `mem_to_shadow(VMALLOC_END)` and `mem_to_shadow(vmemmap)` share on=
e PTE table.
> >  > The PTE entry for `mem_to_shadow(VMALLOC_END)` must be none, where=
as the PTE entry
> >  > for `mem_to_shadow(vmemmap)` points to `early_shadow_page`. The fi=
nal page table
> >  > layout is shown below
> >  >
> >  > pte +------
> >  > +------------------+
> >  > |early_shadow_page |
> >  > pmd +------------------+
> >  > +----------------+ |early_shadow_page |
> >  > |early_shadow_pte| +------------------+
> >  > +----------------+ | global |
> >  > | ptep |-----------+------------------+
> >  > +----------------+
> >  > | ... | pte
> >  > +----------------+ +--------------+
> >  > | ... | | global |
> >  > pgd +----------------+ +--------------+
> >  > +------------------+ | ptep |---------------| global |
> >  > | pmdp +----------+----------------+ +--------------+
> >  > +------------------+ pmd
> >  > | pmdp |----------+--------------+
> >  > +------------------+ |invalid_pte |
> >  > | | +--------------+
> >  > | ... | |invalid_pte |
> >  > | | +--------------+
> >  > +------------------+
> >  > | ... |
> >  > +------------------+ pmd
> >  > | ... | +------------+
> >  > +------------------+ | invalid_pte|
> >  > | ... | +------------+
> >  > +------------------+ | invalid_pte|
> >  > | pmdp |---------- +------------+
> >  > +------------------+
> >  > | ... |
> >  > +------------------+
> >  >
> >  > `kasan_pgd_populate()` can handle the third case by adding a param=
eter. I will implement this in the next version.
> >  >
> >  > >
> >  > > 2,The removal of kasan_populate_early_shadow(mem_to_shadow((void=
 *)VMALLOC_START),
>=20>  > > mem_to_shadow((void *)KFENCE_AREA_END)) achieves the same effe=
ct as
> >  > > kasan_pgd_populate(KASAN_SHADOW_START, KASAN_SHADOW_END, NUMA_NO=
_NODE, true);
> >  > > both map this region to a shared zero page. (KASAN_SHADOW_START,=
 KASAN_SHADOW_END)
> >  > > already covers (mem_to_shadow((void *)VMALLOC_START), mem_to_sha=
dow((void *)KFENCE_AREA_END)).
> >  > > Other architectures such as arm64/riscv need kasan_populate_earl=
y_shadow
> >  > > because clear_shadow(KASAN_SHADOW_START, KASAN_SHADOW_END) is pe=
rformed before
> >  > > kasan_populate_early_shadow, so the reserved region must be mapp=
ed to the zero
> >  > > page again. On LoongArch, however, the entire shadow space is fi=
rst mapped to
> >  > > page 0 via kasan_pgd_populate, and then page tables are establis=
hed for the
> >  > > required regions, which is simpler and clearer.
> >  > >
> >  > > 3,pgd_none/p4d_none/pmd_none/pte_none were added to the definiti=
ons of
> >  > > __pgd_none/__p4d_none/__pud_none/__pmd_none/__pte_none respectiv=
ely
> >  > > because kasan_populate_early_vm_area_shadow requires them.
> >  > > kasan_populate_early_vm_area_shadow establishes complete KASAN s=
hadow
> >  > > page table mappings for the early vmalloc regions before vmalloc=
_init.
> >  > > At this point, complete page tables need to be established, but
> >  > > kasan_populate_early_vm_area_shadow is called after step 1, at w=
hich time
> >  > >
> >  > I'm a little confusing here. What is "step 1" here?
> >  >
> >  > Step 1 refers to `kasan_shallow_populate()`. The page tables creat=
ed after
> >  > `kasan_shallow_populate()` are shown in the figure above. We need =
to check
> >  > for empty entries using /pgd_none/p4d_none/pmd_none/pone_pte(). On=
ly then
> >  > can `kasan_map_populate()` build the full page tables.
> >  > `kasan_populate_early_vm_area_shadow()` runs after
> >  > `kasan_shallow_populate()` but before `vmalloc_init()`.
> >  > At this stage, page tables for vmalloc regions cannot be automatic=
ally
> >  > populated on demand, so we need to build full page tables here.
> >  >
> >  Then it is better to use `kasan_shallow_populate()` rather than `ste=
p 1`.
> >=20
>=20>  Huacai
> >=20
>=20>  >
> >  > >
> >  > > only incomplete page tables have been established for the vmallo=
c region.
> >  > > The condition for a page table entry to be none requires the
> >  > > pgd_none/p4d_none/pmd_none/pte_none checks. Only by correctly de=
termining
> >  > > whether an entry is none can the complete page tables be establi=
shed properly.
> >  > >
> >  > > Test=EF=BC=9A
> >  > >
> >  > > https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux=
-loongson.git
> >  > >
> >  > > CONFIG_KUNIT=3Dy
> >  > >
> >  > > CONFIG_KASAN_KUNIT_TEST=3Dm
> >  > >
> >  > > Add `kunit.enable=3D1 kasan_multi_shot` to the cmdline.
> >  > >
> >  > > Test with 3-level 16K pages and 4-level 4K pages respectively.
> >  > >
> >  > > before this patch:
> >  > >
> >  > > ...
> >  > >
> >  > > [ 502.760009] ok 68 vmalloc_oob # SKIP Test requires CONFIG_KASA=
N_VMALLOC=3Dy
> >  > >
> >  > > ...
> >  > >
> >  > > [ 504.016000] # kasan: pass:49 fail:0 skip:26 total:75
> >  > > [ 504.016092] # Totals: pass:49 fail:0 skip:26 total:75
> >  > > [ 504.016171] ok 1 kasan
> >  > >
> >  > > after this patch:
> >  > >
> >  > > ...
> >  > >
> >  > > [ 531.630760] ok 68 vmalloc_oob
> >  > >
> >  > > ...
> >  > >
> >  > > [ 532.891057] # kasan: pass:50 fail:0 skip:25 total:75
> >  > > [ 532.891142] # Totals: pass:50 fail:0 skip:25 total:75
> >  > > [ 532.891219] ok 1 kasan
> >  > >
> >  > > Signed-off-by: Haoran Jiang <jianghaoran@kylinos.cn>
> >  > >
> >  > > ---
> >  > > arch/loongarch/Kconfig | 2 +
> >  > > arch/loongarch/mm/kasan_init.c | 173 +++++++++++++++++++++++++++=
+++---
> >  > > 2 files changed, 164 insertions(+), 11 deletions(-)
> >  > >
> >  > > diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> >  > > index 2067d1f2ad7a..c95c6fd8a138 100644
> >  > > --- a/arch/loongarch/Kconfig
> >  > > +++ b/arch/loongarch/Kconfig
> >  > > @@ -119,6 +119,7 @@ config LOONGARCH
> >  > > select HAVE_ARCH_JUMP_LABEL
> >  > > select HAVE_ARCH_JUMP_LABEL_RELATIVE
> >  > > select HAVE_ARCH_KASAN if 64BIT
> >  > > + select HAVE_ARCH_KASAN_VMALLOC
> >  > >
> >  > I think this should be limited by 64BIT.
> >  >
> >  > Huacai
> >  >
> >  > I will fix this in the next revision.
> >  >
> >  > >
> >  > > select HAVE_ARCH_KFENCE if 64BIT
> >  > > select HAVE_ARCH_KGDB if PERF_EVENTS
> >  > > select HAVE_ARCH_KSTACK_ERASE
> >  > > @@ -187,6 +188,7 @@ config LOONGARCH
> >  > > select HOTPLUG_SMT if HOTPLUG_CPU
> >  > > select IRQ_FORCED_THREADING
> >  > > select IRQ_LOONGARCH_CPU
> >  > > + select KASAN_VMALLOC if KASAN
> >  > > select LOCK_MM_AND_FIND_VMA
> >  > > select MMU_GATHER_MERGE_VMAS if MMU
> >  > > select MMU_GATHER_RCU_TABLE_FREE
> >  > > diff --git a/arch/loongarch/mm/kasan_init.c b/arch/loongarch/mm/=
kasan_init.c
> >  > > index 92ca0ba86406..962c37316200 100644
> >  > > --- a/arch/loongarch/mm/kasan_init.c
> >  > > +++ b/arch/loongarch/mm/kasan_init.c
> >  > > @@ -17,28 +17,28 @@ static pgd_t kasan_pg_dir[PTRS_PER_PGD] __in=
itdata __aligned(PAGE_SIZE);
> >  > > #define __pgd_none(early, pgd) (0)
> >  > > #else
> >  > > #define __pgd_none(early, pgd) (early ? (pgd_val(pgd) =3D=3D 0) =
: \
> >  > > -(__pa(pgd_val(pgd)) =3D=3D (unsigned long)__pa(kasan_early_shad=
ow_p4d)))
> >  > > +((__pa(pgd_val(pgd)) =3D=3D (unsigned long)__pa(kasan_early_sha=
dow_p4d)) || pgd_none(pgd)))
> >  > > #endif
> >  > >
> >  > > #ifdef __PAGETABLE_PUD_FOLDED
> >  > > #define __p4d_none(early, p4d) (0)
> >  > > #else
> >  > > #define __p4d_none(early, p4d) (early ? (p4d_val(p4d) =3D=3D 0) =
: \
> >  > > -(__pa(p4d_val(p4d)) =3D=3D (unsigned long)__pa(kasan_early_shad=
ow_pud)))
> >  > > +((__pa(p4d_val(p4d)) =3D=3D (unsigned long)__pa(kasan_early_sha=
dow_pud)) || p4d_none(p4d)))
> >  > > #endif
> >  > >
> >  > > #ifdef __PAGETABLE_PMD_FOLDED
> >  > > #define __pud_none(early, pud) (0)
> >  > > #else
> >  > > #define __pud_none(early, pud) (early ? (pud_val(pud) =3D=3D 0) =
: \
> >  > > -(__pa(pud_val(pud)) =3D=3D (unsigned long)__pa(kasan_early_shad=
ow_pmd)))
> >  > > +((__pa(pud_val(pud)) =3D=3D (unsigned long)__pa(kasan_early_sha=
dow_pmd)) || pud_none(pud)))
> >  > > #endif
> >  > >
> >  > > #define __pmd_none(early, pmd) (early ? (pmd_val(pmd) =3D=3D 0) =
: \
> >  > > -(__pa(pmd_val(pmd)) =3D=3D (unsigned long)__pa(kasan_early_shad=
ow_pte)))
> >  > > +((__pa(pmd_val(pmd)) =3D=3D (unsigned long)__pa(kasan_early_sha=
dow_pte)) || pmd_none(pmd)))
> >  > >
> >  > > #define __pte_none(early, pte) (early ? pte_none(pte) : \
> >  > > -((pte_val(pte) & _PFN_MASK) =3D=3D (unsigned long)__pa(kasan_ea=
rly_shadow_page)))
> >  > > +(((pte_val(pte) & _PFN_MASK) =3D=3D (unsigned long)__pa(kasan_e=
arly_shadow_page)) || pte_none(pte)))
> >  > >
> >  > > static void *mem_to_shadow(const void *addr)
> >  > > {
> >  > > @@ -242,6 +242,160 @@ static void __init kasan_map_populate(unsi=
gned long start, unsigned long end,
> >  > > kasan_pgd_populate(start & PAGE_MASK, PAGE_ALIGN(end), node, fal=
se);
> >  > > }
> >  > >
> >  > > +static void __init kasan_shallow_populate_pte(pmd_t *pmdp, unsi=
gned long addr,
> >  > > + unsigned long end, int node)
> >  > > +{
> >  > > + unsigned long next;
> >  > > + pte_t *ptep =3D pte_offset_kernel(pmdp, addr);
> >  > > +
> >  > > + do {
> >  > > + next =3D addr + PAGE_SIZE;
> >  > > + if (__pte_none(false, ptep_get(ptep)))
> >  > > + pte_clear(&init_mm, addr, ptep);
> >  > > + } while (ptep++, addr =3D next, addr !=3D end);
> >  > > +}
> >  > > +
> >  > > +static void __init kasan_shallow_populate_pmd(pud_t *pudp, unsi=
gned long addr,
> >  > > + unsigned long end, int node)
> >  > > +{
> >  > > + unsigned long next;
> >  > > + pmd_t *pmdp =3D pmd_offset(pudp, addr);
> >  > > +
> >  > > + do {
> >  > > + next =3D pmd_addr_end(addr, end);
> >  > > +
> >  > > + if (__pmd_none(false, pmdp_get(pmdp))) {
> >  > > + phys_addr_t pte_phys =3D kasan_alloc_zeroed_page(node);
> >  > > +
> >  > > + if (IS_ALIGNED(addr, PMD_SIZE) && end - addr >=3D PMD_SIZE) {
> >  > > + kernel_pte_init(__va(pte_phys));
> >  > > +=20pmd_populate_kernel(NULL, pmdp, (pte_t *)__va(pte_phys));
> >  > > + continue;
> >  > > + } else {
> >  > > + memcpy(__va(pte_phys), kasan_early_shadow_pte,
> >  > > + sizeof(kasan_early_shadow_pte));
> >  > > + pmd_populate_kernel(NULL, pmdp, (pte_t *)__va(pte_phys));
> >  > > + }
> >  > > + }
> >  > > + kasan_shallow_populate_pte(pmdp, addr, next, node);
> >  > > + } while (pmdp++, addr =3D next, addr !=3D end);
> >  > > +}
> >  > > +
> >  > > +static void __init kasan_shallow_populate_pud(p4d_t *p4dp, unsi=
gned long addr,
> >  > > + unsigned long end, int node)
> >  > > +{
> >  > > + unsigned long next;
> >  > > + pud_t *pudp =3D pud_offset(p4dp, addr);
> >  > > +
> >  > > + do {
> >  > > + next =3D pud_addr_end(addr, end);
> >  > > +
> >  > > + if (__pud_none(false, pudp_get(pudp))) {
> >  > > +
> >  > > + phys_addr_t pmd_phys =3D kasan_alloc_zeroed_page(node);
> >  > > +
> >  > > + if (IS_ALIGNED(addr, PUD_SIZE) && end - addr >=3D PUD_SIZE) {
> >  > > +#ifndef __PAGETABLE_PMD_FOLDED
> >  > > + pmd_init(__va(pmd_phys));
> >  > > +#endif
> >  > > + pud_populate(&init_mm, pudp, (pmd_t *)__va(pmd_phys));
> >  > > + continue;
> >  > > + } else {
> >  > > + memcpy(__va(pmd_phys), kasan_early_shadow_pmd,
> >  > > + sizeof(kasan_early_shadow_pmd));
> >  > > + pud_populate(&init_mm, pudp, (pmd_t *)__va(pmd_phys));
> >  > > +
> >  > > + }
> >  > > + }
> >  > > +
> >  > > + kasan_shallow_populate_pmd(pudp, addr, next, node);
> >  > > + } while (pudp++, addr =3D next, addr !=3D end);
> >  > > +}
> >  > > +
> >  > > +static void __init kasan_shallow_populate_p4d(pgd_t *pgdp, unsi=
gned long addr,
> >  > > + unsigned long end, int node)
> >  > > +{
> >  > > + unsigned long next;
> >  > > + p4d_t *p4dp =3D p4d_offset(pgdp, addr);
> >  > > +
> >  > > + do {
> >  > > + next =3D p4d_addr_end(addr, end);
> >  > > +
> >  > > + if (__p4d_none(false, p4dp_get(p4dp))) {
> >  > > +
> >  > > + phys_addr_t pud_phys =3D kasan_alloc_zeroed_page(node);
> >  > > +
> >  > > + if (IS_ALIGNED(addr, P4D_SIZE) && end - addr >=3D P4D_SIZE) {
> >  > > +#ifndef __PAGETABLE_PUD_FOLDED
> >  > > + pud_init(__va(pud_phys));
> >  > > +#endif
> >  > > + p4d_populate(&init_mm, p4dp, (pud_t *)__va(pud_phys));
> >  > > + continue;
> >  > > + } else {
> >  > > + memcpy(__va(pud_phys), kasan_early_shadow_pud,
> >  > > + sizeof(kasan_early_shadow_pud));
> >  > > + p4d_populate(&init_mm, p4dp, (pud_t *)__va(pud_phys));
> >  > > + }
> >  > > + }
> >  > > + kasan_shallow_populate_pud(p4dp, addr, next, node);
> >  > > + } while (p4dp++, addr =3D next, addr !=3D end);
> >  > > +}
> >  > > +
> >  > > +static void __init kasan_shallow_populate_pgd(unsigned long add=
r,
> >  > > + unsigned long end, int node)
> >  > > +{
> >  > > + unsigned long next;
> >  > > + pgd_t *pgdp;
> >  > > +
> >  > > + pgdp =3D pgd_offset_k(addr);
> >  > > +
> >  > > + do {
> >  > > + next =3D pgd_addr_end(addr, end);
> >  > > +
> >  > > + if (__pgd_none(false, pgdp_get(pgdp))) {
> >  > > +
> >  > > + phys_addr_t p4d_phys =3D kasan_alloc_zeroed_page(node);
> >  > > +
> >  > > + if (IS_ALIGNED(addr, PGDIR_SIZE) && end - addr >=3D PGDIR_SIZE=
) {
> >  > > + pgd_init(__va(p4d_phys));
> >  > > + pgd_populate(&init_mm, pgdp, (p4d_t *)__va(p4d_phys));
> >  > > + continue;
> >  > > + } else {
> >  > > + memcpy(__va(p4d_phys), kasan_early_shadow_p4d,
> >  > > + sizeof(kasan_early_shadow_p4d));
> >  > > + pgd_populate(&init_mm, pgdp, (p4d_t *)__va(p4d_phys));
> >  > > + }
> >  > > + }
> >  > > +
> >  > > + kasan_shallow_populate_p4d(pgdp, addr, next, node);
> >  > > + } while (pgdp++, addr =3D next, addr !=3D end);
> >  > > +}
> >  > > +
> >  > > +static void __init kasan_shallow_populate(unsigned long start, =
unsigned long end, int node)
> >  > > +{
> >  > > + unsigned long vaddr =3D (unsigned long)start & PAGE_MASK;
> >  > > + unsigned long vend =3D PAGE_ALIGN((unsigned long)end);
> >  > > +
> >  > > + kasan_shallow_populate_pgd(vaddr, vend, node);
> >  > > +}
> >  > > +
> >  > > +#ifdef CONFIG_KASAN_VMALLOC
> >  > > +void __init kasan_populate_early_vm_area_shadow(void *start, un=
signed long size)
> >  > > +{
> >  > > + unsigned long shadow_start, shadow_end;
> >  > > +
> >  > > + if (!is_vmalloc_or_module_addr(start))
> >  > > + return;
> >  > > +
> >  > > + shadow_start =3D (unsigned long)mem_to_shadow(start);
> >  > > + shadow_start =3D ALIGN_DOWN(shadow_start, PAGE_SIZE);
> >  > > + shadow_end =3D (unsigned long)mem_to_shadow(start + size);
> >  > > + shadow_end =3D ALIGN(shadow_end, PAGE_SIZE);
> >  > > +
> >  > > + kasan_map_populate(shadow_start, shadow_end, NUMA_NO_NODE);
> >  > > +}
> >  > > +#endif
> >  > > +
> >  > > asmlinkage void __init kasan_early_init(void)
> >  > > {
> >  > > BUILD_BUG_ON(!IS_ALIGNED(KASAN_SHADOW_START, PGDIR_SIZE));
> >  > > @@ -297,9 +451,6 @@ void __init kasan_init(void)
> >  > > /* Maps everything to a single page of zeroes */
> >  > > kasan_pgd_populate(KASAN_SHADOW_START, KASAN_SHADOW_END, NUMA_NO=
_NODE, true);
> >  > >
> >  > > - kasan_populate_early_shadow(mem_to_shadow((void *)VMALLOC_STAR=
T),
> >  > > - mem_to_shadow((void *)KFENCE_AREA_END));
> >  > > -
> >  > > /* Populate the linear mapping */
> >  > > for_each_mem_range(i, &pa_start, &pa_end) {
> >  > > void *start =3D (void *)phys_to_virt(pa_start);
> >  > > @@ -309,9 +460,9 @@ void __init kasan_init(void)
> >  > > (unsigned long)mem_to_shadow(end), NUMA_NO_NODE);
> >  > > }
> >  > >
> >  > > - /* Populate modules mapping */
> >  > > - kasan_map_populate((unsigned long)mem_to_shadow((void *)MODULE=
S_VADDR),
> >  > > - (unsigned long)mem_to_shadow((void *)MODULES_END), NUMA_NO_NOD=
E);
> >  > > + kasan_shallow_populate((unsigned long)mem_to_shadow((void *)MO=
DULES_VADDR),
> >  > > + (unsigned long)mem_to_shadow((void *)VMALLOC_END), NUMA_NO_NOD=
E);
> >  > > +
> >  > > /*
> >  > > * KAsan may reuse the contents of kasan_early_shadow_pte directl=
y, so we
> >  > > * should make sure that it maps the zero page read-only.
> >  > > --
> >  > > 2.43.0
> >  > >
> >  >
> >
>
