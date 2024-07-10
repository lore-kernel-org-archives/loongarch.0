Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5D4192484
	for <loongarch@lists.linux.dev>; Wed, 10 Jul 2024 13:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720616402; cv=none; b=obwQLRZTWZerQfQeA5FI2WBDsdL2B6CzMX3sR70kqhPSRzLQFynmbjiK7QosARYhzQtAswGOuLPyO+Bquc9x5T8SV7n/9Z64OBwQySjv9hySSpQ37EyiUtUil1TBk0kpxPb9RBd/or69X4ur45hFMiSj6U/t5PjPxlnJ1uTyLMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720616402; c=relaxed/simple;
	bh=+q8K+JhEmrQnBJLkJsy7lFA+cisrhXhsBdLSScjyYmY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MjjPwgkWtx7qJix11JBlV4SqWwF30koZVl0bimoLrpcagHDN6Uj7cpHSImwPjCyfP9aDniPXrtk+ubacN2i1UESBs4kfhbRE8QC36d+v00wNHNhu6MR9yHND1v0BV6FenqmN7x7URTjGT+jLDVtp4c/WqSoJJHq2V428eY7k8Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=WQjDZEqP; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="WQjDZEqP"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ee910d6a8bso56781571fa.0
        for <loongarch@lists.linux.dev>; Wed, 10 Jul 2024 06:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720616398; x=1721221198; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGdJpvqIEQU8RX9NGwZGOHnsVHJRF022GnfIot2nots=;
        b=WQjDZEqPBx+zUQ/ke4tnSL8YiVb//QwQnydQxAaH73l9SIQ7BZtcPTilRVrQv+80l+
         bwVph0dKonaWrcDMlGKucgpjFiDiH3E0tMe9Fj1WFSVmLj5Qyc3FdxtPaRjGR5GxDc3C
         t3oWLErAca1wKtpFbu3uk7Ga8QHSGhQ5QRPH54hpPRWR9RwcqFqMqEEZJ2Q7ObzF2LKB
         IYdQiIfPCWnwqG4O0l/2RiqkdrEocpLFxWJtGtwJ8vdRWIkPQqsgMkhb8Rz1N0js6w8N
         p1ArAAvls8XQ7f8VXpdottXIkW8mYuaR9sBe8VhKk0ylAAveCc65syB0VJUXOPt1hovN
         +1xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720616398; x=1721221198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VGdJpvqIEQU8RX9NGwZGOHnsVHJRF022GnfIot2nots=;
        b=Ps2pg3G1wU2I6UncYGVfDCOAEfgAs5S5wWmbIkGX76Xk3GpLsAa3SX44ss6+mOJ1zB
         nsmP6c/+ke9x12cF+u0k/z5lq9GY6v8ynpSJP+CGq439BamrxlU7VbO0QK69U5XsTliF
         E25HfpIHQCsCnJSMxEkv/etkqDj9jfHuLoxzeVI9w9gTmZ4wBxGvCSlegdYdbzT8dKWA
         TSiAXzGZt2nfn7W9F2b8IoJMGEglAx2s3K/sBDyBNlXAY+c//C2yUUxM9UWPpc9Kh7l/
         l7jLbAOH6dDIjgpgF3aupNrDYuT+u4tUcugu6clGi2Hl7S4wrGGi+6sBz9Rv6n7C4p7U
         kKVw==
X-Forwarded-Encrypted: i=1; AJvYcCVwVpzyjPbfn9qIkGhySKTBt1p/0BZ9jYFM+0vvnrK6ID7k/9JEOwJENqg9wUXqaTXq252Tz4t20Wm4Lu55N9h6DsdCdH3ezj8j
X-Gm-Message-State: AOJu0Yw47+DJL7PxakKqdvH7qiKPvjDQ84CGp/UEllEUeKzjLiaJJH43
	seNBDEt6g9zfONPGAwyCnB0fFHk4G+JTbWSymvlLKe/1dkz4GCruKB7qrZj4tkZK3WcsPevfI/L
	ppnMy/qCdZyqCsYaPxgi9dqSNdO1xr3HJEjFYsA==
X-Google-Smtp-Source: AGHT+IH/j0tB3q6Oob0h+dYBea8dzUqqOODjZONtdFvf3j/P6dPoyQJkhUenc2mYLdwUqlwO12I2J5bpi1srvsWqmLs=
X-Received: by 2002:a2e:b046:0:b0:2ee:83f7:8b32 with SMTP id
 38308e7fff4ca-2eeb30dc45amr34980521fa.21.1720616398404; Wed, 10 Jul 2024
 05:59:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
 <20240701-b4-v6-10-topic-usbc-tcpci-v1-5-3fd5f4a193cc@pengutronix.de> <27cf3056-5c7b-4759-b03a-1fa9b785611e@app.fastmail.com>
In-Reply-To: <27cf3056-5c7b-4759-b03a-1fa9b785611e@app.fastmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Jul 2024 14:59:47 +0200
Message-ID: <CAMRc=McvRLeCTTXgC_OD5z5OAxQ0pZ46dTKP8XO+T-LkXKgRfQ@mail.gmail.com>
Subject: Re: [PATCH 5/9] ARM: defconfig: convert to MTD_EEPROM_AT24
To: Arnd Bergmann <arnd@arndb.de>
Cc: Marco Felsch <m.felsch@pengutronix.de>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Russell King <linux@armlinux.org.uk>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jon Hunter <jonathanh@nvidia.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	imx@lists.linux.dev, Linux-OMAP <linux-omap@vger.kernel.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, linux-tegra@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linuxppc-dev@lists.ozlabs.org, 
	linux-mips@vger.kernel.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2024 at 2:49=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Mon, Jul 1, 2024, at 15:53, Marco Felsch wrote:
> > The EEPROM_AT24 Kconfig symbol is marked as deprecated. Make use of the
> > new Kconfig symbol to select the I2C EEPROM driver support.
> >
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  arch/arm/configs/aspeed_g4_defconfig   | 2 +-
> >  arch/arm/configs/aspeed_g5_defconfig   | 2 +-
> >  arch/arm/configs/at91_dt_defconfig     | 2 +-
> >  arch/arm/configs/axm55xx_defconfig     | 2 +-
> >  arch/arm/configs/davinci_all_defconfig | 2 +-
> >  arch/arm/configs/imx_v4_v5_defconfig   | 2 +-
> >  arch/arm/configs/imx_v6_v7_defconfig   | 2 +-
> >  arch/arm/configs/ixp4xx_defconfig      | 2 +-
> >  arch/arm/configs/keystone_defconfig    | 2 +-
> >  arch/arm/configs/lpc18xx_defconfig     | 2 +-
>
> Applied to soc/defconfig, thanks
>
>    Arnd

No! Why? This is still being discussed and it's not clear it will even
make it upstream.

Bart
