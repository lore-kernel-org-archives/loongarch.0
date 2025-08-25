Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD52C288C22
	for <loongarch@lists.linux.dev>; Mon, 25 Aug 2025 07:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756106512; cv=none; b=cyXQTH9XLhlyfwi1MPSaEJNMMcjlRLGYnq+AKmMaZKlNslqTJNSh8FBfpMYTVuQsGFJzFL1stolmlOuhPw1O/quP/naOUii7ej0DLyaz2HT/3qntnizlxwsmeGXkXxcoxHtbMdyTRK6z8krsZgLEZpQQzMVUN+LOOFMcyWfYZ2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756106512; c=relaxed/simple;
	bh=T3tR3MsRvYG/Mfp23/DZI4N+SKEPd3CGYAiv1eUDVCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cThb8iG4iRNC1hBymZ5KNuf12NSDCvaahVlKv16W1V10nCygCaZFtzydXJvKXHdxtOBvaUg2/dtQQx9sl8rluf2IlggSTnbnNXF5vEKkYV3Loa0Mz8Y6nn84Trfq/deNMLsyIheu9deMQgcIFJ2j2W9F8VuqRu7wdOHUtkq7mw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E1sYXyU7; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E1sYXyU7"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-61c51f57224so1312711a12.2
        for <loongarch@lists.linux.dev>; Mon, 25 Aug 2025 00:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756106509; x=1756711309; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c338oe4D3IXQr7k2LQ7ucjYxcOVnL88ce6NV0J74fN0=;
        b=E1sYXyU7QayG91J4XjLeyoOZNy/vkcwqAs8BSSz/mNSpqiBpN/RIaIzh4wf/yxMPv5
         GW5B95KoFNbYNJWZTPnFJKkqndd46nXGG2tyzt++q2GDKTxr4JaRSslgLAs9xzBMu5Rw
         Z6ns98e2QctMMYVynbJLAzNhPt5gFq7XebhY9S3HvLSMWyLkHLzzSoEY57gNz7qGbXw4
         Hon3o+IDIRUE4b8cJRKFWEvE/rtLVU5bVKLYgXYOYPEwKFIkhDmtYDQHsTg+pd/C4Tjr
         qj30soQSO8MxuJO/plCrtfNdUj5AYWbb1pvJAMw8IAKo2TwnSumyDmhX1+tl52atQqcf
         Cpog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756106509; x=1756711309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c338oe4D3IXQr7k2LQ7ucjYxcOVnL88ce6NV0J74fN0=;
        b=WPPPM9R64HLvpXM9FGmPU4ajJDEJpC5oHR7VjoK50Y1OvgH1crpr8nmvHIIPEUKAmO
         1lCN8tce0qwSFRXbSq+4PKo7YrFh1tw1NDSXhWAiHr3Aeeogj6a9F8txpAdcxFzuuI7s
         UJeuGz9jeDO6S9/HnrNStHvtc5qtCdR/41CXS4r7mhaVJ7Cy71ZLS4WQcMUjvPMGD+pn
         E8/+Iwq5CKoIlb8Cu1XZFeqiYBhWmKnG9MT4zZ9/mLQtEAqygGmzMOR7AWoq8N/NKVmh
         so6q4hPP3EYqBuigP85AxG46tp574b3Wuw2P5gdfvhke2ierI5qRokwJshXD5iIMalXn
         xO0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQrLi0vjU7gmEjbLfdsQC3j/tclAwUYTMPAy8xc/uYrtFcZLS24d8P1CXipCpMAmTJby9o99vDrc8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyU8fLPZ3RoGwNNLUt3wsL/Doo2tRLV+IvjgaHF2tDYIEBXaloj
	d28MQs0hSS1z0E5y7IgUYs3AKmMHMRay/sJgO7cPb39xV4ciLNebv0r4IIHQorAxjkMxy9v7l8H
	XLitLJDbOlpeukAsOwpjNcyUWyZXeopM=
X-Gm-Gg: ASbGncuVWsJimqGbvxllPkw99nj4NuQH43iD26/O1DpcpEvVYKFssWk2Us139D/b8un
	61gi/8JVuWpYaN3jk/gWdec4/MxuvWcO9mKe4Uwi8qZcFtKVgXtowHgHgy1JnXNziD3iUyKb+Sb
	2yB8fclkNfEvz/XvShPOm4MulvjPu09BRLQF1b2eOf2/XzwusSmmIsewaxKtsirSl/2Qcsy+U1l
	BpDoVH4AQ==
X-Google-Smtp-Source: AGHT+IFsZg/rfT8jBEVfO/j2TfkK77hlaw2k7PC6PtcovowbwFBbXWg5GD34jM5rh3lVFQ90FKR+JiQSdFX7OUYNbNo=
X-Received: by 2002:a05:6402:4310:b0:61c:7efd:acc7 with SMTP id
 4fb4d7f45d1cf-61c7efdb44emr109859a12.3.1756106508858; Mon, 25 Aug 2025
 00:21:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1755757841.git.zhoubinbin@loongson.cn> <589b4dfab9c1edd95fa05cba80ec58ea9ca099da.1755757841.git.zhoubinbin@loongson.cn>
 <87ms7olp0a.fsf@bootlin.com>
In-Reply-To: <87ms7olp0a.fsf@bootlin.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Mon, 25 Aug 2025 15:21:37 +0800
X-Gm-Features: Ac12FXzBj1tENuJWAe4kCtn9EXiaBxggZJaitpY5iMifdSsbaHz2HsF1buuz4Us
Message-ID: <CAMpQs4Lmswk8zmH-g54ey79shY5C0Da4e5gL4t5N5CzqMOL=pQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] mtd: rawnand: loongson: Add Loongson-2K0500 NAND
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

Thanks for your review.

On Sun, Aug 24, 2025 at 11:26=E2=80=AFPM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
>
> Hi Binbin,
>
> > +#define LOONGSON_NAND_64BIT_DMA              BIT(0)
> > +
> >  #define BITS_PER_WORD                        (4 * BITS_PER_BYTE)
> >
> >  struct loongson_nand_host;
> > @@ -83,6 +104,7 @@ struct loongson_nand_data {
> >       unsigned int hold_cycle;
> >       unsigned int wait_cycle;
> >       unsigned int nand_cs;
> > +     unsigned int flags;
>
> Can we turn this into a boolean instead and give it a DMA related name?
> I'm not sure the list of flags will extend rapidly...

Keguang has a different opinion on this part [1]. Since his reply
email and my V3 patchset email were sent at about the same time, I
plan to address these comments in the V4 patchset.

He found that the Loongson-1 series NAND controller also needs
dma_set_mask_and_coherent(), so we still need to explicitly set the
value of dma_bits.

Specifically:
The flags variable will be split into:
```
unsigned int dma_bits;
int (*dma_config)(struct device *dev);
```

[1]: https://lore.kernel.org/all/CAJhJPsW3KGL=3DFH5ZVqvRr-RD+ih09mFNuk7wGXe=
pGVSw7bTaiw@mail.gmail.com/
>
> >       void (*set_addr)(struct loongson_nand_host *host, struct loongson=
_nand_op *op);
> >  };
> >
> > @@ -745,7 +767,7 @@ static int loongson_nand_controller_init(struct loo=
ngson_nand_host *host)
> >       struct device *dev =3D host->dev;
> >       struct dma_chan *chan;
> >       struct dma_slave_config cfg =3D {};
> > -     int ret;
> > +     int ret, val;
> >
> >       host->regmap =3D devm_regmap_init_mmio(dev, host->reg_base, &loon=
gson_nand_regmap_config);
> >       if (IS_ERR(host->regmap))
> > @@ -755,6 +777,9 @@ static int loongson_nand_controller_init(struct loo=
ngson_nand_host *host)
> >               regmap_update_bits(host->regmap, LOONGSON_NAND_PARAM, hos=
t->data->id_cycle_field,
> >                                  host->data->max_id_cycle << __ffs(host=
->data->id_cycle_field));
> >
> > +     if (host->data->flags & LOONGSON_NAND_64BIT_DMA)
> > +             dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
> > +
> >       chan =3D dma_request_chan(dev, "rxtx");
> >       if (IS_ERR(chan))
> >               return dev_err_probe(dev, PTR_ERR(chan), "failed to reque=
st DMA channel\n");
> > @@ -770,7 +795,14 @@ static int loongson_nand_controller_init(struct lo=
ongson_nand_host *host)
> >
> >       init_completion(&host->dma_complete);
> >
> > -     return 0;
> > +     val =3D FIELD_PREP(LOONGSON_NAND_MAP_CS1_SEL, LOONGSON_NAND_CS_SE=
L1)
> > +         | FIELD_PREP(LOONGSON_NAND_MAP_RDY1_SEL, LOONGSON_NAND_CS_RDY=
1)
> > +         | FIELD_PREP(LOONGSON_NAND_MAP_CS2_SEL, LOONGSON_NAND_CS_SEL2=
)
> > +         | FIELD_PREP(LOONGSON_NAND_MAP_RDY2_SEL, LOONGSON_NAND_CS_RDY=
2)
> > +         | FIELD_PREP(LOONGSON_NAND_MAP_CS3_SEL, LOONGSON_NAND_CS_SEL3=
)
> > +         | FIELD_PREP(LOONGSON_NAND_MAP_RDY3_SEL, LOONGSON_NAND_CS_RDY=
3);
>
> Just a nit about the style, '|' should be last character on the previous
> line.

OK. I will do it.
>
> Otherwise the rest lgtm.
>
> Thanks,
> Miqu=C3=A8l

--=20
Thanks.
Binbin
