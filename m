Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07FC10978
	for <loongarch@lists.linux.dev>; Tue, 15 Aug 2023 14:07:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3F0FC433CB;
	Tue, 15 Aug 2023 14:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692108454;
	bh=nl+kFCVLzWiya1I4w+ZrCF5WMRk9MTtdx5R9twab/5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X1YYX0Pn/w30QN2sdM2sqNsOrV5ev2RKLaB7Dpdzkax+9BXTRI3mORRQTDWVU+OM9
	 Tc4TQuUn8zFBUc+gRVHwQvMkFcO99qm5EDO13rcCIIx5n++JczoF58ppv8DhDB/lBW
	 4UWi7mhvzroJ0D+rfM7gEfWZ4wBikek97Oro8KUobHVcSm0SmfH/alj+wJk1mYlKtT
	 fPSWX1sgh8ZUVshubgK73v/zcciZa10y/MUn6ySf0XLd8+1UCrCVUDqnjSU3kjeJ2G
	 M3UPhNdyjGrorgWZf1Zep1wLz/BMN/H8qxtQxyhyvsKEENsLcGjBsb0Q5tWtY7TLgq
	 DOCOy5ZYBBchw==
Date: Tue, 15 Aug 2023 15:07:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn, Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev, Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Hongliang Wang <wanghongliang@loongson.cn>
Subject: Re: [PATCH v2 1/7] dt-bindings: loongarch: Add CPU bindings for
 LoongArch
Message-ID: <20230815-aversion-shore-7ba847f2606e@spud>
References: <cover.1692088166.git.zhoubinbin@loongson.cn>
 <0e70f7d95104fc9d0a8038c3f0652f5fdfafa4d0.1692088166.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="P9q8KaCDIKXIHVoW"
Content-Disposition: inline
In-Reply-To: <0e70f7d95104fc9d0a8038c3f0652f5fdfafa4d0.1692088166.git.zhoubinbin@loongson.cn>


--P9q8KaCDIKXIHVoW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 15, 2023 at 04:50:46PM +0800, Binbin Zhou wrote:
> Add the available CPUs in LoongArch binding with DT schema format using
> json-schema.
>=20
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  .../devicetree/bindings/loongarch/cpus.yaml   | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/loongarch/cpus.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/loongarch/cpus.yaml b/Docu=
mentation/devicetree/bindings/loongarch/cpus.yaml
> new file mode 100644
> index 000000000000..ee3fe09e53dc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/loongarch/cpus.yaml
> @@ -0,0 +1,60 @@
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
> +  This document describes the list of LoongArch CPU cores that support F=
DT,
> +  it describe the layout of CPUs in a system through the "cpus" node.
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
> +  clocks:
> +    maxItems: 1
> +
> +  device_type: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +additionalProperties: false

How come you didn't add the reference to the common cpu schema?

Thanks,
Conor.

> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/loongson,ls2k-clk.h>
> +
> +    cpus {
> +        #size-cells =3D <0>;
> +        #address-cells =3D <1>;
> +
> +        cpu@0 {
> +            compatible =3D "loongson,la264";
> +            device_type =3D "cpu";
> +            reg =3D <0>;
> +            clocks =3D <&clk LOONGSON2_NODE_CLK>;
> +        };
> +
> +        cpu@1 {
> +            compatible =3D "loongson,la264";
> +            device_type =3D "cpu";
> +            reg =3D <1>;
> +            clocks =3D <&clk LOONGSON2_NODE_CLK>;
> +        };
> +    };
> +
> +...
> --=20
> 2.39.3
>=20

--P9q8KaCDIKXIHVoW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNuGoQAKCRB4tDGHoIJi
0uAQAQC3JugNIORQk89mQvCQANvoEfpxKECyzAAIW2XGMtZ4fgEAp5I8rnO/iwEL
tcmVUv05I6KCjhvMSLSChqsDo1U8WQY=
=8G32
-----END PGP SIGNATURE-----

--P9q8KaCDIKXIHVoW--
