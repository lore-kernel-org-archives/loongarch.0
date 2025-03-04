Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BD91FDE2D
	for <loongarch@lists.linux.dev>; Tue,  4 Mar 2025 11:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741089354; cv=none; b=UXoezOhp+ox1GRR5gfWigogbDOAD8mhFWugFg+I9UMhNwXfr0uPC7cJixGnSIV1h40OypA+CX6PZmNZNiagAF7JB4zAhQnSTg0VeBIYvwEtpWU9QqBWO2FX3pynh3T4BMEdMCK3yHUb5czzt64W6jQU1nkEGD7QOO+DD7SxRKJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741089354; c=relaxed/simple;
	bh=k8AeePF8aGjADlzhnEd1krK8gPuB2mc/X/5gvUtOCEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sbdwiVIzwHNgDhbISXwBd1BZ1YIPpZCoafadgYR5h3VmH5unv5S5+f2U/mxYcTdm82esqYYo6Q+D1MlpKNH2BkylQcBK0ZXwZmigK1+sLornBpgmII/tE9PZhza5cM2xozA58Yu19iJdSOMY+W9DCQH1BMvg7jB4BrJdOCKhCFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A2bSmNPO; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A2bSmNPO"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e53b3fa7daso3802356a12.2
        for <loongarch@lists.linux.dev>; Tue, 04 Mar 2025 03:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741089351; x=1741694151; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9k5/kUhkHRqlZnA0OW1zTWkTBSUQGJS0XZ/fsldyH8=;
        b=A2bSmNPOsndJKShekdzOQyFYdLFnt0ZKaN0vBis0NW4r2b7dIxrLcwcFFeGmmECRYS
         +OyVWVSURSXW/PZ1I5/FDARkJD3WOvuivbVi6oLF7dMI2YHnVl/LNeJbxu8mkbvp8Ugg
         OG8xNOBSxsNjDP8H3+VKCa+AxgcgwWBViLaMCSfl7S0eFyHeuvH9buz8dKU9b182zHhY
         bRTKDHfATOAtPq8UpaUioMpnnR4g15M9QP82x/d93Tb9TsPG5CbkprUlgLOqmLNMoiRq
         ZgHi0ruefc0WhTUQAZnvRF3Mrz8B+CVYd1YtqfbQ1vTHlGBt9YTMnEJWjI1+ENOtplaW
         ZI6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741089351; x=1741694151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z9k5/kUhkHRqlZnA0OW1zTWkTBSUQGJS0XZ/fsldyH8=;
        b=qSd2BR0sgXydv7XFOxzlU6dG21EDlntQ5GwthtXrB1o7iiQmdtO5V5FBupNk2+CyuC
         1GiWtmShZPaSGLHj8PLqmkU3gTtwuSjlS/Ond73eXMCPI8yOgDa4dtQsAGOw/bVVa+/Y
         n3Up2UnSqPN0ONzZqwrI3GxbCDT9HSRToc3fHmqb5T0obwsxXEspboOEw2deBiJdPTOD
         nhk/bgWAzIMH2T3WbpZHvp2kjx6s3gXDQGno029NIRpCt1fgdv7rH7H+27J8UuRmVtBn
         ytOlLdFAfR+W0LEBl1NGy7y0JzYve8cxFcXbj51jqk4iKO2K8Kcl8tOl+SVUFjMaf/Lh
         He9Q==
X-Forwarded-Encrypted: i=1; AJvYcCW3wbd9SthdnxksoaWI4lWZ7mDGqFfvVGH9QNyZU6eVbScfd9IF3nzM8ITi8QbKY9KiKcSf7diFfkM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxw+tI5GAG2M0RCYXDWdC/29VS3qexSNQWSAaUcLVk2PsbInlB+
	83O0h7Og5xRT42SsGvG7lR+WInnw0/xb+MnaXaU7oLDEEsX6b2c6qIqK0QJWoICvE4s/oCKF6kR
	yXKXD1Us38rFRiBzRfVOpTyoslko=
X-Gm-Gg: ASbGnctw13Yx7eSMhIJuCFkLsN+XmJcR3eUWZA1LzNqGh1HZk0wBM9jDt5U4STWtMTz
	Np/5e4HBhJwRzUv0pAzULIoJw2KjnwcFpouvh4ljP0w9lFm+EC/T9CzOYzHsZqOmYylkWx2DmUB
	QQYQ2XAX8w0ghd+OUPsCnC5u6nMQM=
X-Google-Smtp-Source: AGHT+IFgGAsUVgJIA5JzmB+7xP1D6l7zaAdTgHmXNkaGuJ8wiLfcOqhl4lZQy2tzG1vv5Li5WHNpRCx5CMeLsPc/Dzw=
X-Received: by 2002:a17:907:7f89:b0:abf:7776:7e29 with SMTP id
 a640c23a62f3a-abf77768955mr840626566b.53.1741089350626; Tue, 04 Mar 2025
 03:55:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250303074552.3335186-1-zhoubinbin@loongson.cn>
 <20250303074552.3335186-2-zhoubinbin@loongson.cn> <CAMRc=Mfr5PCuad28dL19iZrpA-qkL7x0W-4Lt3SZyVfXPP-ipw@mail.gmail.com>
In-Reply-To: <CAMRc=Mfr5PCuad28dL19iZrpA-qkL7x0W-4Lt3SZyVfXPP-ipw@mail.gmail.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 4 Mar 2025 19:55:38 +0800
X-Gm-Features: AQ5f1JrQwQmbnnM8V2KqYQZFYKvFMDIRmYh0FNy89y2SOvhJHCUGR-jvA0SPok4
Message-ID: <CAMpQs4+5165E35oO_p-pE8zDNo2rPT-gBqueA_ynW8FYJHV18A@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: loongson-64bit: Add more gpio chip support
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Linus Walleij <linus.walleij@linaro.org>, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bartosz:

Thanks for your reply.

On Tue, Mar 4, 2025 at 6:36=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> On Mon, Mar 3, 2025 at 8:46=E2=80=AFAM Binbin Zhou <zhoubinbin@loongson.c=
n> wrote:
> >
> > The Loongson-7A2000 and Loongson-3A6000 share the same gpio chip model.
> > Just add them through driver_data.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  drivers/gpio/gpio-loongson-64bit.c | 51 ++++++++++++++++++++++++++++++
> >  1 file changed, 51 insertions(+)
> >
> > diff --git a/drivers/gpio/gpio-loongson-64bit.c b/drivers/gpio/gpio-loo=
ngson-64bit.c
> > index f000cc0356c7..a9a93036f08f 100644
> > --- a/drivers/gpio/gpio-loongson-64bit.c
> > +++ b/drivers/gpio/gpio-loongson-64bit.c
> > @@ -254,6 +254,33 @@ static const struct loongson_gpio_chip_data loongs=
on_gpio_ls7a_data =3D {
> >         .out_offset =3D 0x900,
> >  };
> >
> > +/* LS7A2000 chipset GPIO */
> > +static const struct loongson_gpio_chip_data loongson_gpio_ls7a2000_dat=
a0 =3D {
> > +       .label =3D "ls7a2000_gpio",
> > +       .mode =3D BYTE_CTRL_MODE,
> > +       .conf_offset =3D 0x800,
> > +       .in_offset =3D 0xa00,
> > +       .out_offset =3D 0x900,
> > +};
> > +
> > +/* LS7A2000 ACPI GPIO */
> > +static const struct loongson_gpio_chip_data loongson_gpio_ls7a2000_dat=
a1 =3D {
> > +       .label =3D "ls7a2000_gpio",
> > +       .mode =3D BYTE_CTRL_MODE,
> > +       .conf_offset =3D 0x4,
> > +       .in_offset =3D 0x8,
> > +       .out_offset =3D 0x0,
> > +};
>
> The naming convention here is a bit confusing, can't we have the
> naming of variables reflect the compatibles they refer to?
>
Emm...

I named them that way to be consistent with the previous naming.
Of course, we could name them something like
=E2=80=9Cls7a2000_acpi_gpio_data=E2=80=9D, which might be better understood=
.
Also, do we need to rename all instances of =E2=80=9Cloongson_gpio_chip_dat=
a=E2=80=9D?

For example:
ls2k1000_cpu_gpio_data
ls2k0500_cpu_gpio0_data
ls2k0500_cpu_gpio1_data
ls2k2000_cpu_gpio_data
ls2k2000_bridge_gpio_data
ls2k2000_acpi_gpio_data
ls3a5000_cpu_gpio_data
ls3a6000_cpu_gpio_data
ls7a1000_bridge_gpio_data
ls7a2000_bridge_gpio_data
ls7a2000_gpio_gpio_data

> Bart
>
> > +
> > +/* Loongson-3A6000 node GPIO */
> > +static const struct loongson_gpio_chip_data loongson_gpio_ls3a6000_dat=
a =3D {
> > +       .label =3D "ls3a6000_gpio",
> > +       .mode =3D BIT_CTRL_MODE,
> > +       .conf_offset =3D 0x0,
> > +       .in_offset =3D 0xc,
> > +       .out_offset =3D 0x8,
> > +};
> > +
> >  static const struct of_device_id loongson_gpio_of_match[] =3D {
> >         {
> >                 .compatible =3D "loongson,ls2k-gpio",
> > @@ -287,6 +314,18 @@ static const struct of_device_id loongson_gpio_of_=
match[] =3D {
> >                 .compatible =3D "loongson,ls7a-gpio",
> >                 .data =3D &loongson_gpio_ls7a_data,
> >         },
> > +       {
> > +               .compatible =3D "loongson,ls7a2000-gpio1",
> > +               .data =3D &loongson_gpio_ls7a2000_data0,
> > +       },
> > +       {
> > +               .compatible =3D "loongson,ls7a2000-gpio2",
> > +               .data =3D &loongson_gpio_ls7a2000_data1,
> > +       },
> > +       {
> > +               .compatible =3D "loongson,ls3a6000-gpio",
> > +               .data =3D &loongson_gpio_ls3a6000_data,
> > +       },
> >         {}
> >  };
> >  MODULE_DEVICE_TABLE(of, loongson_gpio_of_match);
> > @@ -312,6 +351,18 @@ static const struct acpi_device_id loongson_gpio_a=
cpi_match[] =3D {
> >                 .id =3D "LOON000C",
> >                 .driver_data =3D (kernel_ulong_t)&loongson_gpio_ls2k200=
0_data2,
> >         },
> > +       {
> > +               .id =3D "LOON000D",
> > +               .driver_data =3D (kernel_ulong_t)&loongson_gpio_ls7a200=
0_data0,
> > +       },
> > +       {
> > +               .id =3D "LOON000E",
> > +               .driver_data =3D (kernel_ulong_t)&loongson_gpio_ls7a200=
0_data1,
> > +       },
> > +       {
> > +               .id =3D "LOON000F",
> > +               .driver_data =3D (kernel_ulong_t)&loongson_gpio_ls3a600=
0_data,
> > +       },
> >         {}
> >  };
> >  MODULE_DEVICE_TABLE(acpi, loongson_gpio_acpi_match);
> > --
> > 2.47.1
> >



--=20
Thanks.
Binbin
