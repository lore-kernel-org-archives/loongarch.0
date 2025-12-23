Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6085322FAFD
	for <loongarch@lists.linux.dev>; Tue, 23 Dec 2025 09:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766480787; cv=none; b=ta+H4+PfCuROvVthNvBIzXThwq74s2Acj+jTv5B7+pTtON96+T/cWNxKNiEB0Hq3ED3RYNPna96BtWD0TbnzH9GjHc/j/EH3u6vPhJICzyyRS61u6EoIuyuqgnSt4ILPd8zFCRTY6BulfMaYv3OQJwfs/N1iDDt/dLCdK5wSMV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766480787; c=relaxed/simple;
	bh=e4ELUNJG/H1rXoEc7+6tgON/8evFDIf9Rnxvrs/yfmg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hzbi4oRX6llPbk2ZlWcA/XGoHzo+G/TMhaIvuxlgfGrna/aUzcwZLar/0DhTlB0/455525rzLakZFI8q+hM7fxWloz0vgA8+WTKmD3P987Z10FA/hfL+/T9xgzN7VY+VmKaXt2eWDkLspWWxjP2Omu5hX+/mqH5NcmGrBRtWc24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YXQI/yMV; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YXQI/yMV"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b725ead5800so668004466b.1
        for <loongarch@lists.linux.dev>; Tue, 23 Dec 2025 01:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766480784; x=1767085584; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PcO7KM8DSIAXbK4kBHjpNqRrR826iMchYZvaKYP6ExE=;
        b=YXQI/yMVucvdF6IkDZs+4t/g/aGjPG2SOxeFsPQHrDsX33yZUMKlGolzCpsx3jKubg
         tJffcRT/DtvsyMe9d3WV8awKEcuIEhRaVaxEssPQn6VayTbPmDwaU6yUe10tOwfzGJ/G
         /lcRSZhDn6hzgvwn0FH5cQO5DI4QUeEYh13sj75OoXs0C+MorvB2qRYlIN9v1sL18w20
         7KN8ivmTzuHDgTGuONmI8WxlTqfCxHbAaiCFoe5kxNjEApudXqrhk655QbyH8dNPXafL
         bSIceoHFzwPdWVYY08aaN9P/QuiYmP6xqNX/RGNeizTsOy3VRgr8DY7OoPbtwsLjYiQO
         yskg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766480784; x=1767085584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PcO7KM8DSIAXbK4kBHjpNqRrR826iMchYZvaKYP6ExE=;
        b=uJPl29SBoxgLuW0OSNganL+qd64CuCbrroVTfFQxjITrmvrS1775l6l6tsRIa8zVJF
         l4GXUj7O8prsltCaa+CYltaDuD3zWwGGkG32PyGJgt/FGD5CwaX54HXp+Kd3fmcjQ93U
         Q+AeJ2btVI+nofOKsMrf91FFIMeBTD1qFwAEw03f0rP9mrGA4DHKUqLtMqZ8+8SGz7X9
         6qJaD3r378PZEBrsfMcwEGRA5HH9kNjbcGISz2ZcRfadwApkfyI/deyXXQrpDVqohSrU
         ELK+RKs5yN+p3RH8TRlJx8DhmhbhfjmloUv23LZWGWnUspl/wG4KYLmZb4gImSPDZ4tq
         ZEyg==
X-Forwarded-Encrypted: i=1; AJvYcCV/00GSU3BBAmHgYsWLBJwwBbbq3G6LNVgC+klo0wYLkXsn2G5d2gWnSavtedJONayhy+4Ke1sA/oc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6Tgc37xx80U3LPcjVRY7MHxut4APpjZ10l5prhx5k71DnBEgX
	yoFGWPaL9qVIJMgSeaDIliABd4ykXxDSWYXLu88mSzmgHy6qmpYdAfCyVTapWmu7oCL0QYxEMa4
	FJ9+AA5sVYM4sLGm7DQC40Nh0YMrKsO0=
X-Gm-Gg: AY/fxX6FUYzX6Dh7YhQujBARXSMtfjedHcnYCUuIXRHOG0zBeiCwMt5ZJAyMbyDEmlO
	bRJWSylMW4CbHxA8l+rHEEO5/gLCHdCkYFzrcQJ1tEVIFAmcak9BqdQePY1EWAFIRsJkuBqcaXJ
	orFE32Ek7UPesuf/NVCQ9czx5gshe1AzsI3J1a8xCF7objtFYW+RlENkDXVk/e3ydZdQOuKRrAE
	qe0p6g9x4YZAhRZBH2ARdUVTVaGWVU7mLNuwAOaQWDoJkBvuxQUHKYzMcIRDI/PAUNgB7jgyNii
	RLQcjw==
X-Google-Smtp-Source: AGHT+IFMFayOUEkIzcUgPVI7ZQmi3rUPQXYR0C65vtOT/zhUo8HOdbjzsQ82aiENsemJWN33WkI1+O2FNLjs2fJN3JI=
X-Received: by 2002:a17:907:724a:b0:b80:b7f:aa14 with SMTP id
 a640c23a62f3a-b80371d9ddemr1545543066b.32.1766480783355; Tue, 23 Dec 2025
 01:06:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1766471839.git.zhoubinbin@loongson.cn> <6e10c70653b32f1f79e3f98116924e1aad7154bf.1766471839.git.zhoubinbin@loongson.cn>
 <CAAhV-H5WfEhsV4fEzThR-C95cg0nPpJ+OfQ10NXEsFKneJQQ5A@mail.gmail.com>
In-Reply-To: <CAAhV-H5WfEhsV4fEzThR-C95cg0nPpJ+OfQ10NXEsFKneJQQ5A@mail.gmail.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 23 Dec 2025 17:06:09 +0800
X-Gm-Features: AQt7F2pWNeBlrKeCzwvzHQVPM5ZsHh7pzHwo24RT0fsTOcUxXeUUhfW2YT1QJvI
Message-ID: <CAMpQs4LMkq6BpsrnS+e+cvh2hJshO4=41vX4ETq+tkJEMZ7zdA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] rtc: loongson: Add Loongson-2K0300 support
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org, 
	Xiaochuang Mao <maoxiaochuan@loongson.cn>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-mips@vger.kernel.org, 
	Keguang Zhang <keguang.zhang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi:


On Tue, Dec 23, 2025 at 4:40=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> Hi, Binbin,
>
> On Tue, Dec 23, 2025 at 2:42=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.=
cn> wrote:
> >
> > The Loongson-2K0300's rtc hardware design is similar to that of the
> > Loongson-1B, but it does not support the alarm feature.
> >
> > Introduce `LOONGSON_RTC_ALARM_WORKAROUND`, which indicates a chip that
> > does not support the alarm function, and rewritethe related logic in
> > `loongson_rtc_alarm_setting()`
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  drivers/rtc/rtc-loongson.c | 65 ++++++++++++++++++++++++++------------
> >  1 file changed, 44 insertions(+), 21 deletions(-)
> >
> > diff --git a/drivers/rtc/rtc-loongson.c b/drivers/rtc/rtc-loongson.c
> > index 2ca7ffd5d7a9..6b076bd4e24e 100644
> > --- a/drivers/rtc/rtc-loongson.c
> > +++ b/drivers/rtc/rtc-loongson.c
> > @@ -67,6 +67,7 @@
> >   * Accessing the relevant registers will cause the system to hang.
> >   */
> >  #define LS1C_RTC_CTRL_WORKAROUND       BIT(0)
> > +#define LOONGSON_RTC_ALARM_WORKAROUND  BIT(1)
> Can we reuse existing logic, which means "alarm_irq =3D
> platform_get_irq(pdev, 0)" return 0 for LS2K0300?

First of all, as I understand it, platform_get_irq() doesn't normally
return 0 unless interrupt 0 is configured in the DTS, which doesn't
seem appropriate.

Also, the return value of platform_get_irq() was previously used to
determine if the alarm feature was supported, which is not
particularly accurate. It should be an inherent feature of the chip,
and I think it would be more appropriate to define it in
loongson_rtc_config.
>
> Huacai
>
> >
> >  struct loongson_rtc_config {
> >         u32 pm_offset;  /* Offset of PM domain, for RTC alarm wakeup */
> > @@ -89,7 +90,7 @@ static const struct loongson_rtc_config ls1b_rtc_conf=
ig =3D {
> >
> >  static const struct loongson_rtc_config ls1c_rtc_config =3D {
> >         .pm_offset =3D 0,
> > -       .flags =3D LS1C_RTC_CTRL_WORKAROUND,
> > +       .flags =3D LS1C_RTC_CTRL_WORKAROUND | LOONGSON_RTC_ALARM_WORKAR=
OUND,
> >  };
> >
> >  static const struct loongson_rtc_config generic_rtc_config =3D {
> > @@ -97,6 +98,11 @@ static const struct loongson_rtc_config generic_rtc_=
config =3D {
> >         .flags =3D 0,
> >  };
> >
> > +static const struct loongson_rtc_config ls2k0300_rtc_config =3D {
> > +       .pm_offset =3D 0x0,
> > +       .flags =3D LOONGSON_RTC_ALARM_WORKAROUND,
> > +};
> > +
> >  static const struct loongson_rtc_config ls2k1000_rtc_config =3D {
> >         .pm_offset =3D 0x800,
> >         .flags =3D 0,
> > @@ -299,9 +305,41 @@ static const struct rtc_class_ops loongson_rtc_ops=
 =3D {
> >         .alarm_irq_enable =3D loongson_rtc_alarm_irq_enable,
> >  };
> >
> > +static int loongson_rtc_alarm_setting(struct platform_device *pdev, vo=
id __iomem *regs)
> > +{
> > +       int ret =3D 0, alarm_irq;
> > +       struct device *dev =3D &pdev->dev;
> > +       struct loongson_rtc_priv *priv =3D dev_get_drvdata(dev);
> > +
> > +       if (priv->config->flags & LOONGSON_RTC_ALARM_WORKAROUND) {
> > +               /* Loongson-1C/Loongson-2K0300 RTC does not support ala=
rm */
> > +               clear_bit(RTC_FEATURE_ALARM, priv->rtcdev->features);
> > +               return 0;
> > +       }
> > +
> > +       /* Get RTC alarm irq */
> > +       alarm_irq =3D platform_get_irq(pdev, 0);
> > +       if (alarm_irq < 0)
> > +               return alarm_irq;
> > +
> > +       ret =3D devm_request_irq(dev, alarm_irq, loongson_rtc_isr, 0, "=
loongson-alarm",
> > +                              priv);
> > +       if (ret < 0)
> > +               return ret;
> > +
> > +       priv->pm_base =3D regs - priv->config->pm_offset;
> > +       device_init_wakeup(dev, true);
> > +
> > +       if (has_acpi_companion(dev))
> > +               acpi_install_fixed_event_handler(ACPI_EVENT_RTC,
> > +                                                loongson_rtc_handler, =
priv);
> > +
> > +       return ret;
> > +}
> > +
> >  static int loongson_rtc_probe(struct platform_device *pdev)
> >  {
> > -       int ret, alarm_irq;
> > +       int ret;
> >         void __iomem *regs;
> >         struct loongson_rtc_priv *priv;
> >         struct device *dev =3D &pdev->dev;
> > @@ -330,25 +368,9 @@ static int loongson_rtc_probe(struct platform_devi=
ce *pdev)
> >                 return dev_err_probe(dev, PTR_ERR(priv->rtcdev),
> >                                      "devm_rtc_allocate_device failed\n=
");
> >
> > -       /* Get RTC alarm irq */
> > -       alarm_irq =3D platform_get_irq(pdev, 0);
> > -       if (alarm_irq > 0) {
> > -               ret =3D devm_request_irq(dev, alarm_irq, loongson_rtc_i=
sr,
> > -                                      0, "loongson-alarm", priv);
> > -               if (ret < 0)
> > -                       return dev_err_probe(dev, ret, "Unable to reque=
st irq %d\n",
> > -                                            alarm_irq);
> > -
> > -               priv->pm_base =3D regs - priv->config->pm_offset;
> > -               device_init_wakeup(dev, true);
> > -
> > -               if (has_acpi_companion(dev))
> > -                       acpi_install_fixed_event_handler(ACPI_EVENT_RTC=
,
> > -                                                        loongson_rtc_h=
andler, priv);
> > -       } else {
> > -               /* Loongson-1C RTC does not support alarm */
> > -               clear_bit(RTC_FEATURE_ALARM, priv->rtcdev->features);
> > -       }
> > +       ret =3D loongson_rtc_alarm_setting(pdev, regs);
> > +       if (ret)
> > +               return ret;
> >
> >         /* Loongson RTC does not support UIE */
> >         clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, priv->rtcdev->features)=
;
> > @@ -379,6 +401,7 @@ static const struct of_device_id loongson_rtc_of_ma=
tch[] =3D {
> >         { .compatible =3D "loongson,ls1b-rtc", .data =3D &ls1b_rtc_conf=
ig },
> >         { .compatible =3D "loongson,ls1c-rtc", .data =3D &ls1c_rtc_conf=
ig },
> >         { .compatible =3D "loongson,ls7a-rtc", .data =3D &generic_rtc_c=
onfig },
> > +       { .compatible =3D "loongson,ls2k0300-rtc", .data =3D &ls2k0300_=
rtc_config },
> >         { .compatible =3D "loongson,ls2k1000-rtc", .data =3D &ls2k1000_=
rtc_config },
> >         { /* sentinel */ }
> >  };
> > --
> > 2.47.3
> >
> >

--
Thanks.
Binbin
