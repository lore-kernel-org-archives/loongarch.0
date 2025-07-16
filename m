Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0582EAB78
	for <loongarch@lists.linux.dev>; Wed, 16 Jul 2025 08:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752654297; cv=none; b=fdfQ2VEDqT86UqqVsQ9MHLneRf1nNyVdVi5JvSOeLwPzOM8glOY0iUbqFUZmMOq4zZKNPZJK18r5aBzA30f2DfhODDXFr5J2GpFmLmKYKxNHX+htpx3/9RHlKbN2+UyjDWNDGGghD4gL1eUqUVrTTLZlZZ8JXNYFTHg2J1oQ8Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752654297; c=relaxed/simple;
	bh=5F5b4fQbQLDyYyfIEIjAfQDxg56N9/W74sAYPQK/zB4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xq8xn4I8muj0pZpG9QEqch7WMgieZLOUkd2IlJUGjP/7jkyujg+RZ82aWhCWfn53a6cyUZKoPizN6o604Eh2gMn/s39IwKB5j9NFxHRknPMJq7+SI3gg2zuryjkEWJgjrV35hiTHvawoKvV7tPWyJqzgvNjEDC4ufzK134jKEps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nGEyBh88; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nGEyBh88"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D998C4AF0C
	for <loongarch@lists.linux.dev>; Wed, 16 Jul 2025 08:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752654296;
	bh=5F5b4fQbQLDyYyfIEIjAfQDxg56N9/W74sAYPQK/zB4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nGEyBh88AK50mOHxIfC25bflLxgZzU2jjJd/yQqQphnbDuWD3KYpdCuZ3c8YEM1xr
	 DQPjU0PVBI2jhhjNYlu8X2H4eSSkwEK/Z1510P9LHr6kgQafr91T04Iu6o78Y6k6Wq
	 gPrG1Z2c76YVQmzaTVUuaDgQGPjxAlqsNUdr4mHuQIH0+qx9nbva07REvrhVKh2c5q
	 CVHr8U0n9w7KSWtKPRlolAUEzVKQxOwpN2FarQuPu8+JL/odDTKrz3M2yfuqNdkmOT
	 9UJnVqwknr1urfRvwrWKTVCGfZALfqzchrQ95J9/scwRr8e0sgUMFgeOQ0eUyDShWv
	 fO2dFdMBduelg==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-60c9d8a169bso11247300a12.1
        for <loongarch@lists.linux.dev>; Wed, 16 Jul 2025 01:24:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWbmRtqdN28W0C0SYBR6scp4pB0Gy+XkjRTqHIOaY0unx9LjYy1mTxDBd7953i49EDpjR9xs5w7nPE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzml4uvjO6wawt3Mfn3wkpCOMJsRhHPT2212CUHNEPZuKcX9s7n
	Oca9E/d6c3DfNB3oFv7We9ypE82HcXq54HUCqP6TmOHHUjRhZOehYEm5roifJ5W4yvzCr1dtZuc
	Kb52E+jga8jnt8Yy/HIqn3uvHJrd/wB4=
X-Google-Smtp-Source: AGHT+IHGVlHEqQxiKOfEg4bAyxr/SOOjmk4blZy7uPzLm1I80XbLCZjS2e8NhKu0qq5UTzK5vk4tm4mfgYgOnhd0C5w=
X-Received: by 2002:a05:6402:2341:b0:607:e3ec:f8ea with SMTP id
 4fb4d7f45d1cf-6128591955amr1521159a12.6.1752654295062; Wed, 16 Jul 2025
 01:24:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250716064421.3823418-1-zhoubinbin@loongson.cn>
In-Reply-To: <20250716064421.3823418-1-zhoubinbin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 16 Jul 2025 16:24:44 +0800
X-Gmail-Original-Message-ID: <CAAhV-H41eXF=z+-KNYEkXSAh89mN4WM75duvfvcqFGrXAtY4Fw@mail.gmail.com>
X-Gm-Features: Ac12FXxfcGvrEgUGmrFc8GhoBshxF9qG9p3jrmb88Gy8-AEpS63Oof7f33xfc7Q
Message-ID: <CAAhV-H41eXF=z+-KNYEkXSAh89mN4WM75duvfvcqFGrXAtY4Fw@mail.gmail.com>
Subject: Re: [PATCH] mmc: loongson2: Unify the function prefixes for loongson2_mmc_pdata
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-mmc@vger.kernel.org, wanghongliang@loongson.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>


On Wed, Jul 16, 2025 at 2:44=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.cn=
> wrote:
>
> The function prefixes for loongson2_mmc_pdata follow two naming
> conventions: SoC-based and DMA-based.
>
> First, DMA-based prefixes are the preferred choice, as they clearly
> highlight differences, such as prepare_dma; however, for functions
> related to SoC, such as reorder_cmd_data, it is agreed to use the
> smallest SoC name as the fallback prefix, such as ls2k0500.
>
> No functional change intended.
>
> Suggested-by: Huacai Chen <chenhuacai@loongson.cn>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  drivers/mmc/host/loongson2-mmc.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/mmc/host/loongson2-mmc.c b/drivers/mmc/host/loongson=
2-mmc.c
> index ba6bb8fd5535..27499f36477c 100644
> --- a/drivers/mmc/host/loongson2-mmc.c
> +++ b/drivers/mmc/host/loongson2-mmc.c
> @@ -594,7 +594,7 @@ static struct mmc_host_ops loongson2_mmc_ops =3D {
>         .ack_sdio_irq   =3D loongson2_mmc_ack_sdio_irq,
>  };
>
> -static const struct regmap_config ls2k1000_mmc_regmap_config =3D {
> +static const struct regmap_config ls2k0500_mmc_regmap_config =3D {
>         .reg_bits =3D 32,
>         .val_bits =3D 32,
>         .reg_stride =3D 4,
> @@ -610,8 +610,8 @@ static int loongson2_reorder_cmd_list[] =3D { SD_APP_=
SEND_SCR, SD_APP_SEND_NUM_WR_
>   * However sdio controller will send these datas in usual data format,
>   * so we need to adjust these datas to a protocol consistent byte order.
>   */
> -static void loongson2_mmc_reorder_cmd_data(struct loongson2_mmc_host *ho=
st,
> -                                          struct mmc_command *cmd)
> +static void ls2k0500_mmc_reorder_cmd_data(struct loongson2_mmc_host *hos=
t,
> +                                         struct mmc_command *cmd)
>  {
>         struct scatterlist *sg;
>         u32 *data;
> @@ -704,8 +704,8 @@ static int ls2k0500_mmc_set_external_dma(struct loong=
son2_mmc_host *host,
>  }
>
>  static struct loongson2_mmc_pdata ls2k0500_mmc_pdata =3D {
> -       .regmap_config          =3D &ls2k1000_mmc_regmap_config,
> -       .reorder_cmd_data       =3D loongson2_mmc_reorder_cmd_data,
> +       .regmap_config          =3D &ls2k0500_mmc_regmap_config,
> +       .reorder_cmd_data       =3D ls2k0500_mmc_reorder_cmd_data,
>         .setting_dma            =3D ls2k0500_mmc_set_external_dma,
>         .prepare_dma            =3D loongson2_mmc_prepare_external_dma,
>         .release_dma            =3D loongson2_mmc_release_external_dma,
> @@ -736,8 +736,8 @@ static int ls2k1000_mmc_set_external_dma(struct loong=
son2_mmc_host *host,
>  }
>
>  static struct loongson2_mmc_pdata ls2k1000_mmc_pdata =3D {
> -       .regmap_config          =3D &ls2k1000_mmc_regmap_config,
> -       .reorder_cmd_data       =3D loongson2_mmc_reorder_cmd_data,
> +       .regmap_config          =3D &ls2k0500_mmc_regmap_config,
> +       .reorder_cmd_data       =3D ls2k0500_mmc_reorder_cmd_data,
>         .setting_dma            =3D ls2k1000_mmc_set_external_dma,
>         .prepare_dma            =3D loongson2_mmc_prepare_external_dma,
>         .release_dma            =3D loongson2_mmc_release_external_dma,
> @@ -838,8 +838,8 @@ static int loongson2_mmc_prepare_internal_dma(struct =
loongson2_mmc_host *host,
>         return 0;
>  }
>
> -static int loongson2_mmc_set_internal_dma(struct loongson2_mmc_host *hos=
t,
> -                                         struct platform_device *pdev)
> +static int ls2k2000_mmc_set_internal_dma(struct loongson2_mmc_host *host=
,
> +                                        struct platform_device *pdev)
>  {
>         host->sg_cpu =3D dma_alloc_coherent(&pdev->dev, PAGE_SIZE,
>                                           &host->sg_dma, GFP_KERNEL);
> @@ -860,7 +860,7 @@ static struct loongson2_mmc_pdata ls2k2000_mmc_pdata =
=3D {
>         .regmap_config          =3D &ls2k2000_mmc_regmap_config,
>         .reorder_cmd_data       =3D ls2k2000_mmc_reorder_cmd_data,
>         .fix_data_timeout       =3D ls2k2000_mmc_fix_data_timeout,
> -       .setting_dma            =3D loongson2_mmc_set_internal_dma,
> +       .setting_dma            =3D ls2k2000_mmc_set_internal_dma,
>         .prepare_dma            =3D loongson2_mmc_prepare_internal_dma,
>         .release_dma            =3D loongson2_mmc_release_internal_dma,
>  };
>
> base-commit: 4ad9e44c76b301e786eb4cdab890eac8c7eebd42
> --
> 2.47.3
>
>
