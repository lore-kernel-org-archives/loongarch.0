Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC216F077;
	Fri, 13 Sep 2024 16:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726245892; cv=none; b=V4z576D5mJoznLiMWp4kGgjW6QC3yVnTOiizLw4jFxom6C4WnEhfX9UEyb7fz7GCJtY0qWhPPJhD/2F87w/DR4M40DzlpqdMXmKCdOiA1JtDC5t9+gE/cAk4zCusSAbvJoHyxSTrZJC0pRJasKQ/1SuAOS7X4BIlJKo+wk/gelk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726245892; c=relaxed/simple;
	bh=s26bQZzJ3df3LTgBAKbXOf7FXaKcvwCGSPy7vTjdMI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=INSjaDpkQjLN2kjXAKKo1/VaRTZpTz8esrYCChO5mGGqXTfdemHjBFB3xiM1YTKan4GU7Nt9Gw09MS70Za+EV8lJ9ElMF30AM4wRrCz7VHcTU9z1Zy4lq+xX2R1VkthSCe4WmkHU6IEZrj7vHE+N5NYvgAsYFL7J0QYo/qAn21E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nkuwIQTl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nkuwIQTl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02E0EC4CEC0;
	Fri, 13 Sep 2024 16:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726245891;
	bh=s26bQZzJ3df3LTgBAKbXOf7FXaKcvwCGSPy7vTjdMI0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nkuwIQTlu1zMARvz3BfZ2qy0vB7dmtz/4TR0N1+4nvauXlPW4HaLfX381rXRk9Vsf
	 IqrtwMipvSHRH8DrDkOMnuZ92aFa0lCcYwWxM4GwAG3+wm7MbYSCsHawauOebKU82p
	 GL77NRpbm0FMnqZ1UQB41zQb7LKNw5NeHYQ6CurtzQ3aoI4cjSYyJmhwIQf5D+US1j
	 ImWtR7+HjgMOIoXuPv+OtD97KysrJu+DKACM5rMu1T8mPMdunlWCQDsA6Ga5/SWrFR
	 ZvBEfKgnJGaL/7W9JhUuY34OlAr5nKhy966hY2ckxtvjvG9jmHZLnVTXhLa5UfFBrp
	 liFTt5kJSINXA==
Date: Fri, 13 Sep 2024 17:44:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Binbin Zhou <zhoubb.aaron@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Huacai Chen <chenhuacai@kernel.org>, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev
Subject: Re: [PATCH v1 02/10] ASoC: codecs: Add support for ES8323
Message-ID: <eaa0b894-b4f7-4e4e-927d-216ff87e6f14@sirena.org.uk>
References: <cover.1725518229.git.zhoubinbin@loongson.cn>
 <c44a6525d77941ef235825a58a9ea91f9f7d7042.1725518229.git.zhoubinbin@loongson.cn>
 <5a7357f7-da3b-4532-b055-ad33eb93fe1c@sirena.org.uk>
 <CAMpQs4JRz8x=zfB-DuDSxbcYDR=mtVET_AwawU+J9Vn=sx9LNw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c3I7//ljyRVcTArV"
Content-Disposition: inline
In-Reply-To: <CAMpQs4JRz8x=zfB-DuDSxbcYDR=mtVET_AwawU+J9Vn=sx9LNw@mail.gmail.com>
X-Cookie: In space, no one can hear you fart.


--c3I7//ljyRVcTArV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 08:02:02AM +0600, Binbin Zhou wrote:
> On Thu, Sep 5, 2024 at 8:05=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:

> > > +/*
> > > + * es8323 register cache
> > > + * We can't read the es8323 register space when we
> > > + * are using 2 wire for device control, so we cache them instead.
> > > + */
> > > +static u16 es8323_reg[] =3D {
> > > +     0x06, 0x1C, 0xC3, 0xFC, /*  0 */
> > > +     0xC0, 0x00, 0x00, 0x7C, /*  4 */

> > There's a bunch of regmap reimplementation in the driver, the cache and
> > I/O code all looks totally generic.  Just use regmap.

> Sorry, I don't really understand this point.
> Do you mean to use regmap_read()/regmap_write() instead of
> snd_soc_component_read()/snd_soc_component_write()?

> If so, are there any rules for using snd_soc_component_xxx()?

No, it's fine to use the component wrappers if you happen to have a
component to hand.  What's an issue is things like writing your own
register cache code (the above bit is part of an open coded cache
implementation), or I2C read/write functions if there's not something
unusual with how the device does I/O.

--c3I7//ljyRVcTArV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbka/0ACgkQJNaLcl1U
h9BwNgf9EnOeRrl9jmhM2rPn+w+HO6+EuVqEi4X2xj7eNVP4f3bmm5rHrYwwa97E
nEVoHyVqI5DNP6VDk+PZgODFsKW8Lomij/n3CCCgH04XGm5/uWVMNsT3h9Q0n4CX
MhIw8ClD1QMuVipBaqyMkFS0gxo6K8OOp0a4JudlzIzGYCo3oSVQ1b7Zm3ovizjj
ib/begFQFAJwkkMKgo02o16aZ19Nt+F4ewVByk5r86qQK+zZxwUoKSQlz6U9MIo1
53zM59C9wMXkjw3MKlpnNcPtB46FGHWI3Uo/A+Lk1RDoPNYZWOxTYclElvlq1NUG
ZHf5eh9li5yiQyHN2osCqhkVEAXUwQ==
=5u7U
-----END PGP SIGNATURE-----

--c3I7//ljyRVcTArV--
