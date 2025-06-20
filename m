Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F37781749
	for <loongarch@lists.linux.dev>; Fri, 20 Jun 2025 03:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750388818; cv=none; b=smkkTPkMVbJdUIRJFfi4tvuSqOKrL+GSAg4ClEdXGfDzbrWdxH06x7U7SJ3S0VhUHfHGFADP1DokvKmBoh6b/9J3kEn8/euNzo0OuvZIjMUE7rtOTJH1u25vQM4K44MZuKu2TW8ZOj8XZodsPB1+LZNGvBnXZXCDrmE1FvcB25c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750388818; c=relaxed/simple;
	bh=50chBdV0GNZqgVVHAh8HkwT52joswv38Z5B6NNYtAnI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FvRVkCXjUC6096dY1H7IhdRyTEzHAwFKhuzFfWrfQHcRYn8AUypDNJ+1TWifWdx5n/p0/IwrjavlhgkluhYg/fXNxcemkLYsQouAO7kVjS4AgKWxtCMN8KlNsh/055KuIG+D72Bzhld6OuZQuR5MJ0l8RFsMJodEVGrPMaLk1XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gdS0mikQ; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gdS0mikQ"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ade326e366dso252096066b.3
        for <loongarch@lists.linux.dev>; Thu, 19 Jun 2025 20:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750388814; x=1750993614; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nj+AbFauyBteu4L0ydCDYSWomcArU9/BgWfzugjnhFM=;
        b=gdS0mikQ5HgyEhhHW/IS7vrAmkyN9k7XdiWWWaqHiRyI676JqzQh2Pw7AGt4HpZZ6e
         0QhGRBTN+5VMvIgZ3qnYa4q1l/QWUWzuZ8dOWe4KTeTvAJEK0g4GmHJl8ruCwhUjzQpD
         6PJPSULTHjZGLNSndmttJpB05vLwMEt+xc+gRre5ys8V3SMi7wrnThTQJap2O5pEghCu
         PjLnTLFowH78urRVZQ1syk1WfhPvkYfiKEFimfocbDh132/S5RzmV7e6clKfKFT1WYua
         oavVKvvM4zN3z9iQuK10hgJfQlsLnGewCfsE8aBfN3Sb/N/4ymDa3UPdPrqTrxIszFO2
         7Yzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750388814; x=1750993614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nj+AbFauyBteu4L0ydCDYSWomcArU9/BgWfzugjnhFM=;
        b=kz4dDO3eRIdGj1TNujWbfI8EzZlP0Zsa01UDe3MzM+gcWhVqoe/zkMbhpB+SpdTxF0
         AJRCRZeVGckdyF/HSokAtXxMwhspVT621Z69axLfJQxjgqicGm78ux8s1Qdrz6vjnKL4
         4qaox0Of7xGZZ88Ow7xFwugz8XqJ9qg7kw42SvpQ5AGld68CIzNuN6CjBiFBLqrecHNL
         zuCbHsFPIKoBlBmKJA4EB3YSFdU/N1eD2ltcViQkp8ZV9+dT/HPnnHvmxTKwsmdC279x
         S7Udwq25+79XX+sjMj2qtTQihaEPzhm3oNbjMG0prb/Th2zE3yjDb/MMLPRhVwdSSt9n
         i3Kw==
X-Forwarded-Encrypted: i=1; AJvYcCXeyuWu4Mig861WrfS75xIh5o/ND+InYZWj5tex2YeePYlkJfw7NdXNRZ7GSOIldMcF2MM+oUDZ+uA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxPUf8rKmrpcJ6/6gENI5/QYJMsSIMtJQ/M3Le6bYu6+VYVtEnF
	HBQjS6qvJkQKciIp2wv9bowGl++yMQkZpgkWZ7Zg2kFaCOac0NuIEX9vwJO1rU+Mb6LxyVE6kjY
	RSBlUgkhQZEX0ahiA4aA+X6fzChvIW4U=
X-Gm-Gg: ASbGncvNCGn0WcFkgBR1CIhSaOIL7ejXaTTXjQtEqI1tpccLZRnzF/69sIcr08Ins5A
	60B0VQkFIqfKPAI9qHFFy6aYMnscW+xBFLzntlk8dHbJwPv42/f7SBE3c/5ivErCNFHYi0asVlH
	6L5OxMZaXhMHKHsAP+KoEyjcIvUZ0HsG3a3CwglRxmleQ=
X-Google-Smtp-Source: AGHT+IEdSeXp6qXnVVJ0TOSWxCRaUwsrwNAtw3Gd8l+hokH9ekkBwcQ2i8chqVB8VBwgxVkaPTV73Yn+cBO25wFiLDk=
X-Received: by 2002:a17:907:1c0c:b0:ad8:99cc:774c with SMTP id
 a640c23a62f3a-ae057f41a39mr101055266b.58.1750388814060; Thu, 19 Jun 2025
 20:06:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1750216134.git.zhoubinbin@loongson.cn> <aa9cfb9707334cd2e56692397dd4f54c418262ce.1750216134.git.zhoubinbin@loongson.cn>
 <CAAhV-H5qHrfOApRBKinseMsZq7rS4QoznzzVFgjv8_EOivMW9w@mail.gmail.com>
In-Reply-To: <CAAhV-H5qHrfOApRBKinseMsZq7rS4QoznzzVFgjv8_EOivMW9w@mail.gmail.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Fri, 20 Jun 2025 11:06:40 +0800
X-Gm-Features: Ac12FXz1AYvW7rZ6VgQt0QPkwP-7hts8OhslkuVnJ-89BrdlPsno3bBY0nmq-B0
Message-ID: <CAMpQs4+g1aG96t5dox3zAmcJ_DN1AeUG2feTPiH0oRaG+J_z+Q@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] mmc: loongson2: Add Loongson-2K2000 SD/SDIO/eMMC
 controller driver
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-mmc@vger.kernel.org, wanghongliang@loongson.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 12:03=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org=
> wrote:
>
> Hi, Binbin,
>
> On Wed, Jun 18, 2025 at 4:08=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.=
cn> wrote:
> >
> > This patch describes the two MMC controllers of the Loongson-2K2000 SoC=
,
> > one providing an eMMC interface and the other exporting an SD/SDIO
> > interface.
> >
> > Compared to the Loongson-2K1000's MMC controllers, their internals are
> > similar, except that we use an internally exclusive DMA engine instead =
of
> > an externally shared APBDMA engine.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  drivers/mmc/host/loongson2-mmc.c | 212 +++++++++++++++++++++++++++++++
> >  1 file changed, 212 insertions(+)
> >
> > diff --git a/drivers/mmc/host/loongson2-mmc.c b/drivers/mmc/host/loongs=
on2-mmc.c
> > index 872f5dc21b21..75144221a821 100644
> > --- a/drivers/mmc/host/loongson2-mmc.c
> > +++ b/drivers/mmc/host/loongson2-mmc.c
> > @@ -44,6 +44,18 @@
> >  #define LOONGSON2_MMC_REG_DATA         0x40 /* Data Register */
> >  #define LOONGSON2_MMC_REG_IEN          0x64 /* Interrupt Enable Regist=
er */
> >
> > +/* EMMC DLL Mode Registers */
> > +#define LOONGSON2_MMC_REG_DLLVAL       0xf0 /* DLL Master Lock-value R=
egister */
> > +#define LOONGSON2_MMC_REG_DLLCTL       0xf4 /* DLL Control Register */
> > +#define LOONGSON2_MMC_REG_DELAY                0xf8 /* DLL Delayed Par=
ameter Register */
> > +#define LOONGSON2_MMC_REG_SEL          0xfc /* Bus Mode Selection Regi=
ster */
> > +
> > +/* Exclusive DMA R/W Registers */
> > +#define LOONGSON2_MMC_REG_WDMA_LO      0x400
> > +#define LOONGSON2_MMC_REG_WDMA_HI      0x404
> > +#define LOONGSON2_MMC_REG_RDMA_LO      0x800
> > +#define LOONGSON2_MMC_REG_RDMA_HI      0x804
> > +
> >  /* Bitfields of control register */
> >  #define LOONGSON2_MMC_CTL_ENCLK                BIT(0)
> >  #define LOONGSON2_MMC_CTL_EXTCLK       BIT(1)
> > @@ -109,6 +121,9 @@
> >  #define LOONGSON2_MMC_DSTS_RESUME      BIT(15)
> >  #define LOONGSON2_MMC_DSTS_SUSPEND     BIT(16)
> >
> > +/* Bitfields of FIFO Status Register */
> > +#define LOONGSON2_MMC_FSTS_TXFULL      BIT(11)
> > +
> >  /* Bitfields of interrupt register */
> >  #define LOONGSON2_MMC_INT_DFIN         BIT(0)
> >  #define LOONGSON2_MMC_INT_DTIMEOUT     BIT(1)
> > @@ -136,6 +151,41 @@
> >  #define LOONGSON2_MMC_IEN_ALL          GENMASK(9, 0)
> >  #define LOONGSON2_MMC_INT_CLEAR                GENMASK(9, 0)
> >
> > +/* Bitfields of DLL master lock-value register */
> > +#define LOONGSON2_MMC_DLLVAL_DONE      BIT(8)
> > +
> > +/* Bitfields of DLL control register */
> > +#define LOONGSON2_MMC_DLLCTL_TIME      GENMASK(7, 0)
> > +#define LOONGSON2_MMC_DLLCTL_INCRE     GENMASK(15, 8)
> > +#define LOONGSON2_MMC_DLLCTL_START     GENMASK(23, 16)
> > +#define LOONGSON2_MMC_DLLCTL_CLK_MODE  BIT(24)
> > +#define LOONGSON2_MMC_DLLCTL_START_BIT BIT(25)
> > +#define LOONGSON2_MMC_DLLCTL_TIME_BPASS        GENMASK(29, 26)
> > +
> > +#define LOONGSON2_MMC_DELAY_PAD                GENMASK(7, 0)
> > +#define LOONGSON2_MMC_DELAY_RD         GENMASK(15, 8)
> > +
> > +#define LOONGSON2_MMC_SEL_DATA         BIT(0)  /* 0: SDR, 1: DDR */
> > +#define LOONGSON2_MMC_SEL_BUS          BIT(0)  /* 0: EMMC, 1: SDIO */
> > +
> > +/* Internal dma controller registers */
> > +
> > +/* Bitfields of Global Configuration Register */
> > +#define LOONGSON2_MMC_DMA_64BIT_EN     BIT(0) /* 1: 64 bit support */
> > +#define LOONGSON2_MMC_DMA_UNCOHERENT_EN        BIT(1) /* 0: cache, 1: =
uncache */
> > +#define LOONGSON2_MMC_DMA_ASK_VALID    BIT(2)
> > +#define LOONGSON2_MMC_DMA_START                BIT(3) /* DMA start ope=
ration */
> > +#define LOONGSON2_MMC_DMA_STOP         BIT(4) /* DMA stop operation */
> > +#define LOONGSON2_MMC_DMA_CONFIG_MASK  GENMASK_ULL(4, 0) /* DMA contro=
ller config bits mask */
> > +
> > +/* Bitfields of ndesc_addr field of HW descriptor */
> > +#define LOONGSON2_MMC_DMA_DESC_EN      BIT(0) /*1: The next descriptor=
 is valid */
> > +#define LOONGSON2_MMC_DMA_DESC_ADDR_LOW        GENMASK(31, 1)
> > +
> > +/* Bitfields of cmd field of HW descriptor */
> > +#define LOONGSON2_MMC_DMA_INT          BIT(1)  /* Enable DMA interrupt=
s */
> > +#define LOONGSON2_MMC_DMA_DATA_DIR     BIT(12) /* 1: write to device, =
0: read from device */
> > +
> >  /* Loongson-2K1000 SDIO2 DMA routing register */
> >  #define LS2K1000_SDIO_DMA_MASK         GENMASK(17, 15)
> >  #define LS2K1000_DMA0_CONF             0x0
> > @@ -180,6 +230,8 @@ struct loongson2_mmc_host {
> >         struct resource *res;
> >         struct clk *clk;
> >         u64 rate;
> > +       void *sg_cpu;
> > +       dma_addr_t sg_dma;
> >         int dma_complete;
> >         struct dma_chan *chan;
> >         int cmd_is_stop;
> > @@ -192,6 +244,7 @@ struct loongson2_mmc_host {
> >  struct loongson2_mmc_pdata {
> >         const struct regmap_config *regmap_config;
> >         void (*reorder_cmd_data)(struct loongson2_mmc_host *host, struc=
t mmc_command *cmd);
> > +       void (*fix_data_timeout)(struct loongson2_mmc_host *host, struc=
t mmc_command *cmd);
> >         int (*setting_dma)(struct loongson2_mmc_host *host, struct plat=
form_device *pdev);
> >         int (*prepare_dma)(struct loongson2_mmc_host *host, struct mmc_=
data *data);
> >         void (*release_dma)(struct loongson2_mmc_host *host, struct dev=
ice *dev);
> > @@ -282,6 +335,9 @@ static void loongson2_mmc_send_request(struct mmc_h=
ost *mmc)
> >                 return;
> >         }
> >
> > +       if (host->pdata->fix_data_timeout)
> > +               host->pdata->fix_data_timeout(host, cmd);
> > +
> >         loongson2_mmc_send_command(host, cmd);
> >
> >         /* Fix deselect card */
> > @@ -426,6 +482,36 @@ static irqreturn_t loongson2_mmc_irq(int irq, void=
 *devid)
> >         return IRQ_WAKE_THREAD;
> >  }
> >
> > +static void loongson2_mmc_dll_mode_init(struct loongson2_mmc_host *hos=
t)
> > +{
> > +       u32 val, pad_delay, delay, ret;
> > +
> > +       regmap_update_bits(host->regmap, LOONGSON2_MMC_REG_SEL,
> > +                          LOONGSON2_MMC_SEL_DATA, LOONGSON2_MMC_SEL_DA=
TA);
> > +
> > +       val =3D FIELD_PREP(LOONGSON2_MMC_DLLCTL_TIME, 0xc8)
> > +           | FIELD_PREP(LOONGSON2_MMC_DLLCTL_INCRE, 0x1)
> > +           | FIELD_PREP(LOONGSON2_MMC_DLLCTL_START, 0x1)
> > +           | FIELD_PREP(LOONGSON2_MMC_DLLCTL_CLK_MODE, 0x1)
> > +           | FIELD_PREP(LOONGSON2_MMC_DLLCTL_START_BIT, 0x1)
> > +           | FIELD_PREP(LOONGSON2_MMC_DLLCTL_TIME_BPASS, 0xf);
> > +
> > +       regmap_write(host->regmap, LOONGSON2_MMC_REG_DLLCTL, val);
> > +
> > +       ret =3D regmap_read_poll_timeout(host->regmap, LOONGSON2_MMC_RE=
G_DLLVAL, val,
> > +                                      (val & LOONGSON2_MMC_DLLVAL_DONE=
), 0, 4000);
> > +       if (ret < 0)
> > +               return;
> > +
> > +       regmap_read(host->regmap, LOONGSON2_MMC_REG_DLLVAL, &val);
> > +       pad_delay =3D FIELD_GET(GENMASK(7, 1), val);
> > +
> > +       delay =3D FIELD_PREP(LOONGSON2_MMC_DELAY_PAD, pad_delay)
> > +             | FIELD_PREP(LOONGSON2_MMC_DELAY_RD, pad_delay + 1);
> > +
> > +       regmap_write(host->regmap, LOONGSON2_MMC_REG_DELAY, delay);
> > +}
> > +
> >  static void loongson2_mmc_set_clk(struct loongson2_mmc_host *host, str=
uct mmc_ios *ios)
> >  {
> >         u32 pre;
> > @@ -438,6 +524,10 @@ static void loongson2_mmc_set_clk(struct loongson2=
_mmc_host *host, struct mmc_io
> >
> >         regmap_update_bits(host->regmap, LOONGSON2_MMC_REG_CTL,
> >                            LOONGSON2_MMC_CTL_ENCLK, LOONGSON2_MMC_CTL_E=
NCLK);
> > +
> > +       /* EMMC DLL mode setting */
> > +       if (ios->timing =3D=3D MMC_TIMING_UHS_DDR50 || ios->timing =3D=
=3D MMC_TIMING_MMC_DDR52)
> > +               loongson2_mmc_dll_mode_init(host);
> >  }
> >
> >  static void loongson2_mmc_set_ios(struct mmc_host *mmc, struct mmc_ios=
 *ios)
> > @@ -655,6 +745,127 @@ static struct loongson2_mmc_pdata ls2k1000_mmc_pd=
ata =3D {
> >         .release_dma            =3D loongson2_mmc_release_external_dma,
> >  };
> >
> > +static const struct regmap_config ls2k2000_mmc_regmap_config =3D {
> > +       .reg_bits =3D 32,
> > +       .val_bits =3D 32,
> > +       .reg_stride =3D 4,
> > +       .max_register =3D LOONGSON2_MMC_REG_RDMA_HI,
> > +};
> > +
> > +static void ls2k2000_mmc_reorder_cmd_data(struct loongson2_mmc_host *h=
ost,
> > +                                         struct mmc_command *cmd)
> > +{
> > +       struct scatterlist *sg;
> > +       u32 *data;
> > +       int i, j;
> > +
> > +       if (cmd->opcode !=3D SD_SWITCH || mmc_cmd_type(cmd) !=3D MMC_CM=
D_ADTC)
> > +               return;
> > +
> > +       for_each_sg(cmd->data->sg, sg, cmd->data->sg_len, i) {
> > +               data =3D sg_virt(&sg[i]);
> > +               for (j =3D 0; j < (sg_dma_len(&sg[i]) / 4); j++)
> > +                       data[j] =3D bitrev8x4(data[j]);
> > +       }
> > +}
> > +
> > +/*
> > + * This is a controller hardware defect. Single/multiple block write c=
ommands
> > + * must be sent after the TX FULL flag is set, otherwise a data timeou=
t interrupt
> > + * will occur.
> > + */
> > +static void ls2k2000_mmc_fix_data_timeout(struct loongson2_mmc_host *h=
ost,
> > +                                         struct mmc_command *cmd)
> > +{
> > +       int val;
> > +
> > +       if (cmd->opcode !=3D MMC_WRITE_BLOCK && cmd->opcode !=3D MMC_WR=
ITE_MULTIPLE_BLOCK)
> > +               return;
> > +
> > +       regmap_read_poll_timeout(host->regmap, LOONGSON2_MMC_REG_FSTS, =
val,
> > +                                (val & LOONGSON2_MMC_FSTS_TXFULL), 0, =
500);
> > +}
> > +
> > +static int loongson2_mmc_prepare_internal_dma(struct loongson2_mmc_hos=
t *host,
> > +                                             struct mmc_data *data)
> > +{
> > +       struct loongson2_dma_desc *pdes =3D (struct loongson2_dma_desc =
*)host->sg_cpu;
> > +       struct mmc_host *mmc =3D mmc_from_priv(host);
> > +       dma_addr_t next_desc =3D host->sg_dma;
> > +       struct scatterlist *sg;
> > +       int reg_lo, reg_hi;
> > +       u64 dma_order;
> > +       int i, ret;
> > +
> > +       ret =3D dma_map_sg(mmc_dev(mmc), data->sg, data->sg_len,
> > +                        mmc_get_dma_dir(data));
> > +       if (!ret)
> > +               return -ENOMEM;
> > +
> > +       for_each_sg(data->sg, sg, data->sg_len, i) {
> > +               pdes[i].len =3D sg_dma_len(&sg[i]) / 4;
> > +               pdes[i].step_len =3D 0;
> > +               pdes[i].step_times =3D 1;
> > +               pdes[i].mem_addr =3D lower_32_bits(sg_dma_address(&sg[i=
]));
> > +               pdes[i].high_mem_addr =3D upper_32_bits(sg_dma_address(=
&sg[i]));
> > +               pdes[i].apb_addr =3D host->res->start + LOONGSON2_MMC_R=
EG_DATA;
> > +               pdes[i].cmd =3D LOONGSON2_MMC_DMA_INT;
> > +
> > +               if (data->flags & MMC_DATA_READ) {
> > +                       reg_lo =3D LOONGSON2_MMC_REG_RDMA_LO;
> > +                       reg_hi =3D LOONGSON2_MMC_REG_RDMA_HI;
> > +               } else {
> > +                       pdes[i].cmd |=3D LOONGSON2_MMC_DMA_DATA_DIR;
> > +                       reg_lo =3D LOONGSON2_MMC_REG_WDMA_LO;
> > +                       reg_hi =3D LOONGSON2_MMC_REG_WDMA_HI;
> > +               }
> > +
> > +               next_desc +=3D sizeof(struct loongson2_dma_desc);
> > +               pdes[i].ndesc_addr =3D lower_32_bits(next_desc) |
> > +                                    LOONGSON2_MMC_DMA_DESC_EN;
> > +               pdes[i].high_ndesc_addr =3D upper_32_bits(next_desc);
> > +       }
> > +
> > +       /* Setting the last descriptor enable bit */
> > +       pdes[i - 1].ndesc_addr &=3D ~LOONGSON2_MMC_DMA_DESC_EN;
> > +
> > +       dma_order =3D (host->sg_dma & ~LOONGSON2_MMC_DMA_CONFIG_MASK) |
> > +                   LOONGSON2_MMC_DMA_64BIT_EN |
> > +                   LOONGSON2_MMC_DMA_START;
> > +
> > +       regmap_write(host->regmap, reg_hi, upper_32_bits(dma_order));
> > +       regmap_write(host->regmap, reg_lo, lower_32_bits(dma_order));
> > +
> > +       return 0;
> > +}
> > +
> > +static int loongson2_mmc_set_internal_dma(struct loongson2_mmc_host *h=
ost,
> > +                                         struct platform_device *pdev)
> > +{
> > +       host->sg_cpu =3D dma_alloc_coherent(&pdev->dev, PAGE_SIZE,
> > +                                         &host->sg_dma, GFP_KERNEL);
> > +       if (!host->sg_cpu)
> > +               return -ENOMEM;
> > +
> > +       memset(host->sg_cpu, 0, PAGE_SIZE);
> > +       return 0;
> > +}
> > +
> > +static void loongson2_mmc_release_internal_dma(struct loongson2_mmc_ho=
st *host,
> > +                                              struct device *dev)
> > +{
> > +       dma_free_coherent(dev, PAGE_SIZE, host->sg_cpu, host->sg_dma);
> > +}
> > +
> > +static struct loongson2_mmc_pdata ls2k2000_mmc_pdata =3D {
> > +       .regmap_config          =3D &ls2k2000_mmc_regmap_config,
> > +       .reorder_cmd_data       =3D ls2k2000_mmc_reorder_cmd_data,
> > +       .fix_data_timeout       =3D ls2k2000_mmc_fix_data_timeout,
> > +       .setting_dma            =3D loongson2_mmc_set_internal_dma,
> > +       .prepare_dma            =3D loongson2_mmc_prepare_internal_dma,
> > +       .release_dma            =3D loongson2_mmc_release_internal_dma,
> > +};
> From the whole series we get:
>
> +static struct loongson2_mmc_pdata ls2k0500_mmc_pdata =3D {
> + .regmap_config =3D &ls2k1000_mmc_regmap_config,
> + .reorder_cmd_data =3D loongson2_mmc_reorder_cmd_data,
> + .setting_dma =3D ls2k0500_mmc_set_external_dma,
> + .prepare_dma =3D loongson2_mmc_prepare_external_dma,
> + .release_dma =3D loongson2_mmc_release_external_dma,
> +};
>
> +static struct loongson2_mmc_pdata ls2k1000_mmc_pdata =3D {
> + .regmap_config =3D &ls2k1000_mmc_regmap_config,
> + .reorder_cmd_data =3D loongson2_mmc_reorder_cmd_data,
> + .setting_dma =3D ls2k1000_mmc_set_external_dma,
> + .prepare_dma =3D loongson2_mmc_prepare_external_dma,
> + .release_dma =3D loongson2_mmc_release_external_dma,
> +};
>
> +static struct loongson2_mmc_pdata ls2k2000_mmc_pdata =3D {
> + .regmap_config =3D &ls2k2000_mmc_regmap_config,
> + .reorder_cmd_data =3D ls2k2000_mmc_reorder_cmd_data,
> + .fix_data_timeout =3D ls2k2000_mmc_fix_data_timeout,
> + .setting_dma =3D loongson2_mmc_set_internal_dma,
> + .prepare_dma =3D loongson2_mmc_prepare_internal_dma,
> + .release_dma =3D loongson2_mmc_release_internal_dma,
> +};
>
> The prefix of function names are confusing, can we rename them better?

OK, for regmap_config, reorder_cmd_data and reorder_cmd_data,  I will
use ls2k as a prefix.

ls2k1000_mmc_regmap_config -> ls2k0500_mmc_regmap_config
loongson2_mmc_reorder_cmd_data -> ls2k0500_mmc_reorder_cmd_data.
loongson2_mmc_set_internal_dma -> ls2k2000_mmc_set_internal_dma
>
>
> Huacai
>
>
>
>
> > +
> >  static int loongson2_mmc_resource_request(struct platform_device *pdev=
,
> >                                           struct loongson2_mmc_host *ho=
st)
> >  {
> > @@ -777,6 +988,7 @@ static void loongson2_mmc_remove(struct platform_de=
vice *pdev)
> >  static const struct of_device_id loongson2_mmc_of_ids[] =3D {
> >         { .compatible =3D "loongson,ls2k0500-mmc", .data =3D &ls2k0500_=
mmc_pdata },
> >         { .compatible =3D "loongson,ls2k1000-mmc", .data =3D &ls2k1000_=
mmc_pdata },
> > +       { .compatible =3D "loongson,ls2k2000-mmc", .data =3D &ls2k2000_=
mmc_pdata },
> >         { },
> >  };
> >  MODULE_DEVICE_TABLE(of, loongson2_mmc_of_ids);
> > --
> > 2.47.1
> >
> >

--=20
Thanks.
Binbin
