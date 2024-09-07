Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADF2145B0B
	for <loongarch@lists.linux.dev>; Sat,  7 Sep 2024 08:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725697120; cv=none; b=biSNNsBi9Wo0H6jfOMwYQFKXaSk9o+Vo9+2o/uK9sQ5LHLB99Nf9HpizI2a32Vfg4XOx/zx0mSqgmusM6tBXZ6Na1JyWiH1W/N6356lagwkdzq+TZQIcXQ5ZE+UtrolmgfVuKz/73r+adkcb7ERIVbOsxBQ2Ql89XgW49P8jr4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725697120; c=relaxed/simple;
	bh=G0ecZV3MYJG0NMMD2nY8I/zM982tZIc04oCMJMSXf4M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PeK0D3DKSN3R6v95ca1p5+PEgNS8d1c1MTmlIm56xisa/ZQVCuPm4VqITd9UkaqLJPfqhhxZrGIttk3MsOe/X7iwmWzerAphehKOHRSsOyyIyxpTfZ5Id6YDzYsd0UqZYE2435FMecfA/VSLecLXKz80Mb+y0kjMFVY1KvUhay8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hFgULsDk; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hFgULsDk"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a83597ce5beso451200866b.1
        for <loongarch@lists.linux.dev>; Sat, 07 Sep 2024 01:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725697117; x=1726301917; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ITEF1I8ktjsgdGr8HU561lKFX4loP7tyJC1Yx632Ah8=;
        b=hFgULsDkBGZz9ZUnRa/xwgHl6MbOaAblSEiepLVTIP/2eIr3jNYrRDZlzZOHlYy50K
         uGCPDT35w38JHizvW8yKH1Zn4+831v2jTxfVxxTSUD4Tzye6cXmZm08WBIdv17TiKAjY
         +wpT/Pnpl9LNlsFZRZYRVCyFhCdXAavLvd7xCVZUj6Q+tHZMe0y87i/jYksuHfs935gp
         6IqrbA/67yp2mjoyzba5nsQEJTnAbuxEl5IhFq2Z84tWB38dRk6kvInUStNVZB0OrpcI
         IV7tbTn+Dt6uQEUbVXuYR3JKv1lR2DiLBrvNKnMmZ+HsIwJ/yYL8Dsbl2daLwc/qSmkD
         w4dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725697117; x=1726301917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ITEF1I8ktjsgdGr8HU561lKFX4loP7tyJC1Yx632Ah8=;
        b=pN25bHrCu8VHyucvIgk5PH19znUxM8K+q8ZGz1NdbLSCTvWYEdn5ar3D6i99vX/+Bb
         mNOWsLaTifUN5lXkTSXGgStSIubgp6uVepk1hDfrh4ZiBVmrEqgo7+1VRIQzQcTT/qt+
         yMqzvhNAWuNrVoomQ2I2PxK7udhxKvFUrosYkYr5YNXIg5jAbn8mBRmrMFYqce/XNMbN
         9Wx3oa4zrkQZcJUcyKWjj3wXsGsKoCL6u8HSgBWiz87f1IC6uiXZ/h3QnFDOTRPnhxTO
         GKpViLbL3FkxvFfJYiJYePm7anwnGvtbnE+wBU2c70CDkj/x/08m5Iafi0yogeMF7LCA
         V4+g==
X-Forwarded-Encrypted: i=1; AJvYcCWmDqf/F8nGAHkHrrTirg1EcEOL69Mjc0vE1woZX7iiMQIc9uEa0h7isUB3YlPBvqqnAC05COzGdc8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwcFjMS7OY1oEX3YE84v0Sk99+AiTfiutBkCKJhfzb6AydA4jv2
	7fq47nMvqXPSyw2faW4i8ui2ZP0YmKDxiyxFQdEhnx3V8PKXNgGIG0QLXS8HJGjkpj4Ld72A2fu
	bshx2GY5eiczcyaqFxzxqyDd6jJo=
X-Google-Smtp-Source: AGHT+IGP5PwhM+mVTH7/JKuP6gDNSBqHTqVTfG4IvV7CKDqZhFoge7/zd4knhe1gYOteaPQa69oRbac983Yu6njcJAg=
X-Received: by 2002:a17:907:3ea0:b0:a86:b9c4:a439 with SMTP id
 a640c23a62f3a-a8a431c7209mr1316444266b.21.1725697116946; Sat, 07 Sep 2024
 01:18:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1725518229.git.zhoubinbin@loongson.cn> <282dadefdaac7917fd681a6e84a5f0f07d0557bc.1725518229.git.zhoubinbin@loongson.cn>
 <CAMuHMdVLErqWPDs27yeRc96Ly1ukds1-id1KNy=aWvNmffWicg@mail.gmail.com>
In-Reply-To: <CAMuHMdVLErqWPDs27yeRc96Ly1ukds1-id1KNy=aWvNmffWicg@mail.gmail.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Sat, 7 Sep 2024 14:18:24 +0600
Message-ID: <CAMpQs4LUNnE9do=PWMcFzBu9JNkOLjo+7UX+_Qk0J8vHvBqyQA@mail.gmail.com>
Subject: Re: [PATCH v1 08/10] ASoC: loongson: Add I2S controller driver as
 platform device
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Huacai Chen <chenhuacai@kernel.org>, 
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert:

Thanks for your reply.

On Fri, Sep 6, 2024 at 5:37=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Binbin,
>
> On Thu, Sep 5, 2024 at 9:07=E2=80=AFAM Binbin Zhou <zhoubinbin@loongson.c=
n> wrote:
> > The Loongson I2S controller exists not only in PCI form (LS7A bridge
> > chip), but also in platform device form (Loongson-2K1000 SoC).
> >
> > This patch adds support for platform device I2S controller.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
>
> Thanks for your patch!
>
> > --- a/sound/soc/loongson/Kconfig
> > +++ b/sound/soc/loongson/Kconfig
> > @@ -13,10 +13,20 @@ config SND_SOC_LOONGSON_I2S_PCI
> >           The controller is found in loongson bridge chips or SoCs,
> >           and work as a PCI device.
> >
> > +config SND_SOC_LOONGSON_I2S_PLATFORM
> > +       tristate "Loongson I2S controller as platform device"
>
> depends on LOONGARCH || COMPILE_TEST

This is will put under SND_SOC_LOONGSON_CARD.
>
> > +       select SND_SOC_GENERIC_DMAENGINE_PCM
> > +       help
> > +         Say Y or M if you want to add support for I2S driver for
> > +         Loongson I2S controller.
> > +
> > +         The controller work as a platform device, found in loongson
> > +         SoCs.
> > +
> >  config SND_SOC_LOONGSON_CARD
> >         tristate "Loongson Sound Card Driver"
> >         select SND_SOC_LOONGSON_I2S_PCI
> > -       depends on PCI
>
> "select SND_SOC_LOONGSON_I2S_PCI if PCI"?
>
> > +       select SND_SOC_LOONGSON_I2S_PLATFORM
>
> Or perhaps do it the other way around, i,e. let
> SND_SOC_LOONGSON_I2S_{PCI,PLATFORM} select SND_SOC_LOONGSON_CARD?
> That would be similar to SPI_LOONGSON_{PCI,PLATFORM}, which select
> SPI_LOONGSON_CORE.

Yes, it would be clearer. I'll modify it in the next version.

Thanks.
Binbin
>
> >         help
> >           Say Y or M if you want to add support for SoC audio using
> >           loongson I2S controller.
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
