Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B498F5C
	for <loongarch@lists.linux.dev>; Wed,  3 Apr 2024 02:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712111872; cv=none; b=KmhAksy47DlNAt/PHDuVgeaANzw2lAGi5h63Pa3IZlhnBcbSilfTgwFlGhdGZjeliXyrSM5aaXQPZ6vUaTuUYidQu2OgjblhJGXb88C9CysgB/+nuXV0JijUTKMV/vcqHuGLDXvcd7ZpVc332rCfdaHaUnE/VccIWwvEAac2y+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712111872; c=relaxed/simple;
	bh=gJVxYjMFmwjl5aNG+BlSPzbU83ksogmImwDLukwQbYE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PUPbYsYwiPDjywx0rYH4fWgGm9qbjkPR5016uDSKJVjoLo2T7SJdAXiezSOKBd3h7x4zM+h5c+FtrWGhW2oVDG0fAz/4n1cAKk3s4fGthbW+29cQ6qqZvnFHvsl+Y4MZ9Iy8UCuCT4KPq8LV2Tr6813/H1jIYnTny+YiZ4aE8Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=msFtEvqP; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="msFtEvqP"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-614b02f8ed6so4348797b3.0
        for <loongarch@lists.linux.dev>; Tue, 02 Apr 2024 19:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712111870; x=1712716670; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CdnReuXFQgbpvjXMlLm8sCCXtyCSbBMw0wNSZs3OhSQ=;
        b=msFtEvqPXhOS5M98xoKg0qVyfk0fbMUhXVa/nRBavrUn8eRFsWQVrA+ulX3Ie5GojT
         zF1PKNo7J0LNStjeqlx2Rcy4dn18Jjs6vfnKnR59c/dwEJZNBc6RRUHQP0rhq1HfXUuS
         Qhbu2fmMvsTQrmKp/8hm2g9QflEEvh77kb5UfuO3ti7uppkq0tZxgmsKGuLdssu/+Yi3
         LA25hHfq40unUTtiqZGruVSuDsQEL5jgB2SsMnD5miUuuoh7W8KazUyO/IQxVioCXUVx
         U1nSof/zsjhKJ3ThuRkYojHyJpSSUsgdI2Ytv4T6cNS53BukTzTvp2B5COQEJr2T9xdE
         /OYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712111870; x=1712716670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CdnReuXFQgbpvjXMlLm8sCCXtyCSbBMw0wNSZs3OhSQ=;
        b=bUOt4AlZ39S2l9/NNMtd7nrOuz8PA8FvoN4zY2cukvBoXRq1GadZGP1yURRx9d0X83
         X6/tL+6CpkuWhRvadY3T03t4Sv7umeyJPu8CeAdPgnrpz9l/4eCmd0vx6KZzJcqXk38g
         kEMurU5CpV9s9MJMIL8xh3SvZLnqEPXI64HYvKm1lnFzojx9tzqzi0QzVPztksTfEnfA
         krp+bYfRTARBUFE1LWMVrcrzN+7ZcJZ7QT5SQmprkfVDh8vruBSeq5AQdVMFws73Ubj8
         R5TLd6kqHj7ZtZcmrgsOo0JH8JGEdtSeGgsj3CIg0+VNA+MI9gp8CnGvl1O8b8VqZyMP
         74vg==
X-Forwarded-Encrypted: i=1; AJvYcCW84OTqOVWfAfpUp/PgolV8yDw76q1V6B4X8Y0QLkvh747/6ZOEvqEIl0S1vSJpB+Z5NaJ4oOAO5z6i5BmRFqDPl4Usl6dTd/IR
X-Gm-Message-State: AOJu0Yx9w6rw7AQiutOjK46PUuKLXRoZ26MrDu5OiGdCHqVbiMu2it8T
	QwBz3a8Na+X5ICE7Su8dN7aZxCld0aQ3WNo+7CWEn9+g6tMg2+AKL/VVEAOlN71/2cSHgsNuu9L
	3q8G6dPpDUn0ih9hvSnuuQHpzqoU=
X-Google-Smtp-Source: AGHT+IFBVvAU6OTdnHdu7Xw1/T4rdlSGlORrystxeqc3lRDY5KIqE/wyDmxucmLtXjkRwhJNY3QiZOSSfrDs5Zda0f4=
X-Received: by 2002:a81:5253:0:b0:615:1711:e9a1 with SMTP id
 g80-20020a815253000000b006151711e9a1mr1028812ywb.14.1712111869896; Tue, 02
 Apr 2024 19:37:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1711953223.git.zhoubinbin@loongson.cn> <edad2bb5b0045c633734c1499fb163c3c6776121.1711953223.git.zhoubinbin@loongson.cn>
 <20240402174051.GA324804-robh@kernel.org>
In-Reply-To: <20240402174051.GA324804-robh@kernel.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 3 Apr 2024 08:37:37 +0600
Message-ID: <CAMpQs4K_VSqdm7x=cSyMTBYQyOm=th0YrYKdZ74dp35hyRBXgQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] dt-bindings: pwm: Add Loongson PWM controller
To: Rob Herring <robh@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongson-kernel@lists.loongnix.cn, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob:

Thanks for your reply.

On Tue, Apr 2, 2024 at 11:40=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Tue, Apr 02, 2024 at 03:58:38PM +0800, Binbin Zhou wrote:
> > Add Loongson PWM controller binding with DT schema format using
> > json-schema.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  .../devicetree/bindings/pwm/pwm-loongson.yaml | 64 +++++++++++++++++++
>
> Filename should match compatible.

Emm... How about renaming it as loongson, pwm.yaml?

>
> >  MAINTAINERS                                   |  6 ++
> >  2 files changed, 70 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pwm/pwm-loongson.=
yaml
> >
> > diff --git a/Documentation/devicetree/bindings/pwm/pwm-loongson.yaml b/=
Documentation/devicetree/bindings/pwm/pwm-loongson.yaml
> > new file mode 100644
> > index 000000000000..d25904468353
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pwm/pwm-loongson.yaml
> > @@ -0,0 +1,64 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pwm/pwm-loongson.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Loongson PWM Controller
> > +
> > +maintainers:
> > +  - Binbin Zhou <zhoubinbin@loongson.cn>
> > +
> > +description:
> > +  It is the generic PWM framework driver for Loongson family.
>
> That's describing the driver. Not really relevant to the binding.
>
Ok ,I will rewrite this part.

>
> > +  Each PWM has one pulse width output signal and one pulse input
> > +  signal to be measured.
> > +  It can be found on Loongson-2K series cpus and Loongson LS7A bridge =
chips.
> > +
> > +allOf:
> > +  - $ref: pwm.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - const: loongson,ls7a-pwm
> > +      - items:
> > +          - enum:
> > +              - loongson,ls2k0500-pwm
> > +              - loongson,ls2k1000-pwm
> > +              - loongson,ls2k2000-pwm
> > +          - const: loongson,ls7a-pwm
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  '#pwm-cells':
> > +    const: 3
>
> Please define what is in each cell. If there's only 2 signals, then the
> first cell defines the output or input (what value for which one?).
>
> Really, the PWM binding is only for outputs, so is a cell even needed? I
> suppose we could use it for inputs too, but that's really "input
> capture" type operation that timers often have. I'll defer to the PWM
> maintainers...

Ok, I will try to add some description about it.

If I understand correctly, the meaning of each cell in "#pwm-cells"is
determined.
The first cell specifies the per-chip index of the PWM to use, the
second cell is the period in nanoseconds and the third cell is the
polarity.

>
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - '#pwm-cells'
>
> pwm.yaml makes this required already.
>
Yes, this is unnecessary. I will drop it in the next version.

Thanks.
Binbin
> Rob
>
