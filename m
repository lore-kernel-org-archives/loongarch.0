Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234D31F4E59
	for <loongarch@lists.linux.dev>; Mon, 11 Aug 2025 09:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754905332; cv=none; b=Jahf4fmNd366c+96J+/m8TDEhEQ3Rbtu61NSOpqtxMYdSsangNJXH3UhOpSCLeM5ZfAoigd2ux4m0oJJlwX1UGR/ozw6a4aVAzy+yx725vhl7Uql24XcrMu0QKDx0BofPq+hTCL/xEiFujeAI7VKFFy1GfxkRGn0FUMf65+HyWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754905332; c=relaxed/simple;
	bh=bQn73VP994WsQmFzruDcJSQYM7JUUIKmdAJBd4hj2hw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q4kb+VLQHoYvxz4f98q5350YNuRzEb8mGRnfsTY2nX/e0Pi94Dx8SOFYwX0Tpj8mTvKPorpS8vCkjRVYJsnzggNVCf94h0kVOndF7/qnysatTXEuvo8e9v6OS7zT/ex49hwWgykj23T8iqbjS/LT4zhjIq+BEeQkmKijWyxXiMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V+5POw95; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V+5POw95"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-af925cbd73aso796249866b.1
        for <loongarch@lists.linux.dev>; Mon, 11 Aug 2025 02:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754905329; x=1755510129; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2eSWrL25UEO0oq4z8A0vCEFN2VBnBSD043hswjtDD+k=;
        b=V+5POw95z1u2jllFQwteZJoqreilG1YYNfWXetS4TNOpqYR6qFT8nNxp3w75asKe74
         Rq+1DOqeo9VkO1XK6kTVEsqBONdnjt5RLuHSJmej1PP1jVmG6aqzsdGbkgq06Eret7A9
         lXu2P6xy9PaYwJCxvdO4acGM99baJd6CLL/kndP5yrXPOBqKu0FWLmM5rSQ8Ta0a7vGv
         9lpRoxuJGximVSYEjUo3zJH6gqRdB3DbY5C+oKy7QiQ7/xUpfY3J1rlMW600n9fc/8pC
         cozaWY0MB8Y2rEIExF+SUro2VIqKdZCc1W5UDFO/hXjxHcJa5Ap1N9W1luZgYsrcZHgx
         W8Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754905329; x=1755510129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2eSWrL25UEO0oq4z8A0vCEFN2VBnBSD043hswjtDD+k=;
        b=v+1bQOSxkgij80k+5G1Q3QPKdoIhh8XAMSsFsPlG0Q5zHP6uesCpzqPtvdo67/iVZj
         tYY7kCOsBsrBkA/a+sHKuRFfLLEFW8kTTTTFBfliE4sZZua5uADzIApvmGjHgYCXEniP
         VL0sH2kfGqCFxzkK3NP3Jmjn3QEOVa0u9Vd9a1237iJ8gl+H/ySV7wqkpmKX2d2sCLij
         POlt3CTs+JUcgzcPDZnhpitICd4esXFs0KSr6/0oekBP7KF1zASjaZM4Cei5YgqUHxTq
         oXyw26phzFdRIzx0XD0j0h0PlFPgOhj6pvLvDL092ZdAiA979Wb/YMRlv05o8IOkMcnH
         anyA==
X-Forwarded-Encrypted: i=1; AJvYcCUzKlgGx16fQfZLlzr7OQPezXjtPmuQ7+E5VG01myUKqx0cm1ey+F9vHgW/Dw9r/80T/BvS1xShxM0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxDHY88kxdpuKStHO00SmYaQdq11qeUR37EHqGRzhJqCcNMTzh3
	PljfRxMRKSdPHVzh9M1RSGXTFXetUnVZ15j0bAwdN9WdRdlhGGbEG+0K1LwbLpehGbpymbSK4j5
	T19JuveqZV6pGiegVZvw1JkkiFoP3OCU=
X-Gm-Gg: ASbGncuKzJtyxStY1xm+agEp3DohHUb3nXlyQkSFyEiSBQZfu0WEvk9MkAlYPIQszfF
	KYdpZG1YZoE45rMVBvqiNC1/qp3zX4I3Aw2OiT6lN6y3gKC4IXNc+tE4TnDGGsvRPa34Q4xGhNg
	jzovb6h4A61AYnkVW6vDtMy2G1SMbMAK1lR1WD/61XAJVX3CdNhGzV016cs6i/svccQI39qJQr8
	9Ra6IrBsXEDDyUhdQ==
X-Google-Smtp-Source: AGHT+IHcls6RaaffbrNGAViVuQNJYIu7Sso9LCbPDH5dKNFIoT9oDwwGZyVJjZrGCF03Z7k2KxEzSXyzLzzSvKKpCcg=
X-Received: by 2002:a17:907:7e8c:b0:af9:611d:8ce5 with SMTP id
 a640c23a62f3a-af9c6453507mr984161266b.22.1754905329373; Mon, 11 Aug 2025
 02:42:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1754890670.git.zhoubinbin@loongson.cn> <47545b7ed4943a088b27021a0fdbeaf56947e833.1754890670.git.zhoubinbin@loongson.cn>
 <CAAhV-H4h5qZ8gCjoKMKd8wBYG+secmTrHdo+AY1A60rmhKrCoQ@mail.gmail.com>
In-Reply-To: <CAAhV-H4h5qZ8gCjoKMKd8wBYG+secmTrHdo+AY1A60rmhKrCoQ@mail.gmail.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Mon, 11 Aug 2025 17:41:57 +0800
X-Gm-Features: Ac12FXxSxL_Lbj0YwFkPpje-NBjXsW-_dk1EgJ-IA4j8KD4zAgb88m_iR6tF7Vo
Message-ID: <CAMpQs4JgvCCxgNhmQ7XPHZ9HHohFW69vO7D6mpbBb3Q16u78ag@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] mtd: rawnand: loongson: Rename loongson1 to loongson
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Huacai:

Thanks for your reply.

On Mon, Aug 11, 2025 at 2:36=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> Hi, Binbin,
>
> On Mon, Aug 11, 2025 at 2:02=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.=
cn> wrote:
> >
> > The second step in preparing to add Loongson-2K support is to change th=
e
> > names of the driver files and Kconfig options from Loongson1-specific t=
o
> > Loongson-generic.
> Is it possible to merge the first two patches? If not, it is better to
> use loongson1 rather than loongson in the subject line of this patch.

At first, I thought that separating the renaming of file prefixes from
the renaming of file names would make the changes clearer. Another
point is whether renaming Kconfig items would be considered API
breaking, even though no one is currently referencing them?

Of course, if anyone thinks that separating them is unnecessary, I
will merge them in the next version.
>
> Huacai
>
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  MAINTAINERS                                                 | 2 +-
> >  drivers/mtd/nand/raw/Kconfig                                | 6 +++---
> >  drivers/mtd/nand/raw/Makefile                               | 2 +-
> >  ...ongson1-nand-controller.c =3D> loongson-nand-controller.c} | 0
> >  4 files changed, 5 insertions(+), 5 deletions(-)
> >  rename drivers/mtd/nand/raw/{loongson1-nand-controller.c =3D> loongson=
-nand-controller.c} (100%)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 4bac4ea21b64..cc502582c9f1 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -16722,7 +16722,7 @@ F:      Documentation/devicetree/bindings/*/loo=
ngson,ls1*.yaml
> >  F:     arch/mips/include/asm/mach-loongson32/
> >  F:     arch/mips/loongson32/
> >  F:     drivers/*/*loongson1*
> > -F:     drivers/mtd/nand/raw/loongson1-nand-controller.c
> > +F:     drivers/mtd/nand/raw/loongson-nand-controller.c
> >  F:     drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
> >  F:     sound/soc/loongson/loongson1_ac97.c
> >
> > diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfi=
g
> > index 4b99d9c422c3..d9e3f13666ac 100644
> > --- a/drivers/mtd/nand/raw/Kconfig
> > +++ b/drivers/mtd/nand/raw/Kconfig
> > @@ -462,12 +462,12 @@ config MTD_NAND_NUVOTON_MA35
> >           Enables support for the NAND controller found on
> >           the Nuvoton MA35 series SoCs.
> >
> > -config MTD_NAND_LOONGSON1
> > -       tristate "Loongson1 NAND controller"
> > +config MTD_NAND_LOONGSON
> > +       tristate "Loongson NAND controller"
> >         depends on LOONGSON1_APB_DMA || COMPILE_TEST
> >         select REGMAP_MMIO
> >         help
> > -         Enables support for NAND controller on Loongson1 SoCs.
> > +         Enables support for NAND controller on Loongson family chips.
> >
> >  comment "Misc"
> >
> > diff --git a/drivers/mtd/nand/raw/Makefile b/drivers/mtd/nand/raw/Makef=
ile
> > index 711d043ad4f8..c182b9703a9e 100644
> > --- a/drivers/mtd/nand/raw/Makefile
> > +++ b/drivers/mtd/nand/raw/Makefile
> > @@ -59,7 +59,7 @@ obj-$(CONFIG_MTD_NAND_ROCKCHIP)               +=3D ro=
ckchip-nand-controller.o
> >  obj-$(CONFIG_MTD_NAND_PL35X)           +=3D pl35x-nand-controller.o
> >  obj-$(CONFIG_MTD_NAND_RENESAS)         +=3D renesas-nand-controller.o
> >  obj-$(CONFIG_MTD_NAND_NUVOTON_MA35)    +=3D nuvoton-ma35d1-nand-contro=
ller.o
> > -obj-$(CONFIG_MTD_NAND_LOONGSON1)       +=3D loongson1-nand-controller.=
o
> > +obj-$(CONFIG_MTD_NAND_LOONGSON)                +=3D loongson-nand-cont=
roller.o
> >
> >  nand-objs :=3D nand_base.o nand_legacy.o nand_bbt.o nand_timings.o nan=
d_ids.o
> >  nand-objs +=3D nand_onfi.o
> > diff --git a/drivers/mtd/nand/raw/loongson1-nand-controller.c b/drivers=
/mtd/nand/raw/loongson-nand-controller.c
> > similarity index 100%
> > rename from drivers/mtd/nand/raw/loongson1-nand-controller.c
> > rename to drivers/mtd/nand/raw/loongson-nand-controller.c
> > --
> > 2.47.3
> >
> >

--
Thanks.
Binbin
