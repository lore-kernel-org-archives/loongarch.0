Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471E0226CFE;
	Wed,  1 Jul 2026 11:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782906545; cv=none; b=lEJItMVmh0LEfnoFg6j+p+wQfiAfPAQvOysiPWWxKm2g/T8F1WJIpyRPPheK5zbBTLgHQzpNlZ5wrIYKmUC7mDjD5GYq6S/mogm9+P6OHeQZBf4CiJcMzIJoS1a+jimwLfWaFcpNv0LoCoG2mBUCRd4vEgxZC5KPFf/FJ06lvcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782906545; c=relaxed/simple;
	bh=Ne25Eb6hfiwFz29OTK617AXvzuu7M9hFTX1/pZmdnQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k7ioChLSVrR4+Z37imSyi2vGo/hwuY7z32QK4MArqQp310Bb09ETdxjXM5r8617mGsrM/KsDY7CJPZmuTt9pKX9NCQcF6OgedxWOiTl2FxwuTECIssSn2Kq2JqZo6W5TwKhey3PaorqbE9pkzNLO7hps0f+Xz1bAMaq7vn7OwOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OUYTSL6n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OUYTSL6n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B45AB1F000E9;
	Wed,  1 Jul 2026 11:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782906543;
	bh=esUM6XiE9H9/VDV25mzx0G8FhbMIdZGBvt/U6SFGFso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OUYTSL6nxV/Ah7RowxkS1kK45aEmSLlDmVOHKWf8eRGnc3kc5iOki0HSxPP2I5U5+
	 0fHFct57n39066Xh+lJiEtFDLURZ8tL7PDwLABKqbK8XDjmWPw8cMXCVtdbC+em8Qe
	 WXoSp1XcDkFplnbYrlJBd+0yfkt8JMWqJATy9weYXg8O1T83xKrZbfWPlYnHCEQCuM
	 HCLi6L6zADAh1yATEY2inxpmK1DqB8Zj3c9aX8cU2hmtT+mCqSPKmPKPgFNjYHtIOH
	 XfxRnqSEVfE1jVFIobGQTmYccajHWq4Th/LfAiDPjPLPzYobyNW5sbUrNO6p479YAl
	 I4yODRsmUybuQ==
Date: Wed, 1 Jul 2026 12:48:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 6/9] ASoC: loongson: Add Loongson-2K0300 CTCISZ
 Forever Pi sound card support
Message-ID: <c9361380-b28a-4f7d-9ae5-a00042189b79@sirena.org.uk>
References: <cover.1782439646.git.zhoubinbin@loongson.cn>
 <ed1314e1d3275fd20aff47397345a88fad6e9368.1782439646.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nvCzlV8SN6qnzl1W"
Content-Disposition: inline
In-Reply-To: <ed1314e1d3275fd20aff47397345a88fad6e9368.1782439646.git.zhoubinbin@loongson.cn>
X-Cookie: Do unto others before they undo you.


--nvCzlV8SN6qnzl1W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 10:27:27AM +0800, Binbin Zhou wrote:

> The Loongson-2K0300 audio card uses a different DAI format compared to
> existing Loongson platforms.

>  	},
> @@ -177,6 +189,10 @@ static int loongson_asoc_card_probe(struct platform_=
device *pdev)
>  	if (!ls_priv)
>  		return -ENOMEM;
> =20
> +	ls_priv->cfg =3D (const struct loongson_card_config *)device_get_match_=
data(dev);
> +	if (!ls_priv->cfg)
> +		return -EINVAL;
> +

Does this do the right thing on ACPI systems?  I'm not seeing anything
that'd get us match data there.

--nvCzlV8SN6qnzl1W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpE/qkACgkQJNaLcl1U
h9DwJwf8Dqs0X2LW9Q5jMZrgRxIKUIRNqzHQNFQaPYgHJ/S+xZqZvvZls6dyM48n
OWeXEllmQv4oEZiXMhEwASAz+bhbaESbIE3FqWuTj2GN0P84dNHKMdG2UHogg85x
Ivsz5rTYO4vwRWud9E1KfAZo8aCi/srpKeA4y9oTfZi2xLAvCgMCIknGmTgp4L7w
6uVk5s1goARtkbhmRjeSxVtumtnJwvH9tFduronxWnHeF69CgljZDa0PrDgOUCed
D6m86zSz6wX00NZcik8BChTc98+vbGAdibKIznxak7WV5M0oUkYSyKq10YucsaYb
XO75xavWoyxkQIkY7CHEPV3j7yALJA==
=nVdn
-----END PGP SIGNATURE-----

--nvCzlV8SN6qnzl1W--
