Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FA06117
	for <loongarch@lists.linux.dev>; Fri, 16 Jun 2023 09:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1686908231; x=1718444231;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HQvWz81Ld93c01HSutLc5bamb4ebTB0r8Bnb201rjcs=;
  b=iemAkx1C6yRkT0JqE7PEjsMS7CWKc8fL1lCcJ9jQGXwxhhaduSsOGJjv
   K+ljOU0cP7q2cOQSH5aKE28kZKJ7/QeLBF035IwKqBWJHGO+Z4slKcFUw
   vp+ZYM6CDOyYs4F5TNWNUIVmp50RpWGdloFnis3PH0hteMigT24eztPDj
   X4YE2jq6YEWNUOAMnq3KOtsV9conrbdF/DMpf9vihO4DIhH8wwU2V7Qej
   qsE+SJBF+9i1PI8XDPevLlVEYtkx0LN4DBGs/ugWZhTufjxCrSaNvim+q
   oogSAUabdLvDt6NXUjNPw5kXPZy0wjpiyUgwDCyOx2aIYFH6JhiZ8Q0Pv
   A==;
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="asc'?scan'208";a="230503115"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Jun 2023 02:37:09 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 16 Jun 2023 02:37:08 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 16 Jun 2023 02:37:06 -0700
Date: Fri, 16 Jun 2023 10:36:40 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>
CC: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen
	<chenhuacai@loongson.cn>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>, Huacai Chen
	<chenhuacai@kernel.org>, <loongson-kernel@lists.loongnix.cn>, Xuerui Wang
	<kernel@xen0n.name>, <loongarch@lists.linux.dev>, Jiaxun Yang
	<jiaxun.yang@flygoat.com>, Hongliang Wang <wanghongliang@loongson.cn>
Subject: Re: [PATCH 2/6] dt-bindings: loongarch: Add Loongson SoC boards
 compatibles
Message-ID: <20230616-endocrine-container-d2625622a56e@wendy>
References: <cover.1686882123.git.zhoubinbin@loongson.cn>
 <3b2ba830d81f85130e89316dc0c4d478482cd79d.1686882123.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gxUJ7EXtOGyJtlEQ"
Content-Disposition: inline
In-Reply-To: <3b2ba830d81f85130e89316dc0c4d478482cd79d.1686882123.git.zhoubinbin@loongson.cn>

--gxUJ7EXtOGyJtlEQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 16, 2023 at 02:10:39PM +0800, Binbin Zhou wrote:
> Add Loongson SoC boards binding with DT schema format using json-schema
>=20
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  .../devicetree/bindings/loongarch/boards.yaml | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/loongarch/boards.ya=
ml
>=20
> diff --git a/Documentation/devicetree/bindings/loongarch/boards.yaml b/Do=
cumentation/devicetree/bindings/loongarch/boards.yaml
> new file mode 100644
> index 000000000000..3ef87b732668
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/loongarch/boards.yaml
> @@ -0,0 +1,31 @@
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
> +          - const: loongson,ls2k0500
> +
> +      - description: Loongson-2K1000 processor based boards
> +        items:
> +          - const: loongson,ls2k1000
> +
> +      - description: Loongson-2K2000 processor based boards
> +        items:
> +          - const: loongson,ls2k2000

=46rom what I do know of loongarch stuff, these are all compatibles
for SoCs, not boards. The usual model would be to do something like
items:
  - const: loongsoon,ls2k1000-dev-kit
  - const: loongsoon,ls2k1000

Where you have a compatible for the SoC and one for the board.

Cheers,
Conor.

--gxUJ7EXtOGyJtlEQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIwtKAAKCRB4tDGHoIJi
0ghpAQCaA0pckhxQPaKLBZ9TXJCNQUIUIbBNNCrD8NHwpPe+EAD/QtT5jczbOJrS
keY6X3oqCjvD5sAL73q2TPM55lt8Lwo=
=8w59
-----END PGP SIGNATURE-----

--gxUJ7EXtOGyJtlEQ--
