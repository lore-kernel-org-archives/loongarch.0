Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.217
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794205631;
	b=E5z9mWQpIntibKDwlKmVfem5FiGc1sx7XDDhwzM4Cp8ouMjIYS7ovQSw0ghapMKVXHTJ
	 E2aapiMpHvr4j2f3Uskl17GUZh3pY6rFu/SLNZNiW/h1TWnglULOWFNS0NO5DdcTdh0hd
	 Ctv3K2ZbEymfQqc+Fap15nV1PN12vjQVLakWIcm9xa9Nri3/8U6UgCLItjTllRO0nQcv2
	 1BDPifPIVhgxKuuOiHtoFKUTU3uwKNdYgvg49ciKOyjiXBsxpyCfHmUrG/e0lPBBBAnKt
	 hqXbWXQFk0y5E44ipLHTqeMfoRnVkRNvkq/hIeuuXzmy2IwWcYb4NAcLbKBUHlGTrIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794205631;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=+OfcG359FcLFxB0vPVkuwWbvzA+VMfTp44BZQAaE6aQ=;
	b=W64evRSTVM1iPWVxA51DhfmKddl0D8sqvaKmrHf/yELkPEw2YxA1E0jCWLYBTCVOYxIm
	 8SPmBm+6jF4r6IwHoSdAyOzPf0knKLq25Mfdvmcedaz/cmLhHwKv3XEvG77PGHoJeDRAq
	 CdSVUb95k1hly94OrO7gezUpIPQpFJwGW+u9aredRzTTdvLY1WV/jjD+yKaedJxiFpzDM
	 Sth224MDZFjyBMXhSIcJE65tdJ30sC0HsvboGFeXYf0A1woDPuAaPb5tsL91qSzm0NcpJ
	 x+PkJm/OvChqLTEl7+9qxa9Fy3+vXxPIehWFv53oVsGXJZmHAmZzpjGoTobu3dR+2vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Jd9aD8X1;
	arc=none smtp.remote-ip=95.215.58.217
Received: from mta1.migadu.com (out-217.mta1.migadu.com [95.215.58.217])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E0F606A325
	for <loongarch@lists.linux.dev>; Mon,  9 Nov 2026 06:27:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65E0F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Jd9aD8X1
X-Envelope-To: loongarch@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=+r0u4L+d3yd9+0KWst1G/VikrL0z7scclFM0yNI86U4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794205627; v=1; x=1794810427;
 b=Jd9aD8X1vgEO3eTKhS5tzfGm3Vy5KmT/idc6DwmiAGU1RGZy+NxVAk/bHp/plzPa2Wh2BrIY
 X+GyJ7zid3DGBDcIYXWe3hPEdVuyXwkRfbieo8V7X02DjKzFCN/1DSvzlxRvUhjEXaC+ckIiRCY
 VMmOse/i9gedwU0WmFGiD8yM=
X-Envelope-To: loongarch@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 3575c711636aeb3f;
	Mon, 09 Nov 2026 06:27:07 +0000
X-Mizu-Trace-ID: 3575c711636aeb3f
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
Date: Mon, 09 Nov 2026 06:27:05 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: haoran.jiang@linux.dev
Message-ID: <6c46aae6dac0d2fbcf27cad76a8cc34256998a26@linux.dev>
TLS-Required: No
Subject: Re: [PATCH v2] LoongArch: add KASAN_VMALLOC support
To: chenhuacai@kernel.org
Cc: loongarch@lists.linux.dev, kasan-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, kernel@xen0n.name, "Haoran Jiang"
 <jianghaoran@kylinos.cn>
In-Reply-To: <20261027055545.381445-1-haoran.jiang@linux.dev>
References: <20261027055545.381445-1-haoran.jiang@linux.dev>

Gentle ping :)

Any review or feedback would be appreciated, thanks.




2026=E5=B9=B410=E6=9C=8827=E6=97=A5 13:55, haoran.jiang@linux.dev mailto:=
haoran.jiang@linux.dev  =E5=86=99=E5=88=B0:


>=20
>=20From: Haoran Jiang <jianghaoran@kylinos.cn>
>=20
>=20For the page table of the VMALLOC and MODULES
> shadow regions, only partial page table needs
> to be established, allowing the complete page
> table entries to be populated on demand during use.
>=20
>=20---
> 1,Add shallow parameter to kasan_pgd/p4d/pud/pmd/pte_populate,
> page tables are established for the modules and vmalloc regions,
> but the page tables are not fully populated; the complete page
> tables are established automatically when vmalloc is used.
> If the address is pgd-aligned, the page table is established
> down to the pgd level; if it is pud-aligned, it is established
> down to the pud level, and so on. While establishing the
> /pgd/pud/pmd/pte levels, the page table entries must be initialized
> to none. For example, a pmd entry of none is an invalid_pte_table.
> Only in this way can the correct page tables be established at
> use time. At the same time, boundary issues must be considered.
> For example, mem_to_shadow(MALLOC_END) and mem_to_shadow(vmemmap)
> are in the same pte, and the region [mem_to_shadow(vmemmap), mem_to_sha=
dow(VMEMMAP_END)]
> needs to be mapped to page 0. To avoid affecting the mem_to_shadow(vmem=
map) region,
> only the pte entries for [mem_to_shadow(MALLOC_END) & PMD_MASK, mem_to_=
shadow(MALLOC_END)]
> need to be initialized to none. The remaining pte entries are left as t=
hey are.
>=20
>=202,The removal of kasan_populate_early_shadow(mem_to_shadow((void *)VM=
ALLOC_START),
> mem_to_shadow((void *)KFENCE_AREA_END)) achieves the same effect as
> kasan_pgd_populate(KASAN_SHADOW_START, KASAN_SHADOW_END, NUMA_NO_NODE, =
true);
>  both map this region to a shared zero page. (KASAN_SHADOW_START, KASAN=
_SHADOW_END)
> already covers (mem_to_shadow((void *)VMALLOC_START), mem_to_shadow((vo=
id *)KFENCE_AREA_END)).
> Other architectures such as arm64/riscv need kasan_populate_early_shado=
w
> because clear_shadow(KASAN_SHADOW_START, KASAN_SHADOW_END) is performed=
 before
>  kasan_populate_early_shadow, so the reserved region must be mapped to =
the zero
> page again. On LoongArch, however, the entire shadow space is first map=
ped to
> page 0 via kasan_pgd_populate, and then page tables are established for=
 the
> required regions, which is simpler and clearer.
>=20
>=203,pgd_none/p4d_none/pmd_none/pte_none were added to the definitions o=
f
> __pgd_none/__p4d_none/__pud_none/__pmd_none/__pte_none respectively
> because kasan_populate_early_vm_area_shadow requires them.
> kasan_populate_early_vm_area_shadow establishes complete KASAN shadow
> page table mappings for the early vmalloc regions before vmalloc_init.
> At this point, complete page tables need to be established, but
> kasan_populate_early_vm_area_shadow is called after kasan_shallow_popul=
ate,
> at which time only incomplete page tables have been established for the
> vmalloc region.The condition for a page table entry to be none requires=
 the
> pgd_none/p4d_none/pmd_none/pte_none checks. Only by correctly determini=
ng
> whether an entry is none can the complete page tables be established pr=
operly.
>=20
>=20Test=EF=BC=9A
>=20
>=20https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loon=
gson.git
>=20
>=20CONFIG_KUNIT=3Dy
>=20
>=20CONFIG_KASAN_KUNIT_TEST=3Dm
>=20
>=20Add `kunit.enable=3D1 kasan_multi_shot` to the cmdline.
>=20
>=20Test with 3-level 16K pages and 4-level 4K pages respectively.
>=20
>=20before this patch:
>=20
>=20...
>=20
>=20[ 502.760009] ok 68 vmalloc_oob # SKIP Test requires CONFIG_KASAN_VMA=
LLOC=3Dy
>=20
>=20...
>=20
>=20[ 504.016000] # kasan: pass:49 fail:0 skip:26 total:75
> [ 504.016092] # Totals: pass:49 fail:0 skip:26 total:75
> [ 504.016171] ok 1 kasan
>=20
>=20after this patch:
>=20
>=20...
>=20
>=20[ 531.630760] ok 68 vmalloc_oob
>=20
>=20...
>=20
>=20[ 532.891057] # kasan: pass:50 fail:0 skip:25 total:75
> [ 532.891142] # Totals: pass:50 fail:0 skip:25 total:75
> [ 532.891219] ok 1 kasan
>=20
>=20V2:
>=20
>=201, Add a shallow parameter to kasan_pgd/p4d/pud/pmd/pte_populate to c=
reate incomplete page tables.
>=20
>=202=EF=BC=8Cselect HAVE_ARCH_KASAN_VMALLOC -> select HAVE_ARCH_KASAN_VM=
ALLOC if 64BIT.
>=20
>=20Signed-off-by: Haoran Jiang <jianghaoran@kylinos.cn>
>=20
>=20---
>  arch/loongarch/Kconfig | 2 +
>  arch/loongarch/mm/kasan_init.c | 132 ++++++++++++++++++++++++---------
>  2 files changed, 101 insertions(+), 33 deletions(-)
>=20
>=20diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index 2067d1f2ad7a..9cdb80ee58a1 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -119,6 +119,7 @@ config LOONGARCH
>  select HAVE_ARCH_JUMP_LABEL
>  select HAVE_ARCH_JUMP_LABEL_RELATIVE
>  select HAVE_ARCH_KASAN if 64BIT
> + select HAVE_ARCH_KASAN_VMALLOC if 64BIT
>  select HAVE_ARCH_KFENCE if 64BIT
>  select HAVE_ARCH_KGDB if PERF_EVENTS
>  select HAVE_ARCH_KSTACK_ERASE
> @@ -187,6 +188,7 @@ config LOONGARCH
>  select HOTPLUG_SMT if HOTPLUG_CPU
>  select IRQ_FORCED_THREADING
>  select IRQ_LOONGARCH_CPU
> + select KASAN_VMALLOC if KASAN
>  select LOCK_MM_AND_FIND_VMA
>  select MMU_GATHER_MERGE_VMAS if MMU
>  select MMU_GATHER_RCU_TABLE_FREE
> diff --git a/arch/loongarch/mm/kasan_init.c b/arch/loongarch/mm/kasan_i=
nit.c
> index 92ca0ba86406..08fbdc9aafb4 100644
> --- a/arch/loongarch/mm/kasan_init.c
> +++ b/arch/loongarch/mm/kasan_init.c
> @@ -17,28 +17,28 @@ static pgd_t kasan_pg_dir[PTRS_PER_PGD] __initdata =
__aligned(PAGE_SIZE);
>  #define __pgd_none(early, pgd) (0)
>  #else
>  #define __pgd_none(early, pgd) (early ? (pgd_val(pgd) =3D=3D 0) : \
> -(__pa(pgd_val(pgd)) =3D=3D (unsigned long)__pa(kasan_early_shadow_p4d)=
))
> +((__pa(pgd_val(pgd)) =3D=3D (unsigned long)__pa(kasan_early_shadow_p4d=
)) || pgd_none(pgd)))
>  #endif
>=20=20
>=20 #ifdef __PAGETABLE_PUD_FOLDED
>  #define __p4d_none(early, p4d) (0)
>  #else
>  #define __p4d_none(early, p4d) (early ? (p4d_val(p4d) =3D=3D 0) : \
> -(__pa(p4d_val(p4d)) =3D=3D (unsigned long)__pa(kasan_early_shadow_pud)=
))
> +((__pa(p4d_val(p4d)) =3D=3D (unsigned long)__pa(kasan_early_shadow_pud=
)) || p4d_none(p4d)))
>  #endif
>=20=20
>=20 #ifdef __PAGETABLE_PMD_FOLDED
>  #define __pud_none(early, pud) (0)
>  #else
>  #define __pud_none(early, pud) (early ? (pud_val(pud) =3D=3D 0) : \
> -(__pa(pud_val(pud)) =3D=3D (unsigned long)__pa(kasan_early_shadow_pmd)=
))
> +((__pa(pud_val(pud)) =3D=3D (unsigned long)__pa(kasan_early_shadow_pmd=
)) || pud_none(pud)))
>  #endif
>=20=20
>=20 #define __pmd_none(early, pmd) (early ? (pmd_val(pmd) =3D=3D 0) : \
> -(__pa(pmd_val(pmd)) =3D=3D (unsigned long)__pa(kasan_early_shadow_pte)=
))
> +((__pa(pmd_val(pmd)) =3D=3D (unsigned long)__pa(kasan_early_shadow_pte=
)) || pmd_none(pmd)))
>=20=20
>=20 #define __pte_none(early, pte) (early ? pte_none(pte) : \
> -((pte_val(pte) & _PFN_MASK) =3D=3D (unsigned long)__pa(kasan_early_sha=
dow_page)))
> +(((pte_val(pte) & _PFN_MASK) =3D=3D (unsigned long)__pa(kasan_early_sh=
adow_page)) || pte_none(pte)))
>=20=20
>=20 static void *mem_to_shadow(const void *addr)
>  {
> @@ -117,52 +117,78 @@ static phys_addr_t __init kasan_alloc_zeroed_page=
(int node)
>  return __pa(p);
>  }
>=20=20
>=20-static pte_t *__init kasan_pte_offset(pmd_t *pmdp, unsigned long add=
r, int node, bool early)
> +static pte_t *__init kasan_pte_offset(pmd_t *pmdp, unsigned long addr,
> + unsigned long end, int node, bool early, bool shallow)
>  {
>  if (__pmd_none(early, pmdp_get(pmdp))) {
>  phys_addr_t pte_phys =3D early ?
>  __pa_symbol(kasan_early_shadow_pte) : kasan_alloc_zeroed_page(node);
>  if (!early)
>  memcpy(__va(pte_phys), kasan_early_shadow_pte, sizeof(kasan_early_shad=
ow_pte));
> +
> + if (IS_ALIGNED(addr, PMD_SIZE) && end - addr >=3D PMD_SIZE && shallow=
)
> + kernel_pte_init(__va(pte_phys));
> +
>  pmd_populate_kernel(NULL, pmdp, (pte_t *)__va(pte_phys));
>  }
>=20=20
>=20 return pte_offset_kernel(pmdp, addr);
>  }
>=20=20
>=20-static pmd_t *__init kasan_pmd_offset(pud_t *pudp, unsigned long add=
r, int node, bool early)
> +static pmd_t *__init kasan_pmd_offset(pud_t *pudp, unsigned long addr,
> + unsigned long end, int node, bool early, bool shallow)
>  {
>  if (__pud_none(early, pudp_get(pudp))) {
>  phys_addr_t pmd_phys =3D early ?
>  __pa_symbol(kasan_early_shadow_pmd) : kasan_alloc_zeroed_page(node);
>  if (!early)
>  memcpy(__va(pmd_phys), kasan_early_shadow_pmd, sizeof(kasan_early_shad=
ow_pmd));
> +
> + if (IS_ALIGNED(addr, PUD_SIZE) && end - addr >=3D PUD_SIZE && shallow=
) {
> +#ifndef __PAGETABLE_PMD_FOLDED
> + pmd_init(__va(pmd_phys));
> +#endif
> + }
> +
>  pud_populate(&init_mm, pudp, (pmd_t *)__va(pmd_phys));
>  }
>=20=20
>=20 return pmd_offset(pudp, addr);
>  }
>=20=20
>=20-static pud_t *__init kasan_pud_offset(p4d_t *p4dp, unsigned long add=
r, int node, bool early)
> +static pud_t *__init kasan_pud_offset(p4d_t *p4dp, unsigned long addr,
> + unsigned long end, int node, bool early, bool shallow)
>  {
>  if (__p4d_none(early, p4dp_get(p4dp))) {
>  phys_addr_t pud_phys =3D early ?
>  __pa_symbol(kasan_early_shadow_pud) : kasan_alloc_zeroed_page(node);
>  if (!early)
>  memcpy(__va(pud_phys), kasan_early_shadow_pud, sizeof(kasan_early_shad=
ow_pud));
> +
> + if (IS_ALIGNED(addr, P4D_SIZE) && end - addr >=3D P4D_SIZE && shallow=
) {
> +#ifndef __PAGETABLE_PUD_FOLDED
> + pud_init(__va(pud_phys));
> +#endif
> + }
> +
>  p4d_populate(&init_mm, p4dp, (pud_t *)__va(pud_phys));
>  }
>=20=20
>=20 return pud_offset(p4dp, addr);
>  }
>=20=20
>=20-static p4d_t *__init kasan_p4d_offset(pgd_t *pgdp, unsigned long add=
r, int node, bool early)
> +static p4d_t *__init kasan_p4d_offset(pgd_t *pgdp, unsigned long addr,
> + unsigned long end, int node, bool early, bool shallow)
>  {
>  if (__pgd_none(early, pgdp_get(pgdp))) {
>  phys_addr_t p4d_phys =3D early ?
>  __pa_symbol(kasan_early_shadow_p4d) : kasan_alloc_zeroed_page(node);
> +
>  if (!early)
>  memcpy(__va(p4d_phys), kasan_early_shadow_p4d, sizeof(kasan_early_shad=
ow_p4d));
> +
> + if (IS_ALIGNED(addr, PGDIR_SIZE) && end - addr >=3D PGDIR_SIZE && sha=
llow)
> + pgd_init(__va(p4d_phys));
>  pgd_populate(&init_mm, pgdp, (p4d_t *)__va(p4d_phys));
>  }
>=20=20
>=20@@ -170,58 +196,77 @@ static p4d_t *__init kasan_p4d_offset(pgd_t *pg=
dp, unsigned long addr, int node,
>  }
>=20=20
>=20 static void __init kasan_pte_populate(pmd_t *pmdp, unsigned long add=
r,
> - unsigned long end, int node, bool early)
> + unsigned long end, int node, bool early, bool shallow)
>  {
>  unsigned long next;
> - pte_t *ptep =3D kasan_pte_offset(pmdp, addr, node, early);
> + pte_t *ptep =3D kasan_pte_offset(pmdp, addr, end, node, early, shallo=
w);
> +
> + if (pte_none(ptep_get(ptep)) && shallow)
> + return;
> +
>=20=20
>=20 do {
> - phys_addr_t page_phys =3D early ?
> + if (shallow) {
> + next =3D addr + PAGE_SIZE;
> + if (__pte_none(early, ptep_get(ptep)))
> + pte_clear(&init_mm, addr, ptep);
> + } else {
> + phys_addr_t page_phys =3D early ?
>  __pa_symbol(kasan_early_shadow_page)
>  : kasan_alloc_zeroed_page(node);
> - next =3D addr + PAGE_SIZE;
> - set_pte(ptep, pfn_pte(__phys_to_pfn(page_phys), PAGE_KERNEL));
> + next =3D addr + PAGE_SIZE;
> + set_pte(ptep, pfn_pte(__phys_to_pfn(page_phys), PAGE_KERNEL));
> + }
>  } while (ptep++, addr =3D next, addr !=3D end && __pte_none(early, pte=
p_get(ptep)));
>  }
>=20=20
>=20 static void __init kasan_pmd_populate(pud_t *pudp, unsigned long add=
r,
> - unsigned long end, int node, bool early)
> + unsigned long end, int node, bool early, bool shallow)
>  {
>  unsigned long next;
> - pmd_t *pmdp =3D kasan_pmd_offset(pudp, addr, node, early);
> + pmd_t *pmdp =3D kasan_pmd_offset(pudp, addr, end, node, early, shallo=
w);
> +
> + if (pmd_none(pmdp_get(pmdp)) && shallow)
> + return;
>=20=20
>=20 do {
>  next =3D pmd_addr_end(addr, end);
> - kasan_pte_populate(pmdp, addr, next, node, early);
> + kasan_pte_populate(pmdp, addr, next, node, early, shallow);
>  } while (pmdp++, addr =3D next, addr !=3D end && __pmd_none(early, pmd=
p_get(pmdp)));
>  }
>=20=20
>=20 static void __init kasan_pud_populate(p4d_t *p4dp, unsigned long add=
r,
> - unsigned long end, int node, bool early)
> + unsigned long end, int node, bool early, bool shallow)
>  {
>  unsigned long next;
> - pud_t *pudp =3D kasan_pud_offset(p4dp, addr, node, early);
> + pud_t *pudp =3D kasan_pud_offset(p4dp, addr, end, node, early, shallo=
w);
> +
> + if (pud_none(pudp_get(pudp)) && shallow)
> + return;
>=20=20
>=20 do {
>  next =3D pud_addr_end(addr, end);
> - kasan_pmd_populate(pudp, addr, next, node, early);
> + kasan_pmd_populate(pudp, addr, next, node, early, shallow);
>  } while (pudp++, addr =3D next, addr !=3D end && __pud_none(early, REA=
D_ONCE(*pudp)));
>  }
>=20=20
>=20 static void __init kasan_p4d_populate(pgd_t *pgdp, unsigned long add=
r,
> - unsigned long end, int node, bool early)
> + unsigned long end, int node, bool early, bool shallow)
>  {
>  unsigned long next;
> - p4d_t *p4dp =3D kasan_p4d_offset(pgdp, addr, node, early);
> + p4d_t *p4dp =3D kasan_p4d_offset(pgdp, addr, end, node, early, shallo=
w);
> +
> + if (p4d_none(p4dp_get(p4dp)) && shallow)
> + return;
>=20=20
>=20 do {
>  next =3D p4d_addr_end(addr, end);
> - kasan_pud_populate(p4dp, addr, next, node, early);
> + kasan_pud_populate(p4dp, addr, next, node, early, shallow);
>  } while (p4dp++, addr =3D next, addr !=3D end && __p4d_none(early, REA=
D_ONCE(*p4dp)));
>  }
>=20=20
>=20 static void __init kasan_pgd_populate(unsigned long addr, unsigned l=
ong end,
> - int node, bool early)
> + int node, bool early, bool shallow)
>  {
>  unsigned long next;
>  pgd_t *pgdp;
> @@ -230,7 +275,7 @@ static void __init kasan_pgd_populate(unsigned long=
 addr, unsigned long end,
>=20=20
>=20 do {
>  next =3D pgd_addr_end(addr, end);
> - kasan_p4d_populate(pgdp, addr, next, node, early);
> + kasan_p4d_populate(pgdp, addr, next, node, early, shallow);
>  } while (pgdp++, addr =3D next, addr !=3D end);
>=20=20
>=20 }
> @@ -239,9 +284,34 @@ static void __init kasan_pgd_populate(unsigned lon=
g addr, unsigned long end,
>  static void __init kasan_map_populate(unsigned long start, unsigned lo=
ng end,
>  int node)
>  {
> - kasan_pgd_populate(start & PAGE_MASK, PAGE_ALIGN(end), node, false);
> + kasan_pgd_populate(start & PAGE_MASK, PAGE_ALIGN(end), node, false, f=
alse);
>  }
>=20=20
>=20+
> +static void __init kasan_shallow_populate(unsigned long start, unsigne=
d long end, int node)
> +{
> +
> + kasan_pgd_populate(start & PAGE_MASK, PAGE_ALIGN(end), node, false, t=
rue);
> +
> +}
> +
> +#ifdef CONFIG_KASAN_VMALLOC
> +void __init kasan_populate_early_vm_area_shadow(void *start, unsigned =
long size)
> +{
> + unsigned long shadow_start, shadow_end;
> +
> + if (!is_vmalloc_or_module_addr(start))
> + return;
> +
> + shadow_start =3D (unsigned long)mem_to_shadow(start);
> + shadow_start =3D ALIGN_DOWN(shadow_start, PAGE_SIZE);
> + shadow_end =3D (unsigned long)mem_to_shadow(start + size);
> + shadow_end =3D ALIGN(shadow_end, PAGE_SIZE);
> +
> + kasan_map_populate(shadow_start, shadow_end, NUMA_NO_NODE);
> +}
> +#endif
> +
>  asmlinkage void __init kasan_early_init(void)
>  {
>  BUILD_BUG_ON(!IS_ALIGNED(KASAN_SHADOW_START, PGDIR_SIZE));
> @@ -295,10 +365,7 @@ void __init kasan_init(void)
>  clear_pgds(KASAN_SHADOW_START, KASAN_SHADOW_END);
>=20=20
>=20 /* Maps everything to a single page of zeroes */
> - kasan_pgd_populate(KASAN_SHADOW_START, KASAN_SHADOW_END, NUMA_NO_NODE=
, true);
> -
> - kasan_populate_early_shadow(mem_to_shadow((void *)VMALLOC_START),
> - mem_to_shadow((void *)KFENCE_AREA_END));
> + kasan_pgd_populate(KASAN_SHADOW_START, KASAN_SHADOW_END, NUMA_NO_NODE=
, true, false);
>=20=20
>=20 /* Populate the linear mapping */
>  for_each_mem_range(i, &pa_start, &pa_end) {
> @@ -309,9 +376,8 @@ void __init kasan_init(void)
>  (unsigned long)mem_to_shadow(end), NUMA_NO_NODE);
>  }
>=20=20
>=20- /* Populate modules mapping */
> - kasan_map_populate((unsigned long)mem_to_shadow((void *)MODULES_VADDR=
),
> - (unsigned long)mem_to_shadow((void *)MODULES_END), NUMA_NO_NODE);
> + kasan_shallow_populate((unsigned long)mem_to_shadow((void *)MODULES_V=
ADDR),
> + (unsigned long)mem_to_shadow((void *)VMALLOC_END), NUMA_NO_NODE);
>  /*
>  * KAsan may reuse the contents of kasan_early_shadow_pte directly, so =
we
>  * should make sure that it maps the zero page read-only.
> --=20
>=202.43.0
>
