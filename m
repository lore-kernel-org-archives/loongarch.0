Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F20146A89
	for <loongarch@lists.linux.dev>; Thu, 11 Apr 2024 11:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712833285; cv=none; b=CqiG5skxo1lBrqoeFDF3HEqIQUxwp8eIT0CvuqCsqow25QAYzwK8WG2pPGiXxE65RbG9s58taKYeFYw4wraAnCxSasoPSoAN2wdJVEexYTj5CUkyYVI1qQ5vZRUdxDSdT4d4E3vgdE8nGiOciDq9lcU573+23rvjYXhQK+m/gpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712833285; c=relaxed/simple;
	bh=8OX6q7MjpcHjZYu08W8z4DDKi4PUGuD09lBZHS7rTJ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oU7sYDzbt832xVVCxpcA0VF4Do0sL9d2IdQoaSlr0tl8K2FbydTsk/5UmJl1ByfgBeAZfG6cHURnNmEvEAHnFy6lqWfS40H12XJRTdKV+CohoEbUOqP8TVmrskU+b9d1WSaP2imwbWg1Lb/GiN7jSI79K9EvNbTEeyVY1VCX34I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KAUWtWcS; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KAUWtWcS"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-617f8a59a24so44022367b3.1
        for <loongarch@lists.linux.dev>; Thu, 11 Apr 2024 04:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712833283; x=1713438083; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XKl13NXA6/90N+K49Hi60xZmTzWhFtfft19m5BrkabY=;
        b=KAUWtWcSEYyim9qpbnU0MZLBfdS/8MgpqRYAyuUg4Pm1PgivmA/gNpzJMGoVnOpn+O
         O/c0Ca9W30hlwUz9ZSrDV9txXdpFFtH+4v5JQrMePt0EcVsk/f7B0LV6u+qZGImch73w
         2stgGunP/nlFndQKPDzH5jVUq7f+K8YXtIv3DmYOkXQw0MwtTddkVFlAeXHwjuuvIQ1y
         pPsM2Pbap2MnTPerwtgpPRmtFNR2dKNFf+iEYPtEXQIqlO4wmNOamx5eI+hPdNX+3m+n
         ulY4xGIu1jIlq511HCa+9xBkzMWqYNvrWS+juwf2UUguZKSzONqy2bewUbx+HtTO9E10
         xj8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712833283; x=1713438083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XKl13NXA6/90N+K49Hi60xZmTzWhFtfft19m5BrkabY=;
        b=dQ2nEnBW7+/s/lZGbHSKpsrZwMEJecKR4YdSTD3Gllc7xasD5JrF5jOdS5H48hIk4Z
         O7QKRybPUIvnGnjvu+lGJDtm2+Zbtts2ny6y2+7fK4WarFngllhOep8wOQ/rXL6qANJI
         DydVeExusfig8VLsFx22gvomy+RvXg36J0NWeW3i9sv4ESjuLjY0uG0svYPX1fWtsVmw
         D9hUymaWywnAaLDerKo3f25CUTTroPdjVMPSdgCWjFIl5vqu2lgHpzc+BRLzRjtLf007
         FNPpna8Et7y4Xoi6C4hs2DB557Q2/mISA2iINdv1lftf+64xpyQhBAzT8eqJrTgOafvK
         Dmnw==
X-Forwarded-Encrypted: i=1; AJvYcCUE8whiuAhXrqsOJBJjI8oIiPN6TvKWaTpzfVlgvWbQQE7+ODC7KXczmlyBW6NADY4z5pf4A9/JjxJ+E3LRiecKjuEBj4TbQ/Cs
X-Gm-Message-State: AOJu0Yz+l3QW+JStWnMlq4RS87kkzyHD5mhOjJkqw8KLJ1IGM760Ghry
	H9mGSU2Pxo3bO3dIj+XQb/uU+6h9wm8QhcKSTOIvLWB95cNbxXvSKGBelhFo+ckorN3ILVIVcfA
	+sGHOjowzj1MuzVAz5KecHpRcCMA=
X-Google-Smtp-Source: AGHT+IER1z7+nq7PONq6o6cpKiyuPF0b+9nOSg0EqvakXGhHGl8OP2Uf/deOlH4QwcJoas8+kUHx+9XfKrZv9dLHZg0=
X-Received: by 2002:a81:91d0:0:b0:615:3d71:b0ed with SMTP id
 i199-20020a8191d0000000b006153d71b0edmr5490699ywg.12.1712833283126; Thu, 11
 Apr 2024 04:01:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1712732719.git.zhoubinbin@loongson.cn> <38c234d548b4b9c334cda6e7664a803896b31f6f.1712732719.git.zhoubinbin@loongson.cn>
 <c1399191-6c6d-4eb4-b05b-f87a9f2b4152@linaro.org>
In-Reply-To: <c1399191-6c6d-4eb4-b05b-f87a9f2b4152@linaro.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Thu, 11 Apr 2024 17:01:10 +0600
Message-ID: <CAMpQs4JiLGJ-nBDmj1pe0SCqKeCnz5DrybJAKE8_6up293YNpw@mail.gmail.com>
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

On Thu, Apr 11, 2024 at 4:26=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 11/04/2024 11:16, Binbin Zhou wrote:
> > Add Loongson PWM controller binding with DT schema format using
> > json-schema.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
>
>
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
> > +    description:
> > +      The first cell must have a value of 0, which specifies the PWM o=
utput signal;
>
> If you have always the same value in PWM phandle, why encoding it in the
> phandle in the first place? What's the benefit of passing 0?

Hi Krzysztof:

My thoughts are:
First of all, our pwm has only one output signal, so it can only be 0.
Also, as you know from the pwm xlate function, the first cell is the
pwm index, so I fixed it to be 0 here.

The xlate function:
https://elixir.bootlin.com/linux/v6.8/source/drivers/pwm/core.c#L106

Thanks.
Binbin
>
> > +      The second cell is the period in nanoseconds;
> > +      The third cell flag supported by this binding is PWM_POLARITY_IN=
VERTED.
> > +    const: 3
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +
> > +additionalProperties: false
> > +
>
>
> Best regards,
> Krzysztof
>
