Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B13364036
	for <loongarch@lists.linux.dev>; Wed, 11 Mar 2026 08:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773217484; cv=pass; b=lwZLz3XfFa9Du4lc3VrjqNyCqq3zPjMt4Co/pOxjApXfNEM7ZZ6xlIKX5yyWF4RWMSjo3jHf6sFkgS60FjzCqQjzFno0mRoT35vk4NoBJQpi34A4KRei3dcdAL6bOo6OgSywvohY/oy55lRZXCiw0vCPuI70GY/PhjOGC/uZCXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773217484; c=relaxed/simple;
	bh=scPK4yjYP4NWGll9kC6f2iAZmla21828RYNudpqos6E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D76z5suQvFObGH2M0rWciH4GUQPZPYG4NOAdB7auWOwWX7sOBU80aAOKbL0blSCF3VXuYSXmbWWUNBTPp00hPqfZpZbHydyr3WetVjVFV9bXp+yORuKV9bE87QxqsErjjUE8EWGMdi+PkgTXAVX1XqxHm9juIk3vMmlZS/IGYrc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZgQn7FLO; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZgQn7FLO"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-65c4152313fso19361711a12.1
        for <loongarch@lists.linux.dev>; Wed, 11 Mar 2026 01:24:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773217481; cv=none;
        d=google.com; s=arc-20240605;
        b=MfNYt11pme0XCkgkZp+hNNNl4aBngz9AkFVRIQZLuezQzjM0MH70uNWw1nt5Hwb4et
         Ww+RFAjsZ6c+M8p9q0GysGrLLyR6YAKzOAzbitB6Qxymy+relqLc/mA7SniXDATXUXZb
         4ZKgbs+/e3qc3Rs9pyPwhBChzwLQWR4z3w78qGaI9R3bmBXy/VXo35JyISMXbFjUf9Bp
         ngCrf9xKA0pawFJJQ5MHDWJhW8rmFVOdgJkwFpLL4WSJPZ8ybXflkOw4yiE1W98ui3+i
         3Ufz/8y7auTYoW6hOMljYC3iTukYog90OnO66EqOeWiMM+1IWzrUDFx9Y3EaitWK/45Z
         JU2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q4fUIKT70fHKjIeW/Y2M1Qjyk+SDVrLGJimnzobQywU=;
        fh=tG6X5vbrY64aAN08AJmp/4DwYJ9Oh9260e5uFWj+BGg=;
        b=cMFVJ1g8E1y0paGJsL86v3g6zEfSb8uKZtIA5C72XksGoOX3LJi/Xml2G+HbqtQJLg
         i6VJ9Pmjmb8jRxwtNkBxEuBgW1vDLP6JxjY4YB2pUlGjGEGs18TyUf9XHhA39yvsMeke
         6MqWjoaGAG+NdGrdyTWg7q2NvD3DF8LicNZ7FwZBOa2zR0I5UNppsIw0uC65gJRv5hLZ
         NGSw6DnkvrRwZ0SOHR1os21hq8lcqX1dsjdISwfqPq+GcZv3TV5KOB9hKSz161FUotNH
         qsewr1bZvrtsyNWK7EedmD1tImu8L/e0KnNuAaCX2oJube0eMtecPRPb1hlJJWJubtph
         3mkg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773217481; x=1773822281; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q4fUIKT70fHKjIeW/Y2M1Qjyk+SDVrLGJimnzobQywU=;
        b=ZgQn7FLOskvXJYY2lMP0wedmRN3vVxbVXbUbbvTvCnyI7whOJrDuY2/UBgtUfbT2zP
         WC9ST7ppLIWgq08lp0+OaDRsx2QEuRn/C38cuTJPaw75U19UBGbwuxxGw4rKzTItkKC4
         b3RuKYYG/fKSLQv/V4WsQ1HddfCbBEdiRsT/HxVNurg4ckjsjXAw4K2nPSFG80lXs8f9
         vIQ0KTjqqq/6MvvEtGrwz10sumXgy7Qdv23PN2w7FqxCqDYqPyWesLnG4ETQ0RoVOh/r
         iDv6RLmy+cQDIuClurvFNNN5sVuTUf8TihCbm/BPr8ktsL6JqkTx3E25nLb57X77W+56
         48EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773217481; x=1773822281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q4fUIKT70fHKjIeW/Y2M1Qjyk+SDVrLGJimnzobQywU=;
        b=EBL4+N4VqQFnahzj9pdg3KzMBxEU6BctoNak6/Y/35jFytaUzNBQHVdo94dzAGJ8+a
         3xw+PiKd8ErTt9qOuvx750joO+b3CumNGbAjykqZbvBonWdjnvlY1A/CQ0STf6Ixs55N
         PyHdpx8BSh/nm59fv9wdhhTv4ip9QzV3fSiKd7jQFaSeM/qVaeYq956Wiidj4Eq9fsHX
         Ot1j7F7kUb11Lp1SMLxx1E7J4qvf95YTy+i5acSUxAk0YK5RjU1rJsZr7LTsFf9bzUAT
         R64e2r/78g0dyoXyqzvQVNvX3e/5Oqb/rnNtDvQ19GSEeWHQMAM8WqNF40eFnnCN+U3w
         Fd3w==
X-Forwarded-Encrypted: i=1; AJvYcCUdvfkuUA6kv60OYPLSabsiTKTFDq+4iph974kVf3RvC7DXJcq0yk1BCHVhY706MPPTVnqc5/fxNu0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwKrfdIFJfFHCuMLnBSRwgBa3/co2wDfIF4FBSH683Owi2FVA68
	rAVUfFoQuv13pNwY8F1snD44rTcJeuBO8BLdvRp2LL9iRWnDxyYiZxcTg9yP7EonbtjcaYQ4XJh
	7w+BBC+sC6J/6wFwSjdUBPpl6H/1ZuLw=
X-Gm-Gg: ATEYQzwLCDBd1NB4z8jdHHKcck9c1+KHVfCOOMXYInasvQbap1LN3t1/9ggrHhpPnrF
	iZzVhYBywuHI8K6MgP4VErvTS2R5FEvI4pSEXAcpfW1tJ4HUFb9zIWTUv8alaRdOBGzFHjxTYzy
	axqopcySledmdW5BOWQbC3Q8gUWoflyRxOL6VeFg9sS2upv1p603ZkWc/ObvBmPgk9WJwtaZxbP
	ZsCH9PNGj3pYcjg2qhTx8emlUN8vrVRPnNq4dBOubrWPqej69vAz9L5pi5K0EK8k956x/yA/8y7
	kX8lzPc=
X-Received: by 2002:a17:907:9811:b0:b96:e796:135f with SMTP id
 a640c23a62f3a-b972e5fbea0mr88285066b.47.1773217480467; Wed, 11 Mar 2026
 01:24:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1773107475.git.zhoubinbin@loongson.cn> <ee177cd356803dd24d630c7502d850f52e3f63d8.1773107475.git.zhoubinbin@loongson.cn>
 <CAAhV-H6ssXnyYuT06y0wgBXwPbtOUx2J7G75mr8wW5cpOrpw4A@mail.gmail.com>
In-Reply-To: <CAAhV-H6ssXnyYuT06y0wgBXwPbtOUx2J7G75mr8wW5cpOrpw4A@mail.gmail.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 11 Mar 2026 16:24:27 +0800
X-Gm-Features: AaiRm53u20tjJzQiI_nxXmdhOB4tbHo9XnHkfurHurJMbazgAtLqTBkfpelBYfc
Message-ID: <CAMpQs4JjB+MA+zbU5T0q7Z1mSZ5B9p-uvLNeNzEFadr8R=1sGQ@mail.gmail.com>
Subject: Re: [PATCH 3/6] ASoC: loongson: Add `internal` to the names of
 internal DMA variables
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Xuerui Wang <kernel@xen0n.name>, 
	loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 3:56=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> Hi, Binbin,
>
> On Wed, Mar 11, 2026 at 2:37=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.=
cn> wrote:
> >
> > The DMA controller used in Loongson I2S is divided into internal
> > exclusive DMA and external shared DMA (APBDMA). Add the `internal`
> > dentifier to internal DMA variable names to better distinguish them fro=
m
> > external shared DMA.
> >
> > No functional change intended.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  sound/soc/loongson/loongson_dma.c     | 84 +++++++++++++--------------
> >  sound/soc/loongson/loongson_dma.h     |  4 +-
> >  sound/soc/loongson/loongson_i2s.h     |  6 +-
> >  sound/soc/loongson/loongson_i2s_pci.c |  5 +-
> >  4 files changed, 49 insertions(+), 50 deletions(-)
> >
> > diff --git a/sound/soc/loongson/loongson_dma.c b/sound/soc/loongson/loo=
ngson_dma.c
> > index f26b2951bc9c..07a084cebdc0 100644
> > --- a/sound/soc/loongson/loongson_dma.c
> > +++ b/sound/soc/loongson/loongson_dma.c
> > @@ -14,6 +14,7 @@
> >  #include <sound/soc.h>
> >  #include <sound/pcm.h>
> >  #include <sound/pcm_params.h>
> > +
> >  #include "loongson_i2s.h"
> >
> >  /* DMA dma_order Register */
> > @@ -29,7 +30,7 @@
> >  /*
> >   * DMA registers descriptor.
> >   */
> > -struct loongson_dma_desc {
> > +struct loongson_internal_dma_desc {
> Can we use idma (internal dma) and edma (external) for short?

Emm...
Using `idma`/`edma` seems more concise. I'll also add some comments.
>
> Huacai
>
> >         u32 order;              /* Next descriptor address register */
> >         u32 saddr;              /* Source address register */
> >         u32 daddr;              /* Device address register */
> > @@ -44,17 +45,17 @@ struct loongson_dma_desc {
> >  } __packed;
> >
> >  struct loongson_runtime_data {
> > -       struct loongson_dma_data *dma_data;
> > +       struct loongson_internal_dma_data *dma_data;
> >
> > -       struct loongson_dma_desc *dma_desc_arr;
> > +       struct loongson_internal_dma_desc *dma_desc_arr;
> >         dma_addr_t dma_desc_arr_phy;
> >         int dma_desc_arr_size;
> >
> > -       struct loongson_dma_desc *dma_pos_desc;
> > +       struct loongson_internal_dma_desc *dma_pos_desc;
> >         dma_addr_t dma_pos_desc_phy;
> >  };
> >
> > -static const struct snd_pcm_hardware ls_pcm_hardware =3D {
> > +static const struct snd_pcm_hardware loongson_internal_dma_hardware =
=3D {
> >         .info =3D SNDRV_PCM_INFO_MMAP |
> >                 SNDRV_PCM_INFO_INTERLEAVED |
> >                 SNDRV_PCM_INFO_MMAP_VALID |
> > @@ -67,12 +68,11 @@ static const struct snd_pcm_hardware ls_pcm_hardwar=
e =3D {
> >         .period_bytes_min =3D 128,
> >         .period_bytes_max =3D 128 * 1024,
> >         .periods_min =3D 1,
> > -       .periods_max =3D PAGE_SIZE / sizeof(struct loongson_dma_desc),
> > +       .periods_max =3D PAGE_SIZE / sizeof(struct loongson_internal_dm=
a_desc),
> >         .buffer_bytes_max =3D 1024 * 1024,
> >  };
> >
> > -static struct
> > -loongson_dma_desc *dma_desc_save(struct loongson_runtime_data *prtd)
> > +static struct loongson_internal_dma_desc *dma_desc_save(struct loongso=
n_runtime_data *prtd)
> >  {
> >         void __iomem *order_reg =3D prtd->dma_data->order_addr;
> >         u64 val;
> > @@ -88,8 +88,8 @@ loongson_dma_desc *dma_desc_save(struct loongson_runt=
ime_data *prtd)
> >         return prtd->dma_pos_desc;
> >  }
> >
> > -static int loongson_pcm_trigger(struct snd_soc_component *component,
> > -                               struct snd_pcm_substream *substream, in=
t cmd)
> > +static int loongson_internal_dma_pcm_trigger(struct snd_soc_component =
*component,
> > +                                            struct snd_pcm_substream *=
substream, int cmd)
> >  {
> >         struct loongson_runtime_data *prtd =3D substream->runtime->priv=
ate_data;
> >         struct device *dev =3D substream->pcm->card->dev;
> > @@ -131,9 +131,9 @@ static int loongson_pcm_trigger(struct snd_soc_comp=
onent *component,
> >         return 0;
> >  }
> >
> > -static int loongson_pcm_hw_params(struct snd_soc_component *component,
> > -                                 struct snd_pcm_substream *substream,
> > -                                 struct snd_pcm_hw_params *params)
> > +static int loongson_internal_dma_pcm_hw_params(struct snd_soc_componen=
t *component,
> > +                                              struct snd_pcm_substream=
 *substream,
> > +                                              struct snd_pcm_hw_params=
 *params)
> >  {
> >         struct snd_pcm_runtime *runtime =3D substream->runtime;
> >         struct device *dev =3D substream->pcm->card->dev;
> > @@ -141,7 +141,7 @@ static int loongson_pcm_hw_params(struct snd_soc_co=
mponent *component,
> >         size_t buf_len =3D params_buffer_bytes(params);
> >         size_t period_len =3D params_period_bytes(params);
> >         dma_addr_t order_addr, mem_addr;
> > -       struct loongson_dma_desc *desc;
> > +       struct loongson_internal_dma_desc *desc;
> >         u32 num_periods;
> >         int i;
> >
> > @@ -195,12 +195,12 @@ static int loongson_pcm_hw_params(struct snd_soc_=
component *component,
> >  }
> >
> >  static snd_pcm_uframes_t
> > -loongson_pcm_pointer(struct snd_soc_component *component,
> > -                    struct snd_pcm_substream *substream)
> > +loongson_internal_dma_pcm_pointer(struct snd_soc_component *component,
> > +                                 struct snd_pcm_substream *substream)
> >  {
> >         struct snd_pcm_runtime *runtime =3D substream->runtime;
> >         struct loongson_runtime_data *prtd =3D runtime->private_data;
> > -       struct loongson_dma_desc *desc;
> > +       struct loongson_internal_dma_desc *desc;
> >         snd_pcm_uframes_t x;
> >         u64 addr;
> >
> > @@ -213,7 +213,7 @@ loongson_pcm_pointer(struct snd_soc_component *comp=
onent,
> >         return x;
> >  }
> >
> > -static irqreturn_t loongson_pcm_dma_irq(int irq, void *devid)
> > +static irqreturn_t loongson_internal_dma_pcm_dma_irq(int irq, void *de=
vid)
> >  {
> >         struct snd_pcm_substream *substream =3D devid;
> >
> > @@ -221,14 +221,14 @@ static irqreturn_t loongson_pcm_dma_irq(int irq, =
void *devid)
> >         return IRQ_HANDLED;
> >  }
> >
> > -static int loongson_pcm_open(struct snd_soc_component *component,
> > -                            struct snd_pcm_substream *substream)
> > +static int loongson_internal_dma_pcm_open(struct snd_soc_component *co=
mponent,
> > +                                         struct snd_pcm_substream *sub=
stream)
> >  {
> >         struct snd_pcm_runtime *runtime =3D substream->runtime;
> >         struct snd_soc_pcm_runtime *rtd =3D snd_soc_substream_to_rtd(su=
bstream);
> >         struct snd_card *card =3D substream->pcm->card;
> >         struct loongson_runtime_data *prtd;
> > -       struct loongson_dma_data *dma_data;
> > +       struct loongson_internal_dma_data *dma_data;
> >
> >         /*
> >          * For mysterious reasons (and despite what the manual says)
> > @@ -241,7 +241,7 @@ static int loongson_pcm_open(struct snd_soc_compone=
nt *component,
> >                                    SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 128=
);
> >         snd_pcm_hw_constraint_integer(substream->runtime,
> >                                       SNDRV_PCM_HW_PARAM_PERIODS);
> > -       snd_soc_set_runtime_hwparams(substream, &ls_pcm_hardware);
> > +       snd_soc_set_runtime_hwparams(substream, &loongson_internal_dma_=
hardware);
> >
> >         prtd =3D kzalloc_obj(*prtd);
> >         if (!prtd)
> > @@ -277,8 +277,8 @@ static int loongson_pcm_open(struct snd_soc_compone=
nt *component,
> >         return -ENOMEM;
> >  }
> >
> > -static int loongson_pcm_close(struct snd_soc_component *component,
> > -                             struct snd_pcm_substream *substream)
> > +static int loongson_internal_dma_pcm_close(struct snd_soc_component *c=
omponent,
> > +                                          struct snd_pcm_substream *su=
bstream)
> >  {
> >         struct snd_card *card =3D substream->pcm->card;
> >         struct loongson_runtime_data *prtd =3D substream->runtime->priv=
ate_data;
> > @@ -293,21 +293,21 @@ static int loongson_pcm_close(struct snd_soc_comp=
onent *component,
> >         return 0;
> >  }
> >
> > -static int loongson_pcm_mmap(struct snd_soc_component *component,
> > -                            struct snd_pcm_substream *substream,
> > -                            struct vm_area_struct *vma)
> > +static int loongson_internal_dma_pcm_mmap(struct snd_soc_component *co=
mponent,
> > +                                         struct snd_pcm_substream *sub=
stream,
> > +                                         struct vm_area_struct *vma)
> >  {
> >         return remap_pfn_range(vma, vma->vm_start,
> > -                       substream->dma_buffer.addr >> PAGE_SHIFT,
> > -                       vma->vm_end - vma->vm_start, vma->vm_page_prot)=
;
> > +                              substream->dma_buffer.addr >> PAGE_SHIFT=
,
> > +                              vma->vm_end - vma->vm_start, vma->vm_pag=
e_prot);
> >  }
> >
> > -static int loongson_pcm_new(struct snd_soc_component *component,
> > -                           struct snd_soc_pcm_runtime *rtd)
> > +static int loongson_internal_dma_pcm_new(struct snd_soc_component *com=
ponent,
> > +                                        struct snd_soc_pcm_runtime *rt=
d)
> >  {
> >         struct snd_card *card =3D rtd->card->snd_card;
> >         struct snd_pcm_substream *substream;
> > -       struct loongson_dma_data *dma_data;
> > +       struct loongson_internal_dma_data *dma_data;
> >         unsigned int i;
> >         int ret;
> >
> > @@ -319,7 +319,7 @@ static int loongson_pcm_new(struct snd_soc_componen=
t *component,
> >                 dma_data =3D snd_soc_dai_get_dma_data(snd_soc_rtd_to_cp=
u(rtd, 0),
> >                                                     substream);
> >                 ret =3D devm_request_irq(card->dev, dma_data->irq,
> > -                                      loongson_pcm_dma_irq,
> > +                                      loongson_internal_dma_pcm_dma_ir=
q,
> >                                        IRQF_TRIGGER_HIGH, LS_I2S_DRVNAM=
E,
> >                                        substream);
> >                 if (ret < 0) {
> > @@ -330,16 +330,16 @@ static int loongson_pcm_new(struct snd_soc_compon=
ent *component,
> >
> >         return snd_pcm_set_fixed_buffer_all(rtd->pcm, SNDRV_DMA_TYPE_DE=
V,
> >                                             card->dev,
> > -                                           ls_pcm_hardware.buffer_byte=
s_max);
> > +                                           loongson_internal_dma_hardw=
are.buffer_bytes_max);
> >  }
> >
> > -const struct snd_soc_component_driver loongson_i2s_component =3D {
> > +const struct snd_soc_component_driver loongson_i2s_internal_dma_compon=
ent =3D {
> >         .name           =3D LS_I2S_DRVNAME,
> > -       .open           =3D loongson_pcm_open,
> > -       .close          =3D loongson_pcm_close,
> > -       .hw_params      =3D loongson_pcm_hw_params,
> > -       .trigger        =3D loongson_pcm_trigger,
> > -       .pointer        =3D loongson_pcm_pointer,
> > -       .mmap           =3D loongson_pcm_mmap,
> > -       .pcm_construct  =3D loongson_pcm_new,
> > +       .open           =3D loongson_internal_dma_pcm_open,
> > +       .close          =3D loongson_internal_dma_pcm_close,
> > +       .hw_params      =3D loongson_internal_dma_pcm_hw_params,
> > +       .trigger        =3D loongson_internal_dma_pcm_trigger,
> > +       .pointer        =3D loongson_internal_dma_pcm_pointer,
> > +       .mmap           =3D loongson_internal_dma_pcm_mmap,
> > +       .pcm_construct  =3D loongson_internal_dma_pcm_new,
> >  };
> > diff --git a/sound/soc/loongson/loongson_dma.h b/sound/soc/loongson/loo=
ngson_dma.h
> > index 073ee8c0c046..8795fd7874bb 100644
> > --- a/sound/soc/loongson/loongson_dma.h
> > +++ b/sound/soc/loongson/loongson_dma.h
> > @@ -9,8 +9,6 @@
> >  #ifndef _LOONGSON_DMA_H
> >  #define _LOONGSON_DMA_H
> >
> > -#include <sound/soc.h>
> > -
> > -extern const struct snd_soc_component_driver loongson_i2s_component;
> > +extern const struct snd_soc_component_driver loongson_i2s_internal_dma=
_component;
> >
> >  #endif
> > diff --git a/sound/soc/loongson/loongson_i2s.h b/sound/soc/loongson/loo=
ngson_i2s.h
> > index e73ffa954ec9..5f773bbd24c5 100644
> > --- a/sound/soc/loongson/loongson_i2s.h
> > +++ b/sound/soc/loongson/loongson_i2s.h
> > @@ -42,7 +42,7 @@
> >
> >  #define LS_I2S_DRVNAME         "loongson-i2s"
> >
> > -struct loongson_dma_data {
> > +struct loongson_internal_dma_data {
> >         dma_addr_t dev_addr;            /* device physical address for =
DMA */
> >         void __iomem *order_addr;       /* DMA order register */
> >         int irq;                        /* DMA irq */
> > @@ -52,11 +52,11 @@ struct loongson_i2s {
> >         struct device *dev;
> >         union {
> >                 struct snd_dmaengine_dai_dma_data playback_dma_data;
> > -               struct loongson_dma_data tx_dma_data;
> > +               struct loongson_internal_dma_data tx_dma_data;
> >         };
> >         union {
> >                 struct snd_dmaengine_dai_dma_data capture_dma_data;
> > -               struct loongson_dma_data rx_dma_data;
> > +               struct loongson_internal_dma_data rx_dma_data;
> >         };
> >         struct regmap *regmap;
> >         void __iomem *reg_base;
> > diff --git a/sound/soc/loongson/loongson_i2s_pci.c b/sound/soc/loongson=
/loongson_i2s_pci.c
> > index dea1e4ebee29..9120432bbe64 100644
> > --- a/sound/soc/loongson/loongson_i2s_pci.c
> > +++ b/sound/soc/loongson/loongson_i2s_pci.c
> > @@ -13,6 +13,7 @@
> >  #include <linux/acpi.h>
> >  #include <linux/pci.h>
> >  #include <sound/soc.h>
> > +
> >  #include "loongson_i2s.h"
> >  #include "loongson_dma.h"
> >
> > @@ -22,7 +23,7 @@ static int loongson_i2s_pci_probe(struct pci_dev *pde=
v,
> >                                   const struct pci_device_id *pid)
> >  {
> >         const struct fwnode_handle *fwnode =3D pdev->dev.fwnode;
> > -       struct loongson_dma_data *tx_data, *rx_data;
> > +       struct loongson_internal_dma_data *tx_data, *rx_data;
> >         struct device *dev =3D &pdev->dev;
> >         struct loongson_i2s *i2s;
> >         int ret;
> > @@ -79,7 +80,7 @@ static int loongson_i2s_pci_probe(struct pci_dev *pde=
v,
> >                 udelay(200);
> >         }
> >
> > -       ret =3D devm_snd_soc_register_component(dev, &loongson_i2s_comp=
onent,
> > +       ret =3D devm_snd_soc_register_component(dev, &loongson_i2s_inte=
rnal_dma_component,
> >                                               &loongson_i2s_dai, 1);
> >         if (ret)
> >                 return dev_err_probe(dev, ret, "register DAI failed\n")=
;
> > --
> > 2.52.0
> >
> >

--=20
Thanks.
Binbin
