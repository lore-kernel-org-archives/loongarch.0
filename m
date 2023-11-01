Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF5E10EE
	for <loongarch@lists.linux.dev>; Wed,  1 Nov 2023 02:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l4xG13yH"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-d9beb863816so5929617276.1
        for <loongarch@lists.linux.dev>; Tue, 31 Oct 2023 19:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698804358; x=1699409158; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cEKlb9+ZY0B9mrv/T98IQK90StjaDbNde8cN8esmJ2I=;
        b=l4xG13yHML+FK25xt7JZYPPBWjl6zbmXV2CJgnSM7e9LxR6FhERF4jz/8xqXhuOrpc
         njJH/ZkE3qlwlmJePapvmGbtUjFOGMESm2Pq5OkIzuEKSDKkZG6kcWx1Od1wI/+hOwL8
         nBL0aBV269t2Yc7LzmhgP2FnUAcH3D6M1qjdT8Wly3oeQ3yY0djTy2xyCXuwjT+QN0Pm
         1vGdU1EORZPTw8lEXL7n28ZvUP062+4d2+EU6HwQVaT4OP7QJ0wMhlLTSHvs8dvHIVcC
         xDj7na1tNB886nQrNzArXOQv3AMOLymFbYFXAu0SUILT6VsDCH7Xwu6M+td2ZN5T566y
         aP0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698804358; x=1699409158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cEKlb9+ZY0B9mrv/T98IQK90StjaDbNde8cN8esmJ2I=;
        b=iLTeOyGhRkqTQa1crDFQQ1SUUsbQ9i7tJKdNB4Fe7wKx6KCC7maViXOTM+SbUQVXNf
         ha4qxjCyk7dwDfF21yb9M/B1Q/Ffg695LHKc819Rxmok6ZSmLEjF46F2/pVD5M2cv4d5
         WRj6JcnSF2GdNrL3mpHwQ7jHCbpP78P/KSyi0I0T1OI5Qdw15cRJIpzCr2RIH9YOJSiY
         MFx7iLnpG0r3mRhezcSSxlF92EcW3MbJgS69q26rwoR27Toi7ZxU2M0kojcsOpNlRRh3
         0Sa25y1EmEiPyapBxCsKA3zUf+Rstox5J4mO4u6MIRfpOUZD123FomYi4RbKER90cUfi
         MsPw==
X-Gm-Message-State: AOJu0Yx+99+LWXc9mZmz5oLadsK0ZmhyvdANrUO/wMBdDRRP5Rs5gLHA
	Liazwi3xWIPG0jtsZto5dxyMZqBdFiQPe06pQTqjwzvm/EAcA6ks
X-Google-Smtp-Source: AGHT+IFooif2X5+/CJeuSxxULskFOAk5A4KRknHkAg3yGC3gdg+4uZvRH2WSCmbJ5vxEtXGGlfsugeWUSMqdBCqfOcM=
X-Received: by 2002:a25:68cd:0:b0:da0:4453:8f10 with SMTP id
 d196-20020a2568cd000000b00da044538f10mr12049799ybc.43.1698804357417; Tue, 31
 Oct 2023 19:05:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1698717154.git.zhoubinbin@loongson.cn> <7fae3ce932b455effcf73ff0208f4776959f2f44.1698717154.git.zhoubinbin@loongson.cn>
 <20231031175342.GA1805362-robh@kernel.org>
In-Reply-To: <20231031175342.GA1805362-robh@kernel.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 1 Nov 2023 08:05:46 +0600
Message-ID: <CAMpQs4+fz7Xx90QnU23kRAtcyaq9nFQAfp7Qa1RxWhpKr_TiHw@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] dt-bindings: interrupt-controller:
 loongson,liointc: Fix dtbs_check for interrupt-names
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

On Tue, Oct 31, 2023 at 11:53=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Tue, Oct 31, 2023 at 10:36:38AM +0800, Binbin Zhou wrote:
> > The Loongson-2K0500/2K1000 CPUs have 64 interrupt sources as inputs, an=
d
> > a route-mapped node handles up to 32 interrupt sources, so two liointc
> > nodes are defined in dts{i}.
> > Of course, we need to ensure that the routing outputs (intx) of the two
> > nodes cannot conflict.
> >
> > For example, in Loongson-2K1000, 'int0' is typically used by the lioint=
c0
> > node, then the liointc1 node can only use the outputs starting with
> > 'int1'.
> >
> > So "interrupt-names" should be defined by "pattern".
> >
> > This fixes dtbs_check warning:
> >
> > DTC_CHK arch/loongarch/boot/dts/loongson-2k0500-ref.dtb
> > arch/loongarch/boot/dts/loongson-2k0500-ref.dtb: interrupt-controller@1=
fe11440: interrupt-names:0: 'int0' was expected
> >         From schema: Documentation/devicetree/bindings/interrupt-contro=
ller/loongson,liointc.yaml
> > arch/loongarch/boot/dts/loongson-2k0500-ref.dtb: interrupt-controller@1=
fe11440: Unevaluated properties are not allowed ('interrupt-names' was unex=
pected)
> >         From schema: Documentation/devicetree/bindings/interrupt-contro=
ller/loongson,liointc.yaml
> > DTC_CHK arch/loongarch/boot/dts/loongson-2k1000-ref.dtb
> > arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: interrupt-controller@1=
fe01440: interrupt-names:0: 'int0' was expected
> >         From schema: Documentation/devicetree/bindings/interrupt-contro=
ller/loongson,liointc.yaml
> > arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: interrupt-controller@1=
fe01440: Unevaluated properties are not allowed ('interrupt-names' was unex=
pected)
> >         From schema: Documentation/devicetree/bindings/interrupt-contro=
ller/loongson,liointc.yaml
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  .../bindings/interrupt-controller/loongson,liointc.yaml    | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/loo=
ngson,liointc.yaml b/Documentation/devicetree/bindings/interrupt-controller=
/loongson,liointc.yaml
> > index 7393d7dfbe82..a90c609d351e 100644
> > --- a/Documentation/devicetree/bindings/interrupt-controller/loongson,l=
iointc.yaml
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,l=
iointc.yaml
> > @@ -54,11 +54,9 @@ properties:
> >    interrupt-names:
> >      description: List of names for the parent interrupts.
> >      items:
> > -      - const: int0
> > -      - const: int1
> > -      - const: int2
> > -      - const: int3
> > +      pattern: int[0-3]
> >      minItems: 1
> > +    maxItems: 4
> >
> >    '#interrupt-cells':
> >      const: 2
> > @@ -87,6 +85,7 @@ required:
> >    - compatible
> >    - reg
> >    - interrupts
> > +  - interrupt-names
>
> A new required property is an ABI break. Is that okay for this platform?
> The commit msg should answer that if so.

Hi Rob:

Thanks for your reply.

In fact, 'interrupt-names' is essential for both liointc-1.0 and
liointc-2.0, and we now pass it to get the corresponding interrupt
number.
To a certain extent, I think it's already 'required'.
Of course, I'll try to explain it more clearly in the commit message.

Thanks.
Binbin
>
>
> >    - interrupt-controller
> >    - '#interrupt-cells'
> >    - loongson,parent-int-map
> > --
> > 2.39.3
> >
