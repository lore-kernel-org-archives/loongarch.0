Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3189F3822AF
	for <loongarch@lists.linux.dev>; Wed, 29 Apr 2026 07:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777447954; cv=none; b=hgkeaxjB1kZXjPcXUHo2xG4wmSqqWxHjsJu2QtnwWl+XCEq8E/aoksHyyP+ct13kw+I/1Ep76ruKD81fTGu7zUDf+QmNNjOk2ZQYQx8Tg/c3AEvUQerxT5JDMztax/vCEQQ8VlQOjrF9H2HqcJwgatouigxXf79jWriy5CF7eQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777447954; c=relaxed/simple;
	bh=cWQcWwhik7lek2Yw0FUs7I8TtELtGOIMSoywqoUicnY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O3KM2BKOl3Cgt/buRS5iF273wvVJOKoCs9/BC3oRBaJSvkr/cyv44IhE+ckV/Da7X44cwdhIBNYo1IrYl7TG/3iHSBdKkTaCONyqXjOCtrishyl+qGAIakhUraxIytgC3rsjOeQGS4QgzAVVl4BRPfhud657zrk+G4cTsPFHTp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T4jWy2Ze; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T4jWy2Ze"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED497C2BCF4
	for <loongarch@lists.linux.dev>; Wed, 29 Apr 2026 07:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777447954;
	bh=cWQcWwhik7lek2Yw0FUs7I8TtELtGOIMSoywqoUicnY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=T4jWy2Ze/j2B+lP54VpoupsP09OVsey7JT93AiojZvgsaIoI8OWKWnojAlPJopVpE
	 Z44EwCFLydkAe09GUl2iXum5lhq1r1GjSVgCHXwlE8qRT/YCW4FG0ASV+BcPHIwNrb
	 0DrXtMUv5++vQBa9XGKigeEor5u4vf2ArNYqADQjgdsjdFaMlDQkELmEOeX8U37JFg
	 uSKLDovv+EA/A0KSgkgCOIpUN6YhpNd/3kVelGq6jVqOmNoswuqwLE7b1uXGrCn/Hj
	 oL3IZGdnPW8NJPWlsRYGvlM8Uw+3VQR+UtDPI7RRTP3ZmTkwgBS37hM6365rHoU6y/
	 U7zMuUeIiZEfQ==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ba60d78aff3so1563601966b.2
        for <loongarch@lists.linux.dev>; Wed, 29 Apr 2026 00:32:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8iKfnvucRYUj6Ft/+lY4yRu8VGBbAJhrFmuAtRdLpWDgEtP69pMBtQPGKprYKlLlp3aU/VRvzGyOo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwlkNUV2pnEd8shnbMVGB7FFywvHGvK9qkao65vZjOCvO2skYin
	R9zy54TsaCUweFOp0W+CjnQPeUPfcW5IFKDHv1CuMkf6d5CIstTu2ndNzCQM0CEPRjewxnVKuxb
	Eveu8UdOMl5VnaLiABMM3xAxhSXulghU=
X-Received: by 2002:a17:906:6a1e:b0:ba5:a3a0:4a3f with SMTP id
 a640c23a62f3a-bb804a29530mr426323666b.35.1777447952371; Wed, 29 Apr 2026
 00:32:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260427084721.40535-1-r@hev.cc> <d7197b01-9b7e-4f0a-bcd2-9d6d894e8cd9@app.fastmail.com>
 <e631d1e5-3f05-42ab-885d-4bd660612d63@app.fastmail.com>
In-Reply-To: <e631d1e5-3f05-42ab-885d-4bd660612d63@app.fastmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 29 Apr 2026 15:32:19 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5w=UmtZt_JCR=BvZt-+F9usnmjh2dMBLHzeiE-7xBddQ@mail.gmail.com>
X-Gm-Features: AVHnY4LI_z65v5Ok2OKBZ-AfV9iDHSzl64zVNLt4Gg71gQxkrxPNW2EQDJ6AKds
Message-ID: <CAAhV-H5w=UmtZt_JCR=BvZt-+F9usnmjh2dMBLHzeiE-7xBddQ@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 0/2] efi/libstub: Ensure instruction cache
 coherency after kernel relocation
To: Ard Biesheuvel <ardb@kernel.org>
Cc: WANG Rui <r@hev.cc>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	WANG Xuerui <kernel@xen0n.name>, linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2026 at 7:07=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> wr=
ote:
>
>
>
> On Mon, 27 Apr 2026, at 18:11, Ard Biesheuvel wrote:
> > On Mon, 27 Apr 2026, at 10:47, WANG Rui wrote:
> >> Changes since [v1]:
> >>   * Move efi_cache_sync_image() after check_platform_features(), match=
ing arm64.
> >>   * Add "()" after function name in the subject.
> >>
> >> The EFI stub relocates the kernel image by copying it to a new memory
> >> location using memcpy(). On architectures where the instruction and da=
ta
> >> caches are not automatically coherent, the copied instructions may not=
 be
> >> visible to the instruction fetch unit without explicit cache maintenan=
ce.
> >>
> >> This series adds the missing call to efi_cache_sync_image() in the gen=
eric
> >> relocation path, and provides a LoongArch implementation using the iba=
r
> >> instruction to ensure instruction fetches observe the updated contents=
.
> >>
> >> [v1]: https://lore.kernel.org/loongarch/20260427034451.717817-1-r@hev.=
cc
> >>
> >> WANG Rui (2):
> >>   efi/loongarch: Implement efi_cache_sync_image
> >>   efi/libstub: Synchronize instruction cache after kernel relocation
> >>
> >
> > Queued up in efi/urgent - thanks.
Maybe this series should cc stable?

Huacai

> >
>
> This breaks the ARM build.
>
> Since LoongArch is the only remaining user of efi_relocate_kernel(), I'll=
 move it into drivers/firmware/efi/libstub/loongarch-stub.c first, and fix =
up these patches accordingly afterwards (no need to resend anything)
>
