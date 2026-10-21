Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792575284;
	b=jVROO9RJLX9nQSjPxTFFSLKeYxb+e8+85d+opjZXw/X8KZIqgbt6i3nfgScbQMWiJY3j
	 ulXjKDaRNS3QGDQ1RCs1JlvFCBtBs+InL3rwSol46ghAxQjIdCmJRi514cRLsueOqGgP/
	 87aqckoPqZdtf62/D69uR0R8FHhbPFJs24XkkbHdKLAqJ01ngsBn2HrqpDWDIVH5mpg3Z
	 DJkj0HYcv98MzTB743wvIVWU4TuUJJdLQru9q+elTEbEElqLbwjJRowhUs1SV0BALod0B
	 /5yQguCjbcS36zTjkQd1VhrrYIqLoQ/yMCr1qynv1uoUsVIpfOsJ6LIBVBdzxDIj7kw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575284;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Z399+Abl7xZhJXeuJLnTT/RJk86fuw0Er0XDukPBP/8=;
	b=dzkk6DK2ww696930MVtM+08oOzczXErnrkRAvUX3F5Wpx0Gbl3JLl8NztQoznl7WXoKu
	 InTNiTZN4euFBMbP7IRGeAOU0lR3esQCH/N1wwZ/JGxadGgnuyllA1uMcleB3CeUoaBUC
	 EcJAyyrUY8wKhdio7XUgweSg8jyNEtj6WfLceMDdfa06khrifdfd2q4bNfPodaFJBkRxD
	 aH1XsxaWk930sz26WILRSn3DRxXoK1uj6ZyHajXgfezVra0B1zEsRptp1EmMhtgRWpeNF
	 2MmZJ8PfZOYTThDlfCEUacIxLyglgOX/LjewmZO/N5n6ljQNLaEgbfuGgm242M6pctg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=F9wq+I9U;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAE6606A31A
	for <loongarch@lists.linux.dev>; Wed, 21 Oct 2026 09:34:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AAE6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=F9wq+I9U
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c450ab1483cso74285066b.3
        for <loongarch@lists.linux.dev>; Wed, 21 Oct 2026 02:34:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792575282; cv=none;
        d=google.com; s=arc-20260327;
        b=MADtiYh3s35CRPsaxNffEVPA2rdzQ05ZZRcKMs8CyYO1jqErK0jCNReUyY1sC0jQyc
         Q3xY7G5L+Hi3j7gcK/RR71o2h83CIU/AUPvjm02SvCMdvmkUDQzUwovgRiqz5PT7aFSu
         TeqcuaZAud9kN7tbA7VW8aHNpEsLo/1uc63vGSXWpxVFp7KtgGE4LMGXIBjGSip6Fmsa
         AIFT+g6SqmoPb89GMNE4Cr0O0cIoorJ8e9xctG49oyMQYxPUEGpdYMLwr6zuuHfe2iPV
         RNIQOPqIZEy4UgYeXOCY4W7/ociSeM5uh1MaILT7s51OmRkpQ1bxIYizOWi6um9Ppgps
         ASUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z399+Abl7xZhJXeuJLnTT/RJk86fuw0Er0XDukPBP/8=;
        fh=uhw+J5htG8voT9C4dFc7cNY7OqxEB1dob+9Jb1YsIps=;
        b=mAzi19DMOt+a2Lr5PFlJPDqC2RnG8jPLl5SF5xtZcjc0QKYUf7UIrgkNnFRf6ptb7P
         ZHuPByFcaElCTzuGsBdJ8v+CfeAtKDKYfAqSNa/wbeI+man69zC0BosH/m3E42a2p8rQ
         Hdp5Ses0qiQlLfjGhongyNKPdKdjmTFs97U5M7jK0NOOqX+/B4ZP02wkBTOLhLe5tnqC
         2Tl4zuBRByzRfr9xXomoixgClg2EUqR6FG076cgG7UEPVp34cQrTgVyXJ6p7jWtURd0w
         K7SNaEzyB2fYKxqzZE3Pu3ne8qDJtNWjV3LzKJGNBg52bdOZmdvDy2Df0D/wg2jrR7eR
         C9Bg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792575282; x=1793180082; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z399+Abl7xZhJXeuJLnTT/RJk86fuw0Er0XDukPBP/8=;
        b=F9wq+I9UYoCfn/oQsBEvreLYEPWSYoYZ6wcwXZ+aJAMGllQ4HVu8DDg77LyO//nEw/
         t6JjiSqsVM0Rz7TNljaxk9Oe51wOnWrz/PjEOt8Z1+rQLm8HzdY0aJKaZtEICXOJEkm9
         VDKieBTbsTzpHEK7nY1TwQ4JYpUNWC9f1XLzirEdsVAiGxqn50Xjd8qSTy7mFXO/+HL0
         u85zGBo6ApBR+vBZXs158JnukHjlrCfEookd9D+9AWCTwFspdnrYg/3YQCXFvIj7joj3
         3nnUnKj47ccta7WCe2oGH7H2iKLZ+7bSSLqMwe+Sl5Fmd6KVuRTHpA89/QQhYyBXlZLY
         AdLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575282; x=1793180082;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z399+Abl7xZhJXeuJLnTT/RJk86fuw0Er0XDukPBP/8=;
        b=b+znw185WF+GYF0HUsiY9GYr0IlspMIv+JIaShXnIbugTEJ+GA3y9Q7ikZun03R6+Z
         qZvw2mZIO3PfZytgwp7mMnUVXiPTy5Hf+dzeXC2dYHBTc4G1SsiMaNEYQbyRVLaGFjBN
         4xIea2p+3dfY6wD0h+18XaYeUsy5i8jS7fnQrhsj5ziio+Y65KkksxDOlQV/ZRHjAv3k
         JRl3zZff/myBlQcnE/WlELu6IsMiFQYVRYE/UH83nvOWrjg9xyVAJEBMzuV1Ddh/TXwX
         EsWSKxENiUqBH2trt5ZR2drbtEhXxdz1mpHryf56qQTOmRRb1rAHTz72wsVTkqkbSmeb
         kIAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxmGepme1+GzCGCXYzEObIuVv96uxJeuAJbl7G6nbxs62iOfbXGVIlk0KYUZVI+D65H4UwdyRXa8Xo=@lists.linux.dev
X-Gm-Message-State: AFq9FYJLAcNKQJhxh/NaizKqA8WqMVgGBVNg4OZUHlGr1pCN07nsLtFO
	INkg+fOWNNWWj+lSo4+vxNTg8vJYSWW1yXLc1hJlIRF2gbxHoXGGGyUIpWowy8M0ZIPjxXBT4GQ
	iEDSgWbdsM1S0bN9qFJhyZJR2XEofr88=
X-Gm-Gg: AYBFou1Mi1Cf6wg3//Du0LAb/ybVyv3FgpGjgJI62VmVXyNrbXh7gFD1x6kcesNq5tY
	THbwQHsr+xG8eDTtOqmeBQfVc14ytdu+RnH4z3qdTqwMF6YB7JACalYhtqtHPsWpvxzO1I6RAvM
	TvN7xuqE/JKZKEVtz0DTkEJ1AIDIQibIuvGl4zm1C04DhERFzH3OMhjhHJj1NbagoCqM72r/ECz
	FyLc9EZIIuNsWPP6YZApGvcI5VH6dYPwMIsutWm3frbsWkZckFW8k7TXPtRwOwbO+k1ZnyC90f4
	OJB16JJfX4pq7sp1TsToqjU3byh13pA6M58pU/qbj/Q7EhL8Gl3GANhrQVff0Gc/lu58Mdfty6X
	E+Ry/qAQvYOx2jhcZGSS1KyQJWjPSHybmWqBwy10=
X-Received: by 2002:a17:907:60cf:b0:c3f:d8f2:f08e with SMTP id
 a640c23a62f3a-c46799f0243mr132517566b.44.1792575282090; Wed, 21 Oct 2026
 02:34:42 -0700 (PDT)
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <cover.1791535540.git.zhoubinbin@loongson.cn> <54a6180b35353d2c03c5a752305636baacd02e9c.1791535540.git.zhoubinbin@loongson.cn>
 <atEHYLnJ5GTr1-ae@lizhi-Precision-Tower-5810>
In-Reply-To: <atEHYLnJ5GTr1-ae@lizhi-Precision-Tower-5810>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 21 Oct 2026 17:34:29 +0800
X-Gm-Features: AclHuK-aRj06NVXLuWOmMZkBnwYL_mNbl22DV3t6IfO159KFky0fZBZvqpjeCuQ
Message-ID: <CAMpQs4Ke44d=ijRPbmZM5FZ0YReRH1U4jFMA=RPKU1VNLsNv+w@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] dmaengine: loongson: Add Loongson-2K0300 APB DMA
 mux driver
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, Keguang Zhang <keguang.zhang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Frank:

On Fri, Oct 16, 2026 at 1:03=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wro=
te:
>
> On Fri, Oct 09, 2026 at 05:19:34PM +0800, Binbin Zhou wrote:
> > The Loongson-2K0300 DMA mux is not a standalone DMA controller. It is
> > implemented as a set of routing fields in the chip global configuration
> > registers CHIP_CTRL13/14/15, which select which physical channel of the
> > on-chip CMC DMA controller handles each peripheral DMA request.
> >
> > Add a driver that exposes these routing fields as an OF DMA router. The
> > router's allocation callback validates the <request> <channel> <flags>
> > specifier, programs the corresponding CHIP_CTRL register field, and the=
n
> > rewrites the specifier to <channel> <flags> so that the parent CMC DMA
> > controller's xlate is used.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  MAINTAINERS                                 |   1 +
> >  drivers/dma/loongson/Makefile               |   1 +
> >  drivers/dma/loongson/loongson2-apb-dmamux.c | 398 ++++++++++++++++++++
> >  3 files changed, 400 insertions(+)
> >  create mode 100644 drivers/dma/loongson/loongson2-apb-dmamux.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 78622b255f88..0b0c6ea41c64 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -15355,6 +15355,7 @@ F:    Documentation/devicetree/bindings/dma/loo=
ngson,ls2k0300-dmamux.yaml
> >  F:   Documentation/devicetree/bindings/dma/loongson,ls2x-apbdma.yaml
> >  F:   drivers/dma/loongson/loongson2-apb-cmc-dma.c
> >  F:   drivers/dma/loongson/loongson2-apb-dma.c
> > +F:   drivers/dma/loongson/loongson2-apb-dmamux.c
> >  F:   include/dt-bindings/dma/loongson,ls2k-dmamux.h
> >
> >  LOONGSON LS2X I2C DRIVER
> > diff --git a/drivers/dma/loongson/Makefile b/drivers/dma/loongson/Makef=
ile
> > index 48c19781e729..271fd38fa8f2 100644
> > --- a/drivers/dma/loongson/Makefile
> > +++ b/drivers/dma/loongson/Makefile
> > @@ -2,3 +2,4 @@
> >  obj-$(CONFIG_LOONGSON1_APB_DMA) +=3D loongson1-apb-dma.o
> >  obj-$(CONFIG_LOONGSON2_APB_DMA) +=3D loongson2-apb-dma.o
> >  obj-$(CONFIG_LOONGSON2_APB_CMC_DMA) +=3D loongson2-apb-cmc-dma.o
> > +obj-$(CONFIG_LOONGSON2_APB_CMC_DMA) +=3D loongson2-apb-dmamux.o
> > diff --git a/drivers/dma/loongson/loongson2-apb-dmamux.c b/drivers/dma/=
loongson/loongson2-apb-dmamux.c
> > new file mode 100644
> > index 000000000000..01bd3ce4ca25
> > --- /dev/null
> > +++ b/drivers/dma/loongson/loongson2-apb-dmamux.c
> > @@ -0,0 +1,398 @@
> ...
> > +static int loongson2_dmamux_set_route(struct loongson2_dmamux *mux, u3=
2 request, u32 channel)
> > +{
> > +     const struct loongson2_dmamux_map *map;
> > +     u32 reg_val, route_val, high_val =3D 0;
> > +
> > +     if (request >=3D mux->config->num_maps)
> > +             return -EINVAL;
> > +
> > +     if (channel > mux->config->max_channel)
> > +             return -EINVAL;
> > +
> > +     map =3D &mux->config->maps[request];
> > +
> > +     switch (map->type) {
> > +     case LOONGSON_DMAMUX_PAIR:
> > +             route_val =3D channel / 2;
> > +             break;
> > +     case LOONGSON_DMAMUX_SINGLE:
> > +             route_val =3D channel;
> > +             if (map->high_reg)
> > +                     high_val =3D (channel >> 2) & 0x1;
> > +             break;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +
> > +     guard(spinlock_irqsave)(&mux->lock);
> > +
> > +     /* Write the primary register field */
> > +     reg_val =3D loongson2_dmamux_read(mux, map->reg);
> > +     reg_val &=3D ~map->mask;
> > +     reg_val |=3D field_prep(map->mask, route_val);
> > +     loongson2_dmamux_write(mux, map->reg, reg_val);
> > +
> > +     /* Write the extension register field if present */
> > +     if (map->high_reg) {
> > +             reg_val =3D loongson2_dmamux_read(mux, map->high_reg);
> > +             reg_val &=3D ~BIT(map->high_shift);
> > +             reg_val |=3D high_val << map->high_shift;
>
> assign_bit(map->high_shift, &reg_val, high_val);

I think `assign_bit()` here is not quite suitable, reg_val is a u32
(returned by loongson2_dmamux_read()), but assign_bit() expects a
`volatile unsigned long *`.

How about adding a helper function:

static void loongson2_dmamux_assign_bits(struct loongson2_dmamux *priv,
                                         unsigned int reg, u32 mask, u32 va=
l)
{
        u32 reg_val;

        reg_val =3D loongson2_dmamux_read(priv, reg);
        reg_val &=3D ~mask;
        reg_val |=3D val & mask;
        loongson2_dmamux_write(priv, reg, reg_val);
}

Then we can call this function:

/* Primary register field */
loongson2_dmamux_assign_bits(priv, map->reg, map->mask,
                             field_prep(map->mask, route_val));

/* Extension register bit if present */
if (map->high_reg)
        loongson2_dmamux_assign_bits(priv, map->high_reg,
                                     BIT(map->high_shift),
                                     high_val ? BIT(map->high_shift) : 0);

>
> other looks good
>
> Frank
> > +             loongson2_dmamux_write(mux, map->high_reg, reg_val);
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +/**
> > + * loongson2_dmamux_route_allocate() - DMA router allocation callback
> > + * @dma_spec: OF DMA specifier <request> <channel> <flags>
> > + * @ofdma:    Router's of_dma structure; ofdma->dma_router points to o=
ur
> > + *            struct dma_router embedded in struct loongson2_dmamux.
> > + *
> > + * Return: NULL as route_data (nothing to free), or an ERR_PTR on fail=
ure.
> > + */
> > +static void *loongson2_dmamux_route_allocate(struct of_phandle_args *d=
ma_spec,
> > +                                          struct of_dma *ofdma)
> > +{
> > +     struct loongson2_dmamux *mux;
> > +     u32 request, channel, flags;
> > +     int ret;
> > +
> > +     if (!ofdma->dma_router)
> > +             return ERR_PTR(-EINVAL);
> > +
> > +     mux =3D container_of(ofdma->dma_router, struct loongson2_dmamux, =
dma_router);
> > +
> > +     if (dma_spec->args_count !=3D 3)
> > +             return ERR_PTR(-EINVAL);
> > +
> > +     request =3D dma_spec->args[0];
> > +     channel =3D dma_spec->args[1];
> > +     flags =3D dma_spec->args[2];
> > +
> > +     if (request >=3D mux->config->num_maps ||
> > +         channel > mux->config->max_channel)
> > +             return ERR_PTR(-EINVAL);
> > +
> > +     /* Program the SoC-specific route register */
> > +     ret =3D loongson2_dmamux_set_route(mux, request, channel);
> > +     if (ret)
> > +             return ERR_PTR(ret);
> > +
> > +     /* The of_node_put() will be done in of_dma_router_xlate function=
 */
> > +     dma_spec->np =3D of_parse_phandle(ofdma->of_node, "dma-masters", =
0);
> > +     if (!dma_spec->np)
> > +             return ERR_PTR(-ENODEV);
> > +
> > +     dma_spec->args[0] =3D channel;
> > +     dma_spec->args[1] =3D flags;
> > +     dma_spec->args_count =3D mux->config->parent_args_count;
> > +
> > +     return NULL;
> > +}
> > +
> > +/**
> > + * loongson2_dmamux_route_free() - DMA router free callback
> > + * @dev: Back pointer to the router's device
> > + * @route_data: Router-specific data returned by route_allocate
> > + *
> > + * The driver does not allocate any per-route resources, so this callb=
ack
> > + * is intentionally empty. It must still be provided because the OF DM=
A
> > + * core calls it unconditionally on some error paths (e.g. -EPROBE_DEF=
ER)
> > + * without checking for a NULL pointer.
> > + */
> > +static void loongson2_dmamux_route_free(struct device *dev, void *rout=
e_data)
> > +{
> > +}
> > +
> > +/**
> > + * loongson2_dmamux_unregister_of_dma() - devm action to unregister th=
e router
> > + * @data: Pointer to struct loongson2_dmamux
> > + *
> > + * Called automatically by the device-managed resource framework both =
on
> > + * probe failure and on driver removal, ensuring the OF DMA router is
> > + * always unregistered.
> > + */
> > +static void loongson2_dmamux_unregister_of_dma(void *data)
> > +{
> > +     struct loongson2_dmamux *mux =3D data;
> > +
> > +     of_dma_router_free(mux->dma_router.dev->of_node);
> > +}
> > +
> > +static int loongson2_dmamux_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     struct loongson2_dmamux *mux;
> > +     u32 dma_requests;
> > +     int ret;
> > +
> > +     mux =3D devm_kzalloc(dev, sizeof(*mux), GFP_KERNEL);
> > +     if (!mux)
> > +             return -ENOMEM;
> > +
> > +     mux->base =3D devm_platform_ioremap_resource(pdev, 0);
> > +     if (IS_ERR(mux->base))
> > +             return PTR_ERR(mux->base);
> > +
> > +     spin_lock_init(&mux->lock);
> > +     mux->config =3D &ls2k0300_dmamux_config;
> > +
> > +     ret =3D of_property_read_u32(dev->of_node, "dma-requests", &dma_r=
equests);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "missing dma-requests prop=
erty\n");
> > +
> > +     if (dma_requests !=3D mux->config->num_maps)
> > +             return dev_err_probe(dev, -EINVAL,
> > +                                  "dma-requests=3D%u mismatches driver=
 num_maps=3D%u",
> > +                                  dma_requests, mux->config->num_maps)=
;
> > +
> > +     mux->dma_router.dev =3D dev;
> > +     mux->dma_router.route_free =3D loongson2_dmamux_route_free;
> > +
> > +     platform_set_drvdata(pdev, mux);
> > +
> > +     ret =3D of_dma_router_register(dev->of_node, loongson2_dmamux_rou=
te_allocate,
> > +                                  &mux->dma_router);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret,
> > +                                  "Failed to register DMA router");
> > +
> > +     ret =3D devm_add_action_or_reset(dev, loongson2_dmamux_unregister=
_of_dma, mux);
> > +     if (ret)
> > +             return ret;
> > +
> > +     dev_info(dev,
> > +              "Loongson2 DMA Mux Controller registered (max_channel=3D=
%u, requests=3D%u)",
> > +              mux->config->max_channel, mux->config->num_maps);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct of_device_id loongson2_dmamux_of_match[] =3D {
> > +     { .compatible =3D "loongson,ls2k0300-dmamux" },
> > +     { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, loongson2_dmamux_of_match);
> > +
> > +static struct platform_driver loongson2_dmamux_driver =3D {
> > +     .driver =3D {
> > +             .name =3D "loongson2-dmamux",
> > +             .of_match_table =3D loongson2_dmamux_of_match,
> > +     },
> > +     .probe =3D loongson2_dmamux_probe,
> > +};
> > +module_platform_driver(loongson2_dmamux_driver);
> > +
> > +MODULE_DESCRIPTION("Loongson2 SoC DMA Mux Controller driver");
> > +MODULE_AUTHOR("Loongson Technology Corporation Limited");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.52.0
> >

--
Thanks.
Binbin
