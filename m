Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFB7393DF5
	for <loongarch@lists.linux.dev>; Fri, 29 May 2026 17:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780077186; cv=pass; b=le9P1WMEheeAIaxCr5ZxpOlXAFt87Qok2GIfPrizTxKFIQC+A2GQI9sIKXLYI8OZ4qc/O9J3ovXVBlIM+tvPZws5PTsev253FfSG6pgkX487Ka9uthY9tPlr+JjeU9m4YYGFnoDRo1Iu7BAw0zYkEi44MkEzNlrL5meDpGVEERY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780077186; c=relaxed/simple;
	bh=CRTXIQ/Qb5OrI0bSRweIZ6w27ZszuaaqKxftmUX6cms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sku3RVH98QDftGX+eQfiuvPhT61ACWF5DbLYUMN9cPyIabfFoBAYkaJkfJbr5iSa1FAo7QTwoPgHq4U7bdB09awZCa65KXDtxbDE4GsfsRJbrHHxBl87AyFjrlACgvjULRSqi8tq/jU71Q6ayNT2EsQlsHCPSxZyPkVCyNyGG2c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oU5DOd+N; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oU5DOd+N"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7dc67a5e102so21409217b3.1
        for <loongarch@lists.linux.dev>; Fri, 29 May 2026 10:53:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780077183; cv=none;
        d=google.com; s=arc-20240605;
        b=MgsW4cRjaasfSXA7njU5lQn2wmAQRD5FxIQYeOFx6SYkIm8e5eJKF9xiRYGXazROdg
         Ahwl94OZ7iWK7B21oHTwBCObB2fc9xyfQapwq8bihcpGYBtjdmDY1H0I0oSM5jZJYVSy
         jiYCt+xqLmZpaeWAWO67JEG3uVdHeRCauWFD3RmXCuPrQVkFr3eaJyj32o93trUaoCT3
         cQTUm8yYdB9s8chM3czYfoBS8SEh3zOeyyQ9fqOJ7Tv+rOvt+9QdDwhB8NKrrw/1e6Yg
         VBa2xPrWDigN7HHAjeoCdQH8IW4bDg11OJA/tXT+9NIq/anjRC7iWPhQUos3vzj0dK9I
         o0Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nQlP12RUuBBVpXDhZ5MFD4U7SV/VrxoBlSj6jpPr0zk=;
        fh=IbleVjJVBQf4eGpyLURisurqWutvJhACmQ6L+759YOo=;
        b=G7yBwsA4GDWpD8ZXHulwcfQ7bhWh9avHJ0DCvIw8boWKMb0rQ3zTneZgm0xgtABI4d
         RZ2iz8vuH46yfz+V8+xiQ3ks6z70rHDK17vdxfJL9PN0BB461zWtP0VIII6XW/CPdz4X
         bbrQcOS80fPCOWgDi4kyXN/DOjhpXOoPZUKp9JI2VBq7YdzM56IMD2NPG7BhaMiBSGM5
         2dRRt0s1qy9grpz/w/tbE86mLP2CBYJ5i+SEVn30JUT3eFrBBccAEEXIWjGgzMePUnsQ
         SyTeC1V2ug4d//KzXgz9GvixFZwnbebxLT/FMneNHueS0eYk2Q0A1622u7sBBfs+gPNs
         L1bw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780077183; x=1780681983; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nQlP12RUuBBVpXDhZ5MFD4U7SV/VrxoBlSj6jpPr0zk=;
        b=oU5DOd+NMmLVTB+L+biuvPwSF5aUqkPBoqyy5kmwPG3+TDLp52pmMxM9JVmPFH65pE
         c8YMfmb2Un9hejDbdGvJ7LeNSy2pVB8JL+SrSYz93BzGOt1DQQpP0W2e02PHZgN7xYkW
         k7LD9xYr8/YMiMkwwDpilEmlF5aW9dOHdSqllhyp+2hPaCtv9cE6jLh9OzBuWK1v1l1b
         AH8aF4ETs24guwgKtwqq3hfUcL4GfyOOFu84H7m05tOS3+hEMWRBknHZxHWd1W4sr1x5
         D2WPCAiJ77lK38cNUtc7OMnJUqmSQWa9gf+DWHm5HcMrWag3QlDaFTGdQ+vqWq4KblJ4
         Is1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780077183; x=1780681983;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nQlP12RUuBBVpXDhZ5MFD4U7SV/VrxoBlSj6jpPr0zk=;
        b=jBKPnrP5pPhjgMPj4+Co3OYrH+LbtrFEZ5Ar0ViWAQ/tB/ow8Gvjc6V79aN6M9BAKp
         PzM5dApizzDBoiX6GuUKK11lVjf1CiPx5kX7Fo4SneonslRsPXa6kJ5arPa5z8n5js04
         Cddr4dPY5dQsGrIBS85abhXbCsIo8wYWVYgoFWMBlZ0/6gLDguRRHtQt8lNqJsd/tRmP
         Dn0pxRvK40vYUdhbWDEHbB1cym1/YhegnG4y6JXzRddpPkTntVUFG4RPdZqPpCpjQXP8
         +zQuMKJ+pc/9wocD4Y5MkXJ3L3gwPhAE052hLCUAQGLJmilps66QNXayE5myiOQOvLIL
         X1ag==
X-Forwarded-Encrypted: i=1; AFNElJ/VU6YoR7AFFdBTpEvYMjB4rTSTWgHK/4FrHJk0Nd4VPsmJLHJYbs3hDrcydcDtFv47Zg0LRCyfknk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyTXtYbyvBssafdu+Ghn8wbJCh2Xi14LQJnbH3Ns6T6Al/IZ4b8
	QelWHiQy6J7zzNa8q9dSjTap/t512NMd5M5G1Hv0ynaHJkxNglbrjpmsPi/zzPaE6jMV6qNGmcL
	ih6S1Djz+MNUJgSJa0mnLqDCrmGWuhJ5IhRlq/v8r3g==
X-Gm-Gg: Acq92OE0Ja3e2gaNjvDGw/P78qJlzwJ5ki9GE5rF0B10foPqfi0qmtE+oX3AdzEjlO0
	T21IstGT2CqF6ZRVoPSfwfOrOIH+/HxXQvhWwODJ8t/H8IVAx7dGOWYn5H12QLsPraskiEvNfQs
	B219nYi8vrWQbYIUuIALL9wLWBWPG8ZKLSFLhUMgeLBKsLatAEPTYzHSzPzSXxr8A46vFT5OVG2
	aqtOtiJbNef7VcG61UH4ZQwZS60Fg4AXFC4EjuXBwYRRKF9978EpneTq/N1xVzGPdX3c2Bm+uq3
	p3Cs80ivmWfwyFu/719VlqWYfCusmXfSVN414WTuXZo+WavfqiTQmEIIBIz4aYzJToINObMaaXB
	k6ZVmMRZRseNL
X-Received: by 2002:a05:690c:4889:b0:7bd:696d:5125 with SMTP id
 00721157ae682-7e05e667c34mr3520927b3.45.1780077183450; Fri, 29 May 2026
 10:53:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260529140559.1775511-1-chenhuacai@loongson.cn> <CAFEAcA_Li+07XNfE+GpvZOzwJReqbG=x8nz=kMrQy5vqkReEUQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_Li+07XNfE+GpvZOzwJReqbG=x8nz=kMrQy5vqkReEUQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 May 2026 18:52:52 +0100
X-Gm-Features: AVHnY4LS92s05pVvblpyq47ntUKCqZ2eUi8mm8_vtxMxBa2zzOB6BhKc8oo4aFg
Message-ID: <CAFEAcA9-RixpW9Br1_3vhSsBY8KTwpcCMPar39pNX+c_vAPgrw@mail.gmail.com>
Subject: Re: [PATCH] fw_cfg: Add support for LoongArch architecture
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Gabriel Somlo <somlo@cmu.edu>, "Michael S . Tsirkin" <mst@redhat.com>, Huacai Chen <chenhuacai@kernel.org>, 
	qemu-devel@nongnu.org, loongarch@lists.linux.dev, 
	Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 29 May 2026 at 16:52, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 29 May 2026 at 15:42, Huacai Chen <chenhuacai@loongson.cn> wrote:
> >
> > Qemu fw_cfg support was missing for LoongArch, which made some functions
> > unusable in virtual machines. So add the missing LoongArch defines.
> >
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > ---
> >  drivers/firmware/Kconfig       | 2 +-
> >  drivers/firmware/qemu_fw_cfg.c | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
> > index bbd2155d8483..9ec747716389 100644
> > --- a/drivers/firmware/Kconfig
> > +++ b/drivers/firmware/Kconfig
> > @@ -121,7 +121,7 @@ config RASPBERRYPI_FIRMWARE
> >
> >  config FW_CFG_SYSFS
> >         tristate "QEMU fw_cfg device support in sysfs"
> > -       depends on SYSFS && (ARM || ARM64 || PARISC || PPC_PMAC || RISCV || SPARC || X86)
> > +       depends on SYSFS && (ARM || ARM64 || LOONGARCH || PARISC || PPC_PMAC || RISCV || SPARC || X86)
> >         depends on HAS_IOPORT_MAP
> >         default n
> >         help
> > diff --git a/drivers/firmware/qemu_fw_cfg.c b/drivers/firmware/qemu_fw_cfg.c
> > index 87a5421bc7d5..0c51a9df589f 100644
> > --- a/drivers/firmware/qemu_fw_cfg.c
> > +++ b/drivers/firmware/qemu_fw_cfg.c
> > @@ -211,7 +211,7 @@ static void fw_cfg_io_cleanup(void)
> >
> >  /* arch-specific ctrl & data register offsets are not available in ACPI, DT */
> >  #if !(defined(FW_CFG_CTRL_OFF) && defined(FW_CFG_DATA_OFF))
> > -# if (defined(CONFIG_ARM) || defined(CONFIG_ARM64) || defined(CONFIG_RISCV))
> > +# if (defined(CONFIG_ARM) || defined(CONFIG_ARM64) || defined(CONFIG_LOONGARCH) || defined(CONFIG_RISCV))
> >  #  define FW_CFG_CTRL_OFF 0x08
> >  #  define FW_CFG_DATA_OFF 0x00
> >  #  define FW_CFG_DMA_OFF 0x10
>
> On the QEMU specification side we could probably nail this down
> to "x86, sun, ppc, parisc have funny register layouts for
> legacy reasons and all others have the 8-bytes-apart layout",
> which might help to avoid having all this architecture-specific
> ifdeffery changing for each new architecture, if that's
> something people care about.

I sent this QEMU patchset proposing that (and cleaning
up some of the implementation to make it less likely that
we add fw_cfg to any new board types with different layouts
from the arm/riscv/loongarch "standard" one):

https://lore.kernel.org/qemu-devel/20260529174639.451353-1-peter.maydell@linaro.org/

-- PMM
