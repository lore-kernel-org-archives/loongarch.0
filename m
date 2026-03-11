Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04DB3128BE
	for <loongarch@lists.linux.dev>; Wed, 11 Mar 2026 08:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773217081; cv=pass; b=TjJ2WrkSxEqUv4k3cszUbjVTeY9u6Im6GcZPtAo7cVUbWP95k3csVSdyu7+9PfP0z2DIrWGhLz3PyQcsvVzRvFjiEF9I8Yd9Cfs5t8L2Oi0wc1fRVvq/olKeDEjEA/NMntLQfpKJs2E8IeBCAcYhk+D65pQ3L2hjDWy3ZXzvjsw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773217081; c=relaxed/simple;
	bh=bvc+6Y2uaW1tJtPm4VR1GaWpkiNRWqiDYswbFc8+/Q8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pzKSrPI+f09HUveAVhPCU7CGlD/1AKWd63ocS+n2K0uTEGBDYCBf2C5WRfSzqZUg3AACCZiUormJqxxpPPWNKjQLnUQQNtiQFcDFQcymHI6/HyCQm3yQkcfFnF9sV57IKQSDRzPXwOCGEvjza8qJbpABL6yCiJYSoOw11rAqCGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nci6v7bz; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nci6v7bz"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-660ea6ceb5aso1116170a12.0
        for <loongarch@lists.linux.dev>; Wed, 11 Mar 2026 01:17:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773217078; cv=none;
        d=google.com; s=arc-20240605;
        b=hkPGhn4N2CCXE3klOfRvLfSDAl00nPdgxrknpj7dNkaJ9+qiOtBViFRroFyPpy3xyT
         dPKPk1uyGt1wQRy+jNlTCHlqnPomVROZ5tNhH8KiYpqKNXlGq5erEATUPvf69IKCjq6R
         B8LmNehwQ4SZ5MHUdG/VoHWO8Ghd4J2L8H2neeK1Ybrss/beMBXCNl67iJy048bW/a9r
         x4EZ0zOt1cUCz2wfQv999ucooA0amWmbNA//fI89ab/c1ZURhMK/Qkhx/ZtTcQ39fcJL
         g63WNM7TvVmZtwY17ym6Q6/wso7GYRNSFCJecbsxsnyRqnlqxRRwfC6l4Lh3Zs39SmNw
         gE5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DSqIY/cfxGhiXZ3sxGbmKbwjNNRfS8ZavCJutHh1i/E=;
        fh=yUrG+VaNMUYjSS/zCiYx2RuGnLKu/SQP2wxfBm8qab0=;
        b=GMczrxK4XLtJDkJ9Fg0hE2d861cBbt68ZRFLeYIKm48ndsAKo7WMuTTTP1iCGs5eIY
         CozEjQm65/5wk9AIOTq5efFINvWFDaBTnmm6kSpqbYYWY4UI9v9i5kDo5TFWuxa0JdA0
         35g+TFOXoD6tKipxv0YzUfvVe6bfoh9/fcjmnK/u8mkG68IYOhYhfy9aP9hPPj2mNvNV
         kSbK0N+G5IxTc+00W2Y+n2g3BKv5bObocAWgK8QHQaBndOWTwF8RXtYHhwMUsgyDuBY2
         dmdysjeIkbWkuWv3DwBLscMr4CQlUPPGRjCbkmRd2Y8WNR4EQypYahJbHeMB+Xzu8TIf
         /9gQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773217078; x=1773821878; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DSqIY/cfxGhiXZ3sxGbmKbwjNNRfS8ZavCJutHh1i/E=;
        b=nci6v7bzmHDRx7Jwhc9eqIJfeWVyyqk2Kn3sr326IPzMholZjpCTRD9IY3hjpa2X9g
         Wn0IgFGcrm88K4H9iqhpd1PyrivFGhuzV+7RsZQFXYubqnRikO2n0MiYDpIF5IPmNnhE
         M3uNKgmWsQGqkoxveAAVFM7KHzo4hNKLOyhu+bRgGxnXr6iXDlSiJ2LsyjDl3v641dOJ
         CzXIoRtsNA//lLA5uF3TfRAu96uf/bdSYbsEEuVoVCG+lelQ7POOUUTYMBxTRO7m2v5q
         x5dRxfHCgH67RSpYRgi1iL7t3pKq+iUucjRqwzCdMyca6QznNfBSlp1BDLFO1GjM6DEh
         h4Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773217078; x=1773821878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DSqIY/cfxGhiXZ3sxGbmKbwjNNRfS8ZavCJutHh1i/E=;
        b=PMqd3gMwXorun7mVwY7fMwUAYEbkgSG5fKflVMUzFdSnLxp+vyBTspqefbF8WneybI
         v9l6Vd5n64CkGBQBDXbewiPPSY+dY/5fLK9rNxT2HKXqYzc36sbLGMH4K+ijnhLGnT4C
         OVSQN8WZf2QVwHkZCNFUULjIv8QThArYJI5X8zoXqgA9BTJu86wNBCNiqMSswCguO4OO
         uF68GUVvD0IkJ+oKh1JaQeivVwmm5U9wRY0Cs99ZKJP+L9Fj7z0NKtmCv0DAwmlMPkL7
         2FyqdiqOS/6doLmYqccrXCSbM+68xJwKX0yvg12k5fvAVMgj6iixWTxwfc0nNwGwjNYx
         3JFw==
X-Forwarded-Encrypted: i=1; AJvYcCXlSjWKXrDtQnSh8ltYjpolj49U2ISn1Sm3Ed7WcyeW55e+kwwVexNEEl3bh4k3GzupXIZTvQY7+bI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyjVI68WQhsH2GmX+A/BWqFomPptTFq0j6FRODrfJwm/TiPSzp1
	2pqlfAfx3+Bms5hdzpXr/0iIayZhNb09wxLom1LykCVADZUASlvVVNuKjlY2/KEhqLD/j8OXjb8
	yDC5rFEglW1OxI7IR2A5tUGoZkYrn7G4=
X-Gm-Gg: ATEYQzycUeB6iwNd/14jjN8QJWVduTXXTOAkeVc/kmCMb1yrTFZ1w8hljbTWQUEdJmM
	ByImcZ3hC5CWl9TONnzMCUvyW0S0VQVTvhJkqRNDT5pc9EQnUjHg9lgiF2bM7zVdDpO4kqGTufW
	daON/VnTHbaCIJ2TobDv1wlzF4PgI4CXOQmswId3F5acX6L7WT2zNWhgV998n0xLF9xQ4URg0dY
	Cl6TLga0xHYP09tXCrxiG7k6h2aXcNJ7RPrtU8xq/PPqaaHnT9q6r3U1UAshmsJPtC6Lc6XbICv
	H9IH0KE=
X-Received: by 2002:a17:907:7211:b0:b8f:de69:b597 with SMTP id
 a640c23a62f3a-b972d51c4ffmr98810566b.7.1773217077803; Wed, 11 Mar 2026
 01:17:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1773107475.git.zhoubinbin@loongson.cn> <8fc0f9483b0ef0ff52ac5588f029f329098f45fc.1773107475.git.zhoubinbin@loongson.cn>
 <CAAhV-H7D0oGeWYCGXwPJxUBBGibNQ27B_fAFThDYXZ-+Qr7RMA@mail.gmail.com>
In-Reply-To: <CAAhV-H7D0oGeWYCGXwPJxUBBGibNQ27B_fAFThDYXZ-+Qr7RMA@mail.gmail.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 11 Mar 2026 16:17:45 +0800
X-Gm-Features: AaiRm52fvLzj-z2f6S8hIS-AkBlETUoqIBlwVuGOvJWq_S-q2wO-mmxTvxhMBq8
Message-ID: <CAMpQs4LxN7t=OoNp0=R95yNYHewzR9Eikr2DiZTj=jR__re3og@mail.gmail.com>
Subject: Re: [PATCH 2/6] ASoC: loongson: Combined regmap definitions
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Xuerui Wang <kernel@xen0n.name>, 
	loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 3:55=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> Hi, Binbin,
>
> On Wed, Mar 11, 2026 at 2:37=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.=
cn> wrote:
> >
> > For Loongson I2S, the difference between i2s_plat and i2s_pci is more i=
n
> > the external interface, the internal registers are accessed in the same
> > way, so the regmap definitions can be united to simplify the code.
> >
> > Also, the following warning for the i2s_plat driver will be eliminated:
> >
> > loongson-i2s-plat loongson-i2s: using zero-initialized flat cache, this=
 may cause unexpected behavior.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  sound/soc/loongson/loongson_i2s.c      | 55 ++++++++++++++++++++++++++
> >  sound/soc/loongson/loongson_i2s.h      |  1 +
> >  sound/soc/loongson/loongson_i2s_pci.c  | 54 -------------------------
> >  sound/soc/loongson/loongson_i2s_plat.c |  8 ----
> >  4 files changed, 56 insertions(+), 62 deletions(-)
> >
> > diff --git a/sound/soc/loongson/loongson_i2s.c b/sound/soc/loongson/loo=
ngson_i2s.c
> > index e336656e13eb..09ccab0c535e 100644
> > --- a/sound/soc/loongson/loongson_i2s.c
> > +++ b/sound/soc/loongson/loongson_i2s.c
> > @@ -272,5 +272,60 @@ const struct dev_pm_ops loongson_i2s_pm =3D {
> >  };
> >  EXPORT_SYMBOL_GPL(loongson_i2s_pm);
> >
> > +static bool loongson_i2s_wr_reg(struct device *dev, unsigned int reg)
> > +{
> > +       switch (reg) {
> > +       case LS_I2S_CFG:
> > +       case LS_I2S_CTRL:
> > +       case LS_I2S_RX_DATA:
> > +       case LS_I2S_TX_DATA:
> > +       case LS_I2S_CFG1:
> > +               return true;
> > +       default:
> > +               return false;
> > +       };
> > +}
> The 'write' function is usually after the 'read' function.

Okay, it will be reordered in the next version.
>
> > +
> > +static bool loongson_i2s_rd_reg(struct device *dev, unsigned int reg)
> > +{
> > +       switch (reg) {
> > +       case LS_I2S_VER:
> > +       case LS_I2S_CFG:
> > +       case LS_I2S_CTRL:
> > +       case LS_I2S_RX_DATA:
> > +       case LS_I2S_TX_DATA:
> > +       case LS_I2S_CFG1:
> > +               return true;
> > +       default:
> > +               return false;
> > +       };
> > +}
> > +
> > +static bool loongson_i2s_volatile_reg(struct device *dev, unsigned int=
 reg)
> > +{
> > +       switch (reg) {
> > +       case LS_I2S_CFG:
> > +       case LS_I2S_CTRL:
> > +       case LS_I2S_RX_DATA:
> > +       case LS_I2S_TX_DATA:
> > +       case LS_I2S_CFG1:
> > +               return true;
> > +       default:
> > +               return false;
> > +       };
> > +}
> > +
> > +const struct regmap_config loongson_i2s_regmap_config =3D {
> > +       .reg_bits =3D 32,
> > +       .reg_stride =3D 4,
> > +       .val_bits =3D 32,
> > +       .max_register =3D LS_I2S_CFG1,
> > +       .writeable_reg =3D loongson_i2s_wr_reg,
> > +       .readable_reg =3D loongson_i2s_rd_reg,
> > +       .volatile_reg =3D loongson_i2s_volatile_reg,
> > +       .cache_type =3D REGCACHE_FLAT,
> > +};
> > +EXPORT_SYMBOL_GPL(loongson_i2s_regmap_config);
> > +
> >  MODULE_LICENSE("GPL");
> >  MODULE_DESCRIPTION("Common functions for loongson I2S controller drive=
r");
> > diff --git a/sound/soc/loongson/loongson_i2s.h b/sound/soc/loongson/loo=
ngson_i2s.h
> > index c8052a762c1b..e73ffa954ec9 100644
> > --- a/sound/soc/loongson/loongson_i2s.h
> > +++ b/sound/soc/loongson/loongson_i2s.h
> > @@ -65,6 +65,7 @@ struct loongson_i2s {
> >         u32 sysclk;
> >  };
> >
> > +extern const struct regmap_config loongson_i2s_regmap_config;
> >  extern const struct dev_pm_ops loongson_i2s_pm;
> >  extern struct snd_soc_dai_driver loongson_i2s_dai;
> >
> > diff --git a/sound/soc/loongson/loongson_i2s_pci.c b/sound/soc/loongson=
/loongson_i2s_pci.c
> > index 1ea5501a97f8..dea1e4ebee29 100644
> > --- a/sound/soc/loongson/loongson_i2s_pci.c
> > +++ b/sound/soc/loongson/loongson_i2s_pci.c
> > @@ -18,60 +18,6 @@
> >
> >  #define DRIVER_NAME "loongson-i2s-pci"
> >
> > -static bool loongson_i2s_wr_reg(struct device *dev, unsigned int reg)
> > -{
> > -       switch (reg) {
> > -       case LS_I2S_CFG:
> > -       case LS_I2S_CTRL:
> > -       case LS_I2S_RX_DATA:
> > -       case LS_I2S_TX_DATA:
> > -       case LS_I2S_CFG1:
> > -               return true;
> > -       default:
> > -               return false;
> > -       };
> > -}
> > -
> > -static bool loongson_i2s_rd_reg(struct device *dev, unsigned int reg)
> > -{
> > -       switch (reg) {
> > -       case LS_I2S_VER:
> > -       case LS_I2S_CFG:
> > -       case LS_I2S_CTRL:
> > -       case LS_I2S_RX_DATA:
> > -       case LS_I2S_TX_DATA:
> > -       case LS_I2S_CFG1:
> > -               return true;
> > -       default:
> > -               return false;
> > -       };
> > -}
> > -
> > -static bool loongson_i2s_volatile_reg(struct device *dev, unsigned int=
 reg)
> > -{
> > -       switch (reg) {
> > -       case LS_I2S_CFG:
> > -       case LS_I2S_CTRL:
> > -       case LS_I2S_RX_DATA:
> > -       case LS_I2S_TX_DATA:
> > -       case LS_I2S_CFG1:
> > -               return true;
> > -       default:
> > -               return false;
> > -       };
> > -}
> > -
> > -static const struct regmap_config loongson_i2s_regmap_config =3D {
> > -       .reg_bits =3D 32,
> > -       .reg_stride =3D 4,
> > -       .val_bits =3D 32,
> > -       .max_register =3D LS_I2S_CFG1,
> > -       .writeable_reg =3D loongson_i2s_wr_reg,
> The same.
>
> Huacai
>
> > -       .readable_reg =3D loongson_i2s_rd_reg,
> > -       .volatile_reg =3D loongson_i2s_volatile_reg,
> > -       .cache_type =3D REGCACHE_FLAT,
> > -};
> > -
> >  static int loongson_i2s_pci_probe(struct pci_dev *pdev,
> >                                   const struct pci_device_id *pid)
> >  {
> > diff --git a/sound/soc/loongson/loongson_i2s_plat.c b/sound/soc/loongso=
n/loongson_i2s_plat.c
> > index fa2e450ff618..f8d7aca8b903 100644
> > --- a/sound/soc/loongson/loongson_i2s_plat.c
> > +++ b/sound/soc/loongson/loongson_i2s_plat.c
> > @@ -85,14 +85,6 @@ static const struct snd_soc_component_driver loongso=
n_i2s_component_driver =3D {
> >         .open   =3D loongson_pcm_open,
> >  };
> >
> > -static const struct regmap_config loongson_i2s_regmap_config =3D {
> > -       .reg_bits =3D 32,
> > -       .reg_stride =3D 4,
> > -       .val_bits =3D 32,
> > -       .max_register =3D 0x14,
> > -       .cache_type =3D REGCACHE_FLAT,
> > -};
> > -
> >  static int loongson_i2s_apbdma_config(struct platform_device *pdev)
> >  {
> >         int val;
> > --
> > 2.52.0
> >
> >

--=20
Thanks.
Binbin
