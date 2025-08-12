Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D1C2D9EE3
	for <loongarch@lists.linux.dev>; Tue, 12 Aug 2025 01:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754963183; cv=none; b=KqcQ/gIsepZLxlpXPvh7bG9nUHQyMg1j3WYR2moeSXFrijVQjuBYpmixwrbyKftM6oTMTWioKfzsxNN3U3EBmTzKR4N0IVfI9v8g59d3M1CvsNurfrmZk0J2c8KoiHSntQWNPn3hXxgrnXzkC43/NMscxruwbWPUpwtb3CRSnqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754963183; c=relaxed/simple;
	bh=NgumnPkAJTRAFscuaIVCaroO0OwDgnOyT2oZmvnvPqM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LpT9XMyajxFkEtUmJvaoOqj+lCDkCjkgGd6+SUmRi37Zt0PrQGoc/gUk4X6bChqiZgI9X+0PrVh9Eo/LWMzRBCW+6EY2SkCU1cSopQMUqUWafGReSKbiw/p5mj8HqEc8T/uFMlZyciV7SMNuiy8HPUf0V6AqB/aNfON1A+1jUq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eCUQbA1O; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eCUQbA1O"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-afa15bc3651so165004866b.2
        for <loongarch@lists.linux.dev>; Mon, 11 Aug 2025 18:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754963180; x=1755567980; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WYaz1/uT9oyZjCyu9oVfjnYhAs3G+DnESiLkCTuz8Uc=;
        b=eCUQbA1O9PgpSjXddCyN3RW8T9f7P09yoePA0YQb1wdLrSjJTnu7n/wys1YY2PuA/i
         G87SQA7ggKzQiQxEQXUTxwsIZ5gPEKV+i2whydxujS07m2w/YpIWYPLilYYbAVqBfqB0
         APm7Ap6gzG9Rd3XWKRRsO0VWWItCtm+N0QoObURgeXNfkZYfpHFABXD2gYvFSwzz/XKr
         Hj/Z/smmYEtNzWokuvB0eL4I/gvo4LKcBx5Vj4GUDgv/xl2qQH49d9qlUOjt1tRjOP1i
         5gScBwJAFsIAFc3hyzPKSm8c8UdHTzKu1RVhnmgm93GCRZX1STtLIIB7RB5kdJWhKPEG
         wiPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754963180; x=1755567980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WYaz1/uT9oyZjCyu9oVfjnYhAs3G+DnESiLkCTuz8Uc=;
        b=BYSCC9P6HpZhQYj2Bu0Zwz+dGhXLeiipnIbc8FXgNJcAkAY+O/LdT9T9PulgZzukRY
         jdzE9EfsAzD32sYCvgTog+CLipaqwQCyl/HRgpF0N4Bo2G8hvr4W9FXJY9sOvrV3hiPy
         9JXP7vC3+4rPhhehbqBykL5/XJQtMBqZ6fS0pmlTHyaAJ8AG/qhdWfDa8Nn/KekF0gzD
         9dkBBpON6tVkvzZMquMoFc45ngirkBcGolDxuxFUMGGeUtuQntf3Vr/eqTqt2UBHBE1y
         kKCSMj0w1Tzi7ZjmXOqphPGU5Nz35ce0mYybQr3ea3cQYHWe9ggk/EMfRsofRjeBJIoB
         m7aA==
X-Forwarded-Encrypted: i=1; AJvYcCW+ZqInzzohgri4FXaBaQjxHyIDtLUyos5oipsW46Rdy1FxV5Nw/mBCSerC8DnM0MmpWuWgHqNMmo0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzNUbttVYVntsghPXk4TxKCrRXPGDUyvwmGHQdg9XSntDzygfrP
	KxFIw850IkFOVMa9BSjvO4xcJEhzuA9X6XBUb2PbJ9vNFiCxFFiKUdA0+NH7Yiepdkp96cwWi6b
	zFbbiT+5iVwWtrIfuksED7YfJ7ooIYfg=
X-Gm-Gg: ASbGncsm/WKzq986VtrP6j53yOImA5Ik4/K+8I68hyoXJmjTE4C1YrTzvPbsf8EI8jU
	S9oE7dbGptlysMFzdR/SUF9bsRSKwj/QzmkpCaosEMg5+mwMcZQFoO8wLnfdArY31dSm5qJr06I
	70owCpTc1ug4sDcCuF3Ln0HkHN82ogfCM7wg4FSufCb6ENAqqAdH6e+yfqy3d7tj7NmoorbFmAK
	/BReuU=
X-Google-Smtp-Source: AGHT+IGgBsPd0ik++HxOLBsaEV8zW5o8TFHwtEZ/G5uBZxwRtTAQ1Zhq97IMhlh4+r1CKAUkXGwVqxKI7eSRs6med2s=
X-Received: by 2002:a17:907:72c5:b0:ace:d710:a8d1 with SMTP id
 a640c23a62f3a-afa1e087ebdmr143285266b.24.1754963179717; Mon, 11 Aug 2025
 18:46:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1754890670.git.zhoubinbin@loongson.cn> <89732d64415077ecd9f74c5853c542e62c0dfe26.1754890670.git.zhoubinbin@loongson.cn>
 <aJox6R9eCZ5vSc7H@pie>
In-Reply-To: <aJox6R9eCZ5vSc7H@pie>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 12 Aug 2025 09:46:07 +0800
X-Gm-Features: Ac12FXz0ARLdniv0c7AvZGZa7aD_nYfFRofkgvyicNZC2-pOKF37F5dYWwU43vI
Message-ID: <CAMpQs4+3iAYWkDKf67=+0wXSgZmg+fC7p5kFst0fushpWscuaA@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] mtd: rawnand: loongson: Add Loongson-2K0500 NAND
 controller support
To: Yao Zi <ziyao@disroot.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, 
	loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

HI Yao:

Thanks for your reply.

On Tue, Aug 12, 2025 at 2:09=E2=80=AFAM Yao Zi <ziyao@disroot.org> wrote:
>
> On Mon, Aug 11, 2025 at 02:03:13PM +0800, Binbin Zhou wrote:
> > The Loongson-2K0500 NAND controller is similar to the Loongson-1C.
> >
> > It supports a maximum capacity of 16GB FLASH per chip with a maximum
> > page size of 8KB, and it supports up to 4 chip selects and 4 RDY
> > signals.
> >
> > Its DMA controller is defaulted to APBDMA0.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  drivers/mtd/nand/raw/Kconfig                  |  2 +-
> >  .../mtd/nand/raw/loongson-nand-controller.c   | 55 ++++++++++++++++++-
> >  2 files changed, 54 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfi=
g
> > index d9e3f13666ac..7b0c5d06aa95 100644
> > --- a/drivers/mtd/nand/raw/Kconfig
> > +++ b/drivers/mtd/nand/raw/Kconfig
> > @@ -464,7 +464,7 @@ config MTD_NAND_NUVOTON_MA35
> >
> >  config MTD_NAND_LOONGSON
> >       tristate "Loongson NAND controller"
> > -     depends on LOONGSON1_APB_DMA || COMPILE_TEST
> > +     depends on LOONGSON1_APB_DMA || LOONGSON2_APB_DMA || COMPILE_TEST
>
> Why is this dependency necessary? I think the DMA operations are done
> through DMAengine API, and thus the consumer decouples with the DMA
> provider. If so, I think the depends line should be removed, instead of
> extended.

This is an existing execution dependency. Although there is no
guarantee that it will work with other DMA engines in the future, only
this combination has been tested and proven to be correct at present.
Therefore, I would still like to retain this dependency.
>
> Regards,
> Yao Zi
>
> >       select REGMAP_MMIO
> >       help
> >         Enables support for NAND controller on Loongson family chips.


--=20
Thanks.
Binbin
