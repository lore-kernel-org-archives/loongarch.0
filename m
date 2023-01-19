Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E1717CD
	for <loongarch@lists.linux.dev>; Thu, 19 Jan 2023 12:44:13 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id rl14so2005769ejb.2
        for <loongarch@lists.linux.dev>; Thu, 19 Jan 2023 04:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YWR9OlP03r7QcJTROY9XweEp/odJNTYRZKCcANso/mU=;
        b=pbtkyFp7ZtDm+X8xuDJqBgdFYBgp1Bw/NdO5g5FfOl4kknZn/sGQw1wimziY9bYjbV
         8uxGfTHJPfMf6e3D9n2oHWBOyw7qocZPqnv5WdyDRikMqs9nHbmNi87b5FlatKNYnulA
         msKY4jV2P1gVR7cAu8500mBqVRQF3YkBmiQs2fqskH5oOSwspli/2IVyWqcVL4YSiUyK
         rg+tswGzyQhnNELBgVo05C9hE1CvgRaZvFhH/gRKWakqO/av0Xpp4aLBMjEnTGhxYPss
         q5j1sTJCYHJZcX/gcnsqkS2zz2D+UtuQWE4v24Jy3PrXvlAsQtf/bYSPp/q46mswgp51
         ZDEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YWR9OlP03r7QcJTROY9XweEp/odJNTYRZKCcANso/mU=;
        b=wipSgS+me30wFUP0lr/XW9EZw4gekgb/sz11TZNTI5xWqvPAwvHmnRUa8hRCTjljWD
         53WkHF612nPzWbAd4xYrMfEciNVMr4++We+eCJzZPhD6UIe4Oil/hDvWmmGKFOHNJOiu
         wsw6GhMgc/sIrLQ39evYnHFe+FTuOWAiJaaUUGOHhmTjUplPHhBU4QOn2HlxIdu5zqNJ
         fkHcq+ZiVyh8ERdulm0E8b86raaaMR/69h4daQgIVkq4IPSuFilgLS3HbZJtrmdrDfKF
         gqTv3vXfdJcHvLjFNRlKXZuefD/3U3w8c96aS465IRGM/DZdlEhrR0h6mWsfdJCwUbRk
         /Y2Q==
X-Gm-Message-State: AFqh2kqCRalQzzDhxYDAq1VtopWEQONGOpEM3VKd5Nr9bX8E/3Eak+rb
	m01NJ55gDJ3p0d9FdQp7/G6Cw/CJkmhy1FTCBxo=
X-Google-Smtp-Source: AMrXdXsgFbI8xlO3RYYSbd3nxdAZ9bU1GFE9fNtRH8787zHz7V+RCRNvtkaN5CwqR1WER8a6JDEcrs/dNTOJ1pHAWu0=
X-Received: by 2002:a17:906:25c5:b0:86d:fa64:2941 with SMTP id
 n5-20020a17090625c500b0086dfa642941mr994344ejb.72.1674132251818; Thu, 19 Jan
 2023 04:44:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221207140643.1600743-1-chenhuacai@loongson.cn>
In-Reply-To: <20221207140643.1600743-1-chenhuacai@loongson.cn>
From: Huacai Chen <chenhuacai@gmail.com>
Date: Thu, 19 Jan 2023 20:44:00 +0800
Message-ID: <CAAhV-H7vt5b=ZScvKRRv1dWeqRbVU65aCdgdAaR0Jtw-tvZVyQ@mail.gmail.com>
Subject: Re: [PATCH] irqchip/loongson-liointc: Save/restore int_edge/int_pol
 registers during S3/S4
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Yingkun Meng <mengyingkun@loongson.cn>
Content-Type: text/plain; charset="UTF-8"

Just a gentle ping.

This patch was sent for the 6.2 cycle but seems too late, now I think
ping it to be reviewed for 6.3 is better than resend it.

On Wed, Dec 7, 2022 at 10:06 PM Huacai Chen <chenhuacai@loongson.cn> wrote:
>
> If int_edge/int_pol registers are configured to not be the default values, we
> should save/restore them during S3/S4.
>
> Signed-off-by: Yingkun Meng <mengyingkun@loongson.cn>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>  drivers/irqchip/irq-loongson-liointc.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/irqchip/irq-loongson-liointc.c b/drivers/irqchip/irq-loongson-liointc.c
> index c116f70929ae..4367ce9b558f 100644
> --- a/drivers/irqchip/irq-loongson-liointc.c
> +++ b/drivers/irqchip/irq-loongson-liointc.c
> @@ -55,6 +55,8 @@ struct liointc_priv {
>         struct liointc_handler_data     handler[LIOINTC_NUM_PARENT];
>         void __iomem                    *core_isr[LIOINTC_NUM_CORES];
>         u8                              map_cache[LIOINTC_CHIP_IRQ];
> +       u32                             int_pol;
> +       u32                             int_edge;
>         bool                            has_lpc_irq_errata;
>  };
>
> @@ -138,6 +140,14 @@ static int liointc_set_type(struct irq_data *data, unsigned int type)
>         return 0;
>  }
>
> +static void liointc_suspend(struct irq_chip_generic *gc)
> +{
> +       struct liointc_priv *priv = gc->private;
> +
> +       priv->int_pol = readl(gc->reg_base + LIOINTC_REG_INTC_POL);
> +       priv->int_edge = readl(gc->reg_base + LIOINTC_REG_INTC_EDGE);
> +}
> +
>  static void liointc_resume(struct irq_chip_generic *gc)
>  {
>         struct liointc_priv *priv = gc->private;
> @@ -150,6 +160,8 @@ static void liointc_resume(struct irq_chip_generic *gc)
>         /* Restore map cache */
>         for (i = 0; i < LIOINTC_CHIP_IRQ; i++)
>                 writeb(priv->map_cache[i], gc->reg_base + i);
> +       writel(priv->int_pol, gc->reg_base + LIOINTC_REG_INTC_POL);
> +       writel(priv->int_edge, gc->reg_base + LIOINTC_REG_INTC_EDGE);
>         /* Restore mask cache */
>         writel(gc->mask_cache, gc->reg_base + LIOINTC_REG_INTC_ENABLE);
>         irq_gc_unlock_irqrestore(gc, flags);
> @@ -261,6 +273,7 @@ static int liointc_init(phys_addr_t addr, unsigned long size, int revision,
>         gc->private = priv;
>         gc->reg_base = base;
>         gc->domain = domain;
> +       gc->suspend = liointc_suspend;
>         gc->resume = liointc_resume;
>
>         ct = gc->chip_types;
> --
> 2.31.1
>
