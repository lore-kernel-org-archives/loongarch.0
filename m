Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6238E8F44
	for <loongarch@lists.linux.dev>; Sun, 23 Jun 2024 02:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719111358; cv=none; b=W3zsDKp5SEvhGuA0LzdeCvLIUBwNIY4rh/1a5YHYb8kgNcQORj+81MQVbvtuDdgz7Y2PLg94IWq//UXjXNCHfrANqSTM9G3gn0FcAJGiyTy4yhiftznEpHfcJWTfY+qYDzz6lJT3HTHlwSBuEYzppvJLAlFLJRF8MpIrKE2NFho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719111358; c=relaxed/simple;
	bh=kk0dfKY/ENx9zMKY0Wwe7kBZPbykdaRiDaEX5FNLjfw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YAR0HCYupK2ZYllpJR/868/4KXIh2gtqnFipp3cWtd99ONwvpuu0DI56DXJsoo7zi8rXZGTkK/zPUV+uXapNKvMudiVyaA1VecCgowetL7qbUtB/hDF2TXrV7olaEfupIh6iJAFg6NJouQ6SeXmACTK//vMbB8OrtvlTMAESC5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l1j5dpeZ; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l1j5dpeZ"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a724cd0e9c2so2738966b.3
        for <loongarch@lists.linux.dev>; Sat, 22 Jun 2024 19:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719111356; x=1719716156; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+dNGdqvPyMhPucHTr5/gO5LwLxeQdkY1pTtydDZXYM=;
        b=l1j5dpeZtuBzDY9R+ZAmUizUK60oQhT6x0LIeZ/WWslBW71LNFLNw+5f8YQPu5gtki
         fgpsgurcWahmAV0xQITJuiJDdLZhrMXMp7LNuM56+nrJfFVf+PBk7jh72WEkXmUy2C6w
         gvlVWcjljNcvt18NUWqCxZNkvShar69pvmE69u9fevHag74jsL64dZ4VBb4pykGjkioc
         UJT9+j/Obt95DCiNiRpaFLuW3WiN8XHCdTY34tRfpT+7CJrm1xxFDN/SSWO8MNOy81Xn
         nFzAMxPNz6X9W6vLDkbu2OV7eWEjkdTBRLQis6h8rCCKOBvZW8uivJbvjd4emEHAfT2A
         gt2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719111356; x=1719716156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d+dNGdqvPyMhPucHTr5/gO5LwLxeQdkY1pTtydDZXYM=;
        b=ZIM1lDG6iYY7/7ZYlUW6BmV87k4TKd3xPchH6mCVi7SKzbe2LnMscUFlncwxtM0Sdo
         jyNY2pn+gEfizeCvg5PE68dC9EwVgFN41nYPzBNHwr9vAwQemsrAsNq8A4smcLKIflx8
         8sBcJ51WhWWB5fJ+muDShSFnRGF3l6CVUKVQAvr72thcwWJeK4Tv9OwhGp+VxjsgykdR
         qz5iyZVgNkzENJ3/F2HUTs23W7u1nXqUsMYfS1mLX/26ICZS1c3CUKFckdBF9jL8RhrV
         TyCpmM6doM6Ror4ofxtuepLswba8NdT2EuKM31iVpH4CogPuRZokop4EV+VwUHMeWIGs
         X6zQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPmmNIuCk+dVLmLpKjitqhAtOFqoj93MjUcXSbzG0vSpEAqcwdVsTtrNJNJdBFczjuGzT4GozJHkGN26spzN9+z3ZXMeFqGFQL
X-Gm-Message-State: AOJu0YzzgZl5upM509Dch26DqmNTxrrq/hcKcjlwRLLN7HQFoZ6M/iQC
	wdG+4y6Q+MMqP6CrgeN8BvVuwAN79r0lbzi/c1wQLBexoI467AeMsk0rbQipaCzu7Ou5FHDqWUF
	cEaJLXAI66qKjdYZMVmH/tl0NFjg=
X-Google-Smtp-Source: AGHT+IEKf/HkETPEeYzE1trwKs/NC1T9SkiEZfGUqAoH7CdTHB7ab/SUVkf5pHuQJagpNs0bWjagrPmp2+e8SiSEWys=
X-Received: by 2002:a17:907:168b:b0:a66:c338:65cc with SMTP id
 a640c23a62f3a-a7245b8f006mr63395366b.19.1719111355198; Sat, 22 Jun 2024
 19:55:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240620020625.3851354-1-chenhuacai@loongson.cn>
 <87msnem3i1.ffs@tglx> <CAAhV-H5TNnf+EMEtKmXk+Q9KXSZpW+9vd-7qqXDifsKfny+v=g@mail.gmail.com>
 <87pls9z3g0.ffs@tglx> <CAAhV-H7noyrYJzyVML8y1gHPiB6qZzXy7j5L_AqjxwLZW2J06A@mail.gmail.com>
 <87jzigznai.ffs@tglx>
In-Reply-To: <87jzigznai.ffs@tglx>
From: Huacai Chen <chenhuacai@gmail.com>
Date: Sun, 23 Jun 2024 10:55:43 +0800
Message-ID: <CAAhV-H6u-5EHATP3O=23SM7mMw3-xqOwn22YE4vWtj=GFELC+A@mail.gmail.com>
Subject: Re: [PATCH V2] irqchip/loongson-eiointc: Use early_cpu_to_node()
 instead of cpu_to_node()
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Thomas,

On Sun, Jun 23, 2024 at 5:21=E2=80=AFAM Thomas Gleixner <tglx@linutronix.de=
> wrote:
>
> Huacai!
>
> On Sat, Jun 22 2024 at 19:23, Huacai Chen wrote:
> > On Sat, Jun 22, 2024 at 6:17=E2=80=AFPM Thomas Gleixner <tglx@linutroni=
x.de> wrote:
> >> That does not make sense because it's exactly the same situation when
> >> you compile a kernel with NR_CPU=3D8 and boot it on a system with 16
> >> CPUs. Then early_cpu_to_node() does not give you anything either.
> >>
> >> So what's the technical problem you are trying to solve?
> >
> > Frankly, there are some drawbacks on our hardware. On a dual-bridge
> > machine, there are two eiointc instances. Even if nr_cpus limits the
> > "possible" CPUs, we still hope the eiointc driver can initialize
> > correctly, otherwise the machine cannot boot.
>
> Hope does not help with technical limitations :)
>
> So if CONFIG_NR_CPUS is not big enough to map the second node, then the
> machine can't boot.
>
> If nr_cpus limits it then early_cpu_to_node() because that mapping is
> only limited by CONFIG_NR_CPUS.
Yes, if NR_CPUS is not big enough, then we have no solution.

>
> Right?
>
> If so, then please explain all of this properly in the change log.
OK, I will explain in detail.

Huacai

>
> Thanks,
>
>         tglx
>
>
