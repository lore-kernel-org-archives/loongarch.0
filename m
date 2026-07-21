Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76613793CC
	for <loongarch@lists.linux.dev>; Tue, 21 Jul 2026 04:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784609821; cv=none; b=OB2H4IR7qyem1KcUtS7SREx5fTRJ1mbYv496UiSSiCi2Zg3EcQq/TQuSq6bhU7GIiSA8CQb/1WNI4Gl81CrRnI51iXKT5UB/PGlWdyIdZCv7+biLjlfD/0Q/D09bE0UsmV8iQq5n5X8t5qs/U0tiedr3pY7RbkznzXLSVo5lXd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784609821; c=relaxed/simple;
	bh=QZVVCklMAYZnM6wh7quCG8BOJeQPIhMvY91L43JIQs0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hrzisn2nDUB5mMTgFbnf9v+GPpyA0gUQwwNFPotnwomfYy1EOFxWvxFHDiPZ64JiaRoC/QZpdm79XQylo/5yCzvw6RyklYOwvWGJ3I+R4EPywqDVUYF1UY1fgZqssqHQbMXn/gVfOKbkk/IX4I6f7flgPAmqP99VpREPV+jqfuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D0rnIU6k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D0rnIU6k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 743B01F00A3A
	for <loongarch@lists.linux.dev>; Tue, 21 Jul 2026 04:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784609819;
	bh=RMvV8zHJ0YWHZpZGjoLFxMf7FQLHmiNjNa68W8trvtc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=D0rnIU6k/uzIevZydGbdnTO56J2zR9h2KH3xByy0JssQKCjXpCCY7mOxkUIsuUbXe
	 ROpeyFVUQET291WIy3gA+hXM8bz1hwEkEB1xIPm8z0Lm5p1mv0q3DLqyGC59yhyade
	 URjhQ1GqOWps/o0gOTZAeBSqaAyjeATVb7bndZvJ2Jc2UB3kE85XeR6t6xIDGAtkv3
	 FPVqIjcTiZcKcCfzmGytNCKqTttPSpoDa0jNsG4RgY3DDbSGrCu0XeMXcPpAN52PHl
	 VNfjLuuP04v1VBaDQnotE0tLFDjJtyn/IyHvRrH2MV+86CZdh015sf61fNbPBaSt07
	 6CtWFdyem1Wyw==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-69c1220bd51so12528501a12.3
        for <loongarch@lists.linux.dev>; Mon, 20 Jul 2026 21:56:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqBCIL6gS8fZj2JLaU/efDXeqS3sO3kCVXvaQCaIllepv9jKa61xq1e+HQPUJ9QYqpJ3UIwS1PDzWU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwPwKyz/KDs+TgERgjsPOI1VpAy9eKG/+KLG5WsY2W+2ky1fR0x
	YYOLP+vp0k3fvWJlLmVk2IjE8e5M/hQOvHlf9VsP/J3NmWpyWdBXeH0bFbAFjmET1Ofm2cjWR6N
	JQ038iVy9GGhZUmDRog1REUog+6Fm6j4=
X-Received: by 2002:a05:6402:5286:b0:698:ade9:757f with SMTP id
 4fb4d7f45d1cf-69e652e0c81mr6223233a12.19.1784609818044; Mon, 20 Jul 2026
 21:56:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260717075715.25513-1-yangtiezhu@loongson.cn>
 <20260717075715.25513-3-yangtiezhu@loongson.cn> <alySgaaQen6ZtwSo@kernel.org>
 <ba8b2723b563cd290c5c00fb4ec2402626fba06c.camel@xry111.site> <38d130e6-7036-e296-e058-433c8ba7a265@loongson.cn>
In-Reply-To: <38d130e6-7036-e296-e058-433c8ba7a265@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 21 Jul 2026 12:56:42 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4huLS_G+TMDKZ5sFwFH9BJsQbQeADtyH3CSnkHirCnaw@mail.gmail.com>
X-Gm-Features: AUfX_mzM6qRkuX0HyFLmmwRdjcJKwGwcwAnFR5p5zb2EUUQxAoEkjSBvo-LZGaI
Message-ID: <CAAhV-H4huLS_G+TMDKZ5sFwFH9BJsQbQeADtyH3CSnkHirCnaw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] LoongArch: mm: Expand modules virtual address
 space to 2GB
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Xi Ruoyao <xry111@xry111.site>, Mike Rapoport <rppt@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2026 at 6:40=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> On 2026/7/19 =E4=B8=8B=E5=8D=8811:28, Xi Ruoyao wrote:
> > On Sun, 2026-07-19 at 12:01 +0300, Mike Rapoport wrote:
> >> On Fri, Jul 17, 2026 at 03:57:15PM +0800, Tiezhu Yang wrote:
> >>> Frequent "execmem: unable to allocate memory" warnings are observed
> >>> during kernel module loading when updating the latest kernel.
> >>>
> >>> This is because the modules virtual address region on LoongArch is
> >>> tightly constrained to 256MB, while ARM64 and RISC-V are natively
> >>> configured with a spacious 2GB region.
> >>
> >> The constraint follows architecture ability to address kernel instruct=
ions
> >> and data from modules code.
> >>
> >> I don't know what are loongarch requirements, but I remember that arm6=
4
> >> added a layer of relocation support to allow 2G module address space.
> >
> > IIUC on LoongArch the size of one module is limited to 256MB, but the
> > total size of modules can be up to 2GB, as the module loader creates PL=
T
> > entries for calls across the module boundary.
Unfortunately, the one module size also limits the MODULE REGION size,
we have observed that the distance between .init.text and .text of the
same module is too large and the module loader prints an error.

Huacai

> >
> > I'd seen the "execmem: unable to allocate memory" error loading the
> > large amdgpu module.  But after I stripped the amdgpu module those
> > warnings gone away.  To me this is very strange: shouldn't the module
> > loader just ignore the debug info even if it's not stripped instead of
> > requesting execmem for it???
>
> I did the following changes based on the original 7.2-rc4 for debugging:
>
> ```
> diff --git a/kernel/module/main.c b/kernel/module/main.c
> index 46dd8d25a605..5eab1ab8b195 100644
> --- a/kernel/module/main.c
> +++ b/kernel/module/main.c
> @@ -2972,7 +2972,6 @@ static struct module *layout_and_allocate(struct
> load_info *info, int flags)
>           * special cases for the architectures.
>           */
>          layout_sections(info->mod, info);
> -       layout_symtab(info->mod, info);
>
>          /* Allocate and move to the final place */
>          err =3D move_module(info->mod, info);
> @@ -3013,9 +3012,6 @@ static int post_relocation(struct module *mod,
> const struct load_info *info)
>          percpu_modcopy(mod, (void
> *)info->sechdrs[info->index.pcpu].sh_addr,
>                         info->sechdrs[info->index.pcpu].sh_size);
>
> -       /* Setup kallsyms-specific fields. */
> -       add_kallsyms(mod, info);
> -
>          /* Arch-specific module finalizing. */
>          return module_finalize(info->hdr, info->sechdrs, mod);
>   }
> ```
>
> With this diff, the "execmem: unable to allocate memory" warnings disappe=
ar
> completely:
>
> fedora@linux:~/7.2-rc4.git$ dmesg -t | grep "execmem:"
> fedora@linux:~/7.2-rc4.git$ readelf -S
> drivers/gpu/drm/amd/amdgpu/amdgpu.ko | grep -A 1 -E "debug_info|symtab"
>    [23] .debug_info       PROGBITS         0000000000000000  00b73fa9
>         000000000bfde1bc  0000000000000000           0     0     1
>    [24] .rela.debug_info  RELA             0000000000000000  280f2e40
>         0000000011f754a8  0000000000000018   I      75    23     8
> --
>    [75] .symtab           SYMTAB           0000000000000000  18934e78
>         000000000f1a0dd8  0000000000000018          76   10548226     8
>
> This test proves that the "execmem: unable to allocate memory" warning is
> entirely triggered by the massive unstripped .symtab section (~241.63 MB)
> rather than the debug sections themselves.
>
> As the readelf data shows, the ~500MB debug sections remain fully present
> in the static file, yet the memory allocation succeeds without any errors=
.
>
> This confirms that the generic loader successfully ignores non-SHF_ALLOC
> sections during layout_sections().
>
> However, layout_symtab() must put the massive .symtab into memory to
> support kallsyms and oops backtraces. Combined with the driver core code,
> the total memory request reaches ~252.86 MB. This immediately triggers
> allocation failures because 252.86 MB is too close to the narrow 256MB
> limit on LoongArch, especially when virtual memory fragmentation exists.
>
> We cannot strip modules or remove layout_symtab() because we need
> backtrace symbols for debugging. Therefore, the ~252MB memory demand is
> a hard requirement, and expanding MODULES_END to 2GB is necessary for
> large modern drivers on LoongArch.
>
> Thanks,
> Tiezhu
>
