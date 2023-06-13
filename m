Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE54D522B
	for <loongarch@lists.linux.dev>; Tue, 13 Jun 2023 12:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1686660430; x=1718196430;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9KV3amG53H3ns2W2UWEPrWJRjgAoTih55p2OZIWk4nM=;
  b=bq2uFc8pnAZpj0Vx5ArYoibJeRlknW72pp/2I9+kL5iUWVQH4Tddm2tz
   oK6ntGNCbqTqGQWQU0ZZOtrhCCXJoIQNGZylxCXopwy4yOGchBFiwuWDq
   dzNzVDcFAHjYNC4X1vYFOyg/Kh+p+KHHpm08fLNr4cm06vRYtpf8yGe9+
   JXucXamWiYQZZdGAZdb0FKNSqautd1uVBM7gE5+LEJzcmMjxOj1CyaZqp
   BL2MyGXW6RmGpp+iseZmKAyTkrJlw8ag9JVgVT1JM5xaRno5AWRtntLcm
   z0eEMgjKWnw7KLQ9KMy/IgBzSMk0cO1NW5nyAq0miXN65nhY1C7bTp2xq
   A==;
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="asc'?scan'208";a="229858885"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Jun 2023 05:47:08 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 13 Jun 2023 05:47:08 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 13 Jun 2023 05:47:06 -0700
Date: Tue, 13 Jun 2023 13:46:41 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Yingkun Meng <mengyingkun@loongson.cn>
CC: Conor Dooley <conor@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<robh+dt@kernel.org>, <conor+dt@kernel.org>, <broonie@kernel.org>,
	<lgirdwood@gmail.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<loongarch@lists.linux.dev>, <loongson-kernel@lists.loongnix.cn>
Subject: Re: [ PATCH v2 3/3] ASoC: dt-bindings: Add support for Loongson
 audio card
Message-ID: <20230613-depletion-garnet-ccc2009111c3@wendy>
References: <20230612085614.3039498-1-mengyingkun@loongson.cn>
 <20230612-booted-french-186dd95e78a9@spud>
 <bda7c25f-65cf-d45f-3ac0-f2471e3aacf8@loongson.cn>
 <20230613-zoologist-panorama-a87858bba075@wendy>
 <887f9cc4-6457-9d14-8aef-011ff4c9aeda@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aKk1AB1djxJIjJ7/"
Content-Disposition: inline
In-Reply-To: <887f9cc4-6457-9d14-8aef-011ff4c9aeda@loongson.cn>

--aKk1AB1djxJIjJ7/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 13, 2023 at 08:38:59PM +0800, Yingkun Meng wrote:
> On 2023/6/13 20:28, Conor Dooley wrote:
> > On Tue, Jun 13, 2023 at 08:23:58PM +0800, Yingkun Meng wrote:
> > > On 2023/6/13 01:24, Conor Dooley wrote:
> > > > On Mon, Jun 12, 2023 at 04:56:14PM +0800, YingKun Meng wrote:
> > > > > From: Yingkun Meng <mengyingkun@loongson.cn>
> > > > >=20
> > > > > The audio card uses loongson I2S controller present in
> > > > > 7axxx/2kxxx chips to transfer audio data.
> > > > >=20
> > > > > On loongson platform, the chip has only one I2S controller.

> > > > > +description:
> > > > > +  The binding describes the sound card present in loongson
> > > > > +  7axxx/2kxxx platform. The sound card is an ASoC component
> > > > > +  which uses Loongson I2S controller to transfer the audio data.
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    const: loongson,ls-audio-card

> > > > Reviewing sound stuff is beyond my pay grade, so forgive me if I am=
 off
> > > > the rails here, but this (and the "x"s in the description) look a b=
it
> > > > odd. Recently, we've noticed quite a few loongson dt-bindings attem=
pting
> > > > to use a single compatible for many different chips.
> > > > Usually you have individual compatibles for the various SoCs with t=
his
> > > > core, which can fall back to a generic one, rather than just adding=
 a
> > > > generic compatible for all devices.
> > > > As far as I know, there's several SoCs fitting 2kxxx, and the format
> > > > being used elsewhere is "loongson,ls2k1000" etc.
> > >=20
> > > Currently, Loongson has 2K0500/2K1000LA/2K1500/2K2000 chips.
> > >=20
> > > Here, its' possible to use a single compatible for different chips,
> > >=20
> > > as the audio device is a logical device, not dependent on chip model.
> > What, may I ask, is a "logical device"?
>=20
>=20
> I means it's not a physical one, like "platform bus".

So it is entirely a software construct? Why does it need a dt-binding
then? Your commit message says the controller is present on the device!

Confused,
Conor.

--aKk1AB1djxJIjJ7/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIhlMQAKCRB4tDGHoIJi
0k/DAQCasCv+M+mHIyy3THECy16Hhwe7ITu/f3lb4MVy64A/CwD7BlnAWtgAfv7H
IktHIHxxC6ITwBVp8qA9b1IE2/XejAA=
=INbA
-----END PGP SIGNATURE-----

--aKk1AB1djxJIjJ7/--
