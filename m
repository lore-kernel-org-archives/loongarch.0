Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56205661
	for <loongarch@lists.linux.dev>; Fri, 16 Jun 2023 06:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1686898740; x=1718434740;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B24fwtB2ICXWiKb2YjOOU9xiIvWffWyp4EDuSS+K2kM=;
  b=rSpvt32Vo+fJto04yFCrcmJ5RfrBgeRITGptpgU+0AWdfKQ/+QFq3J2K
   waJZKrHBBkCKoY2LS+cTzUSqTiTJdefJaiZVUSnBPKJXPZ/dtUmyUc4cv
   TmwGbY4bPyVjbzvq3IzLgacoLhOpyCqp7CndBeTfGeKobWNqe4M2ZTM5l
   ofUiPscaJRQRnnMsyBODNK+D9dbRHkcEUuzmVu9WDzCV9/z448TTrgayG
   gxoSgJLd4SFmZ+nrkK3m1b4BDlDqW/UBjLVrzMavF+M3EhVaxscRM6VJy
   OKHHXWoLuxmzJD2yX8BmtS+0AtUASDVuKI42MqWMutA1iNJTgJemHmdKD
   A==;
X-IronPort-AV: E=Sophos;i="6.00,246,1681196400"; 
   d="asc'?scan'208";a="218830239"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Jun 2023 23:58:58 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 15 Jun 2023 23:58:58 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 15 Jun 2023 23:58:55 -0700
Date: Fri, 16 Jun 2023 07:58:29 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Yinbo Zhu <zhuyinbo@loongson.cn>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, "Rafael
 J . Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>, Marc Zyngier
	<maz@kernel.org>, Arnd Bergmann <arnd@arndb.de>, <linux-pm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<loongarch@lists.linux.dev>, Jianmin Lv <lvjianmin@loongson.cn>,
	<wanghongliang@loongson.cn>, Liu Peibao <liupeibao@loongson.cn>,
	<loongson-kernel@lists.loongnix.cn>
Subject: Re: [PATCH v3 2/3] soc: dt-bindings: add loongson-2 pm
Message-ID: <20230616-entangled-cauterize-1cbde7401b91@wendy>
References: <20230615091757.24686-1-zhuyinbo@loongson.cn>
 <20230615091757.24686-3-zhuyinbo@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pKwHiKupU1CL+x6/"
Content-Disposition: inline
In-Reply-To: <20230615091757.24686-3-zhuyinbo@loongson.cn>

--pKwHiKupU1CL+x6/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

Rob, could you take a look at this please? On v2 while you were away I
was kinda struggling w/ suspend-address & whether it made sense.

The v2 & v1 are here:
https://lore.kernel.org/all/20230522093156.7108-3-zhuyinbo@loongson.cn/
https://lore.kernel.org/all/20230517073149.31980-3-zhuyinbo@loongson.cn/

On Thu, Jun 15, 2023 at 05:17:56PM +0800, Yinbo Zhu wrote:
> Add the Loongson-2 SoC Power Management Controller binding with DT
> schema format using json-schema.
>=20
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
> ---
>  .../soc/loongson/loongson,ls2k-pmc.yaml       | 53 +++++++++++++++++++
>  MAINTAINERS                                   |  6 +++
>  2 files changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/loongson/loongs=
on,ls2k-pmc.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/soc/loongson/loongson,ls2k=
-pmc.yaml b/Documentation/devicetree/bindings/soc/loongson/loongson,ls2k-pm=
c.yaml
> new file mode 100644
> index 000000000000..32499bd10f8c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/loongson/loongson,ls2k-pmc.ya=
ml

The filename should ideally match one of the compatibles.

> @@ -0,0 +1,53 @@
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
> +    oneOf:
> +      - items:
> +          - enum:
> +              - loongson,ls2k1000-pmc
> +              - loongson,ls2k0500-pmc

I notice the driver only supports one of these two. Is there a reason
for that?

> +          - const: syscon
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
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    pmc: pm@1fe27000 {
       ^^^

nit: this label isn't used, so you can drop it.

Cheers,
Conor.

--pKwHiKupU1CL+x6/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIwIFQAKCRB4tDGHoIJi
0j0SAP4yEcxiKsuqkTFGnDCYoyr/wDXBuBcURftefENgTTZaRAEA4utfLQgRdtBs
jlzXhgfdNIcQkw/4ENO94EAQ69eyfQs=
=cZGJ
-----END PGP SIGNATURE-----

--pKwHiKupU1CL+x6/--
