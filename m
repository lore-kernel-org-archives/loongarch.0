Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E0C21D3D2
	for <loongarch@lists.linux.dev>; Mon, 15 Jun 2026 01:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781485583; cv=pass; b=WDhGobdjoxRyIWjph82aKza1txYFDgphWE2VbxVCXVq6z7f01Ir4YPK5GGtD724YTS9Gy/j++RTlpU5WJek2L2KrZviU/HYstTI46/jEyOhDi+1gqHtJq8sQA20DGLq5YDW/7IAoEn/ktxrjLTHbioejd0Ky8Mn+1LVWNECfXX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781485583; c=relaxed/simple;
	bh=zphXDRrviMIHRqbaqKTjL0GVhrLRaF0ph7bVv07Mai8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VEkvcYEnM+qMFy01yD7vB4hXqOQ0J1eqdU2/pJ3BFj0U/CvvBMqzeNGYHIYXvgRkcHs2bNZCAOiy/Ngds9IDoitRNE460S/Q7OQyQ8gSbJ3bLsILdPZ5Wp9gOQwlzEaaOl9e1XmGiWpTajzMiFbfXQz6qI8HgKuDVxtFqYF80dM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gY4gb1Fb; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gY4gb1Fb"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-bf1141c26ecso323269466b.0
        for <loongarch@lists.linux.dev>; Sun, 14 Jun 2026 18:06:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781485579; cv=none;
        d=google.com; s=arc-20240605;
        b=HByP1uJJzU0fUYQv8nN8ZIXUxhHmnoL9fv5qpxd+qgJeg7Lo/C3QjOVOZL5D+z/sA1
         rYLB49EXdzIDPjBBwok30fFtMSkzCeG4ai4xi8iBvI18TYo2uW95qML8Ldz1n8hajitD
         5p9PAKJfbI4ZiK/vWDSMerSc1AdF49SED4WNgtuqjwSkh7N/pCjFfkEy3FcSKZEp9WWj
         VPtxZJfSlAM64pzw1FmzuFUBSh769TC9eJWKDEvG8ID63dHYaeZ41FIYe/hrUKErzCE3
         rCgKjqZGwmN1jJWQggi2t4gpyNwtYKUqS5wS7sEGV2qIp8zvE1eZAn4WyuHo1+Wuxo8x
         bSug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H24u8bJZ/ZfOEh7lec2yNJIYqcx3zwwTWvSipFSNjVs=;
        fh=I92b59mHZ/yIj2LaAVrWYqpoeCUgKrcsk6BLqfHIhDk=;
        b=hydnOhtpCWaMbl4BRQhENIobKOf+LdsLauBhBYcN6nBpQNAg58iIpZoK3vvJviQWkX
         OBUj5DT/gZKixZPGXkhP7v8pgmSBsUBbFnCLkVntrrz+0TW4FNsda07dDYvTrrKdRFYD
         ttfoACAnGEq6LVPsPJ4ozQg4Ui/JYY/Ak4YFYTciSDGxw/SVbgQvKo5AnXzIGe7+AN/h
         95T4FUS8ifew69M/Pf6LeAii3Jsi4RKJLIqeLrLFDjU2QxYxaX39OMcDSL+JsMDpEj9y
         eyAb5KSQp5DNMldWL70jIW4Fn0rNw6twCOW1EEmKJQzc1XfvZa7Q3fqbf0aBEmVhosIK
         iW8Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781485579; x=1782090379; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H24u8bJZ/ZfOEh7lec2yNJIYqcx3zwwTWvSipFSNjVs=;
        b=gY4gb1Fb+LXOxkL4kJ44e3Bbebf2kccREhsJVcveffT8f3g2GCcB6wi5Nit/5uJere
         Hkc6ArOl2NoywRqJ9s/qSEcmiVmNTFW/UeaXoiMeW/4xGMyvbunWk7YoA+f3Q6cq7286
         f8KFsVIbZRwpcELPdgt9lwZLwSNtjw3aglWA51pdqWIkzBGG5F2M+2DlWM/BdCyx2BJn
         D6FLKy4Ubzny0d1Gbdc/5MowUqTIhsEmHV+2BWVCZ+5/XEAQWqPmiRM7m0+R6r0Zzvw7
         xFeTDKsKPbTgAyq2R3a4RZ79o6/sH+gSKkLnPyrXAVVH4UDFDBKbLB3Wa1SJ1kRnqD2z
         VMkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781485579; x=1782090379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H24u8bJZ/ZfOEh7lec2yNJIYqcx3zwwTWvSipFSNjVs=;
        b=bBTkenfV8lMG4LLA16pcJ8scHzxRUiiWIOP3of/4wbTQ03IO6hCn4hKCGiGYWg8Hyd
         lVEmZugId7a5DSnkoway6u33GNoSFsqcQLTEr0fgXKNp5Mp0zRzMFVOqN7pSonvepeRG
         sMNnQF/rBaoA8zmTchHXU/2rCrk7sG+5QF7J4nB2hsZthTPNZGmAubLLYq19Z1f47OiW
         ZPib2NzCWO1+OIre79+WpiQgDlsogyisY8AT/uBac04BH7QzZv1RjQ7AAPFGa75UpM77
         vUDD3nJrgKNZLf2rrQsq5g2IboUgmTuZdR1Ev+XJOB5Xmj3qm8KxZVc29CkVIZmPCtjY
         SPyA==
X-Forwarded-Encrypted: i=1; AFNElJ+1qYnS4SrHGQYwhXXi0YnZfhykokHugNqZWT1WvIbLtI/kKhp/NEPLa7CerW+sUwWY6ojvk8dA8Jw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyzspk0UkkB1UUUClf9tnXL+2EQEZ/zuqBiZ+pc8cI5iZa+jAcu
	UHYcHctrneif9o4ruKbS+7eXbBkmdGy/TIyp/qBxbNdAPjNuO/1PiIWdlH5dT2YnZ/KGTsuNbD5
	SKq0H28Qca+07C3v4DoU0aoN5J1m2Xhs=
X-Gm-Gg: Acq92OGaBoAeh9dYPxfwBW97ICIhR1VMoLvssYwr24dxaipGrtK1uvACurcguHzl2Tf
	RShxa4aagPq35wu9DsTDyDGp+1FMif+MjkyOL20G9diXq/Du/XTaHMA56Duyci1NhBMVc/q7S8o
	YvMI6jWV3aZsyukl/5UiXoXNrMRuPjGoHDUhNYgV4q5cd6pL1RqtUp0uVbvHAC1DiWswlFTS3sn
	DDpAALDGsguM2KGRzuwfhcu5zGXCWtdN55ZhlAUGIOv0WlZxvoeEsMlOIsoe0P5H54zrfw0iBm2
	9sKyh/yb
X-Received: by 2002:a17:907:3f8d:b0:bed:2a8b:3e73 with SMTP id
 a640c23a62f3a-bff4cddd831mr396087866b.41.1781485578327; Sun, 14 Jun 2026
 18:06:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1780538113.git.zhoubinbin@loongson.cn> <4b003425d16a18049c5b90dbdaf91024e265cd8e.1780538113.git.zhoubinbin@loongson.cn>
 <CAAhV-H6G5vTH_58_pKvBnvjdr2eVTWTctUqmPAX3aMjsFDjsQg@mail.gmail.com>
In-Reply-To: <CAAhV-H6G5vTH_58_pKvBnvjdr2eVTWTctUqmPAX3aMjsFDjsQg@mail.gmail.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Mon, 15 Jun 2026 09:06:06 +0800
X-Gm-Features: AVVi8Cf_9hBVLVEZUBdAsB_xyIdfW7RJ29KV2A2IeNpvJzoDU304Ntu2KGk9gV8
Message-ID: <CAMpQs4LV_UcVwGYH1qP4VWKqCRT+EMyKOU6ygg7M76ymD29w9Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] ASoC: loongson: Add Loongson-2K0300 I2S controller support
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Xuerui Wang <kernel@xen0n.name>, 
	loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 13, 2026 at 11:18=E2=80=AFAM Huacai Chen <chenhuacai@kernel.org=
> wrote:
>
> Hi, Binbin,
>
> On Thu, Jun 4, 2026 at 10:11=E2=80=AFAM Binbin Zhou <zhoubinbin@loongson.=
cn> wrote:
> >
> > The Loongson-2K0300 I2S interface differs significantly from the
> > Loongson-2K1000. Although both utilize external DMA controllers, the
> > Loongson-2K0300 does not require additional registers for routing
> > configuration.
> >
> > Due to hardware design flaw, an extra controller reset sequence is
> > required during probe.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  sound/soc/loongson/loongson_i2s_plat.c | 42 +++++++++++++++++++++-----
> >  1 file changed, 35 insertions(+), 7 deletions(-)
> >
> > diff --git a/sound/soc/loongson/loongson_i2s_plat.c b/sound/soc/loongso=
n/loongson_i2s_plat.c
> > index ac054b6ce632..b4d807ee7f8f 100644
> > --- a/sound/soc/loongson/loongson_i2s_plat.c
> > +++ b/sound/soc/loongson/loongson_i2s_plat.c
> > @@ -2,7 +2,7 @@
> >  //
> >  // Loongson I2S controller master mode dirver(platform device)
> >  //
> > -// Copyright (C) 2023-2024 Loongson Technology Corporation Limited
> > +// Copyright (C) 2023-2026 Loongson Technology Corporation Limited
> >  //
> >  // Author: Yingkun Meng <mengyingkun@loongson.cn>
> >  //         Binbin Zhou <zhoubinbin@loongson.cn>
> > @@ -21,6 +21,7 @@
> >  #include "loongson_i2s.h"
> >  #include "loongson_dma.h"
> >
> > +/* Loongson-2K1000 APBDMA routing */
> >  #define LOONGSON_I2S_RX_DMA_OFFSET     21
> >  #define LOONGSON_I2S_TX_DMA_OFFSET     18
> >
> > @@ -30,6 +31,11 @@
> >  #define LOONGSON_DMA3_CONF     0x3
> >  #define LOONGSON_DMA4_CONF     0x4
> >
> > +struct loongson_i2s_plat_config {
> > +       int rev_id;
> > +       int (*i2s_dma_config)(struct platform_device *pdev);
> > +};
> > +
> >  static int loongson_i2s_apbdma_config(struct platform_device *pdev)
> >  {
> >         int val;
> > @@ -47,8 +53,18 @@ static int loongson_i2s_apbdma_config(struct platfor=
m_device *pdev)
> >         return 0;
> >  }
> >
> > +static struct loongson_i2s_plat_config ls2k1000_i2s_plat_config =3D {
> > +       .rev_id =3D 0,
> > +       .i2s_dma_config =3D loongson_i2s_apbdma_config,
> > +};
> > +
> > +static struct loongson_i2s_plat_config ls2k0300_i2s_plat_config =3D {
> > +       .rev_id =3D 1,
> > +};
> Put  ls2k0300_i2s_plat_config before ls2k1000_i2s_plat_config?

OK, I will do it in the next version.
>
> Huacai
>
> > +
> >  static int loongson_i2s_plat_probe(struct platform_device *pdev)
> >  {
> > +       const struct loongson_i2s_plat_config *plat_config;
> >         struct device *dev =3D &pdev->dev;
> >         struct loongson_i2s *i2s;
> >         struct resource *res;
> > @@ -59,12 +75,17 @@ static int loongson_i2s_plat_probe(struct platform_=
device *pdev)
> >         if (!i2s)
> >                 return -ENOMEM;
> >
> > -       ret =3D loongson_i2s_apbdma_config(pdev);
> > -       if (ret)
> > -               return ret;
> > +       plat_config =3D device_get_match_data(dev);
> > +       if (!plat_config)
> > +               return -EINVAL;
> >
> > -       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > -       i2s->reg_base =3D devm_ioremap_resource(&pdev->dev, res);
> > +       if (plat_config->i2s_dma_config) {
> > +               ret =3D plat_config->i2s_dma_config(pdev);
> > +               if (ret)
> > +                       return ret;
> > +       }
> > +
> > +       i2s->reg_base =3D devm_platform_get_and_ioremap_resource(pdev, =
0, &res);
> >         if (IS_ERR(i2s->reg_base))
> >                 return dev_err_probe(dev, PTR_ERR(i2s->reg_base),
> >                                      "devm_ioremap_resource failed\n");
> > @@ -87,11 +108,17 @@ static int loongson_i2s_plat_probe(struct platform=
_device *pdev)
> >         if (IS_ERR(i2s_clk))
> >                 return dev_err_probe(dev, PTR_ERR(i2s_clk), "clock prop=
erty invalid\n");
> >         i2s->clk_rate =3D clk_get_rate(i2s_clk);
> > +       i2s->rev_id =3D plat_config->rev_id;
> >
> >         dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
> >         dev_set_name(dev, LS_I2S_DRVNAME);
> >         dev_set_drvdata(dev, i2s);
> >
> > +       if (i2s->rev_id =3D=3D 1) {
> > +               regmap_update_bits(i2s->regmap, LS_I2S_CTRL, I2S_CTRL_R=
ESET, I2S_CTRL_RESET);
> > +               fsleep(200);
> > +       }
> > +
> >         ret =3D devm_snd_soc_register_component(dev, &loongson_i2s_edma=
_component,
> >                                               &loongson_i2s_dai, 1);
> >         if (ret)
> > @@ -102,7 +129,8 @@ static int loongson_i2s_plat_probe(struct platform_=
device *pdev)
> >  }
> >
> >  static const struct of_device_id loongson_i2s_ids[] =3D {
> > -       { .compatible =3D "loongson,ls2k1000-i2s" },
> > +       { .compatible =3D "loongson,ls2k0300-i2s", .data =3D &ls2k0300_=
i2s_plat_config },
> > +       { .compatible =3D "loongson,ls2k1000-i2s", .data =3D &ls2k1000_=
i2s_plat_config },
> >         { /* sentinel */ },
> >  };
> >  MODULE_DEVICE_TABLE(of, loongson_i2s_ids);
> > --
> > 2.52.0
> >
> >

--=20
Thanks.
Binbin
