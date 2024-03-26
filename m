Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED533DABF5;
	Tue, 26 Mar 2024 18:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711479410; cv=none; b=ooJw0eUiCkxd1rxKW8AZKjR47pU7eSQH3mxaECUSlKfqMtHNxbtmxEQKUIIBCid4GYUqFaimJRdYFd8e5fAMksKBtvJmum8aw+e3RNk6gX+HEVAr6WSVV4hNxc9sRlX2ufT/WwUw5pdiBlSWeUoMpDjwYnt7gQH9EcKKxx9xKmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711479410; c=relaxed/simple;
	bh=ZdLEySwEsWnegupZpT4qm4uyz/jp9tNClkbP41nlTlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MCNK8Cxs77TvGB9RzbseTI/c+PVW4EpIdFmYwIPPBy3mBwJt24EkTwQS3L497UEyUpVGaYcAsXjA5cLD7sOHf+hI0+WFFUt+y8oCm/vcP6lq8RKbqml8LILzjf/hdaYQR72UBacnqSUDXQCUefkn6uC66NTECQiYpTH/E0rrhPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QQT9sDZi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QQT9sDZi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B83DCC43390;
	Tue, 26 Mar 2024 18:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711479410;
	bh=ZdLEySwEsWnegupZpT4qm4uyz/jp9tNClkbP41nlTlo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QQT9sDZiA5tHkxV+fymk7CQNbW/LFcAZ6taHXgIdJAfF3c5uivkNKS3FocGWEfEyx
	 NgHq78IVr5b07EFelaI25OE8kp2jxG4mRXKNNEupKUOEKjPE6YqL0MmIiYPZoV3HiV
	 us8EI553UgmFL8VznOPNbXWgMA5y61AJgCVvKkhbepvMRmGAJYy9u8C7Ch9aXa4Sc1
	 zbdxYu4HA3ckp0JSspvT5MZArm7fONwiPJOkdKVBV/xJcwzihLlM6WjO3vGYEfYvew
	 mYR18HHRqEPOL233uvhzflI2eV0SlGxgs0KJoycnyTzFw0cS79Mjp7jSu0Gshu6/M7
	 eFnLPPivi9lpw==
Date: Tue, 26 Mar 2024 18:56:45 +0000
From: Conor Dooley <conor@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev
Subject: Re: [PATCH v1 5/8] dt-bindings: clock: loongson2: add
 Loongson-2K2000 compatible
Message-ID: <20240326-pampered-ladylike-d157c60eaa70@spud>
References: <cover.1710926402.git.zhoubinbin@loongson.cn>
 <3b5d5a11530ca440477c46a1b751a4c8026f00f6.1710926402.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OFe5CZMTprKdPRKa"
Content-Disposition: inline
In-Reply-To: <3b5d5a11530ca440477c46a1b751a4c8026f00f6.1710926402.git.zhoubinbin@loongson.cn>


--OFe5CZMTprKdPRKa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 26, 2024 at 05:01:25PM +0800, Binbin Zhou wrote:
> Add the devicetree compatible for Loongson-2K2000 clocks.
>=20
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.ya=
ml b/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml
> index 83baee40e200..4f79cdb417ab 100644
> --- a/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml
> +++ b/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml
> @@ -18,6 +18,7 @@ properties:
>      enum:
>        - loongson,ls2k0500-clk
>        - loongson,ls2k-clk  # This is for Loongson-2K1000
> +      - loongson,ls2k2000-clk

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--OFe5CZMTprKdPRKa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZgMabQAKCRB4tDGHoIJi
0gHfAQD0eQEFO+wcJjlSXV4bVuLBKpiRJCdOpMVxEwAjkCShRgEAn4L1em/4rIZb
m9LldlvJ/Jhu1RHGNSXc2y9bZ4SHDww=
=S9F2
-----END PGP SIGNATURE-----

--OFe5CZMTprKdPRKa--
