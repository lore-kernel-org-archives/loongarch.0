Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D286522B
	for <loongarch@lists.linux.dev>; Tue, 13 Jun 2023 13:54:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71160C433D9;
	Tue, 13 Jun 2023 13:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686664483;
	bh=iSmSOi8YU02GjFRauD4K5+rplja7hUixCkETFWDQmlQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XJ5yJAExaLmvMqk4coILGi79B+899BpXgOZNH4uuP/eQuKwpaNkARmEFmkVgn7biz
	 EEk2e+3JekdMhMo0W7NRgYdtxxHKZ+2ekT+UnnDi7deCGPYnxY/WR/BnOeOTufBdXt
	 2CO2oDQnuIytFqJHXpZLWgWY2sVqHohlXOxyNOQLT/iDxGK5j29fqVnVKlwduZ5cjF
	 8S8JY68gz0Yn9r1clxM30GVBZT+z4k55qSAGM24UixT+z9/+OROWkalpCMi7/olPR+
	 Xoi0srk5u0usumLttenNwwwFYQwj4iXHoENmAPci1Y0sBd6eXoJJZqKdrlqxTtC7cH
	 X1AQRtNmIl8mw==
Date: Tue, 13 Jun 2023 14:54:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Yingkun Meng <mengyingkun@loongson.cn>, Conor Dooley <conor@kernel.org>,
	krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
	conor+dt@kernel.org, lgirdwood@gmail.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org, loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn
Subject: Re: [ PATCH v2 3/3] ASoC: dt-bindings: Add support for Loongson
 audio card
Message-ID: <449d07d9-5538-4f36-83a0-3a81a9ab9ea2@sirena.org.uk>
References: <20230612085614.3039498-1-mengyingkun@loongson.cn>
 <20230612-booted-french-186dd95e78a9@spud>
 <bda7c25f-65cf-d45f-3ac0-f2471e3aacf8@loongson.cn>
 <20230613-zoologist-panorama-a87858bba075@wendy>
 <887f9cc4-6457-9d14-8aef-011ff4c9aeda@loongson.cn>
 <20230613-depletion-garnet-ccc2009111c3@wendy>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bcFqVBu2j9qZWhmQ"
Content-Disposition: inline
In-Reply-To: <20230613-depletion-garnet-ccc2009111c3@wendy>
X-Cookie: Not a flying toy.


--bcFqVBu2j9qZWhmQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 13, 2023 at 01:46:41PM +0100, Conor Dooley wrote:

> So it is entirely a software construct? Why does it need a dt-binding
> then? Your commit message says the controller is present on the device!

A typical embedded (or power efficient laptop) audio design will consist
of multiple devices connected together (frequently via non-control
buses) together with system level passive components and plastics which
are also important to the audio configuration.  A card binding describes
the interconections between the devices in the system and provides
identification information for the audio subsystem.  This system level
audio integration is a physical thing that can be pointed at that
requires real software control.

Like I said before please look at the existing audio card bindings.

--bcFqVBu2j9qZWhmQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSIdRwACgkQJNaLcl1U
h9AOEAf/djOuF0KqRDXHKbgIdlBrak/uDTEiHEoqXTlaTW9hPHgCP27FoU5F15vG
/mS+Obydc9IWyOl0uscQPGFP9nLoayDYduM5nEIlAJiBH0rvBjqZ6UVnAofy1Ec7
9ebQPTGDGmWs8iwKgfQjZmw7UJI2J4QQ5pFjZjNTkgmMb9Pu8ixylIbjiXyeiEZH
8Ad65tmEvYRhcGdTFZZ/88Drx+ne7TczcBg4wwcFN0V51NWhXr2XwaEaGKfKTizA
Vx3gq40qxkwzZQPp5UcSL/O7FqhwFh3zHwzduDMVv80tsDbHnD64xRQpZNWELycv
lO4MOL8CZc5th3RnMJat7bXSNHcKuQ==
=JHLU
-----END PGP SIGNATURE-----

--bcFqVBu2j9qZWhmQ--
