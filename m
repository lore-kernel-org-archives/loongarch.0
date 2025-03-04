Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB631FECA7
	for <loongarch@lists.linux.dev>; Tue,  4 Mar 2025 10:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741084610; cv=none; b=bJ8nPVry4R3VxftId5GcCUksF6b2p9ATvQKbovROAGoLWoSVuDj6R4iUkFDynCXYNiTiooKghntHidLhDsBRdVoyajVa//x40OiUH9/3lf//U9Ee36r1zaDKW+i56NFB+FP1hu5CEpLvAUlnnxp6nhZNAi0YeYx6lqWpGTLoRUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741084610; c=relaxed/simple;
	bh=EHoD0qagGcne6cLZT0wmntslq+OP88nXMSPMcbC5g7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GQiHjWCXE0uFSgkQ/iwrYKosrcA/fJ6Jzozai6omsnHnESqLiV9mzgtladnlCkMVFBSHjLMpOmaUL5W+QZZy+HmUDyPD3bGwn7tXbaZaf33P/ItrESGBkznHgGTB9MncwG4CNSy61mrWJ4+194D1eoYXs9HCZsj+iqDnXG6N8rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=oj3wGPxl; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="oj3wGPxl"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54959d1a856so3004006e87.1
        for <loongarch@lists.linux.dev>; Tue, 04 Mar 2025 02:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741084607; x=1741689407; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lcgDcrDvfr7N8xNLIke7CDnqsWk3AZK9G46chFxkHHY=;
        b=oj3wGPxlEQFm833Ds2kI7PWLZwJZF5Dev4ju4CWDRlKVBuR7PZv36bYy/2MRy3FgpM
         0rfMYm3SfIbfklvYFS1ISyDBWeZF9Ey9S6FTsa6q9k2FFub256ncE6NAggrZS5luemdX
         TZfj4AmF2NrVLHPmr+8TbVZdDhLSnWMyOjMipWO6sAPHjfWC+ePmWn43Mr1yU6jMX5Tp
         SmGv5K2+6ZCkCPTMEZnFdzC+cWAcQhAwiosyZlMkU94UdoAEsMPd+H/L603NqkeRtrGm
         7KM6lBlCKZmU99hJ6VLiY4Zatmn0MhmbbRZaP/K3ybsB+eh9uuJ5heY3wO3LBW7zc1iT
         gPTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741084607; x=1741689407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lcgDcrDvfr7N8xNLIke7CDnqsWk3AZK9G46chFxkHHY=;
        b=VqA4nMh+7uMAumwsa8q3e9XGRGCAiY1I0MKbTI30AzHHItWWQf1J0nRSVEm5grAict
         piNhoq7T7+FtLievWcKYfCnf0SxtRKcu3TOQIxsapNk/SqypTKnbCci+i8tHkdhWgyhT
         BmkTPB+TZ/z8cmgtJ8wDFrVCXIf1haIrQyCqy6Sukv9ARTSzChp9MNvf1n8SDKNG9t3U
         Zh/FvUB6H5VacSEDD3eE2G3xlOVSqpYtccCxdrWiDmii75mEL7wEWolkijnEfPxoAQPz
         y4ahHzKG6UHf7DTjn0I8EH3d4O3yGAWZrP+1nO1w1SoEJDftMIii4ZAvZwx5UWFkaCik
         Iv/Q==
X-Forwarded-Encrypted: i=1; AJvYcCW0qsIr5o+I6YRGOLzlK0ajLe96TmYk/6Hd5SRiUyre+hwwq6N81tMLf6Mk2TOl4mrJf6wxhXYqbes=@lists.linux.dev
X-Gm-Message-State: AOJu0YwtveCKty25ELHY15d0s7Sf+p41Xz6vqr5duBtn2Cv+l+bnknVK
	Bo2i0qYuIVCdKwHSrMNsRphLTKT+CYu5J2FoLoUfeI5ifawEDkFVmJFahaGTMy9OoN9StMachj7
	UpApmxlAr9Cg9MaOarpEv3tgqq6L7FxQSyw35ew==
X-Gm-Gg: ASbGncv2yreyQZTn7N/4Ilqk+sroJsLjBt2vnQrf5Wm1cYqZ259DzFGx4qM74LXfzRz
	zRnu7eHxlrJbj6Id7WUKAE5FunDjFerYGd30uDjHrUOO7itim1EYxQgh6HnbqGqSX+JM/Crvgcq
	BRPvrCsjWoB1IIpSKZAF9KQWLov0U5DpGKPBlrd7760LLJgKsX57iNH7aTNA==
X-Google-Smtp-Source: AGHT+IHrJYmirFBfVDyUeRd/XJ8RpCYbbhbHQXdds9Yd6n8xkkrcThPtbWwAqBJ4we5vsSXGsXmtMn+6In/C/xPYNp4=
X-Received: by 2002:a05:6512:3d19:b0:549:6309:2b9d with SMTP id
 2adb3069b0e04-549756c58c6mr892295e87.13.1741084606493; Tue, 04 Mar 2025
 02:36:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250303074552.3335186-1-zhoubinbin@loongson.cn> <20250303074552.3335186-2-zhoubinbin@loongson.cn>
In-Reply-To: <20250303074552.3335186-2-zhoubinbin@loongson.cn>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 4 Mar 2025 11:36:35 +0100
X-Gm-Features: AQ5f1Jo6thrrsV43N2ZSskUr5sNrLRHWs4jPUL34hLtTkZv2cSPAt92oKZXNOBk
Message-ID: <CAMRc=Mfr5PCuad28dL19iZrpA-qkL7x0W-4Lt3SZyVfXPP-ipw@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: loongson-64bit: Add more gpio chip support
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Linus Walleij <linus.walleij@linaro.org>, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 3, 2025 at 8:46=E2=80=AFAM Binbin Zhou <zhoubinbin@loongson.cn>=
 wrote:
>
> The Loongson-7A2000 and Loongson-3A6000 share the same gpio chip model.
> Just add them through driver_data.
>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  drivers/gpio/gpio-loongson-64bit.c | 51 ++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
>
> diff --git a/drivers/gpio/gpio-loongson-64bit.c b/drivers/gpio/gpio-loong=
son-64bit.c
> index f000cc0356c7..a9a93036f08f 100644
> --- a/drivers/gpio/gpio-loongson-64bit.c
> +++ b/drivers/gpio/gpio-loongson-64bit.c
> @@ -254,6 +254,33 @@ static const struct loongson_gpio_chip_data loongson=
_gpio_ls7a_data =3D {
>         .out_offset =3D 0x900,
>  };
>
> +/* LS7A2000 chipset GPIO */
> +static const struct loongson_gpio_chip_data loongson_gpio_ls7a2000_data0=
 =3D {
> +       .label =3D "ls7a2000_gpio",
> +       .mode =3D BYTE_CTRL_MODE,
> +       .conf_offset =3D 0x800,
> +       .in_offset =3D 0xa00,
> +       .out_offset =3D 0x900,
> +};
> +
> +/* LS7A2000 ACPI GPIO */
> +static const struct loongson_gpio_chip_data loongson_gpio_ls7a2000_data1=
 =3D {
> +       .label =3D "ls7a2000_gpio",
> +       .mode =3D BYTE_CTRL_MODE,
> +       .conf_offset =3D 0x4,
> +       .in_offset =3D 0x8,
> +       .out_offset =3D 0x0,
> +};

The naming convention here is a bit confusing, can't we have the
naming of variables reflect the compatibles they refer to?

Bart

> +
> +/* Loongson-3A6000 node GPIO */
> +static const struct loongson_gpio_chip_data loongson_gpio_ls3a6000_data =
=3D {
> +       .label =3D "ls3a6000_gpio",
> +       .mode =3D BIT_CTRL_MODE,
> +       .conf_offset =3D 0x0,
> +       .in_offset =3D 0xc,
> +       .out_offset =3D 0x8,
> +};
> +
>  static const struct of_device_id loongson_gpio_of_match[] =3D {
>         {
>                 .compatible =3D "loongson,ls2k-gpio",
> @@ -287,6 +314,18 @@ static const struct of_device_id loongson_gpio_of_ma=
tch[] =3D {
>                 .compatible =3D "loongson,ls7a-gpio",
>                 .data =3D &loongson_gpio_ls7a_data,
>         },
> +       {
> +               .compatible =3D "loongson,ls7a2000-gpio1",
> +               .data =3D &loongson_gpio_ls7a2000_data0,
> +       },
> +       {
> +               .compatible =3D "loongson,ls7a2000-gpio2",
> +               .data =3D &loongson_gpio_ls7a2000_data1,
> +       },
> +       {
> +               .compatible =3D "loongson,ls3a6000-gpio",
> +               .data =3D &loongson_gpio_ls3a6000_data,
> +       },
>         {}
>  };
>  MODULE_DEVICE_TABLE(of, loongson_gpio_of_match);
> @@ -312,6 +351,18 @@ static const struct acpi_device_id loongson_gpio_acp=
i_match[] =3D {
>                 .id =3D "LOON000C",
>                 .driver_data =3D (kernel_ulong_t)&loongson_gpio_ls2k2000_=
data2,
>         },
> +       {
> +               .id =3D "LOON000D",
> +               .driver_data =3D (kernel_ulong_t)&loongson_gpio_ls7a2000_=
data0,
> +       },
> +       {
> +               .id =3D "LOON000E",
> +               .driver_data =3D (kernel_ulong_t)&loongson_gpio_ls7a2000_=
data1,
> +       },
> +       {
> +               .id =3D "LOON000F",
> +               .driver_data =3D (kernel_ulong_t)&loongson_gpio_ls3a6000_=
data,
> +       },
>         {}
>  };
>  MODULE_DEVICE_TABLE(acpi, loongson_gpio_acpi_match);
> --
> 2.47.1
>
