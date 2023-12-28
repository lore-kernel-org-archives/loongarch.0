Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AC6D517;
	Thu, 28 Dec 2023 14:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tw/zl+Ek"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF0DFC433C7;
	Thu, 28 Dec 2023 14:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703772557;
	bh=0KS86pSxtMiAwpTGif4h0gvZMaH1Cq/im8Whr2BWleo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tw/zl+EkpnQAzLEpIMFoAaFF4B+tE2kLR0/MMdxfKbazf+BF/eANeTE/cMH6+8f9k
	 RtgoMk1hivL15Sx0NAe/Z3L9gL78T8HNeS1YAkbX4U+GXEH9tyViBi927OAurLYesR
	 xRw9eB5jYW4L8tfgm1pbRu+kcH1tS4HaxoLYH6Hc4iZtkxtv4A0qBP+hUX8LZP50Jm
	 EzbM6nGGEaeSIwRVzZ/XIEOSl1x/Em0r5kcNrvxoHFJgbSDCUXrZmWBVGv+LJg3opu
	 mxU25zO1RQVXPzX5gVd2RBAQigA3vNgQnES3hhyS5imPVCAE8gwJnQBHU70pavcWL1
	 pJ5LWiNFfZlWg==
Date: Thu, 28 Dec 2023 14:09:12 +0000
From: Conor Dooley <conor@kernel.org>
To: Binbin Zhou <zhoubb.aaron@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Hongliang Wang <wanghongliang@loongson.cn>
Subject: Re: [PATCH v6 0/7] LoongArch: Add built-in dtb support
Message-ID: <20231228-ultimatum-paramedic-6c0301f56d1c@spud>
References: <cover.1703229766.git.zhoubinbin@loongson.cn>
 <20231222-support-relieve-5d8f25292b40@spud>
 <CAMpQs4+Uwu=j56Qa_V211_hC+F4MKE6mvTVtW75M1wuAY3-p1g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ci/tCjg9pwZIdhtL"
Content-Disposition: inline
In-Reply-To: <CAMpQs4+Uwu=j56Qa_V211_hC+F4MKE6mvTVtW75M1wuAY3-p1g@mail.gmail.com>


--ci/tCjg9pwZIdhtL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 27, 2023 at 12:04:59PM +0600, Binbin Zhou wrote:
>=20
> Ah, yes, I tried looking at the `hwloc-ls` output before committing,
> and it's below(LS2K1000):
>=20
> [root@fedora ~]# hwloc-ls
> Machine (7730MB total)
>   Package L#0
>     NUMANode L#0 (P#0 7730MB)
>     L2 L#0 (1024KB)
>       L1d L#0 (32KB) + L1i L#0 (32KB) + Core L#0 + PU L#0 (P#0)
>       L1d L#1 (32KB) + L1i L#1 (32KB) + Core L#1 + PU L#1 (P#1)
>=20
> It's the same as what we actually have.


Yeah, that looks to be about what I would expect, thanks.

--ci/tCjg9pwZIdhtL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZY2BiAAKCRB4tDGHoIJi
0lLPAQDmiDwuyFdk70rPlM/m9cmFFfO2ngdulTETC3kATIE3uAEA+qioJ0JPSVYa
cbMKh1bsP9t7oqoxdxH0xeNTQhQSKgQ=
=0mbY
-----END PGP SIGNATURE-----

--ci/tCjg9pwZIdhtL--
