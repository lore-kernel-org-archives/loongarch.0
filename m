Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9A3D528;
	Thu,  5 Sep 2024 14:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725546717; cv=none; b=okTKGS/Dc+lHXIgJ/6gV2YxAE01lnMoL2kOO+2q7KSYKU3F+GIy6K/bwZBlQZZbF0Eobvgah7W3faY5SItmVqTTcFBMDrQDFVgukfas4sFxJmtamkvMwUWqEEYcjaX67Fp9CbAi1sKQRkfITxwhEYhOGiXPfKu1P0g/mJVBrbOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725546717; c=relaxed/simple;
	bh=/OSOqWxLXrQ/CWYaUF9pNocAFPLkHmFu4vw5y1ZRNO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BVG7+4NBGASRNOD18oFZjzYGuqUk226j3AhpaDFdqo4obtC3dYh2yoOS1stab5lNlwoxUcNPK6gR6WLWquZzCuHFySUnZYqDupp53kbLK9nwm135VvUlwuqTDv9z7H5bGTDFdw76dDqvo5Di17cHvXkFTaczVWEfVHT2KWmcvBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FDqmZdr4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FDqmZdr4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97EBAC4CEC3;
	Thu,  5 Sep 2024 14:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725546717;
	bh=/OSOqWxLXrQ/CWYaUF9pNocAFPLkHmFu4vw5y1ZRNO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FDqmZdr4Fr+cIVjyZqP4PPFRNuv6ZeD/3IzU6UUqxmrpO5nP0h8MyywySJWLLBVGN
	 Phr3cra3lc3WD3xqJLyPPREMvPLz7iQ9+F2H0YuJglIWj4rdkHuVmqAoHKv5C97h8R
	 TS+Jzb7dXDlji3XYbcVKB8YOD2AA/JuFTBmEWp0d7bZ6l0T9bacX+t2UctyiHPJv0k
	 X/QaInhcecIiANYqhEkVsrHUahc96iMQm2EfwnAWpWoLn14UGS42TUUT4kBvcrnmH7
	 Da5D8vwEu8X4pU4xbm3ZzRD4viG0M4wpGou6RWD07/9yETWABLfu9qbv0K54HyxaGA
	 IPqxccd3KPeAg==
Date: Thu, 5 Sep 2024 15:31:51 +0100
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
Subject: Re: [PATCH v1 05/10] ASoC: loongson: Improve code readability
Message-ID: <659f9214-1287-4e20-a25f-51ab3b4c8d6f@sirena.org.uk>
References: <cover.1725518229.git.zhoubinbin@loongson.cn>
 <c54fbc2582702689c005e1ba528ab2318b1adde6.1725518229.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LkSdsgr+RbjZidV0"
Content-Disposition: inline
In-Reply-To: <c54fbc2582702689c005e1ba528ab2318b1adde6.1725518229.git.zhoubinbin@loongson.cn>
X-Cookie: The horror... the horror!


--LkSdsgr+RbjZidV0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 05, 2024 at 03:02:54PM +0800, Binbin Zhou wrote:
> This patch attempts to clean up driver code formatting issues.
> Mainly as follows:
> 1. Use the BIT macro;
> 2. Use dev_err_probe() in every error path in probe in loongson_card
>    driver;
> 3. Introduce loongson_card_acpi_find_device() to streamlined code.

Please split these out into three separate patches to make them easier
to review.  I see there's also some other code reordering and
reformatting in there which should also be split out separately.  I
think the changes are probably good overall but there's too much
different stuff going on in one patch to check properly.

--LkSdsgr+RbjZidV0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbZwNcACgkQJNaLcl1U
h9AxyQf8CrPtyX4OTiQUOpnGPhiDORNDQzngh1V6uw2iZGWp9f9LVof1hfW8YZ5r
PxXeo2AtzATvpHbCMsZ3AMdQq6IaAy+UqRD1Zy9JTc5LwdeKxEI8YSQ82usgDbW2
yVY81ZCx7LOb/TaXAyJ5LWGGLfHlh/3lZYPolLanpMDz1Dk+0kPmZpYcoQYmiTjX
JvxEAx5Cj8+ITkTYC0868rsAT6bSzT8cXUCmvesAk+HW3UAjF07RLK7NFREi7oi7
Pvx8RlhYy8XJz7writyyHSsLO/BcltAPKXPRAJuweZ63q8JVgZ7okbOZBplDtW+9
AQub37Uu+ItDXMccF2qfTV3HsOoZqw==
=c2ZQ
-----END PGP SIGNATURE-----

--LkSdsgr+RbjZidV0--
