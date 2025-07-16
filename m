Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6189F2F3647
	for <loongarch@lists.linux.dev>; Wed, 16 Jul 2025 10:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752660556; cv=none; b=SKNcUI022j3hKwjAj99K4aU3saFygOnu5XjDt0HOEdmMUQ87abyyB+j4fv8bnO/rbYMWUZoFsRzs0R7/ROQvyV7K43VBK0XR0UyX67d+u2hA9b7QHyf/RueXm4l0XQ5QUBvj+RAbp3DXyhAxcl7QSUFvVeTG4X5cVS9g8OHmIjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752660556; c=relaxed/simple;
	bh=/VEjuhpOm4mcfJFH+WMwCKqtBLq/M4iABFtKjrJ49AU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IZoi5pZuMcMiLay2OdIozlLW7vmNKIu7V4jfsopM8M4HxKgZIcxH8cprROhztc4xtG9ndgRjI+//X4P0AgML1o5op2Pxsyzc0e2klZ/PUD+LBNyIROkfxdi7bF27vijWz6sMGOsl2/FFcttACtlBXPPUF3oipaH0XIieWwxdbVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nqsVZRZR; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nqsVZRZR"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-708d90aa8f9so58553777b3.3
        for <loongarch@lists.linux.dev>; Wed, 16 Jul 2025 03:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752660553; x=1753265353; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OnBWYwfo8wiUCGNtHhjPaLy845d6kgQBixwcMR4fh74=;
        b=nqsVZRZRQzy4GUrJILH4pcdfO+CQMtle6UcrjsPVsmZMeTU/PJb/W4Okc5NSkU3NxU
         AFB9ceYgOZ/LzKVxeEnO1HN/slXh0PXKv54ZfvfK88bAaHtiQLPFy0TPYwLxcOjnu9XU
         2qGTa2V58dCloh51o51A9UyHfG9PHKHWANv2S1dfPncwnZCKiMfQLNUHNtdPhrzz9RqG
         QXBFkROuJ8PgIr/Ag8ysc86dbhmqtd64QZGE/1OiRFXkxw0Snwtzokzbu3vc4I85VbzI
         gL5Uoyw+Zne+T4Sgv7/RBx5/UFg9TRDLYmq2d+J9Ui8FParUYOTwXsAIsmkfsxxE+K2c
         2r1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752660553; x=1753265353;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OnBWYwfo8wiUCGNtHhjPaLy845d6kgQBixwcMR4fh74=;
        b=TPtJF+7riXQbuv8ScmIwQf2DuemP7w3GoLJ56KR/zYSrVxEwskGrU6Nq+vY5s6TP6y
         zNjJFhfHSteW1wKbcTTupVHKUhlJNm0i5s0nxqcL/oR0ERJMfIp/1rxp/Nn6tTy+bfUr
         gPR5S7+9ND1oIhP61m0aM1hHvMZ1byE5HZ/I595IEhTrKzJT0M76zKzG5K83D0KKZA4M
         PweBIiTj3NZ1M/FNhFO97b7FveyOujFouHtWb1v1gkM9neumCbguCFHQS3txg3vCE19l
         /jSnM0wuObRxNyIQnoAz3b5vbtfJ8X4K9I7PRCtDl+K2aETowROuXu1NRbLvO7xdUfRK
         Ym2g==
X-Forwarded-Encrypted: i=1; AJvYcCUEI86S9ODQ5m2flJvoLRlnid+MKZxNPM4laN4tANWw/Nijx0ruxki9uBsehAerO7K0B8M4cGLogdE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwQO8Rd+p6n+1Yu6rWY4jrGLoFquEKOc+ky+Ak1XZic/6GiPRHw
	yDG+I3FXntdNY1eoAPjSSzfdO+M528n/sHLcCbBMmW0T5+sN9MjhOETgfc0opwhTNue7hCGX5QI
	EP0EucN08SDKjegpdLrPQkha3ZpkDZWfU4gKCZz7ivw==
X-Gm-Gg: ASbGncsbwKYe3memkNKpcn+kiKFqHOP7YJNxC8VvNQ4TDUAr+NRULhK+D6zg0Ss1tVe
	64Pv9GxSdjUMZd8eG5GXzW+9Z7aV3u/aBx02yyU42r9VyaT25uGSae0B63Yg1lTZHZT2zyNZ/o1
	WwoVOKp2ry9vka4V4tgn4j1WmS+gbOuS7o+wYoUoi+KMa6Dw2PvqsBV6QoYdPSS3mBlm05j/wbp
	DXFRs+z
X-Google-Smtp-Source: AGHT+IGy3dipAywy/v3t7OOYtOeDboI5JlqIw7qcFV8Y/WnPRMS48rXs5U9ysQX+XZc7N3+MilbgU45XI/TSY+C1E/k=
X-Received: by 2002:a05:690c:9b0a:b0:6ef:652b:91cf with SMTP id
 00721157ae682-7183515bc8fmr34066097b3.27.1752660553188; Wed, 16 Jul 2025
 03:09:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250716064421.3823418-1-zhoubinbin@loongson.cn>
In-Reply-To: <20250716064421.3823418-1-zhoubinbin@loongson.cn>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 16 Jul 2025 12:08:37 +0200
X-Gm-Features: Ac12FXxmbFb81p4o8_4QaHZmiOqrSxmwLRGTgDmrXWuWmSI0XGrHlo7coapF_Kk
Message-ID: <CAPDyKFrxVYaH+bxLSaXL3VjsPAdBEtxHk=PonT659GmVnc+n5A@mail.gmail.com>
Subject: Re: [PATCH] mmc: loongson2: Unify the function prefixes for loongson2_mmc_pdata
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-mmc@vger.kernel.org, wanghongliang@loongson.cn
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Jul 2025 at 08:44, Binbin Zhou <zhoubinbin@loongson.cn> wrote:
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

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/loongson2-mmc.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/mmc/host/loongson2-mmc.c b/drivers/mmc/host/loongson2-mmc.c
> index ba6bb8fd5535..27499f36477c 100644
> --- a/drivers/mmc/host/loongson2-mmc.c
> +++ b/drivers/mmc/host/loongson2-mmc.c
> @@ -594,7 +594,7 @@ static struct mmc_host_ops loongson2_mmc_ops = {
>         .ack_sdio_irq   = loongson2_mmc_ack_sdio_irq,
>  };
>
> -static const struct regmap_config ls2k1000_mmc_regmap_config = {
> +static const struct regmap_config ls2k0500_mmc_regmap_config = {
>         .reg_bits = 32,
>         .val_bits = 32,
>         .reg_stride = 4,
> @@ -610,8 +610,8 @@ static int loongson2_reorder_cmd_list[] = { SD_APP_SEND_SCR, SD_APP_SEND_NUM_WR_
>   * However sdio controller will send these datas in usual data format,
>   * so we need to adjust these datas to a protocol consistent byte order.
>   */
> -static void loongson2_mmc_reorder_cmd_data(struct loongson2_mmc_host *host,
> -                                          struct mmc_command *cmd)
> +static void ls2k0500_mmc_reorder_cmd_data(struct loongson2_mmc_host *host,
> +                                         struct mmc_command *cmd)
>  {
>         struct scatterlist *sg;
>         u32 *data;
> @@ -704,8 +704,8 @@ static int ls2k0500_mmc_set_external_dma(struct loongson2_mmc_host *host,
>  }
>
>  static struct loongson2_mmc_pdata ls2k0500_mmc_pdata = {
> -       .regmap_config          = &ls2k1000_mmc_regmap_config,
> -       .reorder_cmd_data       = loongson2_mmc_reorder_cmd_data,
> +       .regmap_config          = &ls2k0500_mmc_regmap_config,
> +       .reorder_cmd_data       = ls2k0500_mmc_reorder_cmd_data,
>         .setting_dma            = ls2k0500_mmc_set_external_dma,
>         .prepare_dma            = loongson2_mmc_prepare_external_dma,
>         .release_dma            = loongson2_mmc_release_external_dma,
> @@ -736,8 +736,8 @@ static int ls2k1000_mmc_set_external_dma(struct loongson2_mmc_host *host,
>  }
>
>  static struct loongson2_mmc_pdata ls2k1000_mmc_pdata = {
> -       .regmap_config          = &ls2k1000_mmc_regmap_config,
> -       .reorder_cmd_data       = loongson2_mmc_reorder_cmd_data,
> +       .regmap_config          = &ls2k0500_mmc_regmap_config,
> +       .reorder_cmd_data       = ls2k0500_mmc_reorder_cmd_data,
>         .setting_dma            = ls2k1000_mmc_set_external_dma,
>         .prepare_dma            = loongson2_mmc_prepare_external_dma,
>         .release_dma            = loongson2_mmc_release_external_dma,
> @@ -838,8 +838,8 @@ static int loongson2_mmc_prepare_internal_dma(struct loongson2_mmc_host *host,
>         return 0;
>  }
>
> -static int loongson2_mmc_set_internal_dma(struct loongson2_mmc_host *host,
> -                                         struct platform_device *pdev)
> +static int ls2k2000_mmc_set_internal_dma(struct loongson2_mmc_host *host,
> +                                        struct platform_device *pdev)
>  {
>         host->sg_cpu = dma_alloc_coherent(&pdev->dev, PAGE_SIZE,
>                                           &host->sg_dma, GFP_KERNEL);
> @@ -860,7 +860,7 @@ static struct loongson2_mmc_pdata ls2k2000_mmc_pdata = {
>         .regmap_config          = &ls2k2000_mmc_regmap_config,
>         .reorder_cmd_data       = ls2k2000_mmc_reorder_cmd_data,
>         .fix_data_timeout       = ls2k2000_mmc_fix_data_timeout,
> -       .setting_dma            = loongson2_mmc_set_internal_dma,
> +       .setting_dma            = ls2k2000_mmc_set_internal_dma,
>         .prepare_dma            = loongson2_mmc_prepare_internal_dma,
>         .release_dma            = loongson2_mmc_release_internal_dma,
>  };
>
> base-commit: 4ad9e44c76b301e786eb4cdab890eac8c7eebd42
> --
> 2.47.3
>
