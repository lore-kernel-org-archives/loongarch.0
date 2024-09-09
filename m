Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512034F606;
	Mon,  9 Sep 2024 15:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725894951; cv=none; b=dTyBz/bC7iuNAW7JZZCvXksBiZ/HTXS8AYEU0Frwk3+px6IkNQMDlg8ammOt17j7/6w2ofCtu/xi9ZahYs6SghaVMjRab4d53/QJcAo1NgRVZkFe3Q39nJb8ujja5QYwpURvLEocJFNWevOyac/TCE1IFPHpmIUL/F3+V+Fenf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725894951; c=relaxed/simple;
	bh=XNHjQCbVzhh9DmxJFjj2eQCkXNwWDrKnKH5Mhijp1bo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DGBGFyyykBbFbD/CIY4iu4qkoUpO7uwY/hBgJVVdnavlA6I1/X3lQywJdc7vUdr+tx4H5qlQkyYLOP683JCm46Ntj+6KlcYJnKF3FtXyr+PXMrZ/Lr4y+TyRdvjIQSjTSIPO9LZVUOo9/wnDnNGJydl5t4Lxumpy52dNvtTA0eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b/rTEgUo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b/rTEgUo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6768C4CEC5;
	Mon,  9 Sep 2024 15:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725894950;
	bh=XNHjQCbVzhh9DmxJFjj2eQCkXNwWDrKnKH5Mhijp1bo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b/rTEgUoswVbxHhoxFAhCvLZzkKczShwJ2Aoga0Qb9mzYBceBVCFAX3N4Hs8mIn0F
	 II+1lsvH+8Z7SdMm8C3wzsKNO+znL1siTAlHFow1LV8FP6sq4beffkqicOavv0ajGe
	 PXpRPM3qJqt+f7lk2zaGconOX8lLvMIJK87C4t4UE8eWV73LAvSe2URHHA9tZrCTfD
	 WV9dr3BB2g90XZYrMmVgGsADPFWx5WL0nh+J07IFulVbH0iUZXBX/PKhLP0UV8wa+v
	 rRgELFK2Q3O+/nAj63MybStYJMOyXYidcyyOfuD2Lxgrhv0UNmt5rHaQbpJA+lnNHB
	 KqBmmdK3QSooA==
Date: Mon, 9 Sep 2024 16:15:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Tang Bin <tangbin@cmss.chinamobile.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	linux-sound@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev
Subject: Re: [PATCH v1 3/8] ASoC: loongson: Simplify with dev_err_probe()
Message-ID: <bd51dfbf-d870-44ee-a108-3ca3510e37f6@sirena.org.uk>
References: <cover.1725844530.git.zhoubinbin@loongson.cn>
 <07855aa6c290ec826d63e68b898e7f4afac5e30d.1725844530.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dZvjhTEteJgYilci"
Content-Disposition: inline
In-Reply-To: <07855aa6c290ec826d63e68b898e7f4afac5e30d.1725844530.git.zhoubinbin@loongson.cn>
X-Cookie: Anything is possible, unless it's not.


--dZvjhTEteJgYilci
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 09, 2024 at 03:19:07PM +0800, Binbin Zhou wrote:

>  	ret = device_property_read_string(dev, "model", &card->name);
> -	if (ret) {
> -		dev_err(dev, "Error parsing card name: %d\n", ret);
> -		return ret;
> -	}
> +	if (ret)
> +		dev_err_probe(dev, ret, "Error parsing card name\n");
> +

This means that we change from failing if there is an error to only
logging about it (and then only during probe).  Perhaps that makes sense
but the changelog should explain what's going on.  Most if not all of
the updates do this, some of them seem like clear bugs.

> -	if (has_acpi_companion(dev))
> -		ret = loongson_card_parse_acpi(ls_priv);
> -	else
> -		ret = loongson_card_parse_of(ls_priv);
> -	if (ret < 0)
> -		return ret;
> +	ret = has_acpi_companion(dev) ? loongson_card_parse_acpi(ls_priv)
> +				      : loongson_card_parse_of(ls_priv);
> +	if (ret)
> +		dev_err_probe(dev, ret, "Error parsing acpi/of properties\n");

Please just write normal conditional statements, they're far clearer -
there's applications for the ternery operator when embedded in other
things but normally it just makes things harder to read.

--dZvjhTEteJgYilci
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbfESAACgkQJNaLcl1U
h9CZmAf+PuHV2VjGHLosXEl8sRtet2iCymhI7YZyHHMWePQdQBK55/fpoBe7Xsmy
rgIityH6qP9Q5uHYAljJshN4D1Mz02paaG4QBwLbw17K4FXb49JSZbHKp6I7ySbP
w7SOvQymEURmfuwtqlgzrVf/JSby5EPPLn8rYtcsGGYJxBckEDmYVK7XsWZS/bia
p5+bRyurKgwHYYZ9nES2c6mwuHgxqAjehqwnyU2DwvlM/PcwUjsVIVMM+Hd/ovrN
a90XjNJo0tL389hRlMZOWYfK6fwfxjHsZd9Vx+OBDDtv6xpj60a38M3WX7s8MiQ6
mPibWt9N9EbbadaPyzX3k4a7k8UGkA==
=1Q9z
-----END PGP SIGNATURE-----

--dZvjhTEteJgYilci--
