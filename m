Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8731714B8;
	Wed, 18 Sep 2024 11:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726658123; cv=none; b=AXnDUHAGOqnTR8kJpsLBTSliHQQl1iVtg38FxgNaAeYkuOS93GKbTnMx47EGhtXnG64CLZt031pI57ZRDneOEm6GLklxZpxqZXfgLnvcDe9zXLZTph4rVuqfYroFclj2d5aahxFoDB2c6PhaVM2l67aUyHPtGDJ+NHMZupKCpCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726658123; c=relaxed/simple;
	bh=FpOMTIjgy4CIjGQsnUdOKH4Q06iQikrOfVY9huczM6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d/3qr9zlPEHD1bM6bLYsDIjmqQOdO+FPW+q0STKmpcdPTN8ADJGOPegp86uBBIlZ8BdTbyLaCfQlunqQNfWCZmtAkKTadO2AAZ4gaKjHZzNDlNYQXpx9qPLgEFfctg3Uj1matstq+o6Z+Tze7ARiqLq1vU3LYj9HRziLCIyK5SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=modpcmP8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="modpcmP8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BEEDC4CEC3;
	Wed, 18 Sep 2024 11:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726658122;
	bh=FpOMTIjgy4CIjGQsnUdOKH4Q06iQikrOfVY9huczM6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=modpcmP8l5XbxvYNPmYKRGSMvKhhtKgc56FGTqAJZhQiH+vQoUowAujANZ7+OYXoA
	 2PcDMbLovVTpcRAAXGO9oTm0A1nRJXdrEVX2su8LAXCx2uYLEvMs/Y91AeO2aMuxUv
	 7M3uGlQZyB8fEXex/e/qKsPq6FkrHjnvnM7T0FUJCfG3mO3jC36rrWzlTkR93hjGFq
	 0FyH96mx2MwlE9GOSv1Q6p8q197c8bIsWGkOfmOgKMWrUGcjb18Bt/ywrple5wnsL3
	 GCNy4xVG+do2ss5HYZHSX8UFcRQpgMYQhTGExxl/oeaGo1J5zjfKCQ5IODPpN5tzEq
	 ZoVLjLjxg59Gg==
Date: Wed, 18 Sep 2024 13:15:18 +0200
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
Message-ID: <Zuq2RmF1jW9tOYwA@finisterre.sirena.org.uk>
References: <cover.1725518229.git.zhoubinbin@loongson.cn>
 <c44a6525d77941ef235825a58a9ea91f9f7d7042.1725518229.git.zhoubinbin@loongson.cn>
 <5a7357f7-da3b-4532-b055-ad33eb93fe1c@sirena.org.uk>
 <CAMpQs4JRz8x=zfB-DuDSxbcYDR=mtVET_AwawU+J9Vn=sx9LNw@mail.gmail.com>
 <eaa0b894-b4f7-4e4e-927d-216ff87e6f14@sirena.org.uk>
 <CAMpQs4LwAJoyRn7tT9BpiGcDcWyHPG11ZCPWB+ku6uzGikGcBA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="alzXyC4LqiT3voNX"
Content-Disposition: inline
In-Reply-To: <CAMpQs4LwAJoyRn7tT9BpiGcDcWyHPG11ZCPWB+ku6uzGikGcBA@mail.gmail.com>
X-Cookie: Editing is a rewording activity.


--alzXyC4LqiT3voNX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 18, 2024 at 03:24:45PM +0600, Binbin Zhou wrote:
> On Fri, Sep 13, 2024 at 10:44=E2=80=AFPM Mark Brown <broonie@kernel.org> =
wrote:

> > No, it's fine to use the component wrappers if you happen to have a
> > component to hand.  What's an issue is things like writing your own
> > register cache code (the above bit is part of an open coded cache
> > implementation), or I2C read/write functions if there's not something
> > unusual with how the device does I/O.

> Indeed, I misunderstood it before. As I understand it, we should use
> regmap_config.reg_defaults instead of
> snd_soc_component_driver.{read/write}.

I think so - I'll need to see your actual patch to confirm but that
sounds like the right direction.

--alzXyC4LqiT3voNX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbqtkMACgkQJNaLcl1U
h9DGNQf/fir0Ww8j1S7p3Kp3a68sjBMnFAd6nyuc4Lpjhz2n+T+PA4ECjFUlfMRs
mYGPFm/hzqiI3jr99tYqFlxfi8lPBjKNjzoPXGbX6Kw7vgybMqJL+33lzpzUzFnW
+TQ9fe+b+Ev2n+G7piCOIs6g0a8gito9fZbWBlicqhCsVxwr5ePWEwPw5RRGAUt8
sCxNbaTcS4uw4Yz1i7Dz8sLhBR/nOArHc6aa3iAFSjFdQ8kzbg1VUlekQYdxXeGV
7I9xp99PSqNELaVOEiAaS08DLSlZpyZExtxwObQ1mW+b/qhbQQ9uWY4CUHl8fYyq
ZFhcI/7t0TO99CXwsLmBbm5ygAtLUA==
=MTqc
-----END PGP SIGNATURE-----

--alzXyC4LqiT3voNX--
