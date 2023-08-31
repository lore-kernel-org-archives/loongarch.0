Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709DA125BC
	for <loongarch@lists.linux.dev>; Thu, 31 Aug 2023 15:15:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 070A3C433C7;
	Thu, 31 Aug 2023 15:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693494899;
	bh=drKObaEb9gV+rZiPSJgjphZLs8Xj+k/DszgLWr3JQuA=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=pciIGaiLWplDzGQgMmawJ0ZSkAS63X4DnEf39kLy6fM1HAXIVR9LHOkNUs+Vcv8xB
	 kVoTFnS2wOAGvR82oGeX5BSUvYy4kBfGf0v8cNwpcCmUgP2TWfb7zas8bE65PUp7wQ
	 YA+X9oHA2bhrvpxMu0y8nnhxWpK7Zx1kjaWOSid/NksMe5d8MbBKCsf1fpA40rXuQC
	 BHPSKBY+YiG3YXwFVk1CV1wG7K+K7YvTSV7vJGD9t8Wq0nupeGQJrqyt3nnUEabUZ9
	 8fgXvYnQ/X50mRRIBDE5j5JMtbxN5LOTJA8PcB93rAe+0n938BvrWHzGfTOPJ9z65i
	 KHPHRAoRcIq6Q==
Date: Thu, 31 Aug 2023 16:14:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
List-Id: <soc.lore.kernel.org>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Yinbo Zhu <zhuyinbo@loongson.cn>, Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn, soc@kernel.org,
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
Subject: Re: [PATCH v2 3/5] soc: loongson: loongson_pm2: Drop useless
 of_device_id compatible
Message-ID: <20230831-ambition-refusing-08e63b345573@spud>
References: <cover.1693474728.git.zhoubinbin@loongson.cn>
 <bf09b11ec6a0102f85dc2b3289d003271304e24d.1693474728.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6P/Vao00H/hDkcQp"
Content-Disposition: inline
In-Reply-To: <bf09b11ec6a0102f85dc2b3289d003271304e24d.1693474728.git.zhoubinbin@loongson.cn>


--6P/Vao00H/hDkcQp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 31, 2023 at 07:43:13PM +0800, Binbin Zhou wrote:
> Now, "loongson,ls2k0500-pmc" is used as fallback compatible, so the
> ls2k1000 compatible in the driver can be dropped directly.
>=20
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  drivers/soc/loongson/loongson2_pm.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/soc/loongson/loongson2_pm.c b/drivers/soc/loongson/l=
oongson2_pm.c
> index 796add6e8b63..5ffb77afd9eb 100644
> --- a/drivers/soc/loongson/loongson2_pm.c
> +++ b/drivers/soc/loongson/loongson2_pm.c
> @@ -197,7 +197,6 @@ static int loongson2_pm_probe(struct platform_device =
*pdev)
> =20
>  static const struct of_device_id loongson2_pm_match[] =3D {
>  	{ .compatible =3D "loongson,ls2k0500-pmc", },
> -	{ .compatible =3D "loongson,ls2k1000-pmc", },

What about older devicetrees that do not have the fallback? Aren't you
going to remove support for those?

>  	{},
>  };
> =20
> --=20
> 2.39.3
>=20

--6P/Vao00H/hDkcQp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZPCubgAKCRB4tDGHoIJi
0lRYAP0a8nAMuLBKh3MT3QCSnpm4FLHph15ATK7tEqoF62ABTQEAr+uxYj0cqwWt
pYjaLukjJVBk29zMaCi3je3x2pVo1Q4=
=utge
-----END PGP SIGNATURE-----

--6P/Vao00H/hDkcQp--
