Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE04218E9F
	for <loongarch@lists.linux.dev>; Mon, 23 Jun 2025 11:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750677893; cv=none; b=gAxrV8I01HifOq9EcZ5JOftwPENk9dJJsVEPKbq8PdKaft1ilcvl6ybudP4wyROYPHe/Xiq1aqQIbsrcEWU6JnBPRnJdBdrT6mrZbR/K4eMt/URpJMnbgPHfxsIB+jPBnITyBgkQAL+QuPGpMkDKt2mjuEyZK6xt/ZxXZkXRIjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750677893; c=relaxed/simple;
	bh=P5Sl98y38xvSSFCfZCfnoyyg8/BK5OPvXyrI5MLUPNU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RIAYjE4WDyAZU0f32Mhrr2MAEl2D5dOoUhJ1FtPDVRiSxxkERhEzGeZi1XucViqXaaizSAi2dVhnY+k0pE3H+kCuJMgfr5bNAM292SP/Umr+bZ2ucFbzyKYFhhnK8CRc4e/jxsSX+M4Pc+tkX987CO6kTLdjf6BZvdukazsSM7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CAs4NmHW; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CAs4NmHW"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e7311e66a8eso3486336276.2
        for <loongarch@lists.linux.dev>; Mon, 23 Jun 2025 04:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750677890; x=1751282690; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S3F6ZEyg8xrhvs90KaNs4ZQkdGcaIaLATUUJxYt5iNs=;
        b=CAs4NmHWWrfyBYsa8CfZF+QmhHjnf5mkfMnOa3Gxwz5/bzLNKPVWnSbypnJ/ZQc3u8
         Fwp4vBw5CRZdATqnYMt3H3fzQonXQ76ZOWlPBpwugVn9dhcgD+sy513kgLhuBErPioDT
         odRbj3KyQHiH3kX/pQn+TSN2168a6iL90lwLGEwAvOCC8rML1HnIh1drrX0hJ8xiLzwA
         RuMz8tFMi0Zhi8Ppd72WePUGc1dPfr711BQYQFRTsRmGL8EEOLsjweeUEiUHkGCfG29x
         l+3+2tR3/KfTUC1SEZ0DfNNbvHSqvPqTIvxmAwSQwFYiJoA2hdUYl6hVU1d3XffLjzV5
         WFBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750677890; x=1751282690;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S3F6ZEyg8xrhvs90KaNs4ZQkdGcaIaLATUUJxYt5iNs=;
        b=SKjbAg1hwoqFQljsWhv1HOceQcagQJqoR5Meusg96EgUyERFbG/56cFuNieKqNbzyg
         Z/VZSZt/6hRkk54b4f0v7IzgF3HzEojxN0sM6vwxhg1vVYZYU6oHqs9RZYGQcEGQ4cVf
         vAtXUzJDL44t3ilJAriAdShH6tzMl/TPCdwen6isErPpWcyK30Lvlt2zFO6IekHPl3Su
         ksPHluk4m96JeU0nLo/6lVQzYoxqG+ivUy8WCphWX5+XPIimwRAXlNQweNHi4Elg715/
         U+oRmq8QtQd3DYg19uAxG0iei4QFZ5JyXT+3rySBjXZA4xWoXBSAoPsUqYq3OmzmIqyK
         vvmA==
X-Forwarded-Encrypted: i=1; AJvYcCX/e3hzcbVwbYOpEGCQfeEdV0Br+WK95w6zh8uKQJpnOW15koczxxODt90qwKP8es4m4y5XTlE9Cd0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwoRMoYaIZaFRd5fIdKRQB93kb0xmwslBWkRulXjGZCtCeR19rC
	xmjq/cOk+DbrnPH5kafPovE9XCBk+LQZRLYGVLbzNWqsS0LP8NXauWTNVIvDXubreC9j4uR/BFq
	TFPK+BKh08PlZuuT+qZ5QQuUIiWGycObs3uxzK1QshQ==
X-Gm-Gg: ASbGncvjbBR91+YE/6XIkUA/jSJxob5IZIcSMPv3t8FSJ/zhxwXZShWQH2GiPVWZTdS
	q0s+Bnd9QT6s9GC55q26701X0QzjhQBVh+ClBR9fxQ1Fvhoyu8AQKOzMozwjSfqogzm+fDoqpaW
	gxhwYlfPb200L6jj9OhIS67V9nMX4/fhE5kEJk2jqUmoJ0
X-Google-Smtp-Source: AGHT+IFBGQTkGwfG1sCUA1pxQDur/r09SkjVSlKnf4sftIQL2kU67dbH4LwgXNNxgqaZMbnr9M1AlBfGJTvOJn3cZQk=
X-Received: by 2002:a05:6902:110b:b0:e84:2761:9e57 with SMTP id
 3f1490d57ef6-e842bc9cb1bmr15596380276.20.1750677890449; Mon, 23 Jun 2025
 04:24:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1750216134.git.zhoubinbin@loongson.cn> <aa9cfb9707334cd2e56692397dd4f54c418262ce.1750216134.git.zhoubinbin@loongson.cn>
In-Reply-To: <aa9cfb9707334cd2e56692397dd4f54c418262ce.1750216134.git.zhoubinbin@loongson.cn>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 23 Jun 2025 13:24:13 +0200
X-Gm-Features: AX0GCFtUkm2_qzcRRHn7M8CtdXK3QWv2eyxlNDa6aJAl_8XE--LnCn5KSCmtfA4
Message-ID: <CAPDyKFocFfamgdB96xTCfBjLTFtgn2yrdZPTQZ0S5qW7Q2uvGg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] mmc: loongson2: Add Loongson-2K2000 SD/SDIO/eMMC
 controller driver
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-mmc@vger.kernel.org, wanghongliang@loongson.cn
Content-Type: text/plain; charset="UTF-8"

On Wed, 18 Jun 2025 at 10:08, Binbin Zhou <zhoubinbin@loongson.cn> wrote:
>
> This patch describes the two MMC controllers of the Loongson-2K2000 SoC,
> one providing an eMMC interface and the other exporting an SD/SDIO
> interface.
>
> Compared to the Loongson-2K1000's MMC controllers, their internals are
> similar, except that we use an internally exclusive DMA engine instead of
> an externally shared APBDMA engine.
>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  drivers/mmc/host/loongson2-mmc.c | 212 +++++++++++++++++++++++++++++++
>  1 file changed, 212 insertions(+)
>
> diff --git a/drivers/mmc/host/loongson2-mmc.c b/drivers/mmc/host/loongson2-mmc.c
> index 872f5dc21b21..75144221a821 100644
> --- a/drivers/mmc/host/loongson2-mmc.c
> +++ b/drivers/mmc/host/loongson2-mmc.c

[...]

> +static void loongson2_mmc_dll_mode_init(struct loongson2_mmc_host *host)
> +{
> +       u32 val, pad_delay, delay, ret;
> +
> +       regmap_update_bits(host->regmap, LOONGSON2_MMC_REG_SEL,
> +                          LOONGSON2_MMC_SEL_DATA, LOONGSON2_MMC_SEL_DATA);
> +
> +       val = FIELD_PREP(LOONGSON2_MMC_DLLCTL_TIME, 0xc8)
> +           | FIELD_PREP(LOONGSON2_MMC_DLLCTL_INCRE, 0x1)
> +           | FIELD_PREP(LOONGSON2_MMC_DLLCTL_START, 0x1)
> +           | FIELD_PREP(LOONGSON2_MMC_DLLCTL_CLK_MODE, 0x1)
> +           | FIELD_PREP(LOONGSON2_MMC_DLLCTL_START_BIT, 0x1)
> +           | FIELD_PREP(LOONGSON2_MMC_DLLCTL_TIME_BPASS, 0xf);
> +
> +       regmap_write(host->regmap, LOONGSON2_MMC_REG_DLLCTL, val);
> +
> +       ret = regmap_read_poll_timeout(host->regmap, LOONGSON2_MMC_REG_DLLVAL, val,
> +                                      (val & LOONGSON2_MMC_DLLVAL_DONE), 0, 4000);

Please use a define to specify the 4000us timeout.

> +       if (ret < 0)
> +               return;
> +
> +       regmap_read(host->regmap, LOONGSON2_MMC_REG_DLLVAL, &val);
> +       pad_delay = FIELD_GET(GENMASK(7, 1), val);
> +
> +       delay = FIELD_PREP(LOONGSON2_MMC_DELAY_PAD, pad_delay)
> +             | FIELD_PREP(LOONGSON2_MMC_DELAY_RD, pad_delay + 1);
> +
> +       regmap_write(host->regmap, LOONGSON2_MMC_REG_DELAY, delay);
> +}

[...]

> +/*
> + * This is a controller hardware defect. Single/multiple block write commands
> + * must be sent after the TX FULL flag is set, otherwise a data timeout interrupt
> + * will occur.
> + */
> +static void ls2k2000_mmc_fix_data_timeout(struct loongson2_mmc_host *host,
> +                                         struct mmc_command *cmd)
> +{
> +       int val;
> +
> +       if (cmd->opcode != MMC_WRITE_BLOCK && cmd->opcode != MMC_WRITE_MULTIPLE_BLOCK)
> +               return;
> +
> +       regmap_read_poll_timeout(host->regmap, LOONGSON2_MMC_REG_FSTS, val,
> +                                (val & LOONGSON2_MMC_FSTS_TXFULL), 0, 500);

Ditto.

[...]

Kind regards
Uffe
