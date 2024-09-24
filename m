Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF641A3AA7;
	Tue, 24 Sep 2024 11:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727177795; cv=none; b=YdqKzZtK9aW8xERn2aX7KpKOLoavPyDfbmMJKuvAOTszy5rewIvDhqxVHh+rsh7zsynWzl5PLOZAE47nkga76VMgMXi4C6xp4r6SKTlAwGriea3ih29wMlcXnEtuPpSIsw+NWhEsgudfhLFjWFGAQKK3n9XAIfgJHyMpRGIgxYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727177795; c=relaxed/simple;
	bh=uHcigcuqxepjC/oolJeyvJLAeAeV7IC3TY4EBhKmF7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KCvCTUc+IP1L47NpvxWa2NLtJ2byOPjz3IT+tpCpPsvlLyeNvJ+kya8Y1mSvgqEQBZCtX+6/VbtWY3oLg2HL5GQoyrKoHTaP9FwwfrnHj9MtS6MdZOY/H9k/uaWEv0l7f0ID7b2iPOqOBINgiPRyBdXJD/BinReOe5CeB6cUDWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MORHMIvL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MORHMIvL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B0FFC4CEC4;
	Tue, 24 Sep 2024 11:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727177795;
	bh=uHcigcuqxepjC/oolJeyvJLAeAeV7IC3TY4EBhKmF7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MORHMIvL0Uxfe677ozYHhrMXB4/NRf44Oe6FLnHsm3V2QQ/9i2jLW3DEeWoEcPELE
	 xQOBdyjdnDZqO+hkRC4s8HqX9Q6YX4rgzgCEuHOAQk2Xyop69z0gs6gFoPTms1DU+r
	 3wAfyAXisRCxBRHjSpRDNIfMgvblU34n8aFTedZsqEDGEEPMPPAcklNkXodjlKNZpZ
	 Gi5RsZMFeiRvEX4ihlxUH4bST2LkRnY0uJZUYS18LLLrk0OcRaRYh0IL8Kau0UqzYF
	 CwbUszApzwagXyFcZ+06l9f8nHjFtfHilcdMM/J5N83FUXcHjU7/wzlvjvizobPC16
	 Spf5aCfPB4wuA==
Date: Tue, 24 Sep 2024 13:36:31 +0200
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
Subject: Re: [PATCH v2 0/9] ASoC: Some issues about loongson i2s
Message-ID: <ZvKkPyitmgNNZ4e7@finisterre.sirena.org.uk>
References: <cover.1727056789.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6MBA/2mvkeDL4zum"
Content-Disposition: inline
In-Reply-To: <cover.1727056789.git.zhoubinbin@loongson.cn>
X-Cookie: Editing is a rewording activity.


--6MBA/2mvkeDL4zum
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 24, 2024 at 02:59:49PM +0800, Binbin Zhou wrote:
> Hi all:
>=20
> This patch set is mainly about Loongson i2s related issues.

I did find some issues with this series but apart from the query with
not using snd_soc_of_get_dlc() they're all fairly small, the bulk of
this looks good.

--6MBA/2mvkeDL4zum
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbypD4ACgkQJNaLcl1U
h9BC5Af/aVVdDh1r2D6KY1ColJQRPRcOfMxYqHptF12I5+VPZffIutNcdcGWZfgg
bIIw7EnptBq10xzPyebiEdt5mAJRnt/rpl+rwbU82txq6MXiP0j5Ibi7+iwS2onY
Z5Id3ZtEnKVvaYBkU0vYwuzjMB7v+gIKshmJ/s2I9O0Cyr1l4MQE6XWV7o5LzrOh
lcYceXIVChbIl7JbV0S85sjWYjDBfwPnZ4MYdgDfEv3lelfp/iOvQ7gVRaQgFYFu
+H5mzcXHLzyF1krBK6fDWRopLp9wnm8Ux90tJHDilPLgVGY/ee85WWuG+guekcjT
d8UDxTo5vAiTqopJMyMENzHMyhcGtg==
=6dy/
-----END PGP SIGNATURE-----

--6MBA/2mvkeDL4zum--
