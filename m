Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC196116
	for <loongarch@lists.linux.dev>; Mon, 28 Aug 2023 15:32:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B323C433C7;
	Mon, 28 Aug 2023 15:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693236757;
	bh=n+HOb8/DOkSkv6qbcqDYdruBbEwzTG5YIOFlBwbk2rI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U1nytWDTy/tIxxTtNvp6x2e2piwAMq9p6H57MDylhErQ5MluShijnloy1DesDgr/4
	 VvZsTSHHTM4WWABXLfPaFwU2caIbHz0M6jn2xk8BPyP3Yxb624ZJAmK613iUPxq90n
	 WabmTBFGXXtt4D0MZfjID9Zcl5hfVaGYKBBnQtkHPtuPrND2F4MTpTKhMvJpaeZgXl
	 /DioONzHPRt4+4rX0noAOynksv6yKAZvre9LpNlAwkda45A/nUqGZUeqE2OXNjOdLa
	 k6v4p+6bYNUK6EUfHro1oLURb4bFxAbyz3bQ5n5jU63I6R8Q97IDyF1vv52ncuMlzP
	 hvIySzj0CbPNA==
Date: Mon, 28 Aug 2023 16:32:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Yinbo Zhu <zhuyinbo@loongson.cn>, Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn, devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev
Subject: Re: [PATCH 3/5] soc: loongson: loongson_pm2: Add missing compatible
 for Loongson-2K2000
Message-ID: <20230828-compactor-contour-3a9f4991360f@spud>
References: <cover.1693218539.git.zhoubinbin@loongson.cn>
 <8468bdbea87003dc05bd10d15b51e6d27f306a20.1693218539.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Xl72ewxv2X0f7Y4j"
Content-Disposition: inline
In-Reply-To: <8468bdbea87003dc05bd10d15b51e6d27f306a20.1693218539.git.zhoubinbin@loongson.cn>


--Xl72ewxv2X0f7Y4j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 28, 2023 at 08:38:33PM +0800, Binbin Zhou wrote:
> Add compatible for Loongson-2K2000, which also has the Loongson2
> Power Management Unit system controller.
>=20
> This is a missing compatible, now we add it.
>=20
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  drivers/soc/loongson/loongson2_pm.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/soc/loongson/loongson2_pm.c b/drivers/soc/loongson/l=
oongson2_pm.c
> index 796add6e8b63..6d2b3708e947 100644
> --- a/drivers/soc/loongson/loongson2_pm.c
> +++ b/drivers/soc/loongson/loongson2_pm.c
> @@ -198,6 +198,7 @@ static int loongson2_pm_probe(struct platform_device =
*pdev)
>  static const struct of_device_id loongson2_pm_match[] =3D {
>  	{ .compatible =3D "loongson,ls2k0500-pmc", },
>  	{ .compatible =3D "loongson,ls2k1000-pmc", },
> +	{ .compatible =3D "loongson,ls2k2000-pmc", },

You've not added any new codepaths for this soc, so it is compatible
with the existing ones. Why are you not using fallback compatibles for
this?

--Xl72ewxv2X0f7Y4j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZOy+EAAKCRB4tDGHoIJi
0okVAP9sQoTuARR2r50RcVlYllk1XS4Ssa5osAlD8MZfPRKxgwEAvYIASGDN36Zc
I4RRQt92IJbOaRFomxERuovjUkxxvA4=
=P4w5
-----END PGP SIGNATURE-----

--Xl72ewxv2X0f7Y4j--
