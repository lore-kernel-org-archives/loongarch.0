Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCA4146018
	for <loongarch@lists.linux.dev>; Mon, 22 Apr 2024 11:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713784109; cv=none; b=t5JXq9gG20MRgufb1yJpj7mJoFtH3XoeAWJYsCbiSvc1bYlrUV1WTquGyvRvZL1xINmsxAe/L/wD/M2unj3aUVdWVhUVs54ZROy5QC/qtToKGojtGbbz34L27lwfVq9yMs25pwCpW9Z2nwUwmA4425qtss/2zm7dP/ovN2zpcS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713784109; c=relaxed/simple;
	bh=/lNHrxKYsOwYaedBHzQo1LKJ2iIo5p1/CtKoAWRIO1c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NGwFGpVAd3x9T3uEwFSTSleeNlCoFq14jV7YX5h66MFVY15IcUrojk7q9/4gAkrv5ynfU9NDDCKQrDwNH99KMdUqGPDcI56hUBo2LjP4pfr/ZOK9k2GCkF/PfzndX0cdTJKJr/GmQz9da/0qLOrc4oRCI+mtkOylZEiFB32ixMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A5EGcofc; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A5EGcofc"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6153d85053aso31950717b3.0
        for <loongarch@lists.linux.dev>; Mon, 22 Apr 2024 04:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713784106; x=1714388906; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NyAAB1pDlieHRe7f/6wsZvwR1K5b7t7Z4SDL80JsHW4=;
        b=A5EGcofcnqvfqb4dtDYVYfzqTLoecGk1PBYq2Qv7e3a5jyVEd4nCyMQQXpl5zdtJMg
         pAre8o5ROyrDOrzbiaHUljd4sI93s7sR2aBOr7u3Ud7xpzQmDQN76qFTLG5t8j50PPTO
         3IJm3xLOCo98CRBDW9Ev8uCwkpyYE6aOqQySRAsAG+UEzSVgXEGyIR+MEXEGH3jCUfrn
         ZYpHLswahD6CR+kWDbgqDMX0IpQm+my7OXmMRqMTpYjnz2HeQ31fPhbUzt0PufTCy3n1
         taW7YB2Nd+5m0Djy4Un0xcScXzU41+e/P1AQ3Vix5ZVX2XyoWeOzI0rCpkNeBQxJqNHg
         UDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713784106; x=1714388906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NyAAB1pDlieHRe7f/6wsZvwR1K5b7t7Z4SDL80JsHW4=;
        b=wE5pyyc9z5AkSZK0Jp8AHWvup8p0BC4SRdahMrcT0Ial9AFiUNb4vgMwWSZ6Dgl2bV
         2TmOel5kJU7ugBivlOqc8Yokt42PgkPs8jMFJruIRDcTUGDVnqqKkyaKy/dp07REPv3J
         cnCYACsexbxtB5gSfBSyGFPbiOhBq91sJwXq7NSYSwz1+aB+fc5spusROhpn0o5RTdgd
         udwCrlpbaxlpf2umvt0LLHMk6fPYmbHB41+OwezM5Rlbyyvz+bVZmPUoBW3658NGZ0tE
         V9CvFKmL/qr3Rp9YdZotDfQHTCS2f7KOsiDWEtBDnW0w8dxQvQj1VIASbudiUPeI7sRt
         aRGA==
X-Forwarded-Encrypted: i=1; AJvYcCXJIPDzZsHHknKse9O5sSV3St64F8veYufyanBzdANepIO/e42SoDCMOKJzpd46ZKGWt19FVwQyENgK22N913Q3L/DfaL1WuBGe
X-Gm-Message-State: AOJu0YzlisIv0/2KtdYyHxWZ8OT+ijH8Woil89vmA2gaocPZ7ssGqR+V
	HmG1RMTQF1LD+n1tLZZIJug7430oJRCJKeyBGI/8dCSGAhodsoz8KZ8UHIJ6TtGLEvnVfkUQ0l3
	ErMp0gp4rAlbYiHhSm/2vItImaUg=
X-Google-Smtp-Source: AGHT+IGMTCZtHucHj6ryBk5eZlKjV+kXpBDUUQ0ljLG2yz1diBUCEwGkzIoQzqKFmSE48QkPQ+1PInK1yKy50PbVRAI=
X-Received: by 2002:a05:690c:6684:b0:61a:cb67:9d0d with SMTP id
 hz4-20020a05690c668400b0061acb679d0dmr10483793ywb.22.1713784105857; Mon, 22
 Apr 2024 04:08:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1713509889.git.zhoubinbin@loongson.cn> <e3c9b6bdfe8624d90bcc16eefe92abd66bd3da12.1713509889.git.zhoubinbin@loongson.cn>
 <fc73c913-a6e5-418c-811c-57567a3115b8@linaro.org>
In-Reply-To: <fc73c913-a6e5-418c-811c-57567a3115b8@linaro.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Mon, 22 Apr 2024 19:08:15 +0800
Message-ID: <CAMpQs4JQq-umG9y0giwoa6mceeU7_Ltd2bSin=V1kY7-bbRcwA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] thermal: loongson2: Add Loongson-2K2000 support
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongson-kernel@lists.loongnix.cn, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, WANG Xuerui <git@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 22, 2024 at 6:42=E2=80=AFPM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
> On 20/04/2024 03:46, Binbin Zhou wrote:
> > The Loongson-2K2000 and Loongson-2K1000 have similar thermal sensors,
> > except that the temperature is read differently.
> >
> > In particular, the temperature output registers of the Loongson-2K2000
> > are defined in the chip configuration domain and are read in a differen=
t
> > way.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > Acked-by: Huacai Chen <chenhuacai@loongson.cn>
> > ---
> >   drivers/thermal/loongson2_thermal.c | 50 +++++++++++++++++++++++-----=
-
> >   1 file changed, 40 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/thermal/loongson2_thermal.c b/drivers/thermal/loon=
gson2_thermal.c
> > index 7de01fbea801..8ecd8ed465ec 100644
> > --- a/drivers/thermal/loongson2_thermal.c
> > +++ b/drivers/thermal/loongson2_thermal.c
> > @@ -30,12 +30,20 @@
> >                                        LOONGSON2_THSENS_INT_HIGH)
> >   #define LOONGSON2_THSENS_OUT_MASK   0xFF
> >
> > +/*
> > + * This flag is used to indicate the temperature reading
> > + * method of the Loongson-2K2000
> > + */
> > +#define LS2K2000_THSENS_OUT_FLAG     BIT(0)
> > +
> >   struct loongson2_thermal_chip_data {
> >       unsigned int thermal_sensor_sel;
> > +     unsigned int flags;
> >   };
> >
> >   struct loongson2_thermal_data {
> > -     void __iomem *regs;
> > +     void __iomem *ctrl_reg;
> > +     void __iomem *temp_reg;
> >       const struct loongson2_thermal_chip_data *chip_data;
> >   };
> >
> > @@ -48,7 +56,7 @@ static void loongson2_set_ctrl_regs(struct loongson2_=
thermal_data *data,
> >
> >       reg_ctrl =3D ctrl_data + HECTO;
> >       reg_ctrl |=3D enable ? 0x100 : 0;
> > -     writew(reg_ctrl, data->regs + ctrl_reg + reg_off);
> > +     writew(reg_ctrl, data->ctrl_reg + ctrl_reg + reg_off);
> >   }
> >
> >   static int loongson2_thermal_set(struct loongson2_thermal_data *data,
> > @@ -65,11 +73,16 @@ static int loongson2_thermal_set(struct loongson2_t=
hermal_data *data,
> >
> >   static int loongson2_thermal_get_temp(struct thermal_zone_device *tz,=
 int *temp)
> >   {
> > -     u32 reg_val;
> > +     int val;
> >       struct loongson2_thermal_data *data =3D thermal_zone_device_priv(=
tz);
> >
> > -     reg_val =3D readl(data->regs + LOONGSON2_THSENS_OUT_REG);
> > -     *temp =3D ((reg_val & LOONGSON2_THSENS_OUT_MASK) - HECTO) * KILO;
> > +     if (data->chip_data->flags) {
> > +             val =3D readl(data->temp_reg);
> > +             *temp =3D ((val & 0xffff) * 820 / 0x4000 - 311) * KILO;
> > +     } else {
> > +             val =3D readl(data->ctrl_reg + LOONGSON2_THSENS_OUT_REG);
> > +             *temp =3D ((val & LOONGSON2_THSENS_OUT_MASK) - HECTO) * K=
ILO;
> > +     }
>
> Why not use a different ops. That will keep the code cleaner for the
> next sensor versions.
>
> For example:
>
> static int loongson2_2k2000_get_temp(...)
> {
> }
>
> static int loongson2_2k1000_get_temp(...)
> {
> }
>
> static struct thermal_zone_device_ops loongson2_of_thermal_ops =3D {
>          .get_temp =3D loongson2_2k1000_get_temp,
>          .set_trips =3D loongson2_thermal_set_trips,
> };
>
>
> loongson2_thermal_probe
> {
>         ...
>
>         if (data->chip_data->flags & LS2K2000_THSENS_OUT_FLAG)
>                 loongson2_of_thermal_ops.get_temp =3D loongson2_2k2000_ge=
t_temp;
>         ...
>
> }

Hi Daniel:

Thanks for your advice.
I'll use a different ops to keep the code cleaner in the next version,

Thanks.
Binbin

>
> >       return 0;
> >   }
> > @@ -79,7 +92,7 @@ static irqreturn_t loongson2_thermal_irq_thread(int i=
rq, void *dev)
> >       struct thermal_zone_device *tzd =3D dev;
> >       struct loongson2_thermal_data *data =3D thermal_zone_device_priv(=
tzd);
> >
> > -     writeb(LOONGSON2_THSENS_INT_EN, data->regs + LOONGSON2_THSENS_STA=
TUS_REG);
> > +     writeb(LOONGSON2_THSENS_INT_EN, data->ctrl_reg + LOONGSON2_THSENS=
_STATUS_REG);
> >
> >       thermal_zone_device_update(tzd, THERMAL_EVENT_UNSPECIFIED);
> >
> > @@ -111,15 +124,22 @@ static int loongson2_thermal_probe(struct platfor=
m_device *pdev)
> >
> >       data->chip_data =3D device_get_match_data(dev);
> >
> > -     data->regs =3D devm_platform_ioremap_resource(pdev, 0);
> > -     if (IS_ERR(data->regs))
> > -             return PTR_ERR(data->regs);
> > +     data->ctrl_reg =3D devm_platform_ioremap_resource(pdev, 0);
> > +     if (IS_ERR(data->ctrl_reg))
> > +             return PTR_ERR(data->ctrl_reg);
> > +
> > +     /* The temperature output register is separate for Loongson-2K200=
0 */
> > +     if (data->chip_data->flags) {
> > +             data->temp_reg =3D devm_platform_ioremap_resource(pdev, 1=
);
> > +             if (IS_ERR(data->temp_reg))
> > +                     return PTR_ERR(data->temp_reg);
> > +     }
> >
> >       irq =3D platform_get_irq(pdev, 0);
> >       if (irq < 0)
> >               return irq;
> >
> > -     writeb(LOONGSON2_THSENS_INT_EN, data->regs + LOONGSON2_THSENS_STA=
TUS_REG);
> > +     writeb(LOONGSON2_THSENS_INT_EN, data->ctrl_reg + LOONGSON2_THSENS=
_STATUS_REG);
> >
> >       loongson2_thermal_set(data, 0, 0, false);
> >
> > @@ -146,6 +166,12 @@ static int loongson2_thermal_probe(struct platform=
_device *pdev)
> >
> >   static const struct loongson2_thermal_chip_data loongson2_thermal_ls2=
k1000_data =3D {
> >       .thermal_sensor_sel =3D 0,
> > +     .flags =3D 0,
> > +};
> > +
> > +static const struct loongson2_thermal_chip_data loongson2_thermal_ls2k=
2000_data =3D {
> > +     .thermal_sensor_sel =3D 0,
> > +     .flags =3D LS2K2000_THSENS_OUT_FLAG,
> >   };
> >
> >   static const struct of_device_id of_loongson2_thermal_match[] =3D {
> > @@ -153,6 +179,10 @@ static const struct of_device_id of_loongson2_ther=
mal_match[] =3D {
> >               .compatible =3D "loongson,ls2k1000-thermal",
> >               .data =3D &loongson2_thermal_ls2k1000_data,
> >       },
> > +     {
> > +             .compatible =3D "loongson,ls2k2000-thermal",
> > +             .data =3D &loongson2_thermal_ls2k2000_data,
> > +     },
> >       { /* end */ }
> >   };
> >   MODULE_DEVICE_TABLE(of, of_loongson2_thermal_match);
>
> --
> <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for AR=
M SoCs
>
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog
>
