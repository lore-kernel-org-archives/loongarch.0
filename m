Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CAF4A0F
	for <loongarch@lists.linux.dev>; Thu, 11 Apr 2024 14:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712846140; cv=none; b=OZgLPfIzXa6sVZU27Iur0G7bLBBiq40nSai3BOm+oTmtaebfiY3IuytDaAlVd2h6EM7iyXxTmY1YY+1wenJ0a0t4cgf9Ah3hi4NjuN5x2ViOHsyMRdGA+kmVYnLJnUf5sT/eOyFqOvhgui9lGdnu4ygTYm/M6erWGnyilR8YAH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712846140; c=relaxed/simple;
	bh=y56pggh6v4u8JozsWax5N7kSFtvMWF/NKsPwxfg55Bo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d+sogYQby7fQVqttiof7krqWw/SUDeoJogHLwx/g6qyZ5cZtlHqrjKa+6V8gq96L1ggJPnGvzdygNahG6C9e2rGEu6x9cNCh5bNR2+fNfkJD5NnH5oB7N+8LRZztcV2xxUETOjciHehpXzr32an7qSkbrNga/Gy2Bce6RqopeJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XHbZAI0k; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XHbZAI0k"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-617e42a3f94so60172017b3.2
        for <loongarch@lists.linux.dev>; Thu, 11 Apr 2024 07:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712846137; x=1713450937; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S38Xw7GZvbXl2KyYUbvZmsZk8xa1F0iUzqS2DgFhfso=;
        b=XHbZAI0keJDwmLM2dhCqNEWNhD2Cl1Dbe7e4Sd7IIBCJt4sY9G3bNwjFtA5rqS9aTG
         6zAmw5C4GwEIuAqXfOLN4UKRJ0uUADPqWXchC7Qze0T8c4xQSoxjM/XApF1wzkPb9Jsm
         FRgB2zXDIkcblANW1Ia3TxCNjEi49fQEE2blkIuzcz1TsGzxoAPGvkERAevy4yQ7MgC/
         DZHe0dx8X8TDYyDidYS5Y+IDL/qviabgBVl5d40Smjdte6N21x/ZXygDQm7OEAOmnRkf
         c3sNt7pQwNoiGF/8o38TQYGKmOerbp5Tk2Xd4Z3TI3dP4Fs4IGN9//jX1rRXly5rgvVZ
         ha0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712846137; x=1713450937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S38Xw7GZvbXl2KyYUbvZmsZk8xa1F0iUzqS2DgFhfso=;
        b=Tj+wcyr6xSkm3U0NyTx7j75kxtwXscw2NgvwCW8kp1les2djXZJKWADbrb2vZk/GPA
         67nQEgoVOKHJchR3g4mhpgLabb+c/EPw3NWTrc5mbMfaWZKbkyOlyeDj91DnBXasWqVW
         eN0tnZ7STLIFcY6se5uI50fV5/tljJAbFR4cO5CvV786sdeSzxkpseNke3dzkZDep9v4
         6wZaIZDu8h+YNdjhORmDLJgWX3c8TyWVGiewKzBiEzEOZxiXDT8LepMCoysWyvFLPi2k
         E7iJ5j/i5riSD0I0pgluFGDyoBgg/0zOqUR3w5Kl0KhWfJfbXSP0u5f2SXmrkNp5rK9g
         Xe9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVvPnQo6AE3U6uGrp3GZXZcQu7ETOWAAeP2J+r0LBTS6McAUiQrpBQp4FtOPVf0lBUs/HO1a+N9bxH9rSAHrFKmfcjMvHtNEaBh
X-Gm-Message-State: AOJu0YwYWpQTDWeu+TbU2pCs/OJzwWpeQ3FKH1i/4bKBQCaJViMGNShq
	oaFcdsxAJLHke8ovhc0CCoVarDsJItN3jsJRRbF0tbj6H3UtG9viTTQBQGQYl7pNu2jgKJ6hyFH
	lUvQ7YDns+wJuxgosPeFDwqvIr+A=
X-Google-Smtp-Source: AGHT+IGWZrzsyPJUo3DLr0SbGCnVytTgEOhJLFnDzSDxwXe4EdkJ3WD6rLMcDII9/iga5WZXIJdZ/lR9EXlYKZdttzA=
X-Received: by 2002:a81:4907:0:b0:615:4653:1c11 with SMTP id
 w7-20020a814907000000b0061546531c11mr6336072ywa.12.1712846136880; Thu, 11 Apr
 2024 07:35:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1712732719.git.zhoubinbin@loongson.cn> <38c234d548b4b9c334cda6e7664a803896b31f6f.1712732719.git.zhoubinbin@loongson.cn>
 <c1399191-6c6d-4eb4-b05b-f87a9f2b4152@linaro.org> <CAMpQs4JiLGJ-nBDmj1pe0SCqKeCnz5DrybJAKE8_6up293YNpw@mail.gmail.com>
 <98d12a5e-e291-40f9-8334-3b5f53ed79a8@linaro.org>
In-Reply-To: <98d12a5e-e291-40f9-8334-3b5f53ed79a8@linaro.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Thu, 11 Apr 2024 22:35:25 +0800
Message-ID: <CAMpQs4KgzOjJe52BAhTb5P4t5ZynkW9AUEzPBkX_1h5XHuk5Ew@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pwm: Add Loongson PWM controller
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Juxin Gao <gaojuxin@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	loongson-kernel@lists.loongnix.cn, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2024 at 5:07=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 11/04/2024 13:01, Binbin Zhou wrote:
> > On Thu, Apr 11, 2024 at 4:26=E2=80=AFPM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 11/04/2024 11:16, Binbin Zhou wrote:
> >>> Add Loongson PWM controller binding with DT schema format using
> >>> json-schema.
> >>>
> >>> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> >>
> >>
> >>> +properties:
> >>> +  compatible:
> >>> +    oneOf:
> >>> +      - const: loongson,ls7a-pwm
> >>> +      - items:
> >>> +          - enum:
> >>> +              - loongson,ls2k0500-pwm
> >>> +              - loongson,ls2k1000-pwm
> >>> +              - loongson,ls2k2000-pwm
> >>> +          - const: loongson,ls7a-pwm
> >>> +
> >>> +  reg:
> >>> +    maxItems: 1
> >>> +
> >>> +  interrupts:
> >>> +    maxItems: 1
> >>> +
> >>> +  clocks:
> >>> +    maxItems: 1
> >>> +
> >>> +  '#pwm-cells':
> >>> +    description:
> >>> +      The first cell must have a value of 0, which specifies the PWM=
 output signal;
> >>
> >> If you have always the same value in PWM phandle, why encoding it in t=
he
> >> phandle in the first place? What's the benefit of passing 0?
> >
> > Hi Krzysztof:
> >
> > My thoughts are:
> > First of all, our pwm has only one output signal, so it can only be 0.
> > Also, as you know from the pwm xlate function, the first cell is the
> > pwm index, so I fixed it to be 0 here.
> >
> > The xlate function:
> > https://elixir.bootlin.com/linux/v6.8/source/drivers/pwm/core.c#L106
>
> You refer for xlate for PWM with three cells. You do not have three
> cells, as you have only on signal, so why insisting on using other
> xlate? Do you do the same for clocks? Or resets?
>
> I don't think you use appropriate argument in this discussion. We talk
> about hardware and your argument "I don't want to use my own xlate in
> the driver" is about driver.
>
Hi Krzysztof:

Thanks for your comments.

Emm... Indeed, I used to think about it from the driver's perspective.
From the binding perspective, two cells really should be more appropriate.
I try to make the following changes in the next version patchset:

  '#pwm-cells':
    description:
      The first cell is the period in nanoseconds;
      The second cell flag supported by this binding is PWM_POLARITY_INVERT=
ED.
    const: 2

Accordingly, the custom xlate function will be used in the driver.

Thanks.
Binbin
>
> Best regards,
> Krzysztof
>
