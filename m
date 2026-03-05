Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3322D35CB80
	for <loongarch@lists.linux.dev>; Thu,  5 Mar 2026 13:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772718728; cv=pass; b=MZZE3vJl7sTDFEUdPyXvQNhiaBZAXvLNGVOdbdMUsc1YyAXtCARXTOaerI6I6CkstDxugl2p23NaB6sG85GrQ6e1DXrwZxHnf4zhial4pLEL73qQ92rU/uYHlAc4vND58gSNqzIWrluI+NxUEEAxNSCbCayTZKDBXCmPWryhGDQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772718728; c=relaxed/simple;
	bh=7nQxQrQcVoedGHXekMdQmt0PnChsID8+XSzvyS0i5/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f5vD3BL0Lii3GsrEou2xjTreZQ6gbZl4Ha3cOVIXde20bkwsWgmUdu8ZHFps+djabiikwyJ2KLYjmXGOy7am2Mi+EOsTdzDu+Y3cBTNGl2/vYzSRi58FeFdLNV5M7qs30ACI0dF6dZus0hRO9SfUMzlgo0R/rfaiwbpgWMEOaCA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bZYgyc2u; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bZYgyc2u"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b9372552059so1110460666b.1
        for <loongarch@lists.linux.dev>; Thu, 05 Mar 2026 05:52:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772718725; cv=none;
        d=google.com; s=arc-20240605;
        b=kvaxGsqZmCw9fZFTdDwhu3ELN7cLi7mP00E7J6a/Bt7vIP6n4VSRpz8+BybZfVtByj
         4eClkMlrTiAjQ8wQXnT93jpAjwLmpCyZv+cj5Lpd3WmZk16Rn/deivoJGcdwqGkCMY59
         WctxUPXJHIJLPlKqWQKmvvgVhc2+h7YvJMEkufZgeScQBk3IhHzgcGxZdkgyBSFjqRa/
         b3Yw9jwbGp4xrY+o9wzIPHhxIbEldGfmY8qfTgkM8Ep0AvrpXnkgfQqsi3bGCCbkSOLf
         E8QkWNHSXCpTgDy0Uk3BxbVcANVi4Hu+t38uG4Se7yTe/ihl1h0exvmiu9BcyGGVuVyA
         B3GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NZyEoKNZ9+FBEZoQGrBgOEAt7Mvz4sJQ58VTFJSuB4U=;
        fh=zQdso+K0JarTXp41sOlIBqqi8senjxaIqkz45p3ibLg=;
        b=g5nK8QAKTjwvBpLzgGRdfo+jwB7DGVedFTo6N4wQDZOgqcBfLNOfa5SRBli8z6SulD
         j2q5eEQqScOnU7+/PL6NsnxzkZKFHKwRo2ajfid315TKu0wIrFHIaAdPEJLtWKKr1+Ac
         qXfE/z7RQ6iLh8lOFZzt2CcEOlzp7E/rhWe03QBtXywKVJsuWcHcla2wcOmyNqtscXpX
         IOZjrjHnRgrIz8zHjSAPxJwVvj71VrOgZ1mJ7Ehqb0oal9TNnf5QEFzLV5qrjAwYmBmE
         qcN5Oguvzl2rse/TO4yGi8VKtmpOwDK3jVVd1w+rKuu9mjFxSwC8H1VXtsk8U/l5um/r
         yVKw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772718725; x=1773323525; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZyEoKNZ9+FBEZoQGrBgOEAt7Mvz4sJQ58VTFJSuB4U=;
        b=bZYgyc2uit3QfjwlKedjcUew4sNLhmNmLKHNpNyaZNi5VMFqCm0Kh9S1NNvfW5prRy
         M3vsATm/MtzQ1siDtnE+0d612tY9UBVE0eRmdFEjYYW0rgRgs8EyDPyREsSab4lRr3F3
         fkCHnCF9Ojybhp3P7ZWUfR0l1XxayxzWqtGuaVY/A5uhMCFdx1WfSLYN7ussCJY/rpi2
         03eU/IGEAUAPiRkNaXVM8g+K+8QxKb2Keqs1ke47vTZv1szM/WLxppyvWaz1sX8zMYfq
         DJr05RT+1YiwbVe9uT4iJRlLU7zm19sh8ELPJKvzwdDoZU+WLKPMaIAjH+rzzKYK01mQ
         NNnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772718725; x=1773323525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NZyEoKNZ9+FBEZoQGrBgOEAt7Mvz4sJQ58VTFJSuB4U=;
        b=e95Q9WWuBri38ipmoGRdbBmkO65nzm0a1xbis5jDZ77vATFbsmAHDEwu+4iklPLXf7
         ceTBBVY4Fht5qOrN6w6bM8OURhAoEwdYah69ZbBKS5rcFGSnIfcj6VJ5m6t0IoU83vO/
         v+Z9QaopOT815UudWzc0yrI0apWLV6/1utqyBxaysP+QkMG2IupUfu2vYMAvfIrQrpu4
         UkW/25mVLucQ8+Fso/kkhbD3VCxCTxmrN3pQwlHHAEO9hT3r88k8mB4FPy4EKY7Ir4mc
         Op1hotN9pCCTPmBEv43MeP5gdcqDnjTK+cK4gm1ipum90g74TApeLdfpOHW2p+HTKfLr
         U13w==
X-Forwarded-Encrypted: i=1; AJvYcCWTwaIU+Epvrd7C6LuR0uSuVWMyV6VVUAVQ72r4/IyMkgAcXr5Imh5vndDxWdRGnsO+3DSWc53YSDo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwwX+TzYUxI0PwboG5Dpi/Fz5kNVEIWx0mPzp1/Af/HeCfU80+L
	J4syTxJ5wF0dDGJkN7ah7aQv3dB7ZWDHuv1QDZmsL1A+hmQF+Fu6rWprCcGfz5d3y/e9NnMmidR
	GehNsDaItr/hGxBV/Cr4JfevzIha4NH4QelgHeiw=
X-Gm-Gg: ATEYQzy0g/pycvQzghlfRHITWDx5DnVrSLta/7Mb0ftxm4wu6EeGMWYk6AxGdYuqqTg
	3qOr9FSzUvdayA9gU0Cm1hrLq2XYXGvqpQEaQuxPPslYVJW9wG9Y5KeHeTmMKhn/bac0f6JhkES
	rzBqinOs+q5qPY1Oj2Mg23+lpee4JnkV+SaTvqGMPP3smA0tNGd5fhRdqk3hgQWxqw0qIdKoQFq
	cmzkl+362a6MOMRlbN2Xo1IkeJ+Owwi0eo47trYS9isHd3OZ5ISDHLwRl0+HTZHjpxELycteQru
	VQAFcRI4yR8DeIN4vbg81Q1fwkTzOgh1dXoSs7tU5b42w+xPTk8v5qHMzpu25v/tm4fQYLAC0sW
	kjkmd6PQ=
X-Received: by 2002:a17:907:3c8c:b0:b87:701d:341a with SMTP id
 a640c23a62f3a-b93f1372c8bmr367272966b.25.1772718725247; Thu, 05 Mar 2026
 05:52:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1772714348.git.zhoubinbin@loongson.cn> <8b8dbdc580fd2e2ebf1d5990e55e4a50db1b253a.1772714348.git.zhoubinbin@loongson.cn>
In-Reply-To: <8b8dbdc580fd2e2ebf1d5990e55e4a50db1b253a.1772714348.git.zhoubinbin@loongson.cn>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 5 Mar 2026 15:51:27 +0200
X-Gm-Features: AaiRm51vh4mEPHUkSIfvf4ZLeVmD0p7aetq1ZB0tT3uMdF2f-JUBdgLw69Qz0Bg
Message-ID: <CAHp75VfmupH=dE=L3+vboo7D9DDEMvU-Hwy6HwuVFsg1iB7hcw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] i2c: ls2x-v2: Add driver for Loongson-2K0300 I2C controller
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-i2c@vger.kernel.org, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 5, 2026 at 2:57=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.cn>=
 wrote:
>
> This I2C module is integrated into the Loongson-2K0300 SoCs.
>
> It provides multi-master functionality and controls all I2C bus-specific
> timing, protocols, arbitration, and timing. It supports both standard
> and fast modes.

...

> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>

+ time.h // for USEC_PER_* et alia.

> +#include <linux/types.h>
> +#include <linux/units.h>

...

> +/**
> + * struct loongson2_i2c_priv - private data of the controller
> + * @adapter: I2C adapter for this controller
> + * @complete: completion of I2C message
> + * @clk: hw i2c clock
> + * @regmap: regmap of the I2C device
> + * @parent_rate: I2C clock parent rate in MHz
> + * @msg: I2C transfer information
> + */
> +struct loongson2_i2c_priv {
> +       struct i2c_adapter              adapter;
> +       struct completion               complete;
> +       struct clk                      *clk;
> +       struct regmap                   *regmap;
> +       unsigned long                   parent_rate;

it's better to keep units in the variable name

       unsigned long                   parent_rate_MHz;

// yes, it's fine to spell the unit suffix as it's in physics.

> +       struct loongson2_i2c_msg        msg;
> +};

...

> +static void loongson2_i2c_handle_rx_done(struct loongson2_i2c_priv *priv=
)
> +{
> +       struct loongson2_i2c_msg *msg =3D &priv->msg;

> +       u32 i;

Not needed to be here (see below how).

> +       switch (msg->count) {
> +       case 2:
> +               /*
> +                * The STOP/START bit has to be set before reading the la=
st two bytes.
> +                * After that, we could read the last two bytes.
> +                */
> +               regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR1, LOONG=
SON2_I2C_CR1_OP_MASK,
> +                                  msg->stop ? LOONGSON2_I2C_CR1_STOP : L=
OONGSON2_I2C_CR1_START);

> +               for (i =3D 2; i > 0; i--)
> +                       loongson2_i2c_read_msg(priv);

First of all, in another case the type of iterator is unsigned int.
Second, this iterator is not used outside of the for-loop, third, the
upper limit is already known, no need to use magic, hence

               for (unsigned int i =3D 0; i < msg->count; i++)

> +               loongson2_i2c_disable_irq(priv);
> +
> +               complete(&priv->complete);
> +               break;
> +       case 3:
> +               /*
> +                * In order to generate the NACK after the last received =
data byte, enable NACK
> +                * before reading N-2 data
> +                */
> +               regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR1, LOONG=
SON2_I2C_CR1_ACK, 0);
> +               loongson2_i2c_read_msg(priv);
> +               break;
> +       default:
> +               loongson2_i2c_read_msg(priv);
> +               break;
> +       }
> +}

...

> +static int loongson2_i2c_xfer(struct i2c_adapter *i2c_adap, struct i2c_m=
sg msgs[], int num)
> +{
> +       struct loongson2_i2c_priv *priv =3D i2c_get_adapdata(i2c_adap);
> +       struct device *dev =3D priv->adapter.dev.parent;
> +       unsigned int i, status;
> +       int ret;
> +
> +       /* Wait I2C bus free */
> +       ret =3D regmap_read_poll_timeout(priv->regmap, LOONGSON2_I2C_SR2,=
 status,
> +                                      !(status & LOONGSON2_I2C_SR2_BUSY)=
,
> +                                      LOONGSON2_I2C_FREE_SLEEP_US,
> +                                      LOONGSON2_I2C_FREE_TIMEOUT_US);
> +       if (ret) {
> +               dev_dbg(dev, "The I2C bus is busy now.\n");
> +               return ret;
> +       }
> +
> +       /* Start generation */
> +       regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR1, LOONGSON2_I2C=
_CR1_START,
> +                          LOONGSON2_I2C_CR1_START);

> +       for (i =3D 0; i < num; i++) {

       for (unsigned int i =3D 0; i < num; i++) {

> +               ret =3D loongson2_i2c_xfer_msg(priv, &msgs[i], i =3D=3D n=
um - 1);
> +               if (ret < 0)
> +                       return ret;
> +       }
> +
> +       return num;
> +}

...

> +static int loongson2_i2c_adjust_bus_speed(struct loongson2_i2c_priv *pri=
v)
> +{
> +       struct device *dev =3D priv->adapter.dev.parent;
> +       struct i2c_timings i2c_t;
> +       u32 val, freq_mhz, ccr;

freq_MHz
(or at least make the parent_rate and this one consistent with the
suffixes in use)

> +       i2c_parse_fw_timings(dev, &i2c_t, true);
> +       priv->parent_rate =3D clk_get_rate(priv->clk);
> +
> +       if (i2c_t.bus_freq_hz =3D=3D I2C_MAX_STANDARD_MODE_FREQ) {
> +                /* Select Standard mode */
> +               ccr =3D 0;
> +               val =3D DIV_ROUND_UP(priv->parent_rate, i2c_t.bus_freq_hz=
 * 2);
> +       } else if (i2c_t.bus_freq_hz =3D=3D I2C_MAX_FAST_MODE_FREQ) {
> +               /* Select Fast mode */
> +               ccr =3D LOONGSON2_I2C_CCR_FS;
> +               val =3D DIV_ROUND_UP(priv->parent_rate, i2c_t.bus_freq_hz=
 * 3);
> +       } else {

> +               dev_err(dev, "Unsupported speed (%uhz)\n", i2c_t.bus_freq=
_hz);

hz --> Hz (in the message)

> +               return -EINVAL;
> +       }

It seems part of the probe phase, so why not

  return dev_err_probe(...);

?

> +       FIELD_MODIFY(LOONGSON2_I2C_CCR_CCR, &ccr, val);
> +       regmap_write(priv->regmap, LOONGSON2_I2C_CCR, ccr);
> +
> +       freq_mhz =3D DIV_ROUND_UP(priv->parent_rate, HZ_PER_MHZ);
> +       regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR2, LOONGSON2_I2C=
_CR2_FREQ,
> +                          FIELD_GET(LOONGSON2_I2C_CR2_FREQ, freq_mhz));
> +
> +       regmap_update_bits(priv->regmap, LOONGSON2_I2C_TRISE, LOONGSON2_I=
2C_TRISE_SCL,
> +                          LOONGSON2_I2C_TRISE_SCL);
> +
> +       /* Enable I2C */
> +       regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR1, LOONGSON2_I2C=
_CR1_PE,
> +                          LOONGSON2_I2C_CR1_PE);
> +
> +       return 0;
> +}

--=20
With Best Regards,
Andy Shevchenko
