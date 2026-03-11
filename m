Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C033563F4
	for <loongarch@lists.linux.dev>; Wed, 11 Mar 2026 08:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773217780; cv=pass; b=dS6OpzBb8ssgd3Zb4RTfXQFYGmS+Xhh5mvBggCF3vzpLVW4nTYg7CbataXdZzWGeEKjM8r5ELZ7GUibsq2QZ7xBdyIlJF79ovS+w3YYlEInOFJ9Kik31/qTmxD4yClgJj9p5buh9LZJOMRAh/+YKVXREFCzIKn/D2diQ3KwgAW4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773217780; c=relaxed/simple;
	bh=WpTM2bK03v+GeetS/yO9RyrJ2EbEhx/HhLsYsyaMS4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EmQnCxTRo2xYuqDXvHZ2LlxpoVDqpNzrIJAJQcnTMC7CKXEkBWwDh9K6LnXfemzrhD07ArO0KqRlLmjzHgn2qFy6fX8IZm8+EeIyzcgDI76k8YJdBzATB5Hohngoct5SEMKxGaNd1kqT5JLw9GOEQAFpR0GNs0D4EPCUIK6Ylsw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LM7F8iVL; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LM7F8iVL"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-661b08b04deso5532741a12.2
        for <loongarch@lists.linux.dev>; Wed, 11 Mar 2026 01:29:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773217774; cv=none;
        d=google.com; s=arc-20240605;
        b=HYVPa6NdGMO2R/zQzbHbEDNzaDPwTsImQWkZTMXi0nqL8oTVwhTxxcSNuetHFxFOia
         L1FAmiX66SgePWoy5lQknVmTY3eZJtnfCHqZ/WRpZfiyVQspNbTS2mSH/v5U9stsBh8q
         dAD2XxbIEshaFdiupjp9HQSBTaeqbwS3eIHnMZn3Z7lXmemEHtw1bA8rCs8RHldSVjBP
         JOiVFHzoCcTE6PerattTBkblnxAJQc4Vzay/u6cO1MOi6/ylWXpHIbvAvtZGropalbgZ
         6R7Gq83aNSxTfHRb/oLyDqZRFkUL1WH6lnLlsRepfT+dGtCFii684+tbWydBHO+RRDde
         6eJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YPFuevo92I9LbD3FU4d+etP0u9DGkGJOBwn9Rvp7Sj4=;
        fh=EjgO+Jlyx+y1rVVg71aj11gUmtTrn3y+V9fy/JBtRiM=;
        b=Gldz4Qca2wRe2MUzUE7/gCFQSd1Z5SrS8LsceJqzB4YawZuYZolHDFs/1pP2tyxujg
         Iq03XAyswEmZZEu352TyelKQvD7ZNak5LQ4CXuF2N/CQV5ffBQu6uLK2IHMTpVXhtiBj
         Raj1mFomhajEgV/u/fLz0CdrxcIr6DGtoKM22TJDozNl0Ifq655w/KHGLiFUWIXa3dFE
         8gkmcn33XM3bBPk39HK7UYdP+766sbQdvPGpe5XqsOZ3rgIbrIpgrb+lN0K8Y1yc1s89
         fXY34Pjk3jTPIH9rEZsXk5aXU5C0ZkwMiX/z5BUjj3vqQ2cfyA3J3UpdhfogSgWTh6Ef
         qB2A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773217774; x=1773822574; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPFuevo92I9LbD3FU4d+etP0u9DGkGJOBwn9Rvp7Sj4=;
        b=LM7F8iVL/CaHU6zn8ME7SU6DKT/ii+C7vqUFcgfaCFp5x0n9RcqAnttf6FxOggoUBz
         pU22BZm0IY1r0nuWGZYJanGcHqDxbK8ndeAGTBqLmlaxbQy2UQ1dz8S/4jF6rDAhaBrh
         iV3YSZq7i7TlA2zaORdttqEQjNtKqM0oq9fJGvOEqA3z8JWhoimUBcglrtBan6oMdwlk
         7vyixTu7Fl44LOHZlWKsTVsO0ql5ylNJQwodmLapYgPU6e6wtwW4Wg811vBWB4z72fHc
         wKoInd2egLMImAH89P8HWhFuDfhFZj2LvJGREYAvvWnAMk7qmdaBdbgcttjcRsDx6jG+
         qkXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773217774; x=1773822574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YPFuevo92I9LbD3FU4d+etP0u9DGkGJOBwn9Rvp7Sj4=;
        b=VbCvzSxGAHVutN0vNacD02asufQG9bs0pp1RUSKubj14q+K9w3kAmllBUDksuV+nMI
         Jn5mo1+Q+RBC89jt/2mtXmpsgWxz+Np3+oJ+TePqiMlXeHsJt5mLrueCUOVxcQZA37zZ
         xQvEWTd38dVaca74eUaJDzEjQjXLff5vtmV7jajYtzzGleO6eM9em+ASJAbAsvwTskzP
         cUKJDnapBTexBW2UhUjDHE2IYGtG47XXqh2bIJXuBDYsZlVODvNGM0suBKN0EjA3Rpqo
         8L+DFZKFhuPEqqjikbk3Ed4yVbcj8/QPryZ6drcMcAPyLav+UKE7bHqZQrwePSaOjdQJ
         Ifmg==
X-Forwarded-Encrypted: i=1; AJvYcCVDt6m+L3FGNgsT+9dq+4Fg2pIbqzfEOuzmB4Tem1Im3SXXOp4V5USKFq3NMutMok7HjUQfVRzoX0w=@lists.linux.dev
X-Gm-Message-State: AOJu0YypoFOmIRbvR5IEULPW/pvp7iFGkzRLDFoGLPgkeUKQWlQbmXU7
	sFuUeO6vWJRUA7Synargrde1ZSe9E1UKC595c34i817SyR/pGqxpBZkUQj3sbJfRbhHr6KrhWje
	ajs/xea4ARK3Y1hwS5I1Ib+ERGr/9YOo=
X-Gm-Gg: ATEYQzxQCusovnbe14JXd6z2WUSvL/ddM2vPCzvJb+7Alw9v3UB+4iXLn9rV/vlMLLd
	JgrYukLlpFYoDGEpQALEJhqFqRXsgepNYMas4ofi7Q5+js9Q0owMBlHKzprxCpZi9PCIQbf4Rfc
	VSG/CunatXcCZ8WxWugGbSA8Krj3+GLLUPfJPCmRXkVWzR9SmlQV3YGv5jQszeshitFPxCd73Ck
	zmjc+b1NFoo0mmnHSqGx6/30dldtNfYt1xmW+GRVGOY/zexwr0zJvFWI7yI6ORDGb4ybgg00YcQ
	Wrdsc3CobLkfgRwhBg==
X-Received: by 2002:a17:907:3e23:b0:b93:8460:4af with SMTP id
 a640c23a62f3a-b972e638494mr92203866b.56.1773217773738; Wed, 11 Mar 2026
 01:29:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1773107475.git.zhoubinbin@loongson.cn> <600bfea91c1f14f089b2f7677578cd8690412fac.1773107475.git.zhoubinbin@loongson.cn>
 <CAAhV-H6zg2MfO2HC1+Q-FE4CJJLh2+Boo=ZP57XYPfufvCBhkw@mail.gmail.com>
In-Reply-To: <CAAhV-H6zg2MfO2HC1+Q-FE4CJJLh2+Boo=ZP57XYPfufvCBhkw@mail.gmail.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 11 Mar 2026 16:29:21 +0800
X-Gm-Features: AaiRm52LMclNErp_XC41jPQYbAEz3jRj8zDpbY8eNCvPJgxQGExmtPVsZSonLDk
Message-ID: <CAMpQs4Ja_+B28p30dJYM0WU-scwgZSxLO9igvsXY+0dtbSxAGA@mail.gmail.com>
Subject: Re: [PATCH 5/6] ASoC: dt-bindings: loongson,ls2k1000-i2s: Document
 Loongson-2K0300 compatible
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Xuerui Wang <kernel@xen0n.name>, 
	loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 3:57=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> Hi, Binbin,
>
> On Wed, Mar 11, 2026 at 2:38=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.=
cn> wrote:
> >
> > Add "loongson,ls2k0300-i2s" dedicated compatible to represent the I2S
> > interface of the Loongson-2K0300 chip.
> >
> > The hardware integration of the Loongson-2K0300 I2S interface differs
> > significantly from that of the Loongson-2K1000. Specifically, while bot=
h
> > utilize external DMA controllers, the Loongson-2K0300 configures DMA
> > channel routing via the `dmas` property, whereas the Loongson-2K1000
> > requires additional register.
> Can this patch be the second one?

Typically, I place the dt-binding patch before the new platform driver
patches, while patch 2-4 involve code cleanup for existing drivers.
Therefore, I prefer to position this patch after them.
>
> Huacai
>
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  .../bindings/sound/loongson,ls2k1000-i2s.yaml | 22 ++++++++++++++++++-
> >  1 file changed, 21 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/loongson,ls2k1000-=
i2s.yaml b/Documentation/devicetree/bindings/sound/loongson,ls2k1000-i2s.ya=
ml
> > index da79510bb2d9..51e23c189f7a 100644
> > --- a/Documentation/devicetree/bindings/sound/loongson,ls2k1000-i2s.yam=
l
> > +++ b/Documentation/devicetree/bindings/sound/loongson,ls2k1000-i2s.yam=
l
> > @@ -14,9 +14,12 @@ allOf:
> >
> >  properties:
> >    compatible:
> > -    const: loongson,ls2k1000-i2s
> > +    enum:
> > +      - loongson,ls2k0300-i2s
> > +      - loongson,ls2k1000-i2s
> >
> >    reg:
> > +    minItems: 1
> >      items:
> >        - description: Loongson I2S controller Registers.
> >        - description: APB DMA config register for Loongson I2S controll=
er.
> > @@ -49,6 +52,23 @@ required:
> >
> >  unevaluatedProperties: false
> >
> > +if:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        enum:
> > +          - loongson,ls2k1000-i2s
> > +
> > +then:
> > +  properties:
> > +    reg:
> > +      minItems: 2
> > +
> > +else:
> > +  properties:
> > +    reg:
> > +      maxItems: 1
> > +
> >  examples:
> >    - |
> >      #include <dt-bindings/clock/loongson,ls2k-clk.h>
> > --
> > 2.52.0
> >

--
Thanks.
Binbin
