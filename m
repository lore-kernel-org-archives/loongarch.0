Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0818323A9BD
	for <loongarch@lists.linux.dev>; Wed, 19 Nov 2025 14:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763561626; cv=none; b=dlDVrY9jj8HrhR/oyOr7H4SHWwPBGZf0xbM3WsGh+HrH9ZrZnfEXjoZGm/mjaelWiv4IyxXo1zj1H2bRZsl9zCSOwZZKjaWwjtmcGpg3jHg3J7HHxGB7LbHDjUeuR0OJxxjGyAXcYovqiSsfsyfv22W5uAganwOpP5jN2Vavl/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763561626; c=relaxed/simple;
	bh=O5ALMS+79AgxoUnmTnm/aNB9JdSjZmIssnCqcNai018=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ij2RQ6/cf8gzYBwClk6cQd5kfnSiWGek7BdgYQR6qtWp55/MbdaefutT2HJrs4FhEaO2EB/r3R3nVPaMlbhTq46sXnZS//wu51rkaNGzUpcUEJsI6+1hEpdEJKasBajZggkkEjyfxTANVPqNuVZR0BtW+3LDYSlB5taaxJupNnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UFRfAF0H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UFRfAF0H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 611A0C4AF16
	for <loongarch@lists.linux.dev>; Wed, 19 Nov 2025 14:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763561625;
	bh=O5ALMS+79AgxoUnmTnm/aNB9JdSjZmIssnCqcNai018=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UFRfAF0HD5oHSZnEj7I7NaWy6/kLOhKNY4gfairFcQYMeanv35ANenkKoxc0iE1M7
	 van0wMgSd2o92pI1lsT0cOaSs8UpUxtwuwzQO7PvleKVAzD++YCUZm9X/TAMO5wnCR
	 wYrv1G+e4sFhsX5E8e3w2p4PcwGwInUjM/EdA3cKoJcpNLrJ7sBO2GC51a1FIDNQPE
	 LN3Y9wKagkGpt+zoUy91gFa417KZfnpEXAwr+0ZrHVL+DL9lcvYduiYEPZ2SfU0hH3
	 KVDAr1+av1/DURFkuLUOTefeQF3Er3/CmpYbqYro8V+3IFPMfOP7TyP0xEwpqFn+td
	 ZI0P5LBI0Xgyg==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b7277324204so941382966b.0
        for <loongarch@lists.linux.dev>; Wed, 19 Nov 2025 06:13:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUWqLbsa/GwaDdBl5Y6rhX9EsqB7HFA9QGP8CVSBx9upQT2H1NixSkpUIJ7wsR6Bz0Pj0o6nOpadSo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2Dc0nr3qnU8ELv78pXs5u+Ais2eRdlV0GN1VPdreNazn7SOFF
	SwU1pnhiVuceKC5kS/SD71Q3TPWSoMmHxOOZ3MlWGCur9qbouOclmroWmsf8oA3or83zz/6+VET
	984OsavhR/JK/R4ASEXS/0KQJJwRVqtQ=
X-Google-Smtp-Source: AGHT+IH+bjds08p8EIsdtrev3LqTK1AhZqRyYMUdtwinlfGrIemCkKBThdVJjU4oIMXrtUARdMzMx21jMZBm4Nx51CU=
X-Received: by 2002:a17:907:1c9d:b0:b73:3d1d:2249 with SMTP id
 a640c23a62f3a-b736786e8b6mr1981087066b.29.1763561622749; Wed, 19 Nov 2025
 06:13:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251118112728.571869-1-chenhuacai@loongson.cn>
 <20251118112728.571869-14-chenhuacai@loongson.cn> <debb8b35-8253-4422-a197-6d92e8d0c701@app.fastmail.com>
 <CAAhV-H7NU5z4bZDG3ZW+oHEp3jUE9_69g+zUXmT-+RcM07bOOw@mail.gmail.com> <a618d371-3489-4e7b-830b-bec843e117d5@app.fastmail.com>
In-Reply-To: <a618d371-3489-4e7b-830b-bec843e117d5@app.fastmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 19 Nov 2025 22:13:30 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4ZsZCUGhB5wSiHOH3KmUwYkSinLk3uUn2kTCj4+DoOyg@mail.gmail.com>
X-Gm-Features: AWmQ_bnAc-zoKcsXnq_LcNnlgzTiQlw6YW1car-PjdZB0ZH4LET9jPsTQYwmAdM
Message-ID: <CAAhV-H4ZsZCUGhB5wSiHOH3KmUwYkSinLk3uUn2kTCj4+DoOyg@mail.gmail.com>
Subject: Re: [PATCH V2 13/14] LoongArch: Adjust default config files for 32BIT/64BIT
To: Arnd Bergmann <arnd@arndb.de>
Cc: Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev, 
	Linux-Arch <linux-arch@vger.kernel.org>, Xuefeng Li <lixuefeng@loongson.cn>, 
	guoren <guoren@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 4:13=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Wed, Nov 19, 2025, at 09:01, Huacai Chen wrote:
> > On Tue, Nov 18, 2025 at 9:46=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> w=
rote:
> >>
> >> On Tue, Nov 18, 2025, at 12:27, Huacai Chen wrote:
> >> > Add loongson32_defconfig (for 32BIT) and rename loongson3_defconfig =
to
> >> > loongson64_defconfig (for 64BIT).
> >> >
> >> > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> >> > ---
> >> >  arch/loongarch/configs/loongson32_defconfig   | 1110 ++++++++++++++=
+++
> >> >  ...ongson3_defconfig =3D> loongson64_defconfig} |    0
> >>
> >> I would suggest using .config fragment here and only listing
> >> the differences in the defconfig files in there, rather than
> >> duplicating everything.
> >>
> >> > +CONFIG_DMI=3Dy
> >> > +CONFIG_EFI=3Dy
> >> > +CONFIG_SUSPEND=3Dy
> >> > +CONFIG_HIBERNATION=3Dy
> >> > +CONFIG_ACPI=3Dy
> >> > +CONFIG_ACPI_SPCR_TABLE=3Dy
> >> > +CONFIG_ACPI_TAD=3Dy
> >> > +CONFIG_ACPI_DOCK=3Dy
> >> > +CONFIG_ACPI_IPMI=3Dm
> >> > +CONFIG_ACPI_HOTPLUG_CPU=3Dy
> >> > +CONFIG_ACPI_PCI_SLOT=3Dy
> >> > +CONFIG_ACPI_HOTPLUG_MEMORY=3Dy
> >> > +CONFIG_ACPI_BGRT=3Dy
> >>
> >> You mention that loongarch32 uses ftb based boot,
> >> so ACPI should probably be disabled here.
> > I have tried my best, adding #ifdef CONFIG_ACPI all over the world but
> > still failed. :)
> >
> > LoongArch is deeply coupled with ACPI and can hardly disabled. On the
> > other hand, it is not forbidden to use ACPI for LoongArch32. So let's
> > keep it, and I will modify the description for LoongArch32 booting.
>
> Ok. You will probably want get back to it eventually, since the
> 32-bit port is likely intended for small-memory devices, and the
> ACPI code is fairly large.
>
> >> I would suggest turning off CONFIG_FB here (also on loongarch64).
> >> There is a replacement driver for FB_EFI in DRM now.
> > Do you mean simpledrm? It probably works but not always works. From
> > sysfb_init() we know it only mark EFIFB as a simpledrm device when
> > "compatible", so we still need FB_EFI as a fallback.
>
> I meant CONFIG_DRM_EFIDRM, which was added earlier this year.
> EFIDRM should work more reliably than SIMPLEDRM.
OK, I will disable FB_EFI and enable EFIDRM instead.

Huacai

>
>      Arnd
>
