Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C5C5240
	for <loongarch@lists.linux.dev>; Mon, 12 Jun 2023 19:07:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE723C433EF;
	Mon, 12 Jun 2023 19:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686596840;
	bh=mk05hiqVuQOkNG31wsfdF8l9b1T8ODQwo8DQQ3yFd1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ErGzFvvFq6o4ZGVDQZ/vBfQpDXY7Nyi/gjUsN+rs0sz3BVdqcW0IWGxWYO96XUZSy
	 PPVU0mpKJwsSrx4DsUfS+PEFoZy39V2IZZeRgK+NmzYQa8ekzQ5KmMrxhzpECRyKX1
	 qbnzbqfJUfznMRx0TmQak09ozXBQ/DqVBFGPfCQuo8KYnToit2fnh0czlvu/TN+NgK
	 QrUoRGxlksjXznt2p80FNfEjEfx93xiP5wgedneppWDIeqTFvh1ECmbuA4hNFv3PK4
	 neuUG7CMpB3KgcQnWEf+lkbMdW/XgRdOZxKovmnks6lSxbVwhNLmdE09Z+hqrHQl1N
	 if5SURcRhNISQ==
Date: Mon, 12 Jun 2023 20:07:15 +0100
From: Mark Brown <broonie@kernel.org>
To: YingKun Meng <mengyingkun@loongson.cn>
Cc: lgirdwood@gmail.com, krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn
Subject: Re: [ PATCH v2 0/3] Add Loongson I2S controller support
Message-ID: <31bd1de1-feb7-4544-aca6-cfb983722057@sirena.org.uk>
References: <20230612085048.3039471-1-mengyingkun@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aGAp6bLuWy6L25TL"
Content-Disposition: inline
In-Reply-To: <20230612085048.3039471-1-mengyingkun@loongson.cn>
X-Cookie: If it heals good, say it.


--aGAp6bLuWy6L25TL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 12, 2023 at 04:50:48PM +0800, YingKun Meng wrote:
> Hi all,
>=20
> This patchset adds support for Loongson I2S controller, and
> introduce a ASoC machine driver for loongson platform.
>=20
> The Loongson I2S controller is available on Loongson
> 7a2000/2k2000 chips, works as a PCI device. It has two
> private DMA controllers used to playback and capture.
> Each DMA controller has one channel.
>=20
> The ASoC machine driver adds support for audio device which
> using loongson I2S controller to tranfser the audio data.
> The audio device uses "PRP0001" as its ACPI device ID, which
> provides a means to use the existing DT-compatible device
> identification in ACPI.

The code here all looks broadly good - I did have a few review comments
that I sent in reply to the individual patches but they're more
stylistic than anything too substantial.

--aGAp6bLuWy6L25TL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSHbOIACgkQJNaLcl1U
h9DUAQf8DIP6BdZ4T6E3xGHa2YdR0z6PaBGz4mRmB9uiBBdSyk0dpa50B6luQF39
RKmdnMfjmyUnENOCDs2fYvaJKyuL7d7koZZlRszE4zcooow4AX8P2sfie2rkGQ6w
EI5+5RcDJeJXtEvfPyy9JLNvJfcFyEb90UfatTXQ7H/+lgLKZd9x+IFVp3dzqrJ3
VRCoe0WI3TiFklsl8vaoq7iOR1MR++hHNUEhiVqghQK1lnM3COGMKzZWCoDOMvpx
ElMZotNr4EtyyCd6Rc1cBdosKQXyxPATRHuKACshxrr3AQ6nIY3zxRS4ee8tFc1F
A79RICNenb4blFgjBLC7BSXs2aBARA==
=fZju
-----END PGP SIGNATURE-----

--aGAp6bLuWy6L25TL--
