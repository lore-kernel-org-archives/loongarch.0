Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FB41C280
	for <loongarch@lists.linux.dev>; Wed,  3 Apr 2024 03:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712114230; cv=none; b=RpR55VD7R2Zm0uRX1O5wWan7F5R9niii82WQrvlErbQyYaWQf62OQyuZo5wmruYcmcB2Hxnd1Hm0XQYwWARbBz72XylnkreRgU/+411KNrtk/n8Wor4BVPCHO6PTzPi/t/PkpMEhrBImFEBOnmxOMyJ0TRCPa3JGO0vQRGmiy6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712114230; c=relaxed/simple;
	bh=yhQ+21CPCFYTMIUz2qCScIEhQV56wfigMKX3S42g66o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UBlEhfFMMixgkw2UcUEkWVaKMDvLUG6lyfS2bmvPu6UHtZRfm/an0c3rjiHcsPU5g1PXuVIYnBerCmKAucEbLIVjUNV9DJ/bi43w5CRpidHlOgCzaPBt9tj6tkTHKdFh/xtNQ3Dw5bZfG78XKH4aYYZez5Q1Y7p/EyjeBWvLqFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N23tilaF; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N23tilaF"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6147942ae1bso24138307b3.1
        for <loongarch@lists.linux.dev>; Tue, 02 Apr 2024 20:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712114227; x=1712719027; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxaRFGmx+WSsmKEhp791K8SdbyUX+9RouzVHok6AmNg=;
        b=N23tilaFhD69iBqS4bOEHQbIbA6053DZS32o6FBvQr8wt5BKAFfM8YfeT6JhcOJ0P1
         lwh0gzB0uSw111bR1NnKNi+D0xN921KVB0onGq7+fCqiKXEKm3dAEyEinWs7afFwQuad
         /mUxWIRPmr/Nmmz5IQU5CflV6HFSlPafRNKKXe6gx9o8VYC6EGjbu933EjKfMFwSWesU
         Odca6EuvsRUYRM4urNDk/Q9J+gq1+XzaqsXIpny+PesabXW58PKVNxWC1v7j7VhpRbj+
         ClFU2s71dnta/eiTgGLREOlVG9zqHw5EBiwnZW3sNXfkDx8e1lV4QeuG4693qSwTmwsr
         HSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712114227; x=1712719027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oxaRFGmx+WSsmKEhp791K8SdbyUX+9RouzVHok6AmNg=;
        b=OHZ1r/ye8fAmajHCPw/BHy315LXJ+P4Q8Gj1uldrb2AVqAq2ouRkq8ndLVQyXqpm3H
         +fJ7ClpchlfVMhH9aWRx7p4S7tRBr2iMTwOD8obGz9IfD/IjR/Akq0VuoOEHfwtowMCM
         lA51B8PsUW7cwhdEeCDMGXqiz2rNgpHKUGqoYddkPt4q1mkOrAju6GDWaigBhnbVZb/N
         YdsjVYOFXe+QeJgRv+j64fHFPiaCf6W+NRcktqp6AhRrI7oAcyG3OuU/HrQQ+mUWsFI2
         RSfY4ttCN4M53gduRoEWgss0R1gAj9EuYt8NCZJWZkgFSidbXRTYMCeaelNOhrRMpB64
         yp1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUDOvVHfFvjBPwfRa8k8Z0KJJNa9illhuSfPvb3BkQTuAEZ+UbL12pZ8L0H57xJgpfqx+GKadkQSHBTBiTyWSpRAUQy+KE5b1sO
X-Gm-Message-State: AOJu0YwGb+1148tY2fEOY0xRyrsw64LSflAC9mEd/bnhdLh7CYn0tMTX
	uyQeA9htm7HNHF9beWxNudCgIyUyi/mRHQwEoNqDMZnv+pyFz9TcsLc/p6mjdDSIDEye68Jb6fk
	RpqnZaxxLFqqgPqkwNID/VSTwykU=
X-Google-Smtp-Source: AGHT+IHWRC5LpLfu/wtnI0l/D2WZg+NDAOe9Kd128q9MD+uFGyISgzNo3A4sV+IzL6895DEl8uJ88vz2YXhGAdS5rNQ=
X-Received: by 2002:a0d:d544:0:b0:615:175f:ae2b with SMTP id
 x65-20020a0dd544000000b00615175fae2bmr1530729ywd.2.1712114227362; Tue, 02 Apr
 2024 20:17:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1711953223.git.zhoubinbin@loongson.cn> <edad2bb5b0045c633734c1499fb163c3c6776121.1711953223.git.zhoubinbin@loongson.cn>
 <20240402174051.GA324804-robh@kernel.org> <CAMpQs4K_VSqdm7x=cSyMTBYQyOm=th0YrYKdZ74dp35hyRBXgQ@mail.gmail.com>
In-Reply-To: <CAMpQs4K_VSqdm7x=cSyMTBYQyOm=th0YrYKdZ74dp35hyRBXgQ@mail.gmail.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 3 Apr 2024 09:16:54 +0600
Message-ID: <CAMpQs4Ks2DLoDEg=wT8Vpc9MrSTV4WQsvC9jHv9d5maVw8WsdA@mail.gmail.com>
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

On Wed, Apr 3, 2024 at 8:37=E2=80=AFAM Binbin Zhou <zhoubb.aaron@gmail.com>=
 wrote:
>
> Hi Rob:
>
> Thanks for your reply.
>
> On Tue, Apr 2, 2024 at 11:40=E2=80=AFPM Rob Herring <robh@kernel.org> wro=
te:
> >
> > On Tue, Apr 02, 2024 at 03:58:38PM +0800, Binbin Zhou wrote:
> > > Add Loongson PWM controller binding with DT schema format using
> > > json-schema.
> > >
> > > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > > ---
> > >  .../devicetree/bindings/pwm/pwm-loongson.yaml | 64 +++++++++++++++++=
++
> >
> > Filename should match compatible.
>
> Emm... How about renaming it as loongson, pwm.yaml?
>
> >
> > >  MAINTAINERS                                   |  6 ++
> > >  2 files changed, 70 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/pwm/pwm-loongso=
n.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/pwm/pwm-loongson.yaml =
b/Documentation/devicetree/bindings/pwm/pwm-loongson.yaml
> > > new file mode 100644
> > > index 000000000000..d25904468353
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/pwm/pwm-loongson.yaml
> > > @@ -0,0 +1,64 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/pwm/pwm-loongson.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Loongson PWM Controller
> > > +
> > > +maintainers:
> > > +  - Binbin Zhou <zhoubinbin@loongson.cn>
> > > +
> > > +description:
> > > +  It is the generic PWM framework driver for Loongson family.
> >
> > That's describing the driver. Not really relevant to the binding.
> >
> Ok ,I will rewrite this part.
>
> >
> > > +  Each PWM has one pulse width output signal and one pulse input
> > > +  signal to be measured.
> > > +  It can be found on Loongson-2K series cpus and Loongson LS7A bridg=
e chips.
> > > +
> > > +allOf:
> > > +  - $ref: pwm.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    oneOf:
> > > +      - const: loongson,ls7a-pwm
> > > +      - items:
> > > +          - enum:
> > > +              - loongson,ls2k0500-pwm
> > > +              - loongson,ls2k1000-pwm
> > > +              - loongson,ls2k2000-pwm
> > > +          - const: loongson,ls7a-pwm
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    maxItems: 1
> > > +
> > > +  '#pwm-cells':
> > > +    const: 3
> >
> > Please define what is in each cell. If there's only 2 signals, then the
> > first cell defines the output or input (what value for which one?).

Hi Rob:

Sorry, the previous email did not answer this question.
The first cell defines the output signal, and its value is 0.

Thanks.
Binbin
> >
> > Really, the PWM binding is only for outputs, so is a cell even needed? =
I
> > suppose we could use it for inputs too, but that's really "input
> > capture" type operation that timers often have. I'll defer to the PWM
> > maintainers...
>
> Ok, I will try to add some description about it.
>
> If I understand correctly, the meaning of each cell in "#pwm-cells"is
> determined.
> The first cell specifies the per-chip index of the PWM to use, the
> second cell is the period in nanoseconds and the third cell is the
> polarity.
>
> >
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - interrupts
> > > +  - clocks
> > > +  - '#pwm-cells'
> >
> > pwm.yaml makes this required already.
> >
> Yes, this is unnecessary. I will drop it in the next version.
>
> Thanks.
> Binbin
> > Rob
> >
