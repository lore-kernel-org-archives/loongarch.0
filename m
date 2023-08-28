Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175186116
	for <loongarch@lists.linux.dev>; Mon, 28 Aug 2023 15:49:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D026FC433C8;
	Mon, 28 Aug 2023 15:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693237778;
	bh=EgwduPs67qveoZgcdAkipZLwkc8aT5xezge3BHjTvRg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LlHuE3se73qPb2ExjwJVhFAaLuJPJhhHepDASnBShkjs/So6Ed7mjchD/xdu4grrM
	 SCae18W1kHPOR4kOXzBdBPA1gII459kX5CiDcpahkhnUIl/uIsd57ILzWHlbo0K8cz
	 7iD3NYL3Nsj5/6b71I5YK49LQOvyMlau7denTSxBz7lglvvZ3J3xz2Fh3ehC+8KSz/
	 2Wlk04sB1/XtxwL20d6Sgr2ZN3dvF6etkDtxrzSzd/2TvWkAeS7heG++MMDSQWjeTk
	 6PfemCtrxGuGQMOJxUySc+Wi/hQsvhK6XBiA9qW+wIHHhvYrqvigh1ISAUj8ocjQlp
	 TqMbiXidClShg==
Date: Mon, 28 Aug 2023 16:49:33 +0100
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
Subject: Re: [PATCH 2/5] dt-bindings: soc: loongson,ls2k-pmc: Add missing
 compatible for Loongson-2K2000
Message-ID: <20230828-shrewdly-payee-c5eb091a0417@spud>
References: <cover.1693218539.git.zhoubinbin@loongson.cn>
 <54ee114c08f35ab8b5dc584fd76135ac9076f5a7.1693218539.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EHhPijYPZzBKwGBx"
Content-Disposition: inline
In-Reply-To: <54ee114c08f35ab8b5dc584fd76135ac9076f5a7.1693218539.git.zhoubinbin@loongson.cn>


--EHhPijYPZzBKwGBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 28, 2023 at 08:38:32PM +0800, Binbin Zhou wrote:
> Document the Power Management Unit system controller compatible for
> Loongson-2K2000.
>=20
> This is a missing compatible, now we add it.
>=20
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  .../devicetree/bindings/soc/loongson/loongson,ls2k-pmc.yaml      | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/loongson/loongson,ls2k=
-pmc.yaml b/Documentation/devicetree/bindings/soc/loongson/loongson,ls2k-pm=
c.yaml
> index da2dcfeebf12..7473c5659929 100644
> --- a/Documentation/devicetree/bindings/soc/loongson/loongson,ls2k-pmc.ya=
ml
> +++ b/Documentation/devicetree/bindings/soc/loongson/loongson,ls2k-pmc.ya=
ml
> @@ -15,6 +15,7 @@ properties:
>        - enum:
>            - loongson,ls2k0500-pmc
>            - loongson,ls2k1000-pmc
> +          - loongson,ls2k2000-pmc

Same thing here as the driver patch, the pmc on this newly added SoC
appears to use the same codepaths as the existing ones. Does it share a
programming model & should there be a fallback compatible here?

>        - const: syscon
> =20
>    reg:
> --=20
> 2.39.3
>=20

--EHhPijYPZzBKwGBx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZOzCDQAKCRB4tDGHoIJi
0mJnAQC5PFTL8cQQxmV3Bs310RTUDpQiffTEZlPNe1A93VY/EAD5AXMuAU9VmRtZ
K/Mv7mHKDQ7h+pNz0M2jzI1i9iLyvA4=
=LQ8S
-----END PGP SIGNATURE-----

--EHhPijYPZzBKwGBx--
