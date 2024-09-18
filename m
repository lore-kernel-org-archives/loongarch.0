Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9794160B8A
	for <loongarch@lists.linux.dev>; Wed, 18 Sep 2024 09:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726651503; cv=none; b=QIlufMCjM0pmSVpn8ESMsn5AeWbSa8iFJ+kP1zZrycAWn8nkwotnj92ES8Mu5ZS0+g8+uhhk13L7qjNMJmRWBCa2rG8nvlU8Dhi1o6pUXc0Ujli6OUh/iZQ7fbavDDurfZ+JWMYNV7n/LtsbbkLNzgrz5MtBO3d/1cPJhHX4g4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726651503; c=relaxed/simple;
	bh=4Ckold4mqnpEic1raVAIRpA5fsbkH1jkSKs6+3JSmfs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ln5fPGH/KLVhVYbHNgPfGkRv78rPQfqnCAZCb/t5QNhgZKLLgjIn3TfwQPOTIZ7SV8+Gm9VUIViKa9hrhEifdg8x+H272O7d5qMhhJPT5TZ8buW+I2s2e8Hl4wYWSSaPmknHiTCPOWN9KS87KfS08nhs7P+WiDdTDl2hOn0iMQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hX9oBZOk; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hX9oBZOk"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a8d3e662791so375993766b.1
        for <loongarch@lists.linux.dev>; Wed, 18 Sep 2024 02:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726651500; x=1727256300; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LkNDpY07V25JTDLmYMQ0N8Bt4Opex80DRrP8orE+KJk=;
        b=hX9oBZOk7YLpAhXAx8CrUcwDEuex+vzoVRR2FqagNzINVPYzdsAyUOgVKLT4zLfxmM
         31Jvzj1n9/qXH1pUqSywnrBzZqrPXAdiR3bDYqKXVX/w5JwysAl5bwgirtXWLnMsmweB
         xx8StF6pPgioE8yrhRnZGy6Tq5bB8ojPbZ3DGOUwzGMjWBJ5F+BCtXY9tO0lCynyxpvq
         70/OF32aFCIDliorI+btIrB1eXrIEUAkvriX2g0A4ta6wkPX/D+TD+6HrWwehmpT5u3b
         2KZsnmhAXDje7boMy+EH/BVnHTIPVp63SLWEGTqmbi1BCovX0XclON+wXLSvDLldWmFU
         aY8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726651500; x=1727256300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LkNDpY07V25JTDLmYMQ0N8Bt4Opex80DRrP8orE+KJk=;
        b=O0WEvd5EmRpb8Vp5nAXxREF+uYXWxBYcOlFP5efvNRbfy2X9uhKFPu52iCOnlp3xm1
         9P/kgza8JyEp8lgs3oxlj6d5k9KL3Aky/uHiIbrRevw/cNMaqZuMZ5a5awFNrwEzgelq
         oSm38HJtDQ6/XBqHBEQd0yJpjRzG3UAGkaToXCXKlneGghd/Yy6Twc7ShGAp3d+xISsu
         3NdwzYyth/aBoO1sfhvLrs6rHw0ONsQpvZu5N7/CeDdOSBp11Y9LTqiPLsQanv4X0kvv
         bXWmI8DKhQzXG59VbBnVshfm/nSwOW620dStO0V2Utpdb2gnxamM4Uesau23HgfwYsO1
         KEQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbDil8e5va0DlugHNPm1HrqCvFFXb5y1KuJWv7Dq9gXIwZoCN0NEmQuhsgS7wZvevDKrCF/pA+kCM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzya+9AwyGQcn7+o3U26h6tEsslyAeXw4J+s4beG+1Dm6lVuwNm
	RUeWu0kXxaoeqkRbnMNkSA6wmTn2xViWec59Y1JW6joGX2WmU90HMIfGabl8A+0UqVnDzAVwJSC
	NbA1nhn8AXeHeexpTUhPoMEWp9osVB3taaCs=
X-Google-Smtp-Source: AGHT+IELpoiFd0lCLB1yAYSsNv0EoCUJgRfKEMLoQxfu0an1ra0w4/nZbSMhzNKRAZncpaRhJTu+vGp40ilipQ7mj+Y=
X-Received: by 2002:a05:6402:2491:b0:5c3:d0b5:453f with SMTP id
 4fb4d7f45d1cf-5c41e18ad59mr26768552a12.12.1726651499548; Wed, 18 Sep 2024
 02:24:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1725518229.git.zhoubinbin@loongson.cn> <c44a6525d77941ef235825a58a9ea91f9f7d7042.1725518229.git.zhoubinbin@loongson.cn>
 <5a7357f7-da3b-4532-b055-ad33eb93fe1c@sirena.org.uk> <CAMpQs4JRz8x=zfB-DuDSxbcYDR=mtVET_AwawU+J9Vn=sx9LNw@mail.gmail.com>
 <eaa0b894-b4f7-4e4e-927d-216ff87e6f14@sirena.org.uk>
In-Reply-To: <eaa0b894-b4f7-4e4e-927d-216ff87e6f14@sirena.org.uk>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 18 Sep 2024 15:24:45 +0600
Message-ID: <CAMpQs4LwAJoyRn7tT9BpiGcDcWyHPG11ZCPWB+ku6uzGikGcBA@mail.gmail.com>
Subject: Re: [PATCH v1 02/10] ASoC: codecs: Add support for ES8323
To: Mark Brown <broonie@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Huacai Chen <chenhuacai@kernel.org>, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark:

Thanks for your explanation.

On Fri, Sep 13, 2024 at 10:44=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Fri, Sep 13, 2024 at 08:02:02AM +0600, Binbin Zhou wrote:
> > On Thu, Sep 5, 2024 at 8:05=E2=80=AFPM Mark Brown <broonie@kernel.org> =
wrote:
>
> > > > +/*
> > > > + * es8323 register cache
> > > > + * We can't read the es8323 register space when we
> > > > + * are using 2 wire for device control, so we cache them instead.
> > > > + */
> > > > +static u16 es8323_reg[] =3D {
> > > > +     0x06, 0x1C, 0xC3, 0xFC, /*  0 */
> > > > +     0xC0, 0x00, 0x00, 0x7C, /*  4 */
>
> > > There's a bunch of regmap reimplementation in the driver, the cache a=
nd
> > > I/O code all looks totally generic.  Just use regmap.
>
> > Sorry, I don't really understand this point.
> > Do you mean to use regmap_read()/regmap_write() instead of
> > snd_soc_component_read()/snd_soc_component_write()?
>
> > If so, are there any rules for using snd_soc_component_xxx()?
>
> No, it's fine to use the component wrappers if you happen to have a
> component to hand.  What's an issue is things like writing your own
> register cache code (the above bit is part of an open coded cache
> implementation), or I2C read/write functions if there's not something
> unusual with how the device does I/O.

Indeed, I misunderstood it before. As I understand it, we should use
regmap_config.reg_defaults instead of
snd_soc_component_driver.{read/write}.

Thanks.
Binbin
