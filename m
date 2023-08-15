Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94675C9D
	for <loongarch@lists.linux.dev>; Tue, 15 Aug 2023 14:13:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A4C0C433C7;
	Tue, 15 Aug 2023 14:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692108815;
	bh=su+jkVPteD3s6jTk1W2/bTzuXl+Q11GhAKLywQaYg8o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XgUKfoQpiqXzQbUdd5xMQ1kkrDkMy8f2LrzvEdJid6KIjNulPTmF/iANq6EhQ7yXd
	 gGJ8osK9DhHTbg2Oo1bFE1a82hUn1EHmYzcmSV39g0koRl3nU1cHDtMQwdrUillSVG
	 3/ObvQOnnAUmca9BDo8q0sd3wcMZgbls1unPYddRxl4XEq0m7N4odpIngDZ6wBEpNN
	 RDLR6+iZpzGHBDyc0a/bpK7R4r3H5AE/9W4jyPyqJ58oZYw0+9FEurkMR35EcNdLL8
	 n7uu4CytCfoNTKfrViEW3QjRpuk2xvMLTlKmnutaxRQUUMMnA75sYGJCtHfFfA3L3Q
	 5aucJLSS48EBw==
Date: Tue, 15 Aug 2023 15:13:30 +0100
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
Subject: Re: [PATCH v2 2/7] dt-bindings: loongarch: Add Loongson SoC boards
 compatibles
Message-ID: <20230815-fineness-lesser-d807c051dd36@spud>
References: <cover.1692088166.git.zhoubinbin@loongson.cn>
 <6d8d0d8d21e32e0577565158bc1c4960a92fb216.1692088166.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Tc3jO4bPfiHqARNv"
Content-Disposition: inline
In-Reply-To: <6d8d0d8d21e32e0577565158bc1c4960a92fb216.1692088166.git.zhoubinbin@loongson.cn>


--Tc3jO4bPfiHqARNv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 15, 2023 at 04:50:47PM +0800, Binbin Zhou wrote:
> Add Loongson SoC boards binding with DT schema format using json-schema.
>=20
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  .../devicetree/bindings/loongarch/boards.yaml | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/loongarch/boards.ya=
ml
>=20
> diff --git a/Documentation/devicetree/bindings/loongarch/boards.yaml b/Do=
cumentation/devicetree/bindings/loongarch/boards.yaml
> new file mode 100644
> index 000000000000..5092314b7a52
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/loongarch/boards.yaml
> @@ -0,0 +1,34 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/loongarch/boards.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Loongson SoC-based boards
> +
> +maintainers:
> +  - Binbin Zhou <zhoubinbin@loongson.cn>
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +      - description: Loongson-2K0500 processor based boards
> +        items:
> +          - const: loongson,ls2k0500-ref
> +          - const: loongson,ls2k0500
> +
> +      - description: Loongson-2K1000 processor based boards
> +        items:
> +          - const: loongson,ls2k1000-ref
> +          - const: loongson,ls2k1000
> +
> +      - description: Loongson-2K2000 processor based boards
> +        items:
> +          - const: loongson,ls2k2000-ref
> +          - const: loongson,ls2k2000

Do all of these SoCs just have a single reference/dev board?

> +
> +additionalProperties: true
> +
> +...
> --=20
> 2.39.3
>=20

--Tc3jO4bPfiHqARNv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNuICgAKCRB4tDGHoIJi
0ou3AQDV1TpTeN3zQ/YW7YbKXUMbPFB722jwGrw3ESXQbbXfVAEAlQN2z2SuSFd/
wxDwiwnhEuMdG9uk4NeBJDLy/o9cMQY=
=G7Ja
-----END PGP SIGNATURE-----

--Tc3jO4bPfiHqARNv--
