Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBB6D29E
	for <loongarch@lists.linux.dev>; Sat,  7 Sep 2024 08:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725697621; cv=none; b=GVG3zeXj0uw9/lW5DjMETdDixA1fMYPyzmxCR+lPIQ+I+kOIlGUMIzPQb6hy3YtQj7t48S8tkBHpJL90oq7FBLMlVLiKWLs6ymLGSDK4fSp9Z2rTAV8zPMb8s94WolAmNElkjQmh87jc3TNXFO4lQ5AVwLD+y9i+P8kSL2kpP3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725697621; c=relaxed/simple;
	bh=FYQ8VwUdwnULFKJxaP8IG3aHPu6C4xVkNHPGnNEz/TQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JITIrDZ5AgQdu+gfdfujdXR6pn9S7sJXWJt/b3gq06KovJmi4sXAQkiO3d45TvHVZnLJX8JOGF1IDDpue5p9X76A3nglZ33i+VB01gG1y3vRL3gJqqhvdoNAhpc4HpGYAcaHaJ0EG0c1nWqnVjCPy4RYW3Jz7wvYgPhsVgmLBbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OyMdeyYr; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OyMdeyYr"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f4f24263acso1154481fa.0
        for <loongarch@lists.linux.dev>; Sat, 07 Sep 2024 01:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725697618; x=1726302418; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VqyzkpHLHrWtDycv18ymB8QgfohFB/0/rJM4KU0imW4=;
        b=OyMdeyYrmej+PTmjTXChqhe+Yx3FyNKVfsXQ4I+DZ9MBwckBEDIjnvG26DrwQi7vyX
         ddpERomQTa4LATsyoy2edUvM7Z1WMF+dDwCdI5UCwhc/6znJzLDx3io2uQJmaBmTcFTv
         GmMRzitfIf9l4CL2q8YxjRlAy+M2tAUCn9OZIe45kFKVXPBjLLZ7DDG9n5as7Yt5DhPg
         KHNM47jLUHCnay0YF73mOsb5vhraYXxtTAsyDU1quv9bRUK6g+NOsv0/iQguoFf52a8b
         TfjmWzB7JZv/e/eo+S9UyE5dSQJw0RVj6mW8XaPCsQsVpevYfY3jFEjEFVM/A6OYmW2Y
         GhmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725697618; x=1726302418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VqyzkpHLHrWtDycv18ymB8QgfohFB/0/rJM4KU0imW4=;
        b=OCvusIOy0A+iSfJjgpcaFhVnUAZaY6IRm3s4xs3IJM/ISdu59ioVyKZrVlDFX5YvpO
         4PnYb4KO0IimSYgDYVtBbuhpsNgXbRVa/UTVVW/gKNLKV7e032M39xCONvbZnP47pPAy
         y3g31kZZy2Jvs/6SM01q+4VSDoW6b4qHPJv5xijOr+i7JAxOePvzEPGPytSpSE49e1KK
         BVX1OzXOB3kMgm23T8z99pI5Q4xOfzPin5o7GMkeYhK6ujNjY+45tXe63FYpWtZUPJfu
         lAiTVAh2Bx6XaI9E4pG9jDjH6MS4FrQP3ODoicqAYtA54614JTDGpTFKbab3z0GdVvj2
         bsCA==
X-Forwarded-Encrypted: i=1; AJvYcCVBo0rKtBKwJjnO6BOPAxxYmBQAzuOOY1ZfECWAVH+YA0/UxqpQmeOH3ddWRJe4jeprNhzYyCR/0ro=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/u75bEcfGezjigUm0oAL4ybq21KxsB9TGPJmVxlxbwvCS/Vvm
	csrdRu9cQPM8QEG2hh+AQMCO+NiGOPuNOIQTbtSQyXd3VbRqmsi+GE7rX9Z62443YcYOiQzZXkk
	+vOYhz3OpujU2fN/5YYWDKF2TxnQ=
X-Google-Smtp-Source: AGHT+IET3d9NRhbKeldMGFos0aLckCZuN7TRfuI0EgD71XrMV6VDi4eoRvEwgUlcnNyrnfDH+RE5Maj+e7OXvGYplkc=
X-Received: by 2002:a2e:9c95:0:b0:2f6:62a1:25ff with SMTP id
 38308e7fff4ca-2f75a99f825mr10427181fa.28.1725697617377; Sat, 07 Sep 2024
 01:26:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1725518229.git.zhoubinbin@loongson.cn> <ca09352c70c8e69d95dc085c8b479bec21560309.1725518229.git.zhoubinbin@loongson.cn>
 <2bel2spvqvuqyyvuv32wevxmf7tv6w336f7zfj3uq3wslwgr32@weiqjaqitqt5>
In-Reply-To: <2bel2spvqvuqyyvuv32wevxmf7tv6w336f7zfj3uq3wslwgr32@weiqjaqitqt5>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Sat, 7 Sep 2024 14:26:43 +0600
Message-ID: <CAMpQs4LO1hQpnQvVTqTs66F4J2rMGasfoszJKcDBgWkVvuVz4g@mail.gmail.com>
Subject: Re: [PATCH v1 07/10] ASoC: dt-bindings: Add Loongson I2S controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Huacai Chen <chenhuacai@kernel.org>, 
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof:

Thanks for your reply.

On Fri, Sep 6, 2024 at 4:23=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Thu, Sep 05, 2024 at 03:02:56PM +0800, Binbin Zhou wrote:
> > Add Loongson I2S controller binding with DT schema format using
> > json-schema.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  .../bindings/sound/loongson,ls2k-i2s.yaml     | 66 +++++++++++++++++++
> >  1 file changed, 66 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/loongson,ls=
2k-i2s.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/sound/loongson,ls2k-i2s.=
yaml b/Documentation/devicetree/bindings/sound/loongson,ls2k-i2s.yaml
> > new file mode 100644
> > index 000000000000..a2e3bbe00dab
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/loongson,ls2k-i2s.yaml
>
> Filename matching compatible.

I will rename it as loongson,ls2k1000-i2s.yaml
>
> > @@ -0,0 +1,66 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/loongson,ls2k-i2s.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Loongson-2K I2S controller
> > +
> > +maintainers:
> > +  - Binbin Zhou <zhoubinbin@loongson.cn>
> > +
> > +allOf:
> > +  - $ref: dai-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: loongson,ls2k1000-i2s
> > +
> > +  reg:
> > +    maxItems: 2
>
> List and describe items instead.

OK..
>
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  dmas:
> > +    maxItems: 2
> > +
> > +  dma-names:
> > +    items:
> > +      - const: tx
> > +      - const: rx
> > +
> > +  '#sound-dai-cells':
> > +    const: 0
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - dmas
> > +  - dma-names
> > +  - '#sound-dai-cells'
> > +
> > +additionalProperties: false
>
> Instead:
> unevaluatedProperties: false

OK...

Thanks.
Binbin
>
> Best regards,
> Krzysztof
>
