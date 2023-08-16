Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBE91840
	for <loongarch@lists.linux.dev>; Wed, 16 Aug 2023 06:37:57 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-58caaedb20bso3173507b3.1
        for <loongarch@lists.linux.dev>; Tue, 15 Aug 2023 23:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692167876; x=1692772676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oyq+MCi5gf26UKktUdy52L07nCJdNsh2cPkbWhzrE2I=;
        b=GUkbxvYs5PPQrj32MOToKahzKzzMtsMQMA63OH5630JyhiQtCnU3IhZ2WQTRivED6q
         IrIsvk8Z8o3e3+CZ6AmBdr0e2/BkGoIpxwJTHX+C+kO8j64c25oQQxEgg3dr0bFdZOk1
         WpOKCze0WgxcGLwm6vKx1b8OGmBCdvWePEkZ5mPPRjX4iL8Od0I+wTWWxwDbx+iK1WmK
         ujmFaXjU1d9YGgOLkDa0tYhtB53X3CigvgGBWfPVtlPsIMTGYPiBfjG/1riw207Qj0fO
         93vytJLXL88mnRN3pUsxOtbL5ni8Yz0o5YqJJx/8t5p54tVzwaZoycawMhXW315fdA5P
         g6JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692167876; x=1692772676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oyq+MCi5gf26UKktUdy52L07nCJdNsh2cPkbWhzrE2I=;
        b=HAWfzzeUB15j06/O8cFoap6Eu7cuCdWJGf308H0LqBVyK6+Uj/kg7L9hfyMp/8XI1T
         vQRuxsU5zL5iSTVgjuPecHKnYbu79yaJz0tf/PyIo6rteICmb/Orbdb2CwAuw/GpG7bU
         LAFqAGf/S7TSKOouXMtOfZPUPfhzyZgBB2iYHAMl6SMjvTBYYmF5z4/Q6EmIia14SNsX
         MEvBtIt8elqyaLFHZiotx6fpLXSDa5dKh6E6qjAjjU4REWtbDL7ZsZA1hYIyuraWWoEL
         7pzPx20Ls+lCJ0fx+/cS6pryXIZhv7h2YGYRH5+Aff/c4DfXJO5QNUGz8RISHM/0JcoF
         jqLg==
X-Gm-Message-State: AOJu0YxhdVvNoghSYX6KblTKiYRAaGISL5WZDC4/uRtM2usNPEtV+R+m
	Kls8K2a6JWxwdwmX36dQ9o6oZSmeGrEMr7aw0Z8=
X-Google-Smtp-Source: AGHT+IHBX41feJrCCAMO33aQf83Ek++jKRUuvmWYrkluPqTfNNiAumWmuzrrgwS34zjNlGu05rFEqtNZt1ms+JEYYDw=
X-Received: by 2002:a0d:e253:0:b0:584:61df:45e8 with SMTP id
 l80-20020a0de253000000b0058461df45e8mr835069ywe.13.1692167876358; Tue, 15 Aug
 2023 23:37:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1692088166.git.zhoubinbin@loongson.cn> <0e70f7d95104fc9d0a8038c3f0652f5fdfafa4d0.1692088166.git.zhoubinbin@loongson.cn>
 <20230815-aversion-shore-7ba847f2606e@spud>
In-Reply-To: <20230815-aversion-shore-7ba847f2606e@spud>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 16 Aug 2023 14:37:43 +0800
Message-ID: <CAMpQs4+aeD-3oh9qNbGjOTiMc6zE6N6LPzv+5tZyrLNgH06jtQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: loongarch: Add CPU bindings for LoongArch
To: Conor Dooley <conor@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, 
	loongson-kernel@lists.loongnix.cn, Xuerui Wang <kernel@xen0n.name>, 
	loongarch@lists.linux.dev, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Hongliang Wang <wanghongliang@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor:

Thanks for the reply.

On Tue, Aug 15, 2023 at 10:07=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Tue, Aug 15, 2023 at 04:50:46PM +0800, Binbin Zhou wrote:
> > Add the available CPUs in LoongArch binding with DT schema format using
> > json-schema.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  .../devicetree/bindings/loongarch/cpus.yaml   | 60 +++++++++++++++++++
> >  1 file changed, 60 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/loongarch/cpus.ya=
ml
> >
> > diff --git a/Documentation/devicetree/bindings/loongarch/cpus.yaml b/Do=
cumentation/devicetree/bindings/loongarch/cpus.yaml
> > new file mode 100644
> > index 000000000000..ee3fe09e53dc
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/loongarch/cpus.yaml
> > @@ -0,0 +1,60 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/loongarch/cpus.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: LoongArch CPUs
> > +
> > +maintainers:
> > +  - Binbin Zhou <zhoubinbin@loongson.cn>
> > +
> > +description:
> > +  This document describes the list of LoongArch CPU cores that support=
 FDT,
> > +  it describe the layout of CPUs in a system through the "cpus" node.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - loongson,la264
> > +      - loongson,la364
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  device_type: true
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +
> > +additionalProperties: false
>
> How come you didn't add the reference to the common cpu schema?

Do you mean:
allOf:
  - $ref: /schemas/cpu.yaml#

Sorry, the file started out as a copy of mips/arm and then the related
content, really didn't notice that part.
I will check again.

Also, shouldn't "additionalProperties: false" be changed to
"unevaluatedProperties: false" synchronously?

Thanks.
Binbin
>
> Thanks,
> Conor.
>
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/loongson,ls2k-clk.h>
> > +
> > +    cpus {
> > +        #size-cells =3D <0>;
> > +        #address-cells =3D <1>;
> > +
> > +        cpu@0 {
> > +            compatible =3D "loongson,la264";
> > +            device_type =3D "cpu";
> > +            reg =3D <0>;
> > +            clocks =3D <&clk LOONGSON2_NODE_CLK>;
> > +        };
> > +
> > +        cpu@1 {
> > +            compatible =3D "loongson,la264";
> > +            device_type =3D "cpu";
> > +            reg =3D <1>;
> > +            clocks =3D <&clk LOONGSON2_NODE_CLK>;
> > +        };
> > +    };
> > +
> > +...
> > --
> > 2.39.3
> >
