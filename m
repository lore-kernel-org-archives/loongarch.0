Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20F31117
	for <loongarch@lists.linux.dev>; Sat, 17 Jun 2023 06:29:19 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5700401acbeso18675167b3.0
        for <loongarch@lists.linux.dev>; Fri, 16 Jun 2023 23:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686983359; x=1689575359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nGsJ3GmkLm/SN/kLvTNcYuy0c+xYeJmxn3Y+T48Gt3o=;
        b=rcXqNIwnXiQ4MbL/Tlyq/wIM/fW5ttpoYim4O0noMUOso517SAJAKbM8p1b3l/qM7S
         DgZRBJlwJ93X34A6esm/UxEO3gcxECVyrxBEGvk9HwFIdaoqnYNG3wOj7itk4+szKtuL
         b2NNF1IcyGuThMrdcbD1bttPgGKajvjYz671WWDDci+FR6TCKXkkvFPeJuFOmiN+hNya
         /NbbZZ2JlpwKPms5fo9q7fy2QUf/nWUaOqIOKVoyKz3QHS+WWB1x80wLFyEykmFb9i71
         8QikWYYKaeJlXiPFD3vTZ8LBW7JO4NnBOYB+6LxdopXy6lJ/hLgoaE5gY722owFXwZi4
         xOIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686983359; x=1689575359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nGsJ3GmkLm/SN/kLvTNcYuy0c+xYeJmxn3Y+T48Gt3o=;
        b=l+mH7DFKKRmZsXTyHGvDg6n5xxedvGfic9+HP1+c1xgB17PgXInti+7nFVRJ37X4JA
         59GwbchLA9jDTm/nNpi+h2UuF0FQI+EcaDjhHefVWEbiZUPZOdEsBXFzcbpQLzoP/mKL
         LNhVcLciK++2f5DZQNa+ZwKuzTQ+1qykjyJml1eFKbtxLrAoTdwGS9T1DYda5UwQR5To
         f5UMgLf8DAUazoz//dHxtPkVUKngJjFXEnjfrVijLUTfptbV92NAyStdMcA4n6cCYAvK
         qTyrOoZh7nCloiksLp6kb0jRVPMreCdHsZU4k1i5gHs2O0Rs7T7orP55ezFYe2hbVvu1
         dp+A==
X-Gm-Message-State: AC+VfDxz2RpfjHw7UEWptzYCGhhh8VvmtIMl8S0oee01lwA4CAgeTDNl
	A3IOiO7tq7xlrCaEkCi2oj/hM/i5f97dwcJoPCw=
X-Google-Smtp-Source: ACHHUZ7QN2ySclaaaIyW0feGuNgYn7FOUItA15CKRwTqaaNdVI/VT2l1kKGrQAOuOAOaGaPgoF2CiTlThU+wG6o4dF8=
X-Received: by 2002:a81:4788:0:b0:55d:a9d7:521e with SMTP id
 u130-20020a814788000000b0055da9d7521emr4350517ywa.18.1686983358711; Fri, 16
 Jun 2023 23:29:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1686882123.git.zhoubinbin@loongson.cn> <c1f86e5d1026937abda331ce564e5ee96b7114c7.1686882123.git.zhoubinbin@loongson.cn>
 <20230616-gallon-shrank-42613cd73666@wendy>
In-Reply-To: <20230616-gallon-shrank-42613cd73666@wendy>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Sat, 17 Jun 2023 14:29:06 +0800
Message-ID: <CAMpQs4J4hOAFaarv9O3u20czpNjeHfBoPHWOzY7Y_Zno0R3vYg@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: loongarch: Add CPU bindings for LoongArch
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, 
	loongson-kernel@lists.loongnix.cn, Xuerui Wang <kernel@xen0n.name>, 
	loongarch@lists.linux.dev, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Hongliang Wang <wanghongliang@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 16, 2023 at 5:34=E2=80=AFPM Conor Dooley <conor.dooley@microchi=
p.com> wrote:
>
> On Fri, Jun 16, 2023 at 02:10:38PM +0800, Binbin Zhou wrote:
> > Add the available CPUs in LoongArch binding with DT schema format using
> > json-schema.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  .../devicetree/bindings/loongarch/cpus.yaml   | 65 +++++++++++++++++++
> >  1 file changed, 65 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/loongarch/cpus.ya=
ml
> >
> > diff --git a/Documentation/devicetree/bindings/loongarch/cpus.yaml b/Do=
cumentation/devicetree/bindings/loongarch/cpus.yaml
> > new file mode 100644
> > index 000000000000..c3e2dba42c81
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/loongarch/cpus.yaml
> > @@ -0,0 +1,65 @@
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
> > +  The device tree allows to describe the layout of CPUs in a system th=
rough
> > +  the "cpus" node, which in turn contains a number of subnodes (ie "cp=
u")
> > +  defining properties for every CPU.
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
> > +  device_type: true
> > +
> > +  clock-frequency:
> > +    description: The frequency of cpu in Hz.
>
> Why don't you just add a ref to the common cpu schema and use the
> standard properties for communicating clock frequencies?
> You then get the standard properties for l1 caches, power management,
> frequency scaling etc as a side effect.

Hi Conor:

Sorry, not sure if I understand correctly. Do the standard attributes
refer to the following:

power-domains =3D <>
clocks =3D <>
i-cache-size =3D <>
d-cache-size =3D <>
next-level-cache =3D <>

Thanks.
Binbin

>
> Cheers,
> Conor.
