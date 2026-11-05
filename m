Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793845043;
	b=Kp4BUKq/yBQ8k62TQRfYV+ZgHbadTRpz0kw/qYnpuNQMnRKhnD8tbeHyfikLUGUssvbn
	 akmkVI/Z1pTfCs4AHUyt6QcPyX6yaZjSLoPpaqldhD2UwOMVGTguKIlbVyl0rusWaK/Sl
	 6cW8D4lgVVQTJeGzZSOUmfxzUunGVQ1+gZOqB1WLZ/M/IvBtFPmyyF7OtJhUfG+7Xly2z
	 ftIWm/8qrkoQHnupOgzC7D14a1GeSaMhGDpHxCVlAKADibJFgpf09LCH9H8gpPu/24LxU
	 bfkZ25kYzLZmioGBEaCiGpoHevAsqSUcgHwgFPktO0YQnpRbZcR2R1IMbFl/Eh/HDuw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793845043;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bEcKF/O4mjOe4JAG085pq/Q95rlmJbBO1sT0SY3GVGw=;
	b=UMqlzi/5VxhL+89qhmBJH9/gnQLaOxKTr3VCWXs9J5YyrrMb2e8lH9Xkq0cnPqafrIJQ
	 b2epGVNp3V8EjnR1Pb4txkPdd9MPuTXHpojENi9l+AisBpj9mKfMKSPKz25j5lv3XW4LU
	 S+usSMlZf3eusgV0RJNbsHKM8oiyZ6Uq4ELBGaFdHLmdqM1DGnhpe55UTriPnCbcPuhaj
	 o77GCYC0oNPa87talkF1K0ui9ywlYcC8IfPeFY+GIemJMvei1VkgAFGxdIL+3rBsmbmGP
	 P8v0puHK6rWLerb3iKjd3vbeauFiCRoV7v/551/x2Q8rpe0/md4eqPrdeo2wlBrFu9w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aF848SqZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F9C606A31B
	for <loongarch@lists.linux.dev>; Thu,  5 Nov 2026 02:17:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2F9C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aF848SqZ
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso196993666b.3
        for <loongarch@lists.linux.dev>; Wed, 04 Nov 2026 18:17:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793845041; cv=none;
        d=google.com; s=arc-20260327;
        b=VkQh2M4ku7ChqBJzDFzgaQrd2IA6atQwDqqICVcjg+PDtB1gdF1a1Qu3C6lT8LElsk
         vAud4ODuuKxKxBU7Eqgab8bQ5RCeOPKQKZBrssV1yCzgODlBRQcnZXdAmZ0Mc7sh7lhu
         i0lO3CY3egPrvy1CJDuBHzaHMvaoWden9o4iljSCYbfvWBNk9UhSVwwTeoRX60NZr5pP
         3Z0e4m/h0qM1suizHvWqH89z7vG494MGHrRPBrJ31aFiR6j1La5KEx2qJCRKl3RrD0lp
         xwsNNZKRxoQiS7oUNn5TbRG48Xx5esLfsPlkncU8dpBrRlNAsj2fQogek8dvuFh4aUdb
         c/rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bEcKF/O4mjOe4JAG085pq/Q95rlmJbBO1sT0SY3GVGw=;
        fh=b5hx7jNZCFSqMh9cBRtF2DjnvbCpIPEurBJHMuRJMas=;
        b=ZJRKF40J6w26Iut3Tp0XRA4h0Rba4yRz6efvnJU0jqa+BzgDsNmEMw1lQLN227MO8Y
         D8sPmerrdA0NdHGdJwoGLZ7sA/GoqPLDvojed//Pl9R2PQj4we2Dt+WOPQPCOWE1TngC
         TbSKjRkPU1XU0dCOAzuQBP4bIcNsCrTYgq+zh9uBfe/mFidcalEcMZOEf635EJGvl7oa
         3THz15de9luYqEyCvat7dh2DChuGo7iuSUcBdf824lNaAhOPyV9USoFkmB+drTddCHnX
         Y3tlgdJy7Fg00TCKnkkBn5LjrbrA7hEzvkM+AtCxN1VKI3XOMPFP48hA03eXINFPV08H
         kBtw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793845041; x=1794449841; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bEcKF/O4mjOe4JAG085pq/Q95rlmJbBO1sT0SY3GVGw=;
        b=aF848SqZ8vfbhZLz17a30OTJP7kmMcogyZXnAASyktIJVYVlq4eae0uXNg3gAvp0Gg
         Kg8st9aT8iyBuW6Q9bLA1YFBO0GfNCJwjWzcx5gYLyqako2oscq4G9quSTUqoUegLAre
         +fmYLIUUX7BejI2b/nIK0AtpUq/7IEjZ+cMjIZojaFuqBY0ZB1PLGajLkliYEnp7mqL0
         ZCCEHryXEU29FKHYZXnEb6EbwZiiTgAQd0odhd0zv6VMfIJD4dm/McliA2F7m2d3iYDv
         ENjLHm7+2ZZncAJ4wShdZ1pxz/Y3Y6VAZmeZ7OXcarD0CudYPBvvzEyZ6usdEWP88xvW
         ClcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793845041; x=1794449841;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bEcKF/O4mjOe4JAG085pq/Q95rlmJbBO1sT0SY3GVGw=;
        b=dogKY47mrj6Di+1duAg7290xqOeVTT5GtKhx4Tg4F26hhzeyTnXTuvOpAsXi5woJ9d
         LXLcfcNQ0PtpQmih6EM1tdPwjEovOPOvht9Dx+42TbXKb6ljlqSXaOhqz/gT1xvwl/dd
         ZlTp0nE+cszi8Mfbs3W3GjOxDAYUkArJCu99XmULhTDqvClT5Dy4WdWTG0PxYZJnipky
         VLEzRCgXen0IuJ8UgDjjstQEJKifi7XtH47pbxfA+J8QWMPuSjEMj6SxxqgrniGJhtMl
         6Cl0CeE17m94VeRLJu+rCUguqjOymr4zRa0F1FhJVVTS81EExGC85h5u5MHl5Vo3Ohyz
         s+pA==
X-Forwarded-Encrypted: i=1; AKwUvBw2kQ6jkBu00J7LUAepX9WGpRpmoZT47a0lHcyPLS0zf0hP8CnKJi3XFlOIfTH/SCZSoG4onhPNB5M=@lists.linux.dev
X-Gm-Message-State: APuU4Z9tpweRHjeBREDHPXHQZMijnOsFidf9VQevsYe3tP2mS/aNl2lP
	MTludCcXNVczP9ZraMTw+3Pd7bPHvnZTlz+xxg4WMrIgACjRwqKzi60oHKLpTXszFnf0I3RveoU
	88lRP8r9kYbX2Gv/yJkvomiVbN3Diams=
X-Gm-Gg: AYBFou172y192Qj2F89XaxcID2h+s0C3y3eJjnpbtUaVgFCA02mS8/n2wB0F6uoEVHg
	aJNlPJHn/EpCmrAV4SYU9pmf23MI2EnpPGgk8ql9gAq//ac+dlNzl7DTmTVDzYXpc69zDfbszGv
	YYL4luW1X8+TmTfPivYwxtDhhA7Tk1ynLB6zbF0jBRA8/SZNy+9Cv1IFG3QeNB2JuNF4Pedg2eg
	i8tiau8bEzCf7M9fMkj6v582vZBfID82mMjZqPxCZwizdcqKYd/Cn7Se/oq+i6oArAOTdJF2Ebm
	4Tc5fXO1mMGpMnXG9x6B7VyhQtlPNpT1CGSl3VdqaGgfZeMIxjC2lpxzB13aqhdB2oTfcTEUdmq
	PJXtkg7nOGgpWPUmZhMxYcoE9KwuepVlGuYMLWA==
X-Received: by 2002:a17:907:d309:b0:c37:8ccb:9b76 with SMTP id
 a640c23a62f3a-c4ca7ac07b7mr1636880566b.40.1793845040724; Wed, 04 Nov 2026
 18:17:20 -0800 (PST)
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <cover.1793689461.git.zhoubinbin@loongson.cn> <ba943ed040b1c6a04a88612c1a62c04fefe876ba.1793689461.git.zhoubinbin@loongson.cn>
 <CAAhV-H7FL1oc0sS_Dm8kcSg0dTX5G8ZfQfQvfWEr_gXQWGAqfg@mail.gmail.com>
In-Reply-To: <CAAhV-H7FL1oc0sS_Dm8kcSg0dTX5G8ZfQfQvfWEr_gXQWGAqfg@mail.gmail.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Thu, 5 Nov 2026 10:17:09 +0800
X-Gm-Features: AclHuK_2BcbzFX_rzqMbxRCglEi3yqwv0qPwa0bq151X-OhcwcT-Bwyik7IOUsY
Message-ID: <CAMpQs4JsFjR0wpF-EAXFrA0MnC46gdBPc8OLcknzEHn6R_+DMg@mail.gmail.com>
Subject: Re: [PATCH 3/8] spi: loongson: Make suspend/resume registers PM-specific
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Mark Brown <broonie@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, linux-spi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 6:02=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org> =
wrote:
>
> Hi, Binbin,
>
> On Tue, Nov 3, 2026 at 3:08=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.c=
n> wrote:
> >
> > Currently, the driver reuses fields like spcr, sper, spsr, and para
> > within struct loongson_spi for multiple purposes (runtime setup,
> > polling, and PM state). This state overloading makes the code fragile.
> > For example, set_clk() modifies spcr/sper during normal operations,
> > which can corrupt the saved state right before a suspend.
> >
> > To fix this, move these register caches into a dedicated struct
> > loongson_spi_suspend_store (lss) so they are exclusively used by the
> > PM callbacks. Other functions (set_clk, write_read_8bit, message
> > handling) are updated to use local variables instead of mutating the
> > global PM state.
> >
> > Fixes: 6c7a864007b6 ("spi: loongson: add bus driver for the loongson sp=
i controller")
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  drivers/spi/spi-loongson-core.c | 80 ++++++++++++++++++---------------
> >  drivers/spi/spi-loongson.h      | 14 +++---
> >  2 files changed, 52 insertions(+), 42 deletions(-)
> >
> > diff --git a/drivers/spi/spi-loongson-core.c b/drivers/spi/spi-loongson=
-core.c
> > index deda754e214d..9f3acf583984 100644
> > --- a/drivers/spi/spi-loongson-core.c
> > +++ b/drivers/spi/spi-loongson-core.c
> > @@ -40,22 +40,23 @@ static void loongson_spi_set_cs(struct spi_device *=
spi, bool en)
> >
> >  static void loongson_spi_set_clk(struct loongson_spi *loongson_spi, un=
signed int hz)
> >  {
> > -       unsigned char val;
> > -       unsigned int div, div_tmp;
> >         static const char rdiv[12] =3D {0, 1, 4, 2, 3, 5, 6, 7, 8, 9, 1=
0, 11};
> > +       unsigned char val, spr, spre;
> > +       unsigned int div, div_tmp;
> >
> >         div =3D clamp_val(DIV_ROUND_UP_ULL(loongson_spi->clk_rate, hz),=
 2, 4096);
> >         div_tmp =3D rdiv[fls(div - 1)];
> > -       loongson_spi->spcr =3D (div_tmp & GENMASK(1, 0)) >> 0;
> > -       loongson_spi->sper =3D (div_tmp & GENMASK(3, 2)) >> 2;
> > +
> > +       spr =3D (div_tmp & GENMASK(1, 0)) >> 0;
> >         val =3D loongson_spi_read_reg(loongson_spi, LOONGSON_SPI_SPCR_R=
EG);
> >         val &=3D ~GENMASK(1, 0);
> > -       loongson_spi_write_reg(loongson_spi, LOONGSON_SPI_SPCR_REG, val=
 |
> > -                              loongson_spi->spcr);
> > +       loongson_spi_write_reg(loongson_spi, LOONGSON_SPI_SPCR_REG, val=
 | spr);
> > +
> > +       spre =3D (div_tmp & GENMASK(3, 2)) >> 2;
> >         val =3D loongson_spi_read_reg(loongson_spi, LOONGSON_SPI_SPER_R=
EG);
> >         val &=3D ~GENMASK(1, 0);
> > -       loongson_spi_write_reg(loongson_spi, LOONGSON_SPI_SPER_REG, val=
 |
> > -                              loongson_spi->sper);
> > +       loongson_spi_write_reg(loongson_spi, LOONGSON_SPI_SPER_REG, val=
 | spre);
> > +
> >         loongson_spi->hz =3D hz;
> >  }
> >
> > @@ -107,8 +108,9 @@ static int loongson_spi_setup(struct spi_device *sp=
i)
> >  static int loongson_spi_write_read_8bit(struct spi_device *spi, const =
u8 **tx_buf,
> >                                         u8 **rx_buf, unsigned int num)
> >  {
> > -       int ret;
> >         struct loongson_spi *loongson_spi =3D spi_controller_get_devdat=
a(spi->controller);
> > +       unsigned char status;
> > +       int ret;
> >
> >         if (tx_buf && *tx_buf)
> >                 loongson_spi_write_reg(loongson_spi, LOONGSON_SPI_FIFO_=
REG, *((*tx_buf)++));
> > @@ -116,8 +118,8 @@ static int loongson_spi_write_read_8bit(struct spi_=
device *spi, const u8 **tx_bu
> >                 loongson_spi_write_reg(loongson_spi, LOONGSON_SPI_FIFO_=
REG, 0);
> >
> >         ret =3D readb_poll_timeout(loongson_spi->base + LOONGSON_SPI_SP=
SR_REG,
> > -                                loongson_spi->spsr, (loongson_spi->sps=
r &
> > -                                LOONGSON_SPI_SPSR_RFEMPTY) !=3D LOONGS=
ON_SPI_SPSR_RFEMPTY,
> > +                                status,
> > +                                !(status & LOONGSON_SPI_SPSR_RFEMPTY),
> >                                  1, USEC_PER_MSEC);
> >
> >         if (rx_buf && *rx_buf)
> > @@ -148,10 +150,11 @@ static int loongson_spi_write_read(struct spi_dev=
ice *spi, struct spi_transfer *
> >  static int loongson_spi_prepare_message(struct spi_controller *ctlr, s=
truct spi_message *m)
> >  {
> >         struct loongson_spi *loongson_spi =3D spi_controller_get_devdat=
a(ctlr);
> > +       unsigned char para;
> >
> > -       loongson_spi->para =3D loongson_spi_read_reg(loongson_spi, LOON=
GSON_SPI_PARA_REG);
> > -       loongson_spi_write_reg(loongson_spi, LOONGSON_SPI_PARA_REG, loo=
ngson_spi->para &
> > -                              ~LOONGSON_SPI_PARA_MEM_EN);
> > +       para =3D loongson_spi_read_reg(loongson_spi, LOONGSON_SPI_PARA_=
REG);
> > +       loongson_spi_write_reg(loongson_spi, LOONGSON_SPI_PARA_REG,
> > +                              para & ~LOONGSON_SPI_PARA_MEM_EN);
> >
> >         return 0;
> >  }
> > @@ -171,8 +174,12 @@ static int loongson_spi_transfer_one(struct spi_co=
ntroller *ctrl, struct spi_dev
> >  static int loongson_spi_unprepare_message(struct spi_controller *ctrl,=
 struct spi_message *m)
> >  {
> >         struct loongson_spi *loongson_spi =3D spi_controller_get_devdat=
a(ctrl);
> > +       unsigned char para;
> >
> > -       loongson_spi_write_reg(loongson_spi, LOONGSON_SPI_PARA_REG, loo=
ngson_spi->para);
> > +       /* Restore the hardware SPI Flash read path */
> > +       para =3D loongson_spi_read_reg(loongson_spi, LOONGSON_SPI_PARA_=
REG);
> > +       loongson_spi_write_reg(loongson_spi, LOONGSON_SPI_PARA_REG,
> > +                              para | LOONGSON_SPI_PARA_MEM_EN);
> >
> >         return 0;
> >  }
> > @@ -231,38 +238,37 @@ EXPORT_SYMBOL_NS_GPL(loongson_spi_init_controller=
, "SPI_LOONGSON_CORE");
> >
> >  static int loongson_spi_suspend(struct device *dev)
> >  {
> > -       struct loongson_spi *loongson_spi;
> > -       struct spi_controller *controller;
> > -
> > -       controller =3D dev_get_drvdata(dev);
> > -       spi_controller_suspend(controller);
> > +       struct spi_controller *controller =3D dev_get_drvdata(dev);
> > +       struct loongson_spi *loongson_spi =3D spi_controller_get_devdat=
a(controller);
> > +       int ret;
> >
> > -       loongson_spi =3D spi_controller_get_devdata(controller);
> > +       ret =3D spi_controller_suspend(controller);
> > +       if (ret)
> > +               return ret;
> >
> > -       loongson_spi->spcr =3D loongson_spi_read_reg(loongson_spi, LOON=
GSON_SPI_SPCR_REG);
> > -       loongson_spi->sper =3D loongson_spi_read_reg(loongson_spi, LOON=
GSON_SPI_SPER_REG);
> > -       loongson_spi->spsr =3D loongson_spi_read_reg(loongson_spi, LOON=
GSON_SPI_SPSR_REG);
> > -       loongson_spi->para =3D loongson_spi_read_reg(loongson_spi, LOON=
GSON_SPI_PARA_REG);
> > -       loongson_spi->sfcs =3D loongson_spi_read_reg(loongson_spi, LOON=
GSON_SPI_SFCS_REG);
> > -       loongson_spi->timi =3D loongson_spi_read_reg(loongson_spi, LOON=
GSON_SPI_TIMI_REG);
> > +       loongson_spi->lss.spcr =3D loongson_spi_read_reg(loongson_spi, =
LOONGSON_SPI_SPCR_REG);
> > +       loongson_spi->lss.sper =3D loongson_spi_read_reg(loongson_spi, =
LOONGSON_SPI_SPER_REG);
> > +       loongson_spi->lss.spsr =3D loongson_spi_read_reg(loongson_spi, =
LOONGSON_SPI_SPSR_REG);
> > +       loongson_spi->lss.para =3D loongson_spi_read_reg(loongson_spi, =
LOONGSON_SPI_PARA_REG);
> > +       loongson_spi->lss.sfcs =3D loongson_spi_read_reg(loongson_spi, =
LOONGSON_SPI_SFCS_REG);
> > +       loongson_spi->lss.timi =3D loongson_spi_read_reg(loongson_spi, =
LOONGSON_SPI_TIMI_REG);
> >
> >         return 0;
> >  }
> >
> >  static int loongson_spi_resume(struct device *dev)
> >  {
> > -       struct loongson_spi *loongson_spi;
> > -       struct spi_controller *controller;
> > +       struct spi_controller *controller =3D dev_get_drvdata(dev);
> > +       struct loongson_spi *loongson_spi =3D spi_controller_get_devdat=
a(controller);
> >
> > -       controller =3D dev_get_drvdata(dev);
> > -       loongson_spi =3D spi_controller_get_devdata(controller);
> > +       loongson_spi_write_reg(loongson_spi, LOONGSON_SPI_SPCR_REG, loo=
ngson_spi->lss.spcr);
> > +       loongson_spi_write_reg(loongson_spi, LOONGSON_SPI_SPER_REG, loo=
ngson_spi->lss.sper);
> > +       loongson_spi_write_reg(loongson_spi, LOONGSON_SPI_PARA_REG, loo=
ngson_spi->lss.para);
> > +       loongson_spi_write_reg(loongson_spi, LOONGSON_SPI_SFCS_REG, loo=
ngson_spi->lss.sfcs);
> > +       loongson_spi_write_reg(loongson_spi, LOONGSON_SPI_TIMI_REG, loo=
ngson_spi->lss.timi);
> >
> > -       loongson_spi_write_reg(loongson_spi, LOONGSON_SPI_SPCR_REG, loo=
ngson_spi->spcr);
> > -       loongson_spi_write_reg(loongson_spi, LOONGSON_SPI_SPER_REG, loo=
ngson_spi->sper);
> > -       loongson_spi_write_reg(loongson_spi, LOONGSON_SPI_SPSR_REG, loo=
ngson_spi->spsr);
> > -       loongson_spi_write_reg(loongson_spi, LOONGSON_SPI_PARA_REG, loo=
ngson_spi->para);
> > -       loongson_spi_write_reg(loongson_spi, LOONGSON_SPI_SFCS_REG, loo=
ngson_spi->sfcs);
> > -       loongson_spi_write_reg(loongson_spi, LOONGSON_SPI_TIMI_REG, loo=
ngson_spi->timi);
> > +       loongson_spi_write_reg(loongson_spi, LOONGSON_SPI_SPSR_REG,
> > +                              LOONGSON_SPI_SPSR_SPIF | LOONGSON_SPI_SP=
SR_WCOL);
> >
> >         spi_controller_resume(controller);
> >
> > diff --git a/drivers/spi/spi-loongson.h b/drivers/spi/spi-loongson.h
> > index 35f95b161842..b2e73fa12420 100644
> > --- a/drivers/spi/spi-loongson.h
> > +++ b/drivers/spi/spi-loongson.h
> > @@ -29,19 +29,23 @@
> >  struct device;
> >  struct spi_controller;
> >
> > -struct loongson_spi {
> > -       struct  spi_controller  *controller;
> > -       void __iomem            *base;
> > -       int                     cs_active;
> > -       unsigned int            hz;
> > +struct loongson_spi_suspend_store {
> Maybe loongson_spi_pm_state is a better name.

Yes, I will rename it.
>
> Huacai
>
> >         unsigned char           spcr;
> >         unsigned char           sper;
> >         unsigned char           spsr;
> >         unsigned char           para;
> >         unsigned char           sfcs;
> >         unsigned char           timi;
> > +};
> > +
> > +struct loongson_spi {
> > +       struct  spi_controller  *controller;
> > +       void __iomem            *base;
> > +       int                     cs_active;
> > +       unsigned int            hz;
> >         unsigned int            mode;
> >         u64                     clk_rate;
> > +       struct loongson_spi_suspend_store lss;
> >  };
> >
> >  int loongson_spi_init_controller(struct device *dev, void __iomem *reg=
);
> > --
> > 2.52.0
> >

--=20
Thanks.
Binbin
