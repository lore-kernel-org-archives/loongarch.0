Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9722C18C
	for <loongarch@lists.linux.dev>; Thu, 26 Sep 2024 02:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727316252; cv=none; b=aeIpgOwaSHhMunFmsT5ztgupmNOBIIQ/VA78bP8+SEaQa7MckJ1KSHYqnEr6QJrtBLy2LNIfx9o4AkoafBfDKz14OZjT9tA6ONxiGv2EctJOuSzNx3RkxyxOc3HNJRinFD2diZDy4rlZuzTKVYCqi92trDHxNmmu7zS7ggohunA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727316252; c=relaxed/simple;
	bh=rnTEbCFDOfXQfDY6AbPrrjGrFyYYn0angyCoGJOYUws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=op937NKa5RtrC/4zcVDM9gqPi0Qro+1nuX5LlfJ+2X2WaYHhUVBadHf99BeLpm/EEsmF1+ix0MKVWOS5ixR4TA3y71lN8iOwbXUaIEz5cT3fEavge2oj85GfH3joR8x9KN9KpIjM27W+RXyb7+Xzpf4Dc2wT2sMzJrIk5aGPuwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hAZZxt33; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hAZZxt33"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5c42e7adbe0so350769a12.2
        for <loongarch@lists.linux.dev>; Wed, 25 Sep 2024 19:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727316249; x=1727921049; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uepY68ZxdZEGIoFno1fijjUOFz/iGyTi+j8yAIgrbRI=;
        b=hAZZxt338uXzpX+kPa53zaDazT1ghST+xfmG+eIdxwnLKbHxnJon4BY4cOlxyt7GBH
         W/hwkSj6Kl0IE3Lw44sHYGM87D67iTukvDZzMxCcdDcorh8jpEqScojEw1TqmufuOy02
         wqlHTEGb83hV3iwDwcpa71ZHLnlDmlvZGRoqH1PEqLnSCk0Q6hnx+nntmqnibombzZtA
         hsIAeLVhboYThWUExG8qRn9vp4ZOP9VkD6UbJtGJ2a4Lln4I70JJqnqD8+5QfjdTXi8F
         iA9Ui64eHG284skEDmB4BSPSJ+W0XNlXMkwIPPRKYo1Hwvu8ETqt9OEFbEsKGlLdVKRu
         nXXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727316249; x=1727921049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uepY68ZxdZEGIoFno1fijjUOFz/iGyTi+j8yAIgrbRI=;
        b=iXGs8tj1OvqX59QF6H7blUaN2BG0J8NWMUi+o+/01ZKfwUfd7yBSG1fYM/Xykk9Ksj
         R3bgvNXUKUE+qIb+kot8Vf/DNmLpiCVTRgsQs95LmYQBr6xDaJETlk77gywuMeA20VwR
         RSBRUMwUf0DsDTA73+SSQZlIWj50UBuRvZHNbgq42AEaKoAvZTNTBm6qlZ9baLjbnYEe
         n2rKeNIZdua+dFaX3iZrK7cpotPmwL2TYsl+MMcnLMy4AdoCb/LlqU3WGYOTvt7C4d8b
         7F5Wnn+7N6wf+MjL9M/s702Ka9r/JLxF/Ytsg6/M91vF/iCTuX+sVsOaKV8UFMLHmH+U
         /xkA==
X-Forwarded-Encrypted: i=1; AJvYcCUc0YA7tqRRsQdGRtvZVhx5dqrnECNi2QtwhRNWMXd7IVoZoE0oTX6hrsZhRDklqa050oiJk5Jjy3Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YwP+UxwJ9mzMPDUmJsdBM9T6beHl5X0YwaDbnIcfzzPUiXbyh3m
	nZ+2gH7gMvkhtk8rj5kY/dZgrtwWttcogMiwKAjyD5fABq088V4/UtzmxMmLUEq2AsOvxcVLE/+
	K3OiKguP/9QgBzNRTni7uC2uRAD4=
X-Google-Smtp-Source: AGHT+IF/KR6xfiJUHZTvUsIZhDO8sCqMLIEb2EKea2TOgeoogE/KiWFUQoO3906Czfj1LCNIJA3yZnmbbMqvgBY0WnU=
X-Received: by 2002:a05:6402:254a:b0:5c5:cf0b:b515 with SMTP id
 4fb4d7f45d1cf-5c72060a5bfmr3234419a12.1.1727316249172; Wed, 25 Sep 2024
 19:04:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1727056789.git.zhoubinbin@loongson.cn> <fd3989d15546502b47f580e6a2c3a59cb628ce93.1727056789.git.zhoubinbin@loongson.cn>
 <ZvKDBc2Kohx9kPfQ@finisterre.sirena.org.uk>
In-Reply-To: <ZvKDBc2Kohx9kPfQ@finisterre.sirena.org.uk>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Thu, 26 Sep 2024 08:03:55 +0600
Message-ID: <CAMpQs4+xP7wMSm4wgE97hnbmrS5oVtQTQWXNLvK=O+SkeZnEsw@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] ASoC: loongson: Add I2S controller driver as
 platform device
To: Mark Brown <broonie@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	Neil Armstrong <neil.armstrong@linaro.org>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Weidong Wang <wangweidong.a@awinic.com>, Prasad Kumpatla <quic_pkumpatl@quicinc.com>, 
	Herve Codina <herve.codina@bootlin.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Shuming Fan <shumingf@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark:

Thanks for your reply.

On Tue, Sep 24, 2024 at 3:14=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Tue, Sep 24, 2024 at 03:00:48PM +0800, Binbin Zhou wrote:
>
> >  config SND_SOC_LOONGSON_I2S_PCI
> >       tristate "Loongson I2S-PCI Device Driver"
> > -     select REGMAP_MMIO
> >       depends on PCI
> > +     select REGMAP_MMIO
> > +     select SND_SOC_LOONGSON_CARD
> >       help
> >         Say Y or M if you want to add support for I2S driver for
> >         Loongson I2S controller.
>
> You shouldn't select the card from the DAI drivers, some system might
> use the driver with a different card for some reason.  If anything a
> select from the card to the DAI driver is more appropriate, cards are
> the main user thing.

I will rewrite the dependency between the card and the DAI driver, as follo=
ws:

config SND_SOC_LOONGSON_CARD
        tristate "Loongson Sound Card Driver"
        depends on LOONGARCH || COMPILE_TEST
        select SND_SOC_LOONGSON_I2S_PCI if PCI
        select SND_SOC_LOONGSON_I2S_PLATFORM if OF

config SND_SOC_LOONGSON_I2S_PCI
        tristate "Loongson I2S-PCI Device Driver"
        select REGMAP_MMIO

config SND_SOC_LOONGSON_I2S_PLATFORM
        tristate "Loongson I2S controller as platform device"
        select REGMAP_MMIO
        select SND_SOC_GENERIC_DMAENGINE_PCM

Thanks.
Binbin
>
> > +++ b/sound/soc/loongson/loongson_i2s_plat.c
> > @@ -0,0 +1,186 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Loongson I2S controller master mode dirver(platform device)
>
> Please use C++ style for the whole comment block so things look more
> intentional.
