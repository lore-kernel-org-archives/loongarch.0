Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048772E06E6
	for <loongarch@lists.linux.dev>; Wed, 11 Mar 2026 03:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773198454; cv=pass; b=JlRhEaqS+gib9PQvURYHh8lv/8rLSUYOFywCb2BqN4NIICRKN4sKct3gul/ForewR1OF9SR5gVI4GDKkyJu5PxZBD7EoGYdWu0bmeF6ee5FRumg4GOh0oHjjk4KhNT0W9sIRoGvxMmIbxa0JtAH5Xx3MlYx1EoFg/fcxdRPQLA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773198454; c=relaxed/simple;
	bh=YcdgJwR+tV/SUrqfcIFipReYxQ9TgZ17E68VThHwd3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TfBUpxw5XkmlGKx427B/sIaBH4sNTT/MKxopQZAHvjSAmz3V/cw3jgDxjbR3ltQZugok6zlkrx1RrXnvCIN7vQ+Rv05G/1EUA2jZd1YOATj6LN5QRmCUCHpS/yieI55eSn3MuqKDfDrWsNN0UKE5KYKAVgOVsWU1Ltp/VGQm+z8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZpGXIMbq; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZpGXIMbq"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b8f97c626aaso2286094466b.2
        for <loongarch@lists.linux.dev>; Tue, 10 Mar 2026 20:07:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773198451; cv=none;
        d=google.com; s=arc-20240605;
        b=R+9Z4SfGKFLSRmXPVgF2mp2TWyzYP3uKWHFYAWbc6JxigeYMTO2Awmwmio0rfwlOtk
         r/0S3JDv8OaEZ/dgRefrCOj0l/ajwMCOpRQij+zV1YZeB9/i0pV+rBklvkDFONyqNhjd
         ekRfEfD2Dwsk22AXkGhLg8U24HMMkXST3y8xcfuckkJWTL0Wq1r08LT7wTt0xp/09VF1
         /w/OyeYrj3USkjf7uzQHjH0EizAwMOxqztvM1nGN+N8ok8BYQlVMypq6kyXXXSmb4qJY
         s2RTvAn2WE1+uUlk3dqQ1MkrWqh9oyi1cgB0mhPah4S+5oCYGFt9ZALm9pKi1xxXjDLj
         GlCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Yw3z5TruSohF4QKS94PIgWDRcyGqH7FND6pkLUOm9rc=;
        fh=pASHeos5IhX0IpzhNR1PfatvuWicgAnJW89RptWLVRs=;
        b=CIj0MCtpLaaDwpQsVtXyzluTgfkb4XxViSxPqULqJZd8TfuJEOTVpiAWqss1H+iET9
         zK21VECH2oK7h2k2pqnSlXnn43/g96XOvURWzZXRCeWJ1BVdMT3+Rv2VNizZuwg4wwO4
         IPSOUhUggD0PLNmZX2qKqxWyULDZWWbTLILcfdSUSraMYu3h7j4HKYwpbGRC837Oc1B+
         nMGEy+MNn9vbTnm6ft0SgOBOUwBEjcACzMGuXxf4CCS3yMf+FPvfeGVmt7VBGItIKCYB
         /3Qr8NVsA8Tbb3cMOIggk9r7BHkSwOoY3JNjbTsETI8Pe7iJNA8znvlUIJ1eKKZDxFx8
         vgZg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773198451; x=1773803251; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yw3z5TruSohF4QKS94PIgWDRcyGqH7FND6pkLUOm9rc=;
        b=ZpGXIMbqlNImhKxqzXzUNFTW7G/rbr/oXub3CHgzcVGqOcxL/I9NLg7l90mU9BT38o
         Jsd9O3+e6fNu54HzyoNl+whC0u6IZJ9Rpete4GfU9kwWkK6DX2mClQ5x+HmAnaLulzQ8
         KiRxXBgqkE/7ObbCPDDAXRXSrGPIzIUrDtsl7PuhAlezA4uhPH4m/YwY/JdkpwlrWX3g
         xQNmUV6MQys83b23cFEpRkVe06/WtZcqNwVSKs9nL/gc4vcwkRAIX3VaWwY40G6smEfc
         FCjB2kUYPz26dOpmTSVWcHt4/YLIWglKaJ1n0m3sHblEd3FkagIg5IjNxQuchXxlytOx
         QSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773198451; x=1773803251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yw3z5TruSohF4QKS94PIgWDRcyGqH7FND6pkLUOm9rc=;
        b=ILK1sp5zeWBN2oUptJl5tSdhnSMnxOTsiJE+4YB9ibExV9Uwk9YoxsXz3sf+muZLRm
         YrbcjYk4Jp6YblZ0oiwaH6fyQGqLWMz8TG/mZHA5WJtbrY1yPKF2dAll6iPDbK6ugfBH
         uJnRnsUGxcvMINpwWgPy4wrT0Fww2fSRN01Z4fskrpu56KOy8kQI7pzACLBDVaQEDgGa
         uqbBQaAoYgX1Ad91OXLMD3VrHIDL2OsnItZIarGh1sE/mAVo/G9hsiJ2dw+xsn/DXosN
         3g3HHvXBOIdGlqB8VORPl6erpGHvc5HAgOct67TVUAecso+wFu/mLbD4yjKx9oxoPzUw
         a7yA==
X-Forwarded-Encrypted: i=1; AJvYcCUoei4AOBCSEvURteGrJVfVlFpnQKphxnHqlOthfNtJHBafnY044a5oB3mBk6wNFU6haJ/prLsUTsY=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywaxt4OSJ4QpJdxP2vGxzJLLscmwZh+GSAbM3hv55nr3grUXVCx
	6OzcFV5rKWSKsz3zEGFaoeiiJ1Igqvzgza6EjvhMaqdHHth0EI+qwSZhRc40V12yfUSeRXyKZ5k
	5J/vFVrmNL4ZT+yS3w/8S92twknupyyM=
X-Gm-Gg: ATEYQzwGyxIrbjKU1FVDC+wzhcTmq/vG4e+H+33DWN4fWOZl9z23vRlBCa33lFyBgxD
	Spa+HdBiyalGvqy1QUdLwnbQRHJbpLpw2QihTQLbPRY3qlTFUe8Rt1X+rVhfx63itlUqrCBYH/Q
	g3CgS6MpaOmuqjoYqyOlyBDnpVb8i0hPiSRAzZKBuu5hvPiGSZdLoKTDotGZARk96idixka1IjV
	81klJtotNMzbrQdC0obZomBqG5BydX1yyIBiq58e845poCdhuKgDCs8bywV1oEuCZDYV25omKlM
	Twjx9Kc=
X-Received: by 2002:a17:907:3e10:b0:b94:1913:7802 with SMTP id
 a640c23a62f3a-b972e58db89mr40090566b.35.1773198451017; Tue, 10 Mar 2026
 20:07:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1773142933.git.zhoubinbin@loongson.cn> <bd5c06a20ef2e61f76902c4209f2be539ca91a97.1773142933.git.zhoubinbin@loongson.cn>
 <abAyd9uyl3TC8vC_@ashevche-desk.local>
In-Reply-To: <abAyd9uyl3TC8vC_@ashevche-desk.local>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 11 Mar 2026 11:07:19 +0800
X-Gm-Features: AaiRm52S10jKyg3CzEsWlvTqDK1di5Q_PURZWQ746N292xm1melrStZy-WP5vrw
Message-ID: <CAMpQs4JVYRo4DQyEVe5NhHQ=VN96mF17AtSoo6a4CGB6w_Aphw@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] i2c: ls2x-v2: Add driver for Loongson-2K0300 I2C controller
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

Thanks for your detailed review.

On Tue, Mar 10, 2026 at 11:02=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Mar 10, 2026 at 07:48:53PM +0800, Binbin Zhou wrote:
> > This I2C module is integrated into the Loongson-2K0300 SoCs.
> >
> > It provides multi-master functionality and controls all I2C bus-specifi=
c
> > timing, protocols, arbitration, and timing. It supports both standard
> > and fast modes.
>
> Nothing really worrying, this version only has an issue to access embedde=
d
> struct device in the i2c_adapter. See below.
>
> ...
>
> > +/**
> > + * struct loongson2_i2c_priv - private data of the controller
> > + * @adapter: I2C adapter for this controller
> > + * @complete: completion of I2C message
> > + * @clk: hw i2c clock
> > + * @regmap: regmap of the I2C device
> > + * @parent_rate_MHz: I2C clock parent rate in MHz
>
> ' in MHz' now is redundant.
>
> > + * @msg: I2C transfer information
> > + */
>
> ...
>
> > +     /*
> > +      * Acknowledge failure:
> > +      * In master transmitter mode a Stop must be generated by softwar=
e
>
> Missing period.
>
> > +      */
>
> ...
>
> > +     case 3:
> > +             /*
> > +              * In order to generate the NACK after the last received =
data byte, enable NACK
> > +              * before reading N-2 data
> > +              */
>
> Ditto.
>
> > +             regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR1, LOONG=
SON2_I2C_CR1_ACK, 0);
> > +             loongson2_i2c_read_msg(priv);
> > +             break;
>
> ...
>
> > +     event =3D status & possible_status;
> > +     if (!event) {
> > +             dev_dbg(dev, "spurious evt irq (status=3D0x%08x, ien=3D0x=
%08x)\n", status, ien);
>
> IRQ
>
> > +             return IRQ_NONE;
> > +     }
>
> ...
>
> > +     /*
> > +      * The BTF (Byte Transfer finished) event occurs when:
> > +      * - in reception : a new byte is received in the shift register
>
> Extra space before :.
>
> > +      * but the previous byte has not been read yet from data register
> > +      * - in transmission: a new byte should be sent but the data regi=
ster
> > +      * has not been written yet
> > +      */
>
> ...
>
> > +static int loongson2_i2c_adjust_bus_speed(struct loongson2_i2c_priv *p=
riv)
> > +{
> > +     struct device *dev =3D priv->adapter.dev.parent;
>
> Derive it from regmap (and check elsewhere) as accessing dev in the adapt=
er
> may lead to issues related to the object lifetime.

Do you mean regmap_get_device() API?

Also, similar references exist in `loongson2_i2c_xfer()` and
`loongson2_i2c_isr_event()`, requiring synchronized updates.
>
> > +     struct i2c_timings i2c_t;
> > +     u32 val, freq_MHz, ccr;
> > +
> > +     i2c_parse_fw_timings(dev, &i2c_t, true);
> > +     priv->parent_rate_MHz =3D clk_get_rate(priv->clk);
> > +
> > +     if (i2c_t.bus_freq_hz =3D=3D I2C_MAX_STANDARD_MODE_FREQ) {
> > +              /* Select Standard mode */
> > +             ccr =3D 0;
> > +             val =3D DIV_ROUND_UP(priv->parent_rate_MHz, i2c_t.bus_fre=
q_hz * 2);
> > +     } else if (i2c_t.bus_freq_hz =3D=3D I2C_MAX_FAST_MODE_FREQ) {
> > +             /* Select Fast mode */
> > +             ccr =3D LOONGSON2_I2C_CCR_FS;
> > +             val =3D DIV_ROUND_UP(priv->parent_rate_MHz, i2c_t.bus_fre=
q_hz * 3);
> > +     } else {
> > +             return dev_err_probe(dev, -EINVAL, "Unsupported speed (%u=
Hz)\n", i2c_t.bus_freq_hz);
> > +     }
> > +
> > +     FIELD_MODIFY(LOONGSON2_I2C_CCR_CCR, &ccr, val);
> > +     regmap_write(priv->regmap, LOONGSON2_I2C_CCR, ccr);
> > +
> > +     freq_MHz =3D DIV_ROUND_UP(priv->parent_rate_MHz, HZ_PER_MHZ);
> > +     regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR2, LOONGSON2_I2C=
_CR2_FREQ,
> > +                        FIELD_GET(LOONGSON2_I2C_CR2_FREQ, freq_MHz));
> > +
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
> > +static int loongson2_i2c_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     struct loongson2_i2c_priv *priv;
> > +     struct i2c_adapter *adap;
> > +     void __iomem *base;
> > +     int irq, ret;
> > +
> > +     priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +
> > +     base =3D devm_platform_ioremap_resource(pdev, 0);
> > +     if (IS_ERR(base))
> > +             return PTR_ERR(base);
> > +
> > +     priv->regmap =3D devm_regmap_init_mmio(dev, base, &loongson2_i2c_=
regmap_config);
> > +     if (IS_ERR(priv->regmap))
> > +             return dev_err_probe(dev, PTR_ERR(priv->regmap), "Failed =
to init regmap.\n");
> > +
> > +     priv->clk =3D devm_clk_get_enabled(dev, NULL);
> > +     if (IS_ERR(priv->clk))
> > +             return dev_err_probe(dev, PTR_ERR(priv->clk), "Failed to =
enable clock.\n");
> > +
> > +     irq =3D platform_get_irq(pdev, 0);
> > +     if (irq < 0)
> > +             return irq;
> > +
> > +     adap =3D &priv->adapter;
> > +     adap->retries =3D 5;
> > +     adap->nr =3D pdev->id;
> > +     adap->dev.parent =3D dev;
> > +     adap->owner =3D THIS_MODULE;
> > +     adap->algo =3D &loongson2_i2c_algo;
> > +     adap->timeout =3D 2 * HZ;
>
> > +     device_set_node(&adap->dev, dev_fwnode(dev));
>
> Why?! i2c_adapter_set_node() is part of the i2c-next.

Indeed, when I rebased the v4 patchset, `i2c_adapter_set_node()`
existed in the i2c-next[1]. However, when I prepared the v5 patchset,
it was removed[2].

[1]: base commit: 6117e1ba1db78a52a4161208ea403d3769ad73c6
[2]: base commit: b82316862bea929265725c077dffcec42e3dc20b

>
> > +     i2c_set_adapdata(adap, priv);
> > +     strscpy(adap->name, pdev->name);
> > +     init_completion(&priv->complete);
> > +     platform_set_drvdata(pdev, priv);
> > +
> > +     ret =3D loongson2_i2c_adjust_bus_speed(priv);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D devm_request_irq(dev, irq, loongson2_i2c_isr_event, IRQF_=
SHARED, pdev->name, priv);
> > +     if (ret)
> > +             return ret;
> > +
> > +     return devm_i2c_add_adapter(dev, adap);
> > +}
>
> --
> With Best Regards,
> Andy Shevchenko
>
>


--
Thanks.
Binbin
