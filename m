Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A2F2A9D1
	for <loongarch@lists.linux.dev>; Tue, 13 Jun 2023 12:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1686659331; x=1718195331;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M+YsxAsrMOdQXi3EjTzJQEXiDd2GLlwy4TAIkoE71E8=;
  b=L+ooH7MZl/EnlNPIj2K7l69RkLIrDeXaR5b+ei8AkyYDkw6tleICblx+
   omCQrIoVc1ZhIhP08CibaqeY9EsYeKTST1FrOrfLgfo0m0ZLdI9Bzcq4b
   lBbtapSx0SJ9aRYWDP6mnaTZdZjr61B8nG92zXYzbSlTOwjzSH7rIqkjN
   XRUntAWMUMWawIRZB4Y1fzCdnmxhBPR8FRkuzHGdOg7m0fH+FE+VEgras
   qcqG0GhZhVD4aaH9pvrnhFoEgaMj4bP3xkqXq+NpRXR+oTFmNEWQlBlai
   NmY0EKnulN8PhvnPJ5YT4O38wtkiCYo2amfd8cHlcZPQBSZwlt0uCtW/z
   g==;
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="asc'?scan'208";a="156745543"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Jun 2023 05:28:40 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 13 Jun 2023 05:28:38 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 13 Jun 2023 05:28:36 -0700
Date: Tue, 13 Jun 2023 13:28:11 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Yingkun Meng <mengyingkun@loongson.cn>
CC: Conor Dooley <conor@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<robh+dt@kernel.org>, <conor+dt@kernel.org>, <broonie@kernel.org>,
	<lgirdwood@gmail.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<loongarch@lists.linux.dev>, <loongson-kernel@lists.loongnix.cn>
Subject: Re: [ PATCH v2 3/3] ASoC: dt-bindings: Add support for Loongson
 audio card
Message-ID: <20230613-zoologist-panorama-a87858bba075@wendy>
References: <20230612085614.3039498-1-mengyingkun@loongson.cn>
 <20230612-booted-french-186dd95e78a9@spud>
 <bda7c25f-65cf-d45f-3ac0-f2471e3aacf8@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="b/Hqn05Zp1cdyDvp"
Content-Disposition: inline
In-Reply-To: <bda7c25f-65cf-d45f-3ac0-f2471e3aacf8@loongson.cn>

--b/Hqn05Zp1cdyDvp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 13, 2023 at 08:23:58PM +0800, Yingkun Meng wrote:
>=20
> On 2023/6/13 01:24, Conor Dooley wrote:
> > Hey!
> >=20
> > On Mon, Jun 12, 2023 at 04:56:14PM +0800, YingKun Meng wrote:
> > > From: Yingkun Meng <mengyingkun@loongson.cn>
> > >=20
> > > The audio card uses loongson I2S controller present in
> > > 7axxx/2kxxx chips to transfer audio data.
> > >=20
> > > On loongson platform, the chip has only one I2S controller.
> > >=20
> > > Signed-off-by: Yingkun Meng <mengyingkun@loongson.cn>
> > I got 2 copies of this patch, but none of the rest of the series appears
> > to be threaded with it.
> >=20
> > >   .../sound/loongson,ls-audio-card.yaml         | 70 ++++++++++++++++=
+++
> > >   1 file changed, 70 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/sound/loongson=
,ls-audio-card.yaml
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/sound/loongson,ls-audi=
o-card.yaml b/Documentation/devicetree/bindings/sound/loongson,ls-audio-car=
d.yaml
> > > new file mode 100644
> > > index 000000000000..61e8babed402
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.=
yaml
> > > @@ -0,0 +1,70 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/sound/loongson,ls-audio-card.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Loongson 7axxx/2kxxx ASoC audio sound card driver
> > > +
> > > +maintainers:
> > > +  - Yingkun Meng <mengyingkun@loongson.cn>
> > > +
> > > +description:
> > > +  The binding describes the sound card present in loongson
> > > +  7axxx/2kxxx platform. The sound card is an ASoC component
> > > +  which uses Loongson I2S controller to transfer the audio data.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: loongson,ls-audio-card
> > Reviewing sound stuff is beyond my pay grade, so forgive me if I am off
> > the rails here, but this (and the "x"s in the description) look a bit
> > odd. Recently, we've noticed quite a few loongson dt-bindings attempting
> > to use a single compatible for many different chips.
> > Usually you have individual compatibles for the various SoCs with this
> > core, which can fall back to a generic one, rather than just adding a
> > generic compatible for all devices.
> > As far as I know, there's several SoCs fitting 2kxxx, and the format
> > being used elsewhere is "loongson,ls2k1000" etc.
>=20
>=20
> Currently, Loongson has 2K0500/2K1000LA/2K1500/2K2000 chips.
>=20
> Here, its' possible to use a single compatible for different chips,
>=20
> as the audio device is a logical device, not dependent on chip model.

What, may I ask, is a "logical device"?

--b/Hqn05Zp1cdyDvp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIhg2wAKCRB4tDGHoIJi
0u4VAQCigbmTSbs6qKpLCthlel+v9B2o217oImTKlmwzgWRYqQEArSFE2JivD5nX
5x8XGvhmbqoQ+5dKs74EhWk1XyGz6Qs=
=K/HX
-----END PGP SIGNATURE-----

--b/Hqn05Zp1cdyDvp--
