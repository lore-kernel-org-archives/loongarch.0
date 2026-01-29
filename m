Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F133F37C10A
	for <loongarch@lists.linux.dev>; Thu, 29 Jan 2026 08:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769674043; cv=pass; b=B2hFOm1D/5vtK71KBhCiXdzmeU1ddiYK9lNmUqcyCvelzgNe+bMGHTTEvmm9u2EEHnn+ze4EZ0n1TiSuA25HwleRk+cW95TwUn5Xc5g9ltR5eH7jyAMBi6rM6p7ooQLiSClh/+v4K85d0DGqhe/7CLMNeml7MeoWM/x93PaE/JY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769674043; c=relaxed/simple;
	bh=6QQp6t0i1NSZ59HvtxX2prOFTKLTiYZ8Kffb1ls2P8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M62Uzt/MjiqXCjDaEy/lbL0RsW3j1zzbB+OSfTPwJT8AEOnlDr3IPj6vWz8KLEp4vCCuPaJX7fVWVXnI5H6Yt6CeH4BFvq/1qjimYjXPDmx00GMasgq1TPDjdTR6jDH6qytYIpdBwMIwQC+Xdm5AUJxlrp6J3pJeq3SF3vptmOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jUeiEOP/; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jUeiEOP/"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-658b6757f7fso1351335a12.1
        for <loongarch@lists.linux.dev>; Thu, 29 Jan 2026 00:07:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769674039; cv=none;
        d=google.com; s=arc-20240605;
        b=TL+1tWjURhHD4rlBE4CU6Okl7lvwmLPxiY55cIpDXw0Rimc4/aUVbMXKKY36r8IcCH
         +uiXDC3e1ZjvD7iQHg/lgmIsLYY7MwvOIURnqKaqRwqZmVRbSQ/Z0sum1/HDfnrdvugI
         mHvkEWb3nLAh5ePL5NhEuW87rTI8my7E8PgirYBKrRJEoKWT2+/PV4T2U5ylyZkZCy8Z
         0eeiH6Tf75GNeQND+n7Yki6QQ5y9uEMJ63+W2m42hAzJfRjql0sv+xK08lWr1YBwvh+z
         P8iSKXKsZ1eZhfu9euc32fVamqq5xr+muaxl1eT+QpvLuLHWY/fPnvys/riNgiBqmuCG
         wTaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h65+76ZtE+iDAZ9DZhtVlizuqLsKa75ohw0IiV/MoqY=;
        fh=W8jq1C6MX30H89nxDOHb2o+VHL6HmWn/kbq69h3dto4=;
        b=Pkg0STdkoM0uMJu3mQZhTdDXnSAryuCwoSvUExX3gu+HDtSoYkSwCuyXNzPrWN/1Wq
         3TvAx47VPO/pQ9pkvRbP07kHOSr2T8Yt45hVM0zOI9gB3mQURT30R47eg6hsc72EHiO3
         7nAiFsmHO/EnL9r8GfAP6JcRsTwQQmXOj52g2TJfloiHdtlKGpP7IhlaoRW5hjJPi3PR
         mJRvzLqDBZ+ucgMw98xYmRc/VxZZxpRK7T/2UlxvyCifuRopdN+WY1iuZMc9P+WPDow1
         hMm4W5SfdMtDvSf50gJkBXPDv4oMZNJu6mltrzXBGZBLXuC6brFF8PtXK9BHs5vNFtKW
         cYiw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769674039; x=1770278839; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h65+76ZtE+iDAZ9DZhtVlizuqLsKa75ohw0IiV/MoqY=;
        b=jUeiEOP/prjI08yqyw7I+Gjf0HITb/LEpfZzUkOWt+3aizQeUDB1PJUTuj5Ln77csD
         oJjxqXbUpiXDdECa8CxEEGSznHtBSl7t78FYzJ265zHeWXXmzCoPLa1e8kq+vwzdyvnk
         HX+2nDCzlNG5EF6FKDJnbpaS/fWMdzw+HsvcGkiLu0emYBU2PXud5gY+z+zbORG0LZPB
         t5t1+aJnoNTOvPkJr0juAJ5pPPOWPjOE0SW45DPzn3QQgjhC+67AqVl3LgutSDgT+xYL
         L3MAOslreImGDQ793m+xRoVPqHWIWtrgcLWvxmOG8sonEdu/KEumX2Ts4m6xaSdqbgna
         sCbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769674039; x=1770278839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h65+76ZtE+iDAZ9DZhtVlizuqLsKa75ohw0IiV/MoqY=;
        b=S3lyIOj3o1mSgCeWB6CKNCB6daKiLS1pWY0qY88DSs3AO+P2gQpw/AoRmwgVNLRzR1
         ZC5gzZRxxgMjUTIDP2l6a7btPuvSn+qyz8bGgZwdrAIzkFtS8DAR89OSzFFqrWRahT/p
         FlV/ee/z6YPxhs8u3eejN+1ziWmpYXDr+Sq4SBAI7nzC62hmiIEYj98Niv74bHU5FHSL
         +1ZrRnasL+xERB1Hrcp/n6jZwClY1iweDVIuIGEBQX+VE/STptYWY+hw0HGzSri3PvKy
         TyGyF8LXDNeImyabz8CVU466hpWkuxC1kr/I1LLfgPSd4P6eu+f+nuCDbN9HTic08TYK
         FvkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAa1W9y8qpB1qkWNDmrMXOe95vW9XEyVvYRoB616yIN/qFRwDf+EUKW0V1I7pe3M7gQErtaN9jCBQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwMFpURTy1HKYuPH9JE37uzlrwQFAcwvpgE7C0WX8VrmgoZL9bH
	BVPl8qo/rWt+11XOy619Jp3ths2pll0cBIo4COiIpq/BiLWYE9z9kMlFCQof+o4gZCUWHld/H8q
	fjTM9INKT7P4UcpCAIaaLpJDT9cHxjrs=
X-Gm-Gg: AZuq6aIDn6WY24XlsYR6/0iSxRBX28Z90Fa7Nu4v6ymvAMfDOG2n5moe5/IvtUPf+mN
	G0XXVadIiIDGDBlZ/7xE5qSeYisaoWfMdVLkrV6VUmZzZGmQrdpqoklr9QsOPiYcXSZQ0zav/OC
	ULGkYAki4tKA7Nxq3TofktyMPIExIhxkOcDm5TzwgG2reWdcgPki0iBNBmGORYnI7P9nkoy7JNA
	HdpEuawKGSAkyxQXUw6SinuOV/d4VCOHJvJjVTDmPdaNAZHvEux5WhoaeOQnxHTom1dfqRJRw==
X-Received: by 2002:a17:907:7205:b0:b88:4ff8:1300 with SMTP id
 a640c23a62f3a-b8ddf9b6765mr135590566b.26.1769674038824; Thu, 29 Jan 2026
 00:07:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1769476820.git.zhoubinbin@loongson.cn> <402121da829497fc97f1461c8aaa3a44252c3f06.1769476820.git.zhoubinbin@loongson.cn>
 <aXh000kBfaqd1G9H@smile.fi.intel.com>
In-Reply-To: <aXh000kBfaqd1G9H@smile.fi.intel.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Thu, 29 Jan 2026 16:07:06 +0800
X-Gm-Features: AZwV_Qjv0vacADnevtw-l0DCneEH_-yZXgNninOkUDgjvYysqnCpKNdjJoAm2Cs
Message-ID: <CAMpQs4JTqWr6AqRwEO9bcno-_MjjE8GKm_kUvrpy7m_tLMtuSQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] i2c: ls2x-v2: Add driver for Loongson-2K0300 I2C controller
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

On Tue, Jan 27, 2026 at 4:18=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Jan 27, 2026 at 10:47:57AM +0800, Binbin Zhou wrote:
> > This I2C module is integrated into the Loongson-2K0300 SoCs.
> >
> > It provides multi-master functionality and controls all I2C bus-specifi=
c
> > timing, protocols, arbitration, and timing. It supports both standard
> > and fast modes.
>
> Thanks for the update, but either v1 was not reviewed properly (if review=
ed
> at all), or this missed comments from there. This driver needs much more =
work.
> Since it misses v6.20 anyway, you have about 2 month to put this into a s=
hape.
>
> ...
>
> > +/*
> > + * Loongson-2K fast I2C controller driver
> > + *
> > + * Copyright (C) 2025-2026 Loongson Technology Corporation Limited
>
> > + *
>
> Redundant blank line.

ok..
>
> > + */
>
> ...
>
> > +#include <linux/bitfield.h>
> > +#include <linux/bits.h>
> > +#include <linux/clk.h>
>
> > +#include <linux/device.h>
>
> Is this being used?
>
> > +#include <linux/iopoll.h>
> > +#include <linux/i2c.h>
> > +#include <linux/init.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/io.h>
>
> > +#include <linux/kernel.h>
>
> No way you should include this one.
>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/property.h>
> > +#include <linux/regmap.h>
>
> Please, follow IWYU principle, exempli gratia here the types.h is missing=
.

I will check the included header files.
>
> > +#include <linux/units.h>
>
> ...
>
> > +#define LOONGSON2_I2C_CR2_IRQ_MASK   (LOONGSON2_I2C_CR2_ITBUFEN | \
> > +                                      LOONGSON2_I2C_CR2_ITEVTEN | \
> > +                                      LOONGSON2_I2C_CR2_ITERREN)
>
> Better to indent differently:
>
> #define LOONGSON2_I2C_CR2_IRQ_MASK      \
>         (LOONGSON2_I2C_CR2_ITBUFEN | LOONGSON2_I2C_CR2_ITEVTEN | LOONGSON=
2_I2C_CR2_ITERREN)

ok. I will check.
>
>
> ...
>
> > +#define LOONGSON2_I2C_SR1_ITEVTEN_MASK       (LOONGSON2_I2C_SR1_BTF | =
\
> > +                                      LOONGSON2_I2C_SR1_ADDR | \
> > +                                      LOONGSON2_I2C_SR1_SB)
> > +#define LOONGSON2_I2C_SR1_ITBUFEN_MASK       (LOONGSON2_I2C_SR1_TXE | =
LOONGSON2_I2C_SR1_RXNE)
> > +#define LOONGSON2_I2C_SR1_ITERREN_MASK       (LOONGSON2_I2C_SR1_AF | \
> > +                                      LOONGSON2_I2C_SR1_ARLO | \
> > +                                      LOONGSON2_I2C_SR1_BERR)
>
> As per above.
>
> ...
>
> > +#define LOONGSON2_I2C_FREE_SLEEP_US  1000
> > +#define LOONGSON2_I2C_FREE_TIMEOUT_US        5000
>
> 1 * USEC_PER_MSEC
> 5 * USEC_PER_MSEC

ok...
>
> ...
>
> > +#define LOONGSON2_I2C_MIN_STD_FREQ   2U
> > +#define LOONGSON2_I2C_MIN_FAST_FREQ  6U
> > +#define LOONGSON2_I2C_MAX_FREQ               46U
>
> The three are unused, what are they for?

I will drop it.
>
>
> > +#define HZ_TO_MHZ                    1000000
>
> Dup. Use units.h.
>
> ...
>
> > +enum loongson2_i2c_speed {
> > +     LOONGSON2_I2C_SPEED_STANDARD, /* 100 kHz */
> > +     LOONGSON2_I2C_SPEED_FAST, /* 400 kHz */
> > +     LOONGSON2_I2C_SPEED_FAST_PLUS, /* 1 MHz */
>
> Use existing speed definitions and drop this enum.

ok....
>
> > +     LOONGSON2_I2C_SPEED_END,
>
> Besides comma in the terminator, that has not to be there, this is unused=
.
>
> > +};
>
> ...
>
> > +/*
>
> It's not marked as kernel-doc, but looks very much like that. Why?
> Same Q for *all* cases like this.

I didn't intend to mark it in kernel-doc; I just wanted to comment on
the variable.
Is removing the `@` symbol sufficient?

>
> > + * struct loongson2_i2c_msg - client specific data
> > + * @addr: 8-bit slave addr, including r/w bit
> > + * @count: number of bytes to be transferred
> > + * @buf: data buffer
> > + * @stop: last I2C msg to be sent, i.e. STOP to be generated
> > + * @result: result of the transfer
> > + */
> > +struct loongson2_i2c_msg {
> > +     u8 addr;
> > +     u32 count;
> > +     u8 *buf;
> > +     bool stop;
> > +     int result;
>
> Run `pahole` and amend *all* data types accordingly.

 Moving 'stop' from after 'buf' to after 'addr'.
>
> > +};
>
> ...
>
> > +struct loongson2_i2c_priv {
> > +     struct i2c_adapter adapter;
>
> > +     struct device *dev;
>
> Isn't this a dup? Can't it be derived from regmap and/or adapter?

 it can be converted using `struct device *dev =3D priv->adapter.dev.parent=
;`
>
> > +     struct clk *clk;
> > +     struct completion complete;
> > +     struct regmap *regmap;
> > +     int speed;
> > +     int parent_rate;
> > +     struct loongson2_i2c_msg msg;
> > +};
>
> ...

After run `pahole`, the structs are reorganized as follow:

pahole --show_reorg_steps --reorganize --sort -C loongson2_i2c_priv
i2c-ls2x-v2.o
struct loongson2_i2c_priv {
        struct i2c_adapter         adapter
__attribute__((__aligned__(8))); /*     0  1064 */
        /* --- cacheline 16 boundary (1024 bytes) was 40 bytes ago ---
*/
        struct clk *               clk;                  /*  1064
8 */
        struct completion          complete;             /*  1072
32 */
        /* --- cacheline 17 boundary (1088 bytes) was 16 bytes ago ---
*/
        struct regmap *            regmap;               /*  1104
8 */
        int                        speed;                /*  1112
4 */
        int                        parent_rate;          /*  1116
4 */
        struct loongson2_i2c_msg   msg;                  /*  1120
24 */

        /* XXX last struct has 4 bytes of padding */

        /* size: 1144, cachelines: 18, members: 7 */
        /* paddings: 1, sum paddings: 4 */
        /* forced alignments: 1 */
        /* last cacheline: 56 bytes */
} __attribute__((__aligned__(8)));

pahole --show_reorg_steps --reorganize --sort -C loongson2_i2c_msg
i2c-ls2x-v2.o
struct loongson2_i2c_msg {
        u8                         addr;                 /*     0
1 */
        bool                       stop;                 /*     1
1 */

        /* XXX 2 bytes hole, try to pack */

        u32                        count;                /*     4
4 */
        u8 *                       buf;                  /*     8
8 */
        int                        result;               /*    16
4 */

        /* size: 24, cachelines: 1, members: 5 */
        /* sum members: 18, holes: 1, sum holes: 2 */
        /* padding: 4 */
        /* last cacheline: 24 bytes */
};

>
> > +static int loongson2_i2c_wait_free_bus(struct loongson2_i2c_priv *priv=
)
> > +{
> > +     u32 status;
> > +     int ret;
> > +
> > +     ret =3D regmap_read_poll_timeout(priv->regmap, LOONGSON2_I2C_SR2,=
 status,
> > +                                    !(status & LOONGSON2_I2C_SR2_BUSY)=
,
> > +                                    LOONGSON2_I2C_FREE_SLEEP_US,
> > +                                    LOONGSON2_I2C_FREE_TIMEOUT_US);
> > +     if (ret) {
> > +             dev_dbg(priv->dev, "I2C bus free failed.\n");
>
> > +             ret =3D -EBUSY;
>
> Why?! What's wrong with the error code returned in ret?

I want to indicate the bus busy state if it times out.
>
> > +     }
> > +
> > +     return ret;
> > +}
>
> ...
>
> > +static void loongson2_i2c_handle_read(struct loongson2_i2c_priv *priv,=
 int flag)
> > +{
> > +     struct loongson2_i2c_msg *msg =3D &priv->msg;
> > +     bool changed;
>
> > +     int i;
>
> Why signed?

unsigned int i;
>
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
>
> > +             for (i =3D 2; i > 0; i--)
> > +                     loongson2_i2c_read_msg(priv);
>
> Just unroll the loop and put a comment on top explaining the magic 2. But=
 I
> think it's just a msg->count.

Yes it's  msg->count.
>
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
> > +     default:
> > +             loongson2_i2c_read_msg(priv);
> > +     }
> > +}
>
> ...
>
> > +static irqreturn_t loongson2_i2c_isr_error(u32 status, void *data)
> > +{
> > +     struct loongson2_i2c_priv *priv =3D data;
> > +     struct loongson2_i2c_msg *msg =3D &priv->msg;
> > +
> > +     /* Arbitration lost */
> > +     if (status & LOONGSON2_I2C_SR1_ARLO) {
> > +             regmap_update_bits(priv->regmap, LOONGSON2_I2C_SR1, LOONG=
SON2_I2C_SR1_ARLO, 0);
> > +             msg->result =3D -EAGAIN;
> > +     }
> > +
> > +     /*
> > +      * Acknowledge failure:
> > +      * In master transmitter mode a Stop must be generated by softwar=
e
> > +      */
> > +     if (status & LOONGSON2_I2C_SR1_AF) {
> > +             regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR1, LOONG=
SON2_I2C_CR1_STOP,
> > +                                LOONGSON2_I2C_CR1_STOP);
> > +             regmap_update_bits(priv->regmap, LOONGSON2_I2C_SR1, LOONG=
SON2_I2C_SR1_AF, 0);
> > +             msg->result =3D -EIO;
> > +     }
> > +
> > +     /* Bus error */
> > +     if (status & LOONGSON2_I2C_SR1_BERR) {
> > +             regmap_update_bits(priv->regmap, LOONGSON2_I2C_SR1, LOONG=
SON2_I2C_SR1_BERR, 0);
> > +             msg->result =3D -EIO;
> > +     }
>
> Even if the interrupt is spurious you still Ack it, why?
>
> Ah, it seems it's a helper. Please, return the error code from it as int =
and
> not irqreturn_t, this will make things clearer.

How about just define it as void:

static void loongson2_i2c_isr_error(u32 status, void *data)
{
.........
        if (status & LOONGSON2_I2C_SR1_ARLO) {
         ........
                msg->result =3D -EAGAIN;
                goto out;
        }
        if (status & LOONGSON2_I2C_SR1_AF) {
           .......
                msg->result =3D -EIO;
                goto out;
        }
        if (status & LOONGSON2_I2C_SR1_BERR) {
         .........
                msg->result =3D -EIO;
                goto out;
        }

out:
        loongson2_i2c_disable_irq(priv);
        complete(&priv->complete);
}

and in loongson2_i2c_isr_event(), I reference it as:

        if (status & LOONGSON2_I2C_SR1_ITERREN_MASK) {
                loongson2_i2c_isr_error(status, data);
                return IRQ_NONE;
        }

Its return value is meaningless for loongson2_i2c_isr_event().

>
> > +     loongson2_i2c_disable_irq(priv);
> > +     complete(&priv->complete);
> > +
> > +     return IRQ_HANDLED;
> > +}
>
> ...
>
> > +static irqreturn_t loongson2_i2c_isr_event(int irq, void *data)
> > +{
> > +     u32 possible_status =3D LOONGSON2_I2C_SR1_ITEVTEN_MASK;
>
> Split assignment...
>
> > +     struct loongson2_i2c_priv *priv =3D data;
> > +     struct loongson2_i2c_msg *msg =3D &priv->msg;
> > +     u32 status, ien, event, cr2;
> > +
> > +     regmap_read(priv->regmap, LOONGSON2_I2C_SR1, &status);
> > +     if (status & LOONGSON2_I2C_SR1_ITERREN_MASK)
> > +             return loongson2_i2c_isr_error(status, data);
> > +
> > +     regmap_read(priv->regmap, LOONGSON2_I2C_CR2, &cr2);
> > +     ien =3D cr2 & LOONGSON2_I2C_CR2_IRQ_MASK;
>
> ...to be here, which improves readability (no need to go somewhere up in
> the code to see what this is about.

ok, I will put  `possible_status =3D LOONGSON2_I2C_SR1_ITEVTEN_MASK;` here.

>
> > +     /* Update possible_status if buffer interrupt is enabled */
> > +     if (ien & LOONGSON2_I2C_CR2_ITBUFEN)
> > +             possible_status |=3D LOONGSON2_I2C_SR1_ITBUFEN_MASK;
> > +
> > +     event =3D status & possible_status;
> > +     if (!event) {
> > +             dev_dbg(priv->dev, "spurious evt irq (status=3D0x%08x, ie=
n=3D0x%08x)\n", status, ien);
> > +             return IRQ_NONE;
> > +     }
> > +
> > +     /* Start condition generated */
> > +     if (event & LOONGSON2_I2C_SR1_SB)
> > +             loongson2_i2c_write_msg(priv, msg->addr);
> > +
> > +     /* I2C Address sent */
> > +     if (event & LOONGSON2_I2C_SR1_ADDR) {
> > +             if (msg->addr & I2C_M_RD)
> > +                     loongson2_i2c_handle_rx_addr(priv);
> > +             /* Clear ADDR flag */
> > +             regmap_read(priv->regmap, LOONGSON2_I2C_SR2, &status);
> > +             /* Enable buffer interrupts for RX/TX not empty events */
> > +             regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR2, LOONG=
SON2_I2C_CR2_ITBUFEN,
> > +                                LOONGSON2_I2C_CR2_ITBUFEN);
> > +     }
> > +
> > +     if (msg->addr & I2C_M_RD) {
> > +             /* RX not empty */
> > +             if (event & LOONGSON2_I2C_SR1_RXNE)
> > +                     loongson2_i2c_handle_read(priv, 0);
> > +
> > +             if (event & LOONGSON2_I2C_SR1_BTF)
> > +                     loongson2_i2c_handle_read(priv, 1);
> > +     } else {
> > +             /* TX empty */
> > +             if (event & LOONGSON2_I2C_SR1_TXE)
> > +                     loongson2_i2c_handle_write(priv);
> > +
> > +             if (event & LOONGSON2_I2C_SR1_BTF)
> > +                     loongson2_i2c_handle_write(priv);
> > +     }
> > +
> > +     return IRQ_HANDLED;
> > +}
>
> ...
>
> > +static int loongson2_i2c_xfer_msg(struct loongson2_i2c_priv *priv, str=
uct i2c_msg *msg,
> > +                               bool is_stop)
> > +{
> > +     struct loongson2_i2c_msg *l_msg =3D &priv->msg;
> > +     unsigned long timeout;
>
> > +     int ret;
>
> Seems unneeded.

emm, I will drop it.
>
> > +
> > +     l_msg->addr   =3D i2c_8bit_addr_from_msg(msg);
> > +     l_msg->buf    =3D msg->buf;
> > +     l_msg->count  =3D msg->len;
> > +     l_msg->stop   =3D is_stop;
> > +     l_msg->result =3D 0;
> > +
> > +     reinit_completion(&priv->complete);
> > +
> > +     /* Enable events and errors interrupts */
> > +     regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR2,
> > +                        LOONGSON2_I2C_CR2_ITEVTEN | LOONGSON2_I2C_CR2_=
ITERREN,
> > +                        LOONGSON2_I2C_CR2_ITEVTEN | LOONGSON2_I2C_CR2_=
ITERREN);
>
> > +     timeout =3D wait_for_completion_timeout(&priv->complete, priv->ad=
apter.timeout);
> > +     ret =3D l_msg->result;
> > +
> > +     if (!timeout)
> > +             ret =3D -ETIMEDOUT;
> > +
> > +     return ret;
>
>         timeout =3D wait_for_completion_timeout(&priv->complete, priv->ad=
apter.timeout);
>         if (!timeout)
>                 return -ETIMEDOUT;
>
>         return l_msg->result;
>
> > +}
>
> > +static int loongson2_i2c_xfer(struct i2c_adapter *i2c_adap, struct i2c=
_msg msgs[], int num)
> > +{
> > +     struct loongson2_i2c_priv *priv =3D i2c_get_adapdata(i2c_adap);
> > +     int ret =3D 0, i;
>
> Why is 'i' signed?
> And redundant assignment for 'ret'.

unsigned int i;
int ret;
>
> > +     ret =3D loongson2_i2c_wait_free_bus(priv);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* START generation */
> > +     regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR1, LOONGSON2_I2C=
_CR1_START,
> > +                        LOONGSON2_I2C_CR1_START);
>
> > +     for (i =3D 0; i < num && !ret; i++)
> > +             ret =3D loongson2_i2c_xfer_msg(priv, &msgs[i], i =3D=3D n=
um - 1);
> > +
> > +     return (ret < 0) ? ret : num;
>
>         for (i =3D 0; i < num; i++) {
>                 ret =3D loongson2_i2c_xfer_msg(priv, &msgs[i], i =3D=3D n=
um - 1);
>                 if (ret < 0)
>                         return ret;
>         }
>
>         return num;

Yes, this way will be more readable.
>
>
> > +}
>
> ...
>
> > +static int loongson2_i2c_adjust_bus_speed(struct loongson2_i2c_priv *p=
riv)
> > +{
> > +     u32 val, freq, ccr =3D 0, cr2 =3D 0;
>
> Redundant assignment(s), see below why.
>
> > +     priv->parent_rate =3D clk_get_rate(priv->clk);
> > +     freq =3D DIV_ROUND_UP(priv->parent_rate, HZ_TO_MHZ);
>
> Use unit suffix:
>
>         freq_mhz =3D ...
>
> (if I am not mistaken).

Yes, `freq_mhz` is more appropriate.
>
> > +     cr2 |=3D FIELD_GET(LOONGSON2_I2C_CR2_FREQ, freq);
>
>         cr2 =3D FIELD_GET(LOONGSON2_I2C_CR2_FREQ, freq);

ok..
>
> > +     regmap_write(priv->regmap, LOONGSON2_I2C_CR2, cr2);
> > +
> > +     if (priv->speed =3D=3D LOONGSON2_I2C_SPEED_STANDARD) {
> > +             val =3D DIV_ROUND_UP(priv->parent_rate, I2C_MAX_STANDARD_=
MODE_FREQ * 2);
>
>                 /* Select Standard mode */
>                 ccr =3D 0;
>
> > +     } else {
> > +             val =3D DIV_ROUND_UP(priv->parent_rate, I2C_MAX_FAST_MODE=
_FREQ * 3);
> > +
> > +             /* Select Fast mode */
> > +             ccr |=3D LOONGSON2_I2C_CCR_FS;
>
>                 ccr =3D LOONGSON2_I2C_CCR_FS;
>
> > +     }
>
> > +     ccr |=3D FIELD_GET(LOONGSON2_I2C_CCR_CCR, val);
>
> FIELD_MODIFY()?

FIELD_MODIFY(LOONGSON2_I2C_CCR_CCR, &ccr, val);  instead.
>
> > +     regmap_write(priv->regmap, LOONGSON2_I2C_CCR, ccr);
> > +
> > +     /* reference clock determination the configure val(0x3f) */
> > +     regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR2, LOONGSON2_I2C=
_CR2_FREQ,
> > +                        LOONGSON2_I2C_CR2_FREQ);
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
> > +     u32 clk_rate;
> > +     int irq, ret;
> > +
> > +     priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +
> > +     base =3D devm_platform_ioremap_resource(pdev, 0);
> > +     if (IS_ERR(base))
>
> > +             return dev_err_probe(dev, PTR_ERR(base),
> > +                                  "Failed to ioremap resource.\n");
>
> You utilise 100, put this on a single line.

ok. I will check the issue again.
>
> But, this is a dup, devm_platform_*() call above takes care already about=
 error
> message.

emm. I will use `return PTR_ERR(base);` instead.
>
> > +
> > +     priv->regmap =3D devm_regmap_init_mmio(dev, base,
> > +                                          &loongson2_i2c_regmap_config=
);
>
> Single line.
>
> > +     if (IS_ERR(priv->regmap))
> > +             return dev_err_probe(dev, PTR_ERR(priv->regmap),
> > +                                  "Failed to init regmap.\n");
>
> Single line.
>
> > +     priv->clk =3D devm_clk_get_enabled(dev, NULL);
> > +     if (IS_ERR(priv->clk))
> > +             return dev_err_probe(dev, PTR_ERR(priv->clk),
> > +                                  "Failed  to enable clock.\n");
>
> Single line.
>
> > +     irq =3D platform_get_irq(pdev, 0);
> > +     if (irq < 0)
> > +             return -EINVAL;
>
> Why?! What's wrong with the error code in 'irq'?

I will use `return irq` instead.
>
> > +     priv->dev =3D dev;
> > +
> > +     adap =3D &priv->adapter;
> > +     adap->retries =3D 5;
> > +     adap->nr =3D pdev->id;
> > +     adap->dev.parent =3D dev;
> > +     adap->owner =3D THIS_MODULE;
> > +     adap->algo =3D &loongson2_i2c_algo;
> > +     adap->timeout =3D 2 * HZ;
> > +     device_set_node(&adap->dev, dev_fwnode(dev));
> > +     i2c_set_adapdata(adap, priv);
>
> > +     strscpy(adap->name, pdev->name, sizeof(adap->name));
>
> 2-arguments version is even better.

Sorry, I'm not quite sure what you mean by `2-arguments version.`

>
> > +     init_completion(&priv->complete);
> > +     platform_set_drvdata(pdev, priv);
> > +
> > +     priv->speed =3D LOONGSON2_I2C_SPEED_STANDARD;
>
> > +     ret =3D of_property_read_u32(dev->of_node, "clock-frequency", &cl=
k_rate);
>
> device_property_read_u32()

ok...
>
> > +     if (!ret && clk_rate >=3D I2C_MAX_FAST_MODE_FREQ)
> > +             priv->speed =3D LOONGSON2_I2C_SPEED_FAST;
> > +
> > +     ret =3D loongson2_i2c_adjust_bus_speed(priv);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D devm_request_irq(dev, irq, loongson2_i2c_isr_event, IRQF_=
SHARED, pdev->name, priv);
> > +     if (ret)
>
> > +             return dev_err_probe(dev, ret, "Unable to request irq %d\=
n", irq);
>
> Dup message.

ok...
>
>                 return ret;
>
> > +     return devm_i2c_add_adapter(dev, adap);
> > +}
>
> ...
>
> > +static struct platform_driver loongson2_i2c_driver =3D {
> > +     .driver =3D {
> > +             .name =3D "loongson2-i2c-v2",
> > +             .of_match_table =3D loongson2_i2c_id_table,
> > +     },
> > +     .probe =3D loongson2_i2c_probe,
> > +};
>
> > +
>
> Remove this blank line.

ok...
>
> > +module_platform_driver(loongson2_i2c_driver);
>
> --
> With Best Regards,
> Andy Shevchenko
>
>


--
Thanks.
Binbin
