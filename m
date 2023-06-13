Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C5E18002
	for <loongarch@lists.linux.dev>; Tue, 13 Jun 2023 14:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1686666609; x=1718202609;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uE8h88szvoGxwdIx+6c5cOD/htbOXhAFq/tdRywRONE=;
  b=OUXMPWbQ6hSbeMeqgIUoZkJPr0tV2ujdz80XHQ6goDFIRptDO4Fl5P1j
   OXas0RAwOYivzEdg1nWqqksVxC0cvqfxcnz+/IsYzeo8nZ+Srl1w6xhuj
   oJH5/ypi0eaE7Vn3//VFXwqvHqR67OUU7Oe0wh+/Y72jDk4JDuc9PT+EE
   G0qotngX9DbgkJiniE9LAdNJwqO+9Mi0hM6hscz5mffIbmBwuJlTtAmyG
   S0fzmHuf8dvJcdGrviBYgUY94YlSmvmpxLsYIagqYfK/xYRwdQME5ZEBl
   6jzQ6TqdZOHtN+I7fARav2Em8W70XtE/Jhroz2PyGF95QhWtVJpYrTL91
   g==;
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="asc'?scan'208";a="215841586"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Jun 2023 07:30:05 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 13 Jun 2023 07:30:01 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 13 Jun 2023 07:29:59 -0700
Date: Tue, 13 Jun 2023 15:29:33 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Mark Brown <broonie@kernel.org>
CC: Yingkun Meng <mengyingkun@loongson.cn>, Conor Dooley <conor@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <robh+dt@kernel.org>,
	<conor+dt@kernel.org>, <lgirdwood@gmail.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<loongarch@lists.linux.dev>, <loongson-kernel@lists.loongnix.cn>
Subject: Re: [ PATCH v2 3/3] ASoC: dt-bindings: Add support for Loongson
 audio card
Message-ID: <20230613-crewmate-levitate-597ab96ea2d7@wendy>
References: <20230612085614.3039498-1-mengyingkun@loongson.cn>
 <20230612-booted-french-186dd95e78a9@spud>
 <bda7c25f-65cf-d45f-3ac0-f2471e3aacf8@loongson.cn>
 <20230613-zoologist-panorama-a87858bba075@wendy>
 <887f9cc4-6457-9d14-8aef-011ff4c9aeda@loongson.cn>
 <20230613-depletion-garnet-ccc2009111c3@wendy>
 <449d07d9-5538-4f36-83a0-3a81a9ab9ea2@sirena.org.uk>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="F73UMBvZBx0/ykU7"
Content-Disposition: inline
In-Reply-To: <449d07d9-5538-4f36-83a0-3a81a9ab9ea2@sirena.org.uk>

--F73UMBvZBx0/ykU7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 13, 2023 at 02:54:36PM +0100, Mark Brown wrote:
> On Tue, Jun 13, 2023 at 01:46:41PM +0100, Conor Dooley wrote:
>=20
> > So it is entirely a software construct? Why does it need a dt-binding
> > then? Your commit message says the controller is present on the device!
>=20
> A typical embedded (or power efficient laptop) audio design will consist
> of multiple devices connected together (frequently via non-control
> buses) together with system level passive components and plastics which
> are also important to the audio configuration.  A card binding describes
> the interconections between the devices in the system and provides
> identification information for the audio subsystem.  This system level
> audio integration is a physical thing that can be pointed at that
> requires real software control.

The bit you were responding to with that was a disingenuous question.
Probably not fair of me to ask one of a non-native speaker like that,
when all I wanted to know was whether it was appropriate not to add
a more specific compatible, or whether this was something invariant.

> Like I said before please look at the existing audio card bindings.

Yah, ofc I did that to see if there were other similar bindings that
used specific compatibles...


--F73UMBvZBx0/ykU7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIh9TQAKCRB4tDGHoIJi
0im6AQCKC+utNKucFVTzatpu/JT9toHFnwcH/P19lIwDWM2GMwD+LgeihZ5UpRNH
1O78Io5ySAoSy/xH4fujDTp98LU1SQI=
=AuWz
-----END PGP SIGNATURE-----

--F73UMBvZBx0/ykU7--
