Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FBA6117
	for <loongarch@lists.linux.dev>; Fri, 16 Jun 2023 09:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1686908078; x=1718444078;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+sIuStPwhk3HpDjwFjm42VAwU7yL0atxyapy1gcOQ5k=;
  b=sqEyjYhVfMmFQXcH38BApCGv5QOh3JSiaBVPIknG1vvVjibpo8zxQKx3
   SV1sB2MA1TNDNfim6mcAq/5iifqxzF+kqpp6+xXJZInBQyFD0/Yx7t8vd
   fZ5/oTSfdp+ioXphn5Fo821dHDaH69wH1FbnSzvMDdK6pezAALMMWrxil
   iwtY836ik8rj+Tzbgl1ZGYfzZCdf+qepI8o7Php7LyP/EFrIv7AkI+KSo
   iKIo653E0V4c6WQJg0cUVw/rYGJYDswHAN8A0hVc8fABpmqbuJ0LUX4YH
   XxTgdywYYs7bMt+g9+NQ7lxI+6G8sOf/YW2lYG/E+JEDOr624kmIqqcum
   w==;
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="asc'?scan'208";a="218855619"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Jun 2023 02:34:36 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 16 Jun 2023 02:34:34 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 16 Jun 2023 02:34:32 -0700
Date: Fri, 16 Jun 2023 10:34:06 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>
CC: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen
	<chenhuacai@loongson.cn>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>, Huacai Chen
	<chenhuacai@kernel.org>, <loongson-kernel@lists.loongnix.cn>, Xuerui Wang
	<kernel@xen0n.name>, <loongarch@lists.linux.dev>, Jiaxun Yang
	<jiaxun.yang@flygoat.com>, Hongliang Wang <wanghongliang@loongson.cn>
Subject: Re: [PATCH 1/6] dt-bindings: loongarch: Add CPU bindings for
 LoongArch
Message-ID: <20230616-gallon-shrank-42613cd73666@wendy>
References: <cover.1686882123.git.zhoubinbin@loongson.cn>
 <c1f86e5d1026937abda331ce564e5ee96b7114c7.1686882123.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uBUOmwJN3yydd1Kg"
Content-Disposition: inline
In-Reply-To: <c1f86e5d1026937abda331ce564e5ee96b7114c7.1686882123.git.zhoubinbin@loongson.cn>

--uBUOmwJN3yydd1Kg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 16, 2023 at 02:10:38PM +0800, Binbin Zhou wrote:
> Add the available CPUs in LoongArch binding with DT schema format using
> json-schema.
>=20
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  .../devicetree/bindings/loongarch/cpus.yaml   | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/loongarch/cpus.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/loongarch/cpus.yaml b/Docu=
mentation/devicetree/bindings/loongarch/cpus.yaml
> new file mode 100644
> index 000000000000..c3e2dba42c81
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/loongarch/cpus.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/loongarch/cpus.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LoongArch CPUs
> +
> +maintainers:
> +  - Binbin Zhou <zhoubinbin@loongson.cn>
> +
> +description:
> +  The device tree allows to describe the layout of CPUs in a system thro=
ugh
> +  the "cpus" node, which in turn contains a number of subnodes (ie "cpu")
> +  defining properties for every CPU.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - loongson,la264
> +      - loongson,la364
> +
> +  reg:
> +    maxItems: 1
> +
> +  device_type: true
> +
> +  clock-frequency:
> +    description: The frequency of cpu in Hz.

Why don't you just add a ref to the common cpu schema and use the
standard properties for communicating clock frequencies?
You then get the standard properties for l1 caches, power management,
frequency scaling etc as a side effect.

Cheers,
Conor.

--uBUOmwJN3yydd1Kg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIwsjgAKCRB4tDGHoIJi
0lyRAQDqWQbNX8PfogJyMDJ0Is7f3IKFQbJYMT8+IS2POSQdWwEAhy8WIfZyYtuT
GYQhrjHSKmFEBVyJIcXoccnE8z/orQI=
=r4vj
-----END PGP SIGNATURE-----

--uBUOmwJN3yydd1Kg--
