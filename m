Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6390312B98
	for <loongarch@lists.linux.dev>; Mon, 22 May 2023 12:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1684759691; x=1716295691;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yxKglgoCICqxCp/YUO9N6SBOqlY2w1KxWsoJyA/AVRs=;
  b=RKgE6zoHQejIRpwP3t2A5xcBpx6rebUNvtOGUX6KHWz8YeoiHOYqHN1p
   q0/uvDppylwhR1s3nhkXwWz59GJOF4Ar9BnGrBmdAUtnMAAoTTHvEkaKM
   fM80wHDa8h8J47qJKbybm0aWsknb/ANbRo8ewnw+o19NvjqM+TRSrRRGs
   LfwTjQgCLKdF+Qcq1J8ZjrdHd7+0JA0VBWNJThoRFGw9jRpDIUYAqlEsU
   7k7soHJla88rLOYty+Ucfh5RSjcJrRfPGShWH1nVS8YY+TBQ2QU2tSe5P
   WnIH0Tiz8IXWmGoHRrkxDgJUAIIOQieHHNzY+kkzPCsRcOqRgpBMvseDV
   w==;
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="asc'?scan'208";a="214906449"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 May 2023 05:48:03 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 22 May 2023 05:48:02 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 22 May 2023 05:47:59 -0700
Date: Mon, 22 May 2023 13:47:37 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Yinbo Zhu <zhuyinbo@loongson.cn>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, "Rafael
 J . Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>, Tiezhu Yang
	<yangtiezhu@loongson.cn>, Marc Zyngier <maz@kernel.org>, Youling Tang
	<tangyouling@loongson.cn>, Baoqi Zhang <zhangbaoqi@loongson.cn>, Arnd
 Bergmann <arnd@arndb.de>, Yun Liu <liuyun@loongson.cn>,
	<linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <loongarch@lists.linux.dev>, Jianmin Lv
	<lvjianmin@loongson.cn>, <wanghongliang@loongson.cn>, Liu Peibao
	<liupeibao@loongson.cn>, <loongson-kernel@lists.loongnix.cn>
Subject: Re: [PATCH v2 2/3] dt-bindings: soc: add loongson-2 pm
Message-ID: <20230522-kooky-outbid-82662b45d305@wendy>
References: <20230522093156.7108-1-zhuyinbo@loongson.cn>
 <20230522093156.7108-3-zhuyinbo@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gKHvUwRJNqoRSsho"
Content-Disposition: inline
In-Reply-To: <20230522093156.7108-3-zhuyinbo@loongson.cn>

--gKHvUwRJNqoRSsho
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey!

On Mon, May 22, 2023 at 05:31:55PM +0800, Yinbo Zhu wrote:
> Add the Loongson-2 SoC Power Management Controller binding with DT
> schema format using json-schema.

Grabbing thread from lore.kernel.org/all/20230522093156.7108-3-zhuyinbo%40l=
oongson.cn/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 3 messages in the thread
Checking attestation on all messages, may take a moment...
---
  [PATCH v2 1/3] loongarch: export loongarch pm interface
    + Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
  [PATCH v2 2/3] dt-bindings: soc: add loongson-2 pm
    + Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
  ERROR: missing [3/3]!
---
Total patches: 2
---
WARNING: Thread incomplete!
Applying: loongarch: export loongarch pm interface
Applying: dt-bindings: soc: add loongson-2 pm

Looks like the user for these bindings got lost somewhere along the way?
Please make sure to keep a series threaded.

>=20
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
> ---
>  .../soc/loongson/loongson,ls2k-pmc.yaml       | 51 +++++++++++++++++++
>  MAINTAINERS                                   |  6 +++
>  2 files changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/loongson/loongs=
on,ls2k-pmc.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/soc/loongson/loongson,ls2k=
-pmc.yaml b/Documentation/devicetree/bindings/soc/loongson/loongson,ls2k-pm=
c.yaml
> new file mode 100644
> index 000000000000..ddad62889c60
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/loongson/loongson,ls2k-pmc.ya=
ml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/loongson/loongson,ls2k-pmc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Loongson-2 Power Manager controller
> +
> +maintainers:
> +  - Yinbo Zhu <zhuyinbo@loongson.cn>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - loongson,ls2k-pmc
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  suspend-address:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The "suspend-address" is a deep sleep state (Suspend To RAM)
> +      firmware entry address which was jumped from kernel and it's
> +      value was dependent on specific platform firmware code. In
> +      addition, the PM need according to it to indicate that current
> +      SoC whether support Suspend To RAM.

I (still) think this property is rather odd, maybe I am just not really
understanding the property as it seems to be described partly in terms
of operating system behaviour rather than its actual function. "was
jumped from kernel" I don't get.

The whole setup here seems a bit odd, but that's for the loongson arch
folks reviewing the actual code to comment on!

Thanks,
Conor.

--gKHvUwRJNqoRSsho
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGtkaQAKCRB4tDGHoIJi
0lI/AP9QXb2RsmKR29etNH1JpHYidwCCU9a2ysUEbVebSFyQYwD6AytJGE2GQLfa
2xQLm5VNuuHYmHeEFacgzuPyui/L4gg=
=xr43
-----END PGP SIGNATURE-----

--gKHvUwRJNqoRSsho--
