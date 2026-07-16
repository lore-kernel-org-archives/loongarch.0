Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0C813B584
	for <loongarch@lists.linux.dev>; Thu, 16 Jul 2026 02:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784169100; cv=pass; b=eGtXD0hN0WP5sPnKCXKykN+/s6uOpXJDOPhmfcDJLPvtF76Ndpgoea7+mWWIGH0PbHo9cfoM+dyQEhx0WhISFgDqyFohdyQWLtFt3G8+Q1ypgb2uSwCr8YRGROmz/1i5IhPgYbIBWU7xv3FVpi9/Z22BrGQfUabPqylphU1MCpI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784169100; c=relaxed/simple;
	bh=R12zT8nSn9I0UCnw+iJtdZou5moWo+Kod+zyFuStb+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cWcwzCL4YWFY8CLt6LdqeO4gcnlKgvvTBFD2XGMfv1dxV4LCiHW5IcV52Hc0sau8OB+Jc1SHBVhYJhoRniuMxzeZPajzGv/1bewOX0DVQJ3lJUNxiAl6WLGnaUi5Fw4vfrWdxErkM7yVv7XxgEJD5NXB59HN/SEl9fuDHZr360k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FpSsk+g5; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FpSsk+g5"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c167bda216fso229209566b.2
        for <loongarch@lists.linux.dev>; Wed, 15 Jul 2026 19:31:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784169097; cv=none;
        d=google.com; s=arc-20260327;
        b=KdRRSKIrkuCM0O77d1HWbrnBL35wm4RZmveUjwmS4RWG+8guiRPAgMzofrOvPmI7oU
         wHvSeDmVD1hQDONO8YbtncBo2tiSySFpMLWJCiRUqMUGsdRiE3bi6sPB6TVVW5Jd8FYS
         /yutt7+okK28+FJ5cNkRHXtqngGNT4GQhaYLnvq1ZugVFW4H/0VJa4igYcc4HUNIv5kX
         hl8iyIp9zBN7c9NcSUxCclr67hR+KTTcA2MkO8vupteTXHfHMkRIwP3Ljt3TN/j/u+GX
         QxXQOnGZzFJ2W4PdBjDdbxykwyaBSx66vuhULE0V86bNPlRCX/2pY0dpkyeYp3PqKobD
         gyzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q9RYbpoJ3iiaewLH/Dkbk54m1hisFAlN4vItAzmGB5U=;
        fh=AYB31CdIqMV3KY1Ywn2V9MAUsEYM+BvX/GpooIzcLIQ=;
        b=LC6sFoySvZhq/XJa5JgPZu4/HDU2+LUARkxXLwWjX0nocKeteWTVX6Sg51TbppOaQm
         CGhOeYpkAx8KipFSL6xAVteeuXNh8u8JCPUh+Rx2WYteFx8cyJhrWAyDXbOi8LtyReZz
         NnbAqsPw6CkEnl/R5MO0DRvzTiBeRTUDiA9Run2ucgGU2RrQFhuk2AFyaIKSON29sSpo
         ah2wjVSENGPDEl5OJWleJmHii8sBNWTa9EcDwLhlAH1j9VM52GsKh5mgEp+p3nWo3XXT
         EURJ7FilURDiQSOwuADjG9KkqpE9fDwp4vmUS1jZQjGCj3yG6wDCa3FjmMUFf31hR7Ve
         SgGg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784169097; x=1784773897; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q9RYbpoJ3iiaewLH/Dkbk54m1hisFAlN4vItAzmGB5U=;
        b=FpSsk+g5AonKlf5Gr6TViIFQa4+wBy5ZVRLI40QRJt8wPzgZlAK4mJ/HWxHPql9B3o
         Ih/bjXF0d2t8Xev2C+9xmjKi9Nz6RJNPBaiXjJ+u2WT9/xOx/0s7rQ7XNDr9TxS1kCU3
         puOMgr+6NllCZ7pcGta4pEjP8GH63o6CtTgfocGLCB/pL9p+fCE49hyHk21hLqO8GmCG
         tADE/vc6VPmwdEXSEQ/aKDw29CyWRDFD0F2TUjmsbIceo5qEi3dKQWNB9L9GywfQh189
         JTWLsBZYcNP3ro/aIZN4e2/Vw420LizxTbGaxYdn7tTDs7yl6IZa/bP9rNpgZD4zckeF
         akOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784169097; x=1784773897;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q9RYbpoJ3iiaewLH/Dkbk54m1hisFAlN4vItAzmGB5U=;
        b=FZnMKC1dXob8G4FdDRFQ0eCnlCSBiNa4JqxPt1AWTwE8Q81jgbN0fPamUL66VHY4o3
         EvmaCNu3rLe9/uAF4bzKKY21GSYp7eAtfhQNSkF/KGYa2MqNUvIk+aPE2+wWsDe+vxMH
         q3EhjJKT+ophSj+tWYRdGGyzDtV7HsL7BurRdcUqVdH3TsDPBdtq5/Rh5uXfhCAd1uvw
         7SowcHWsFNhYnH6OxIfr8XsCw2b8wJbxyq4PdMwgRamtmeJ1wNugZEcZqjp0QY/rBb3n
         N8AYA/9Pez0n811xzMSoE2zLDKACqS2tRB5IRyuQG01X+FEYUALP9C7XsPo5PdJogTj1
         HfeQ==
X-Forwarded-Encrypted: i=1; AHgh+RpKmPLwPZXWek3OKJzCvY+sTUyuadH1cL+rGCua/VX85+pY1OLTLuLrj3UuWnyegTsLmKmMHZk0pJU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxyGLTWUDMqWs2WEEF6Gq+/mPWZX0p75wbRJ75gUD+8IJziWC8R
	oVhTqK5p2Z1eKn69IGnAvjgV1rR6+WJ4nB8r2PbulADVoFqFjR9BGo/aPT6TZF4W2qAAU1kv6j3
	AuyX1ubjnv1eys5Zj8R3P/JorzyW3DR4=
X-Gm-Gg: AfdE7ckCNfQOUJ+ddxrgUHy+cGfb1DCN2KjH4s7dhekdU4mXOwAW7QKGacCuGT0EoXE
	AWbc7WR318u87l9Aam0OORN8BGztfL0Xnulfn0Emxu8F1peuff2zZXZSmtR8mKDMBCNvza1/u3L
	uxVJJ4o+dnDJ64VUtWCIJDziBwF3vUUdMxep8hRFf7Rj8oeB9F07EZT+GbmiV2Mgg3YFq4XY/GY
	4Sycn8fW9KS+jqBP4rsFETiM/JJhmVnToDem5Vz2NRHoaIqCtwr1PWGq4nHkxgy
X-Received: by 2002:a05:6938:a08e:20b0:c16:8931:245c with SMTP id
 a640c23a62f3a-c16893125d4mr103944966b.21.1784169096566; Wed, 15 Jul 2026
 19:31:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1783670011.git.zhoubinbin@loongson.cn> <e5a574b2ae0e5e0ec32fe81c0ccd03eb3ad5a164.1783670011.git.zhoubinbin@loongson.cn>
 <CAAhV-H6Ae=J9a6y6C9WE-sfUJnrypWpc8e01VHJ3ndVt-F+RXA@mail.gmail.com>
In-Reply-To: <CAAhV-H6Ae=J9a6y6C9WE-sfUJnrypWpc8e01VHJ3ndVt-F+RXA@mail.gmail.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Thu, 16 Jul 2026 10:31:23 +0800
X-Gm-Features: AUfX_mxc3FOZacVEQWuO-hOpQgpgQhvkeExldue96dEwy1_jdBhNox5YznqP9aE
Message-ID: <CAMpQs4JQTnP96akj9V8iHjnPSj10_zmv=0+0j-6RbUB304BF0w@mail.gmail.com>
Subject: Re: [PATCH 2/2] thermal/drivers/loongson2: Add thermal driver support
 for Loongson-2K0300
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi:

On Fri, Jul 10, 2026 at 10:32=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org=
> wrote:
>
> Hi, Binbin,
>
> On Fri, Jul 10, 2026 at 4:25=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.=
cn> wrote:
> >
> > The Loongson-2K0300 SoC uses a new thermal sensor that requires reading
> > a separate CPU ID register to obtain hardware version information. This
> > version info is used as a correction factor (fix_data) in the
> > temperature calculation formula.
> >
> > Its thermal sensor requires the following hardware-specific handling:
> >  - Read chip ID register (offset 0x0 and 0x4) to get the compensation
> >    value (comp_val). The value is stored in either bits [31:20] of the
> >    ID0 register or bits [15:0] of the ID1 register, depending on the
> >    EXTERN_ID bit.
> >
> >  - The compensation value is a signed 15-bit field; extract the value
> >    and apply sign accordingly.
> >
> > Additionally, some early Loongson-2K0300 chips may have an old fuse tha=
t
> > yields invalid temperature readings outside the -55 to 125 range. In
> > such cases, the driver falls back to a simplified formula (raw * 569 -
> > 394700) and logs a warning, ensuring the system can still function
> > without crashing.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  drivers/thermal/loongson2_thermal.c | 83 ++++++++++++++++++++++++++---
> >  1 file changed, 77 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/thermal/loongson2_thermal.c b/drivers/thermal/loon=
gson2_thermal.c
> > index ea4dd2fb1f47..a7eb87070aa9 100644
> > --- a/drivers/thermal/loongson2_thermal.c
> > +++ b/drivers/thermal/loongson2_thermal.c
> > @@ -2,9 +2,11 @@
> >  /*
> >   * Author: zhanghongchen <zhanghongchen@loongson.cn>
> >   *         Yinbo Zhu <zhuyinbo@loongson.cn>
> > - * Copyright (C) 2022-2023 Loongson Technology Corporation Limited
> > + *         Binbin Zhou <zhoubinbin@loongson.cn>
> > + * Copyright (C) 2022-2026 Loongson Technology Corporation Limited
> >   */
> >
> > +#include <linux/bitfield.h>
> >  #include <linux/interrupt.h>
> >  #include <linux/io.h>
> >  #include <linux/minmax.h>
> > @@ -23,27 +25,44 @@
> >  #define LOONGSON2_THSENS_CTRL_LOW_REG  0x8
> >  #define LOONGSON2_THSENS_STATUS_REG    0x10
> >  #define LOONGSON2_THSENS_OUT_REG       0x14
> > +#define LOONGSON2_THSENS_CFG_REG       0x18
> >
> >  #define LOONGSON2_THSENS_INT_LO                BIT(0)
> >  #define LOONGSON2_THSENS_INT_HIGH      BIT(1)
> >  #define LOONGSON2_THSENS_INT_EN                (LOONGSON2_THSENS_INT_L=
O | \
> >                                          LOONGSON2_THSENS_INT_HIGH)
> >  #define LOONGSON2_THSENS_OUT_MASK      0xFF
> > +#define LS2K0300_THSENS_OUT_MASK       GENMASK(10, 0)
> The naming is a little strange, maybe use LOONGSON2_THSENS_OUT_8B_MASK
> and LOONGSON2_THSENS_OUT_10B_MASK?
>
> > +
> > +#define LS2K0300_CHIP_ID1              0x4
> Also define LS2K0300_CHIP_ID0 here?
>
> > +#define LS2K0300_EXTERN_ID             BIT(4)
> > +#define LS2K0300_ID0_VAL_MASK          GENMASK(31, 20)
> > +#define LS2K0300_ID1_VAL_MASK          GENMASK(15, 0)
> > +
> > +#define LS2K0300_COMP_VAL_MASK         GENMASK(14, 0)
> > +#define LS2K0300_COMP_SIGN_BIT         BIT(15)
> > +
> > +#define LS2K0300_LOWEST_VALID_TEMP     (-55000)
> > +#define LS2K0300_HIGHEST_VALID_TEMP    (125000)
> >
> >  /*
> >   * This flag is used to indicate the temperature reading
> >   * method of the Loongson-2K2000
> >   */
> >  #define LS2K2000_THSENS_OUT_FLAG       BIT(0)
> > +#define LS2K0300_CHIP_ID_FLAG          BIT(1)
> >
> >  struct loongson2_thermal_chip_data {
> >         unsigned int thermal_sensor_sel;
> >         unsigned int flags;
> > +       const struct thermal_zone_device_ops *thermal_ops;
> >  };
> >
> >  struct loongson2_thermal_data {
> > +       struct device *dev;
> >         void __iomem *ctrl_reg;
> >         void __iomem *temp_reg;
> > +       void __iomem *id_reg;
> >         const struct loongson2_thermal_chip_data *chip_data;
> >  };
> >
> > @@ -71,6 +90,38 @@ static int loongson2_thermal_set(struct loongson2_th=
ermal_data *data,
> >         return 0;
> >  }
> >
> > +static int loongson2_2k0300_get_temp(struct thermal_zone_device *tz, i=
nt *temp)
> > +{
> > +       struct loongson2_thermal_data *tdata =3D thermal_zone_device_pr=
iv(tz);
> > +       int calib_data, calib_offset, temp_mc, raw_adc;
> > +       u32 chip_id0, chip_id1;
> > +
> > +       raw_adc =3D FIELD_GET(LS2K0300_THSENS_OUT_MASK,
> > +                           readl(tdata->ctrl_reg + LOONGSON2_THSENS_OU=
T_REG));
> > +       chip_id0 =3D readl(tdata->id_reg);
> > +       chip_id1 =3D readl(tdata->id_reg + LS2K0300_CHIP_ID1);
> > +
> > +       if (chip_id0 & LS2K0300_EXTERN_ID)
> > +               calib_data =3D FIELD_GET(LS2K0300_ID1_VAL_MASK, chip_id=
1);
> > +       else
> > +               calib_data =3D FIELD_GET(LS2K0300_ID0_VAL_MASK, chip_id=
0);
> > +
> > +       calib_offset =3D FIELD_GET(LS2K0300_COMP_VAL_MASK, calib_data);
> > +       if (calib_data & LS2K0300_COMP_SIGN_BIT)
> > +               calib_offset =3D -calib_offset;
> > +
> > +       temp_mc =3D (raw_adc + calib_offset) * 570 - 394700;
> > +
> > +       /* For old fuse which can not read right thermal data */
> > +       if (temp_mc < LS2K0300_LOWEST_VALID_TEMP || temp_mc > LS2K0300_=
HIGHEST_VALID_TEMP) {
> Is there a better way to detect the old fuse? Because I think temp_mc
> between LS2K0300_LOWEST_VALID_TEMP and  LS2K0300_HIGHEST_VALID_TEMP is
> also not valid for the old fuse.

Try communicating in person; there=E2=80=99s no better way. The current
judgment criteria can only accommodate the standard temperature range.

Also, the `old fuse` refers to the very first batch of chips, so I
don=E2=80=99t think the scope of the issue will be very broad.
>
> Huacai
>
> > +               dev_warn_once(tdata->dev, "It's an old fuse, thermal %d=
 is not right\n", temp_mc);
> > +               temp_mc =3D raw_adc * 569 - 394700;
> > +       }
> > +       *temp =3D temp_mc;
> > +
> > +       return 0;
> > +}
> > +
> >  static int loongson2_2k1000_get_temp(struct thermal_zone_device *tz, i=
nt *temp)
> >  {
> >         int val;
> > @@ -112,6 +163,11 @@ static int loongson2_thermal_set_trips(struct ther=
mal_zone_device *tz, int low,
> >         return loongson2_thermal_set(data, low/MILLI, high/MILLI, true)=
;
> >  }
> >
> > +static const struct thermal_zone_device_ops loongson2_2k0300_of_therma=
l_ops =3D {
> > +       .get_temp =3D loongson2_2k0300_get_temp,
> > +       .set_trips =3D loongson2_thermal_set_trips,
> > +};
> > +
> >  static const struct thermal_zone_device_ops loongson2_2k1000_of_therma=
l_ops =3D {
> >         .get_temp =3D loongson2_2k1000_get_temp,
> >         .set_trips =3D loongson2_thermal_set_trips,
> > @@ -124,7 +180,6 @@ static const struct thermal_zone_device_ops loongso=
n2_2k2000_of_thermal_ops =3D {
> >
> >  static int loongson2_thermal_probe(struct platform_device *pdev)
> >  {
> > -       const struct thermal_zone_device_ops *thermal_ops;
> >         struct device *dev =3D &pdev->dev;
> >         struct loongson2_thermal_data *data;
> >         struct thermal_zone_device *tzd;
> > @@ -134,6 +189,7 @@ static int loongson2_thermal_probe(struct platform_=
device *pdev)
> >         if (!data)
> >                 return -ENOMEM;
> >
> > +       data->dev =3D dev;
> >         data->chip_data =3D device_get_match_data(dev);
> >
> >         data->ctrl_reg =3D devm_platform_ioremap_resource(pdev, 0);
> > @@ -145,10 +201,13 @@ static int loongson2_thermal_probe(struct platfor=
m_device *pdev)
> >                 data->temp_reg =3D devm_platform_ioremap_resource(pdev,=
 1);
> >                 if (IS_ERR(data->temp_reg))
> >                         return PTR_ERR(data->temp_reg);
> > +       }
> >
> > -               thermal_ops =3D &loongson2_2k2000_of_thermal_ops;
> > -       } else {
> > -               thermal_ops =3D &loongson2_2k1000_of_thermal_ops;
> > +       /* The chip id register is needed for Loongson-2K0300 */
> > +       if (data->chip_data->flags & LS2K0300_CHIP_ID_FLAG) {
> > +               data->id_reg =3D devm_platform_ioremap_resource(pdev, 1=
);
> > +               if (IS_ERR(data->id_reg))
> > +                       return PTR_ERR(data->id_reg);
> >         }
> >
> >         irq =3D platform_get_irq(pdev, 0);
> > @@ -160,7 +219,7 @@ static int loongson2_thermal_probe(struct platform_=
device *pdev)
> >         loongson2_thermal_set(data, 0, 0, false);
> >
> >         for (i =3D 0; i <=3D LOONGSON2_MAX_SENSOR_SEL_NUM; i++) {
> > -               tzd =3D devm_thermal_of_zone_register(dev, i, data, the=
rmal_ops);
> > +               tzd =3D devm_thermal_of_zone_register(dev, i, data, dat=
a->chip_data->thermal_ops);
> >
> >                 if (!IS_ERR(tzd))
> >                         break;
> > @@ -181,17 +240,29 @@ static int loongson2_thermal_probe(struct platfor=
m_device *pdev)
> >         return 0;
> >  }
> >
> > +static const struct loongson2_thermal_chip_data loongson2_thermal_ls2k=
0300_data =3D {
> > +       .thermal_sensor_sel =3D 0,
> > +       .flags =3D LS2K0300_CHIP_ID_FLAG,
> > +       .thermal_ops =3D &loongson2_2k0300_of_thermal_ops,
> > +};
> > +
> >  static const struct loongson2_thermal_chip_data loongson2_thermal_ls2k=
1000_data =3D {
> >         .thermal_sensor_sel =3D 0,
> >         .flags =3D 0,
> > +       .thermal_ops =3D &loongson2_2k1000_of_thermal_ops,
> >  };
> >
> >  static const struct loongson2_thermal_chip_data loongson2_thermal_ls2k=
2000_data =3D {
> >         .thermal_sensor_sel =3D 0,
> >         .flags =3D LS2K2000_THSENS_OUT_FLAG,
> > +       .thermal_ops =3D &loongson2_2k2000_of_thermal_ops,
> >  };
> >
> >  static const struct of_device_id of_loongson2_thermal_match[] =3D {
> > +       {
> > +               .compatible =3D "loongson,ls2k0300-thermal",
> > +               .data =3D &loongson2_thermal_ls2k0300_data,
> > +       },
> >         {
> >                 .compatible =3D "loongson,ls2k1000-thermal",
> >                 .data =3D &loongson2_thermal_ls2k1000_data,
> > --
> > 2.52.0
> >

--=20
Thanks.
Binbin
