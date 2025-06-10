Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0965728B40E
	for <loongarch@lists.linux.dev>; Tue, 10 Jun 2025 09:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749547486; cv=none; b=o9dDS093vf5ht+VoM1aFsJZTV8QklChNCUbPE4fUSULXZgh0HmTViiLdlsUY0/e3xfQlYaTtBklGP4gN0R5gUGHYFZQDwlMJHXXITHNCUrYroApk0FjFpOl1VjzlIuNdsUA48oM9LTE3FoPvA/E/tJFwg7ba6Cb8X9eTXrXrNMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749547486; c=relaxed/simple;
	bh=7O8pLwMtFMpTYlcRgT7szr1Viv9rchg8SjS1xi2PCaw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d1F4h2PsBGxT4ircSMItm4pX1xu1t4oQQKYmOeU7Iqsh8v8XcnxSd98G2exKavITvvKToTRAPp5+ShZepRtmfQ4dnC0qs8qkrRR44bKHzAXfS7Fpk0T0Uv5fJX9Ezs0/k/yphx7d8AIcma+AL0mcdh/IZN4jwTSVgOljX69rIWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wl5crjUA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wl5crjUA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D899C4CEEF
	for <loongarch@lists.linux.dev>; Tue, 10 Jun 2025 09:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749547485;
	bh=7O8pLwMtFMpTYlcRgT7szr1Viv9rchg8SjS1xi2PCaw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Wl5crjUA0gjY5KSzbsAasQuZYkSzm9FB4lOTz4M+yAvPlYn44R3F+qZWntYPmDbdV
	 CysNgT/7etE/2GjQ6hWXEzka3qusaH9EVnMm14WCvk9wBT0RKBF+ao70xH4AMdRqDz
	 aRE7WW8M16ST7j3aNwXJGGHQjwqnS1OeDmQQ2j3Y7S5UQ9eQzpqxUFdonlqHWJIXJq
	 IfNHeOHs5ghP70rRDK1c2s5LFlS86KK7fzSEnVQZN7wqsMft0KOlCP9xXxdBVhYN6k
	 rdzFCJqDIbTBCmBxG1PH4nSPPNvalSpkBYkXR6MgR1phjPy/WVxVey7lzhyPfAvDuh
	 EdIHqoc/QG9lg==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-acbb85ce788so863399066b.3
        for <loongarch@lists.linux.dev>; Tue, 10 Jun 2025 02:24:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVG/44+KHsOAZS+VaIGmBnEHgJP27ydWLHCll1/3X6kVjfLSPVsk7FhLGOS/DAxHCNxxGWgcZUCvdc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxj48E6/QA2qlNXvvdVc4h/JKUxf9FSw4yrOWGuqlNci9SDDU6S
	b/qgeqUC4RRJdyPJWpu8UF3MRClVNREnrLNo+x6IW/hlLTwKIaQSljbPk/pBi5Il0hHzMyJx8It
	AZpKbwTWx2vEIFPc0HDe/3hTOrUnuVlM=
X-Google-Smtp-Source: AGHT+IHp9IrXPr6CUNbh1St5Hg3ial/rjt2FWdk+sYxhxJaYrSLty/M96Too05Y4+45YoU/INmTjI/uhZJoYsjtNpkM=
X-Received: by 2002:a17:906:ef0d:b0:aca:d4f6:440d with SMTP id
 a640c23a62f3a-ade7ac572a4mr171877866b.17.1749547483079; Tue, 10 Jun 2025
 02:24:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250422234830.2840784-1-superm1@kernel.org> <20250422234830.2840784-3-superm1@kernel.org>
 <CAMuHMdVPQLjOox5sMp34Z5MTwKv2WOpHa=MpZr8hWG22fQKcjw@mail.gmail.com>
In-Reply-To: <CAMuHMdVPQLjOox5sMp34Z5MTwKv2WOpHa=MpZr8hWG22fQKcjw@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 10 Jun 2025 17:24:31 +0800
X-Gmail-Original-Message-ID: <CAAhV-H70LXsDYMA7wz4x828rEFoJsNX0=m8F73Ge9=yfpzBpZQ@mail.gmail.com>
X-Gm-Features: AX0GCFvyd2N-spvgVUDQiEXjOROXJ4rt5ErLp4PE6STdQ0GN935XFU-Ao7ctaOk
Message-ID: <CAAhV-H70LXsDYMA7wz4x828rEFoJsNX0=m8F73Ge9=yfpzBpZQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] i2c: piix4: Depends on X86
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mario Limonciello <superm1@kernel.org>, Borislav Petkov <bp@alien8.de>, Jean Delvare <jdelvare@suse.com>, 
	Andi Shyti <andi.shyti@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Mario Limonciello <mario.limonciello@amd.com>, 
	Yazen Ghannam <yazen.ghannam@amd.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>, 
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Hans de Goede <hdegoede@redhat.com>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:I2C/SMBUS CONTROLLER DRIVERS FOR PC" <linux-i2c@vger.kernel.org>, 
	"open list:AMD PMC DRIVER" <platform-driver-x86@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	linux-mips@vger.kernel.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 5:16=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Mario,
>
> CC mips, loongarch
>
> On Wed, 23 Apr 2025 at 01:49, Mario Limonciello <superm1@kernel.org> wrot=
e:
> > From: Mario Limonciello <mario.limonciello@amd.com>
> >
> > PIIX4 and compatible controllers are only for X86. As some headers are
> > being moved into x86 specific headers PIIX4 won't compile on non-x86.
> >
> > Suggested-by: Ingo Molnar <mingo@kernel.org>
> > Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>
> Thanks for your patch, which is now commit 7e173eb82ae97175
> ("i2c: piix4: Make CONFIG_I2C_PIIX4 dependent on CONFIG_X86")
> in v6.16-rc1.
>
> > --- a/drivers/i2c/busses/Kconfig
> > +++ b/drivers/i2c/busses/Kconfig
> > @@ -200,7 +200,7 @@ config I2C_ISMT
> >
> >  config I2C_PIIX4
> >         tristate "Intel PIIX4 and compatible (ATI/AMD/Serverworks/Broad=
com/SMSC)"
> > -       depends on PCI && HAS_IOPORT
> > +       depends on PCI && HAS_IOPORT && X86
>
> Are you sure this south-bridge is not used on non-x86 platforms?
> It is enabled in several non-x86 defconfigs:
>
>     arch/loongarch/configs/loongson3_defconfig:CONFIG_I2C_PIIX4=3Dy
>     arch/mips/configs/ip27_defconfig:CONFIG_I2C_PIIX4=3Dm
>     arch/mips/configs/loongson2k_defconfig:CONFIG_I2C_PIIX4=3Dy
>     arch/mips/configs/loongson3_defconfig:CONFIG_I2C_PIIX4=3Dy
>
> The loongarch and loongson entries are probably bogus, but I wouldn't
> be surprised if the SGI Onyx and Origin do use Intel south-bridges.
Loongson can use AMD SB700/SB800 south bridges, which have I2C_PIIX4.

Huacai

>
> >         select I2C_SMBUS
> >         help
> >           If you say yes to this option, support will be included for t=
he Intel
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
>
