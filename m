Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E873345734
	for <loongarch@lists.linux.dev>; Fri,  6 Mar 2026 06:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772777591; cv=pass; b=C+88Jv/BkWdY8mQpC0DnM9V2J8sR3ZrypffYeolBCEHC9Iz2XvftNsWEdMYOz+Sf4k1dqnWPaa/gDkRKcRBkgED6i9JTUE9lm02zgku20dzsPTPKzh9zGQHH8iaaqKdhWhRjqcbpst3J9KSLie68DgiUcOvHC7BwiiLStNXlASg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772777591; c=relaxed/simple;
	bh=J9ejm7l2pDDZBEBAmBnyioiS0RjaAA3R3XJo0dQw3zU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CTctJvB7jJtFbi6G8BOYZlVJ3vWAxlyp+WSKfzFPyFxOBL8c+MbNi15GP+F4/ryTaQ7etZtnMehgiZ0K0MLdpelayYhNWKW/mu1FklIvzwicMFDGvkFeR/EAUQsqF2ZOtrG0TIviPFDjNbfm8kz89JgQsOBs0dD/u1NYLGv4JXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GbjZ7vOm; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GbjZ7vOm"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b8fbb24a9a9so1451364166b.0
        for <loongarch@lists.linux.dev>; Thu, 05 Mar 2026 22:13:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772777589; cv=none;
        d=google.com; s=arc-20240605;
        b=d8oq75fPgFmr28bGgzVfvrzdb1cmcnWIfuEX8bI2YAm3HIPvzg6USFMA9yiXC1rZ2d
         yS27gXHER39JVMvJ6To3CsvEcy+p4gAcn0tTqQAuecWyrxWXQtk2ZOxfcpW9QADjSR1A
         PhsiG6nV5csszBUfI7Q+PbFsUwBCW22B082zx5il6aQrTZoiaC/dQFVxyDvZKaVVvEpR
         Qveg65cCfmlU1SJzBuo19mpjUgiui55az/ierS+rGFkKQNGNIESdz0P1X7/MXqqVAATj
         /oNMD1b9aNt0MLtomLRnSVwyq8kY1iHkV1/WLai+BR2X5hGN1VQIQaOxqsIvWmf2i8eG
         XnQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t8VAPLzN3H0mvNexfeYo6kcXoCX1WV6dDMHioOJ34WQ=;
        fh=CUIcg4UKPbOt9bRQHaWQrxKef8Rxvwqao9BtDGQL378=;
        b=QdHjsgncIOSxbiXimYnT00qHq3p1mjMmwJS50aNfx657It1wwo1kBt1P+fM6iWNVM3
         6QSzFH9h37xeMaXghjWDCmIzt8vPa5289/8rnLnaxl+ATvIZH4UeWduJm+pogaNwuL1V
         IMWteTmK68NKRpfpzCuo04+s1tyGxwHpy1lKzy6CaGUuqIGrOSsRgekNDJjRRBdnjM5i
         xEO2sq9w54d86AavhG4OALJNDBKKU5jOYBVAWgLc9IZPAikmRz6qm7T9vA4ZZTXEc/s5
         I/UqsrA3VjWW2BgITLdrRgULIJ9DH6M1WYeF8b+kxc1nHjyfjpmLrGZuhAK/PT11ow3G
         piAw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772777589; x=1773382389; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t8VAPLzN3H0mvNexfeYo6kcXoCX1WV6dDMHioOJ34WQ=;
        b=GbjZ7vOmJVjBcnyLgZ6+1WAkWLjRVf7RbAFVD3tO2qNpC25NSeOptP1RDHs6sj/IGP
         swAzCrgr1TmtIigdyNgoZvok3uIrjTPXyz2IssFsoqaWftf+RWSa+sXmvvJHf8/lZIyq
         OIzpojHJ3E9WMk0VN45AKGF9G6OpnQQHUuK6O5QpFC0hMnDK5Gw8HE8Krs5Abz1OC0G3
         aUtVitNMHumrcIaCm4fyKX5LrBjw7utY6a8mKU47mnbHoGujCTNq9BT1Blz2/DvHCH9S
         pideOoaGNjVxAdHiljKuyNGaaNh87WWJ092pqN63dFvv3ZXku5XX+bJnBKr25JUqpkSV
         zqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772777589; x=1773382389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t8VAPLzN3H0mvNexfeYo6kcXoCX1WV6dDMHioOJ34WQ=;
        b=J/yPqf890hFw90txY+NMbUGu5yAfAddt7ROW3iW+PIuLxn/e2A20jUh0khXlK6w2PH
         0g2Gmh+oWZ15znq7BtSrKzfYvJGsItTm3fsWrZB6Eq/S9WVhTKns8Ih3XQ6qAWg51ZlA
         TaIpYAu7F/xY5Cam+AxlWwPUTmHKpnzt442pX8g/053Aw3n6t8LTA+BGJSo+l06OMlbH
         pUDZ6fgMMs31aWaxy+8te4MUoGdfqq3B8AwK8hNPz6AZSu4KERHrpa/wPqajnDtRgE6n
         9MHsK6+rEQJv2rHcE0rpfZqARq881SgcpZMIEywEBO/9zOrOZProg2z0p/XPo17TAdm7
         B2cA==
X-Forwarded-Encrypted: i=1; AJvYcCVEIqry4iNRaKSesuAAteWQ0HLxLbE/+r26+NYSCNCOTxxll8gxad7zf889AP0XSYADnrMuO2NdfNE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyhibmam4bM+lyKBT+19iVlcXhFbk5ek4uDDGdNB38ddozJAcR6
	Lz6XIOiTWntEMF93G/fimBR02GnY4ot+qD9FpVJJgdlfCTkxcOfflUzQ6xplAxub1jWkP9vJPd0
	QtapIVwy1nRf9g3UBhM9xKwsi6CtPm1k=
X-Gm-Gg: ATEYQzzpilCww34HZ2fQLAvJLQ6ma7Ul9oUaKeL4/vM1MLRdL6fAgHkIdxlFZLB463a
	7moL7uHTewaTR0kCptK24lDAxlYVkiu+Qh4Vy5H7LJgXbNhbsh3UTp0jytCfxid8WCwwfY75BDv
	o/JEscen9PwrobtJyc6Ol3CicmExqMmDRvWfumUappaAyIw0ap6ts6wAvzu3mPfS6XgfmSMf/ec
	3Q1IIRNdXOrV/FEnqbkyGkcmXD1wDdcbO6R4ZuMw++VqUqjLlAdQuAgqHXIsq6XNARlmFuOyLnF
	eh3oRP4=
X-Received: by 2002:a17:907:94d3:b0:b93:514c:b420 with SMTP id
 a640c23a62f3a-b942d06f5a0mr62179866b.13.1772777588346; Thu, 05 Mar 2026
 22:13:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1772714348.git.zhoubinbin@loongson.cn> <8b8dbdc580fd2e2ebf1d5990e55e4a50db1b253a.1772714348.git.zhoubinbin@loongson.cn>
 <CAHp75VfmupH=dE=L3+vboo7D9DDEMvU-Hwy6HwuVFsg1iB7hcw@mail.gmail.com>
In-Reply-To: <CAHp75VfmupH=dE=L3+vboo7D9DDEMvU-Hwy6HwuVFsg1iB7hcw@mail.gmail.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Fri, 6 Mar 2026 14:12:54 +0800
X-Gm-Features: AaiRm50an37wagGCXboOs8Vds_uSmaHBQQtCYdqmiBRo3BO64gJxH74nqdBEb8c
Message-ID: <CAMpQs4KC42_2HwSnW7gDZm+vZv0H6eO0eV4=1ooY1Kx3yeRzXQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] i2c: ls2x-v2: Add driver for Loongson-2K0300 I2C controller
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-i2c@vger.kernel.org, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy:

Thanks for your continued review of the patch.

On Thu, Mar 5, 2026 at 9:52=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Thu, Mar 5, 2026 at 2:57=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.c=
n> wrote:
> >
> > This I2C module is integrated into the Loongson-2K0300 SoCs.
> >
> > It provides multi-master functionality and controls all I2C bus-specifi=
c
> > timing, protocols, arbitration, and timing. It supports both standard
> > and fast modes.
>
> ...
>
> > +#include <linux/bitfield.h>
> > +#include <linux/bits.h>
> > +#include <linux/clk.h>
> > +#include <linux/io.h>
> > +#include <linux/iopoll.h>
> > +#include <linux/i2c.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/property.h>
> > +#include <linux/regmap.h>
>
> + time.h // for USEC_PER_* et alia.
>
> > +#include <linux/types.h>
> > +#include <linux/units.h>
>
> ...
>
> > +/**
> > + * struct loongson2_i2c_priv - private data of the controller
> > + * @adapter: I2C adapter for this controller
> > + * @complete: completion of I2C message
> > + * @clk: hw i2c clock
> > + * @regmap: regmap of the I2C device
> > + * @parent_rate: I2C clock parent rate in MHz
> > + * @msg: I2C transfer information
> > + */
> > +struct loongson2_i2c_priv {
> > +       struct i2c_adapter              adapter;
> > +       struct completion               complete;
> > +       struct clk                      *clk;
> > +       struct regmap                   *regmap;
> > +       unsigned long                   parent_rate;
>
> it's better to keep units in the variable name
>
>        unsigned long                   parent_rate_MHz;
>
> // yes, it's fine to spell the unit suffix as it's in physics.
>
> > +       struct loongson2_i2c_msg        msg;
> > +};
>
> ...
>
> > +static void loongson2_i2c_handle_rx_done(struct loongson2_i2c_priv *pr=
iv)
> > +{
> > +       struct loongson2_i2c_msg *msg =3D &priv->msg;
>
> > +       u32 i;
>
> Not needed to be here (see below how).
>
> > +       switch (msg->count) {
> > +       case 2:
> > +               /*
> > +                * The STOP/START bit has to be set before reading the =
last two bytes.
> > +                * After that, we could read the last two bytes.
> > +                */
> > +               regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR1, LOO=
NGSON2_I2C_CR1_OP_MASK,
> > +                                  msg->stop ? LOONGSON2_I2C_CR1_STOP :=
 LOONGSON2_I2C_CR1_START);
>
> > +               for (i =3D 2; i > 0; i--)
> > +                       loongson2_i2c_read_msg(priv);
>
> First of all, in another case the type of iterator is unsigned int.
> Second, this iterator is not used outside of the for-loop, third, the
> upper limit is already known, no need to use magic, hence
>
>                for (unsigned int i =3D 0; i < msg->count; i++)

Here, we read the last two bytes. In `loongson2_i2c_read_msg()`,
`msg->count` is decremented, so the loop condition here should be:

                     for (unsigned int i =3D msg->count; i > 0; i--)

Also, I will address all other comments in the next version.
>
> > +               loongson2_i2c_disable_irq(priv);
> > +
> > +               complete(&priv->complete);
> > +               break;
> > +       case 3:
> > +               /*
> > +                * In order to generate the NACK after the last receive=
d data byte, enable NACK
> > +                * before reading N-2 data
> > +                */
> > +               regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR1, LOO=
NGSON2_I2C_CR1_ACK, 0);
> > +               loongson2_i2c_read_msg(priv);
> > +               break;
> > +       default:
> > +               loongson2_i2c_read_msg(priv);
> > +               break;
> > +       }
> > +}
>
> ...
>
> > +static int loongson2_i2c_xfer(struct i2c_adapter *i2c_adap, struct i2c=
_msg msgs[], int num)
> > +{
> > +       struct loongson2_i2c_priv *priv =3D i2c_get_adapdata(i2c_adap);
> > +       struct device *dev =3D priv->adapter.dev.parent;
> > +       unsigned int i, status;
> > +       int ret;
> > +
> > +       /* Wait I2C bus free */
> > +       ret =3D regmap_read_poll_timeout(priv->regmap, LOONGSON2_I2C_SR=
2, status,
> > +                                      !(status & LOONGSON2_I2C_SR2_BUS=
Y),
> > +                                      LOONGSON2_I2C_FREE_SLEEP_US,
> > +                                      LOONGSON2_I2C_FREE_TIMEOUT_US);
> > +       if (ret) {
> > +               dev_dbg(dev, "The I2C bus is busy now.\n");
> > +               return ret;
> > +       }
> > +
> > +       /* Start generation */
> > +       regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR1, LOONGSON2_I=
2C_CR1_START,
> > +                          LOONGSON2_I2C_CR1_START);
>
> > +       for (i =3D 0; i < num; i++) {
>
>        for (unsigned int i =3D 0; i < num; i++) {
>
> > +               ret =3D loongson2_i2c_xfer_msg(priv, &msgs[i], i =3D=3D=
 num - 1);
> > +               if (ret < 0)
> > +                       return ret;
> > +       }
> > +
> > +       return num;
> > +}
>
> ...
>
> > +static int loongson2_i2c_adjust_bus_speed(struct loongson2_i2c_priv *p=
riv)
> > +{
> > +       struct device *dev =3D priv->adapter.dev.parent;
> > +       struct i2c_timings i2c_t;
> > +       u32 val, freq_mhz, ccr;
>
> freq_MHz
> (or at least make the parent_rate and this one consistent with the
> suffixes in use)
>
> > +       i2c_parse_fw_timings(dev, &i2c_t, true);
> > +       priv->parent_rate =3D clk_get_rate(priv->clk);
> > +
> > +       if (i2c_t.bus_freq_hz =3D=3D I2C_MAX_STANDARD_MODE_FREQ) {
> > +                /* Select Standard mode */
> > +               ccr =3D 0;
> > +               val =3D DIV_ROUND_UP(priv->parent_rate, i2c_t.bus_freq_=
hz * 2);
> > +       } else if (i2c_t.bus_freq_hz =3D=3D I2C_MAX_FAST_MODE_FREQ) {
> > +               /* Select Fast mode */
> > +               ccr =3D LOONGSON2_I2C_CCR_FS;
> > +               val =3D DIV_ROUND_UP(priv->parent_rate, i2c_t.bus_freq_=
hz * 3);
> > +       } else {
>
> > +               dev_err(dev, "Unsupported speed (%uhz)\n", i2c_t.bus_fr=
eq_hz);
>
> hz --> Hz (in the message)
>
> > +               return -EINVAL;
> > +       }
>
> It seems part of the probe phase, so why not
>
>   return dev_err_probe(...);
>
> ?
>
> > +       FIELD_MODIFY(LOONGSON2_I2C_CCR_CCR, &ccr, val);
> > +       regmap_write(priv->regmap, LOONGSON2_I2C_CCR, ccr);
> > +
> > +       freq_mhz =3D DIV_ROUND_UP(priv->parent_rate, HZ_PER_MHZ);
> > +       regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR2, LOONGSON2_I=
2C_CR2_FREQ,
> > +                          FIELD_GET(LOONGSON2_I2C_CR2_FREQ, freq_mhz))=
;
> > +
> > +       regmap_update_bits(priv->regmap, LOONGSON2_I2C_TRISE, LOONGSON2=
_I2C_TRISE_SCL,
> > +                          LOONGSON2_I2C_TRISE_SCL);
> > +
> > +       /* Enable I2C */
> > +       regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR1, LOONGSON2_I=
2C_CR1_PE,
> > +                          LOONGSON2_I2C_CR1_PE);
> > +
> > +       return 0;
> > +}
>
> --
> With Best Regards,
> Andy Shevchenko

--=20
Thanks.
Binbin
