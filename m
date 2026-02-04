Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3280628135D
	for <loongarch@lists.linux.dev>; Wed,  4 Feb 2026 01:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770168825; cv=pass; b=HniTty0CH0VJAgqVL7PgPc+IxBTlTaatjWDZyCkrLEZoqFVZi9k0LOZIILqtHZhxVWFP7tVVHVggfjlHSK2udPnhr0ke13xG00x3ibqVkb2x2vwoKIgRtXcRNC2s1XsIMB0dGsREOlowapGRuHliiyhGQOYVTZgwPjj2R8pv9yY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770168825; c=relaxed/simple;
	bh=FuM/do0dpJ20rgHYDmqB/lNEyt2Fm7kFoo5C0HPXjCQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LsbxN0iQY6FQ8Enn6i6SwttK5YEu09CGBxNi8R+0JwF5vRouyb/u0nLazPCIjuCpxJcZhflyZAJ89SfqmGT+PA9W9fSeT2p70W2bDoA1le7hcSf7h2nlpmOhBiL0+Mr3hNTIdcj4S+m7Vm0K1d7qhXz9JdPRrcWpKL6PQcQfr4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kukaT4Df; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kukaT4Df"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-658381b28e8so8734017a12.0
        for <loongarch@lists.linux.dev>; Tue, 03 Feb 2026 17:33:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770168821; cv=none;
        d=google.com; s=arc-20240605;
        b=GhZ0/vDLsAf/QWAAMlk5D76RqQxoKxNEfNo5LJ8nFQb2eL2//Gs5+6EBPfIHinfm+7
         PQa1M2871FKOcyQ6o9vSqZDrCrcqDu9eu55pw/jCf957dkxBDniOKL8iaNHHE4Xr1Mhk
         THNH+WcHuRpyGicZhx4Pbo6VkpIrhnwBdmbi/JXQJX050hl3k4mNxb2iuwe+a8vKkI2d
         L0CJMVNhQjM6+VOxl1DGooLAkk96TQQ7IAgL6NGm6Ml68I1kpz5COROZXTJsB/NOA9Ke
         jHRmTdPcNgmiZGpswC2sGlpsjL3zwUYc6jFPsJ4TVViHtDqUVpTKpK4j2zYkS+ZWDiJ+
         94CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CZhCooet7z9z5qQvsjRBpYPvdpvWb9CCCtfRLOX4blc=;
        fh=VjMtL7RQ9C3Dw6o7iA7+jNjh9TEPbUnV7Q1NpwT8Mmg=;
        b=iJWOHvah0a2g8bebn6UwQJehOxP4yn4pC9tHGNMK5OnyD1JlS9Bb5AFT2MWZaQhzKB
         83pNZo1Rj6BouiDN5QWBsVEx9TwQVejaZYAX0iw/Zd95LrJnh9/XWTsgsBf6ENYSeyAt
         d/SjxoTzI4GI00IU3XqpMyulmQ4uYQhUoThGRBbtNtC9SFrYvaJUhcnX41/UWxiOhs91
         mXbQJQj/vLlwQF/atLc7KmRV5V0GV8NDA/OANVkvlKVvaEoWfkEA+aZUgZavFflemOSR
         oE/IKNFTMGaDuRTHBK7MGyj0CfVP/fh1G4+UEcCZERy3A9ZsSDUzO8nlvEe6ygDEMeEf
         uyUw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770168821; x=1770773621; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CZhCooet7z9z5qQvsjRBpYPvdpvWb9CCCtfRLOX4blc=;
        b=kukaT4DfecrHDRO00jHJk8kgg9tDzTcqGtvFBV083jXuQQzLqJy7DQ33LnAD/M/2HU
         F4b1N3zXyydZmaJLyxIZcXnLEDBdVEKlxFotOKtGGG8J/8UOlWBdYLX7v0y/mNBzzYUB
         bRUbakIMWtACmRnvUrmp01P7dcvnuy7itUn+kYqHHpVTchYSKr0G3LidnjeNaEoQjfvs
         mq0Xmb+qK2zQ9fCwRKdr/Z1hI+NGg6YSMxoPGQGfnlI1ukHXp8CGLvThovoS5JTvtBwF
         WDRIwMuWYpjGV05UI8/95eYOyFo08ZJkydul5Xp/oSLXSSa/x7B10i6eXQ+6lEjn9N9t
         88hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770168821; x=1770773621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CZhCooet7z9z5qQvsjRBpYPvdpvWb9CCCtfRLOX4blc=;
        b=Qb3ifFtql8cmfZ3OLfGtBicodrze/6meUc3W8wLsjZk6oez77fl1W0Uc35x+8rcRqV
         CilB3nC1XpfxJqZx/70RgaAw2fm2UtmWq65GmNr5v/Q9U+4QoIwkanRJvuODa2rwXGt/
         8sCRV8iaS/0fItEH1X7Bzt6Xm93S9kV5xnJrtCnZpeO8M9HWmW0s8RTSr7Z1fEniVlRl
         jkn8d8FE6FF4WbLPUkjNPBND9GyMAUyBlfU4qsVIXZVeO63EjPlVWcU1xVOdYIzzu6aT
         6JdIhhjiExgaxqMiw25YMtFWJIWnYYkQsVz350U8IXX8qFcDjyiCHvdpjKHIpY2pn+iE
         lKcg==
X-Forwarded-Encrypted: i=1; AJvYcCUNd0jGvnelU8RjH3igxj9I5AyuoYV8K/4z9WdVHdagznLlPq1p61FqeESK5MktoDwfOd3C55xoG/o=@lists.linux.dev
X-Gm-Message-State: AOJu0YySIwKwUEYoekLgq9OnOWBkVL2MVWYItAZS9gSrUIp/LNZdOlIW
	XEgyAhrQlIl7gC9Ye8/1aXDSucaVV90hcoyMqrOQADotvdkRpQkMKyNEIT5RGeIDDB6ywV4Qif0
	bN7x2H9fIj+toZ7D24NsVyujnw8JpMAw=
X-Gm-Gg: AZuq6aJ7ABqqspk/vQwkyNbXyTyF+wzrpfP/DyTHrwLO6ms0+YY0ijrh+bnUiOQwnl2
	KPcqyUAqbgDMXE70cXo1E+6TEKCcD7l6yR2cuFfRkQ/O8ExeGf6eZRiFK7+RvtqqDYOAoND5kOt
	LykK/tiAKi7hQnzQiOv51vvW9BIC3uXrZULb0s0ojlzFmW/NRtG1BksK7t9GDzy2h7UcavuHaMo
	5nd8512+jPNhHK1OeYTwMsGWwr1DxdCX7aUL0Gn0OkjbJiOKfP8g5Rf+kFbGPpUmn5cQL8=
X-Received: by 2002:a17:907:9625:b0:b88:71ec:e7a6 with SMTP id
 a640c23a62f3a-b8e9f04c989mr93891666b.17.1770168821263; Tue, 03 Feb 2026
 17:33:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1770119693.git.zhoubinbin@loongson.cn> <20d52dd26c46f4850e7d5c5443c0efef6c4e4c1c.1770119693.git.zhoubinbin@loongson.cn>
 <aYJW5+975pmkyjne@lizhi-Precision-Tower-5810>
In-Reply-To: <aYJW5+975pmkyjne@lizhi-Precision-Tower-5810>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 4 Feb 2026 09:33:29 +0800
X-Gm-Features: AZwV_QhzrAc4QPgfNbFzMSiFrzOonyyUvl623orSYYeMHEVb9f00hblyRdIUGyM
Message-ID: <CAMpQs4L-CJEvCuO_YVuyHaAm_tr+QJ71G5dTVysfFgS1JiMc7Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] dmaengine: loongson: New driver for the Loongson
 Multi-Channel DMA controller
To: Frank Li <Frank.li@nxp.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org, 
	Xiaochuang Mao <maoxiaochuan@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	Keguang Zhang <keguang.zhang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Frank:

Thanks for your reply.

On Wed, Feb 4, 2026 at 4:13=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Tue, Feb 03, 2026 at 08:30:12PM +0800, Binbin Zhou wrote:
> > This DMA controller appears in Loongson-2K0300 and Loongson-2K3000.
> >
> > It is a multi-channel controller that enables data transfers from memor=
y
> > to memory, device to memory, and memory to device, as well as channel
> > prioritization configurable through the channel configuration registers=
.
> >
> > In addition, there are slight differences between Loongson-2K0300 and
> > Loongson-2K3000, such as channel register offsets and the number of
> > channels.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  MAINTAINERS                                 |   1 +
> >  drivers/dma/loongson/Kconfig                |  10 +
> >  drivers/dma/loongson/Makefile               |   1 +
> >  drivers/dma/loongson/loongson2-apb-dma-v2.c | 759 ++++++++++++++++++++
> >  4 files changed, 771 insertions(+)
> >  create mode 100644 drivers/dma/loongson/loongson2-apb-dma-v2.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 16fe66bebac1..0735a812f61b 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -14777,6 +14777,7 @@ L:    dmaengine@vger.kernel.org
> >  S:   Maintained
> >  F:   Documentation/devicetree/bindings/dma/loongson,ls2k0300-dma.yaml
> >  F:   Documentation/devicetree/bindings/dma/loongson,ls2x-apbdma.yaml
> > +F:   drivers/dma/loongson/loongson2-apb-dma-v2.c
> >  F:   drivers/dma/loongson/loongson2-apb-dma.c
> >
> >  LOONGSON LS2X I2C DRIVER
> > diff --git a/drivers/dma/loongson/Kconfig b/drivers/dma/loongson/Kconfi=
g
> > index 9dbdaef5a59f..77eb63d75a05 100644
> > --- a/drivers/dma/loongson/Kconfig
> > +++ b/drivers/dma/loongson/Kconfig
> > @@ -25,4 +25,14 @@ config LOONGSON2_APB_DMA
> >         This DMA controller transfers data from memory to peripheral fi=
fo.
> >         It does not support memory to memory data transfer.
> >
> > +config LOONGSON2_APB_DMA_V2
> > +     tristate "Loongson2 Multi-Channel DMA support"
> > +     select DMA_ENGINE
> > +     select DMA_VIRTUAL_CHANNELS
> > +     help
> > +       Support for the Loongson Multi-Channel DMA controller driver.
> > +       It is discovered on the Loongson-2K chip (Loongson-2K0300/Loong=
son-2K3000),
> > +       which has 4/8 channels internally, enabling bidirectional data =
transfer
> > +       between devices and memory.
> > +
> >  endif
> > diff --git a/drivers/dma/loongson/Makefile b/drivers/dma/loongson/Makef=
ile
> > index 6cdd08065e92..f5af8bf537e6 100644
> > --- a/drivers/dma/loongson/Makefile
> > +++ b/drivers/dma/loongson/Makefile
> > @@ -1,3 +1,4 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> >  obj-$(CONFIG_LOONGSON1_APB_DMA) +=3D loongson1-apb-dma.o
> >  obj-$(CONFIG_LOONGSON2_APB_DMA) +=3D loongson2-apb-dma.o
> > +obj-$(CONFIG_LOONGSON2_APB_DMA_V2) +=3D loongson2-apb-dma-v2.o
> > diff --git a/drivers/dma/loongson/loongson2-apb-dma-v2.c b/drivers/dma/=
loongson/loongson2-apb-dma-v2.c
> > new file mode 100644
> > index 000000000000..6533a089d904
> > --- /dev/null
> > +++ b/drivers/dma/loongson/loongson2-apb-dma-v2.c
> > @@ -0,0 +1,759 @@
> ...
> > +
> > +struct loongson2_mdma_chan_reg {
> > +     u32 dma_ccr;
> > +     u32 dma_cndtr;
> > +     u32 dma_cpar;
> > +     u32 dma_cmar;
> > +};
>
> needn't 'dma_' prefix because it is already in loongson2_mdma_chan_reg.

ok..
>
> > +
> > +struct loongson2_mdma_sg_req {
> > +     u32 len;
> > +     struct loongson2_mdma_chan_reg chan_reg;
> > +};
> > +
> ...
> > +
> > +static struct loongson2_mdma_desc *loongson2_mdma_alloc_desc(u32 num_s=
gs)
> > +{
> > +     return kzalloc(sizeof(struct loongson2_mdma_desc) +
> > +                    sizeof(struct loongson2_mdma_sg_req) * num_sgs, GF=
P_NOWAIT);
>
> use struct_size()

I see.
>
> > +}
> > +
> > +static int loongson2_mdma_slave_config(struct dma_chan *chan, struct d=
ma_slave_config *config)
> > +{
> > +     struct loongson2_mdma_chan *lchan =3D to_lmdma_chan(chan);
> > +
> > +     memcpy(&lchan->dma_sconfig, config, sizeof(*config));
> > +
> > +     return 0;
> > +}
> > +
> ...
> > +
> > +static int loongson2_mdma_probe(struct platform_device *pdev)
> > +{
> > +     const struct loongson2_mdma_config *config;
> > +     struct loongson2_mdma_chan *lchan;
> > +     struct loongson2_mdma_dev *lddev;
> > +     struct device *dev =3D &pdev->dev;
> > +     struct dma_device *ddev;
> > +     int nr_chans, i, ret;
> > +
> > +     config =3D (const struct loongson2_mdma_config *)device_get_match=
_data(dev);
> > +     if (!config)
> > +             return -EINVAL;
> > +
> > +     ret =3D device_property_read_u32(dev, "dma-channels", &nr_chans);
> > +     if (ret || nr_chans > config->max_channels) {
> > +             dev_err(dev, "missing or invalid dma-channels property\n"=
);
> > +             nr_chans =3D config->max_channels;
> > +     }
> > +
> > +     lddev =3D devm_kzalloc(dev, struct_size(lddev, chan, nr_chans), G=
FP_KERNEL);
> > +     if (!lddev)
> > +             return -ENOMEM;
> > +
> > +     lddev->base =3D devm_platform_ioremap_resource(pdev, 0);
> > +     if (IS_ERR(lddev->base))
> > +             return PTR_ERR(lddev->base);
> > +
> > +     platform_set_drvdata(pdev, lddev);
> > +     lddev->nr_channels =3D nr_chans;
> > +     lddev->chan_reg_offset =3D config->chan_reg_offset;
> > +
> > +     lddev->dma_clk =3D devm_clk_get_optional_enabled(dev, NULL);
> > +     if (IS_ERR(lddev->dma_clk))
> > +             return dev_err_probe(dev, PTR_ERR(lddev->dma_clk), "Faile=
d to get dma clock\n");
> > +
> > +     ddev =3D &lddev->ddev;
> > +     ddev->dev =3D dev;
> > +
> > +     dma_cap_zero(ddev->cap_mask);
> > +     dma_cap_set(DMA_SLAVE, ddev->cap_mask);
> > +     dma_cap_set(DMA_PRIVATE, ddev->cap_mask);
> > +     dma_cap_set(DMA_CYCLIC, ddev->cap_mask);
> > +
> > +     ddev->device_free_chan_resources =3D loongson2_mdma_free_chan_res=
ources;
> > +     ddev->device_config =3D loongson2_mdma_slave_config;
> > +     ddev->device_prep_slave_sg =3D loongson2_mdma_prep_slave_sg;
> > +     ddev->device_prep_dma_cyclic =3D loongson2_mdma_prep_dma_cyclic;
> > +     ddev->device_issue_pending =3D loongson2_mdma_issue_pending;
> > +     ddev->device_synchronize =3D loongson2_mdma_synchronize;
> > +     ddev->device_tx_status =3D loongson2_mdma_tx_status;
> > +     ddev->device_terminate_all =3D loongson2_mdma_terminate_all;
> > +
> > +     ddev->src_addr_widths =3D LOONGSON2_MDMA_BUSWIDTHS;
> > +     ddev->dst_addr_widths =3D LOONGSON2_MDMA_BUSWIDTHS;
> > +     ddev->directions =3D BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV);
> > +     INIT_LIST_HEAD(&ddev->channels);
> > +
> > +     for (i =3D 0; i < nr_chans; i++) {
> > +             lchan =3D &lddev->chan[i];
> > +
> > +             lchan->id =3D i;
> > +             lchan->vchan.desc_free =3D loongson2_mdma_desc_free;
> > +             vchan_init(&lchan->vchan, ddev);
> > +     }
> > +
> > +     ret =3D dma_async_device_register(ddev);
>
> use dmaenginem_async_device_register() to avoid below goto

ok...
>
> Frank
>
> > +     if (ret)
> > +             return ret;
> > +
> > +     for (i =3D 0; i < nr_chans; i++) {
> > +             lchan =3D &lddev->chan[i];
> > +
> > +             lchan->irq =3D platform_get_irq(pdev, i);
> > +             if (lchan->irq < 0) {
> > +                     ret =3D -EINVAL;
> > +                     goto unregister_dmac;
> > +             }
> > +
> > +             ret =3D devm_request_irq(dev, lchan->irq, loongson2_mdma_=
chan_irq, IRQF_SHARED,
> > +                                    dev_name(chan2dev(lchan)), lchan);
> > +             if (ret)
> > +                     goto unregister_dmac;
> > +     }
> > +
> > +     ret =3D loongson2_mdma_acpi_controller_register(lddev);
> > +     if (ret)
> > +             goto unregister_dmac;
> > +
> > +     ret =3D loongson2_mdma_of_controller_register(lddev);
> > +     if (ret)
> > +             goto unregister_dmac;
> > +
> > +     dev_info(dev, "Loongson-2 Multi-Channel DMA Controller driver reg=
istered successfully.\n");
> > +     return 0;
> > +
> > +unregister_dmac:
> > +     dma_async_device_unregister(ddev);
> > +
> > +     return ret;
> > +}
> > +
> > +static void loongson2_mdma_remove(struct platform_device *pdev)
> > +{
> > +     struct loongson2_mdma_dev *lddev =3D platform_get_drvdata(pdev);
> > +
> > +     of_dma_controller_free(pdev->dev.of_node);
> > +     dma_async_device_unregister(&lddev->ddev);
> > +}
> > +
> > +static const struct of_device_id loongson2_mdma_of_match[] =3D {
> > +     { .compatible =3D "loongson,ls2k0300-dma", .data =3D &ls2k0300_md=
ma_config },
> > +     { .compatible =3D "loongson,ls2k3000-dma", .data =3D &ls2k3000_md=
ma_config },
> > +     { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, loongson2_mdma_of_match);
> > +
> > +static const struct acpi_device_id loongson2_mdma_acpi_match[] =3D {
> > +     { "LOON0014", .driver_data =3D (kernel_ulong_t)&ls2k3000_mdma_con=
fig },
> > +     { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(acpi, loongson2_mdma_acpi_match);
> > +
> > +static struct platform_driver loongson2_mdma_driver =3D {
> > +     .driver =3D {
> > +             .name =3D "loongson2-mdma",
> > +             .of_match_table =3D loongson2_mdma_of_match,
> > +             .acpi_match_table =3D loongson2_mdma_acpi_match,
> > +     },
> > +     .probe =3D loongson2_mdma_probe,
> > +     .remove =3D loongson2_mdma_remove,
> > +};
> > +
> > +module_platform_driver(loongson2_mdma_driver);
> > +
> > +MODULE_DESCRIPTION("Looongson-2 Multi-Channel DMA Controller driver");
> > +MODULE_AUTHOR("Loongson Technology Corporation Limited");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.47.3
> >

--
Thanks.
Binbin
