Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D444733ADBA
	for <loongarch@lists.linux.dev>; Fri, 31 Jul 2026 07:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785483462; cv=none; b=WI2d//BMDAs79D/n9B6h4vyYPnNWzP5Na9kfjgR/m4sDWM43dalLFCDM7uKUb0fPDKm3Yg9CWihR6IZgxXu41jVsTFLwKSfiU5dm0w6lLyVRgvHCGoE7FyxpHlbxuHVcScqS1JmhtZ882IPAVXz6hutKLnBK898q2zrrYq5tMOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785483462; c=relaxed/simple;
	bh=d/jX83tfsqpZnpeKKEgRG/rITvCNee3IxJzndUG8nrk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jfoO8DyP8LxQLcnAriINDoSDQ+IguY5Pi0wy9D4kzSQqFpmfVEJMhfXLlSCX+HZLnqpoGnpyE3kHFK3wi6/HEp0ULKX7mh9DEpqjj6BzM3vTXsjHwuv2uJ5LS8i60QFEizDPOJmxD4IoMVQnkNWUhx5/xKvDgNQmMDjBenb0YB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aeW+P7az; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aeW+P7az"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E5581F00A3F
	for <loongarch@lists.linux.dev>; Fri, 31 Jul 2026 07:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785483460;
	bh=0iZQHz7NeGZMsBVItQcixhsFj58C0OgYWDKDkF6Dau0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=aeW+P7azcEYrHe4APercn3sqTRSCmhLfiQydckmu95XOSwR5slHPjMPKNfiiO+QIk
	 MjpaHYQS87Iwp62b/ZOxFoxaXIXEsw013z04i7iXlXlKryDdsrhYOhQuJO70p6XqUJ
	 8AZTyUcOsFG0Zhj+yyo/LE1xMp+Sre+E9pO1F86eDnf5tX1TS/qAwRkgHYhq/lKgIv
	 DRMlTwyq24QHCTmw+mTMRrwF5xrJqYgBulqNZjIPPdKI5ZZMpS6UcMKAOBrzepRQUx
	 sO59Jp+/TnHl6XkE+TftXu83SPycyKXJMC115uN1uMPkJoywOERNDwr8b4pwFLhxOj
	 ZtQkF/ZYlT5MQ==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a08a2b7e5bso1015121a12.1
        for <loongarch@lists.linux.dev>; Fri, 31 Jul 2026 00:37:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpwF5FdJH4VR7X8MWvPIECHfcG1qZmlRjh9/L32M6G/LK173NwCMcI+6teAZs9K84yIob/AAisNVW0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwHShy09P93Aqqvcy3+0jFjgVi03GNdk92mDT+xr6YqW8yGiJVu
	81vtebuV8s1WP3I02iZFEB4CX1A70+8ar/HA4V9CTdtdiwTi0QZZ11hedDD/gjgUbP6TmOAZPIm
	OMiKXLmbJe+3Kd9Dwkiyo5UI2/A8ZifU=
X-Received: by 2002:a05:6402:44d9:b0:697:eb97:a4ed with SMTP id
 4fb4d7f45d1cf-6a09ba1f2f9mr302833a12.7.1785483459137; Fri, 31 Jul 2026
 00:37:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260721090606.8982-1-yangtiezhu@loongson.cn> <20260721090606.8982-3-yangtiezhu@loongson.cn>
 <11c42b7c-7805-cce7-305d-6e52c14db20e@loongson.cn>
In-Reply-To: <11c42b7c-7805-cce7-305d-6e52c14db20e@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 31 Jul 2026 15:38:05 +0800
X-Gmail-Original-Message-ID: <CAAhV-H47kc-=A2syzJNLWOD1=TWumvyYWObL+xutrbSRy=WpWA@mail.gmail.com>
X-Gm-Features: AUfX_mwnrI87ZsEoe4v5LzD35XC58e3JtwAHKXTs3OkJso5rEbEdY1NBlQ3IO_I
Message-ID: <CAAhV-H47kc-=A2syzJNLWOD1=TWumvyYWObL+xutrbSRy=WpWA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] LoongArch: Skip address pairing for non-exec sections
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: linux-mm@kvack.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Tiezhu,

On Fri, Jul 24, 2026 at 2:07=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> On 2026/7/21 =E4=B8=8B=E5=8D=885:06, Tiezhu Yang wrote:
> > The module loader currently runs expensive address pairing logic for al=
l
> > sections blindly during relocation. For massive modules like amdgpu, th=
is
> > causes the loader to waste lots of CPU cycles analyzing non-exec sectio=
ns.
> >
> > Furthermore, there is an inconsistency since module_frob_arch_sections(=
)
> > already ignores non-exec sections during the counting phase.
> >
> > Check the SHF_EXECINSTR flag in apply_relocate_add(). If the section is
> > non-exec, skip address pairing and then jump to normal relocation. This
> > eliminates redundant search loops to improve module loading efficiency.
> >
> > Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> > ---
> >   arch/loongarch/kernel/module.c | 6 ++++++
> >   1 file changed, 6 insertions(+)
> >
> > diff --git a/arch/loongarch/kernel/module.c b/arch/loongarch/kernel/mod=
ule.c
> > index 7d4d571ee55e..c84ac1546dc6 100644
> > --- a/arch/loongarch/kernel/module.c
> > +++ b/arch/loongarch/kernel/module.c
> > @@ -484,6 +484,7 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const cha=
r *strtab,
> >       Elf_Addr v;
> >       Elf_Sym *sym;
> >       Elf_Rela *rel =3D (void *) sechdrs[relsec].sh_addr;
> > +     Elf_Shdr *dst_sec =3D sechdrs + sechdrs[relsec].sh_info;
> >
> >       pr_debug("%s: Applying relocate section %u to %u\n", __func__, re=
lsec,
> >              sechdrs[relsec].sh_info);
> > @@ -522,6 +523,10 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const ch=
ar *strtab,
> >
> >               v =3D sym->st_value + rel[i].r_addend;
> >
> > +             /* Skip address pairing for non-exec sections */
> > +             if (!(dst_sec->sh_flags & SHF_EXECINSTR))
> > +                     goto apply_normal;
> > +
> >               if (type =3D=3D R_LARCH_PCADD_LO12 || type =3D=3D R_LARCH=
_GOT_PCADD_LO12) {
> >                       bool found =3D false;
> >                       unsigned int j =3D idx;
> > @@ -562,6 +567,7 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const cha=
r *strtab,
> >                       idx =3D j; /* Record the previous j-loop end inde=
x */
> >               }
> >
> > +apply_normal:
> >               switch (type) {
> >               case R_LARCH_B26:
> >                       err =3D apply_r_larch_b26(mod, sechdrs, location,
> >
>
> According to the LoongArch ABI specification, the following relocation
> types exist exclusively in executable code sections:
>
> R_LARCH_PCADD_LO12
> R_LARCH_GOT_PCADD_LO12
> R_LARCH_B26
> R_LARCH_GOT_PC_HI20...R_LARCH_GOT_PC_LO12
> R_LARCH_GOT_PCADD_HI20...R_LARCH_GOT_PCADD_LO12
> R_LARCH_SOP_PUSH_PLT_PCREL
>
> https://github.com/loongson/la-abi-specs/blob/release/laelf.adoc
>
> Thus, here is a better way:
>
> ```
> diff --git a/arch/loongarch/kernel/module.c b/arch/loongarch/kernel/modul=
e.c
> index 7d4d571ee55e..b1452b8adc63 100644
> --- a/arch/loongarch/kernel/module.c
> +++ b/arch/loongarch/kernel/module.c
> @@ -484,6 +484,8 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char
> *strtab,
>          Elf_Addr v;
>          Elf_Sym *sym;
>          Elf_Rela *rel =3D (void *) sechdrs[relsec].sh_addr;
> +       Elf_Shdr *dst_sec =3D sechdrs + sechdrs[relsec].sh_info;
> +       bool is_exec =3D !!(dst_sec->sh_flags & SHF_EXECINSTR);
>
>          pr_debug("%s: Applying relocate section %u to %u\n", __func__,
> relsec,
>                 sechdrs[relsec].sh_info);
> @@ -522,6 +524,14 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const
> char *strtab,
>
>                  v =3D sym->st_value + rel[i].r_addend;
>
> +               /* Skip relocation types that exist exclusively in
> executable sections */
> +               if (!is_exec) {
> +                       err =3D handler(mod, location, v, rela_stack,
> &rela_stack_top, type);
> +                       if (err)
> +                               return err;
> +                       continue;
> +               }
> +
>                  if (type =3D=3D R_LARCH_PCADD_LO12 || type =3D=3D
> R_LARCH_GOT_PCADD_LO12) {
>                          bool found =3D false;
>                          unsigned int j =3D idx;
> ```
>
> For the non-exec sections such as .orc_unwind_ip:
>
> fedora@linux:~/7.2-rc3.git$ objdump -h
> drivers/gpu/drm/amd/amdgpu/amdgpu.ko | grep -A 1 .orc_unwind_ip
>   32 .orc_unwind_ip 000ac104  0000000000000000  0000000000000000
> 18592470  2**0
>                    CONTENTS, ALLOC, LOAD, RELOC, READONLY, DATA
>
> there are 176193 relocation entries:
>
> fedora@linux:~/7.2-rc3.git$ readelf -rW
> drivers/gpu/drm/amd/amdgpu/amdgpu.o | grep .rela.orc_unwind_ip
> Relocation section '.rela.orc_unwind_ip' at offset 0x3a5321e8 contains
> 176193 entries:
>
> Using the section flag check reduces the operation to a single check for
> massive data sections; otherwise, the loader would have to perform six
> redundant type comparisons across the if-statement and switch-case for
> every single relocation entry.
Please just drop this patch and make the first one better.

Now the first patch has a risk that the distance between .init.text
and .text of the same module exceeds 128MB. I solved it and you can
verify:
https://github.com/chenhuacai/linux/commit/f87f9d82869ebc71dca4c02bdff1cd20=
3913a98f

Huacai
>
> Thanks,
> Tiezhu
>
