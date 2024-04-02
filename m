Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30AD58210
	for <loongarch@lists.linux.dev>; Tue,  2 Apr 2024 09:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712050491; cv=none; b=BBzU9UUc0QU9cYKHaRuBP6Bp7CTYTdkSg66QTZy6Im4i+xtJZPl/56UStyn/dFPHr91QJh+Onr/bm5/B0uK0clocRHZsUnCt1lznKCf9sBn24GJCS9Fne+JKRXu+rofsgtX7bdFBHg9WQ6aDwrC0v5DCkg73Lx2U8FqvC39p+jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712050491; c=relaxed/simple;
	bh=4XL2bE/ZBItBnM0McLZwLtl3bXKFRvUBQsDJxc7sOV8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lBGqeX3rF/2sLjIan2ocK+bZaXk9gRAUlNinCOtr1yv4zx4FN8bVg6ZTD4be0g+7d58nFog3kwWtzO6wKaXBAe+7vehKs2g+uXBFtyzOV8ygccRdoHK+IAd2SjYBxwp1YDqDLQROYcKfpi08r2/ru8f8EsxtmIEZCvlY0NCUvpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZYhSKMls; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZYhSKMls"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6151e2d037dso6121397b3.3
        for <loongarch@lists.linux.dev>; Tue, 02 Apr 2024 02:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712050489; x=1712655289; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zd3wwsxTYAdMtHPaY6ukdB/o/fdbIv+daSWf1vfb1pU=;
        b=ZYhSKMlsFHd4x/4ncHU+5pNMd4OuvgmRuJKiEQXIxhGRpnkLzQmaPSU8vcGo7cNhb9
         AzNijag2RNzjKtlrnAa84uxV97TQkdQbRHn7egAtPMbukq7fK1GoTWURK6gWpycAu4qS
         P3bJ5g8XudwR+u2/fHaYSYeQinq6ZR5Y2V3npgi9VIvxEuWeT1RkSTxB3tF1zH0nH9lo
         pyL8d4tK9I6cgg4rgf6BxvXRNcykoGrkLXn0ZH7O9UrbfBYTIYEK8i95Xdrc0dW8zpzj
         /omfIDx03OFBvwGtfDtTWxP8Gxy6NUCva4uZK/Z8Bzbo3Z2EOlZ8kLWG0wXlLjFRow8H
         Z25Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712050489; x=1712655289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zd3wwsxTYAdMtHPaY6ukdB/o/fdbIv+daSWf1vfb1pU=;
        b=CmatkBrcWa2YKTjLDGAVNAOcDtj7eXx8bC95InXT5z1Gz9+y27oMZk1djDso9c/MRh
         EGHQjJg1U1w9hO9LacPeIuscK6EITohX8rrZyJRtRgmMXvBZi89fUu78ag6Z5HyBJQdC
         c+Cqi/aNa1Tfo/ON2C3Q4+mlB4NRj2yhFNW2fiF8ev/XZDityieDdDpItlWa9Jd8xr6p
         le8ZVTCBuTAWSYcXYEvriwjSyfoncr61oNjzRjS68R10mbK3lQH/CzA4JCBvFNJHW98m
         x7WagZ4tBUnSroBqGTTvsOnFb79RSkli7ov92Ur8g12jMwBQlQp4pRd1j85F/y/mdOms
         I34A==
X-Forwarded-Encrypted: i=1; AJvYcCXJEXEeYf9f33CytvikMUsyjoLgBQdSyWXSgYdw9JdelnxQ1C9kPH0Ubw3afc9j24gw5kRDvQ4PNc7gdasvITyHo9u/qaYEQbRH
X-Gm-Message-State: AOJu0YzVVXkQc/DKsNQ5EGSr29UERI1lVmGOaVsFHO+VQZDync7sPOLH
	oURL9tPcTMSYD7Caup/7ggys8a2umQPV5VOeZR8UU2sLnn2yDnQwBZyrjSso1hW5b5BvAQQZiEL
	tswxObr060uTySlcjZgkBOk8w/TQ=
X-Google-Smtp-Source: AGHT+IE3mcw3w/VAtRJReMwDR5zazV1WA2M7j2g292EI7+c58Tu68X6RwZ8jrt1YmWFEZ1LjY9B9qQyGfTb2Q1Nsq2g=
X-Received: by 2002:a0d:dd93:0:b0:60c:d24d:f962 with SMTP id
 g141-20020a0ddd93000000b0060cd24df962mr11637593ywe.42.1712050488913; Tue, 02
 Apr 2024 02:34:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1711504700.git.zhoubinbin@loongson.cn> <6c4eb239cbde62e7e1a8c647c945e128a0b78b2b.1711504700.git.zhoubinbin@loongson.cn>
 <CAAhV-H5L=ff8k4a5PA7vaD5W8QRu3zWQa=-99bq4MsjUz3UQJQ@mail.gmail.com>
In-Reply-To: <CAAhV-H5L=ff8k4a5PA7vaD5W8QRu3zWQa=-99bq4MsjUz3UQJQ@mail.gmail.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 2 Apr 2024 15:34:37 +0600
Message-ID: <CAMpQs4LDhE0=jWHGf9H+pvm+MVQPgX=UCJvvEb=hexc_tSWA0A@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: clock: add Loongson-2K expand clock index
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, loongson-kernel@lists.loongnix.cn, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 2, 2024 at 2:58=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org> =
wrote:
>
> Hi, Binbin,
>
> On Mon, Apr 1, 2024 at 4:24=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.c=
n> wrote:
> >
> > In the new Loongson-2K family of SoCs, more clock indexes are needed,
> > such as clock gates.
> > The patch adds these clock indexes
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  include/dt-bindings/clock/loongson,ls2k-clk.h | 56 ++++++++++++-------
> >  1 file changed, 37 insertions(+), 19 deletions(-)
> >
> > diff --git a/include/dt-bindings/clock/loongson,ls2k-clk.h b/include/dt=
-bindings/clock/loongson,ls2k-clk.h
> > index 3bc4dfc193c2..4e6811eca8c6 100644
> > --- a/include/dt-bindings/clock/loongson,ls2k-clk.h
> > +++ b/include/dt-bindings/clock/loongson,ls2k-clk.h
> > @@ -7,24 +7,42 @@
> >  #ifndef __DT_BINDINGS_CLOCK_LOONGSON2_H
> >  #define __DT_BINDINGS_CLOCK_LOONGSON2_H
> >
> > -#define LOONGSON2_REF_100M                             0
> > -#define LOONGSON2_NODE_PLL                             1
> > -#define LOONGSON2_DDR_PLL                              2
> > -#define LOONGSON2_DC_PLL                               3
> > -#define LOONGSON2_PIX0_PLL                             4
> > -#define LOONGSON2_PIX1_PLL                             5
> > -#define LOONGSON2_NODE_CLK                             6
> > -#define LOONGSON2_HDA_CLK                              7
> > -#define LOONGSON2_GPU_CLK                              8
> > -#define LOONGSON2_DDR_CLK                              9
> > -#define LOONGSON2_GMAC_CLK                             10
> > -#define LOONGSON2_DC_CLK                               11
> > -#define LOONGSON2_APB_CLK                              12
> > -#define LOONGSON2_USB_CLK                              13
> > -#define LOONGSON2_SATA_CLK                             14
> > -#define LOONGSON2_PIX0_CLK                             15
> > -#define LOONGSON2_PIX1_CLK                             16
> > -#define LOONGSON2_BOOT_CLK                             17
> > -#define LOONGSON2_CLK_END                              18
> > +#define LOONGSON2_REF_100M     0
> > +#define LOONGSON2_NODE_PLL     1
> > +#define LOONGSON2_DDR_PLL      2
> > +#define LOONGSON2_DC_PLL       3
> > +#define LOONGSON2_PIX0_PLL     4
> > +#define LOONGSON2_PIX1_PLL     5
> > +#define LOONGSON2_NODE_CLK     6
> > +#define LOONGSON2_HDA_CLK      7
> > +#define LOONGSON2_GPU_CLK      8
> > +#define LOONGSON2_DDR_CLK      9
> > +#define LOONGSON2_GMAC_CLK     10
> > +#define LOONGSON2_DC_CLK       11
> > +#define LOONGSON2_APB_CLK      12
> > +#define LOONGSON2_USB_CLK      13
> > +#define LOONGSON2_SATA_CLK     14
> > +#define LOONGSON2_PIX0_CLK     15
> > +#define LOONGSON2_PIX1_CLK     16
> > +#define LOONGSON2_BOOT_CLK     17
> > +
> > +/* Loongson-2K2000 */
> This line should be removed, because the below definition is not
> specific to Loongson-2K2000.

Yes, it was my mistake, I forgot to drop it.
I will fix it in the next version.

Thanks.
Binbin
>
> Huacai
>
> > +#define LOONGSON2_OUT0_GATE    18
> > +#define LOONGSON2_GMAC_GATE    19
> > +#define LOONGSON2_RIO_GATE     20
> > +#define LOONGSON2_DC_GATE      21
> > +#define LOONGSON2_GPU_GATE     22
> > +#define LOONGSON2_DDR_GATE     23
> > +#define LOONGSON2_HDA_GATE     24
> > +#define LOONGSON2_NODE_GATE    25
> > +#define LOONGSON2_EMMC_GATE    26
> > +#define LOONGSON2_PIX0_GATE    27
> > +#define LOONGSON2_PIX1_GATE    28
> > +#define LOONGSON2_OUT0_CLK     29
> > +#define LOONGSON2_RIO_CLK      30
> > +#define LOONGSON2_EMMC_CLK     31
> > +#define LOONGSON2_DES_CLK      32
> > +#define LOONGSON2_I2S_CLK      33
> > +#define LOONGSON2_MISC_CLK     34
> >
> >  #endif
> > --
> > 2.43.0
> >
