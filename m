Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D9AA2C
	for <loongarch@lists.linux.dev>; Fri, 16 Jun 2023 06:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1686898393; x=1718434393;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DfP80aMX1lRvp8K1WgBYcBrOAn2IwplXBMRbzSQMTDY=;
  b=Q8zPKu9uUEMiLDx+aR2USRCp8uMD4i+Er6Ge1fWeRfzlzS+KS1eOHnPR
   a+UfiKobKKWgwP8l/f6i3ew0MB6D3ZRQbTSsuH23775gPNNoOGTCjFKhw
   sFa9BQK/cq+f4/iWOdsbn0kvZF5l0HbaFysbqnAJDthwwwll//X8wNR3l
   Fa8o2OW6IWyR9VGdrpvpdEgmKp0uP5ryPUBQbZKOIIO7HvPLxYmyGD/RY
   E4hZyBgaCanA8exFNaVpKiEA4WS5iV4Q+Ll0l0xlCAqh30T7bRou3uyu4
   t5LstIBAimoB7HiBaPbfQB6qRMyQBX/UIlDcD8kls51IyEhGUrrGeypNi
   g==;
X-IronPort-AV: E=Sophos;i="6.00,246,1681196400"; 
   d="asc'?scan'208";a="218198302"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Jun 2023 23:53:06 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 15 Jun 2023 23:53:06 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 15 Jun 2023 23:53:03 -0700
Date: Fri, 16 Jun 2023 07:52:37 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: zhuyinbo <zhuyinbo@loongson.cn>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, "Rafael
 J . Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>, Marc Zyngier
	<maz@kernel.org>, Arnd Bergmann <arnd@arndb.de>, <linux-pm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<loongarch@lists.linux.dev>, Jianmin Lv <lvjianmin@loongson.cn>,
	<wanghongliang@loongson.cn>, Liu Peibao <liupeibao@loongson.cn>,
	<loongson-kernel@lists.loongnix.cn>
Subject: Re: [PATCH v3 3/3] soc: loongson2_pm: add power management support
Message-ID: <20230616-renewal-protract-78c3958f25db@wendy>
References: <20230615091757.24686-1-zhuyinbo@loongson.cn>
 <968b7c81-a24e-1e0d-31a4-f633a82d17b0@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iP03JPSlBlXaHcqU"
Content-Disposition: inline
In-Reply-To: <968b7c81-a24e-1e0d-31a4-f633a82d17b0@loongson.cn>

--iP03JPSlBlXaHcqU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 15, 2023 at 05:37:18PM +0800, zhuyinbo wrote:
> From 6edcb9d6a1b18ccbecaf283b4f543afc9e7126d6 Mon Sep 17 00:00:00 2001
> From: Yinbo Zhu <zhuyinbo@loongson.cn>
> Date: Tue, 18 Apr 2023 14:18:00 +0800
> Subject: [PATCH v3 3/3] soc: loongson2_pm: add power management support
>=20
> The Loongson-2's power management controller was ACPI, supports ACPI
> S2Idle (Suspend To Idle), ACPI S3 (Suspend To RAM), ACPI S4 (Suspend To
> Disk), ACPI S5 (Soft Shutdown) and supports multiple wake-up methods
> (USB, GMAC, PWRBTN, etc.). This driver was to add power management
> controller support that base on dts for Loongson-2 series SoCs.
>=20
> Signed-off-by: Liu Yun <liuyun@loongson.cn>
> Signed-off-by: Liu Peibao <liupeibao@loongson.cn>
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>

3 SoBs, should 2 of these have corresponding co-developed-bys?

--iP03JPSlBlXaHcqU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIwGtQAKCRB4tDGHoIJi
0qo+AQDEcsnXEK+TzB141FVZZK/bIeAQVbsVMSYqMCNyjDcNiAEAifjrCdvsuUOO
6GHuexf14yzPAw3u0jvbilovsBQFpAA=
=mq2y
-----END PGP SIGNATURE-----

--iP03JPSlBlXaHcqU--
