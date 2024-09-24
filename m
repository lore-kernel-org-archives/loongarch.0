Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1567921A1C;
	Tue, 24 Sep 2024 09:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727169289; cv=none; b=WPa1X5Q9VqpJT5T1VdRMhUSbxRiE0cO607Y0EmA2PXnxnza/0LlGtuuIO1pRWj/MdWCTSkjT2LCxLxALb5DIB8cWXIi8/ALM16rjSa9NnCBZJwQ4+AJuYIwNr4RBS50OT+PXsc0wO0EhP8fP6kxyMtsAmb6Dq0nhKN6pqXhhTP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727169289; c=relaxed/simple;
	bh=tu3MsigXGciQMci2nygCHzdzCD/8dolJH7rs79arCas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bc529LPg6EngosAbH5X1NUWa6uvEURBlv8cKZyF5CSxwSVeAKPrkW9sQeIKDsVGhtMKfSNcHhNGBQJINDtUVqhqFD620b50pxpvXm2Tsb5eybHM/0GywEWXoyJvGIFUMdH6ZImtBFTst30pICn3BBgSZ1ZS0HJKwGTphj/dunq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D7bwh9/G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D7bwh9/G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BFD7C4CEC4;
	Tue, 24 Sep 2024 09:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727169288;
	bh=tu3MsigXGciQMci2nygCHzdzCD/8dolJH7rs79arCas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D7bwh9/GqkHu6yWilUf0wiObmvSbQSLYccqjo2lcov6LRfjr54u+Dx+ZIGl9xhWdI
	 wjapAmzEHYyT5dFWZbG1n41fi2PuZ2ywQDIXGZkZpDN5tE9zgfRKmhoGV7Y6LgcN8Y
	 MYVTBPAqydrBrQ3j0dh1uxrz4bZXCkKpy+livi0+GmYZBXz8iOQCvv672u0p/8c5zj
	 zFv9a6ZBsdJybE1obSMoE+dKPuEOC/ELWDokZDfTfQE/OjjBL+tBs0yaeic9sfLVhc
	 JLOg5XAJ7g5WIB1bZIc0tcuZcSerDluVObwu43QTlJAUr2RdSoRHPYmSUw3qSUV9hV
	 EXIw0Fd+i/73w==
Date: Tue, 24 Sep 2024 11:14:45 +0200
From: Mark Brown <broonie@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Shuming Fan <shumingf@realtek.com>
Subject: Re: [PATCH v2 7/9] ASoC: loongson: Add I2S controller driver as
 platform device
Message-ID: <ZvKDBc2Kohx9kPfQ@finisterre.sirena.org.uk>
References: <cover.1727056789.git.zhoubinbin@loongson.cn>
 <fd3989d15546502b47f580e6a2c3a59cb628ce93.1727056789.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yTp4LDF4JyH//U9k"
Content-Disposition: inline
In-Reply-To: <fd3989d15546502b47f580e6a2c3a59cb628ce93.1727056789.git.zhoubinbin@loongson.cn>
X-Cookie: Editing is a rewording activity.


--yTp4LDF4JyH//U9k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 24, 2024 at 03:00:48PM +0800, Binbin Zhou wrote:

>  config SND_SOC_LOONGSON_I2S_PCI
>  	tristate "Loongson I2S-PCI Device Driver"
> -	select REGMAP_MMIO
>  	depends on PCI
> +	select REGMAP_MMIO
> +	select SND_SOC_LOONGSON_CARD
>  	help
>  	  Say Y or M if you want to add support for I2S driver for
>  	  Loongson I2S controller.

You shouldn't select the card from the DAI drivers, some system might
use the driver with a different card for some reason.  If anything a
select from the card to the DAI driver is more appropriate, cards are
the main user thing.

> +++ b/sound/soc/loongson/loongson_i2s_plat.c
> @@ -0,0 +1,186 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Loongson I2S controller master mode dirver(platform device)

Please use C++ style for the whole comment block so things look more
intentional.

--yTp4LDF4JyH//U9k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbygwQACgkQJNaLcl1U
h9B7/wf/V9dCKKBeH7nKbZObHyBhFPblBC2/1pcdEnwQU3b13G8J6ebTbS3txQV7
sRT2x31bkdyn2ommG8cbkHa9iTGLgopGv6WMy+bS3jW7lIy6U5TflBVoGn8NkLNU
yoNHfdFL17nKqFjTDOI5IEcW/nUe7QslABx1BEz3dD5S+VkYtYdyN2HvWkxlwSuD
rxAbxE7JC3qVyo/CciB9XAEDi1pVsE4YDsT/9woheP9W39YVGfB6aSrulB7Hdf64
sS3CMT3S3ewweTwhUq6w6DRifToN6ZtBjoG7ISUE+9iM9Akmr6kE7Y5bH3uBZAap
j/IB8ik2fn0A+K32IOLLPW8hK4bAIQ==
=v1nf
-----END PGP SIGNATURE-----

--yTp4LDF4JyH//U9k--
