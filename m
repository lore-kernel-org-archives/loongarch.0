Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B514D128803;
	Wed,  8 May 2024 16:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715185588; cv=none; b=BUv9g9PzR+vq9wMplhyuifOQFo9OPUIJASIzdN61QtB/bwRBXjTfKMpR1zsXmDoslMzv6gk6q+C22V2hQbNeLh6xCTVxeUcB30or+N7wLLLNb7uBtfQfBP9hR/NeOExUfjHjiA9eJrBJIurtDZZIIsCXdd7turCcLNPW19h8CTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715185588; c=relaxed/simple;
	bh=rpmaTcF6NHb4RdcHyRzCGKLynwtWYkWx/YXOSidOu3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TzI2NqMEDzp7AXd8yHbgVMW3a1J6ePfl+gc/CeCAuJq4VznUvFCcX4TX8EdX7VzXpA6/A4jNqanumqaLg/aaVQ0UH1SvKzI6Gdi/J5YfYGVUUNyRpP8q+a2RWQjicnA/ru81dLtpY4+BS4GJsHiITN9qMVpgJpgXS/4ypTDm0W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mzqDzW7U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mzqDzW7U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56BC2C113CC;
	Wed,  8 May 2024 16:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715185588;
	bh=rpmaTcF6NHb4RdcHyRzCGKLynwtWYkWx/YXOSidOu3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mzqDzW7UmVFevoUNYXqlEDCH7fTwvTXl6i4PIVqMDV0nACJJdDWzzwBZ/qHw6N8vg
	 LVB5U3CpNwNQEXsTCtHPjIkV4juJdBxwcA45xA+i8EwBFL5Bz27ihuHPSz38e2VAHc
	 QmZ1n1IBnOwUpoLqUEdHRzp9IgC/9IKD1KFMiwGq4aDJQTJ5O4ozZ97SRuWZoiQ6pj
	 PW+6ZnvLrBRpl8VtFB62/TX5zO8V5Zyf8jZmoQT04pI7o5/prnIPB6zZfVSRHGpQ/Y
	 MKgtvyXGNmWmUWg08CEpksR6a63QR8GbnEzB6wYhTFP0mAk/qUIrccIOXCU60GuDB7
	 diYPSfnNzQSrQ==
Date: Wed, 8 May 2024 17:26:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn, Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev
Subject: Re: [PATCH v1 1/2] LoongArch: dts: Add new supported device nodes to
 Loongson-2K0500
Message-ID: <20240508-startup-oblivious-d864191f524f@spud>
References: <cover.1715156107.git.zhoubinbin@loongson.cn>
 <d0b25dedb43c000faad5b86cd0512dc6498e7839.1715156107.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5VdxMT3EQ9yVAswp"
Content-Disposition: inline
In-Reply-To: <d0b25dedb43c000faad5b86cd0512dc6498e7839.1715156107.git.zhoubinbin@loongson.cn>


--5VdxMT3EQ9yVAswp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 08, 2024 at 04:29:10PM +0800, Binbin Zhou wrote:
> By now, more Loongson-2K0500 related drivers are supported, such as
> clock controller, thermal controller, and dma controller.
> Now we add these device nodes to the Loongson-2K0500 dts file.
>=20
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  .../boot/dts/loongson-2k0500-ref.dts          |  4 +
>  arch/loongarch/boot/dts/loongson-2k0500.dtsi  | 81 ++++++++++++++++++-
>  2 files changed, 82 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/loongarch/boot/dts/loongson-2k0500-ref.dts b/arch/loong=
arch/boot/dts/loongson-2k0500-ref.dts
> index 8aefb0c12672..62dad6297e82 100644
> --- a/arch/loongarch/boot/dts/loongson-2k0500-ref.dts
> +++ b/arch/loongarch/boot/dts/loongson-2k0500-ref.dts
> @@ -41,6 +41,10 @@ linux,cma {
>  	};
>  };
> =20
> +&clk {
> +	status =3D "okay";
> +};

For most devices, doing the "disable in dtsi, enable in dts" approach is
the right thing to do, but for things like clock-controllers or
architectural interrupt controllers that no-one is going to disable
since they'll not have a usable system otherwise, it's not needed.

Cheers,
Conor.

--5VdxMT3EQ9yVAswp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjunsAAKCRB4tDGHoIJi
0gDGAP97zOERCBCiF1XWGcTjTK9TVRtsHk31NwTP0/0QW2p7jgEA0eY9aE046JxU
/XZFfemeT77STOBwpb/GhemQ79sBBwQ=
=HpRW
-----END PGP SIGNATURE-----

--5VdxMT3EQ9yVAswp--
