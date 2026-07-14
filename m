Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC9C3EB0E8
	for <loongarch@lists.linux.dev>; Tue, 14 Jul 2026 06:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784012038; cv=pass; b=ZhGIe+z51Ekd5ir2TIxjuKe/scJaCTseToZZqFY+jKUXVPbHZcmHukwp9yvNGseL4retT9Y6J5Jq05jYe7rLNn+VNsFyDdYEGdju06OUnII2NDhsMtyNYwfRkSXLU6ld3C/Y0KPH5lEhKgogI8XSSHKzI4HK2Zv+1VYC4tQh3Yw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784012038; c=relaxed/simple;
	bh=u/o3hNaQTwZ7SMZZKioaNk2zdeVsCZ/s/MMb/twwrKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b72wLGXM3Em2JaajWZwAFlWJt66s2O99CtKaFKfBjYQnjAY97XLVBApcWAqVSh2ewAhzP/xOwH/evdsNoqLlNjBGc22UD4/dbH6D8soWvixhiZn2e+pl4QDsD1XfNc6iNVJqDUvGY3Cq1xiARdOiKYEC7owfFuuDAIzcGyeu6f0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E05NRT1A; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E05NRT1A"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c15ba5b151dso78052366b.3
        for <loongarch@lists.linux.dev>; Mon, 13 Jul 2026 23:53:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784012034; cv=none;
        d=google.com; s=arc-20260327;
        b=Q+8ewoD9pVE5vlI0JisjExv3XmCPBSfYU1v+Z0yOE3K2/AaLq1LjrUO0fRegUXj4lH
         q1Z0XI3E0t4ilf+RXZlpz8iqaQ8D7J73dpY8DtqSRTrD3PvEO3gFkoDXkiz3gK4f5d60
         LD7/bLpjnZm2EkZhfSjd0VWPJGrB8xHWJSOPdWPg8OpjE4lM0zBUKTJg4mQaXshMqUH6
         cdPyYijJUPr5w6xq5QAgim5/gGh75iiBx3uogt2zk7eqLM5oiEDxqAye5flJJFTIyLWi
         viu/orv9039jMivUJW41vH1KbCyyiWIj3Jd5AFqCFUSXZ4pkEjheCMAzAgPfPFVFp84C
         bpPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hdKwj0yrU/TK8GpM97VwRceyfpiXsD0J+8JoQXFeKPU=;
        fh=FvNlSzQONsrvpowHn5p52N7NqRGvLmj85RsEaKhZdpc=;
        b=pVFPWN+U4TXEJQpggV6gYMdMK0Dae5qZQYBYktuzM+rQG3A9JlclKrsPmes7OVRq52
         Vg6W+p+joIktE8zZH3da7MqaAB/Mox52qZPFgR5DKl6ZDQHv5QPxexL/jWGDqxuwLinJ
         FnOYNo0THGLoK+l6J66Vw+MZq6jT7jVzO7GSp+CdBvx2Kd9+Xqh1XyBqUR4vagGBCmfa
         aDRS33dAEmTZ1IpsVwfeW7VuQCm0GMM9RDa6OCukHvOiMcDzMxl3pNUZGUjLllsBBsRu
         XQbuiSCpDtqZjNKSi2oP1JPGF/oEGVQv3EfMT/RDLc2pSdW/9yvhWa4ACWjxgk5M7iKV
         3cNA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784012034; x=1784616834; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hdKwj0yrU/TK8GpM97VwRceyfpiXsD0J+8JoQXFeKPU=;
        b=E05NRT1A2N+XXRPvdNrH0IPaeKglrRlCcW3H5RkIckYNuOLNqECckY+kmm02GH1eFf
         evAqYPSSOgd4q/v2v6HOCTsSayZoG/fIzNzEv3NeF2EpZUX3JkdwfUr/bw6CE2AmRO7I
         hRpUPILLFLJZScNlDB2uPBTLZwpNi40tMAt540ONTr3e12eSmhneAsLARdRLvTMpLnwZ
         bSMjpqkeBvzEWPqcyPAUkk1LxVhub0P4E8c7t8yqSIGBPmynuLnh2BT0txEY2rf6cwcU
         w/cJpeIAStvQlwDLEOeLSODlrRI7JZbdep+cTVQ5TlNaRVOVnEKSwaP+90a+HRvNxQ8D
         edJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784012034; x=1784616834;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hdKwj0yrU/TK8GpM97VwRceyfpiXsD0J+8JoQXFeKPU=;
        b=TXAIQJL/ateYNRKA9P4mWK8SLJVOoYSKb30jR8UuncJt8dG8/NXoh5gPJZOk6haST/
         CLCgtzL3Y6nP0p3Lr4GmLbf1TJUdtw9+1082i+1wNiW+pgS9cd0rFsH6JEfKAoKUiT2j
         XGFiUfcAdPgKLPZ4j2Cb+pw/Ewp2eIRzK4ydIiAHI6DKC6QH0hzEtz8xtqvXA6vGuqgv
         GuDqhBp0jZ7rWH/VF0egz9xGjEQ2cRcnifbjjVqYGvomSkaCu3je+1OoocsNCkK2EE+8
         1eUvV5e9HqjtO95Mr3hI/8fCulwC1kbKXIApFmDStVMdR9C5AVOCuU4cBwDM4r1qpXUP
         2kwg==
X-Forwarded-Encrypted: i=1; AHgh+RozT52z8i5CZn9qFB0GbYyvHJpFwzXf5y9F7ph5oYG2b4ldZPJ5Gt+yCU6xumFIUrDsnutISjIC5UI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2oM/v0PtTe+AsoLcv9yJQGSkJwRpEmmChlyu3L6KtUC4wt4nt
	viBdU/jP9hHGUd1WzgPeeO1qN0AjrFXkI/147quAYTi9kuipE8zodVAWx802EsNs0y912NqG6da
	4mtGGU702u8o49B/X+MUI7xCe2SymSZU=
X-Gm-Gg: AfdE7clxQy75CljoBd/3/sfJwHDwHlsQoYJ8rqJlM8yWqLMZzNKVhan2oNLfdiQccDB
	/Hy/EEpGA8LsLFa2tONol7PWychg+kEF9WatlMz+xOcQYx8EhnQm7MRid0F99eEiKqMaij00ZgG
	pGUtvLCfrV/mt8I2JKyvT9Bos4Oozxx6jgDmSnkKRF12hFH0pI9vOtV2w74aDBuwziHJohIk28V
	boLUtCHl7RObr6efdwUwtbpcoNkOA4xFjqDO9PYRcEjwM8ZXw++UOr/SmBMPz56rNd2UzQdlP0=
X-Received: by 2002:a17:906:2b51:b0:c12:8db1:b6de with SMTP id
 a640c23a62f3a-c161f39e587mr361554066b.32.1784012033993; Mon, 13 Jul 2026
 23:53:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1783670011.git.zhoubinbin@loongson.cn> <7df0780e1b3d4c499a48cd862a12bda895e7818f.1783670011.git.zhoubinbin@loongson.cn>
 <20260710-game-late-9347baafa7ab@spud>
In-Reply-To: <20260710-game-late-9347baafa7ab@spud>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 14 Jul 2026 14:53:40 +0800
X-Gm-Features: AUfX_mxjtQ3UWo4wBSJnYn5ShCpXy7xgitddiC-Sdv3YauPBTDh5iRK_e5oqirA
Message-ID: <CAMpQs4+zXcNnZQnxWM7WUAM-heBYrTejm_dy3yVA4EFUrjA4CQ@mail.gmail.com>
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

Thanks for your reply.

On Sat, Jul 11, 2026 at 12:21=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Fri, Jul 10, 2026 at 04:24:59PM +0800, Binbin Zhou wrote:
> > Add a new compatible string `loongson,ls2k0300-thermal` for the thermal
> > sensor found on the Loongson-2K0300 SoC.
> >
> > The hardware differs from the existing SoCs in its register layout: it
> > requires two register regions (one for the thermal sensor control and
> > another for the CPU ID).
> >
> > Update the binding to describe this new requirement.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  .../thermal/loongson,ls2k-thermal.yaml        | 68 ++++++++++++++-----
> >  1 file changed, 50 insertions(+), 18 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/thermal/loongson,ls2k-th=
ermal.yaml b/Documentation/devicetree/bindings/thermal/loongson,ls2k-therma=
l.yaml
> > index 79e691b08341..b5cbfd201105 100644
> > --- a/Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.y=
aml
> > +++ b/Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.y=
aml
> > @@ -10,13 +10,11 @@ maintainers:
> >    - zhanghongchen <zhanghongchen@loongson.cn>
> >    - Yinbo Zhu <zhuyinbo@loongson.cn>
> >
> > -allOf:
> > -  - $ref: /schemas/thermal/thermal-sensor.yaml#
> > -
> >  properties:
> >    compatible:
> >      oneOf:
> >        - enum:
> > +          - loongson,ls2k0300-thermal
> >            - loongson,ls2k1000-thermal
> >            - loongson,ls2k2000-thermal
> >        - items:
> > @@ -39,23 +37,46 @@ required:
> >    - reg
> >    - interrupts
> >
> > -if:
> > -  properties:
> > -    compatible:
> > -      contains:
> > -        enum:
> > -          - loongson,ls2k2000-thermal
> > +allOf:
> > +  - $ref: /schemas/thermal/thermal-sensor.yaml#
> >
> > -then:
> > -  properties:
> > -    reg:
> > -      minItems: 2
> > -      maxItems: 2
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - loongson,ls2k0300-thermal
> > +    then:
> > +      properties:
> > +        reg:
> > +          items:
> > +            - description: Thermal base register region
> > +            - description: CPU ID register region
> >
> > -else:
> > -  properties:
> > -    reg:
> > -      maxItems: 1
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - loongson,ls2k1000-thermal
> > +    then:
> > +      properties:
> > +        reg:
> > +          items:
> > +            - description: Thermal base register region
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - loongson,ls2k2000-thermal
> > +    then:
> > +      properties:
> > +        reg:
> > +          items:
> > +            - description: Thermal base register region
> > +            - description: Thermal data output register region
> >
> >  unevaluatedProperties: false
> >
> > @@ -69,3 +90,14 @@ examples:
> >          interrupts =3D <7 IRQ_TYPE_LEVEL_LOW>;
> >          #thermal-sensor-cells =3D <1>;
> >      };
> > +
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    thermal-sensor@16001500 {
> > +       compatible =3D "loongson,ls2k0300-thermal";
> > +       reg =3D <0x16001500 0x30>,
> > +             <0x16003ff0 0x8>;
>
> Quite frankly, the address and size of this look like the second
> register region here is actually a few bytes in a syscon that is being
> misrepresented.
> What lies at the addresses immediately before and after 0x16003ff0?

Yes, it can be viewed as part of the system configuration registers,
which appear somewhat disorganized. Within this section,
0x16003fe0=E2=80=930x16003ffc represents eight chip ID registers.

0x16003fe0 --> the 4th chip id
0x16003fe4 --> the 5th chip id
0x16003fe8 --> the 6th chip id
0x16003fec --> the 7th chip id
0x16003ff0 --> the 0th chip id
0x16003ff4 --> the 1st chip id
0x16003ff8 --> the 2nd chip id
0x16003ffc --> the 3rd chip id

Perhaps I shouldn=E2=80=99t have referenced `0x16003ff0` separately here. I=
t
would be more reasonable to declare the entire chip ID address space
as a separate syscon and have it referenced by thermal driver.

For example:

In DTS{i}:
chipid_syscon: syscon@16003fe0 {
       compatible =3D =E2=80=9Cloongson,ls2k0300-cphipid-syscon=E2=80=9D, =
=E2=80=9Csyscon=E2=80=9D;
       reg =3D <0x0 0x16003fe0 0x0 0x20>;
};

In thermal driver:
Use
`syscon_regmap_lookup_by_phandle(np, "loongson,chipid"); `
Or:
`syscon_regmap_lookup_by_compatible("loongson,ls2k0300-cphipid-syscon");`

get the chip id address space.

>
>
> Thanks,
> Conor.
>
> > +       interrupt-parent =3D <&liointc1>;
> > +       interrupts =3D <20 IRQ_TYPE_LEVEL_HIGH>;
> > +       #thermal-sensor-cells =3D <1>;
> > +    };
> > --
> > 2.52.0
> >

--=20
Thanks.
Binbin
