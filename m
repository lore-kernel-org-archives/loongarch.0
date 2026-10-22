Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792655446;
	b=a8OwAdH74cv+x3qBeqcKGVwjfpBZbYcWHrqzFLCxlRn1/sOhoY3qXaI/GaEW1pg741fL
	 zyVLFgtTEMXwD1NMyCHn3A61D4t0SE9n18mg+sY9LjBHUd0XHnfAJKbED19TBvI2wosuU
	 9yPPAZ2tEgZCJIsXXqT13OOwOYcGiObbDbWgl7MiL3gJ/n9Q15XdHuBc3dfmQBiP/iVUH
	 MhTASxpfkSFpxV40D1pQh2r0Jn1+Cvsa6hkBy/EgFRsYGCWbSBwEZVRpf/rNhmMTkdgzx
	 slzQebKGkUIEzcp60ssXORIcNbnu3sCMvkm0ov1isMcZLUkQT1cExZazeA8np/gvV5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792655446;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=g9Wv8MUWKlIoiQY3IRk8xhM8+rFxVv2a/WQtUxhisJ8=;
	b=zELUZyju3g6KIo8aBRzXssXYbsBZhkzuhixqVgjuRVcb3Tczo1Zt6KOAVuGoSJVkpLhR
	 PdmI8f8S/DJPqR19qCHiGWDhL8EAkp65czS66vzYynTJFlJEFD3fqhXeW2BoMlQPOKNsY
	 Vzu0JKXOdtdYun3nYeNahUVV3H9RiPSIVa2V7BRjtrbD8Ihwx8KJRvdx7yh6IbGUFgZ8i
	 07osY31ecy/4VB1KRgJkeqwp24YE/6FfLTKPq9x5qTxoTOENcuJBVXER+evZK4qBpL27Y
	 C36hmgH4lIplzCSPEhuDwhL/KtwYoWa1WRsCfwk/KKAVezJG0Lp5BdJckV//mc4q3Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="DUfKg/Sg";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4E2606A319
	for <loongarch@lists.linux.dev>; Thu, 22 Oct 2026 07:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DUfKg/Sg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB7771F000C2
	for <loongarch@lists.linux.dev>; Thu, 22 Oct 2026 07:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792655445;
	bh=g9Wv8MUWKlIoiQY3IRk8xhM8+rFxVv2a/WQtUxhisJ8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=DUfKg/Sg6lifRs/IPmm3njZu/Kc7g9NfqrJ8juCPbyHz4molcQCRX0jvVetW6GnfZ
	 /7fGRZ+j1i/QtbbzEqZIhf/QfHm9ItzwSolKGxu11l5sOTCoyE0L6Q/tTzlOSwQT/k
	 4AWWFzOVF6W2fDD59jFF/fsi8Xg+6iJRjpx/jDxPK2g2UfHXm7V5UJXSjvTmh9LU8T
	 0GUUra632nAfUJw/LULumEM+kVOEgnCh6e2coNpqi9gQzsojCoqwJnh6JiKzd1LG7y
	 zeDxQer25DfwvmmjMSQPM0z6TvxMG79tFLK2r+6alyTOpS9W6S2ET3PrSZm4cioSU3
	 fM71VWC6n/cLA==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b1ec41d8e9so1664728a12.0
        for <loongarch@lists.linux.dev>; Thu, 22 Oct 2026 00:50:45 -0700 (PDT)
X-Gm-Message-State: AFq9FYKg3tX82JRWn9UOH7XoPOGKCHueq9yHdDwqbqILVAekQWt58EqE
	Qm7a5Z/ROxXnEcLr+0J7a+zcg/T1SlPoZ2gFIsm9oNnmZ/+jOWhRKoU9EludYS8o5W/weOWN1lm
	dXhsIvl5xTTULLjvn31J1SbF6M+dmSHQ=
X-Received: by 2002:a05:6402:4285:b0:6b3:b08a:1a08 with SMTP id
 4fb4d7f45d1cf-6b408eb8c6emr3876953a12.19.1792655444244; Thu, 22 Oct 2026
 00:50:44 -0700 (PDT)
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
 <e6e123b78ffe040e80800db1c4aafbbfd20d2f56@linux.dev> <CAAhV-H4KLo_jATwME61BLTPC8ns5ahRDme9s2C8GMvH1BkSmJQ@mail.gmail.com>
 <1c828920cc9803090c8c33e4179a779843c61a49@linux.dev> <CAAhV-H4aqcdMFseu+VOjrLREWyR_MNpp45g-3ryAVi0nFNTr+Q@mail.gmail.com>
 <58d297c935358f25c351e9636e0f727a0800e787@linux.dev>
In-Reply-To: <58d297c935358f25c351e9636e0f727a0800e787@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 22 Oct 2026 15:50:30 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7cFir9pcy38aL_WcgYCx-cEUJogNK4HdLAXvHQwpLuZg@mail.gmail.com>
X-Gm-Features: AclHuK_jnWq3FK4_avC38cKg0utzdon4fHNcJoCUDwgHgatahkyb99siBXto75w
Message-ID: <CAAhV-H7cFir9pcy38aL_WcgYCx-cEUJogNK4HdLAXvHQwpLuZg@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: add KASAN_VMALLOC support
To: haoran.jiang@linux.dev
Cc: loongarch@lists.linux.dev, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, kernel@xen0n.name, 
	Haoran Jiang <jianghaoran@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 11:12=E2=80=AFAM <haoran.jiang@linux.dev> wrote:
>
> 2026=E5=B9=B410=E6=9C=8820=E6=97=A5 18:46, "Huacai Chen" <chenhuacai@kern=
el.org mailto:chenhuacai@kernel.org?to=3D%22Huacai%20Chen%22%20%3Cchenhuaca=
i%40kernel.org%3E > =E5=86=99=E5=88=B0:
>
>
> >
> > On Tue, Oct 20, 2026 at 5:40 PM <haoran.jiang@linux.dev> wrote:
> >
> > >
> > > 2026=E5=B9=B410=E6=9C=8820=E6=97=A5 15:47, "Huacai Chen" <chenhuacai@=
kernel.org mailto:chenhuacai@kernel.org?to=3D%22Huacai%20Chen%22%20%3Cchenh=
uacai%40kernel.org%3E > =E5=86=99=E5=88=B0:
> > >
> > >  On Tue, Oct 20, 2026 at 10:37 AM <haoran.jiang@linux.dev> wrote:
> > >
> > >  >
> > >  > 2026=E5=B9=B410=E6=9C=8817=E6=97=A5 16:24, "Huacai Chen" <chenhuac=
ai@kernel.org mailto:chenhuacai@kernel.org?to=3D%22Huacai%20Chen%22%20%3Cch=
enhuacai%40kernel.org%3E > =E5=86=99=E5=88=B0:
> > >  >
> > >  > On Fri, Oct 16, 2026 at 11:05 PM <haoran.jiang@linux.dev> wrote:
> > >  >
> > >  > >
> > >  > > 2026=E5=B9=B410=E6=9C=8814=E6=97=A5 12:43, "Huacai Chen" <chenhu=
acai@kernel.org mailto:chenhuacai@kernel.org?to=3D%22Huacai%20Chen%22%20%3C=
chenhuacai%40kernel.org%3E > =E5=86=99=E5=88=B0:
> > >  > >
> > >  > > Hi, Haoran,
> > >  > >
> > >  > > On Mon, Oct 12, 2026 at 4:05 PM <haoran.jiang@linux.dev> wrote:
> > >  > >
> > >  > > >
> > >  > > > From: Haoran Jiang <jianghaoran@kylinos.cn>
> > >  > > >
> > >  > > > For the page table of the VMALLOC shadow region,
> > >  > > > only a partial page table needs to be established,
> > >  > > > allowing the complete page table entries to be
> > >  > > > populated on demand during use.
> > >  > > >
> > >  > > > ---
> > >  > > > 1,Through the kasan_shallow_populate_pgd/p4d/pud/pmd/pte funct=
ions,
> > >  > > > page tables are established for the modules and vmalloc region=
s,
> > >  > > > but the page tables are not fully populated; the complete page
> > >  > > > tables are established automatically when vmalloc is used.
> > >  > > >
> > >  > > Why also change modules together with vmalloc regions? Because t=
hey
> > >  > > can both alloc/free dynamically, and the current approch can onl=
y
> > >  > > handle "one time" for modules?
> > >  > >
> > >  > > The shadow memory for modules regions is the same as that of vma=
lloc regions=EF=BC=8C
> > >  > > full page tables can be built on demand during usage. Memory is =
allocated
> > >  > > when loading modules, and the shadow memory of the allocated mem=
ory establishes
> > >  > > complete page tables via `kasan_populate_vmalloc_do`
> > >  > > (load_module->execmem_alloc->kasan_populate_vmalloc_do), similar=
 to riscv and arm64.
> > >  > >
> > >  > The current code can also handle modules, so I want to know the
> > >  > difference. I guess the current code can only handle a module load=
ing
> > >  > once, but this patch makes it possible to load/unload modules
> > >  > repeatedly. But I'm not sure. Anyway, I don't want something to be=
come
> > >  > worse.
> > >  >
> > >  > 1,With the current approach, the shadow page tables for the module=
s
> > >  > region are established via `kasan_map_populate` and `KASAN_VMALLOC=
=3Dn`.
> > >  > A test module performs an out-of-bounds write to a global array. A=
fter
> > >  > repeated `insmod`/`rmmod` cycles, the test module reports false po=
sitives.
> > >  > This is because the current flow does not properly clean up the sh=
adow data.
> > >  >
> > >  > Taking x86 as an example, since x86 can be configured with KASAN_V=
MALLOC=3Dn,
> > >  > when KASAN_VMALLOC=3Dn, the correct flow is as follows:
> > >  >
> > >  x86 has some trouble implementing KASAN_VMALLOC? Or does x86's
> > >  solution have its advantage?
> > >
> > >  Huacai
> > >
> > >  On x86, KASAN_VMALLOC is a configurable option; both implementations=
 are supported.
> > >
> > OK, then is the kasan_populate_vmalloc/kasan_release_vmalloc solution
> > better than kasan_alloc_module_shadow/kasan_free_module_shadow
> > solution for modules?
> >
> > Huacai
>
>
> The key issue is whether KASAN_VMALLOC is configurable. If it is configur=
able,
> both approaches need to be supported; if it is enabled by default along w=
ith KASAN,
> then only the `kasan_populate_vmalloc`/`kasan_release_vmalloc` approach n=
eeds to
> be supported. On arm64, KASAN_VMALLOC is enabled by default when KASAN is=
 enabled.
> This involves the vmap_stack feature: arm64 tends to keep vmap_stack enab=
led,
> and for KASAN to be compatible with vmap_stack, KASAN_VMALLOC must also b=
e enabled.
> The community patch is as follows.
>
>
> commit acc3042d62cb92c3776767f09f665511c903ef2d
> Author: Lecopzer Chen <lecopzer.chen@mediatek.com>
> Date:   Wed Mar 24 12:05:22 2021 +0800
>
> ...
>
>    >From Will's suggestion [1]:
>    >
>    >   > I would _really_ like to move to VMAP stack unconditionally, and
>    >
>    >> that would effectively force KASAN_VMALLOC to be set if KASAN is in=
 use
>
> ...
>
>
>
> At the same time, also remove the `kasan_alloc_module_shadow` approach.
> The community patch is as follows.
>
>
> commit 00be875879fa676a18415e32f98194db05ee93dc
> Author: Mike Rapoport (IBM) <rppt@kernel.org>
> Date:   Sun May 5 19:06:13 2024 +0300
>
>     arm64: module: remove unneeded call to kasan_alloc_module_shadow
>
>
>
> x86 keeps KASAN_VMALLOC configurable (when vmap_stack is enabled,
> KASAN_VMALLOC must also be enabled in order to use KASAN), giving
> users an additional choice.
>
>
>
> For LoongArch, vmap_stack has not yet been implemented. However,
> should we consider staying consistent with arm64 here by enabling
> KASAN_VMALLOC by default? If vmap_stack is implemented in the future,
> there will be no need to further consider the issue of enabling
> KASAN_VMALLOC, and `kasan_populate_vmalloc` can handle both the
> modules and vmalloc areas at the same time. This approach is also
> the simplest to handle.
Enabling KASAN_VMALLOC is fine for me, I just want to know whether
kasan_populate_vmalloc/kasan_release_vmalloc is better than
kasan_alloc_module_shadow/kasan_free_module_shadow technically.

Huacai

>
> >
> > >
> > > >
> > >  > execmem_arch_setup -> flags =3D EXECMEM_KASAN_SHADOW, the flag is =
set to EXECMEM_KASAN_SHADOW,
> > >  > and the subsequent flow should select the correct path based on th=
e EXECMEM_KASAN_SHADOW flag.
> > >  >
> > >  > insmod -> execmem_vmalloc -> (kasan && (kasan_alloc_module_shadow(=
p, size, GFP_KERNEL)
> > >  > -> register_global -> kasan_poison-> rmmod -> kasan_free_module_sh=
adow
> > >  > -> vfree(kasan_mem_to_shadow(vm->addr));
> > >  >
> > >  > This flow it establishes the shadow page tables, then poisons them=
,
> > >  > and cleans up the shadow data when the module is unloaded.
> > >  >
> > >  > However, the current situation on LoongArch is as follows:
> > >  >
> > >  > execmem_arch_setup -> does not set EXECMEM_KASAN_SHADOW
> > >  >
> > >  > insmod -> execmem_vmalloc -> does not call kasan_alloc_module_shad=
ow
> > >  > -> register_global -> kasan_poison-> rmmod -> kasan_free_module_sh=
adow
> > >  > -> does not call vfree(kasan_mem_to_shadow(vm->addr));
> > >  >
> > >  > LoongArch does not set EXECMEM_KASAN_SHADOW during initialization,=
 which
> > >  > causes the shadow data not to be properly cleaned up at unload tim=
e,
> > >  > potentially leading to false positives the next time a module is l=
oaded.
> > >  >
> > >  > On RISC-V/arm64, KASAN_VMALLOC is enabled by default, and the shad=
ow page
> > >  > tables for the module region are established and torn down via
> > >  > kasan_populate_vmalloc_do/kasan_release_vmalloc. This is exactly
> > >  > the approach that kasan_shallow_populate aims to implement.
> > >  >
> > >  > 2,kasan_shallow_populate requires fewer page tables than kasan_map=
_populate,
> > >  > and it can also save memory during initialization.
> > >  >
> > >  > >
> > >  > > >
> > >  > > > If the address is pgd-aligned, the page table is established
> > >  > > > down to the pgd level; if it is pud-aligned, it is established
> > >  > > > down to the pud level, and so on. While establishing the
> > >  > > > /pgd/pud/pmd levels, the page table entries must be initialize=
d
> > >  > > > to none. For example, a pmd entry of none is an invalid_pte_ta=
ble.
> > >  > > > Only in this way can the correct page tables be established at
> > >  > > > use time. At the same time, boundary issues must be considered
> > >  > > > when the address is not aligned. For example, mem_to_shadow(MA=
LLOC_END)
> > >  > > > and mem_to_shadow(vmemmap) are in the same pmd, and the region
> > >  > > > [mem_to_shadow(vmemmap), mem_to_shadow(VMEMMAP_END)] needs to =
be
> > >  > > > mapped to page 0. To avoid affecting the mem_to_shadow(vmemmap=
) region,
> > >  > > > only the pmd entries for [mem_to_shadow(MALLOC_END) & PMD_MASK=
, mem_to_shadow(MALLOC_END)]
> > >  > > > need to be initialized to invalid_pte_table. The remaining pmd=
 entries are left as they are.
> > >  > > >
> > >  > > kasan_pgd_populate(early) populate the page table to early shado=
w
> > >  > > page, kasan_pgd_populate(!early) populate the page table to norm=
al
> > >  > > shadow page, and kasan_shallow_populate() populate the page tabl=
e to
> > >  > > invalid_{pud,pmd,pte}_table?
> > >  > >
> > >  > > It seems you are do similar work as RISCV, and RISCV use three A=
PIs
> > >  > > for this purpose: kasan_{,early,shallow}_populate_pgd(). But Loo=
ngArch
> > >  > > use the same API for the 1st and 2nd purpose, can we add a "shal=
low"
> > >  > > parameter to kasan_pgd_populate() so we can also handle the 3th
> > >  > > purpose?
> > >  > >
> > >  > > Yes. `kasan_shallow_populate()` builds incomplete shadow page ta=
bles for vmalloc and modules
> > >  > > regions and needs to handle boundaries. As an example:
> > >  > > `mem_to_shadow(VMALLOC_END)` and `mem_to_shadow(vmemmap)` share =
one PTE table.
> > >  > > The PTE entry for `mem_to_shadow(VMALLOC_END)` must be none, whe=
reas the PTE entry
> > >  > > for `mem_to_shadow(vmemmap)` points to `early_shadow_page`. The =
final page table
> > >  > > layout is shown below
> > >  > >
> > >  > > pte +------
> > >  > > +------------------+
> > >  > > |early_shadow_page |
> > >  > > pmd +------------------+
> > >  > > +----------------+ |early_shadow_page |
> > >  > > |early_shadow_pte| +------------------+
> > >  > > +----------------+ | global |
> > >  > > | ptep |-----------+------------------+
> > >  > > +----------------+
> > >  > > | ... | pte
> > >  > > +----------------+ +--------------+
> > >  > > | ... | | global |
> > >  > > pgd +----------------+ +--------------+
> > >  > > +------------------+ | ptep |---------------| global |
> > >  > > | pmdp +----------+----------------+ +--------------+
> > >  > > +------------------+ pmd
> > >  > > | pmdp |----------+--------------+
> > >  > > +------------------+ |invalid_pte |
> > >  > > | | +--------------+
> > >  > > | ... | |invalid_pte |
> > >  > > | | +--------------+
> > >  > > +------------------+
> > >  > > | ... |
> > >  > > +------------------+ pmd
> > >  > > | ... | +------------+
> > >  > > +------------------+ | invalid_pte|
> > >  > > | ... | +------------+
> > >  > > +------------------+ | invalid_pte|
> > >  > > | pmdp |---------- +------------+
> > >  > > +------------------+
> > >  > > | ... |
> > >  > > +------------------+
> > >  > >
> > >  > > `kasan_pgd_populate()` can handle the third case by adding a par=
ameter. I will implement this in the next version.
> > >  > >
> > >  > > >
> > >  > > > 2,The removal of kasan_populate_early_shadow(mem_to_shadow((vo=
id *)VMALLOC_START),
> > >  > > > mem_to_shadow((void *)KFENCE_AREA_END)) achieves the same effe=
ct as
> > >  > > > kasan_pgd_populate(KASAN_SHADOW_START, KASAN_SHADOW_END, NUMA_=
NO_NODE, true);
> > >  > > > both map this region to a shared zero page. (KASAN_SHADOW_STAR=
T, KASAN_SHADOW_END)
> > >  > > > already covers (mem_to_shadow((void *)VMALLOC_START), mem_to_s=
hadow((void *)KFENCE_AREA_END)).
> > >  > > > Other architectures such as arm64/riscv need kasan_populate_ea=
rly_shadow
> > >  > > > because clear_shadow(KASAN_SHADOW_START, KASAN_SHADOW_END) is =
performed before
> > >  > > > kasan_populate_early_shadow, so the reserved region must be ma=
pped to the zero
> > >  > > > page again. On LoongArch, however, the entire shadow space is =
first mapped to
> > >  > > > page 0 via kasan_pgd_populate, and then page tables are establ=
ished for the
> > >  > > > required regions, which is simpler and clearer.
> > >  > > >
> > >  > > > 3,pgd_none/p4d_none/pmd_none/pte_none were added to the defini=
tions of
> > >  > > > __pgd_none/__p4d_none/__pud_none/__pmd_none/__pte_none respect=
ively
> > >  > > > because kasan_populate_early_vm_area_shadow requires them.
> > >  > > > kasan_populate_early_vm_area_shadow establishes complete KASAN=
 shadow
> > >  > > > page table mappings for the early vmalloc regions before vmall=
oc_init.
> > >  > > > At this point, complete page tables need to be established, bu=
t
> > >  > > > kasan_populate_early_vm_area_shadow is called after step 1, at=
 which time
> > >  > > >
> > >  > > I'm a little confusing here. What is "step 1" here?
> > >  > >
> > >  > > Step 1 refers to `kasan_shallow_populate()`. The page tables cre=
ated after
> > >  > > `kasan_shallow_populate()` are shown in the figure above. We nee=
d to check
> > >  > > for empty entries using /pgd_none/p4d_none/pmd_none/pone_pte(). =
Only then
> > >  > > can `kasan_map_populate()` build the full page tables.
> > >  > > `kasan_populate_early_vm_area_shadow()` runs after
> > >  > > `kasan_shallow_populate()` but before `vmalloc_init()`.
> > >  > > At this stage, page tables for vmalloc regions cannot be automat=
ically
> > >  > > populated on demand, so we need to build full page tables here.
> > >  > >
> > >  > Then it is better to use `kasan_shallow_populate()` rather than `s=
tep 1`.
> > >  >
> > >  > Huacai
> > >  >
> > >  > >
> > >  > > >
> > >  > > > only incomplete page tables have been established for the vmal=
loc region.
> > >  > > > The condition for a page table entry to be none requires the
> > >  > > > pgd_none/p4d_none/pmd_none/pte_none checks. Only by correctly =
determining
> > >  > > > whether an entry is none can the complete page tables be estab=
lished properly.
> > >  > > >
> > >  > > > Test=EF=BC=9A
> > >  > > >
> > >  > > > https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/lin=
ux-loongson.git
> > >  > > >
> > >  > > > CONFIG_KUNIT=3Dy
> > >  > > >
> > >  > > > CONFIG_KASAN_KUNIT_TEST=3Dm
> > >  > > >
> > >  > > > Add `kunit.enable=3D1 kasan_multi_shot` to the cmdline.
> > >  > > >
> > >  > > > Test with 3-level 16K pages and 4-level 4K pages respectively.
> > >  > > >
> > >  > > > before this patch:
> > >  > > >
> > >  > > > ...
> > >  > > >
> > >  > > > [ 502.760009] ok 68 vmalloc_oob # SKIP Test requires CONFIG_KA=
SAN_VMALLOC=3Dy
> > >  > > >
> > >  > > > ...
> > >  > > >
> > >  > > > [ 504.016000] # kasan: pass:49 fail:0 skip:26 total:75
> > >  > > > [ 504.016092] # Totals: pass:49 fail:0 skip:26 total:75
> > >  > > > [ 504.016171] ok 1 kasan
> > >  > > >
> > >  > > > after this patch:
> > >  > > >
> > >  > > > ...
> > >  > > >
> > >  > > > [ 531.630760] ok 68 vmalloc_oob
> > >  > > >
> > >  > > > ...
> > >  > > >
> > >  > > > [ 532.891057] # kasan: pass:50 fail:0 skip:25 total:75
> > >  > > > [ 532.891142] # Totals: pass:50 fail:0 skip:25 total:75
> > >  > > > [ 532.891219] ok 1 kasan
> > >  > > >
> > >  > > > Signed-off-by: Haoran Jiang <jianghaoran@kylinos.cn>
> > >  > > >
> > >  > > > ---
> > >  > > > arch/loongarch/Kconfig | 2 +
> > >  > > > arch/loongarch/mm/kasan_init.c | 173 +++++++++++++++++++++++++=
+++++---
> > >  > > > 2 files changed, 164 insertions(+), 11 deletions(-)
> > >  > > >
> > >  > > > diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> > >  > > > index 2067d1f2ad7a..c95c6fd8a138 100644
> > >  > > > --- a/arch/loongarch/Kconfig
> > >  > > > +++ b/arch/loongarch/Kconfig
> > >  > > > @@ -119,6 +119,7 @@ config LOONGARCH
> > >  > > > select HAVE_ARCH_JUMP_LABEL
> > >  > > > select HAVE_ARCH_JUMP_LABEL_RELATIVE
> > >  > > > select HAVE_ARCH_KASAN if 64BIT
> > >  > > > + select HAVE_ARCH_KASAN_VMALLOC
> > >  > > >
> > >  > > I think this should be limited by 64BIT.
> > >  > >
> > >  > > Huacai
> > >  > >
> > >  > > I will fix this in the next revision.
> > >  > >
> > >  > > >
> > >  > > > select HAVE_ARCH_KFENCE if 64BIT
> > >  > > > select HAVE_ARCH_KGDB if PERF_EVENTS
> > >  > > > select HAVE_ARCH_KSTACK_ERASE
> > >  > > > @@ -187,6 +188,7 @@ config LOONGARCH
> > >  > > > select HOTPLUG_SMT if HOTPLUG_CPU
> > >  > > > select IRQ_FORCED_THREADING
> > >  > > > select IRQ_LOONGARCH_CPU
> > >  > > > + select KASAN_VMALLOC if KASAN
> > >  > > > select LOCK_MM_AND_FIND_VMA
> > >  > > > select MMU_GATHER_MERGE_VMAS if MMU
> > >  > > > select MMU_GATHER_RCU_TABLE_FREE
> > >  > > > diff --git a/arch/loongarch/mm/kasan_init.c b/arch/loongarch/m=
m/kasan_init.c
> > >  > > > index 92ca0ba86406..962c37316200 100644
> > >  > > > --- a/arch/loongarch/mm/kasan_init.c
> > >  > > > +++ b/arch/loongarch/mm/kasan_init.c
> > >  > > > @@ -17,28 +17,28 @@ static pgd_t kasan_pg_dir[PTRS_PER_PGD] __=
initdata __aligned(PAGE_SIZE);
> > >  > > > #define __pgd_none(early, pgd) (0)
> > >  > > > #else
> > >  > > > #define __pgd_none(early, pgd) (early ? (pgd_val(pgd) =3D=3D 0=
) : \
> > >  > > > -(__pa(pgd_val(pgd)) =3D=3D (unsigned long)__pa(kasan_early_sh=
adow_p4d)))
> > >  > > > +((__pa(pgd_val(pgd)) =3D=3D (unsigned long)__pa(kasan_early_s=
hadow_p4d)) || pgd_none(pgd)))
> > >  > > > #endif
> > >  > > >
> > >  > > > #ifdef __PAGETABLE_PUD_FOLDED
> > >  > > > #define __p4d_none(early, p4d) (0)
> > >  > > > #else
> > >  > > > #define __p4d_none(early, p4d) (early ? (p4d_val(p4d) =3D=3D 0=
) : \
> > >  > > > -(__pa(p4d_val(p4d)) =3D=3D (unsigned long)__pa(kasan_early_sh=
adow_pud)))
> > >  > > > +((__pa(p4d_val(p4d)) =3D=3D (unsigned long)__pa(kasan_early_s=
hadow_pud)) || p4d_none(p4d)))
> > >  > > > #endif
> > >  > > >
> > >  > > > #ifdef __PAGETABLE_PMD_FOLDED
> > >  > > > #define __pud_none(early, pud) (0)
> > >  > > > #else
> > >  > > > #define __pud_none(early, pud) (early ? (pud_val(pud) =3D=3D 0=
) : \
> > >  > > > -(__pa(pud_val(pud)) =3D=3D (unsigned long)__pa(kasan_early_sh=
adow_pmd)))
> > >  > > > +((__pa(pud_val(pud)) =3D=3D (unsigned long)__pa(kasan_early_s=
hadow_pmd)) || pud_none(pud)))
> > >  > > > #endif
> > >  > > >
> > >  > > > #define __pmd_none(early, pmd) (early ? (pmd_val(pmd) =3D=3D 0=
) : \
> > >  > > > -(__pa(pmd_val(pmd)) =3D=3D (unsigned long)__pa(kasan_early_sh=
adow_pte)))
> > >  > > > +((__pa(pmd_val(pmd)) =3D=3D (unsigned long)__pa(kasan_early_s=
hadow_pte)) || pmd_none(pmd)))
> > >  > > >
> > >  > > > #define __pte_none(early, pte) (early ? pte_none(pte) : \
> > >  > > > -((pte_val(pte) & _PFN_MASK) =3D=3D (unsigned long)__pa(kasan_=
early_shadow_page)))
> > >  > > > +(((pte_val(pte) & _PFN_MASK) =3D=3D (unsigned long)__pa(kasan=
_early_shadow_page)) || pte_none(pte)))
> > >  > > >
> > >  > > > static void *mem_to_shadow(const void *addr)
> > >  > > > {
> > >  > > > @@ -242,6 +242,160 @@ static void __init kasan_map_populate(un=
signed long start, unsigned long end,
> > >  > > > kasan_pgd_populate(start & PAGE_MASK, PAGE_ALIGN(end), node, f=
alse);
> > >  > > > }
> > >  > > >
> > >  > > > +static void __init kasan_shallow_populate_pte(pmd_t *pmdp, un=
signed long addr,
> > >  > > > + unsigned long end, int node)
> > >  > > > +{
> > >  > > > + unsigned long next;
> > >  > > > + pte_t *ptep =3D pte_offset_kernel(pmdp, addr);
> > >  > > > +
> > >  > > > + do {
> > >  > > > + next =3D addr + PAGE_SIZE;
> > >  > > > + if (__pte_none(false, ptep_get(ptep)))
> > >  > > > + pte_clear(&init_mm, addr, ptep);
> > >  > > > + } while (ptep++, addr =3D next, addr !=3D end);
> > >  > > > +}
> > >  > > > +
> > >  > > > +static void __init kasan_shallow_populate_pmd(pud_t *pudp, un=
signed long addr,
> > >  > > > + unsigned long end, int node)
> > >  > > > +{
> > >  > > > + unsigned long next;
> > >  > > > + pmd_t *pmdp =3D pmd_offset(pudp, addr);
> > >  > > > +
> > >  > > > + do {
> > >  > > > + next =3D pmd_addr_end(addr, end);
> > >  > > > +
> > >  > > > + if (__pmd_none(false, pmdp_get(pmdp))) {
> > >  > > > + phys_addr_t pte_phys =3D kasan_alloc_zeroed_page(node);
> > >  > > > +
> > >  > > > + if (IS_ALIGNED(addr, PMD_SIZE) && end - addr >=3D PMD_SIZE) =
{
> > >  > > > + kernel_pte_init(__va(pte_phys));
> > >  > > > + pmd_populate_kernel(NULL, pmdp, (pte_t *)__va(pte_phys));
> > >  > > > + continue;
> > >  > > > + } else {
> > >  > > > + memcpy(__va(pte_phys), kasan_early_shadow_pte,
> > >  > > > + sizeof(kasan_early_shadow_pte));
> > >  > > > + pmd_populate_kernel(NULL, pmdp, (pte_t *)__va(pte_phys));
> > >  > > > + }
> > >  > > > + }
> > >  > > > + kasan_shallow_populate_pte(pmdp, addr, next, node);
> > >  > > > + } while (pmdp++, addr =3D next, addr !=3D end);
> > >  > > > +}
> > >  > > > +
> > >  > > > +static void __init kasan_shallow_populate_pud(p4d_t *p4dp, un=
signed long addr,
> > >  > > > + unsigned long end, int node)
> > >  > > > +{
> > >  > > > + unsigned long next;
> > >  > > > + pud_t *pudp =3D pud_offset(p4dp, addr);
> > >  > > > +
> > >  > > > + do {
> > >  > > > + next =3D pud_addr_end(addr, end);
> > >  > > > +
> > >  > > > + if (__pud_none(false, pudp_get(pudp))) {
> > >  > > > +
> > >  > > > + phys_addr_t pmd_phys =3D kasan_alloc_zeroed_page(node);
> > >  > > > +
> > >  > > > + if (IS_ALIGNED(addr, PUD_SIZE) && end - addr >=3D PUD_SIZE) =
{
> > >  > > > +#ifndef __PAGETABLE_PMD_FOLDED
> > >  > > > + pmd_init(__va(pmd_phys));
> > >  > > > +#endif
> > >  > > > + pud_populate(&init_mm, pudp, (pmd_t *)__va(pmd_phys));
> > >  > > > + continue;
> > >  > > > + } else {
> > >  > > > + memcpy(__va(pmd_phys), kasan_early_shadow_pmd,
> > >  > > > + sizeof(kasan_early_shadow_pmd));
> > >  > > > + pud_populate(&init_mm, pudp, (pmd_t *)__va(pmd_phys));
> > >  > > > +
> > >  > > > + }
> > >  > > > + }
> > >  > > > +
> > >  > > > + kasan_shallow_populate_pmd(pudp, addr, next, node);
> > >  > > > + } while (pudp++, addr =3D next, addr !=3D end);
> > >  > > > +}
> > >  > > > +
> > >  > > > +static void __init kasan_shallow_populate_p4d(pgd_t *pgdp, un=
signed long addr,
> > >  > > > + unsigned long end, int node)
> > >  > > > +{
> > >  > > > + unsigned long next;
> > >  > > > + p4d_t *p4dp =3D p4d_offset(pgdp, addr);
> > >  > > > +
> > >  > > > + do {
> > >  > > > + next =3D p4d_addr_end(addr, end);
> > >  > > > +
> > >  > > > + if (__p4d_none(false, p4dp_get(p4dp))) {
> > >  > > > +
> > >  > > > + phys_addr_t pud_phys =3D kasan_alloc_zeroed_page(node);
> > >  > > > +
> > >  > > > + if (IS_ALIGNED(addr, P4D_SIZE) && end - addr >=3D P4D_SIZE) =
{
> > >  > > > +#ifndef __PAGETABLE_PUD_FOLDED
> > >  > > > + pud_init(__va(pud_phys));
> > >  > > > +#endif
> > >  > > > + p4d_populate(&init_mm, p4dp, (pud_t *)__va(pud_phys));
> > >  > > > + continue;
> > >  > > > + } else {
> > >  > > > + memcpy(__va(pud_phys), kasan_early_shadow_pud,
> > >  > > > + sizeof(kasan_early_shadow_pud));
> > >  > > > + p4d_populate(&init_mm, p4dp, (pud_t *)__va(pud_phys));
> > >  > > > + }
> > >  > > > + }
> > >  > > > + kasan_shallow_populate_pud(p4dp, addr, next, node);
> > >  > > > + } while (p4dp++, addr =3D next, addr !=3D end);
> > >  > > > +}
> > >  > > > +
> > >  > > > +static void __init kasan_shallow_populate_pgd(unsigned long a=
ddr,
> > >  > > > + unsigned long end, int node)
> > >  > > > +{
> > >  > > > + unsigned long next;
> > >  > > > + pgd_t *pgdp;
> > >  > > > +
> > >  > > > + pgdp =3D pgd_offset_k(addr);
> > >  > > > +
> > >  > > > + do {
> > >  > > > + next =3D pgd_addr_end(addr, end);
> > >  > > > +
> > >  > > > + if (__pgd_none(false, pgdp_get(pgdp))) {
> > >  > > > +
> > >  > > > + phys_addr_t p4d_phys =3D kasan_alloc_zeroed_page(node);
> > >  > > > +
> > >  > > > + if (IS_ALIGNED(addr, PGDIR_SIZE) && end - addr >=3D PGDIR_SI=
ZE) {
> > >  > > > + pgd_init(__va(p4d_phys));
> > >  > > > + pgd_populate(&init_mm, pgdp, (p4d_t *)__va(p4d_phys));
> > >  > > > + continue;
> > >  > > > + } else {
> > >  > > > + memcpy(__va(p4d_phys), kasan_early_shadow_p4d,
> > >  > > > + sizeof(kasan_early_shadow_p4d));
> > >  > > > + pgd_populate(&init_mm, pgdp, (p4d_t *)__va(p4d_phys));
> > >  > > > + }
> > >  > > > + }
> > >  > > > +
> > >  > > > + kasan_shallow_populate_p4d(pgdp, addr, next, node);
> > >  > > > + } while (pgdp++, addr =3D next, addr !=3D end);
> > >  > > > +}
> > >  > > > +
> > >  > > > +static void __init kasan_shallow_populate(unsigned long start=
, unsigned long end, int node)
> > >  > > > +{
> > >  > > > + unsigned long vaddr =3D (unsigned long)start & PAGE_MASK;
> > >  > > > + unsigned long vend =3D PAGE_ALIGN((unsigned long)end);
> > >  > > > +
> > >  > > > + kasan_shallow_populate_pgd(vaddr, vend, node);
> > >  > > > +}
> > >  > > > +
> > >  > > > +#ifdef CONFIG_KASAN_VMALLOC
> > >  > > > +void __init kasan_populate_early_vm_area_shadow(void *start, =
unsigned long size)
> > >  > > > +{
> > >  > > > + unsigned long shadow_start, shadow_end;
> > >  > > > +
> > >  > > > + if (!is_vmalloc_or_module_addr(start))
> > >  > > > + return;
> > >  > > > +
> > >  > > > + shadow_start =3D (unsigned long)mem_to_shadow(start);
> > >  > > > + shadow_start =3D ALIGN_DOWN(shadow_start, PAGE_SIZE);
> > >  > > > + shadow_end =3D (unsigned long)mem_to_shadow(start + size);
> > >  > > > + shadow_end =3D ALIGN(shadow_end, PAGE_SIZE);
> > >  > > > +
> > >  > > > + kasan_map_populate(shadow_start, shadow_end, NUMA_NO_NODE);
> > >  > > > +}
> > >  > > > +#endif
> > >  > > > +
> > >  > > > asmlinkage void __init kasan_early_init(void)
> > >  > > > {
> > >  > > > BUILD_BUG_ON(!IS_ALIGNED(KASAN_SHADOW_START, PGDIR_SIZE));
> > >  > > > @@ -297,9 +451,6 @@ void __init kasan_init(void)
> > >  > > > /* Maps everything to a single page of zeroes */
> > >  > > > kasan_pgd_populate(KASAN_SHADOW_START, KASAN_SHADOW_END, NUMA_=
NO_NODE, true);
> > >  > > >
> > >  > > > - kasan_populate_early_shadow(mem_to_shadow((void *)VMALLOC_ST=
ART),
> > >  > > > - mem_to_shadow((void *)KFENCE_AREA_END));
> > >  > > > -
> > >  > > > /* Populate the linear mapping */
> > >  > > > for_each_mem_range(i, &pa_start, &pa_end) {
> > >  > > > void *start =3D (void *)phys_to_virt(pa_start);
> > >  > > > @@ -309,9 +460,9 @@ void __init kasan_init(void)
> > >  > > > (unsigned long)mem_to_shadow(end), NUMA_NO_NODE);
> > >  > > > }
> > >  > > >
> > >  > > > - /* Populate modules mapping */
> > >  > > > - kasan_map_populate((unsigned long)mem_to_shadow((void *)MODU=
LES_VADDR),
> > >  > > > - (unsigned long)mem_to_shadow((void *)MODULES_END), NUMA_NO_N=
ODE);
> > >  > > > + kasan_shallow_populate((unsigned long)mem_to_shadow((void *)=
MODULES_VADDR),
> > >  > > > + (unsigned long)mem_to_shadow((void *)VMALLOC_END), NUMA_NO_N=
ODE);
> > >  > > > +
> > >  > > > /*
> > >  > > > * KAsan may reuse the contents of kasan_early_shadow_pte direc=
tly, so we
> > >  > > > * should make sure that it maps the zero page read-only.
> > >  > > > --
> > >  > > > 2.43.0
> > >  > > >
> > >  > >
> > >  >
> > >
> >
>
