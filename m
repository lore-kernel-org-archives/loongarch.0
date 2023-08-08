Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C926537C
	for <loongarch@lists.linux.dev>; Tue,  8 Aug 2023 14:42:59 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-583b3939521so66161297b3.0
        for <loongarch@lists.linux.dev>; Tue, 08 Aug 2023 07:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691505778; x=1692110578;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hpGMNxDDvo9T1v6v+RkICvblRXd4nkGe288y9gyoNGg=;
        b=PedPSrSpmrUdDKDIWni1uzt9dOQEhkcJXBt03X8fOj8cA2I4oXdOk+/JR/O646UVmn
         Lo/X0oO4bABVAJWVnLqejcHktzU+On5DUnRN/iEThDrLcHJV3B0NGtr+ETaFutgXAbQ4
         yKyW0CjQ6bvkIW1s7njggN4U9S/fRSlqNMsNWexb5Rq0mLeZhHV08LvHiNpJElZMW4Nf
         eKNMoOav0AcaSbUxc1BFJdgWmjbkN8GWNWCtvvge8QeFWOYe1taiElNa2rquEuALXsRU
         OsLNRtxErDGr7eXnxZD1YoZ+N6ifYV05DAuWRZT8zk+mvOdmdS1/IzXioS+NgKUNcXvK
         ZUOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691505778; x=1692110578;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hpGMNxDDvo9T1v6v+RkICvblRXd4nkGe288y9gyoNGg=;
        b=kNJenxHlD/alXmQvIgP7xcnHqr3GWcp/0HgLzsX4wk7ofAdcawfYwpP268eQGZ0/iM
         z0jFgneJa/Xnq8rGSjOOuvbaxZb6rUl95Aqu+0rl7bN26E2OCqHqQoiksLLwN4LgYUdj
         hV1j1v41zul66WXzfn9HA1b8i8Zm7Bqq/zHDXb2Zvq+841+ZYbJr/Mu4tJ64kQKshPvr
         0htiSRD9yLlr6eR9mqn/PUENMouS+prNhnbOZONK0eX4sk6qwJm21WNeKvJOz23TxEDm
         D/B0n9hREJOkGhXQTdMsSxguIWo4nu+uIOT19CY9zRMHjxh4G2wYyzPapCHnuDlhOaiI
         v7hg==
X-Gm-Message-State: AOJu0Yw7Bzy70t0M1JCMWvk1UqXOMkMZVjuyZJKok1Ef1gsdn4UPgSV/
	6imKvhD1OUMI/X5X22ER8HdPbOZ0vA3WBw5owucYmg==
X-Google-Smtp-Source: AGHT+IEQ0B+zFHwu6lwq9ShhqNgqoAUPtqEjQdph6xX3V3JEjoRX0Qpcb7z9XgUddzrDP+CIGW7eIVIsmdM1+EjIYR4=
X-Received: by 2002:a25:df82:0:b0:d47:4ed4:43eb with SMTP id
 w124-20020a25df82000000b00d474ed443ebmr10840010ybg.63.1691505778468; Tue, 08
 Aug 2023 07:42:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230803063703.5659-1-zhuyinbo@loongson.cn> <20230803063703.5659-3-zhuyinbo@loongson.cn>
 <4fef9725-7aea-43fb-b8ef-d20a4c6d9a68@app.fastmail.com>
In-Reply-To: <4fef9725-7aea-43fb-b8ef-d20a4c6d9a68@app.fastmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 8 Aug 2023 16:42:22 +0200
Message-ID: <CAPDyKFo7p=aEWWrW2OGbhN1tFjHanpqjLApzCMipdPSzE+NknQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] soc: loongson2_pm: add power management support
To: Arnd Bergmann <arnd@arndb.de>
Cc: Yinbo Zhu <zhuyinbo@loongson.cn>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, soc@kernel.org, 
	Jianmin Lv <lvjianmin@loongson.cn>, wanghongliang@loongson.cn, 
	Liu Peibao <liupeibao@loongson.cn>, loongson-kernel@lists.loongnix.cn, 
	loongarch@lists.linux.dev, Liu Yun <liuyun@loongson.cn>
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Aug 2023 at 09:03, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Aug 3, 2023, at 08:37, Yinbo Zhu wrote:
> > The Loongson-2's power management controller was ACPI, supports ACPI
> > S2Idle (Suspend To Idle), ACPI S3 (Suspend To RAM), ACPI S4 (Suspend To
> > Disk), ACPI S5 (Soft Shutdown) and supports multiple wake-up methods
> > (USB, GMAC, PWRBTN, etc.). This driver was to add power management
> > controller support that base on dts for Loongson-2 series SoCs.
> >
> > Co-developed-by: Liu Yun <liuyun@loongson.cn>
> > Signed-off-by: Liu Yun <liuyun@loongson.cn>
> > Co-developed-by: Liu Peibao <liupeibao@loongson.cn>
> > Signed-off-by: Liu Peibao <liupeibao@loongson.cn>
> > Cc: soc@kernel.org
> > Cc: Ulf Hansson <ulf.hansson@linaro.org>
> > Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
>
> I'm still waiting for Ulf to take a look here to see whether
> this should be in drivers/genpd instead, but he might still
> be on vacation.

I don't think this belongs in drivers/genpd/ as it's not a genpd
provider. Besides that, no further comments from me at this point.

Kind regards
Uffe

>
> A few minor comments from me in the meantime:
>
> > +#define loongson2_pm_readw(reg)              readw(loongson2_pm.base + reg)
> > +#define loongson2_pm_readl(reg)              readl(loongson2_pm.base + reg)
> > +#define loongson2_pm_writew(val, reg)        writew(val, loongson2_pm.base +
> > reg)
> > +#define loongson2_pm_writel(val, reg)        writel(val, loongson2_pm.base +
> > reg)
>
> I would prefer these to be 'static inline' functions rather than
> macros, or you can just open-code them, as each macro is only
> used once at the moment.
>
> > +static irqreturn_t loongson2_pm_irq_handler(int irq, void *dev_id)
> > +{
> > +     u16 status = loongson2_pm_readw(LOONGSON2_PM1_STS_REG);
> > +
> > +     if (!loongson2_pm.suspended && (status & LOONGSON2_PM1_PWRBTN_STS)) {
> > +             pr_info("Power Button pressed...\n");
>
> The message is probably more appropriate as a pr_debug() than
> pr_info().
>
> > +static int __maybe_unused loongson2_pm_suspend(struct device *dev)
> > +{
> > +     loongson2_pm.suspended = true;
> > +
> > +     return 0;
> > +}
> > +
> > +static int __maybe_unused loongson2_pm_resume(struct device *dev)
> > +{
> > +     loongson2_pm.suspended = false;
> > +
> > +     return 0;
> > +}
> > +static SIMPLE_DEV_PM_OPS(loongson2_pm_ops, loongson2_pm_suspend,
> > loongson2_pm_resume);
>
> Please change this to DEFINE_SIMPLE_DEV_PM_OPS() and remove the
> __maybe_unused, this is what all drivers should have these days.
>
> > +
> > +static int loongson2_pm_probe(struct platform_device *pdev)
> > +{
> > +     int irq, retval;
> > +     u64 suspend_addr;
> > +     struct device *dev = &pdev->dev;
> > +
> > +     loongson2_pm.base = devm_platform_ioremap_resource(pdev, 0);
> > +     if (IS_ERR(loongson2_pm.base))
> > +             return PTR_ERR(loongson2_pm.base);
> > +
> > +     irq = platform_get_irq(pdev, 0);
> > +     if (irq < 0)
> > +             return irq;
> > +
> > +     if (!device_property_read_u64(dev, "loongson,suspend-address",
> > &suspend_addr))
> > +             loongson_sysconf.suspend_addr = (u64)phys_to_virt(suspend_addr);
> > +     else
>
> Having a custom "loongson,suspend-address" property here feels wrong
> to me. Can't this be moved into the "regs" property that holds
> the other mmio registers?
>
>     Arnd
