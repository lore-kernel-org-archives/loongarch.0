Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582EC38C2DB
	for <loongarch@lists.linux.dev>; Tue,  3 Mar 2026 09:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772529680; cv=pass; b=mvLK/6LO+yk7QGBvPV4fXXFe9L6Zsmw7uCyR34CNbdG9+MDexm2KQsoIA9D2lLa5ZXHYGdTfiipb9q++wl1BFD2LKdOluSIeedpwr4JdrxjScFUe5oqdkRVMT+KU/HhBbaqGHl53wh5gy60L8LYOY9wrGN+FLvqoOtIqwaKAogA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772529680; c=relaxed/simple;
	bh=qUC4hlaUmuE3q9EP1O1YjY8UBnpLS5yfmPzZcVaubz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WnrDf4DGpoihw0aGddZe8gNMeq4RpHk80R4s90wVE8v2gnFEsb/PslUXDZzbTidVd7k/5v2Xt09xCGw+syzCPoIfIvGVJbD5geSrKBmjfRVdiKKu0qIqu81QHnHtbZjcaqasbl9n6cTVPrrqxCdm8DsXiJCr/VlTjRehDO2paAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y/20pMpU; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y/20pMpU"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-65c5a7785b4so7844217a12.1
        for <loongarch@lists.linux.dev>; Tue, 03 Mar 2026 01:21:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772529678; cv=none;
        d=google.com; s=arc-20240605;
        b=K2ZIiJcn2mUbZ5k5A1v+nMw1TLOgGIHVfjUa05nNQzwJrXZrXoNNWlQ7fRbyVWULJ5
         nP7tK5TBx/4AEE9eDMWi7i7v0g7sBkp43GpYd++ge+Iu5nuy1qnJ07mVFRr5CwRuMqal
         lQSzNKdKqVPTF/wwgm6lQWvqrozCCauZR5WUuC5Sv84e6xyk5WEIy/uusnI3cCBDQTgn
         7cUgVntwcVz4xZdqFCQ9HCPmBlv3ztVEgATNnLJmcGHwY6/OLVnlwD55dzqx4TKamgzx
         +iNoxA3z6T3+qcuiKvZHM+SGtCabmilHt0KBY9EQUhWeLGQwu93pFmXwRheAhmyJEPfv
         nBKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b+6M2KZPF5EI514CqHFmtrBWN6sT/McXIxVWsbPFXH8=;
        fh=4RbM7SiIn+I68o9fgRYIWN92OpJkkCIMJ28nbFzT+gs=;
        b=FDsu3B0jnutuht7cmak41dshzYYv+0dnPvZTjYSyNjAQnXkL870nccCHaeohpRgd9V
         xYvVxYsI/Nf3RYTpG4F4tjBEdchOoiJJhiA47fhmwDMJqgAZRdnkszelw0Vn/85Q8OVd
         UZusX1DASwwlKutJ9tVJR5Uz7zxnNzAlKpF8UNhdOdImBCe/JMjJPncbXbvj2tEyr56D
         b4PiTjUuPjE4aYuE61MYpDmZi8H/8FCB6RyME53x99G41cG4Na63D350/ACR/AHt7Np7
         jH1o5GjGcOzJ7XvqDCqxygXYRznykm1aJh4DyHeKh7wDdPw5Ze6MeM+loydSkPmKxQFL
         PaIA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772529678; x=1773134478; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b+6M2KZPF5EI514CqHFmtrBWN6sT/McXIxVWsbPFXH8=;
        b=Y/20pMpUMtfTuJfM1fb6MCMdxOF4dDYncUGJWUBshPh1N9lDcRN2UAxWxlzfRc5ux2
         x0rHIOvHQXJOD/sI7ofJ66ABAEIu0P+BI0AgMIET1KmMu1ZKZMVyYN9l4tdkCpvv1LgZ
         g61PDrjCXhvg/unQhNp1VDAHU0cytyzZ5Nh0lacmkJVtJNDo/ICD7hz0EamHKRhnGDO5
         NXEXSH5D2Kz9CaQ0XdzHoh33BE3vBKLBfMtAU0+mO7S2OE3Dd9iyAObXwvQAC3XWxFN2
         l9q379z65qmgpMNy3mj27gIKlbfab/cX1FWnWQV2Ert4JkeBxKrFlpMKtN6DQbkVzdtB
         A4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772529678; x=1773134478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b+6M2KZPF5EI514CqHFmtrBWN6sT/McXIxVWsbPFXH8=;
        b=ObbCdonga4YZbWWOJ8hqFww9oVMapsgs+nMn8DN5pbbWNkKYSBHtLUxBNsquVxZImf
         AsN/AhMyK9Th/FqR7T2A1tLJOx1NYw7UUTVSZvOR/KC7yXqvYQrpIKnwY+Uw4hB+Ehea
         rNHj8GCGFluIal/KIJXv1dxYXYbrVynM7EBx40eWbiq/QWKG3wHv+jhkAoBhiZ34K/Jj
         clrl4WSeLBmc0OepmrxcXDRh6ZP9/Mla05iXxIyHUQn9qdSu956GAFyDliyPo0aePb04
         2DfhRYZ/YNe4jmcYeAb5bQwaGYgsbG7bOI0gdBmCtT1WxId4aFj5SoIR2rZw7ocqbxnf
         AaVw==
X-Forwarded-Encrypted: i=1; AJvYcCX9bZyOEHawyJoQLMG4mxfMTdTpcj8G1UfSZMZb8vCG7zpbgNqvcIo/wv6CAe4GhFM4TcQYL9lZF9M=@lists.linux.dev
X-Gm-Message-State: AOJu0YzlbKzipAT5OXonfuR6LmnswNyaLLaGmj70Qu/YBFpKX0AU4UEb
	wCH/WJm4b0crwczqBfNhqj9yknhnXF7iTXoxKSL7leuPiX6bb4oTOYwe80FToC0Pghr9ccaX8ll
	z77AA6O/6kV6548DtgdmdzGGaavHjMOY=
X-Gm-Gg: ATEYQzzoi8CY2w5IghBMOOr2T6UkVs1JX2iy3KQX/Ed36TF6o5PuiK3Q742UlXF+Myo
	yW+vnDgaPBFRw79WevF2Rxtj9SnuRLyJtCrHBSzG8/N5z+IFuKZ90LFNZT9d+uSeNGhe23OfFNi
	IErg7cs1nurZ+W2mO2CbPnwSXcdD/R7QRPJ7RyyIQ73cCG7h0z2pHJooaFUTERhD0fGniUL4T5q
	eq8121DeyHbHE5GAhGqFr8OBscOMXl/BEctM43+IyLLfFT0t+fK0QNJQVkaL9X/HiJvUEw1kKUM
	tSBWKKs=
X-Received: by 2002:a17:907:3d51:b0:b93:62dd:a4a4 with SMTP id
 a640c23a62f3a-b93765924famr1000653266b.51.1772529677321; Tue, 03 Mar 2026
 01:21:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1772001073.git.zhoubinbin@loongson.cn> <27899156d9218ced7cb0679cad2b2f59f688bd99.1772001073.git.zhoubinbin@loongson.cn>
 <aZ7Jq5GTbROvcrJH@smile.fi.intel.com>
In-Reply-To: <aZ7Jq5GTbROvcrJH@smile.fi.intel.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 3 Mar 2026 17:21:05 +0800
X-Gm-Features: AaiRm53N21CC9RPmD2Ik9krhB2wBhnxwcc0xxmriyv_oPuqBCDKnV5p1bMyZQPI
Message-ID: <CAMpQs4J2NS23seuNWQOUeBxGF+=L=XZL9j478xc=bZx4x9v5Ww@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] i2c: ls2x-v2: Add driver for Loongson-2K0300 I2C controller
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-i2c@vger.kernel.org, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy:

Sorry for the late reply.

On Wed, Feb 25, 2026 at 6:06=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Wed, Feb 25, 2026 at 03:34:44PM +0800, Binbin Zhou wrote:
> > This I2C module is integrated into the Loongson-2K0300 SoCs.
> >
> > It provides multi-master functionality and controls all I2C bus-specifi=
c
> > timing, protocols, arbitration, and timing. It supports both standard
> > and fast modes.
>
> ...
>
> > +struct loongson2_i2c_priv {
> > +     struct i2c_adapter              adapter;
> > +     struct completion               complete;
> > +     struct clk                      *clk;
> > +     struct regmap                   *regmap;
>
> > +     int                             speed;
> > +     int                             parent_rate;
>
> May any of these two be negative? The kernel doc says nothing about that.

It should be:

u32 speed;
unsigned long parent_rate;
>
> > +     struct loongson2_i2c_msg        msg;
> > +};
>
> ...
>
> > +static void loongson2_i2c_handle_read(struct loongson2_i2c_priv *priv,=
 int flag)
> > +{
> > +     struct loongson2_i2c_msg *msg =3D &priv->msg;
> > +     unsigned int i;
> > +     bool changed;
> > +
> > +     switch (msg->count) {
> > +     case 1:
> > +             /* only transmit 1 bytes condition */
> > +             loongson2_i2c_disable_irq(priv);
> > +             loongson2_i2c_read_msg(priv);
> > +             complete(&priv->complete);
> > +             break;
> > +     case 2:
> > +             if (flag !=3D 1) {
> > +                     /* ensure only transmit 2 bytes condition */
> > +                     regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR=
2,
> > +                                        LOONGSON2_I2C_CR2_ITBUFEN, 0);
> > +                     break;
> > +             }
> > +             regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR1, LOONG=
SON2_I2C_CR1_OP_MASK,
> > +                                msg->stop ? LOONGSON2_I2C_CR1_STOP : L=
OONGSON2_I2C_CR1_START);
> > +
> > +             loongson2_i2c_disable_irq(priv);
> > +
> > +             for (i =3D msg->count; i > 0; i--)
> > +                     loongson2_i2c_read_msg(priv);
> > +
> > +             regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR1, LOONG=
SON2_I2C_CR1_POS, 0);
> > +             complete(&priv->complete);
> > +             break;
> > +     case 3:
> > +             regmap_update_bits_check(priv->regmap, LOONGSON2_I2C_CR2,=
 LOONGSON2_I2C_CR2_ITBUFEN,
> > +                                      0, &changed);
> > +             if (changed)
> > +                     break;
> > +             regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR1, LOONG=
SON2_I2C_CR1_ACK, 0);
> > +             fallthrough;
>
> Instead better to spell it explicitly:
>
>                 loongson2_i2c_read_msg(priv);
>                 break;
>
> > +     default:
> > +             loongson2_i2c_read_msg(priv);
>
> Missing break.
>
> > +     }
> > +}
>
> This also make me think for the possible optimisations.
> if regmap_updates_bit() in case 2 can be run after the completion,
> the case 1 with a parameter may be split to a helper.
>
> Also would be nice to have a comment why in case 3 we only read a single
> message.

This part might be a bit confusing. I'll try to restructure it, which
might make it clearer.

In `loongson2_i2c_isr_event()`, the read/write operations are divided
into three parts.

        /* TX empty */
        if ((event & LOONGSON2_I2C_SR1_TXE) && !(msg->addr & I2C_M_RD))
                loongson2_i2c_handle_write(priv);

        /* RX not empty */
        if ((event & LOONGSON2_I2C_SR1_RXNE) && (msg->addr & I2C_M_RD))
                loongson2_i2c_handle_read(priv);
//Handle FIFO empty interrupt in case of read, it is called when a new
data is received in data register

        /*
         * The BTF (Byte Transfer finished) event occurs
         */
        if (event & LOONGSON2_I2C_SR1_BTF) {
                if (msg->addr & I2C_M_RD)
                        loongson2_i2c_handle_rx_done(priv);
//Handle byte transfer finished interrupt in case of read
                else
                        loongson2_i2c_handle_write(priv);
        }


static void loongson2_i2c_handle_read(struct loongson2_i2c_priv *priv)
{
        struct loongson2_i2c_msg *msg =3D &priv->msg;

        switch (msg->count) {
        case 1:
                loongson2_i2c_disable_irq(priv);
                loongson2_i2c_read_msg(priv);
                complete(&priv->complete);
                break;
        case 2:
        case 3:
                /*
                 * For 2-byte/3-byte reception and for N-byte
reception with N > 3, we have to
                 * wait for byte transferred finished event before reading =
data.
                 * Just disable buffer interrupt in order to avoid
another system preemption due
                 * to RX not empty event.
                 */
                regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR2,
LOONGSON2_I2C_CR2_ITBUFEN, 0);
                break;
        default:
                /*
                 * For N byte reception with N > 3 we directly read
data register
                 * until N-2 data.
                 */
                loongson2_i2c_read_msg(priv);
                break;
        }
}

static void loongson2_i2c_handle_rx_done(struct loongson2_i2c_priv *priv)
{
        struct loongson2_i2c_msg *msg =3D &priv->msg;
        u32 i;

        switch (msg->count) {
        case 2:
                /*
                 * The STOP/START bit has to be set before reading the
last two bytes.
                 * After that, we could read the last two bytes.
                 */
                regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR1,
LOONGSON2_I2C_CR1_OP_MASK,
                                   msg->stop ? LOONGSON2_I2C_CR1_STOP
: LOONGSON2_I2C_CR1_START);

                for (i =3D 2; i > 0; i--)
                        loongson2_i2c_read_msg(priv);

                loongson2_i2c_disable_irq(priv);
                complete(&priv->complete);
                break;
        case 3:
                /*
                 * In order to generate the NACK after the last
received data byte, enable NACK
                 * before reading N-2 data
                 */
                regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR1,
LOONGSON2_I2C_CR1_ACK, 0);
                loongson2_i2c_read_msg(priv);
                break;
        default:
                loongson2_i2c_read_msg(priv);
                break;
        }
}

>
> ...
>
> > +static void loongson2_i2c_handle_write(struct loongson2_i2c_priv *priv=
)
> > +{
> > +     struct loongson2_i2c_msg *msg =3D &priv->msg;
> > +
> > +     if (msg->count) {
> > +             loongson2_i2c_write_msg(priv, *msg->buf++);
>
> > +             msg->count--;
> > +             if (!msg->count)
>
> Can be
>
>                 if (!--msg->count)
>
> but someone may find it difficult to correctly parse.
>
> > +                     regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR=
2,
> > +                                        LOONGSON2_I2C_CR2_ITBUFEN, 0);
> > +     } else {
> > +             loongson2_i2c_terminate_xfer(priv);
> > +     }
> > +}
>
> ...
>
> > +static int loongson2_i2c_adjust_bus_speed(struct loongson2_i2c_priv *p=
riv)
> > +{
> > +     u32 val, freq_mhz, ccr;
> > +
> > +     priv->parent_rate =3D clk_get_rate(priv->clk);
>
> > +     freq_mhz =3D DIV_ROUND_UP(priv->parent_rate, HZ_PER_MHZ);
>
> Usually the rule of thumb to put assignments close to its first user...

See blow.
>
> > +     if (priv->speed =3D=3D I2C_MAX_STANDARD_MODE_FREQ) {
> > +              /* Select Standard mode */
> > +             ccr =3D 0;
> > +             val =3D DIV_ROUND_UP(priv->parent_rate, I2C_MAX_STANDARD_=
MODE_FREQ * 2);
> > +     } else {
> > +             /* Select Fast mode */
> > +             ccr =3D LOONGSON2_I2C_CCR_FS;
> > +             val =3D DIV_ROUND_UP(priv->parent_rate, I2C_MAX_FAST_MODE=
_FREQ * 3);
> > +     }
> > +
> > +     FIELD_MODIFY(LOONGSON2_I2C_CCR_CCR, &ccr, val);
> > +     regmap_write(priv->regmap, LOONGSON2_I2C_CCR, ccr);
>
> ...somewhere here.
>
> > +     regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR2, LOONGSON2_I2C=
_CR2_FREQ,
> > +                        FIELD_GET(LOONGSON2_I2C_CR2_FREQ, freq_mhz));
> > +     regmap_update_bits(priv->regmap, LOONGSON2_I2C_TRISE, LOONGSON2_I=
2C_TRISE_SCL,
> > +                        LOONGSON2_I2C_TRISE_SCL);
> > +
> > +     /* Enable I2C */
> > +     regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR1, LOONGSON2_I2C=
_CR1_PE,
> > +                        LOONGSON2_I2C_CR1_PE);
> > +
> > +     return 0;
> > +}
>
> ...
>
> > +     priv->speed =3D I2C_MAX_STANDARD_MODE_FREQ;
> > +     ret =3D device_property_read_u32(dev, "clock-frequency", &clk_rat=
e);
> > +     if (!ret && clk_rate >=3D I2C_MAX_FAST_MODE_FREQ)
> > +             priv->speed =3D I2C_MAX_FAST_MODE_FREQ;
>
> Please, use i2c_parse_fw_timings() instead of custom approach.

This section will be merged into `loongson2_i2c_adjust_bus_speed()`,
and `bus_freq_hz` will replace `priv->speed` as follows:

static int loongson2_i2c_adjust_bus_speed(struct loongson2_i2c_priv *priv)
{
        struct i2c_timings i2c_t;
        ....

        i2c_parse_fw_timings(dev, &i2c_t, true);
        priv->parent_rate =3D clk_get_rate(priv->clk);

        if (i2c_t.bus_freq_hz =3D=3D I2C_MAX_STANDARD_MODE_FREQ) {
                 /* Select Standard mode */
                ccr =3D 0;
                val =3D DIV_ROUND_UP(priv->parent_rate, i2c_t.bus_freq_hz *=
 2);
        } else if (i2c_t.bus_freq_hz =3D=3D I2C_MAX_FAST_MODE_FREQ) {
                /* Select Fast mode */
                ccr =3D LOONGSON2_I2C_CCR_FS;
                val =3D DIV_ROUND_UP(priv->parent_rate, i2c_t.bus_freq_hz *=
 3);
        } else {
                dev_err(dev, "Unsupported speed (%uhz)\n", i2c_t.bus_freq_h=
z);
                return -EINVAL;
        }

......
        freq_mhz =3D DIV_ROUND_UP(priv->parent_rate, HZ_PER_MHZ);
        regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR2,
LOONGSON2_I2C_CR2_FREQ,
                           FIELD_GET(LOONGSON2_I2C_CR2_FREQ, freq_mhz));
.............

        return 0;
}

>
> --
> With Best Regards,
> Andy Shevchenko
>
>

--
Thanks.
Binbin
