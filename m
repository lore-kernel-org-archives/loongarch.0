Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939E63B8949
	for <loongarch@lists.linux.dev>; Wed, 11 Mar 2026 07:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773215790; cv=none; b=fOj7Dx5CKWJNTrqUxvm5RTwZdijpMpTwzNS/ZLdrz3pqT03XQgPUmS2/FvgLj7mSuxG2OUQEKLChCX9etGaVFRfQAx8e0fuTIFp+vE4DjhLFk6Tvgs24YQ7Ze+SCmSdkjZ0HwUt2iDx0qVczPx8upAlVxtoTH4wBaEAXE8PXkfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773215790; c=relaxed/simple;
	bh=YfocJ02ObzV0jyjvg8xZAnLqdbAoXNiJYQSizTwed/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kZSzys6bafxiId9Yv2/+oYTqeXioa5OlotR9XN6y9YvYO/yUmeOqCLsioRqrTTJeWjAtJOpO0evrnEYuZ9Fkk2ikBaiLkYbLZYipVAE3l57jZhlRLQIT3aoiLffUsS3byEhwq0h6DXCP0U+HHRlStgJcOe4oPhhWqbZyUL0CUmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o/tEEC6W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o/tEEC6W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15C3BC2BCB3
	for <loongarch@lists.linux.dev>; Wed, 11 Mar 2026 07:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773215790;
	bh=YfocJ02ObzV0jyjvg8xZAnLqdbAoXNiJYQSizTwed/o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=o/tEEC6WiMB/xUWFeBvp83bBsUgAAATf++XHKuT9Hn5Ouf89fUawmCQ0zE/VomE8r
	 pdjE4i4UYC/4nTRCsjmip+cbxbrLpPXDrd2TdSxTtw6XfEykWQHVrTZQFu1XdOKmoo
	 VnLes5gzD/laK4DYP3ZARr9fYqHx9/qqnoIq3iTTpi07NSwfUp7xdvVLb3rLzXsIvd
	 7MO8AG8pjsiwf0jsAhc64kHXkWlxornM9bE4rFg1EF7Dtkt6E5sPbDrfULlGEExR+I
	 fkXZvtYGW3zqqkDmUw3gFsVV7xvhDIMFIPhW4GOKR+vqiis5UgTA/Lk3UdUbWvzWkv
	 xrSqWlWgrDiQg==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-662bf05f7a4so2787712a12.3
        for <loongarch@lists.linux.dev>; Wed, 11 Mar 2026 00:56:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW+u2a3aFWiNOIvzcXwLR+eiFdwnQpPYFLyQleokzDAVnXOEgvMHchENWppPYERSEWmMLOS6vZlKc0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxA9PGWSdECi4EuPhBU3DOC3ByYo976XIDvH/k1a1Lj9M26j4VK
	EviwNd62MLauA6GDw0/Uy299wwq0lgvA5EO32YgbaT/Kzq0/LCytWuzHhDTkX54O69y8mN6d7sm
	sVRxkR9v9mv/t+oD1WQTKZ0QncJYNVjc=
X-Received: by 2002:a17:906:9fc7:b0:b8a:f61a:edf2 with SMTP id
 a640c23a62f3a-b972e5fbe66mr72744766b.50.1773215788298; Wed, 11 Mar 2026
 00:56:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1773107475.git.zhoubinbin@loongson.cn> <ee177cd356803dd24d630c7502d850f52e3f63d8.1773107475.git.zhoubinbin@loongson.cn>
In-Reply-To: <ee177cd356803dd24d630c7502d850f52e3f63d8.1773107475.git.zhoubinbin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 11 Mar 2026 15:56:18 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6ssXnyYuT06y0wgBXwPbtOUx2J7G75mr8wW5cpOrpw4A@mail.gmail.com>
X-Gm-Features: AaiRm50xk5GxywYYnPMhcVRp0rk7HOM-pD39zUKUjdIyCJTFUMd0ZN_Kl210WSw
Message-ID: <CAAhV-H6ssXnyYuT06y0wgBXwPbtOUx2J7G75mr8wW5cpOrpw4A@mail.gmail.com>
Subject: Re: [PATCH 3/6] ASoC: loongson: Add `internal` to the names of
 internal DMA variables
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Xuerui Wang <kernel@xen0n.name>, 
	loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Binbin,

On Wed, Mar 11, 2026 at 2:37=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.cn=
> wrote:
>
> The DMA controller used in Loongson I2S is divided into internal
> exclusive DMA and external shared DMA (APBDMA). Add the `internal`
> dentifier to internal DMA variable names to better distinguish them from
> external shared DMA.
>
> No functional change intended.
>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  sound/soc/loongson/loongson_dma.c     | 84 +++++++++++++--------------
>  sound/soc/loongson/loongson_dma.h     |  4 +-
>  sound/soc/loongson/loongson_i2s.h     |  6 +-
>  sound/soc/loongson/loongson_i2s_pci.c |  5 +-
>  4 files changed, 49 insertions(+), 50 deletions(-)
>
> diff --git a/sound/soc/loongson/loongson_dma.c b/sound/soc/loongson/loong=
son_dma.c
> index f26b2951bc9c..07a084cebdc0 100644
> --- a/sound/soc/loongson/loongson_dma.c
> +++ b/sound/soc/loongson/loongson_dma.c
> @@ -14,6 +14,7 @@
>  #include <sound/soc.h>
>  #include <sound/pcm.h>
>  #include <sound/pcm_params.h>
> +
>  #include "loongson_i2s.h"
>
>  /* DMA dma_order Register */
> @@ -29,7 +30,7 @@
>  /*
>   * DMA registers descriptor.
>   */
> -struct loongson_dma_desc {
> +struct loongson_internal_dma_desc {
Can we use idma (internal dma) and edma (external) for short?

Huacai

>         u32 order;              /* Next descriptor address register */
>         u32 saddr;              /* Source address register */
>         u32 daddr;              /* Device address register */
> @@ -44,17 +45,17 @@ struct loongson_dma_desc {
>  } __packed;
>
>  struct loongson_runtime_data {
> -       struct loongson_dma_data *dma_data;
> +       struct loongson_internal_dma_data *dma_data;
>
> -       struct loongson_dma_desc *dma_desc_arr;
> +       struct loongson_internal_dma_desc *dma_desc_arr;
>         dma_addr_t dma_desc_arr_phy;
>         int dma_desc_arr_size;
>
> -       struct loongson_dma_desc *dma_pos_desc;
> +       struct loongson_internal_dma_desc *dma_pos_desc;
>         dma_addr_t dma_pos_desc_phy;
>  };
>
> -static const struct snd_pcm_hardware ls_pcm_hardware =3D {
> +static const struct snd_pcm_hardware loongson_internal_dma_hardware =3D =
{
>         .info =3D SNDRV_PCM_INFO_MMAP |
>                 SNDRV_PCM_INFO_INTERLEAVED |
>                 SNDRV_PCM_INFO_MMAP_VALID |
> @@ -67,12 +68,11 @@ static const struct snd_pcm_hardware ls_pcm_hardware =
=3D {
>         .period_bytes_min =3D 128,
>         .period_bytes_max =3D 128 * 1024,
>         .periods_min =3D 1,
> -       .periods_max =3D PAGE_SIZE / sizeof(struct loongson_dma_desc),
> +       .periods_max =3D PAGE_SIZE / sizeof(struct loongson_internal_dma_=
desc),
>         .buffer_bytes_max =3D 1024 * 1024,
>  };
>
> -static struct
> -loongson_dma_desc *dma_desc_save(struct loongson_runtime_data *prtd)
> +static struct loongson_internal_dma_desc *dma_desc_save(struct loongson_=
runtime_data *prtd)
>  {
>         void __iomem *order_reg =3D prtd->dma_data->order_addr;
>         u64 val;
> @@ -88,8 +88,8 @@ loongson_dma_desc *dma_desc_save(struct loongson_runtim=
e_data *prtd)
>         return prtd->dma_pos_desc;
>  }
>
> -static int loongson_pcm_trigger(struct snd_soc_component *component,
> -                               struct snd_pcm_substream *substream, int =
cmd)
> +static int loongson_internal_dma_pcm_trigger(struct snd_soc_component *c=
omponent,
> +                                            struct snd_pcm_substream *su=
bstream, int cmd)
>  {
>         struct loongson_runtime_data *prtd =3D substream->runtime->privat=
e_data;
>         struct device *dev =3D substream->pcm->card->dev;
> @@ -131,9 +131,9 @@ static int loongson_pcm_trigger(struct snd_soc_compon=
ent *component,
>         return 0;
>  }
>
> -static int loongson_pcm_hw_params(struct snd_soc_component *component,
> -                                 struct snd_pcm_substream *substream,
> -                                 struct snd_pcm_hw_params *params)
> +static int loongson_internal_dma_pcm_hw_params(struct snd_soc_component =
*component,
> +                                              struct snd_pcm_substream *=
substream,
> +                                              struct snd_pcm_hw_params *=
params)
>  {
>         struct snd_pcm_runtime *runtime =3D substream->runtime;
>         struct device *dev =3D substream->pcm->card->dev;
> @@ -141,7 +141,7 @@ static int loongson_pcm_hw_params(struct snd_soc_comp=
onent *component,
>         size_t buf_len =3D params_buffer_bytes(params);
>         size_t period_len =3D params_period_bytes(params);
>         dma_addr_t order_addr, mem_addr;
> -       struct loongson_dma_desc *desc;
> +       struct loongson_internal_dma_desc *desc;
>         u32 num_periods;
>         int i;
>
> @@ -195,12 +195,12 @@ static int loongson_pcm_hw_params(struct snd_soc_co=
mponent *component,
>  }
>
>  static snd_pcm_uframes_t
> -loongson_pcm_pointer(struct snd_soc_component *component,
> -                    struct snd_pcm_substream *substream)
> +loongson_internal_dma_pcm_pointer(struct snd_soc_component *component,
> +                                 struct snd_pcm_substream *substream)
>  {
>         struct snd_pcm_runtime *runtime =3D substream->runtime;
>         struct loongson_runtime_data *prtd =3D runtime->private_data;
> -       struct loongson_dma_desc *desc;
> +       struct loongson_internal_dma_desc *desc;
>         snd_pcm_uframes_t x;
>         u64 addr;
>
> @@ -213,7 +213,7 @@ loongson_pcm_pointer(struct snd_soc_component *compon=
ent,
>         return x;
>  }
>
> -static irqreturn_t loongson_pcm_dma_irq(int irq, void *devid)
> +static irqreturn_t loongson_internal_dma_pcm_dma_irq(int irq, void *devi=
d)
>  {
>         struct snd_pcm_substream *substream =3D devid;
>
> @@ -221,14 +221,14 @@ static irqreturn_t loongson_pcm_dma_irq(int irq, vo=
id *devid)
>         return IRQ_HANDLED;
>  }
>
> -static int loongson_pcm_open(struct snd_soc_component *component,
> -                            struct snd_pcm_substream *substream)
> +static int loongson_internal_dma_pcm_open(struct snd_soc_component *comp=
onent,
> +                                         struct snd_pcm_substream *subst=
ream)
>  {
>         struct snd_pcm_runtime *runtime =3D substream->runtime;
>         struct snd_soc_pcm_runtime *rtd =3D snd_soc_substream_to_rtd(subs=
tream);
>         struct snd_card *card =3D substream->pcm->card;
>         struct loongson_runtime_data *prtd;
> -       struct loongson_dma_data *dma_data;
> +       struct loongson_internal_dma_data *dma_data;
>
>         /*
>          * For mysterious reasons (and despite what the manual says)
> @@ -241,7 +241,7 @@ static int loongson_pcm_open(struct snd_soc_component=
 *component,
>                                    SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 128);
>         snd_pcm_hw_constraint_integer(substream->runtime,
>                                       SNDRV_PCM_HW_PARAM_PERIODS);
> -       snd_soc_set_runtime_hwparams(substream, &ls_pcm_hardware);
> +       snd_soc_set_runtime_hwparams(substream, &loongson_internal_dma_ha=
rdware);
>
>         prtd =3D kzalloc_obj(*prtd);
>         if (!prtd)
> @@ -277,8 +277,8 @@ static int loongson_pcm_open(struct snd_soc_component=
 *component,
>         return -ENOMEM;
>  }
>
> -static int loongson_pcm_close(struct snd_soc_component *component,
> -                             struct snd_pcm_substream *substream)
> +static int loongson_internal_dma_pcm_close(struct snd_soc_component *com=
ponent,
> +                                          struct snd_pcm_substream *subs=
tream)
>  {
>         struct snd_card *card =3D substream->pcm->card;
>         struct loongson_runtime_data *prtd =3D substream->runtime->privat=
e_data;
> @@ -293,21 +293,21 @@ static int loongson_pcm_close(struct snd_soc_compon=
ent *component,
>         return 0;
>  }
>
> -static int loongson_pcm_mmap(struct snd_soc_component *component,
> -                            struct snd_pcm_substream *substream,
> -                            struct vm_area_struct *vma)
> +static int loongson_internal_dma_pcm_mmap(struct snd_soc_component *comp=
onent,
> +                                         struct snd_pcm_substream *subst=
ream,
> +                                         struct vm_area_struct *vma)
>  {
>         return remap_pfn_range(vma, vma->vm_start,
> -                       substream->dma_buffer.addr >> PAGE_SHIFT,
> -                       vma->vm_end - vma->vm_start, vma->vm_page_prot);
> +                              substream->dma_buffer.addr >> PAGE_SHIFT,
> +                              vma->vm_end - vma->vm_start, vma->vm_page_=
prot);
>  }
>
> -static int loongson_pcm_new(struct snd_soc_component *component,
> -                           struct snd_soc_pcm_runtime *rtd)
> +static int loongson_internal_dma_pcm_new(struct snd_soc_component *compo=
nent,
> +                                        struct snd_soc_pcm_runtime *rtd)
>  {
>         struct snd_card *card =3D rtd->card->snd_card;
>         struct snd_pcm_substream *substream;
> -       struct loongson_dma_data *dma_data;
> +       struct loongson_internal_dma_data *dma_data;
>         unsigned int i;
>         int ret;
>
> @@ -319,7 +319,7 @@ static int loongson_pcm_new(struct snd_soc_component =
*component,
>                 dma_data =3D snd_soc_dai_get_dma_data(snd_soc_rtd_to_cpu(=
rtd, 0),
>                                                     substream);
>                 ret =3D devm_request_irq(card->dev, dma_data->irq,
> -                                      loongson_pcm_dma_irq,
> +                                      loongson_internal_dma_pcm_dma_irq,
>                                        IRQF_TRIGGER_HIGH, LS_I2S_DRVNAME,
>                                        substream);
>                 if (ret < 0) {
> @@ -330,16 +330,16 @@ static int loongson_pcm_new(struct snd_soc_componen=
t *component,
>
>         return snd_pcm_set_fixed_buffer_all(rtd->pcm, SNDRV_DMA_TYPE_DEV,
>                                             card->dev,
> -                                           ls_pcm_hardware.buffer_bytes_=
max);
> +                                           loongson_internal_dma_hardwar=
e.buffer_bytes_max);
>  }
>
> -const struct snd_soc_component_driver loongson_i2s_component =3D {
> +const struct snd_soc_component_driver loongson_i2s_internal_dma_componen=
t =3D {
>         .name           =3D LS_I2S_DRVNAME,
> -       .open           =3D loongson_pcm_open,
> -       .close          =3D loongson_pcm_close,
> -       .hw_params      =3D loongson_pcm_hw_params,
> -       .trigger        =3D loongson_pcm_trigger,
> -       .pointer        =3D loongson_pcm_pointer,
> -       .mmap           =3D loongson_pcm_mmap,
> -       .pcm_construct  =3D loongson_pcm_new,
> +       .open           =3D loongson_internal_dma_pcm_open,
> +       .close          =3D loongson_internal_dma_pcm_close,
> +       .hw_params      =3D loongson_internal_dma_pcm_hw_params,
> +       .trigger        =3D loongson_internal_dma_pcm_trigger,
> +       .pointer        =3D loongson_internal_dma_pcm_pointer,
> +       .mmap           =3D loongson_internal_dma_pcm_mmap,
> +       .pcm_construct  =3D loongson_internal_dma_pcm_new,
>  };
> diff --git a/sound/soc/loongson/loongson_dma.h b/sound/soc/loongson/loong=
son_dma.h
> index 073ee8c0c046..8795fd7874bb 100644
> --- a/sound/soc/loongson/loongson_dma.h
> +++ b/sound/soc/loongson/loongson_dma.h
> @@ -9,8 +9,6 @@
>  #ifndef _LOONGSON_DMA_H
>  #define _LOONGSON_DMA_H
>
> -#include <sound/soc.h>
> -
> -extern const struct snd_soc_component_driver loongson_i2s_component;
> +extern const struct snd_soc_component_driver loongson_i2s_internal_dma_c=
omponent;
>
>  #endif
> diff --git a/sound/soc/loongson/loongson_i2s.h b/sound/soc/loongson/loong=
son_i2s.h
> index e73ffa954ec9..5f773bbd24c5 100644
> --- a/sound/soc/loongson/loongson_i2s.h
> +++ b/sound/soc/loongson/loongson_i2s.h
> @@ -42,7 +42,7 @@
>
>  #define LS_I2S_DRVNAME         "loongson-i2s"
>
> -struct loongson_dma_data {
> +struct loongson_internal_dma_data {
>         dma_addr_t dev_addr;            /* device physical address for DM=
A */
>         void __iomem *order_addr;       /* DMA order register */
>         int irq;                        /* DMA irq */
> @@ -52,11 +52,11 @@ struct loongson_i2s {
>         struct device *dev;
>         union {
>                 struct snd_dmaengine_dai_dma_data playback_dma_data;
> -               struct loongson_dma_data tx_dma_data;
> +               struct loongson_internal_dma_data tx_dma_data;
>         };
>         union {
>                 struct snd_dmaengine_dai_dma_data capture_dma_data;
> -               struct loongson_dma_data rx_dma_data;
> +               struct loongson_internal_dma_data rx_dma_data;
>         };
>         struct regmap *regmap;
>         void __iomem *reg_base;
> diff --git a/sound/soc/loongson/loongson_i2s_pci.c b/sound/soc/loongson/l=
oongson_i2s_pci.c
> index dea1e4ebee29..9120432bbe64 100644
> --- a/sound/soc/loongson/loongson_i2s_pci.c
> +++ b/sound/soc/loongson/loongson_i2s_pci.c
> @@ -13,6 +13,7 @@
>  #include <linux/acpi.h>
>  #include <linux/pci.h>
>  #include <sound/soc.h>
> +
>  #include "loongson_i2s.h"
>  #include "loongson_dma.h"
>
> @@ -22,7 +23,7 @@ static int loongson_i2s_pci_probe(struct pci_dev *pdev,
>                                   const struct pci_device_id *pid)
>  {
>         const struct fwnode_handle *fwnode =3D pdev->dev.fwnode;
> -       struct loongson_dma_data *tx_data, *rx_data;
> +       struct loongson_internal_dma_data *tx_data, *rx_data;
>         struct device *dev =3D &pdev->dev;
>         struct loongson_i2s *i2s;
>         int ret;
> @@ -79,7 +80,7 @@ static int loongson_i2s_pci_probe(struct pci_dev *pdev,
>                 udelay(200);
>         }
>
> -       ret =3D devm_snd_soc_register_component(dev, &loongson_i2s_compon=
ent,
> +       ret =3D devm_snd_soc_register_component(dev, &loongson_i2s_intern=
al_dma_component,
>                                               &loongson_i2s_dai, 1);
>         if (ret)
>                 return dev_err_probe(dev, ret, "register DAI failed\n");
> --
> 2.52.0
>
>
