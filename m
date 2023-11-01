Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6377D65F
	for <loongarch@lists.linux.dev>; Wed,  1 Nov 2023 01:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NFzmJYvI"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-d9c687f83a2so5937889276.3
        for <loongarch@lists.linux.dev>; Tue, 31 Oct 2023 18:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698802731; x=1699407531; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QfdFhhcZh0XNUSFxOHIIYroGz/KpzxQNSvIELIQ4a8I=;
        b=NFzmJYvIMOLGToci721E7uAJvAzURSYG0vNqwWobpI3dF2mbVZWzcoDNvfoRPUffnK
         c66/pEtNmd0qfYoFOy/jBgGC7on4/C1XI1r6kJRHUAtQ/of11kZVSpPEeIXr5aHV99ef
         Lw5bJvH6I3aQnjbAOeHkjlr1pNr1yHvmBmEOm5pDcA9NMUjUy+S0170ra0TiO//boVHM
         dXc9Llddsc0T7f9yJe8t17Lx++peapCR2msPD0HVYz3qtU8zzYeDm1iUfnfmFTRgPCt2
         QBdSb7ga3aKQsT/UZDlwvAi0azNFYDQ1yPHOk6acwSbfzS8vvkIqqO/EnAaB2s8ojY6S
         oUsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698802731; x=1699407531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QfdFhhcZh0XNUSFxOHIIYroGz/KpzxQNSvIELIQ4a8I=;
        b=MBp0BnPOYfvYhjCt7sKBzFovWcXDri9PrNDTHqfK+hiSYb1VY2s8girI46rBVigI3G
         l1Ai0BixHvIRjSVkr09z8elDr2+xTBB5X/NWQkTWqHD+7L1fHS10NeM0UXpxi8R/26aY
         3l3ud9D5qhzdMkPYh0g16xJLM3Fal37pvdVRvCC+xzI+smmKPSmfk8f/jbidvky8kHU3
         97n6eKePdP1JR9f0vz33MkY2NdQbVurCLkKf7EYyB6XFiMwxsYqHWehrOtUsJETBNcKK
         3QpMk+YmQvWA7n9UdD6OQBN3X6SpYEDXMaM2lNaBEAwAUx8zFo7Bz9HiL8XXVv0ATO72
         F8ow==
X-Gm-Message-State: AOJu0Yxw+TxVPjSBmp0ogIRtz7hs2Fnj927AXcXRH4AGSc/Eg4hhxxLx
	+05vPoHnSfw+a4zQvzn9aowsa363+G4p8T+cGjQ=
X-Google-Smtp-Source: AGHT+IE5QNgYVhASEwlIN4zeo846ftPgjgWyiyvur7YKctM92yabJQEqAGLhi4n12YjsVydrMXrTzTjRTaWNOtx6/Vw=
X-Received: by 2002:a25:2305:0:b0:da0:659f:c4fe with SMTP id
 j5-20020a252305000000b00da0659fc4femr14692512ybj.8.1698802730891; Tue, 31 Oct
 2023 18:38:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1698743706.git.zhoubinbin@loongson.cn> <944559ea3bf7ba0a1540f831ccd7d33591622b22.1698743706.git.zhoubinbin@loongson.cn>
 <20231031-negative-giveaway-6191a2da0cd5@spud>
In-Reply-To: <20231031-negative-giveaway-6191a2da0cd5@spud>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 1 Nov 2023 07:38:39 +0600
Message-ID: <CAMpQs4+3T9RATpJ5VycnEzkOTx_M2vdt6WPJv_B1Efy81RzCjA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: thermal: loongson,ls2k-thermal: Fix
 binding check issues
To: Conor Dooley <conor@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongson-kernel@lists.loongnix.cn, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, WANG Xuerui <git@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 31, 2023 at 10:58=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Tue, Oct 31, 2023 at 07:05:49PM +0800, Binbin Zhou wrote:
> > Add the missing 'thermal-sensor-cells' property which is required for
> > every thermal sensor as it's used when using phandles.
> > And add the thermal-sensor.yaml reference.
> >
> > Fixes: 72684d99a854 ("thermal: dt-bindings: add loongson-2 thermal")
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  .../bindings/thermal/loongson,ls2k-thermal.yaml        | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/thermal/loongson,ls2k-th=
ermal.yaml b/Documentation/devicetree/bindings/thermal/loongson,ls2k-therma=
l.yaml
> > index 7538469997f9..b634f57cd011 100644
> > --- a/Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.y=
aml
> > +++ b/Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.y=
aml
> > @@ -10,6 +10,9 @@ maintainers:
> >    - zhanghongchen <zhanghongchen@loongson.cn>
> >    - Yinbo Zhu <zhuyinbo@loongson.cn>
> >
> > +allOf:
> > +  - $ref: /schemas/thermal/thermal-sensor.yaml#
> > +
> >  properties:
> >    compatible:
> >      oneOf:
> > @@ -26,12 +29,16 @@ properties:
> >    interrupts:
> >      maxItems: 1
> >
> > +  '#thermal-sensor-cells':
> > +    const: 1
> > +
> >  required:
> >    - compatible
> >    - reg
> >    - interrupts
> > +  - '#thermal-sensor-cells'
>
> Why does it need to be a required property now though?
> Adding new required properties is technically an ABI break.

Hi Conor:

I don't think it makes sense to have a separate thermal sensor
definition, it needs thermal-zones to describe specific behaviors,
e.g. cpu-thermal, so we need '#thermal-sensor-cells' to specify the
reference.
And the Loongson-2K1000 has 4 sets of control registers, we need to
specify the id when referencing it.

Thanks.
Binbin
>
> Cheers,
> Conor.
>
> >
> > -additionalProperties: false
> > +unevaluatedProperties: false
> >
> >  examples:
> >    - |
> > @@ -41,4 +48,5 @@ examples:
> >          reg =3D <0x1fe01500 0x30>;
> >          interrupt-parent =3D <&liointc0>;
> >          interrupts =3D <7 IRQ_TYPE_LEVEL_LOW>;
> > +        #thermal-sensor-cells =3D <1>;
> >      };
> > --
> > 2.39.3
> >
