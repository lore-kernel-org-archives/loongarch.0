Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B9265F
	for <loongarch@lists.linux.dev>; Wed,  1 Nov 2023 01:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PqpB6m/3"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-d9a6399cf78so424558276.0
        for <loongarch@lists.linux.dev>; Tue, 31 Oct 2023 18:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698802943; x=1699407743; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EqP28swEoFqFBpOsPvURB6Dcv19Cyas9Sj5n5k9cRsM=;
        b=PqpB6m/3JfjxiphbCzLsMhcoxJZsm0Ii9d3+9JMaogC3kmO/hRbOuBnq2TyV1SgzUb
         B5tSjza6G0hax/bNNyEd70QKknX83DeAqpZnkhDd7sEewr512uVkzt/BWV5ocNyWjjkd
         Bt6S39Mi17mEViggBlW/a25o0PPEclWTLu2bHhCih0WOkQYLkjkoGftysKMDWujqKDKV
         eqXFpjhLWvv83M5/LAUaQegqp3SglOV94fLWR0SxQR5aVeJE8wSM+j9TLgflIFuZTwep
         u65QNVYHKvYPU4dkj8KOpvLYZ4gv/TlcuptQgA1+seZCvD4NDuXz5CwPxrDTZ0QbQyps
         dwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698802943; x=1699407743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EqP28swEoFqFBpOsPvURB6Dcv19Cyas9Sj5n5k9cRsM=;
        b=u3DTurddwMkawXE+fy8QAY38Z+RQPMB14aIPB7sSPSR8PfeGATLmLOhWfwMgatoPR2
         9dk1Kla0jteGyEt3CkNv1Vxbjo5VHTia14xiVSD44LNAwDxr1TidCxO2tSAoV/qU06al
         EKEaAZIGfJqRkmdMp+zC1Op1Pqe3rnfIXOXM4iiZKEcWhoG4k7t16FAEDuD1umclGhdo
         V2hu0ZBLSf9bDYMxOrzOjNhwQmbr/S9N/CPOwj+1fXXyPaW4LtAqEsuZ9cFZBAS5E0WZ
         4hJ8LfXvnNjsozP+84HNa6LFTMQod6lPQtZxsWQwBIuWk0AWsz6GvXv0WKlN2/0ADT/5
         iLxQ==
X-Gm-Message-State: AOJu0YyEtsetspzWtAIY+jVuz0d6CIjkf3Ytxl4Ug72URmLf2TQquUZa
	erjQ/Fn3Ctyf9Oer5N9gEMSPbPiIsca2SRyzU5s=
X-Google-Smtp-Source: AGHT+IFa2JpmHdGFDcAM1sUzLsses6Qgyt8fsVsUd3nY2L/J+jzVc7x7mSCYmF8QOruW6ygQIYO6W7vsbej/b/cnyd4=
X-Received: by 2002:a25:9307:0:b0:da0:7fe0:dc6 with SMTP id
 f7-20020a259307000000b00da07fe00dc6mr3496481ybo.14.1698802942978; Tue, 31 Oct
 2023 18:42:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1698717154.git.zhoubinbin@loongson.cn> <fd5efc8a21b94e044e4e225255655fc92beb0c63.1698717154.git.zhoubinbin@loongson.cn>
 <20231031175205.GA1803813-robh@kernel.org>
In-Reply-To: <20231031175205.GA1803813-robh@kernel.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 1 Nov 2023 07:42:11 +0600
Message-ID: <CAMpQs4+4bSKC+nUGoD=HpwcSfQ7AUZWm-N_moRZN7kc_q_SrAQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: interrupt-controller:
 loongson,liointc: Fix dtbs_check warning for reg-names
To: Rob Herring <robh@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongson-kernel@lists.loongnix.cn, 
	devicetree@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, lvjianmin@loongson.cn, 
	WANG Xuerui <git@xen0n.name>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 31, 2023 at 11:52=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Tue, Oct 31, 2023 at 10:36:37AM +0800, Binbin Zhou wrote:
> > As we know, the Loongson-2K0500 is a single-core CPU, and the
> > core1-related register (isr1) does not exist, and we need a separate
> > declaration.
> >
> > This fixes dtbs_check warning:
> >
> > DTC_CHK arch/loongarch/boot/dts/loongson-2k0500-ref.dtb
> > arch/loongarch/boot/dts/loongson-2k0500-ref.dtb: interrupt-controller@1=
fe11400: reg-names: ['main', 'isr0'] is too short
> >         From schema: Documentation/devicetree/bindings/interrupt-contro=
ller/loongson,liointc.yaml
> > arch/loongarch/boot/dts/loongson-2k0500-ref.dtb: interrupt-controller@1=
fe11400: Unevaluated properties are not allowed ('reg-names' was unexpected=
)
> >         From schema: Documentation/devicetree/bindings/interrupt-contro=
ller/loongson,liointc.yaml
> > arch/loongarch/boot/dts/loongson-2k0500-ref.dtb: interrupt-controller@1=
fe11400: reg: [[0, 534844416, 0, 64], [0, 534843456, 0, 8]] is too short
> >         From schema: Documentation/devicetree/bindings/interrupt-contro=
ller/loongson,liointc.yaml
> > arch/loongarch/boot/dts/loongson-2k0500-ref.dtb: interrupt-controller@1=
fe11440: reg-names: ['main', 'isr0'] is too short
> >         From schema: Documentation/devicetree/bindings/interrupt-contro=
ller/loongson,liointc.yaml
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  .../loongson,liointc.yaml                     | 22 ++++++++++++++-----
> >  1 file changed, 16 insertions(+), 6 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/loo=
ngson,liointc.yaml b/Documentation/devicetree/bindings/interrupt-controller=
/loongson,liointc.yaml
> > index 0d9511b8a792..7393d7dfbe82 100644
> > --- a/Documentation/devicetree/bindings/interrupt-controller/loongson,l=
iointc.yaml
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,l=
iointc.yaml
> > @@ -11,8 +11,13 @@ maintainers:
> >
> >  description: |
> >    This interrupt controller is found in the Loongson-3 family of chips=
 and
> > -  Loongson-2K1000 chip, as the primary package interrupt controller wh=
ich
> > +  Loongson-2K series chips, as the primary package interrupt controlle=
r which
> >    can route local I/O interrupt to interrupt lines of cores.
> > +  Be aware of the following points.
> > +  1.The Loongson-2K0500 is a single core CPU, the isr1 register could =
not be defined;
> > +  2.The Loongson-2K0500/2K1000 has 64 device interrupt sources as inpu=
ts, so we
> > +    need to define two nodes in dts{i} to describe the "0-31" and "32-=
61" interrupt
> > +    sources respectively.
> >
> >  allOf:
> >    - $ref: /schemas/interrupt-controller.yaml#
> > @@ -29,10 +34,14 @@ properties:
> >      maxItems: 3
> >
> >    reg-names:
> > -    items:
> > -      - const: main
> > -      - const: isr0
> > -      - const: isr1
> > +    oneOf:
> > +      - items:
> > +          - const: main
> > +          - const: isr0
> > +      - items:
> > +          - const: main
> > +          - const: isr0
> > +          - const: isr1
>
> Just adding 'minItems: 2' accomplishes the same thing without
> duplicating the list.

OK, I will do it.

Thanks.
Binbin
>
> >
> >    interrupt-controller: true
> >
> > @@ -94,7 +103,8 @@ if:
> >  then:
> >    properties:
> >      reg:
> > -      minItems: 3
> > +      minItems: 2
> > +      maxItems: 3
> >
> >    required:
> >      - reg-names
> > --
> > 2.39.3
> >
