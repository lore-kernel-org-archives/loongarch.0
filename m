Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0638B22B8BD
	for <loongarch@lists.linux.dev>; Mon, 25 Aug 2025 07:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756106799; cv=none; b=oe84V1jC7o29gRVPG07BALS1jm8G2dv0ilVfLrN49zrN3jXblaDURqg5DPnoKbvBHWmrF7Q9aCW28Mz9MUjwXFtqZu9IY9+qZGGJpe9h/Lx6D4nUbNYFO/HJcPy7J2T6m9ATLxBrohdkQDjiWhm4W6EgwcGfVYrxgQ9GaRQ3Gyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756106799; c=relaxed/simple;
	bh=M6evD2Qxwqk81MjhmcOZIPv/5+wGW7wA97ZxmnU9KPA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sAFDDqyfU8da44by8LvmjAY0Lb/CwKbvsCqpsH73RmWSpc5H6BOX4zS4BH3Cnlpd5RAr5YMgK91lHsxlRSM0aBfgPefUzA0p5pLnf2aFeUupx7vH2dCbeJedB7fH6GauVZGHLxrv+NKCS6C9lnWLBibESWA6q5etVBROpPSmWTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I0JExFn5; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I0JExFn5"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-61c38da6a0bso2106205a12.1
        for <loongarch@lists.linux.dev>; Mon, 25 Aug 2025 00:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756106796; x=1756711596; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p0rXI81DHDPeimgUQGGujUCeB3VepV9XFgBCotb060w=;
        b=I0JExFn5u8ybrOAFuq7WKFEmihpEGCkZXY36FGAplLc1WQLGY3Gyh3FQ52NStLh9tK
         spygaR6/w/fw0ua8bEKP++L9Z2VXoL0roHRM0Pro8EfcvCohx2skLMA4ndErM+HcCmG6
         tOMY3GZYPg6ltQg3hk5k590tI8uJXcJ4d+iw0gp62iSuQHCetnnyLan19Hh3zpAjmqgf
         4m5pEvqIy5cYWdmLGqg/4i4H62BFzU8CGeTYn2e1SfxtkvmbMOpDbB9fOkIlvTarO/gv
         ZYWE+85lTRYTJWDrIux4qxNM6HV1cprygip2+u+43zdwrSPJlWo8upCvPnMsac3vuNA+
         WgKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756106796; x=1756711596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p0rXI81DHDPeimgUQGGujUCeB3VepV9XFgBCotb060w=;
        b=QBJhWYG6FDAi0D7mpcvHDQxh6xWudS3ZnGzT4T84cRqMIPoqsiwHZ9RIvaUS0i+85M
         bfs1Kfc1kaV9v/w7zZMpQTJf+yTVKPry64SKfClmjc7Uj+JOdJlG5BPaisSXriUIqrE/
         v88lNE2OcJmSqHM+ApDIK1g5DqGUcklzw7PXDJxaJ8/Ge4RlcSYvqSwylxfSlbY/dUU4
         S4Opsl6ocf6owtUmm7PbeCBuRZSce6Qm+k/A1X9lXN8B61fLHfzqLb3nB7wTNAwvMpAN
         AQ6QabfAeusURpXX2AxA7zCnC38OHpzlt55HKqbySqv9cvOMqd6GNpuX3Zlw5yHF0qo/
         9Iig==
X-Forwarded-Encrypted: i=1; AJvYcCUm82UBLqRVf07/A5YWt6sNZK5aPaYhGDaet4lVdcllV8QUvLws4nUmVxDaRzFWjXU2PONE/y+PUBc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/ETDzool4psnujOADwCrr60RSMyq9v/P4lcdC8UOx/4fKLAxr
	SGkg9xGodxcYAGe5syhIi1k7QknyMIN4WVgooVkviwf/i01J9FvwdA8sEVoC7Gf/fE/RwIdUny7
	CUlBynZ8zzRodDcrSBxNhkco52Y7kLkM=
X-Gm-Gg: ASbGncv3rzLD45YZk+KfhtJJsejveAzFXtw4Eudh4jjcy7aBiOr1X/MFNeDBJfhGLjp
	CnJUzZc4qFKimF75IIA4yZo0QpHmH1bJ1sBUBl7MUeaSsVPObet6esf6WPjzBMF0rRS5RVE6ye+
	gs6uzk8SO0JTmGekNZYQat+NorXi5my+06aPUW7z/8MZWNkjvbektAi+xmT/UOAw65uJWhbT7Rd
	HAKkq1/bz2Om08+1B+5
X-Google-Smtp-Source: AGHT+IEMMavT5lPcHDOmWN6D73yFcbhZ6LlVvdyIDZoFcQ0UkTHvd0fdnieclEyOSRj7wdZZ1vHKCxOSg4bVNUh2lp8=
X-Received: by 2002:a05:6402:40c9:b0:61c:73f2:4b3a with SMTP id
 4fb4d7f45d1cf-61c73f24d9amr999037a12.30.1756106796261; Mon, 25 Aug 2025
 00:26:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1755757841.git.zhoubinbin@loongson.cn> <f01986dcb9f16450bd7f38c8fd663df686e6d145.1755757841.git.zhoubinbin@loongson.cn>
 <875xeclodp.fsf@bootlin.com>
In-Reply-To: <875xeclodp.fsf@bootlin.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Mon, 25 Aug 2025 15:26:24 +0800
X-Gm-Features: Ac12FXyNgFXyJt4UvVNk5DenquiAD_QBeEewphZzs_VIgu82Xp2pbDEb2NAVMxo
Message-ID: <CAMpQs4JcuCVk6BxB66DrneUv6iw8rzYyLnZX6vrQYp41n+=-vw@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] mtd: rawnand: loongson: Add Loongson-2K1000 NAND
 controller support
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Miquel:

Thanks for your reply.

On Sun, Aug 24, 2025 at 11:40=E2=80=AFPM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
>
> On 21/08/2025 at 14:39:21 +08, Binbin Zhou <zhoubinbin@loongson.cn> wrote=
:
>
> > The Loongson-2K1000 NAND controller is also similar to the Loongson-1C.
> >
> > It supports a maximum capacity of 16GB FLASH per chip with a maximum
> > page size of 8KB, and it supports up to 4 chip selects and 4 RDY
> > signals.
> >
> > The key difference from the Loongson-2K0500 is that it requires explici=
t
> > configuration of the DMA control route. Typically, it is configured as
> > APBDMA0.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  .../mtd/nand/raw/loongson-nand-controller.c   | 48 +++++++++++++++++++
> >  1 file changed, 48 insertions(+)
> >
> > diff --git a/drivers/mtd/nand/raw/loongson-nand-controller.c b/drivers/=
mtd/nand/raw/loongson-nand-controller.c
> > index 7b331d0ca2f0..6610c239f721 100644
> > --- a/drivers/mtd/nand/raw/loongson-nand-controller.c
> > +++ b/drivers/mtd/nand/raw/loongson-nand-controller.c
> > @@ -73,9 +73,18 @@
> >  #define LOONGSON_NAND_READ_ID_TIMEOUT_US     5000
> >
> >  #define LOONGSON_NAND_64BIT_DMA              BIT(0)
> > +#define LOONGSON_NAND_DMA_CONFIG     BIT(1)
>
> You're reusing this flags member, so it's fine, please ignore the
> previous comment (except the style issue).
>
> ...
>
> > +     regs =3D devm_platform_ioremap_resource(pdev, 2);
>
> Would it be clearer to get the resource by name? (not a strong request)

It will be replaced by

devm_platform_ioremap_resource_byname(pdev, "dma-config");

>
> Thanks
> Miqu=C3=A8l


--=20
Thanks.
Binbin
