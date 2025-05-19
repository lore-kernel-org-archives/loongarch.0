Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D52CA6B
	for <loongarch@lists.linux.dev>; Mon, 19 May 2025 11:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747653468; cv=none; b=dYc9DR1wC51MAY1j8Ud0nTMDcJSMDMRZr9DFL8AkFg40m2eYtxMdOKPevRJWfTRWJ1hzQSV750SKkJ5k7qVfXJ/S+GM7XMpJ2dDcffFcENIFSmWZ0jRAN0kINz9wG4nNg55KgytVAwL8+6VQWxTJ8JSwLbxPHHd3LK6t133wee8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747653468; c=relaxed/simple;
	bh=BBa1p+93rbInkHFD7cu4NFc1HnCPbuyMOY8gIKSTD6U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gDz3v7b2fQbeau6uFqtcLJZfNwsfcFP/QHmrYi0VsOlFYYuhhOr1hDs/CGInKZhg3b6Pg+VDZadTqyCaEQo4KzC2ao8H0iJgVYTNeYK8te7O6tRoBcZtEC0yS0pA9mfl+GelhE3SoIXBfAxdge9wdkD1T1szLjhcWwOZ4GRFdo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Kw/SDDwC; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kw/SDDwC"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e733e25bfc7so3712940276.3
        for <loongarch@lists.linux.dev>; Mon, 19 May 2025 04:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747653465; x=1748258265; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ByMrX1Fxu6vn5FGyTRQj4KFvlAc0MJvBBAYMSrSilHY=;
        b=Kw/SDDwCj0mmg7Z39jbgMvXrP1Jwd4ntjLA2Vg1cFh5ipPB61PHup6yjbXrw4zhkp7
         HXQOpngy91R6HagMrVFjvZyTPU+e+LpTdT8K4Hngi5fUCw+Y8S9WRg3dIQLF2/CCz0fv
         Il9mpJIHroQzLFJW8ZFLusn1qnNmyq4BzN5Z1FUEFY9CX6LWsXOPrNwb704RGwwxwZQk
         2iLmlyf1Om+Etz7VqfvGBX8BLoftbHcL9OyG2CFsJiX4uvU3uioKtDA7r29jMO8hcUmj
         Uh0FajNGP9PFQb6BxQAQLm37rVO+iTc2/v+y6Sv95l67/9ucKnKlrJ04F1hY4/uawnDs
         TG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747653465; x=1748258265;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ByMrX1Fxu6vn5FGyTRQj4KFvlAc0MJvBBAYMSrSilHY=;
        b=CafjKMo9jEpEE6djpnZwR1a1O1sPcQ6LQ8U6IkPWesyybERvCSnE9ZtntYFYAeHTP8
         C76sk8tiFnUSdjQiQSCswPCM7OokwpsCBCBeZbTi/bzUWe4rZzvqHshJ6qN9TLl8FcBg
         dmc3B1GItA3CPMHQiiJ7cX6aQzzlCQ0gEPH6uZcGezsUxER1qc+c2gZoOujZEzdBTnlj
         IvZiCKlmncJnttOpB658nki5r+Tu6VnKeFxtVejUsKvLf5ElFKLFQLj3x7bOhZ4pEp7u
         /Z62P30g7/hZNFo9S7/yxGe2KIeA8abNpfZRrdcbLN/nS5NT9efHFva8tMXRfr6a/tFs
         pnJw==
X-Forwarded-Encrypted: i=1; AJvYcCU12kZtyMHwCGlqIojFltwjsFP+tckOHfFau+5+9P6/6KqoIjrspVGq3bihLkExB+UGoppHbtgA7Jg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxsYklrSzLL4AQVQuy54er2fEDeA8jfn/7LzMsgrhuZZqv5psSg
	t70olz7huvEKXqeA0dgAPelUVQ/Rq9Fk6efIKbYRySNtsW19Xnpl5tPzUxQHZg0/i5MKGL29bUg
	05PqBpGuUki2lTZSlfYZsGjp26YznrYOedvfGvmBOaF44/NcFxdwgMScfWg==
X-Gm-Gg: ASbGncsCNl3G0SNQFbx9Yo3x4mO65fCHN6JMDBwZxl8KoRnsew9sD7S0KW1mhu//+wZ
	tYKyGNfqtWWFjZ2iep9NXgboTvlDpXm2AceKEgpLF6HxwVY+07wSCTlUaeWuvUR7FibVBCxw8x2
	A8KTHxA1XTSfBCQQFeEFGnpT97Mf7NnITbfA==
X-Google-Smtp-Source: AGHT+IEKnaIepG8Xu8dXigkseIQg2Elah7K+s02DVYBTys+Y3pqAA6EVTrbsP8cwn+bjFmdEtTTVIsP4u/Z11dsLsQ4=
X-Received: by 2002:a05:6902:2190:b0:e7d:3b61:e24a with SMTP id
 3f1490d57ef6-e7d3b61e544mr2112278276.32.1747653465642; Mon, 19 May 2025
 04:17:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1746581751.git.zhoubinbin@loongson.cn> <704447268706b1b9f25bbe9d15459163d0ac3404.1746581751.git.zhoubinbin@loongson.cn>
In-Reply-To: <704447268706b1b9f25bbe9d15459163d0ac3404.1746581751.git.zhoubinbin@loongson.cn>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 19 May 2025 13:17:09 +0200
X-Gm-Features: AX0GCFveu0YoTJh4AI6kbpPNJ1GJA5WZq95nOMrbprGfHNrxs7iIBViE2fZiSTI
Message-ID: <CAPDyKFo4n=K5-SeKFpCm-0u4Bbk-E0XqUrx+KSK1yuZa35a7ug@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] mmc: loongson2: Add Loongson-2K2000 SD/SDIO/eMMC
 controller driver
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 May 2025 at 09:28, Binbin Zhou <zhoubinbin@loongson.cn> wrote:
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

[...]

> +
> +static void ls2k2000_mmc_fix_cmd_interrupt(struct loongson2_mmc_host *host,
> +                                          struct mmc_command *cmd)
> +{
> +       int val;
> +
> +       if (cmd->opcode != MMC_WRITE_BLOCK && cmd->opcode != MMC_WRITE_MULTIPLE_BLOCK)
> +               return;
> +
> +       regmap_read_poll_timeout(host->regmap, LOONGSON2_MMC_REG_FSTS, val,
> +                                (val & LOONGSON2_MMC_FSTS_TXFULL), 0, 500);

Can you please elaborate on what goes on here?

Note that, the mmc core uses a couple of different options to manage
busy detection monitoring on DAT0, for those commands that need it.

*) MMC_CAP_WAIT_WHILE_BUSY - if the host HW and the driver for it
supports IRQ based busy-detection.
*) host_ops->card_busy() callback if the HW can poll the DAT0 manually
for busy-detection.
*) Polling by using CMD13.

[...]

Kind regards
Uffe
