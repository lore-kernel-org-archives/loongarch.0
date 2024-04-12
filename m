Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348E318B1B
	for <loongarch@lists.linux.dev>; Fri, 12 Apr 2024 04:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712894462; cv=none; b=MpWqLTLNiN2vz2stoW+uJA+idIxgcgUa1yewCcJcwltpUPX/ORPqPcuF8azisTVruPI7fJQHIBp9aMv06sh6wYWEJd25FnR81BKsKA9XXG4i1EhG9Hqmj4C1+SFihQQNLP+i86WwFhIk/SguaiBt1w3aCc3SGk42Notldc//b30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712894462; c=relaxed/simple;
	bh=FHSLyEEKVchTgoIEr+g2q0br3k2Eynv1qaMzyMLT3Hg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h7pI+gDN3TsdyPOlp6VQEJDLNAnB1e6dnJev0LFmy9wjozZvNzcBbByRl2z0GuzRR9+bzpsTi7yxu5PzhCMGGVdmWxcLIW95xJrIK/xfjdjrWCN3/QfRAwmezCBzC1HfS65oUBM+On4JzKVEtIeKssDE5BTnHBp/ijtxlu+bdTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=id6QSBwk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="id6QSBwk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B790BC4AF09
	for <loongarch@lists.linux.dev>; Fri, 12 Apr 2024 04:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712894461;
	bh=FHSLyEEKVchTgoIEr+g2q0br3k2Eynv1qaMzyMLT3Hg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=id6QSBwk2Qp9f+Kk3l3Z/oTjSONeD7FHDo+qcKVegnN1rRstsf3oagOKt3RL3o5aa
	 37AcLfuSZVGcoscqvZ/C90JJyqTv6uSdJweQvl/NUujTiYh5ADKOIhYYIZBv2pHPux
	 HbBISoNia61g7Aq4F9KfhOO6JAHfsliZIlm4o1UstHHGK08cfQYlcNDrHpIsrRG07S
	 6UBTwWWBwDCylI0sh3uedEBf5yI8RxsKuEw4AmXFbCrwYWYLd6LLf8QrTAnH4fhP+E
	 JxtfazIPUl2k92NJEafLUcWAKj2u1b+d/yMRES2glZE3lRlKvk61gersb9ZW5V1Gah
	 T72B71wOChqng==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a5224dfa9adso82567066b.0
        for <loongarch@lists.linux.dev>; Thu, 11 Apr 2024 21:01:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVrB20E4VFHf3ijvIIhQGrU4z+WOFYNJGxPrakRHQZ4gLW7Au0d7j/cTSR57rkTKz4wCjyMDMfKCK/bIpWl/rstgV2LhX369lzt
X-Gm-Message-State: AOJu0YyRQg8uP3Ota0PDalJvKx3InqGag+wiccNDD/PncCyLq0jqA1tb
	pj7YEbob8G4xVcaLJDb9oRzN90yn6rOsxJoYYaQl8owF/Fhb1DRq9G3uFTN2JW4sUNSv2CKApTU
	DDfahhwgJeQmZlK5Z/a+bG+aHiPU=
X-Google-Smtp-Source: AGHT+IHMeYbJOyi7Ccq855zSMgHosnr4GQ68jNXSxE9iS3Sw1TKAkNICK8Mpqdzs9J2jUVOatmouDgXZpyCzwF81gjg=
X-Received: by 2002:a17:907:78c2:b0:a51:f823:f4b4 with SMTP id
 kv2-20020a17090778c200b00a51f823f4b4mr1155256ejc.17.1712894460290; Thu, 11
 Apr 2024 21:01:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240411010510.22135-1-yangtiezhu@loongson.cn>
 <CAAhV-H6bHudfUVE4SWY88mxmLhFok9DS8UyODSZEdUJ816V8Rg@mail.gmail.com> <b752273b-0e94-4325-9cf8-6f16a204818b@app.fastmail.com>
In-Reply-To: <b752273b-0e94-4325-9cf8-6f16a204818b@app.fastmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 12 Apr 2024 12:00:53 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5LMURye9syEasvbmm_gk5WrcJhbLZByXWXte5A5KaO8Q@mail.gmail.com>
Message-ID: <CAAhV-H5LMURye9syEasvbmm_gk5WrcJhbLZByXWXte5A5KaO8Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Give chance to build under !CONFIG_SMP for LoongArch
To: Arnd Bergmann <arnd@arndb.de>
Cc: Marc Zyngier <maz@kernel.org>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	Thomas Gleixner <tglx@linutronix.de>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Arnd,

On Thu, Apr 11, 2024 at 2:07=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Thu, Apr 11, 2024, at 06:26, Huacai Chen wrote:
> >
> > I remember that you both suggested not introducing NOSMP support for a
> > modern architecture which brings additional complexity. I wonder if
> > you still have the same attitude now. I will merge this series only if
> > you think it is worthy to introduce NOSMP now.
>
> It's an interesting question, as we have recently discussed two
> opposite ideas and may end up doing both (or possible neither)
> in the future:
>
> - On x86, there is no real reason to need non-SMP kernels as the
>   memory savings are fairly small, and it tends to break because
>   of lack of users testing it.
>
> - On arm64, we have never supported non-SMP kernels, but I have
>   looked at possibly adding this because there are still popular
>   ARM based system-in-package products with less than 128MB of
>   built-in RAM and only a single CPU. As these are moving from
>   32-bit to 64-bit cores, it becomes more interesting to build
>   a 64-bit UP kernel and save multiple megabytes.
>
> I think loongarch64 is in the same place as arm64 and riscv64
> (which does allow non-SMP builds) here, and there are good
> reasons to allow it on all of them now, even if we previously
> never had a need for it.
OK, thanks. This means you agree to support non-SMP on LoongArch now,
then I will review this series carefully.

Huacai
>
> That said, both the 9% observed performance improvements that
> Tiezhu Yang reported, and the memory savings that I saw are
> probably higher than they should be, so we may also want to
> investigate that further to see if we can improve the SMP
> kernel to better support UP runs.
>
>     Arnd
>
