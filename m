Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1963D14AD20
	for <loongarch@lists.linux.dev>; Sat, 13 Jun 2026 03:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781320733; cv=none; b=OJxSSR1XFluGbGhDV3r/UWdcya/PvFczMee+CzGSP46tbk2isJtoJvCbpZx4wPfUK0/XQjtQGc+jYBJLcIQ8fReQEh0hixoYyP7IROINzfUl5jml9QTpdxSvzRFmMEgNbLkruHwMB2ENqmDecAIRdI5tYpscD7XZXiX71wGiWHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781320733; c=relaxed/simple;
	bh=r7l7aVxzs7O7Xak4jlTzUDCoTDD1I+eiZfAJ2L6+r4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R0ejV0lXdHT9PRWFeoiaGNAB8mdVDRyRyP7Wr+RY5P5b2nKiKqGHdLXhJZY/+VhjwQKy48A3npEYVofCUzfTvMOePayC+yJDJJ9meieWWY3vg3EWKU0EqzP8e64kXdnjIMlq7JWINZo4EeAxBDfVhU0zv7GTk+uyCf/jd9MklMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=inm/cKV8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="inm/cKV8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C459E1F00ADF
	for <loongarch@lists.linux.dev>; Sat, 13 Jun 2026 03:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781320730;
	bh=6hjksSQeC+ZsIoDOrxEQzgZgTjPJ+cv9dignez6UBwA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=inm/cKV8um/B4u8UFL6Y3YMdTyrWhrN868DReIZ40B4hAX/Cfi5eWy6hRps1BQT5N
	 ZmXSrX/LGzxwOavX0Z0wWMRJJtAgObh7gAQxEPr+pdvV7rX/5S05uLVuNBtrdWZJQW
	 C1twVIjxgfPWZL0w5RzwIy49/U51uC/4zhBgtO4pFVBfTLam6rXOUkJlNchLVy9z2d
	 vas4IAi4304PiTBux7H+69KSLwqif2JDeMMRGl6NoDJxxaqQE8HlPZcuZlcqeffZ1D
	 MGBFqX8xhfeV0/YQYDL3LO+gqD96f6eF2L1LqLzMQSfGPkFwEBLcU4/yCXbxL3gYko
	 Mzz6tU5lg1K/A==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-68c19f1f3ceso2505129a12.2
        for <loongarch@lists.linux.dev>; Fri, 12 Jun 2026 20:18:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+tHteF0B/aZx6yX6fLi9lru1xuS6qiav7bpz14M0QFVzXrvbiYRaIAm1NULhhTc1kpzna5OZMuVso=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywe5B/7xt8n6zBX6/wnmZK8BHjNfRHlrhTmxqvWguHsNqlk1kN0
	SSqI0J9Thq0h+GLk1acKSrYsuJRhuZwtrUFLoovd+Vtazm0ZGRVh7zW0TZ+aFxpjAou9wE0rLi0
	mfXHamAzTF6x4ULdYi9KInc/SLmiAuH8=
X-Received: by 2002:a05:6402:3607:b0:691:956a:cf6a with SMTP id
 4fb4d7f45d1cf-693785fed15mr2365486a12.12.1781320729386; Fri, 12 Jun 2026
 20:18:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1780538113.git.zhoubinbin@loongson.cn> <4b003425d16a18049c5b90dbdaf91024e265cd8e.1780538113.git.zhoubinbin@loongson.cn>
In-Reply-To: <4b003425d16a18049c5b90dbdaf91024e265cd8e.1780538113.git.zhoubinbin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 13 Jun 2026 11:18:42 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6G5vTH_58_pKvBnvjdr2eVTWTctUqmPAX3aMjsFDjsQg@mail.gmail.com>
X-Gm-Features: AVVi8CfzQWj-D-TJJvfg08UU4k6shbbVHcLWFkeYPG8y4sewERe1-KnaBYwPigg
Message-ID: <CAAhV-H6G5vTH_58_pKvBnvjdr2eVTWTctUqmPAX3aMjsFDjsQg@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] ASoC: loongson: Add Loongson-2K0300 I2S controller support
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Xuerui Wang <kernel@xen0n.name>, 
	loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Binbin,

On Thu, Jun 4, 2026 at 10:11=E2=80=AFAM Binbin Zhou <zhoubinbin@loongson.cn=
> wrote:
>
> The Loongson-2K0300 I2S interface differs significantly from the
> Loongson-2K1000. Although both utilize external DMA controllers, the
> Loongson-2K0300 does not require additional registers for routing
> configuration.
>
> Due to hardware design flaw, an extra controller reset sequence is
> required during probe.
>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  sound/soc/loongson/loongson_i2s_plat.c | 42 +++++++++++++++++++++-----
>  1 file changed, 35 insertions(+), 7 deletions(-)
>
> diff --git a/sound/soc/loongson/loongson_i2s_plat.c b/sound/soc/loongson/=
loongson_i2s_plat.c
> index ac054b6ce632..b4d807ee7f8f 100644
> --- a/sound/soc/loongson/loongson_i2s_plat.c
> +++ b/sound/soc/loongson/loongson_i2s_plat.c
> @@ -2,7 +2,7 @@
>  //
>  // Loongson I2S controller master mode dirver(platform device)
>  //
> -// Copyright (C) 2023-2024 Loongson Technology Corporation Limited
> +// Copyright (C) 2023-2026 Loongson Technology Corporation Limited
>  //
>  // Author: Yingkun Meng <mengyingkun@loongson.cn>
>  //         Binbin Zhou <zhoubinbin@loongson.cn>
> @@ -21,6 +21,7 @@
>  #include "loongson_i2s.h"
>  #include "loongson_dma.h"
>
> +/* Loongson-2K1000 APBDMA routing */
>  #define LOONGSON_I2S_RX_DMA_OFFSET     21
>  #define LOONGSON_I2S_TX_DMA_OFFSET     18
>
> @@ -30,6 +31,11 @@
>  #define LOONGSON_DMA3_CONF     0x3
>  #define LOONGSON_DMA4_CONF     0x4
>
> +struct loongson_i2s_plat_config {
> +       int rev_id;
> +       int (*i2s_dma_config)(struct platform_device *pdev);
> +};
> +
>  static int loongson_i2s_apbdma_config(struct platform_device *pdev)
>  {
>         int val;
> @@ -47,8 +53,18 @@ static int loongson_i2s_apbdma_config(struct platform_=
device *pdev)
>         return 0;
>  }
>
> +static struct loongson_i2s_plat_config ls2k1000_i2s_plat_config =3D {
> +       .rev_id =3D 0,
> +       .i2s_dma_config =3D loongson_i2s_apbdma_config,
> +};
> +
> +static struct loongson_i2s_plat_config ls2k0300_i2s_plat_config =3D {
> +       .rev_id =3D 1,
> +};
Put  ls2k0300_i2s_plat_config before ls2k1000_i2s_plat_config?

Huacai

> +
>  static int loongson_i2s_plat_probe(struct platform_device *pdev)
>  {
> +       const struct loongson_i2s_plat_config *plat_config;
>         struct device *dev =3D &pdev->dev;
>         struct loongson_i2s *i2s;
>         struct resource *res;
> @@ -59,12 +75,17 @@ static int loongson_i2s_plat_probe(struct platform_de=
vice *pdev)
>         if (!i2s)
>                 return -ENOMEM;
>
> -       ret =3D loongson_i2s_apbdma_config(pdev);
> -       if (ret)
> -               return ret;
> +       plat_config =3D device_get_match_data(dev);
> +       if (!plat_config)
> +               return -EINVAL;
>
> -       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       i2s->reg_base =3D devm_ioremap_resource(&pdev->dev, res);
> +       if (plat_config->i2s_dma_config) {
> +               ret =3D plat_config->i2s_dma_config(pdev);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       i2s->reg_base =3D devm_platform_get_and_ioremap_resource(pdev, 0,=
 &res);
>         if (IS_ERR(i2s->reg_base))
>                 return dev_err_probe(dev, PTR_ERR(i2s->reg_base),
>                                      "devm_ioremap_resource failed\n");
> @@ -87,11 +108,17 @@ static int loongson_i2s_plat_probe(struct platform_d=
evice *pdev)
>         if (IS_ERR(i2s_clk))
>                 return dev_err_probe(dev, PTR_ERR(i2s_clk), "clock proper=
ty invalid\n");
>         i2s->clk_rate =3D clk_get_rate(i2s_clk);
> +       i2s->rev_id =3D plat_config->rev_id;
>
>         dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
>         dev_set_name(dev, LS_I2S_DRVNAME);
>         dev_set_drvdata(dev, i2s);
>
> +       if (i2s->rev_id =3D=3D 1) {
> +               regmap_update_bits(i2s->regmap, LS_I2S_CTRL, I2S_CTRL_RES=
ET, I2S_CTRL_RESET);
> +               fsleep(200);
> +       }
> +
>         ret =3D devm_snd_soc_register_component(dev, &loongson_i2s_edma_c=
omponent,
>                                               &loongson_i2s_dai, 1);
>         if (ret)
> @@ -102,7 +129,8 @@ static int loongson_i2s_plat_probe(struct platform_de=
vice *pdev)
>  }
>
>  static const struct of_device_id loongson_i2s_ids[] =3D {
> -       { .compatible =3D "loongson,ls2k1000-i2s" },
> +       { .compatible =3D "loongson,ls2k0300-i2s", .data =3D &ls2k0300_i2=
s_plat_config },
> +       { .compatible =3D "loongson,ls2k1000-i2s", .data =3D &ls2k1000_i2=
s_plat_config },
>         { /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, loongson_i2s_ids);
> --
> 2.52.0
>
>
