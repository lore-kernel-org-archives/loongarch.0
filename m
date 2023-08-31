Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D83811CA4
	for <loongarch@lists.linux.dev>; Thu, 31 Aug 2023 15:18:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C433FC433C7;
	Thu, 31 Aug 2023 15:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693495107;
	bh=chVsIMOu9oCOiPsMP01v6kwk05XTPsTMRMcgWhZwFDk=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=AnLwpMuXrD1hO9PWFE3O3/SVsA0CGw+arOJJ9uEfDjZHNxLWmdRxQ8Cib7Hs/QhjM
	 XRw3IpBZqv+hbd06vlWgOitTxeHv9TxwRyA+bpJnWR+rW7HDSoHCL7piAlEkTu+hCr
	 TqcKtSraOp9uAjygnIDqDdAbA+e3G2ghtGv3INJvHih+frurDAFTXk9kxp4R1SpW14
	 3a7N8S3AyrEmCNvJhIjwv8juOhnxWuC3/OjqGsWn5VrM+Q3vdZXBzHJn1JMs5d4bSa
	 j3IoxJGsMpTNpueRC/p0jORTIhMG5ym+WSf1dfreyRlVqHVubE1rSbIfOCCiwkR3Lj
	 YxOovLFzoU0mw==
Date: Thu, 31 Aug 2023 16:18:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
List-Id: <soc.lore.kernel.org>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Yinbo Zhu <zhuyinbo@loongson.cn>, Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn, soc@kernel.org,
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
Subject: Re: [PATCH v2 2/5] dt-bindings: soc: loongson,ls2k-pmc: Use
 fallbacks for ls2k-pmc compatible
Message-ID: <20230831-caucasian-exclaim-11f8398605ed@spud>
References: <cover.1693474728.git.zhoubinbin@loongson.cn>
 <9e22a208934dde6e111a8436aa4b158669d027b5.1693474728.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LNcKyadeufLZ4+Em"
Content-Disposition: inline
In-Reply-To: <9e22a208934dde6e111a8436aa4b158669d027b5.1693474728.git.zhoubinbin@loongson.cn>


--LNcKyadeufLZ4+Em
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 31, 2023 at 07:43:12PM +0800, Binbin Zhou wrote:
> The Loongson-2K series chips (ls2k0500/ls2k1000/ls2k2000) share the same
> PM system controller, using ls2k0500 compatible as fallback for the
> others.
>=20
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  .../soc/loongson/loongson,ls2k-pmc.yaml         | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/loongson/loongson,ls2k=
-pmc.yaml b/Documentation/devicetree/bindings/soc/loongson/loongson,ls2k-pm=
c.yaml
> index da2dcfeebf12..c45f5e7fc0e6 100644
> --- a/Documentation/devicetree/bindings/soc/loongson/loongson,ls2k-pmc.ya=
ml
> +++ b/Documentation/devicetree/bindings/soc/loongson/loongson,ls2k-pmc.ya=
ml
> @@ -11,11 +11,16 @@ maintainers:
> =20
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - loongson,ls2k0500-pmc
> -          - loongson,ls2k1000-pmc
> -      - const: syscon
> +    oneOf:
> +      - items:
> +          - const: loongson,ls2k0500-pmc
> +          - const: syscon
> +      - items:
> +          - enum:
> +              - loongson,ls2k1000-pmc
> +              - loongson,ls2k2000-pmc
> +          - const: loongson,ls2k0500-pmc
> +          - const: syscon
> =20
>    reg:
>      maxItems: 1
> @@ -44,7 +49,7 @@ examples:
>      #include <dt-bindings/interrupt-controller/irq.h>
> =20
>      power-management@1fe27000 {
> -        compatible =3D "loongson,ls2k1000-pmc", "syscon";
> +        compatible =3D "loongson,ls2k1000-pmc", "loongson,ls2k0500-pmc",=
 "syscon";
>          reg =3D <0x1fe27000 0x58>;
>          interrupt-parent =3D <&liointc1>;
>          interrupts =3D <11 IRQ_TYPE_LEVEL_LOW>;
> --=20
> 2.39.3
>=20

--LNcKyadeufLZ4+Em
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZPCvPgAKCRB4tDGHoIJi
0tkBAP9nMrOiy6T562gSbsw/HZfcYcLwvxljdq6t8oaIsbFMcQEAwtEhIPLnsIzB
x5CqMi/Ff1ff2YY2Ra/amYPSIcIR+gI=
=wC5f
-----END PGP SIGNATURE-----

--LNcKyadeufLZ4+Em--
