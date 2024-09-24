Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723D114D28C;
	Tue, 24 Sep 2024 09:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727168641; cv=none; b=btDBXwbgqQKmS3MgoRquvMF1xqMt4rn2QX4fQff1/NKhC/7mPyzt9ljdXhdzEknDry4YMVrc9oMDXB0OkedAbWt9JekPQnJvyW9soQKcVvoPdQ5fkCVbYHxw5eCQwo1M4KlwOUd41SfYatsliRjF7Rtje/Ll5/1O9CWvyH8RV10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727168641; c=relaxed/simple;
	bh=d0cOEchK/X5pgHPOPqH44Hahes82m6rhNdNJLxk/Ysc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SgN9s4IjAFoF1TJLOp++/HvYF9XsBeihq+NASeB/o9j/a9M07e/5ZcLaUv4w5ac5b/QnTu95KXE8WeE46abCuFLySegW4b0cmMoz9iR5lQYA9vAcd7yAIrbql7kFO1EMgqYs+cpBI/dJOsnDmMDJ3EEjjlzViJoyHmcMhHi3Qhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MHAG0lWT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MHAG0lWT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 574AFC4CEC4;
	Tue, 24 Sep 2024 09:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727168641;
	bh=d0cOEchK/X5pgHPOPqH44Hahes82m6rhNdNJLxk/Ysc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MHAG0lWTTE3XhATkO4qG7tqEfQV/vLmOBXyFTtzTowQr7ItUYXbxrV1qUigL7DOnp
	 d8ld6Jvvgqw7LUOljCSjo547nb/1QgohOnA280HR84pNeHGXF4ARkzQf4gWHOiTBLS
	 QW32Z4JSs8JEyoZwGDKQxKbKsntI6Sk2JbjDIw1/Rybw8ac/4Ldb2vvRGHJJjuXVxW
	 isNyejiJGcJpwSRVoa8qpeG0KlFOyzVSE8DIDhkPTemLw6wlCqnYLXi0seaioGxJdQ
	 yQ6C/OgfxwMdOW7g/JHkXCzdaX+o6WRomNBElVHLOwdhf4bSTtlO9ldcAXgXdJ/js1
	 FHxtRKGjAFQZA==
Date: Tue, 24 Sep 2024 11:03:57 +0200
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
Subject: Re: [PATCH v2 2/9] ASoC: codecs: Add support for ES8323
Message-ID: <ZvKAfZH-uaxzY0hh@finisterre.sirena.org.uk>
References: <cover.1727056789.git.zhoubinbin@loongson.cn>
 <df28fd5784de4d18929c03c43309f095ae4f4860.1727056789.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DouZkACFnhQ0PR75"
Content-Disposition: inline
In-Reply-To: <df28fd5784de4d18929c03c43309f095ae4f4860.1727056789.git.zhoubinbin@loongson.cn>
X-Cookie: Editing is a rewording activity.


--DouZkACFnhQ0PR75
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 24, 2024 at 03:00:19PM +0800, Binbin Zhou wrote:

> +	/* interface format */
> +	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
> +	case SND_SOC_DAIFMT_I2S:
> +		adciface &= 0xFC;
> +		daciface &= 0xF9;
> +		break;
> +	case SND_SOC_DAIFMT_RIGHT_J:
> +	case SND_SOC_DAIFMT_LEFT_J:
> +	case SND_SOC_DAIFMT_DSP_A:
> +	case SND_SOC_DAIFMT_DSP_B:
> +		break;

This results in an identical configuration for everything except I2S
which must be buggy, these are distinct formats in ways that are visible
on the bus.

--DouZkACFnhQ0PR75
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbygHwACgkQJNaLcl1U
h9Cciwf/RG51FA7mTVAleL9bm5r64Arqxaz5HEd7JJuadGOi93aZiTLA2jKvvZQg
g7rFWtub3JRrzhu/mq15Hh3H9HXAUpW2sLEpIi7QOpKobfGzVYBtls5bubd+Xaim
W/Gc7z6zIefF/wIWzw1ZDdUV3VBEmtKDLBYjERDE7g0sZnKZFRcbCUp0NxFHWSWV
ZTKGaenhMmQ2fkJsWTSP6cO5LmdaGj+Agpkrm87Jp9kyZS4orKS7Po69qlgUgx6v
Ob/QEO3Ibz+VxGJOmr+5vKqcVK890qh31a0KFQpXUiasJLE8x9Pz+JTI8SVuAkad
yzvjuNE0F/kLI/antznSRyB/8aR0Lg==
=dRtt
-----END PGP SIGNATURE-----

--DouZkACFnhQ0PR75--
