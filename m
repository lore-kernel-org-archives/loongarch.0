Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3746FC3
	for <loongarch@lists.linux.dev>; Mon,  5 Jun 2023 13:17:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D773C433EF;
	Mon,  5 Jun 2023 13:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685971067;
	bh=SGsAGVrSqKqwUbt7JXQCFYcn8EXvmNfwpHAaExlrrFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C58oqxJolO0WvmjWrd4Xn0Kcf2c4dkOI3G9BagcES3ULZk9Zqcfaa97VdQz9Edrbl
	 amYy+HTtXZ1eh49cFk2W5N1AP9ZPhpgCYOVqTdrM0D8YaVFlKY1Nk6UEMeprRr+TK7
	 z+SqTuHYwdgZHsj7Ul8XUYQHR1xQ0omtk79pQZogNW36CYUDZIneK5WniAZz2jVGFl
	 zbznDXdO7rTjqC1tG0FImrSANZhaaAl1CpmVGizMLo41k2bnnQ9JXOorbKrcRyuq2I
	 mlPcGUlpiQeeTIhUMSYyIP/+AZoLHfxS/Yf40WHH1NuGGX+etwdGyuBIUfPaGw1okJ
	 c1cwc/P2vjYwg==
Date: Mon, 5 Jun 2023 14:17:43 +0100
From: Mark Brown <broonie@kernel.org>
To: YingKun Meng <mengyingkun@loongson.cn>
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
	loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn
Subject: Re: [PATCH 1/3] ASoC: Add support for Loongson I2S controller
Message-ID: <f88a4985-0dc1-4599-8656-2029c0825495@sirena.org.uk>
References: <20230605120934.2306548-1-mengyingkun@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BoAetZG8U0jkcF7v"
Content-Disposition: inline
In-Reply-To: <20230605120934.2306548-1-mengyingkun@loongson.cn>
X-Cookie: Biggest security gap -- an open mouth.


--BoAetZG8U0jkcF7v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 05, 2023 at 08:09:32PM +0800, YingKun Meng wrote:

> +			regmap_read_poll_timeout_atomic(i2s->regmap,
> +						LS_I2S_CTRL, val,
> +						!(val & I2S_CTRL_MCLK_READY),
> +						10, 2000);

The driver is waiting for status bits to change in the regmap but...

> +		pr_err("buf len not multiply of period len\n");

Use dev_ functions to log things please.

> +static const struct regmap_config loongson_i2s_regmap_config =3D {
> +	.reg_bits =3D 32,
> +	.reg_stride =3D 4,
> +	.val_bits =3D 32,
> +	.max_register =3D 0x110,
> +	.cache_type =3D REGCACHE_FLAT,
> +};

=2E..there are no volatile registers in the regmap so we will never read
=66rom the hardware.  I don't understand how this can work?

> +	i2s->reg_base =3D pci_iomap(pdev, BAR_NUM, 0);
> +	if (!i2s->reg_base) {
> +		dev_err(&pdev->dev, "pci_iomap_error\n");
> +		ret =3D -EIO;
> +		goto err_release;
> +	}

pcim_iomap()?

> +	dev_set_name(&pdev->dev, "%s", loongson_i2s_dai.name);

Don't log static information like this, it just adds noise and makes the
boot slower.

> +	pci_disable_device(pdev);

pcim_enable_device() too.

--BoAetZG8U0jkcF7v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmR94HYACgkQJNaLcl1U
h9BFUgf5AXvsVIgWvo+jhUt1AcZpA6XupVdE4xlXM5TdaMAaZmx2ngdVrqlnqHo0
2r95znx9+wfqcikJcBwCYUz3GHg4Pp1djO4lxfUshg7ixYXL8jUH4zeUiDeOrHB1
NwNV+HRQJagRLUkSWr0LGiglrRqW4+zRtxbF5xH2xNkMY3dp0LDFZ0JXy+/5rKol
PK1MfPS6sLAnvXQkX2QMFHj4OEHX6JWKMAT5Ay0iUZIAph8d6FhhwYzGDe4vMHFm
aLF4PZcuMtiaDakkwFqMGn3ttIf2X7sQNaB9T5FG0juxqc5rT/bW21LCjN5z6TSB
dtSQKEGv5YU7Pk7u9kcabpa73VblVg==
=4kkP
-----END PGP SIGNATURE-----

--BoAetZG8U0jkcF7v--
