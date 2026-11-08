Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794125836;
	b=SUYCsd4dIwf8NDuYnHX8BX/Mx7hS4RSkvmI8TqmonFqZo4VYYYzLomo2JiGPiI+/Oa45
	 S1IDcyMk1eVne5cUE8mr5qxV+5dfjtpE/MPUZLoEaw+qLStI4oKgXh2zXj5KiQ4vBqOla
	 tavPDaaa5aDBY7vJGDE9B5kH0FK35HxcvQfmUis0roR85NNPdbRxWoxG0gEbdoQeZK9DD
	 I1ndGDumxda+7ytDgqGJaaJ4oGHxrLiFQXFccchy960PBRaNj08SDDtRmNz3/JAzDLPb6
	 oX/p4gz1mCdNJ6SqUhZ0ynXVdcRvjs0/lvJpMRZp8Ibyq2fTh2MTfOj/EvycaqbW9nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794125836;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5G5dlJmNinReA7/ecM0YTHSYy6jzMfVBo3rP1dlvGSA=;
	b=kcahyHg4mQa/22+5df/XjDfhDiJRNU//AYkJ80LkSn7BbrkShVK0hlljkVgunkgCKtGq
	 U046wPJX1qQh0F5E14cJ8UEvxqCQ8wftfno/BCp0ON+sNdcH1L1kKcHpFjeEHfB2dz7Ki
	 87kpu38oe+ZUVEk7FWFb1slZlG0KL34PTJPGjRxPkTA2qrLggFf1yyD3MfGoBLDqgGqyM
	 TbI2/hddYTEGAgWle4O94wAOz0FKj6maWTf6gmJBaa/vjvsY3XBlAdGYcBmfIFKavtbsV
	 2ZAHMiJoFOiWKDlZji9TGLUXCCbz3Vmab2BfCDiEJje2lXT+3U522Aya+Ia6vmqBlUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="V1YatT/H";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51417606A326
	for <loongarch@lists.linux.dev>; Sun,  8 Nov 2026 08:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V1YatT/H
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE7BC1F008A1
	for <loongarch@lists.linux.dev>; Sun,  8 Nov 2026 08:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794125834;
	bh=5G5dlJmNinReA7/ecM0YTHSYy6jzMfVBo3rP1dlvGSA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=V1YatT/HNDFxAof6DMYsq7uFzNJzww3T6v8VeSzdPfgWasg/HCz1qbGODPIYjmBy3
	 k3p/CjiPfAggNojvZnFP65ZwLqNaRWR/ZSCMObAC72gxeb+hGXTBHSlCEZt3oOsofZ
	 q2Mo5n9IQaIaeRtXhaEykS9ZgrbKKVhHArRJ6ieARHl0P38i/6PrEShl2X/B+TWmAa
	 /9MOGmalJNzd++A3tSD9LBji9t5rwPLlAusNWevVPDfT8+etUeHRSifCIaM7Vh+1jX
	 2p3V7K2iM9EbaAT7CZnU+4bYH6zWFtmxJSBcN9mhCn9Bfj2NIUtsQtcyH2uEItHlbi
	 BHT4/xq4b7LtA==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so352616a12.1
        for <loongarch@lists.linux.dev>; Sun, 08 Nov 2026 00:17:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFfvQcrywf9AGCEMVajWTEUmD76ZbaiUVNP+yYjsPrgkHuYgKym3RljxwRmwkWHu1C/ukT9MalfC4I=@lists.linux.dev
X-Gm-Message-State: APuU4Z8t1JsZJneawK1TeaWg/djULEVO53GbAV7IZ5rRuSH9oiNHl40R
	TiqY9I9abUyCIS1wxOzYO2WEAjUQf5tFKSdLAwS17MkXa41/UxdbANSwzj4jqIQVZFJ9+fYD1rZ
	34Ys9Ppa9X00dBlJ6vimN4e+Xj7dAW+0=
X-Received: by 2002:a05:6402:400b:b0:6b6:e8cb:643e with SMTP id
 4fb4d7f45d1cf-6b72244119emr538367a12.23.1794125833477; Sun, 08 Nov 2026
 00:17:13 -0800 (PST)
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261031-fixes-loongarch-v1-1-e0e33e3c008e@kernel.org> <avAr894n6lNGD9C8@kernel.org>
In-Reply-To: <avAr894n6lNGD9C8@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 8 Nov 2026 16:17:02 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5kDgiaDF3t9BakAeD31JxET+27jcVvNU=ZQDZv_vSBcA@mail.gmail.com>
X-Gm-Features: AclHuK_evHNqSt9o4YcBLRgf6IEwJjqK3z3uypzlyoWpiPLFt8x6t0wFbOv_yL4
Message-ID: <CAAhV-H5kDgiaDF3t9BakAeD31JxET+27jcVvNU=ZQDZv_vSBcA@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: restore KFENCE pages through DMW on resume
To: Mike Rapoport <rppt@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 3:59=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wrot=
e:
>
> Gentle ping :)
Sorry for the late response, would you mind if I modify it to use
#ifdef? Usually it should be avoided, but I want to signal users that
KFENCE is not a usually enabled feature.

Huacai

>
> On Sat, Oct 31, 2026 at 03:21:46PM +0200, Mike Rapoport (Microsoft) wrote=
:
> > With KFENCE enabled, resume from hibernation triggers KFENCE reports wh=
ile
> > swsusp_asm_resume() copies the image pages, for example:
> >
> >   BUG: KFENCE: use-after-free write in swsusp_asm_resume+0x20/0x94
> >
> >   Use-after-free write at 0x00000000a57ee925 (in kfence-#254):
> >    swsusp_asm_resume+0x20/0x94
> >    hibernation_restore+0x128/0x1a0
> >    load_image_and_restore+0x6c/0xc8
> >    software_resume+0x240/0x260
> >    do_one_initcall+0x68/0x200
> >    kernel_init_freeable+0x26c/0x304
> >    kernel_init+0x20/0x134
> >    ret_from_kernel_thread+0x24/0x1d0
> >    ret_from_kernel_thread_asm+0xc/0x98
> >
> > During resume from hibernation, the image pages that occupy physical pa=
ges
> > used by the restore kernel are first loaded into free pages and then, a=
s
> > the very last step, swsusp_asm_resume() copies them to their final loca=
tion
> > pointed to by pbe->orig_address, which the hibernation core sets to
> > page_address() of the page in the restore kernel.
> >
> > The early KFENCE pool is allocated from memblock and normally occupies =
the
> > same physical pages in the restore kernel and in the image kernel, so t=
hese
> > pages are usually copied by swsusp_asm_resume().
> >
> > The KFENCE pool is remapped into the KFENCE area above vm_map_base and
> > set_page_address() adjusts page->virtual so that page_address() returns
> > the page-table mapped alias rather than the DMW address of the pool pag=
es.
> >
> > Hence, pbe->orig_address of KFENCE pages points to that alias and
> > swsusp_asm_resume() writes them through the page tables. But:
> >
> > * the copy loop overwrites the kernel page tables, so a TLB refill for =
the
> >   KFENCE alias may use a partially restored page table
> > * the KFENCE pool pages that are protected in the restore kernel fault =
in
> >   the middle of the copy
> >
> > Convert pbe->orig_address to DMW addresses before starting the copy.
> >
> > Fixes: 0ca84aeaee15 ("LoongArch: Make {virt, phys, page, pfn} translati=
on work with KFENCE")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > ---
> > Reproduced with hibernation in QEMU, the KFENCE reports are gone with
> > this patch.
> > ---
> >  arch/loongarch/power/hibernate.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/arch/loongarch/power/hibernate.c b/arch/loongarch/power/hi=
bernate.c
> > index 817270410ef98..ff571ab4e8df9 100644
> > --- a/arch/loongarch/power/hibernate.c
> > +++ b/arch/loongarch/power/hibernate.c
> > @@ -59,6 +59,18 @@ extern int swsusp_asm_resume(void);
> >
> >  int swsusp_arch_resume(void)
> >  {
> > +     struct pbe *pbe;
> > +
> > +     /*
> > +      * page_address() of KFENCE pages is mapped by page tables that a=
re
> > +      * overwritten during restore and may be protected by KFENCE, cop=
y
> > +      * through DMW instead.
> > +      */
> > +     if (IS_ENABLED(CONFIG_KFENCE)) {
> > +             for (pbe =3D restore_pblist; pbe; pbe =3D pbe->next)
> > +                     pbe->orig_address =3D __va(virt_to_phys(pbe->orig=
_address));
> > +     }
> > +
> >       /* Avoid TLB mismatch during and after kernel resume */
> >       local_flush_tlb_all();
> >       return swsusp_asm_resume();
> >
> > ---
> > base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
> > change-id: 20261027-fixes-loongarch-fd3755f33919
> >
> > --
> > Sincerely yours,
> > Mike.
> >
>
> --
> Sincerely yours,
> Mike.
