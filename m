Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163CEC2EF
	for <loongarch@lists.linux.dev>; Wed, 16 Aug 2023 06:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1692168707; x=1723704707;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/SllCHZ5O5kSLTaNGgz3gH/wnxA2LnBuE4r9ZY41rCE=;
  b=OrzKWT2WqwJpi+S53UiFcMki1UzdNLKuukMrsd2FqitEWn6BNXpOINRC
   PyaxLU+eoqdf+LFaEuCiLSVBh+wTzLoN3PoDozTg7Zu9P4SXKY/26BtnH
   DQ9Y2gYSo60SA9mfOclaC2QqjQU2XmTSYE8q6cFgWLhAaoBi4t88K5+5i
   L3We8SVj7joxIgxoV/seGgwhHOSG98Guff6hZFZlW/oO2HqyPNdSsh7Bw
   p4uyBH2+Kg9X4b5eDmlXcn2mwKA8TRqcife/yjlJ4qgCFeskAqxMEpdNX
   Pjr5nNUdGDHr2DnA4rEDn5bY4/mWCW+pA0Fa47lVpD9s2HiaoQ/xrx597
   A==;
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="asc'?scan'208";a="241857277"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Aug 2023 23:51:40 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 15 Aug 2023 23:50:58 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 15 Aug 2023 23:50:55 -0700
Date: Wed, 16 Aug 2023 07:50:16 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Binbin Zhou <zhoubb.aaron@gmail.com>
CC: Conor Dooley <conor@kernel.org>, Binbin Zhou <zhoubinbin@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>, Huacai Chen
	<chenhuacai@kernel.org>, <loongson-kernel@lists.loongnix.cn>, Xuerui Wang
	<kernel@xen0n.name>, <loongarch@lists.linux.dev>, Jiaxun Yang
	<jiaxun.yang@flygoat.com>, Hongliang Wang <wanghongliang@loongson.cn>
Subject: Re: [PATCH v2 1/7] dt-bindings: loongarch: Add CPU bindings for
 LoongArch
Message-ID: <20230816-battery-subarctic-266765b510bc@wendy>
References: <cover.1692088166.git.zhoubinbin@loongson.cn>
 <0e70f7d95104fc9d0a8038c3f0652f5fdfafa4d0.1692088166.git.zhoubinbin@loongson.cn>
 <20230815-aversion-shore-7ba847f2606e@spud>
 <CAMpQs4+aeD-3oh9qNbGjOTiMc6zE6N6LPzv+5tZyrLNgH06jtQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bq4MT5LYbivFrSLO"
Content-Disposition: inline
In-Reply-To: <CAMpQs4+aeD-3oh9qNbGjOTiMc6zE6N6LPzv+5tZyrLNgH06jtQ@mail.gmail.com>

--bq4MT5LYbivFrSLO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 16, 2023 at 02:37:43PM +0800, Binbin Zhou wrote:
> Hi Conor:
>=20
> Thanks for the reply.
>=20
> On Tue, Aug 15, 2023 at 10:07=E2=80=AFPM Conor Dooley <conor@kernel.org> =
wrote:
> >
> > On Tue, Aug 15, 2023 at 04:50:46PM +0800, Binbin Zhou wrote:
> > > Add the available CPUs in LoongArch binding with DT schema format usi=
ng
> > > json-schema.
> > >
> > > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > > ---
> > >  .../devicetree/bindings/loongarch/cpus.yaml   | 60 +++++++++++++++++=
++
> > >  1 file changed, 60 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/loongarch/cpus.=
yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/loongarch/cpus.yaml b/=
Documentation/devicetree/bindings/loongarch/cpus.yaml
> > > new file mode 100644
> > > index 000000000000..ee3fe09e53dc
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/loongarch/cpus.yaml
> > > @@ -0,0 +1,60 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/loongarch/cpus.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: LoongArch CPUs
> > > +
> > > +maintainers:
> > > +  - Binbin Zhou <zhoubinbin@loongson.cn>
> > > +
> > > +description:
> > > +  This document describes the list of LoongArch CPU cores that suppo=
rt FDT,
> > > +  it describe the layout of CPUs in a system through the "cpus" node.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - loongson,la264
> > > +      - loongson,la364
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    maxItems: 1
> > > +
> > > +  device_type: true
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - clocks
> > > +
> > > +additionalProperties: false
> >
> > How come you didn't add the reference to the common cpu schema?
>=20
> Do you mean:
> allOf:
>   - $ref: /schemas/cpu.yaml#

Yes.

> Sorry, the file started out as a copy of mips/arm and then the related
> content, really didn't notice that part.
> I will check again.
>=20
> Also, shouldn't "additionalProperties: false" be changed to
> "unevaluatedProperties: false" synchronously?

To actually make use of the properties from there, yeah.

--bq4MT5LYbivFrSLO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNxxowAKCRB4tDGHoIJi
0rBVAQCKZkQLR88fu2610e8NrDbHutoWbLqmb6HphjHk8nBAlgEAruYkoOJISV7H
MivE0o8qsLfPlwSXyGDXEpxMl3VPPQM=
=SReg
-----END PGP SIGNATURE-----

--bq4MT5LYbivFrSLO--
