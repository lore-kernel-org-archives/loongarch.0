Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0775149E1A;
	Wed, 27 Mar 2024 16:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711558541; cv=none; b=NNYRVXYvPSENBBOT7PBD/E43fCrZKCBkl4F1i4UkspN2jG98l58i899DPugr61zJo+1ZzDsnpYZPjp10rdm9Z9NFpYr6UddUBppMj7KFeZQcrTfxD47cFVmK//ENnoQmeQ2iAttxoq9kpyFOgBUDWchR06NiDivaiBLLhTn29y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711558541; c=relaxed/simple;
	bh=9ybGAgC7s0iD76xqW9MDm9NbgH+kLRTQZGDj+gPL2W0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LMVXVBpa+m2/k6Vo6U7UzgNqBvA5AO4d1yFuj4r0jq5pX61+8A1d2/fEdJyckNLLBJZsi+yeEhyqLelDDi0eys/sioDxWPM/EUnfGVpt85nSRlNa8axyU5XsyoD8KHVTkX//a9530MafJTUMa9KXgQwxgBhadxx1ejrlY3hqnjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oyHhINfn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oyHhINfn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 699EDC433F1;
	Wed, 27 Mar 2024 16:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711558541;
	bh=9ybGAgC7s0iD76xqW9MDm9NbgH+kLRTQZGDj+gPL2W0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oyHhINfn6rCRc9UokRscIObGhysCBYNu29sU/QDaRBAZWr70H1wbWhhXDc1YVxvTq
	 T5i8wGP2XUtgxN8hwdDV5aw4UtMYv4pEVCVujfToYLblLKwTxOHgcNDhyDl6TsCmC9
	 Usl8v7Q6Z7rTI5H/09rFaRoLyzQdfoki06G7FF4SxPFaSBy6S57qxIE6Yg3kbHMjPM
	 6BICEg1RgODnhiGfhu8XG9lKTIvdK/q+yN7pkZCQsaQ/5JifYore+lr3i3Yqnb6lXO
	 JRPMfzJZR/fAhre/SUqgNR/IUEWpWMsNY8t9qZwNPuKQbnXS3FeE8kqSLXe9e+UsSS
	 fKAmM86YCGEAQ==
Date: Wed, 27 Mar 2024 16:55:36 +0000
From: Conor Dooley <conor@kernel.org>
To: Binbin Zhou <zhoubb.aaron@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>,
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
Subject: Re: [PATCH v1 1/8] dt-bindings: clock: add Loongson-2K expand clock
 index
Message-ID: <20240327-spree-perjury-f0ac4b8156a8@spud>
References: <cover.1710926402.git.zhoubinbin@loongson.cn>
 <0cfd237c2c7c1e4f89b6e5f7af0a64d306de1c8f.1710926402.git.zhoubinbin@loongson.cn>
 <20240326-shifter-zeppelin-1d8616dc82f9@spud>
 <CAMpQs4JKYxJQ=+iRW6EqRc4t3wF=eNLVg0Y=943D+X+LmJyG=Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4smSXZcEuLXSNdWf"
Content-Disposition: inline
In-Reply-To: <CAMpQs4JKYxJQ=+iRW6EqRc4t3wF=eNLVg0Y=943D+X+LmJyG=Q@mail.gmail.com>


--4smSXZcEuLXSNdWf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 27, 2024 at 07:15:40AM +0600, Binbin Zhou wrote:
> On Wed, Mar 27, 2024 at 12:54=E2=80=AFAM Conor Dooley <conor@kernel.org> =
wrote:
> >
> > On Tue, Mar 26, 2024 at 05:01:00PM +0800, Binbin Zhou wrote:
> >
> > > -#define LOONGSON2_CLK_END                            18
> >
> >
> > > +#define LOONGSON2_CLK_END    35
> >
> > Please just delete this. If you can change it, it is not a binding.
> > Just define it in the driver if it is needed there.
>=20
> Hi Conor:
>=20
> Ok, I will drop it in the next version.

With that removed
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--4smSXZcEuLXSNdWf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZgRPiAAKCRB4tDGHoIJi
0nJ2AQC3w/jh/Fb0k9qAEMQ2PqVtwafqdZodCyOIYk5sPFYCEgEAteETm9FdYDKk
WF/8+dplwlx1/TBgkIHAhQIyr2fIsgw=
=X+Ut
-----END PGP SIGNATURE-----

--4smSXZcEuLXSNdWf--
