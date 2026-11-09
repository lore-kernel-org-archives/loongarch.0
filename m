Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794200940;
	b=4mNFmBiBISQhx2arCe4Ujb4DojNA1ESxG+LkpRad+QNY1d6tb3ndmzc3nnUSmjy/UFA0
	 P/yC4AuHh1MRfEcn6Kj4HcysnaTMOM2L5yL1VVDv/EgDgOn2UVpW91KJsIEkyjeQ2sLms
	 m6vRDQ6TuXW1WIWSxbBcPcr2dGUyc7pOACpxNA8jLtfXM4hmc1UBlZ0VnywK+TZze+ULL
	 vignZOB2+1+Kr051wypS63BYY0+wUuYGOW4k9kqZmSoDWc5uCDUrWkS+YvNAuybDusSF2
	 F3EH9DKehb6uU6CrxjbE6b8E/qj/0VhWWAsl0dOLJ1hJdqwVAXBVzLRphpUIzXO83Og==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794200940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cunAw1V91oucnsdDfdF6SnKqgoVGUX++JtV5G9Lj6OQ=;
	b=awoHPKx3kOQAsBTYfe8Jl13ruqbkG5gU+OqMDq3xx/pgMC1aGpoOZJ+/SPNN/OM7zS2q
	 gKVriT0ApYX+kSoR/ak+/mR79ckjXirEpm9jPVF/UYsvcRu9Ir5cBbXnuepsQzn29Hsj9
	 gI4tXAXR9/9QiR6BiHjA6FsYGQ7qH4V3VpHhuaGJt3NTAebv1rFounYCijoMGRcaoxrRN
	 ojJN9idrJMb/fDvaG43GLj+1iWTKGMUXzg0Qxqi571GtRQxeHSHco8AzqDpRk8J5WmccX
	 k7fXPqRVfSPQdFlyzVt36k0chU/i/xhgyiQpkac3b5MRwTC3qx0LVmMP8bvvjIqcGnw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=II4MVEUe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D37606A31C
	for <loongarch@lists.linux.dev>; Mon,  9 Nov 2026 05:09:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58D37606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=II4MVEUe
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b56c428212so600600a12.2
        for <loongarch@lists.linux.dev>; Sun, 08 Nov 2026 21:09:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794200939; cv=none;
        d=google.com; s=arc-20260327;
        b=M+wSOAwQgk3jNLsrzv64FuV4c+3ZinyFqrXT+7tb4KRM5xyLNp1oZFsalwQ1zNCZPV
         +KBOPwc0eBonKllsh4kXdvToUsNW5ISQM26Ld3kF7McM8FOhIhZHE/B8uR2fZl6uAu7s
         qNAIi+7sIpcDnOy4eZG+CWpbU9oZ9A7gxCRhnCz/ordkDN+mjR8RNRGE5JboBgvvCE+a
         A/z/kylWcpsqcextctvLOfraDDAWRmflAt6czKQgZDeg/v1+KJOOVGQbP/ief7lY9lA/
         RrlDSYn7Hlo4OLBcUH1oRzDEUYVoOZXk8fI6+JnEs78OOgGXzo+GzncQf8Swfuls8ZG1
         vtkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cunAw1V91oucnsdDfdF6SnKqgoVGUX++JtV5G9Lj6OQ=;
        fh=VS2uoQcdta3ULfCGccYLZKfmgMCgHlkFDj1RlsawT0M=;
        b=JJAJD4hRZgOJKJGi+KbBVL5JrCOaaWau3GdEs/IyEkOJNLbLwHCmWF7tgCzKPruOeG
         Vo2mWeyqRdrK8p5+hVnw7csFMtC3E1eKCBQghQnO6eBr77wOw9a3Swzb6VdzfvnCTwX6
         1LvvSIAiIN8fDuNZkmZhS/uzg9ozrFfniGVAvJ/JjjarQzzr5xTAQhJtYKcBC8qeLOzA
         1la1as9eaNWQl8pZ+q903dwFN2AJP/Ev0CMhOUvsPNNJ0YBa2fnGZiW3Ft23zKtLCbmZ
         ua6aLuWQshrwWSoOIZIDb2V92bT4lFqEENyAnMY5wdZSkOEuGTbYLfTxRqVocfFbrLSb
         2SiA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794200939; x=1794805739; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cunAw1V91oucnsdDfdF6SnKqgoVGUX++JtV5G9Lj6OQ=;
        b=II4MVEUeM/unTVDxT7gQtOrZ+tqkdOAQ+Ckw4VwyenwEVAWMJQoOwBV9DolNvS6+yT
         lrxz64UdYK3472W60XWxcgTHq/26k9gGrTcMzvc5xbFb+BITqzQJQ19Hed8o67jwd63l
         NKjW010VWcQV0RUmJkahAqSYQ3d7nbiDoR43PR7gprWyIawDC9n1TFh8j3rdT+N20l1y
         Ip2dnh7glEPigMcibIAdapTtFvCJHSy3yXfljl+3eGtwGiVRuGnR1XvJHko4sgHukDVd
         sg9IHdCNheiRa/b5K2iP6XpE/18yaOVqJwVWsz3F+VR/P2sYecFLvoGBn3dO3q7wHVcX
         KlxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794200939; x=1794805739;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cunAw1V91oucnsdDfdF6SnKqgoVGUX++JtV5G9Lj6OQ=;
        b=wV2WdW4ktBv+wx7fhQVU2OHbXReMFQjRfceW72xrVaKlDw0VfBAEnpUkRmNl2w9LMk
         yodpm5XEkHTSDyaYkXwukZLrPKNvaoAs76G87O1YhrYIY3wQj8lN3THkct8QA5lhnTtU
         bRpaGQg5D763eDnZoJ9fzyLyOjsffV0a66klGELFLdDBP85ePU4qe+MoXErSCmzhcU3E
         AYCR8Ldx+84tKGIVIvfYuL90Ylg+hsWEA83VknUpcI9bdEXLspePVN06nx+gFrjPUptP
         eOuBezlJFh6YqlOjdy6LE0cX4gDmyh/mDzMIgXRkoPpnUrbol8XSHGIliT74ypfxVtDB
         OoCA==
X-Forwarded-Encrypted: i=1; AL+hErE3yJvyhIzmAr/ApuzmpNHRnpaS0zz5MiwFo/hQhfBiAIC9JrWkOxCXkhsXlVxtA6Y57QiJGyWYSY8=@lists.linux.dev
X-Gm-Message-State: APuU4Z+NpWrr7cuPCdCYghA+e7XJWbIa7z+vatdbi+AnTiM4ZdkRfZUv
	/mUlbqYh2fxx7yRp0V9osZAMC+qQhLKU6FSY5lTJ9Q4lG7USYSywWxyYHDGtFUJx36mK8P6HtkB
	KfivMrrhavzJjZnkiC+l+Ptyl0xq3/5yykh2M4m0gzA==
X-Gm-Gg: AYBFou3wzdXckpagc3xPDMtnWO96m+8LCS9GR17v02fHSRb+Pkhq15x9gnPISIdkvk0
	SQC3BP4p6Ftu5CMcoiqqlJSvTyWoSUqPVW9a9Z+ateT7Au8MsepbLdNkvEcxiZItUpBn5QvE7vp
	lm+DgnHXCmQdQWeo4XgDWq0tJ6N2IDPRfnmhrvB13VVzHRT3ynRRLV/GLtCxkxTgZQZfjs8ocbt
	uoL2bYlrmjt0doFZdN6hddYqAXYhvJxIJBa7M11acCkxZF7shOdyeHV2QeMIvZ45tPoYY6z2NbV
	yH/nKnSeIZXwKJEHHypZ4xijPYmkjCExMAEhFxY/qsY9wibnw/NVko8wo3tmV4RWPbyZcJ5Jnp9
	yQjJPwhfXhPRIbYVWXzKVD2LB9Zr2oHZ7eUnS448=
X-Received: by 2002:a05:6402:434c:b0:6b1:c5c3:9624 with SMTP id
 4fb4d7f45d1cf-6b7224553c8mr1984042a12.22.1794200938525; Sun, 08 Nov 2026
 21:08:58 -0800 (PST)
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <cover.1793689461.git.zhoubinbin@loongson.cn> <7258e7e16b8a563e60b7129946c292f70aeee1d5.1793689461.git.zhoubinbin@loongson.cn>
 <179406466808.3424803.8169701061345998672.b4-review@b4>
In-Reply-To: <179406466808.3424803.8169701061345998672.b4-review@b4>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Mon, 9 Nov 2026 13:08:45 +0800
X-Gm-Features: AclHuK9co97_tP3diCq82twGE0VR9UQNhWeTGrqj1IeLNbjjNYur-RyKJ6mcPPs
Message-ID: <CAMpQs4+mZXroi0ktC88TchNeOvGfto-qgJ_HFif79pcdWZm7Pw@mail.gmail.com>
Subject: Re: [PATCH 8/8] spi: loongson: Add interrupt support for SPI controller
To: Mark Brown <broonie@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, linux-spi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark:

Thanks for your review.

On Sat, Nov 7, 2026 at 11:17=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> > The Loongson SPI controller can generate an interrupt on byte
> > completion.  Add an interrupt-driven transfer path and use it when an
> > IRQ is available, while keeping the existing polling path as a fallback=
.
>
> > +     /* Read out the byte that was clocked in */
> > +     regmap_read(priv->regmap, LOONGSON_SPI_FIFO_REG, &data);
> > +     if (priv->rx_ptr)
> > +             priv->rx_ptr[priv->count] =3D (u8)data;
>
> We should really have a handle_err() which stops the transfer running,
> otherwise this might run after a timeout has stopped things and told the
> user that it owns the buffers again.

Yes. Added loongson_spi_handle_err(), which disables SPIE, clears
SPSR, and resets tx_ptr/rx_ptr/total so that a late IRQ cannot write
into buffers that the SPI core has already returned to the caller.
>
> > +static size_t loongson_spi_max_transfer_size(struct spi_device *spi)
> > +{
> > +     return LOONGSON_SPI_MAX_XFER_SIZE;
>
> Is there a particular reason to encode this limit, it doesn't look like
> it comes from the hardware.

You are right, it is not a hardware limit. I re-checked the Loongson-2K3000
manual: the only byte-count fields in the SPI block are CTRL.nbyte
(SFC custom-command path only, max 15), SPER.icnt (interrupt
granularity, max 4) and the double-buffered FIFO (2 bytes). None of
them limits a spi_transfer to 64 KiB. I removed the max_transfer_size
callback entirely.
>
> > +     /*
> > +      * Split large transfers so that each individual spi_transfer
> > +      * completes well within the SPI core's completion timeout.
> > +      * We allow roughly one second of data per chunk, capped by
> > +      * the controller's hardware maximum transfer size.
> > +      */
> > +     speed_hz =3D m->spi->max_speed_hz ? m->spi->max_speed_hz : host->=
max_speed_hz;
> > +     maxsize =3D min_t(size_t, hw_max, (size_t)speed_hz / 8);
> > +     maxsize =3D max_t(size_t, maxsize, 64);
>
> The core should already be scaling the timeout based on the transfer
> parameters?

You are right that the core scales the timeout from speed_hz and len,
and that the old speed_hz / 8 heuristic was both redundant and
inaccurate. However, we hit a real timeout in the field:

    dd if=3D/dev/mtd0 of=3D/dev/null bs=3D1M count=3D2
    dd: error reading '/dev/mtd0': Connection timed out
    0 bytes copied, 0.891911 s

The core computed the timeout from the theoretical speed_hz while the
controller (no DMA, a few bytes per IRQ) was much slower. Removing
the split makes this reproducible.

So I kept the split but moved it fully into the "software policy"
domain: a fixed LOONGSON_SPI_MAX_XFER_SIZE (4 KiB) is passed to
spi_split_transfers_maxsize() in prepare_message(), with a comment
stating explicitly that this is a software policy, not a hardware
limit.
>
> > @@ -23,7 +23,11 @@ static int loongson_spi_pci_register(struct pci_dev =
*pdev, const struct pci_devi
> >       if (ret)
> >               return dev_err_probe(dev, ret, "failed to request and rem=
ap memory");
> >
> > -     ret =3D loongson_spi_init_controller(dev, reg_base);
> > +     irq =3D pci_irq_vector(pdev, 0);
> > +     if (irq < 0)
> > +             dev_info(dev, "no IRQ available, will use PIO mode");
>
> This either needs pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES)
> or a check for irq <=3D 0.

Get it.
>
> > -     ret =3D loongson_spi_init_controller(dev, reg_base);
> > +     irq =3D platform_get_irq(pdev, 0);
> > +     if (irq < 0)
> > +             dev_info(dev, "no IRQ specified, will use PIO mode");
>
> This should handle -EPROBE_DEFER, and since the IRQ is optional it
> should be platform_get_irq_optional().

Get it.
>
> --
> Mark Brown <broonie@kernel.org>

--=20
Thanks.
Binbin
