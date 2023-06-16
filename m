Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36136117
	for <loongarch@lists.linux.dev>; Fri, 16 Jun 2023 09:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1686908913; x=1718444913;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y5n7yC/vISMKem0iffVvi0/qroRR/9KszNztOx6UeYk=;
  b=vWVjo4jAvW6PsRtyLaRNqN2wtHLzkgZVTyjjf0kKZ4e2IdL2yu37teHo
   NdeiwXOiKq+aBVpauDbhQ2kvy4timnrA7jh/GDM7bFM/mmwqA8iNEIlaL
   I4SkAihaPJX5e2VUZ5qDDuu+VDQ+FnNr54Zms6VaatCX6fnoimSwCw/xa
   F10lN9g1pMKcMV6IQRgZtgi2iISwbzc8JINWFDBYb0JgMmwKo5xaq6Cxj
   IyklyFmRGH6Yvr9ToorknstNn6/Dj57A5kczeAzTdvjykBcLmwSCynQea
   ef6u//y6J958WSrjN5ayha38Xw/RfVyWoQuITvgCDmUgeCgGJwFu8qnfg
   Q==;
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="asc'?scan'208";a="216332419"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Jun 2023 02:48:30 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 16 Jun 2023 02:48:29 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 16 Jun 2023 02:48:27 -0700
Date: Fri, 16 Jun 2023 10:48:01 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>
CC: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen
	<chenhuacai@loongson.cn>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>, Huacai Chen
	<chenhuacai@kernel.org>, <loongson-kernel@lists.loongnix.cn>, Xuerui Wang
	<kernel@xen0n.name>, <loongarch@lists.linux.dev>, Jiaxun Yang
	<jiaxun.yang@flygoat.com>, Hongliang Wang <wanghongliang@loongson.cn>
Subject: Re: [PATCH 5/6] LoongArch: DeviceTree for Loongson-2K1000
Message-ID: <20230616-projector-visible-4135a378fb56@wendy>
References: <cover.1686882123.git.zhoubinbin@loongson.cn>
 <99bdbfc66604b4700e3e22e28c3d27ef7c9c9af7.1686882123.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bwrJwWy7hDRGQGpa"
Content-Disposition: inline
In-Reply-To: <99bdbfc66604b4700e3e22e28c3d27ef7c9c9af7.1686882123.git.zhoubinbin@loongson.cn>

--bwrJwWy7hDRGQGpa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 16, 2023 at 02:11:31PM +0800, Binbin Zhou wrote:

> +	memalloc@0 {
> +		compatible = "loongson,ls-memalloc";
> +		reg = <0 0x90000000 0 0x20000000>;
> +	};

This is not documented.

> +		gpio0: gpio@1fe00500 {
> +			compatible = "loongson,ls2k-gpio", "syscon";

This isn't valid either, the binding doesn't allow syscon?

> +			ethernet@3,1 {
> +				compatible = "pci0014,7a03.0",
> +					     "pci0014,7a03",
> +					     "pciclass,020000",
> +					     "pciclass,0200",
> +					     "loongson, pci-gmac";

None of the compatibles from here on out are documented either.

Cheers,
Conor.

--bwrJwWy7hDRGQGpa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIwv0QAKCRB4tDGHoIJi
0hYmAQDSiQ0DK2dsnrg5ANnfxfoKM33ysfcCo/tyrNE8+skRLQEAshmkWYjTyvU+
9F1UIKFC2ftwm8K7fyGdTFXv88qWugo=
=ioCB
-----END PGP SIGNATURE-----

--bwrJwWy7hDRGQGpa--
