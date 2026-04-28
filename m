Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6AC37F8B2
	for <loongarch@lists.linux.dev>; Tue, 28 Apr 2026 14:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777386895; cv=pass; b=sWKMKhVryZEz9UdquVLnl/yqXQN9bKZxdyk8pt+AEHLFhIe009Rm35l53kAGGQibicRlsDmzzXqgTWn3sRClVORHC12HlP2MNi3YsB9kse2+m5bY+DU1VtORQAPQmlJPkB49QtTFD+CRxAIlU3RugJHyMvBs3vrjt/Fzh+Gf67g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777386895; c=relaxed/simple;
	bh=oU/anFW3DRsUUuv4TQDDZBBUVZjUxz1D3ikMUAAufu8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WK71ClqP/4zW5gtosxCxjQqjs31sxSnxHdGnqrbGHaPB3cc+fSugnwwPGELp5YWbhrsXmYO/AqMuHSbu7Niz412x3oW9uqvreWVukB1gq3EdrVRjC/e3lyKHBvIv7eWt5iwIIUrl//Ur7ZPcsVTtTglpw6wbP5KIJn3lYWz0G1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b=liLxVbZJ; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b="liLxVbZJ"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-50d880e6fbbso126212371cf.0
        for <loongarch@lists.linux.dev>; Tue, 28 Apr 2026 07:34:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777386893; cv=none;
        d=google.com; s=arc-20240605;
        b=H1tzlaacdCYl1Rs6BAtkxgBYKBjkqnMemE1oBF09MwySfDzxMEzDz2oT/qiinM+psu
         IqBjG6QJND8GsPg6Yg7ZzqyDMS3F+T7Voaa+uewKrGoqkDVuVmbgYZn6hDMQhSpe6TZM
         I3zVEYd0AuUOQ2IsT6gurlp2hxYvURXNwEyvmZH4xdeeei+1mHEnan+Ayuze6NpLCTpu
         a8fbYR44qOjGDiOm7DsHFtITZkfL+h5yN158XWXZltD+XQXcnK7x44l1PqXpvDDAGJdr
         5feyR3i2gi6LvtlA6fsbjMzu8vYcDwzdTwtMHzcO2tPNG5WYBX3Zo+v2NmXeLJEfg8wf
         6+Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eQhFVJ4+LPBUTwWR+M90TmweYjwMt7L56NJXWho9jGA=;
        fh=WNNG43zguRq5veNfZFNFoDF3sfsJVwXDYgSg7aRrSiU=;
        b=ToeOJ28cgmq5IB4lesthqNJ3/aUyPGBKk3mW6IXsWEsyBTRXjuca1Va8XGvXE15dqe
         DJDCKedVQkLwp3S7xdxTmDSyeIutrG1QPa9GqVo4CF4rmQwCU535O+ixWEcR9Blu/n5d
         sWIzOlXbyI8RrvFj8Q+2oVvLv69XGrG5KgrSTtKZi2uM9zrmlFad7AK4c6c681QOXFZV
         4ngFxrFGeQC0em91K/wau+rwV1rvn9GgOaPaG+aHjx++E5+qIefhLpp7quuXoQdilO63
         xw7rRPwcJ7PsKKkFD33v39AabPQ/oqcEoa4y4Y/5y6dNdrWkXsBKYph8vOttGuopa98w
         aK4A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20251104.gappssmtp.com; s=20251104; t=1777386893; x=1777991693; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eQhFVJ4+LPBUTwWR+M90TmweYjwMt7L56NJXWho9jGA=;
        b=liLxVbZJ2/tQn1F31E3R6KenGqeE/pDx9L/7ZTZrkOYypcdeG5+gNtm6wGZ0yDamSr
         epMzw9a6HmX8Pb4GCbg9zoPntnzYdUnAYGv+0JebXODZMKlSxzrpxmB185ZMYFGdj1WY
         n4ixDDIL19prCfFyLrTRNsh7Inutg7seH2wAWh30QX1E4aPgtYu5jwPHPgU0N4OpWJc7
         D5491KLzqkjfOZHCwHyb+6W1BVhohzaqML9I8liunUKEHy1WTI6oFCcCa5HBjwBHmgbn
         REVUfsqXfEWeGE8Oifhlph4eC9AY/Rlz4q5aSkOvocXLLUh4XCyr4ftWIKWWNeHrLiU6
         zgKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777386893; x=1777991693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eQhFVJ4+LPBUTwWR+M90TmweYjwMt7L56NJXWho9jGA=;
        b=Bukd2Vog1AP7NBAoWDSdM1HEOIeIsgodN5EgXBNounZVEEfVgZ9+yaM/EHwyGbA6um
         oMsXX/8+Adr71TKMoI1N43ZWws0fHznT2115iZiwlw9Fnrr7DAMaeDElHkXJSsiKBjsl
         9WvSX7+0pe1xcOrvTgTwZFqqicRj29zlQVKG2Bcsl6r09CvLasax5/Nm2jPC9TmTmtSQ
         +VNhmKaEPaCEncloH0t48zLubzkIHcPZ0QnjawIhYwqOkx0kIabMKZYjxwk0fGojKdXm
         K8E/eqcRGcK6mn7N9FKiGmQHQUc61IU9y6zAaoBVASNJPN5cmNYJM8clC9bR2PzuzK2U
         czLA==
X-Forwarded-Encrypted: i=1; AFNElJ+t/l/R4fSjRz9H/649T3xPxRBWJYGag88GfS4xe4nbgpcULE7Jew1WujRvkUYvXEsC1UrKZB2Igq8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxC4oylp1Xf7Yr8zU6/62jhUnO+abJYwtulanKvV9DuBbCrhnPV
	0ySyPp1GFcluj4EHCetjUn8Kq8t56SHUz1LBpSCXnEys+ydxawaLDzustoWK3B1v4xxmmhPYxW6
	LWyKHycdajEu98RJYmD2C+S/a0XrCvcMv7evb1foFHg==
X-Gm-Gg: AeBDies3oGLZmq32zkxFYIZg84luvrzvWf9jManjJcvNM5mKr9lRKbOYGHWnrbygbc6
	qJt8SxgZnzpt2HP9xJegf5pGn1YFVbbEHhhx4NsijnRqY23gQlWfUuCrM9DBjRLKlOwLQSggMb9
	qnFrg2BZPv0PAASVQS+ooZGkWlUweK6Btj6RW8phoT5MM/zXcfNJXPbODjkHDoPbDgn5i2ZgFQu
	uZU5olUE1FF9glCBWDs4TuznGuTEsOKPrXjmB7aWsGAbB1yCBGx2xojJS/WiTVmVRD2RtbwhGVT
	W2xjyZMvWDwYHzYNwSItfqv8qUmmhS8Jn8+GOXJ/oWtSHO2mfTc=
X-Received: by 2002:a05:622a:454:b0:50f:cba1:18c4 with SMTP id
 d75a77b69052e-5100da50fadmr42348541cf.26.1777386892467; Tue, 28 Apr 2026
 07:34:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260428040159.1065822-1-r@hev.cc> <20260428040159.1065822-2-r@hev.cc>
 <CAAhV-H4dTKEwb6u5X08dX2UFxophvr_GsfB-FFt_UHbVqJJi8Q@mail.gmail.com>
In-Reply-To: <CAAhV-H4dTKEwb6u5X08dX2UFxophvr_GsfB-FFt_UHbVqJJi8Q@mail.gmail.com>
From: WANG Rui <r@hev.cc>
Date: Tue, 28 Apr 2026 22:34:41 +0800
X-Gm-Features: AVHnY4LkuMhCsyaFT_KaCu939taxa_kYyGlqpqAbl_pOc6YGwiBPcLmlHdowgFU
Message-ID: <CAHirt9hvsGLsDEo3qdWtC5BqiJsrCSv8UJYTZfqte8op7c8etw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] efi/loongarch: Randomize kernel preferred address
 for KASLR
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Lisa Robinson <lisa@bytefly.space>, 
	loongarch@lists.linux.dev, linux-efi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Huacai,

On Tue, Apr 28, 2026 at 1:01=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> Hi, Rui,
>
> On Tue, Apr 28, 2026 at 12:02=E2=80=AFPM WANG Rui <r@hev.cc> wrote:
> >
> > Introduce efi_get_kimg_kaslr_address() to compute the preferred
> > kernel image address dynamically when CONFIG_RANDOMIZE_BASE is
> > enabled. The function derives a random offset using EFI-provided
> > randomness combined with the timer value, and constrains it within
> > CONFIG_RANDOMIZE_BASE_MAX_OFFSET.
> >
> > Update EFI_KIMG_PREFERRED_ADDRESS to call this helper so that the
> > EFI stub can select a randomized load address when KASLR is active,
> > while preserving the original base address behavior when KASLR is
> > disabled or nokaslr is specified.
> >
> > Signed-off-by: WANG Rui <r@hev.cc>
> > ---
> >  arch/loongarch/Kconfig                   |  2 +-
> >  arch/loongarch/include/asm/efi.h         |  4 +++-
> >  drivers/firmware/efi/libstub/loongarch.c | 16 ++++++++++++++++
> >  3 files changed, 20 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> > index 3b042dbb2c41..a5afb70f73d9 100644
> > --- a/arch/loongarch/Kconfig
> > +++ b/arch/loongarch/Kconfig
> > @@ -730,7 +730,7 @@ config RANDOMIZE_BASE
> >  config RANDOMIZE_BASE_MAX_OFFSET
> >         hex "Maximum KASLR offset" if EXPERT
> >         depends on RANDOMIZE_BASE
> > -       range 0x0 0x10000000
> > +       range 0x20000 0x10000000
> >         default "0x01000000"
> >         help
> >           When KASLR is active, this provides the maximum offset that w=
ill
> > diff --git a/arch/loongarch/include/asm/efi.h b/arch/loongarch/include/=
asm/efi.h
> > index eddc8e79b3fa..f831320efd41 100644
> > --- a/arch/loongarch/include/asm/efi.h
> > +++ b/arch/loongarch/include/asm/efi.h
> > @@ -30,6 +30,8 @@ static inline unsigned long efi_get_kimg_min_align(vo=
id)
> >         return SZ_2M;
> >  }
> >
> > -#define EFI_KIMG_PREFERRED_ADDRESS     PHYSADDR(VMLINUX_LOAD_ADDRESS)
> > +unsigned long efi_get_kimg_kaslr_address(void);
> > +
> > +#define EFI_KIMG_PREFERRED_ADDRESS     efi_get_kimg_kaslr_address()
> >
> >  #endif /* _ASM_LOONGARCH_EFI_H */
> > diff --git a/drivers/firmware/efi/libstub/loongarch.c b/drivers/firmwar=
e/efi/libstub/loongarch.c
> > index 9825f5218137..c44be5d3dc04 100644
> > --- a/drivers/firmware/efi/libstub/loongarch.c
> > +++ b/drivers/firmware/efi/libstub/loongarch.c
> > @@ -38,6 +38,22 @@ static efi_status_t exit_boot_func(struct efi_boot_m=
emmap *map, void *priv)
> >         return EFI_SUCCESS;
> >  }
> >
> > +unsigned long efi_get_kimg_kaslr_address(void)
> Move it into arch/loongarch/include/asm/efi.h?

In that case, we'd need to declare efi_nokaslr and
efi_get_random_bytes() in efi.h. Since including efistub.h in efi.h
doesn't work, putting them here keeps things pretty clean.

Thanks,
Rui

>
> > +{
> > +       unsigned int random_offset =3D 0;
> > +
> > +#ifdef CONFIG_RANDOMIZE_BASE
> > +       if (!efi_nokaslr) {
> > +               efi_get_random_bytes(sizeof(random_offset), (u8 *)&rand=
om_offset);
> > +               random_offset ^=3D (random_get_entropy() << 16);
> > +               random_offset &=3D (CONFIG_RANDOMIZE_BASE_MAX_OFFSET - =
SZ_64K - 1);
> I still don't want to modify the range of RANDOMIZE_BASE_MAX_OFFSET, so u=
se
>      random_offset &=3D (CONFIG_RANDOMIZE_BASE_MAX_OFFSET - 1)
> here?
>
> > +               random_offset =3D ALIGN(random_offset, SZ_64K) + SZ_64K=
;
> It seems "random_offset =3D ALIGN(random_offset + SZ64K, SZ_64K)" is bett=
er.
>
> Huacai
>
> > +       }
> > +#endif
> > +
> > +       return PHYSADDR(VMLINUX_LOAD_ADDRESS) + random_offset;
> > +}
> > +
> >  unsigned long __weak kernel_entry_address(unsigned long kernel_addr,
> >                 efi_loaded_image_t *image)
> >  {
> > --
> > 2.54.0
> >
>
