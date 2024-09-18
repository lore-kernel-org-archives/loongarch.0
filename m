Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B688641C79;
	Wed, 18 Sep 2024 02:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726626414; cv=none; b=FSskMDCgGpqS63J1I24DTHTl5SCYfmCi0FaxDNmcHasQt/cm7n3oaJagy/a1w3GVCU11qHGeKy31jOTdU/P+rJ9e17f/DhdC4pCFx55WVpLzcYMxwPa7vEvYRsYMF2LQd3Gw9fLa0WoFT9pHI53/tPwVl60eO2auj1TNGtdKTRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726626414; c=relaxed/simple;
	bh=zHccpoxi6k4rCaf90hrPUWrqkjxWOnkOK309CcwZhEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bNej4/H6xYlAgr7dzgyWIqT3S5q4i3l2sE8AquteEfgjrHaZjzwprfRNWoiiosAyPz7GRz8RajQ2O37C+w40T4GyQRODfcRfo4Olg5OM5m269VlEfr48t7RRIfr7f0fLW2UFfhaxkt4gLOrWvrM2Sj4Q0iVyfg39R6GaJC9Rv1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aDEwFnJ+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aDEwFnJ+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27930C4CED1;
	Wed, 18 Sep 2024 02:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726626414;
	bh=zHccpoxi6k4rCaf90hrPUWrqkjxWOnkOK309CcwZhEc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aDEwFnJ+CBmnRkq0efo1uoM/5w8WPq8XhShZi8zzVS3l4J7/TYt6OUuKGqzEympMO
	 EXdc/Bqm8NzRkqPE62JloRoG69evhbRjzOMjD4HKnNkn7UxdJstSOhknwd0a1c47xl
	 edYHbmefS47ilUXnBTZaowr5aAC0RfcEGC3B4/eCdszr0tOFjGa+stIg22SRtIcQ6F
	 7GrAydc27cZzTOARgi8ySKX9n750voWIEP/MhugQpUJuTrLb+S5989+tvR1ywcI4ec
	 VQZCmUmE4njOGNcrpFVmxbyxzeHY+yvL9wucE+j0fzA7in5T4IFdyPvI3TmTDeh4hx
	 ApqVC9s5yT79w==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a8d64b27c45so817619566b.3;
        Tue, 17 Sep 2024 19:26:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVryODtsGHfHiDoEVegwXv6qdk4lJQuBUgeU7vbUvrDidAoptI0FXe7Cj4Y7T8LNz2PIEIO3+jrDvs=@lists.linux.dev, AJvYcCWzQblP/Q1paOvQ2+wrfmmCNC5JgQua0ZZmUu0A1PV6BkH2CujDLU7P/B5HD2+eRb6ybjAVod+Enh9vLafc6Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzTz5Ubs7sfQtfENjFTSh1MhzUWAmlsSPFdq1+OI8A9jupP3u/x
	Jm0zKa/DOa2N6EJ/2iyqniLvDGDOQhMFirSqpZVN94EZO8GDdXfYss5CBMxnTKeMVOlEUeFOErq
	nQJRFB4BQ0bPdsJj5m2vfKpDPtvM=
X-Google-Smtp-Source: AGHT+IHdH78oOHxe4W0yPL8blfmsq1Fswk5TE5U6eoGCMbCOPlWVAd6hKOZYEBwjJguzK50lsYiLmKhC5icAgnuVfY8=
X-Received: by 2002:a17:907:2d87:b0:a8d:7046:a1bd with SMTP id
 a640c23a62f3a-a9047d03d80mr1407013366b.28.1726626412527; Tue, 17 Sep 2024
 19:26:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240909133159.2024688-4-jvetter@kalrayinc.com>
 <202409101549.CyV0mJ2S-lkp@intel.com> <c78987ba-6b54-4433-b5dc-3b3b9f98354a@app.fastmail.com>
In-Reply-To: <c78987ba-6b54-4433-b5dc-3b3b9f98354a@app.fastmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 18 Sep 2024 10:26:41 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTaQugaXoUWEVgrJ_3i9z4tep05BF1wQ9QQifgqw5B+vQ@mail.gmail.com>
Message-ID: <CAJF2gTTaQugaXoUWEVgrJ_3i9z4tep05BF1wQ9QQifgqw5B+vQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] Use generic io memcpy functions on the csky architecture
To: Arnd Bergmann <arnd@arndb.de>
Cc: kernel test robot <lkp@intel.com>, Julian Vetter <jvetter@kalrayinc.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Andrew Morton <akpm@linux-foundation.org>, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, loongarch@lists.linux.dev, 
	Yann Sionneau <ysionneau@kalrayinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 10, 2024 at 5:16=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Tue, Sep 10, 2024, at 07:27, kernel test robot wrote:
>
> > 6a9bfa83709a84e Julian Vetter 2024-09-09  55          while (count >=3D
> > NATIVE_STORE_SIZE) {
> > 6a9bfa83709a84e Julian Vetter 2024-09-09  56                  if
> > (IS_ENABLED(CONFIG_64BIT))
> > 6a9bfa83709a84e Julian Vetter 2024-09-09 @57
> >                       __raw_writeq(get_unaligned((uintptr_t *)from), to=
);
> > 6a9bfa83709a84e Julian Vetter 2024-09-09  58                  else
>
> Right, this one actually has to be a preprocessor conditional
> because __raw_writeq is not defined.
All 32-bit ISAs didn't support __raw_writeq.

e.g.: include/asm-generic/io.h
#ifdef CONFIG_64BIT
#ifndef __raw_writeq
#define __raw_writeq __raw_writeq
static inline void __raw_writeq(u64 value, volatile void __iomem *addr)
{
        *(volatile u64 __force *)addr =3D value;
}
#endif
#endif /* CONFIG_64BIT */

e.g.: arch/riscv/include/asm/mmio.h
#ifdef CONFIG_64BIT
#define __raw_writeq __raw_writeq
static inline void __raw_writeq(u64 val, volatile void __iomem *addr)
{
        asm volatile("sd %0, 0(%1)" : : "r" (val), "r" (addr));
}
#endif

>
>      Arnd



--=20
Best Regards
 Guo Ren
