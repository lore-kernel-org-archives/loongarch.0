Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737741C9EC7
	for <loongarch@lists.linux.dev>; Fri,  6 Sep 2024 11:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725622637; cv=none; b=kZ8nZDtxyAZeTD0bxfiUzJzGMDRL0Gj4kHe37mINECnnByLGmiJ2OAzCSfFIZ8Mjy6cDNVcCeHWYLkguGglTjtV7UvAt/QQ1B3Y4F4BweR32XfcuWeu+vUoHXv7GNP7FwVcqz4pZfGmwPgaoBcMJz+vl+3+vO5Pk4k4yECNFZQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725622637; c=relaxed/simple;
	bh=lqxOlJQgWQl22rUCJh2s6jVJRGmlJQYQOFRPj2vMNII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EwRhyd4CBHL8lCOcInq2VrxemBVw+Ng7tpKlP+GnVfiv1s2MonAh9jVTFcn3ML+Teu+GJx0gemSIs7Pb+JgmvRl+SOUGox0OljttPoGpniotis4hUl5qGdrEXFj4xYhcYubmKi5+S7wDcwPDkwx5SRDZmgAZyHzU9Ip07k656cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e1a989bd17aso1999879276.1
        for <loongarch@lists.linux.dev>; Fri, 06 Sep 2024 04:37:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725622634; x=1726227434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kjnr2492P/BcID81zdCH2qFdKNtp4VQucHhzLNMBu9w=;
        b=eT0SNAgqrW35CxhQ/lcdssGOkspuB91gOdew44lIjwhCvVsCXQlYJmcVsoukqHlgKE
         SwGWUW0Lf4zBakrkhijFtW3QqGCIOetNYsgnNrI7SId6Z36XGOdG/5V8hXP6Zo8pjwJW
         +1p8soSJpz5v1h2eyfcZH8W1VduUinUaiWWkiCVRdANMi8FGGGmTN+p83f9uJClKxDaH
         +NxcBWlbYea9aYQB9+EEGLuat2cmRjR4Yo0Hyyr2ocXj9e2lPqjePSBrQgKZ4+hir9Ad
         2EaVSgX2+7DCJcfIJ5SQd2O6F3x4atHgvnQOdb/2L2PifMiLTQFicpEaImTsn3YgbM17
         O/7g==
X-Forwarded-Encrypted: i=1; AJvYcCVfgOs/G6Al1Vwhlo8VRFt3gVsSW9XkcQufL4KtT8/Orqh9FLsduqRWOYkYi0imsSIFjEurBd2Y36o=@lists.linux.dev
X-Gm-Message-State: AOJu0YxpYcHuFTxGM7K9Z9BDXY1ai1jDzCUPQrdtA1zhZ8Vyu5eCyodZ
	CBzyJQdyTsmrjuLrF0POeZXv3skwqR54ZmAFd87SSPXrzI+8cMQQqAvLxd5G
X-Google-Smtp-Source: AGHT+IHOV0zL4hmQbH/mEkNYf/DbBxuWswaIFYtCMPbi1gxCT5W+9Z7xW3J9vxmrqIj0z0FjVoTBuQ==
X-Received: by 2002:a05:6902:238a:b0:e1d:14d1:8624 with SMTP id 3f1490d57ef6-e1d34883063mr2605659276.19.1725622633986;
        Fri, 06 Sep 2024 04:37:13 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e1d41c94c65sm9656276.53.2024.09.06.04.37.13
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Sep 2024 04:37:13 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6daf46ee332so18843267b3.0
        for <loongarch@lists.linux.dev>; Fri, 06 Sep 2024 04:37:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUAZqIPHvTDJmrBieuKsbQJ5Pq03ernZang7Ws/Rk3GIa8arBqJyRusfK8XagcWH5gnKpA/AlGedDA=@lists.linux.dev
X-Received: by 2002:a05:690c:fd4:b0:62c:e939:2ffe with SMTP id
 00721157ae682-6db44d6c68fmr28000367b3.7.1725622633634; Fri, 06 Sep 2024
 04:37:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1725518229.git.zhoubinbin@loongson.cn> <282dadefdaac7917fd681a6e84a5f0f07d0557bc.1725518229.git.zhoubinbin@loongson.cn>
In-Reply-To: <282dadefdaac7917fd681a6e84a5f0f07d0557bc.1725518229.git.zhoubinbin@loongson.cn>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Sep 2024 13:37:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVLErqWPDs27yeRc96Ly1ukds1-id1KNy=aWvNmffWicg@mail.gmail.com>
Message-ID: <CAMuHMdVLErqWPDs27yeRc96Ly1ukds1-id1KNy=aWvNmffWicg@mail.gmail.com>
Subject: Re: [PATCH v1 08/10] ASoC: loongson: Add I2S controller driver as
 platform device
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Huacai Chen <chenhuacai@kernel.org>, 
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Binbin,

On Thu, Sep 5, 2024 at 9:07=E2=80=AFAM Binbin Zhou <zhoubinbin@loongson.cn>=
 wrote:
> The Loongson I2S controller exists not only in PCI form (LS7A bridge
> chip), but also in platform device form (Loongson-2K1000 SoC).
>
> This patch adds support for platform device I2S controller.
>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Thanks for your patch!

> --- a/sound/soc/loongson/Kconfig
> +++ b/sound/soc/loongson/Kconfig
> @@ -13,10 +13,20 @@ config SND_SOC_LOONGSON_I2S_PCI
>           The controller is found in loongson bridge chips or SoCs,
>           and work as a PCI device.
>
> +config SND_SOC_LOONGSON_I2S_PLATFORM
> +       tristate "Loongson I2S controller as platform device"

depends on LOONGARCH || COMPILE_TEST

> +       select SND_SOC_GENERIC_DMAENGINE_PCM
> +       help
> +         Say Y or M if you want to add support for I2S driver for
> +         Loongson I2S controller.
> +
> +         The controller work as a platform device, found in loongson
> +         SoCs.
> +
>  config SND_SOC_LOONGSON_CARD
>         tristate "Loongson Sound Card Driver"
>         select SND_SOC_LOONGSON_I2S_PCI
> -       depends on PCI

"select SND_SOC_LOONGSON_I2S_PCI if PCI"?

> +       select SND_SOC_LOONGSON_I2S_PLATFORM

Or perhaps do it the other way around, i,e. let
SND_SOC_LOONGSON_I2S_{PCI,PLATFORM} select SND_SOC_LOONGSON_CARD?
That would be similar to SPI_LOONGSON_{PCI,PLATFORM}, which select
SPI_LOONGSON_CORE.

>         help
>           Say Y or M if you want to add support for SoC audio using
>           loongson I2S controller.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
