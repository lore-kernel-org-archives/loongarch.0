Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E8435A3A9
	for <loongarch@lists.linux.dev>; Wed, 15 Jul 2026 08:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784104296; cv=pass; b=MRcz2FjDrJlkCjZs8glpMssT6OQMtpGkm1gsM4/lGfkGPrZ0CIbgN4Z6bBkRA9GsvKDHgxL/JjSRxuNRkd/rXgG4OzbdgvQ7cp+ggzXkw/nRopiH5l37A2MoJlWUNagv5zuAkYvG5sOP/7zUUhjTMIV4O+CpXbVWSDUcNlHT5XQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784104296; c=relaxed/simple;
	bh=tbJh1cvggz9fj6wWtOnktnlMx38fPOjiOCsgOQsZ8fA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oekZVK1tEFBdl6J4/he0HdTNAP1T79mIZ8h0jbvI4Ncc5cze4cGjGwwdYSteLBVesb/vQrPu0q7RdHbHIT06uujXZazNu2QyFhjhbbcLP151eUgiI7NlxCLxCkxgox1IUgP2MZrW/HoNu4Hi1iZnlp/qEvrXriKXFL/yqgfPfuk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TgpYmzEQ; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TgpYmzEQ"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c15cd3fd760so592073166b.2
        for <loongarch@lists.linux.dev>; Wed, 15 Jul 2026 01:31:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784104293; cv=none;
        d=google.com; s=arc-20260327;
        b=Y/JsQIZu4x6BiwlwNEj48Bw825ybF+Vr6ZyWDv08fJYY0nlt1lR/s3sGjg/DqhBwMS
         YdyC9hJ0K1CyY46TkKemcEHxWaZAiG2jz3pappFAr4vETT26vAbzd66XUwmhudaUcRF1
         R1fOEkpVVqAJxBWdI+vf5P48/yOGAJJbohBbNKbI9M6h8QWVPnp30qjU1mEdqkosA4/k
         TaqoRaa1XViol5TnBgXowfkwWj1gShRpdry1JSG6ycop6J9+Eeh73dIgqcVIW9YQp08x
         HlRayam5QRiExXh6A6YxyUNIK+x/5vFBvHeDX3VmE1qM1o5QKnDnVlIMK/zHNBfT7skx
         GTHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SIO4iai7ZG36bPwEvbqCHAeg6bos5dE8xe5cg3XB4/c=;
        fh=MMZUwRmP7pXjSzTwYvCe9F4AGFapUoNr3nluj62lSG0=;
        b=YJ8IuE1ot9I5n8KKBzMq6dGuLvpygzwEhNYLpJ/Wvsj0O77JhrtIHoHMv8383Sxndv
         kYWbjboz9czqS8TsINi8iKMK99nKhuGucuhawx5XAsAXKlsdd4u3x+GekGb03iCQW286
         VV/t+isKRK69QAUhtJCMBn92pxCse3Jk0XTbvimhbsHMTIMkTiR2UL2xdYL5UGdITE8O
         zrGirFnuq5Xn3xEyRGGKx4bVLtRxoyBFLRAbnuPwJqgkIyZGxXytTYxcKsa9uGNUPBt5
         8V1GcKvSigcdqR8kROd3selVnBMQRSPS+2Q0/rzZqUCLx/hlba40+OHZ66Nd+uvcCEvW
         Zxnw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784104293; x=1784709093; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SIO4iai7ZG36bPwEvbqCHAeg6bos5dE8xe5cg3XB4/c=;
        b=TgpYmzEQWMUxxDDxUxrNVouqA6NTxc1t8kf+pr4Is97RyMktagFTl/zOZIhyZi2pR+
         TCTUe9Ftvh/ny2+7fnPM7jJJgKNzzfH+K59aoxYEJrGBxpVxkMw60l9Y0yHvhz+LVRqq
         t3DKGKttbusrAHaQMyBsRq2vUQox1y5FBCpPFxuMrFEDq5/iSs/TOCEWI2QFvWbMsSXv
         ixdgUS92yyNtRHVTaJMOaXsNZ/VjdgOe2VzaGz7eGOIq1Bs+yQ5SON6sVMt06XyTGCa2
         0tnsnMIET18IvuwRrzU5SEW4g9XUIF2vALWI3ZsnSoNnVfXKAY8jgmngGyM39Sl8w//s
         fCDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784104293; x=1784709093;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SIO4iai7ZG36bPwEvbqCHAeg6bos5dE8xe5cg3XB4/c=;
        b=l2eKbCNt4yo61xPx/oxh4Ip+uxHyMy91z7i4zeQsVew0vjKCV3lgtFH+yTDgkF6Ezu
         H8gKvPIocwnKgOESLflJaPrcz8sMo0VD2zrqOnW13bI5Zdj2d1Av3VAxIpthANo4qlGR
         rslrxejWOLrNihYw7JmPCb3AejPO1k8mrbv3ezUbuBpBTTpNQavcPfToBBLEsO9vadTx
         43n8A2qhncY02zwYhcFRTn8d/YUIumwrDvsctAP8cu6U1GsS/b6wckGdRMC5w3gKqzXc
         BEBEhexS6B8jfqQzCi0F/cQlbU3NBx+8S4aQSlcrKIJrQQHLzVbWKMuwwR34oZWI3osz
         6oJw==
X-Forwarded-Encrypted: i=1; AHgh+Rr1sLYxAn/nUuKxR2JL4KzDT/AHRxoR8rRq9yhNz5Bya0Oi2JBOvOIUqroIhYpa2FrMHInlMfAyiBw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2OVWlwHYaAaul7KyGGER9pfWgz3EFrtC2kpmz5f9/RNNf27dJ
	Zw4TqDfe5a98S++MgkFxrXR1uqXVT9n/uwHxcGgb0k9Lf/VT/XrzcQq/AgfHqNxv50gp1e4yTT0
	hAyz7L5SFelhay7X5dAZSosko+5sN+Zk=
X-Gm-Gg: AfdE7ckp97HInvalruVPpWSxow42hKDdXkifDd7IIApUceNXxSx1DlfsxLeyfm1BC5f
	j8k12p1dB5ugajj9LLIzDbHmnMOWrm/Qgsezja6biuStKfZ5Od913IRfoCvw0IUyoc9drKKllJc
	AiLlEy+859k/6EpEPDSbnHgsZ5Yj+WvyqGkJbipO/dSc4MV/hDtBf2qCUGrCg7Go5EV1B776D+W
	J4km652dV5X1y3BdRqgsmoPuZ8CFSz+e4kOSKNT1erTwSAmGyhjyU2RxpuyRRW7NQg81Qw=
X-Received: by 2002:a17:906:478f:b0:c12:979c:5a5e with SMTP id
 a640c23a62f3a-c1678ff1a33mr107871966b.0.1784104293130; Wed, 15 Jul 2026
 01:31:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1783670011.git.zhoubinbin@loongson.cn> <7df0780e1b3d4c499a48cd862a12bda895e7818f.1783670011.git.zhoubinbin@loongson.cn>
 <20260710-game-late-9347baafa7ab@spud> <CAMpQs4+zXcNnZQnxWM7WUAM-heBYrTejm_dy3yVA4EFUrjA4CQ@mail.gmail.com>
 <20260714-irritate-varying-9055895097b0@spud>
In-Reply-To: <20260714-irritate-varying-9055895097b0@spud>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 15 Jul 2026 16:31:21 +0800
X-Gm-Features: AUfX_mybVa7Y7V3mpGKZQK3bq9KTd6uD6axAeXZjqDD49GTseSW4kybm7O4RuKY
Message-ID: <CAMpQs4Kd=qc6HNaup6GyWufPwhgd+cafLzRXhga1Z=Ez7LPXHA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: thermal: loongson,ls2k-thermal: Add
 compatible for Loongson-2K0300
To: Conor Dooley <conor@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor:

On Wed, Jul 15, 2026 at 12:54=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Tue, Jul 14, 2026 at 02:53:40PM +0800, Binbin Zhou wrote:
> > Hi Conor:
> >
> > Thanks for your reply.
> >
> > On Sat, Jul 11, 2026 at 12:21=E2=80=AFAM Conor Dooley <conor@kernel.org=
> wrote:
> > >
> > > On Fri, Jul 10, 2026 at 04:24:59PM +0800, Binbin Zhou wrote:
> > > > Add a new compatible string `loongson,ls2k0300-thermal` for the the=
rmal
> > > > sensor found on the Loongson-2K0300 SoC.
> > > >
> > > > The hardware differs from the existing SoCs in its register layout:=
 it
> > > > requires two register regions (one for the thermal sensor control a=
nd
> > > > another for the CPU ID).
> > > >
> > > > Update the binding to describe this new requirement.
> > > >
> > > > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > > > ---
> > > >  .../thermal/loongson,ls2k-thermal.yaml        | 68 ++++++++++++++-=
----
> > > >  1 file changed, 50 insertions(+), 18 deletions(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/thermal/loongson,ls2=
k-thermal.yaml b/Documentation/devicetree/bindings/thermal/loongson,ls2k-th=
ermal.yaml
> > > > index 79e691b08341..b5cbfd201105 100644
> > > > --- a/Documentation/devicetree/bindings/thermal/loongson,ls2k-therm=
al.yaml
> > > > +++ b/Documentation/devicetree/bindings/thermal/loongson,ls2k-therm=
al.yaml
> > > > @@ -10,13 +10,11 @@ maintainers:
> > > >    - zhanghongchen <zhanghongchen@loongson.cn>
> > > >    - Yinbo Zhu <zhuyinbo@loongson.cn>
> > > >
> > > > -allOf:
> > > > -  - $ref: /schemas/thermal/thermal-sensor.yaml#
> > > > -
> > > >  properties:
> > > >    compatible:
> > > >      oneOf:
> > > >        - enum:
> > > > +          - loongson,ls2k0300-thermal
> > > >            - loongson,ls2k1000-thermal
> > > >            - loongson,ls2k2000-thermal
> > > >        - items:
> > > > @@ -39,23 +37,46 @@ required:
> > > >    - reg
> > > >    - interrupts
> > > >
> > > > -if:
> > > > -  properties:
> > > > -    compatible:
> > > > -      contains:
> > > > -        enum:
> > > > -          - loongson,ls2k2000-thermal
> > > > +allOf:
> > > > +  - $ref: /schemas/thermal/thermal-sensor.yaml#
> > > >
> > > > -then:
> > > > -  properties:
> > > > -    reg:
> > > > -      minItems: 2
> > > > -      maxItems: 2
> > > > +  - if:
> > > > +      properties:
> > > > +        compatible:
> > > > +          contains:
> > > > +            enum:
> > > > +              - loongson,ls2k0300-thermal
> > > > +    then:
> > > > +      properties:
> > > > +        reg:
> > > > +          items:
> > > > +            - description: Thermal base register region
> > > > +            - description: CPU ID register region
> > > >
> > > > -else:
> > > > -  properties:
> > > > -    reg:
> > > > -      maxItems: 1
> > > > +  - if:
> > > > +      properties:
> > > > +        compatible:
> > > > +          contains:
> > > > +            enum:
> > > > +              - loongson,ls2k1000-thermal
> > > > +    then:
> > > > +      properties:
> > > > +        reg:
> > > > +          items:
> > > > +            - description: Thermal base register region
> > > > +
> > > > +  - if:
> > > > +      properties:
> > > > +        compatible:
> > > > +          contains:
> > > > +            enum:
> > > > +              - loongson,ls2k2000-thermal
> > > > +    then:
> > > > +      properties:
> > > > +        reg:
> > > > +          items:
> > > > +            - description: Thermal base register region
> > > > +            - description: Thermal data output register region
> > > >
> > > >  unevaluatedProperties: false
> > > >
> > > > @@ -69,3 +90,14 @@ examples:
> > > >          interrupts =3D <7 IRQ_TYPE_LEVEL_LOW>;
> > > >          #thermal-sensor-cells =3D <1>;
> > > >      };
> > > > +
> > > > +  - |
> > > > +    #include <dt-bindings/interrupt-controller/irq.h>
> > > > +    thermal-sensor@16001500 {
> > > > +       compatible =3D "loongson,ls2k0300-thermal";
> > > > +       reg =3D <0x16001500 0x30>,
> > > > +             <0x16003ff0 0x8>;
> > >
> > > Quite frankly, the address and size of this look like the second
> > > register region here is actually a few bytes in a syscon that is bein=
g
> > > misrepresented.
> > > What lies at the addresses immediately before and after 0x16003ff0?
> >
> > Yes, it can be viewed as part of the system configuration registers,
> > which appear somewhat disorganized. Within this section,
> > 0x16003fe0=E2=80=930x16003ffc represents eight chip ID registers.
> >
> > 0x16003fe0 --> the 4th chip id
> > 0x16003fe4 --> the 5th chip id
> > 0x16003fe8 --> the 6th chip id
> > 0x16003fec --> the 7th chip id
> > 0x16003ff0 --> the 0th chip id
> > 0x16003ff4 --> the 1st chip id
> > 0x16003ff8 --> the 2nd chip id
> > 0x16003ffc --> the 3rd chip id
> >
> > Perhaps I shouldn=E2=80=99t have referenced `0x16003ff0` separately her=
e. It
> > would be more reasonable to declare the entire chip ID address space
> > as a separate syscon and have it referenced by thermal driver.
>
> Probably, but even being of size 0x20 feels suspiciously small and that
> it is likely that this is part of an even larger grouping of misc.
> registers.

According to the manual, the chip configuration registers are not
contiguous but are scattered throughout the memory. They are generally
as follows:

0x16000100 - 0x16000154:  General Chip Configuration / Chip Sampling
Parameters / Chip Counter Registers
0x16000400 - 0x16000424:  PLL Clock Configuration Registers -> This is
already used in clk driver;
0x16000490 - 0x160004a8:  GPIO Remapping Configuration Register ->
This is already used in pinctrl driver;
0x16000500 - 0x1600050c:  USB PHY Configuration Register
0x16001040 - 0x160014c0:  Interrupt routing Registers -> This is
already used in irqchip driver;
0x16001500 - 0x16001524:  Thermal Registers -> This is already used in
thermal driver;
0x16001600 - 0x1600180c:  External Interrupt Registers -> EIO irqchip drive=
r;
0x16003fe0  - 0x16003ffc:  CHIP ID Registers

Expanding the range to `0x16000100 - 0x16003ffc` might not be the best appr=
oach.
In contrast, the chip ID register is independent. Additionally, apart
from the first section of general-purpose chip configuration
registers, the other registers are referenced by their respective
modules.

So, is `reg =3D <0x0 0x16003fe0 0x0 0x20>;` a good choice?
>
> >
> > For example:
> >
> > In DTS{i}:
> > chipid_syscon: syscon@16003fe0 {
> >        compatible =3D =E2=80=9Cloongson,ls2k0300-cphipid-syscon=E2=80=
=9D, =E2=80=9Csyscon=E2=80=9D;
> >        reg =3D <0x0 0x16003fe0 0x0 0x20>;
> > };
> >
> > In thermal driver:
> > Use
> > `syscon_regmap_lookup_by_phandle(np, "loongson,chipid"); `
> > Or:
> > `syscon_regmap_lookup_by_compatible("loongson,ls2k0300-cphipid-syscon")=
;`
> >
> > get the chip id address space.
> >
> > >
> > >
> > > Thanks,
> > > Conor.
> > >
> > > > +       interrupt-parent =3D <&liointc1>;
> > > > +       interrupts =3D <20 IRQ_TYPE_LEVEL_HIGH>;
> > > > +       #thermal-sensor-cells =3D <1>;
> > > > +    };
> > > > --
> > > > 2.52.0
> > > >
> >
> > --
> > Thanks.
> > Binbin

--=20
Thanks.
Binbin
