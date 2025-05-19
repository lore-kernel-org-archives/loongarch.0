Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25F82451C3
	for <loongarch@lists.linux.dev>; Mon, 19 May 2025 11:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747652641; cv=none; b=bBFXVdog0z3wUb1lsfy53Zfp0KkvSQYcGomVZl6q/CN8WFRkjvNVAt0782XtGvz7iKvTlP2lJE6MG4ZrxkPxq9prxHOR+wyz36Ea3wQz+15K49+SY9lgnoA5gz+mNR8XFteW22kPC/a+6WH3I0xWk/4RD6f5ZR0TkPnUsMZTvkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747652641; c=relaxed/simple;
	bh=1RBzsBUZFE4oAcdXsB1WfJqMcomnc+3kLNPimm2/Js0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M8NL0yyvdayHRvpMcjX/PkMbexG7jK6eeKSEdWv9kGE3oYGKA60+8otim3nnKig7VfgnzL4LBA1+4VPPmURLkjHh0fklqrfT1mARgySqQPnYvfzjzhzBEwbWPMwFSFCkNTjcHt7ovsnuxKr9EIy0ZHi2t4xkxS76/r7q8ViW8kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tDRgGNhk; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tDRgGNhk"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e7b7b4eaca1so2272434276.0
        for <loongarch@lists.linux.dev>; Mon, 19 May 2025 04:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747652638; x=1748257438; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m2xHnKKd+aDHtHX8yu3cDHfKWt8EXdtJaGR+RnU/oP8=;
        b=tDRgGNhkeX6Ert/AJpk38bEJ5Djj0SJjYKGdxubFIZkL3VPphkxvd/cIgRpq+8uln8
         nV6zO6mCuvqjxmdHWo8eTfDXZ81KwHm/6BlTR8oi1YhB/roamfhvTUlLTcWtNhcc311H
         Flv4v5HokwLjiTQ+xh6txeMBmN7Z5EoE5iZe4aAOca8mQmufHV6MuWmEzD9IHLg6/Cg/
         R46Uf7L0caprC83UZc1m4MMwAOm2ltN2+v6cpIBGW19MWYymBpq/QJEyzxByBeny2Ez2
         LODmen/uHyps2wtJ3RRXLj9EzvgN4rRQ8uerHJ3r+/KtNFbbcNGxf5V/ueZY76p+8BaN
         8FXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747652638; x=1748257438;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m2xHnKKd+aDHtHX8yu3cDHfKWt8EXdtJaGR+RnU/oP8=;
        b=tYQD9BNrCZ7mHvRBICgdpYQOVdeCctVB2wbnBZWPg2te+ceBlb31cTjDYFweYUW6SM
         2g99zI61wOzAUEX5GkRKdOm+2jgDiTY6QA31h1ub/kQj6UJBSp5EAXrG7jNz66Wka7ay
         KDbisDpYePdE49pL3iMci7dyRtRhvXPusUA4tdgdhCNw8yGRAJXF2vNYfXbImafObewN
         kdL4KXdDl9r7Kd8CfM07C3ilwR7qHZiGsFkJ4WgAVSTkwKlS783Vl4QfpHpf8ah0znIW
         e9wsCxhsRjpBOT/Gla88u+S2Lre/cknKZQAOwOv/1P/g5QlzqOoWOaFiQvR+76gXLo7r
         GeUA==
X-Forwarded-Encrypted: i=1; AJvYcCXMd/kpjmHIzx0H8EBmIGUj+mYkj8w4yuwp7jCcTYLSnQLDQ+gxGlWBroSpOacyryTg1Wi1wCApeLw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw21pWUdrrLn2XcyYOkaDwAqX/QuU521uT6BZXFEjjQUJb2b7ra
	DMoO4UspRqpdODQywl5BmIKyh2TcakONxOx1fERRmGNwrfO1WamUsZa7kLlrTXWLV1TWIF5uy4m
	0JJvA0PobccL6CIiDsnGnzGkeSYUgCPoHDdZDn5COjQ==
X-Gm-Gg: ASbGncvuJ2J2AbMBI9ZXl7xkDBaZjN+kpKKTRrVt6jhz3GfaWcCyNKiqU6ApN5PmArg
	vn5aWT1UH/JbgWlV6Djyb6wiU6tfk5kKVykAo1C5hy1Z1vJzNUMrtOCFK8fpypjUGxhSc93OjaH
	I/jVdC3yLrbZrtPy9dpx6NKQovZKOhbfub3Q==
X-Google-Smtp-Source: AGHT+IFBUb2/Xms/raeEGwi+8becFxoSstWr/BLkHMpPNO+AziHGedBdCZ+gSklzRXJEASSnQ0GOSObcwPcchKsfqNQ=
X-Received: by 2002:a05:6902:170a:b0:e7b:6893:d5ec with SMTP id
 3f1490d57ef6-e7b6d40269emr15160872276.20.1747652638618; Mon, 19 May 2025
 04:03:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1746581751.git.zhoubinbin@loongson.cn> <1308b6ca9ffc2674cc0f089cfd163da87e53a8cd.1746581751.git.zhoubinbin@loongson.cn>
In-Reply-To: <1308b6ca9ffc2674cc0f089cfd163da87e53a8cd.1746581751.git.zhoubinbin@loongson.cn>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 19 May 2025 13:03:22 +0200
X-Gm-Features: AX0GCFtVcITX1kDzetWV6A9kXMJvvFjktirKyT439flna1xTvzKDXV6wLcfl6Dc
Message-ID: <CAPDyKFouNpdnQSXBxRmKhECyojrT_TkCpgg01GHbzQpuYFvEZg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] mmc: loongson2: Add Loongson-2K SD/SDIO controller driver
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 May 2025 at 09:28, Binbin Zhou <zhoubinbin@loongson.cn> wrote:
>
> The MMC controllers on the Loongson-2K series CPUs are similar,
> except for the interface characteristics and the use of DMA controllers.
>
> This patch describes the MMC controllers on the Loongson-2K0500/2K1000,
> with the distinguishing feature being the use of an externally shared
> APBDMA engine.
>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

[...]

> +
> +static void loongson2_mmc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
> +{
> +       struct loongson2_mmc_host *host = mmc_priv(mmc);

As we now have support for regulators, we should use them here too.

Some something along the lines of this at MMC_POWER_OFF:
if (!IS_ERR(mmc->supply.vmmc))
      mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, 0);

and at MMC_POWER_UP:
if (!IS_ERR(mmc->supply.vmmc))
      mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, ios->vdd);

> +
> +       switch (ios->power_mode) {
> +       case MMC_POWER_ON:

Is the fallthrough really what we want here?

MMC_POWER_ON is used quite frequently when changing various ios
settings when the core calls mmc_set_ios(). MMC_POWER_UP is set only
once in mmc_power_up().

> +       case MMC_POWER_UP:
> +               regmap_write(host->regmap, LOONGSON2_MMC_REG_CTL, LOONGSON2_MMC_CTL_RESET);
> +               mdelay(10);
> +               regmap_write(host->regmap, LOONGSON2_MMC_REG_CTL, LOONGSON2_MMC_CTL_EXTCLK);
> +               regmap_write(host->regmap, LOONGSON2_MMC_REG_INT, LOONGSON2_MMC_IEN_ALL);
> +               regmap_write(host->regmap, LOONGSON2_MMC_REG_IEN, LOONGSON2_MMC_INT_CLEAR);
> +               break;
> +       case MMC_POWER_OFF:
> +               regmap_update_bits(host->regmap, LOONGSON2_MMC_REG_CTL,
> +                                  LOONGSON2_MMC_CTL_RESET, LOONGSON2_MMC_CTL_RESET);
> +               return;
> +       default:
> +               return;
> +       }
> +
> +       loongson2_mmc_set_clk(host, ios);
> +
> +       host->bus_width = ios->bus_width;
> +}
> +

[...]

> +
> +static void loongson2_mmc_enable_sdio_irq(struct mmc_host *mmc, int enable)
> +{
> +       struct loongson2_mmc_host *host = mmc_priv(mmc);
> +
> +       regmap_update_bits(host->regmap, LOONGSON2_MMC_REG_IEN,
> +                          LOONGSON2_MMC_INT_SDIOIRQ, enable);
> +}
> +
> +static struct mmc_host_ops loongson2_mmc_ops = {
> +       .request        = loongson2_mmc_request,
> +       .set_ios        = loongson2_mmc_set_ios,
> +       .get_ro         = mmc_gpio_get_ro,
> +       .get_cd         = mmc_gpio_get_cd,
> +       .enable_sdio_irq = loongson2_mmc_enable_sdio_irq,

The ->ack_sdio_irq() callback needs to be implemented too.

Moreover we need to set MMC_CAP2_SDIO_IRQ_NOTHREAD.

[...]

Kind regards
Uffe
