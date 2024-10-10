Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091461C7B6A;
	Thu, 10 Oct 2024 14:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728568990; cv=none; b=NLIvosuDEIGiT1jAYrk7m1M1th4e2ZLPV9NPiSqk/gfzCA0yG7cQ66e6QWvT2amRvepZKxvd2FmyMlGWYIQeBkdNbdJICXd+vBuVXMvJPFXvmC9txDrotpooqOC1FFZKw/JNoljtPqVaG4Urp1LbDeeEkdM47cu+Lk92hd+0HR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728568990; c=relaxed/simple;
	bh=BygIAlplpuoaa5rCG5EvJhHrt41vr/Z+Nx1Wiya21Ro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=euomGw+KMSRodJsGdXhpq4aNEhxLKF6fw+bTLDJQw5l9nlDsHyd2OELPZHTQF2d1Bai91JDJTAvRgxCFMuolrc5ImTH92gDmspI5g3HKRQk44zWRhHj0+VSdGzK2e1cdCmAcRFjpXtNU1WRs82Fuad7ejWGBh9UKQAaAD/FuJ7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FO1lKsVO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FO1lKsVO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B181BC4CEC5;
	Thu, 10 Oct 2024 14:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728568989;
	bh=BygIAlplpuoaa5rCG5EvJhHrt41vr/Z+Nx1Wiya21Ro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FO1lKsVOX5UNb4ZAVIk6Ma/WGoLBEd/tTa6/1edNYR7b/8105Vy6BC/Qhv2tv2cOX
	 RZ6h6U3Bfr6+iYnvjBGJ41Wzu5tEpnx5WzFPgUp1amyRnnBAsWVWaH1DdeOTrkIkde
	 HQyPXFk4nuKQUQlLgyY1QSjsANFlA1VvfLZBZ0w9NOravPh812MISdE2DHOcBOJ4Qv
	 n/iQ+XDqHqSrK45hF7oP0XjIV29YxcVXGSMQeX+fAfNjJdStF8l5oh2PYktOwixMBY
	 Myu+/ljnXnj6LI56F4DKIFyckJJMX8jL0HNzbNSkIQs8jOHxYtJRfGdHnfkg7ALhJb
	 VvPnA2OK+6Bzg==
Date: Thu, 10 Oct 2024 15:03:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Binbin Zhou <zhoubb.aaron@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>, linux-sound@vger.kernel.org,
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
Subject: Re: (subset) [PATCH v3 0/9] ASoC: Some issues about loongson i2s
Message-ID: <ZwfemUEfFHJRiCr9@finisterre.sirena.org.uk>
References: <cover.1728459624.git.zhoubinbin@loongson.cn>
 <172855884981.3258793.17729935826036139739.b4-ty@kernel.org>
 <CAMpQs4+0_P0ExcU7O12XvKPQ+CoP8KpAWUJpL2wP4--+gWQ6hA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="elDH6aAabrlLvot5"
Content-Disposition: inline
In-Reply-To: <CAMpQs4+0_P0ExcU7O12XvKPQ+CoP8KpAWUJpL2wP4--+gWQ6hA@mail.gmail.com>
X-Cookie: Editing is a rewording activity.


--elDH6aAabrlLvot5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2024 at 06:15:22PM +0600, Binbin Zhou wrote:
> On Thu, Oct 10, 2024 at 5:14=E2=80=AFPM Mark Brown <broonie@kernel.org> w=
rote:

> > [5/9] ASoC: loongson: Fix component check failed on FDT systems
> >       (no commit info)

> Thanks for applying this patchset.

> But I don't seem to see the 5th patch in the for-next branch, what
> other questions do you have about that patch?
> On FDT systems we need this patch, otherwise the component check will fai=
l.

That's a bugfix so is going as such.

--elDH6aAabrlLvot5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcH3pEACgkQJNaLcl1U
h9Dgzgf+JGDkp2/NsV0ZjdHREp4keQ6HGjDH37shxHpVA1zHNQvVwqlqgdkKjhZR
sC0i1zIb1NJe+2214yDGwKfJf+quKJ/uBsvoD5UmR1+rYLGuhiQ0SS/NtjtC5w19
Gk5PJUmHn3dKqNV07yLPulOuJ7Yv7373IUO8IqvWzjDShc5n5ThHSoT7F953vArf
WH4S7M83Zvef5NqplBTcfensCgiC+P6OMDQhLvZkFtQvaUC73VjsHuB3MT8bg3dN
r9O9bWWrAY6RsN8hFZb6ZHn/sP2kA5dHUr9uwxlZtJ+fjPSexkPfh0RpC2zJO1Mr
VYZJpu0Eclb8nxbcV7C7P2L8aJkDQg==
=MHlW
-----END PGP SIGNATURE-----

--elDH6aAabrlLvot5--
