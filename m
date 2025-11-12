Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4682E4241
	for <loongarch@lists.linux.dev>; Wed, 12 Nov 2025 23:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762991710; cv=none; b=NFmPF037a3p0g8Z5M5ECB3357FvehNB11WskuBIsvKzMAkADG5d1JfrEfR9mzdO6cDcndhqYOY0JPN+mcSIMAjxkh0FpFU/jWFdDM9kWSQSQ+uEj8Fh1VkI1d3+WNa+h/7IOXQW+JyGbxhtIlBTbGC7f76qjfWJHo+FUnVR3rG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762991710; c=relaxed/simple;
	bh=Us25Ow4LTRbEQvqsZr0IcOc4aoJJGqD1PGayCn9qrv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t0CdrZeyXkr5jyXUuQsguFiM7kmRWdkRlL9w05dAm9/0ikPZTiFsrcLc4WDPIzMoMBLoAd4Vr5u9gwirRrj5v2xBz5TeOjdR4g9Bx7Jm5IyfKXwtQqyi3Z2hZJMnKH7IcYe0HFFfLJrFyYu8HQROIcziaGvj67vwmfTx2AEP/Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YXQNXq5M; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YXQNXq5M"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-340bb1cb9ddso180747a91.2
        for <loongarch@lists.linux.dev>; Wed, 12 Nov 2025 15:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762991708; x=1763596508; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w6OffR4lIkpzwUex3aL8B2PN3fOXP6I4NsdzFgFrC6Q=;
        b=YXQNXq5M+ZhDyIMn8E4NqmAjXGPXajUDA5jnekHXfFOkCvkhfQqb4HCw0xFxNeomDO
         /xLf5L5SCLNfpvCZ851/pP+dzEyYDt+wEl50akYi+X/HuQLovf47C6cB4IkHA0OQIcbl
         mjZe8csFWih9uPL6Zl5syMS+24p3NZPV9MbuLvUodIyrQLDSIPd6d/IDPYThKF6Ais8V
         Qmtcf8ee26g3zk/FN51GEfaBHuuvROITGOxBL2cs+KftxU7C9q5YTw05wmNdA5dKaCxP
         zpCVEs6Q9feoAhCX1bamBrjY2Qx9VCe2jmt4iYB1SOGpPNZiTQ0UScQR3EMDLBj9M5hr
         7qlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762991708; x=1763596508;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w6OffR4lIkpzwUex3aL8B2PN3fOXP6I4NsdzFgFrC6Q=;
        b=Crz3IgmMw0sR3LrxO9nSejXIWopg9WD8bLZcYvAvI+BJ4oz7Qz7mK8fvf6JE+zuf8i
         tuAg51BryxB/+jqtnLkMVrq/d3/9yIS1S/r9y30/LozvGdHUbNQuvsBMPyLIblOzrqor
         NhufggZtebIDWpYtKLPwPBC2oNDtXkgXmF1R/vNZaYnJ74MFAKJ/0mF6anKWhTT8bpMN
         b199q3XppAbmbWd03dUydBuxWhwa1wGLvrXUQy9N3hdeqsqg0W8yQiaFJYpAsQeVcmji
         XGDXPNMJVFm8QTspS4we6ZtysJaXgqrwNhb8fdHmrUzhVsJlXEguSSnLg07oIApw844H
         Ht+g==
X-Forwarded-Encrypted: i=1; AJvYcCUN671uIUHCWQp5lLUw5VeTAjdnJgGdsigLW5Qh7InUz9Xa9tZVg6f2bnJel9NkTOy2onpGSnnchQs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzHGoRpAciV9zNfGZQg8ANznI4SrsytBP4WGhHfRaveNoh8Cg/3
	7IvKFIsYHLd2xAyUSXNbaXqT2Cvy3/brgXxQ+9f6rIvsyifRAAsCf2TM
X-Gm-Gg: ASbGncvV2+yfLWPlVkk5n1V25GTkLZtRQT5dalHAyF7iJE4CCEzNeHXMWlouY50IcGk
	tUzerJp/uaZtBvrIPgwJqg6FWRoMM1zz3Uc1hgC/ee9JFQStNwHAoh6t3ry9H/T2zi0cAS542Dx
	2wnAcmPejGo11/FllCYr6UAPyzLDv7gjHIWHRoK7yeksOS2hVLlAPgFC03mJ9Buk4gJWKc4/T2t
	GtWIxjbvD40Hi/SHHvWkE+KbxAPElKcwakRWpldb3dQnxsdKxyMBW8sFt6UQXwId8aMYm2WJd8T
	mbGZsBRe6f8YNOaoNaFdO0mrS4mwlpbaQg9WQeWy1bG0CNO/ZD/XPJqut345bLQt23vaaEt9oqI
	mBo2zxG5Kv1u1FGLD39ViHOB1JQor14zAh5YHvzmxsVFxReQLcd5sLm6lEsSI6oNCK9oweKhtEq
	RonbOhaLW1HPJp
X-Google-Smtp-Source: AGHT+IEE+ukQ2Egcy4293lQJqi7WMf+MbJ76O7jm9+X36I2yXPp50tCVwO5o7dcTEyhqPA51Cg8LYA==
X-Received: by 2002:a17:90b:5487:b0:343:c839:21d2 with SMTP id 98e67ed59e1d1-343ddef34c5mr5046424a91.28.1762991708311;
        Wed, 12 Nov 2025 15:55:08 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343ed5331e3sm271066a91.11.2025.11.12.15.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 15:55:07 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 12 Nov 2025 15:55:06 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
	devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
	Xiaochuang Mao <maoxiaochuan@loongson.cn>
Subject: Re: [PATCH v2 5/5] watchdog: loongson1: Add Loongson-2k0300 watchdog
 support
Message-ID: <bcfb8eec-546e-40f5-bf12-fc2c68bbd7d4@roeck-us.net>
References: <cover.1762482089.git.zhoubinbin@loongson.cn>
 <d6153aa5457098cea388cff7ee2ceb43b207970b.1762482089.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6153aa5457098cea388cff7ee2ceb43b207970b.1762482089.git.zhoubinbin@loongson.cn>

On Fri, Nov 07, 2025 at 02:01:51PM +0800, Binbin Zhou wrote:
> According to the manual, the Loongson-2K0300 watchdog is similar to the
> Loongson-1, except for some register offsets and inconsistent register
> bit definitions. Separate definitions via driver_data suffice.
> 
> Co-developed-by: Xiaochuang Mao <maoxiaochuan@loongson.cn>
> Signed-off-by: Xiaochuang Mao <maoxiaochuan@loongson.cn>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/Kconfig         |  4 +-
>  drivers/watchdog/loongson1_wdt.c | 73 ++++++++++++++++++++++++++------
>  2 files changed, 62 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 0c25b2ed44eb..002eb785ca1f 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -1965,10 +1965,10 @@ config LANTIQ_WDT
>  
>  config LOONGSON1_WDT
>  	tristate "Loongson1 SoC hardware watchdog"
> -	depends on MACH_LOONGSON32 || COMPILE_TEST
> +	depends on MACH_LOONGSON32 || MACH_LOONGSON64 || COMPILE_TEST
>  	select WATCHDOG_CORE
>  	help
> -	  Hardware driver for the Loongson1 SoC Watchdog Timer.
> +	  Hardware driver for the Loongson family Watchdog Timer.
>  
>  config RALINK_WDT
>  	tristate "Ralink SoC watchdog"
> diff --git a/drivers/watchdog/loongson1_wdt.c b/drivers/watchdog/loongson1_wdt.c
> index 255198cbf5bf..2417519717cc 100644
> --- a/drivers/watchdog/loongson1_wdt.c
> +++ b/drivers/watchdog/loongson1_wdt.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
>  /*
>   * Copyright (c) 2016 Yang Ling <gnaygnil@gmail.com>
> + * Copyright (C) 2025 Binbin Zhou <zhoubinbin@loongson.cn>
>   */
>  
>  #include <linux/clk.h>
> @@ -10,10 +11,8 @@
>  #include <linux/platform_device.h>
>  #include <linux/watchdog.h>
>  
> -/* Loongson 1 Watchdog Register Definitions */
> +/* Loongson Watchdog Register Definitions */
>  #define WDT_EN			0x0
> -#define WDT_TIMER		0x4
> -#define WDT_SET			0x8
>  
>  #define DEFAULT_HEARTBEAT	30
>  
> @@ -27,18 +26,37 @@ module_param(heartbeat, uint, 0);
>  MODULE_PARM_DESC(heartbeat, "Watchdog heartbeat in seconds. (default="
>  		 __MODULE_STRING(DEFAULT_HEARTBEAT) ")");
>  
> +struct ls1x_wdt_pdata {
> +	u32 timer_offset;
> +	u32 set_offset;
> +	u32 wdt_en_bit;
> +};
> +
> +static const struct ls1x_wdt_pdata ls1b_wdt_pdata = {
> +	.timer_offset = 0x4,
> +	.set_offset = 0x8,
> +	.wdt_en_bit = BIT(0),
> +};
> +
> +static const struct ls1x_wdt_pdata ls2k0300_wdt_pdata = {
> +	.timer_offset = 0x8,
> +	.set_offset = 0x4,
> +	.wdt_en_bit = BIT(1),
> +};
> +
>  struct ls1x_wdt_drvdata {
>  	void __iomem *base;
>  	struct clk *clk;
>  	unsigned long clk_rate;
>  	struct watchdog_device wdt;
> +	const struct ls1x_wdt_pdata *pdata;
>  };
>  
>  static int ls1x_wdt_ping(struct watchdog_device *wdt_dev)
>  {
>  	struct ls1x_wdt_drvdata *drvdata = watchdog_get_drvdata(wdt_dev);
>  
> -	writel(0x1, drvdata->base + WDT_SET);
> +	writel(0x1, drvdata->base + drvdata->pdata->set_offset);
>  
>  	return 0;
>  }
> @@ -53,7 +71,7 @@ static int ls1x_wdt_set_timeout(struct watchdog_device *wdt_dev,
>  	wdt_dev->timeout = timeout;
>  
>  	counts = drvdata->clk_rate * min(timeout, max_hw_heartbeat);
> -	writel(counts, drvdata->base + WDT_TIMER);
> +	writel(counts, drvdata->base + drvdata->pdata->timer_offset);
>  
>  	return 0;
>  }
> @@ -62,7 +80,7 @@ static int ls1x_wdt_start(struct watchdog_device *wdt_dev)
>  {
>  	struct ls1x_wdt_drvdata *drvdata = watchdog_get_drvdata(wdt_dev);
>  
> -	writel(0x1, drvdata->base + WDT_EN);
> +	writel(drvdata->pdata->wdt_en_bit, drvdata->base + WDT_EN);
>  
>  	return 0;
>  }
> @@ -70,8 +88,10 @@ static int ls1x_wdt_start(struct watchdog_device *wdt_dev)
>  static int ls1x_wdt_stop(struct watchdog_device *wdt_dev)
>  {
>  	struct ls1x_wdt_drvdata *drvdata = watchdog_get_drvdata(wdt_dev);
> +	u32 val = readl(drvdata->base + WDT_EN);
>  
> -	writel(0x0, drvdata->base + WDT_EN);
> +	val &= ~(drvdata->pdata->wdt_en_bit);
> +	writel(val, drvdata->base + WDT_EN);
>  
>  	return 0;
>  }
> @@ -81,9 +101,9 @@ static int ls1x_wdt_restart(struct watchdog_device *wdt_dev,
>  {
>  	struct ls1x_wdt_drvdata *drvdata = watchdog_get_drvdata(wdt_dev);
>  
> -	writel(0x1, drvdata->base + WDT_EN);
> -	writel(0x1, drvdata->base + WDT_TIMER);
> -	writel(0x1, drvdata->base + WDT_SET);
> +	writel(drvdata->pdata->wdt_en_bit, drvdata->base + WDT_EN);
> +	writel(0x1, drvdata->base + drvdata->pdata->timer_offset);
> +	writel(0x1, drvdata->base + drvdata->pdata->set_offset);
>  
>  	return 0;
>  }
> @@ -114,6 +134,8 @@ static int ls1x_wdt_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  	platform_set_drvdata(pdev, drvdata);
>  
> +	drvdata->pdata = of_device_get_match_data(dev);
> +
>  	drvdata->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(drvdata->base))
>  		return PTR_ERR(drvdata->base);
> @@ -142,9 +164,32 @@ static int ls1x_wdt_probe(struct platform_device *pdev)
>  	return devm_watchdog_register_device(dev, &drvdata->wdt);
>  }
>  
> +static int ls1x_wdt_resume(struct device *dev)
> +{
> +	struct ls1x_wdt_drvdata *data = dev_get_drvdata(dev);
> +
> +	if (watchdog_active(&data->wdt))
> +		ls1x_wdt_start(&data->wdt);
> +
> +	return 0;
> +}
> +
> +static int ls1x_wdt_suspend(struct device *dev)
> +{
> +	struct ls1x_wdt_drvdata *data = dev_get_drvdata(dev);
> +
> +	if (watchdog_active(&data->wdt))
> +		ls1x_wdt_stop(&data->wdt);
> +
> +	return 0;
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(ls1x_wdt_pm_ops, ls1x_wdt_suspend, ls1x_wdt_resume);
> +
>  static const struct of_device_id ls1x_wdt_dt_ids[] = {
> -	{ .compatible = "loongson,ls1b-wdt", },
> -	{ .compatible = "loongson,ls1c-wdt", },
> +	{ .compatible = "loongson,ls1b-wdt", .data = &ls1b_wdt_pdata },
> +	{ .compatible = "loongson,ls1c-wdt", .data = &ls1b_wdt_pdata },
> +	{ .compatible = "loongson,ls2k0300-wdt", .data = &ls2k0300_wdt_pdata },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, ls1x_wdt_dt_ids);
> @@ -154,11 +199,13 @@ static struct platform_driver ls1x_wdt_driver = {
>  	.driver = {
>  		.name = "ls1x-wdt",
>  		.of_match_table = ls1x_wdt_dt_ids,
> +		.pm = pm_ptr(&ls1x_wdt_pm_ops),
>  	},
>  };
>  
>  module_platform_driver(ls1x_wdt_driver);
>  
>  MODULE_AUTHOR("Yang Ling <gnaygnil@gmail.com>");
> -MODULE_DESCRIPTION("Loongson1 Watchdog Driver");
> +MODULE_AUTHOR("Binbin Zhou <zhoubinbin@loongson.cn>");
> +MODULE_DESCRIPTION("Loongson Watchdog Driver");
>  MODULE_LICENSE("GPL");
> -- 
> 2.47.3
> 
