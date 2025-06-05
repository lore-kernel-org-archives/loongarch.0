Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE01C7E110
	for <loongarch@lists.linux.dev>; Thu,  5 Jun 2025 03:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749092624; cv=none; b=EwByAsEJ1nnB2735aWuKrjQHcVcyipvY/RfBtufCPcyvaRC7SsqpJWqY9dAGBMZDX9dI7/q8nFQ0/B6IDCaGDg/Vm/s9U1DA43M10yve2Ve6xlz7Fj5YpqjuTem06ideenIK5kGYLmUwOplhmeNkIwDiito8KLMvI59CWCGsMaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749092624; c=relaxed/simple;
	bh=7khZwdE7hBbUhIpRjfQLJdOyp+TlX1pmOvgRjH9YJXM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pjoD5rXO/yGJbNWl639sSaIVci2BQiM2uiDNzvDD1p/DkYzizmGJLGT7siU3NTXdSdWiLvQHZGrQ13DN3tjZG2OIGXYeaGrkUJa4eFuKkuOiQvMwaMf89+Havso1jcFOBNNchDHspREP8jkrp44sCwpu/XgEfwGleHb3fQfr0ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LI/U9xKs; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LI/U9xKs"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6020ff8d54bso747943a12.2
        for <loongarch@lists.linux.dev>; Wed, 04 Jun 2025 20:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749092621; x=1749697421; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=voKhAbgrcXm8mkXGW8nWXWOPo8BU4qMPnZBEd4pfud0=;
        b=LI/U9xKsldsA25MgI2Lm1x51Mg9uDflWlSR2LaBEKxBJlu8dWSAPcJnWdXWNp8Hmg3
         TpzVi5ABt/UQxbcM6vk96GAg8JAPZ/iDKpDBqfrkplPATj9cQerJYU6yW4tQTO6AgFNd
         8aI8I4y7fZUPRQF3nkxAqcWnQvDzVbWIQU4kx+loYKzNHJCpAOS79IX6i1REXchC4ZE+
         Ow2FvEe84FqrgEIblxZjXGO/irwMvV7AyGcLqZCjfb+aGKekuAqvpbPEqLqDJqEXDIT6
         oftMpYkMbC0+ZmhaejRPfQtrZ20IO7kfZiI0rStozcClsfAvvbw9UTD+YarXSAOuuKeJ
         8ALA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749092621; x=1749697421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=voKhAbgrcXm8mkXGW8nWXWOPo8BU4qMPnZBEd4pfud0=;
        b=fYE8NrhoMPoGUpgmYmkzdJ3FviiCmOjBQPJAPEzzUVCOUIaCSiY9T7JDMFCFJxIp1o
         A8D3Tb2aQTPkKQahoDpdRhUUh4K8ctLynlLDuk7r1PHLPo1RbDhzqCD0wqC2K3a2DKpi
         RJgH8y6VOckLkhGWcDReANQSSJmguscShmGUor0HHpwSgQco+R7Hfk9dbqnnLxHzBqRW
         iB8YRbRXH+W2AsTmn1gyYqRVkQXSXdkGn29bRQoVvUUVJpMakkcS6lTsAFTCISiH5tHg
         lhTocs1qy7shpcWHjDx8eDx7hAxtQUWmvp5gqL8D1GFayv/z+7wRtymD4b/JMHxXpSnQ
         Z62A==
X-Forwarded-Encrypted: i=1; AJvYcCWVBhAKck6wD7Y6FxAcoEAIcGXfaLzvyajf0SwenI1CzMEoD6kyaVqD4PE+HTn0GGT6K+YUCxo34TA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyUCpZ4MhmBWOnl5vCFo1TudxFoDlI4/lIoNVYungo1UaJDRs5f
	0U+BDxIVj+rnD1PR7/Bl8czbMQMh0kUh/Vl7GFV8UxqmgaPDj1EDWnuhC2elWSlNMylWgKL18AO
	k0Qpkbnua69+kyEopMs7YpAlwjbaU0aQ=
X-Gm-Gg: ASbGncuGu0IUgr+Y2f9gycN2A+N5jxmuHLtEYVqx/3bgNg+DZcBfsGfJIPdtIfy9csS
	FLek3ZzbSp6hMgHLCmNMhj5q8Ro4ZCH+ZTVoUkOq0Dy+l8aX+jhQ9RBCAoN6pKIre9LbGWvbugS
	V/U9nNzZbsJCStfwkRiD5GbZjH8ENBkxUD
X-Google-Smtp-Source: AGHT+IFOO6StkM0IAqHmVPeC0pasgrjZRt18m8ZM47Xa2afLr6FMLU95O24gk0y2c263N5XAsUJyVEaAEAeaPIVk7As=
X-Received: by 2002:a17:907:6d28:b0:adb:449c:7621 with SMTP id
 a640c23a62f3a-addf8e7ea4cmr540699366b.29.1749092621041; Wed, 04 Jun 2025
 20:03:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1746581751.git.zhoubinbin@loongson.cn> <1308b6ca9ffc2674cc0f089cfd163da87e53a8cd.1746581751.git.zhoubinbin@loongson.cn>
 <CAPDyKFouNpdnQSXBxRmKhECyojrT_TkCpgg01GHbzQpuYFvEZg@mail.gmail.com>
In-Reply-To: <CAPDyKFouNpdnQSXBxRmKhECyojrT_TkCpgg01GHbzQpuYFvEZg@mail.gmail.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Thu, 5 Jun 2025 11:03:28 +0800
X-Gm-Features: AX0GCFsyTcAFRf1n8zcXVDtGZMbNr_eXrzE1FjqIUCdZXqVP92KbfJ9GX93iKyg
Message-ID: <CAMpQs4KQHHiJZFXhz2hgxv6qMA+CCEqQpZkug2JL35FBj+iEYA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] mmc: loongson2: Add Loongson-2K SD/SDIO controller driver
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ulf:

Sorry for the late reply.

On Mon, May 19, 2025 at 7:03=E2=80=AFPM Ulf Hansson <ulf.hansson@linaro.org=
> wrote:
>
> On Wed, 7 May 2025 at 09:28, Binbin Zhou <zhoubinbin@loongson.cn> wrote:
> >
> > The MMC controllers on the Loongson-2K series CPUs are similar,
> > except for the interface characteristics and the use of DMA controllers=
.
> >
> > This patch describes the MMC controllers on the Loongson-2K0500/2K1000,
> > with the distinguishing feature being the use of an externally shared
> > APBDMA engine.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
>
> [...]
>
> > +
> > +static void loongson2_mmc_set_ios(struct mmc_host *mmc, struct mmc_ios=
 *ios)
> > +{
> > +       struct loongson2_mmc_host *host =3D mmc_priv(mmc);
>
> As we now have support for regulators, we should use them here too.
>
> Some something along the lines of this at MMC_POWER_OFF:
> if (!IS_ERR(mmc->supply.vmmc))
>       mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, 0);
>
> and at MMC_POWER_UP:
> if (!IS_ERR(mmc->supply.vmmc))
>       mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, ios->vdd);
>
> > +
> > +       switch (ios->power_mode) {
> > +       case MMC_POWER_ON:
>
> Is the fallthrough really what we want here?
>
> MMC_POWER_ON is used quite frequently when changing various ios
> settings when the core calls mmc_set_ios(). MMC_POWER_UP is set only
> once in mmc_power_up().

Indeed, this has been handled too roughly here. I will try to
subdivide each case and add regulator support.
>
> > +       case MMC_POWER_UP:
> > +               regmap_write(host->regmap, LOONGSON2_MMC_REG_CTL, LOONG=
SON2_MMC_CTL_RESET);
> > +               mdelay(10);
> > +               regmap_write(host->regmap, LOONGSON2_MMC_REG_CTL, LOONG=
SON2_MMC_CTL_EXTCLK);
> > +               regmap_write(host->regmap, LOONGSON2_MMC_REG_INT, LOONG=
SON2_MMC_IEN_ALL);
> > +               regmap_write(host->regmap, LOONGSON2_MMC_REG_IEN, LOONG=
SON2_MMC_INT_CLEAR);
> > +               break;
> > +       case MMC_POWER_OFF:
> > +               regmap_update_bits(host->regmap, LOONGSON2_MMC_REG_CTL,
> > +                                  LOONGSON2_MMC_CTL_RESET, LOONGSON2_M=
MC_CTL_RESET);
> > +               return;
> > +       default:
> > +               return;
> > +       }
> > +
> > +       loongson2_mmc_set_clk(host, ios);
> > +
> > +       host->bus_width =3D ios->bus_width;
> > +}
> > +
>
> [...]
>
> > +
> > +static void loongson2_mmc_enable_sdio_irq(struct mmc_host *mmc, int en=
able)
> > +{
> > +       struct loongson2_mmc_host *host =3D mmc_priv(mmc);
> > +
> > +       regmap_update_bits(host->regmap, LOONGSON2_MMC_REG_IEN,
> > +                          LOONGSON2_MMC_INT_SDIOIRQ, enable);
> > +}
> > +
> > +static struct mmc_host_ops loongson2_mmc_ops =3D {
> > +       .request        =3D loongson2_mmc_request,
> > +       .set_ios        =3D loongson2_mmc_set_ios,
> > +       .get_ro         =3D mmc_gpio_get_ro,
> > +       .get_cd         =3D mmc_gpio_get_cd,
> > +       .enable_sdio_irq =3D loongson2_mmc_enable_sdio_irq,
>
> The ->ack_sdio_irq() callback needs to be implemented too.
>
> Moreover we need to set MMC_CAP2_SDIO_IRQ_NOTHREAD.

OK..
>
> [...]
>
> Kind regards
> Uffe



--=20
Thanks.
Binbin
