Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D2A18037;
	Thu,  5 Sep 2024 14:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725547010; cv=none; b=nX4jh+2hVY84/Dg1KPAyizmQu41PoQDTevPADGQ5G+OlTHNdVNxNHCCuinsQbCnvq/b3/DglO5CQIoYAaaZ4g3yIb15I96CIyg/5UoAlHIwIyunupTpzPLhFN1PJ0o7EGmaMwtAJp6s6id7GH23zrrcbtizHSF9/+Pk401TElhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725547010; c=relaxed/simple;
	bh=Hfrptv1LWfd2fp1IwZdn5QKZbnfUSYO97XMMzcBjBMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k8NXA2BaSm85NI4HmpupUs5Vr3mr4LuY3iO0VdyUSv0/AktibYaOlfWK5TtBTZSMcI4PCR11bvR5ctLomZyunoEJhURnOxfQ9tAyE3/+/WoOewQwP2HnTx6qmy9WpT45S/VhQQ3rVhg8a6eTzfj96oJsykCjKmY6dfbbE1i9FzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t6MjBaEE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t6MjBaEE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF1EEC4CEC3;
	Thu,  5 Sep 2024 14:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725547010;
	bh=Hfrptv1LWfd2fp1IwZdn5QKZbnfUSYO97XMMzcBjBMA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t6MjBaEEPmXHiLUIk/mOsAr7Qg5IL2Oq/wRwGTTuIp12MJP4AVOlSTAuLpwGFoKlt
	 C6gqqRilzOoQfQrNW/FZmOFLNhjUshd0eVHHg2/Wj1kzazAkS7Omz7V6q8aMDMkQvl
	 11LeO+SCfy1cHWClAaLzFRppgXnpNzyulFW77u5dInhBtojOngCh9I3c4vAuNVNS3G
	 ScjYUPSpP0CSfovZQToLEaGaxUUeV3lZgU5KdT9fOW2KRrnssMajPfAvBsamnPiax3
	 /45KLzZAk2Aqx9MiFUz3VLh7nBSHYZj3jZ5nWjcA1ooITsMwNyb9hGt/NzM+Pk2xO/
	 CM1Z4JKMI3vBw==
Date: Thu, 5 Sep 2024 15:36:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Huacai Chen <chenhuacai@kernel.org>, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev
Subject: Re: [PATCH v1 08/10] ASoC: loongson: Add I2S controller driver as
 platform device
Message-ID: <76612fdc-996c-4cfd-b5f7-04acb5b717be@sirena.org.uk>
References: <cover.1725518229.git.zhoubinbin@loongson.cn>
 <282dadefdaac7917fd681a6e84a5f0f07d0557bc.1725518229.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0RPO7vUTUnlCzIEh"
Content-Disposition: inline
In-Reply-To: <282dadefdaac7917fd681a6e84a5f0f07d0557bc.1725518229.git.zhoubinbin@loongson.cn>
X-Cookie: The horror... the horror!


--0RPO7vUTUnlCzIEh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 05, 2024 at 03:07:21PM +0800, Binbin Zhou wrote:
> The Loongson I2S controller exists not only in PCI form (LS7A bridge
> chip), but also in platform device form (Loongson-2K1000 SoC).
>=20
> This patch adds support for platform device I2S controller.

Can some of this be shared with the PCI version - is it the same IP in a
different wrapper, or is it a new IP?

--0RPO7vUTUnlCzIEh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbZwfsACgkQJNaLcl1U
h9APRwf/ZcBuV3HyPr0cBaG6E3VH7edwjTHlJyWfIG7yB7jgaFG3fgXxb6XH+GiA
GUs1Qj57SlFMVUwc1kj0a4jHA5d1wNuXypSxx441mJe/v13btALZCVUNcOvf6BWZ
6AU3a2VDJhQGEAhzDiTzK3zUlL5o5bCeSc5Dszu+DVaNbujYesyccQJgnamZufcB
8uMy8B0PfY/8ntMHfGdksHwubk2B7hVgKfitArx9tO0k546OWgQxf2Ia1tKKmshX
W5++eUChvvUcWMVqzNRzrbMh2RGCCcF2oHkLuDxgZCLwIthz4CYysaKfaFh2Pf8p
Hq6BAhPLJs9h45jI6ZX8+WoxeCluEQ==
=daIb
-----END PGP SIGNATURE-----

--0RPO7vUTUnlCzIEh--
