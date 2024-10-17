Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4A81DD0DB
	for <loongarch@lists.linux.dev>; Thu, 17 Oct 2024 12:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729167889; cv=none; b=XeyFtvUIWZ+l7sgBYEiqQazDWSx6AwfyKQPJNKLH1rIKUM8e3627f/IgDAURMRWHF425Kz7+Q15z6H8fGvOSDs6BBYwtc67PyhpuRQ3nCtlC1w3fni8LOXrDjJbGRmjD27XFh51tT5ITohoQI9TORvj2TD71FP620IMuORT4dS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729167889; c=relaxed/simple;
	bh=+ha9lhf4m+aURqHyi7zbaMF45IM+NmE/aKN+P71l1So=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ce7If5bxnuZU0iob7vWfZ4ETe1D8olS+LY/q1v0HFK1WiG4uZa63rqKAkKAjrpeZaeBDHDsP5t27w1+jR4cjFTWpu9ttCcEUn4y9csPQ9G8wMW+XTS+wxDpVGCgPjUH/RIAsQX8L91L+iYNoOF4+7rPFSSR/p9HmuXzsFXo/r8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VKZ19d1Y; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VKZ19d1Y"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a99c0beaaa2so139615666b.1
        for <loongarch@lists.linux.dev>; Thu, 17 Oct 2024 05:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729167883; x=1729772683; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=79rFzREnRSXlDOkjq4NCF7f8Rp+vq+hVxwSVXYeKAXA=;
        b=VKZ19d1YYhsKWIbLyF9VlSYow72xxXt+3RGMbjw+tsu8C4Ex5eZ3UuQYahEJvquG49
         jkMb0ijghDDB682jctTud080INUw7EbWCInfiotx1g3ADIv5zcN4pSv/8a2q6sk7Dcr5
         Qv4DbfjNr+wRmO1Uz+EzoYzEDX5c4hDN8niY8gFJh9xKOtovxExT2x+rQg4mSnKL5opP
         ZTseOqehvsZKD/Lx8woAJTbiFT4l+da/jEfQqXH+Yg8qRmMoDnGd/PhgnFv3vgiU/fJt
         xNHY6SQ9/LAWoU3egF104Xub4VUuVAm6Y1B/40PaX7Y2JJP8QOeewPoXoxaoR0Gs2ecv
         oHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729167883; x=1729772683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=79rFzREnRSXlDOkjq4NCF7f8Rp+vq+hVxwSVXYeKAXA=;
        b=Az8SBsZnaIUjErPk43eaajaFhd/3D+CwFMhbwt8jX0fq9ouwych3NzQHzgw9fAJVYI
         KGyde8RJaRb0qp6Ror9oSL0b9pw3CDE5fN3HnE/K80gouZVm0/y23jI/WyMt9OlsClh2
         CUJYee8iQNGJ2o0nIxyOgwZ6LExp5NMxtwYoUJQsulwZyfAiKCXDx/b5xk3Pn/Rh6wjd
         MoV6hj5SRT04rhKs7Xg0j8cUfXHzNn6lEvDyW90495++QWknWZx0sKp6sKZBLJaUJU7h
         lVUBKtQ6ElHtXZla30AClVku3wRBA2ZNPT4N2m4T3n9K114TqwSPo5nU/E+vsTEvO00d
         5L9g==
X-Forwarded-Encrypted: i=1; AJvYcCUDJPIxjcpNo3k3tIUub99zqhtQKgMCLZPAWVpf/Ds3S109mlsbvWE7uOpB1E0KLuUa0hT6AzRerYk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8/onLpy+KOXk4HvZoFjZOk8zYNq/CXa5y2mFcEJPnCpQCDUBV
	fOc6JHzLdqVYFOJNub17VREmcnMEQLfq7AQdgotR3HPActvh70gg6ozcaa0fe44mh/rzLIdyAas
	a3HQmhooqgd/9oXzLTmF0pENuDXA=
X-Google-Smtp-Source: AGHT+IHqdJZ0NOrGsY3Xcl2fitMIXQD2mPu9W6YBOBaqDun99aT/Q2GzOO7mTMe/X0A9daAVXhx0H4T611ZOZaFxz1Q=
X-Received: by 2002:a17:907:a04:b0:a9a:55dd:9d3 with SMTP id
 a640c23a62f3a-a9a55dd1ab5mr203633866b.0.1729167882703; Thu, 17 Oct 2024
 05:24:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1728463622.git.zhoubinbin@loongson.cn> <aab9b84ca3ea7e37cc42ad1622724e8198b5b0ea.1728463622.git.zhoubinbin@loongson.cn>
 <Zw0desnWJ_Gl-mlU@gofer.mess.org>
In-Reply-To: <Zw0desnWJ_Gl-mlU@gofer.mess.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Thu, 17 Oct 2024 18:24:29 +0600
Message-ID: <CAMpQs4J4GFPkjLV0DHfQ+vti_zX3zU8ihShY2pPgfqhzjPectA@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] pwm: Add Loongson PWM controller support
To: Sean Young <sean@mess.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Juxin Gao <gaojuxin@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sean:

Thanks for your comment.

On Mon, Oct 14, 2024 at 7:32=E2=80=AFPM Sean Young <sean@mess.org> wrote:
>
> On Thu, Oct 10, 2024 at 04:30:26PM +0800, Binbin Zhou wrote:
> > This commit adds a generic PWM framework driver for the PWM controller
> > found on Loongson family chips.
> >
> > Co-developed-by: Juxin Gao <gaojuxin@loongson.cn>
> > Signed-off-by: Juxin Gao <gaojuxin@loongson.cn>
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > Acked-by: Huacai Chen <chenhuacai@loongson.cn>
> > ---
> >  MAINTAINERS                |   1 +
> >  drivers/pwm/Kconfig        |  12 ++
> >  drivers/pwm/Makefile       |   1 +
> >  drivers/pwm/pwm-loongson.c | 287 +++++++++++++++++++++++++++++++++++++
> >  4 files changed, 301 insertions(+)
> >  create mode 100644 drivers/pwm/pwm-loongson.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 18d2c65c744f..9d033799c6ec 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -13388,6 +13388,7 @@ M:    Binbin Zhou <zhoubinbin@loongson.cn>
> >  L:   linux-pwm@vger.kernel.org
> >  S:   Maintained
> >  F:   Documentation/devicetree/bindings/pwm/loongson,ls7a-pwm.yaml
> > +F:   drivers/pwm/pwm-loongson.c
> >
> >  LOONGSON-2 SOC SERIES CLOCK DRIVER
> >  M:   Yinbo Zhu <zhuyinbo@loongson.cn>
> > diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
> > index 0915c1e7df16..ef02a44d83a7 100644
> > --- a/drivers/pwm/Kconfig
> > +++ b/drivers/pwm/Kconfig
> > @@ -351,6 +351,18 @@ config PWM_KEEMBAY
> >         To compile this driver as a module, choose M here: the module
> >         will be called pwm-keembay.
> >
> > +config PWM_LOONGSON
> > +     tristate "Loongson PWM support"
> > +     depends on MACH_LOONGSON64 || COMPILE_TEST
> > +     depends on COMMON_CLK
> > +     help
> > +       Generic PWM framework driver for Loongson family.
> > +       It can be found on Loongson-2K series cpus and Loongson LS7A
> > +       bridge chips.
> > +
> > +       To compile this driver as a module, choose M here: the module
> > +       will be called pwm-loongson.
> > +
> >  config PWM_LP3943
> >       tristate "TI/National Semiconductor LP3943 PWM support"
> >       depends on MFD_LP3943
> > diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
> > index 9081e0c0e9e0..7c18c9be419f 100644
> > --- a/drivers/pwm/Makefile
> > +++ b/drivers/pwm/Makefile
> > @@ -30,6 +30,7 @@ obj-$(CONFIG_PWM_INTEL_LGM) +=3D pwm-intel-lgm.o
> >  obj-$(CONFIG_PWM_IQS620A)    +=3D pwm-iqs620a.o
> >  obj-$(CONFIG_PWM_JZ4740)     +=3D pwm-jz4740.o
> >  obj-$(CONFIG_PWM_KEEMBAY)    +=3D pwm-keembay.o
> > +obj-$(CONFIG_PWM_LOONGSON)   +=3D pwm-loongson.o
> >  obj-$(CONFIG_PWM_LP3943)     +=3D pwm-lp3943.o
> >  obj-$(CONFIG_PWM_LPC18XX_SCT)        +=3D pwm-lpc18xx-sct.o
> >  obj-$(CONFIG_PWM_LPC32XX)    +=3D pwm-lpc32xx.o
> > diff --git a/drivers/pwm/pwm-loongson.c b/drivers/pwm/pwm-loongson.c
> > new file mode 100644
> > index 000000000000..cdd320ed3060
> > --- /dev/null
> > +++ b/drivers/pwm/pwm-loongson.c
> > @@ -0,0 +1,287 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2017-2024 Loongson Technology Corporation Limited.
> > + *
> > + * Loongson PWM driver
> > + *
> > + * For Loongson's PWM IP block documentation please refer Chapter 11 o=
f
> > + * Reference Manual: https://loongson.github.io/LoongArch-Documentatio=
n/Loongson-7A1000-usermanual-EN.pdf
> > + *
> > + * Author: Juxin Gao <gaojuxin@loongson.cn>
> > + * Further cleanup and restructuring by:
> > + *         Binbin Zhou <zhoubinbin@loongson.cn>
> > + *
> > + * Limitations:
> > + * - The buffer register value should be written before the CTRL regis=
ter.
> > + * - When disabled the output is driven to 0 independent of the config=
ured
> > + *   polarity.
> > + */
> > +
> > +#include <linux/acpi.h>
> > +#include <linux/clk.h>
> > +#include <linux/device.h>
> > +#include <linux/init.h>
> > +#include <linux/io.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pwm.h>
> > +#include <linux/units.h>
> > +
> > +/* Loongson PWM registers */
> > +#define LOONGSON_PWM_REG_DUTY                0x4 /* Low Pulse Buffer R=
egister */
> > +#define LOONGSON_PWM_REG_PERIOD              0x8 /* Pulse Period Buffe=
r Register */
> > +#define LOONGSON_PWM_REG_CTRL                0xc /* Control Register *=
/
> > +
> > +/* Control register bits */
> > +#define LOONGSON_PWM_CTRL_EN         BIT(0)  /* Counter Enable Bit */
> > +#define LOONGSON_PWM_CTRL_OE         BIT(3)  /* Pulse Output Enable Co=
ntrol Bit, Valid Low */
> > +#define LOONGSON_PWM_CTRL_SINGLE     BIT(4)  /* Single Pulse Control B=
it */
> > +#define LOONGSON_PWM_CTRL_INTE               BIT(5)  /* Interrupt Enab=
le Bit */
> > +#define LOONGSON_PWM_CTRL_INT                BIT(6)  /* Interrupt Bit =
*/
> > +#define LOONGSON_PWM_CTRL_RST                BIT(7)  /* Counter Reset =
Bit */
> > +#define LOONGSON_PWM_CTRL_CAPTE              BIT(8)  /* Measurement Pu=
lse Enable Bit */
> > +#define LOONGSON_PWM_CTRL_INVERT     BIT(9)  /* Output flip-flop Enabl=
e Bit */
> > +#define LOONGSON_PWM_CTRL_DZONE              BIT(10) /* Anti-dead Zone=
 Enable Bit */
> > +
> > +#define LOONGSON_PWM_FREQ_STD                (50 * HZ_PER_KHZ)
> > +
> > +struct pwm_loongson_suspend_store {
> > +     u32 ctrl;
> > +     u32 duty;
> > +     u32 period;
> > +};
> > +
> > +struct pwm_loongson_ddata {
> > +     struct clk *clk;
> > +     void __iomem *base;
> > +     u64 clk_rate;
> > +     struct pwm_loongson_suspend_store lss;
> > +};
> > +
> > +static inline struct pwm_loongson_ddata *to_pwm_loongson_ddata(struct =
pwm_chip *chip)
> > +{
> > +     return pwmchip_get_drvdata(chip);
> > +}
> > +
> > +static inline u32 pwm_loongson_readl(struct pwm_loongson_ddata *ddata,=
 u32 offset)
> > +{
> > +     return readl(ddata->base + offset);
> > +}
> > +
> > +static inline void pwm_loongson_writel(struct pwm_loongson_ddata *ddat=
a,
> > +                                    u32 val, u32 offset)
> > +{
> > +     writel(val, ddata->base + offset);
> > +}
> > +
> > +static int pwm_loongson_set_polarity(struct pwm_chip *chip, struct pwm=
_device *pwm,
> > +                                  enum pwm_polarity polarity)
> > +{
> > +     u16 val;
> > +     struct pwm_loongson_ddata *ddata =3D to_pwm_loongson_ddata(chip);
> > +
> > +     val =3D pwm_loongson_readl(ddata, LOONGSON_PWM_REG_CTRL);
> > +
> > +     if (polarity =3D=3D PWM_POLARITY_INVERSED)
> > +             /* Duty cycle defines LOW period of PWM */
> > +             val |=3D LOONGSON_PWM_CTRL_INVERT;
> > +     else
> > +             /* Duty cycle defines HIGH period of PWM */
> > +             val &=3D ~LOONGSON_PWM_CTRL_INVERT;
> > +
> > +     pwm_loongson_writel(ddata, val, LOONGSON_PWM_REG_CTRL);
> > +
> > +     return 0;
> > +}
> > +
> > +static void pwm_loongson_disable(struct pwm_chip *chip, struct pwm_dev=
ice *pwm)
> > +{
> > +     u32 val;
> > +     struct pwm_loongson_ddata *ddata =3D to_pwm_loongson_ddata(chip);
> > +
> > +     val =3D pwm_loongson_readl(ddata, LOONGSON_PWM_REG_CTRL);
> > +     val &=3D ~LOONGSON_PWM_CTRL_EN;
> > +     pwm_loongson_writel(ddata, val, LOONGSON_PWM_REG_CTRL);
> > +}
> > +
> > +static int pwm_loongson_enable(struct pwm_chip *chip, struct pwm_devic=
e *pwm)
> > +{
> > +     u32 val;
> > +     struct pwm_loongson_ddata *ddata =3D to_pwm_loongson_ddata(chip);
> > +
> > +     val =3D pwm_loongson_readl(ddata, LOONGSON_PWM_REG_CTRL);
> > +     val |=3D LOONGSON_PWM_CTRL_EN;
> > +     pwm_loongson_writel(ddata, val, LOONGSON_PWM_REG_CTRL);
> > +
> > +     return 0;
> > +}
> > +
> > +static int pwm_loongson_config(struct pwm_chip *chip, struct pwm_devic=
e *pwm,
> > +                            u64 duty_ns, u64 period_ns)
> > +{
> > +     u32 duty, period;
> > +     struct pwm_loongson_ddata *ddata =3D to_pwm_loongson_ddata(chip);
> > +
> > +     /* duty =3D duty_ns * ddata->clk_rate / NSEC_PER_SEC */
> > +     duty =3D mul_u64_u64_div_u64(duty_ns, ddata->clk_rate, NSEC_PER_S=
EC);
> > +     pwm_loongson_writel(ddata, duty, LOONGSON_PWM_REG_DUTY);
> > +
> > +     /* period =3D period_ns * ddata->clk_rate / NSEC_PER_SEC */
> > +     period =3D mul_u64_u64_div_u64(period_ns, ddata->clk_rate, NSEC_P=
ER_SEC);
> > +     pwm_loongson_writel(ddata, period, LOONGSON_PWM_REG_PERIOD);
> > +
> > +     return 0;
> > +}
> > +
> > +static int pwm_loongson_apply(struct pwm_chip *chip, struct pwm_device=
 *pwm,
> > +                           const struct pwm_state *state)
> > +{
> > +     int ret;
> > +     u64 period, duty_cycle;
> > +     bool enabled =3D pwm->state.enabled;
> > +
> > +     if (!state->enabled) {
> > +             if (enabled)
> > +                     pwm_loongson_disable(chip, pwm);
> > +             return 0;
> > +     }
> > +
> > +     ret =3D pwm_loongson_set_polarity(chip, pwm, state->polarity);
> > +     if (ret)
> > +             return ret;
> > +
> > +     period =3D min(state->period, NANOHZ_PER_HZ);
> > +     duty_cycle =3D min(state->duty_cycle, NANOHZ_PER_HZ);
> > +
> > +     ret =3D pwm_loongson_config(chip, pwm, duty_cycle, period);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (!enabled && state->enabled)
> > +             ret =3D pwm_loongson_enable(chip, pwm);
> > +
> > +     return ret;
> > +}
> > +
> > +static int pwm_loongson_get_state(struct pwm_chip *chip, struct pwm_de=
vice *pwm,
> > +                               struct pwm_state *state)
> > +{
> > +     u32 duty, period, ctrl;
> > +     struct pwm_loongson_ddata *ddata =3D to_pwm_loongson_ddata(chip);
> > +
> > +     duty =3D pwm_loongson_readl(ddata, LOONGSON_PWM_REG_DUTY);
> > +     period =3D pwm_loongson_readl(ddata, LOONGSON_PWM_REG_PERIOD);
> > +     ctrl =3D pwm_loongson_readl(ddata, LOONGSON_PWM_REG_CTRL);
> > +
> > +     /* duty & period have a max of 2^32, so we can't overflow */
> > +     state->duty_cycle =3D DIV64_U64_ROUND_UP((u64)duty * NSEC_PER_SEC=
, ddata->clk_rate);
> > +     state->period =3D DIV64_U64_ROUND_UP((u64)period * NSEC_PER_SEC, =
ddata->clk_rate);
> > +     state->polarity =3D (ctrl & LOONGSON_PWM_CTRL_INVERT) ? PWM_POLAR=
ITY_INVERSED :
> > +                       PWM_POLARITY_NORMAL;
> > +     state->enabled =3D (ctrl & LOONGSON_PWM_CTRL_EN) ? true : false;
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct pwm_ops pwm_loongson_ops =3D {
> > +     .apply =3D pwm_loongson_apply,
> > +     .get_state =3D pwm_loongson_get_state,
> > +};
> > +
> > +static int pwm_loongson_probe(struct platform_device *pdev)
> > +{
> > +     int ret;
> > +     struct pwm_chip *chip;
> > +     struct pwm_loongson_ddata *ddata;
> > +     struct device *dev =3D &pdev->dev;
> > +
> > +     chip =3D devm_pwmchip_alloc(dev, 1, sizeof(*ddata));
> > +     if (IS_ERR(chip))
> > +             return PTR_ERR(chip);
> > +     ddata =3D to_pwm_loongson_ddata(chip);
> > +
> > +     ddata->base =3D devm_platform_ioremap_resource(pdev, 0);
> > +     if (IS_ERR(ddata->base))
> > +             return PTR_ERR(ddata->base);
> > +
> > +     if (!has_acpi_companion(dev)) {
> > +             ddata->clk =3D devm_clk_get_enabled(dev, NULL);
> > +             if (IS_ERR(ddata->clk))
> > +                     return dev_err_probe(dev, PTR_ERR(ddata->clk),
> > +                                          "failed to get pwm clock\n")=
;
> > +             ddata->clk_rate =3D clk_get_rate(ddata->clk);
> > +     } else {
> > +             ddata->clk_rate =3D LOONGSON_PWM_FREQ_STD;
> > +     }
> > +
> > +     chip->ops =3D &pwm_loongson_ops;
>
> I think you can add here:
>
>         chip->atomic =3D true;
>
> As far as I can see, the driver does not do any sleeping operations
> in pwm_loongson_apply(). This probably should be tested with
> CONFIG_PWM_DEBUG and CONFIG_DEBUG_ATOMIC_SLEEP just to be sure.

I'm a bit confused.

With CONFIG_PWM_DEBUG and CONFIG_DEBUG_ATOMIC_SLEEP, I did some
suspend/resume tests, but there is no relevant error output, including
something like "BUG: sleeping function called from invalid context...
".

Does chip->atomic still need to be set?

Thanks.
Binbin
>
> Thanks,
> Sean
>
>
> > +     dev_set_drvdata(dev, chip);
> > +
> > +     ret =3D devm_pwmchip_add(dev, chip);
> > +     if (ret < 0)
> > +             return dev_err_probe(dev, ret, "failed to add PWM chip\n"=
);
> > +
> > +     return 0;
> > +}
> > +
> > +static int pwm_loongson_suspend(struct device *dev)
> > +{
> > +     struct pwm_chip *chip =3D dev_get_drvdata(dev);
> > +     struct pwm_loongson_ddata *ddata =3D to_pwm_loongson_ddata(chip);
> > +
> > +     ddata->lss.ctrl =3D pwm_loongson_readl(ddata, LOONGSON_PWM_REG_CT=
RL);
> > +     ddata->lss.duty =3D pwm_loongson_readl(ddata, LOONGSON_PWM_REG_DU=
TY);
> > +     ddata->lss.period =3D pwm_loongson_readl(ddata, LOONGSON_PWM_REG_=
PERIOD);
> > +
> > +     clk_disable_unprepare(ddata->clk);
> > +
> > +     return 0;
> > +}
> > +
> > +static int pwm_loongson_resume(struct device *dev)
> > +{
> > +     int ret;
> > +     struct pwm_chip *chip =3D dev_get_drvdata(dev);
> > +     struct pwm_loongson_ddata *ddata =3D to_pwm_loongson_ddata(chip);
> > +
> > +     ret =3D clk_prepare_enable(ddata->clk);
> > +     if (ret)
> > +             return ret;
> > +
> > +     pwm_loongson_writel(ddata, ddata->lss.ctrl, LOONGSON_PWM_REG_CTRL=
);
> > +     pwm_loongson_writel(ddata, ddata->lss.duty, LOONGSON_PWM_REG_DUTY=
);
> > +     pwm_loongson_writel(ddata, ddata->lss.period, LOONGSON_PWM_REG_PE=
RIOD);
> > +
> > +     return 0;
> > +}
> > +
> > +static DEFINE_SIMPLE_DEV_PM_OPS(pwm_loongson_pm_ops, pwm_loongson_susp=
end,
> > +                             pwm_loongson_resume);
> > +
> > +static const struct of_device_id pwm_loongson_of_ids[] =3D {
> > +     { .compatible =3D "loongson,ls7a-pwm" },
> > +     { /* sentinel */ },
> > +};
> > +MODULE_DEVICE_TABLE(of, pwm_loongson_of_ids);
> > +
> > +static const struct acpi_device_id pwm_loongson_acpi_ids[] =3D {
> > +     { "LOON0006" },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(acpi, pwm_loongson_acpi_ids);
> > +
> > +static struct platform_driver pwm_loongson_driver =3D {
> > +     .probe =3D pwm_loongson_probe,
> > +     .driver =3D {
> > +             .name =3D "loongson-pwm",
> > +             .pm =3D pm_ptr(&pwm_loongson_pm_ops),
> > +             .of_match_table =3D pwm_loongson_of_ids,
> > +             .acpi_match_table =3D pwm_loongson_acpi_ids,
> > +     },
> > +};
> > +module_platform_driver(pwm_loongson_driver);
> > +
> > +MODULE_DESCRIPTION("Loongson PWM driver");
> > +MODULE_AUTHOR("Loongson Technology Corporation Limited.");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.43.5
> >
