Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D0323765;
	Fri, 22 Dec 2023 15:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l5ZXNtQN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3247FC433C7;
	Fri, 22 Dec 2023 15:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703259544;
	bh=sVpgFN+bKRvkZsW0txNkPgIOZa0dfGDSfWxyXs7AEeg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l5ZXNtQN612pkMfNqBINmArzkfRvOoIuXpDrwL9HuyodZ0vcSa4dfwFJVv9v+wlHn
	 cQbExULZrJNIZFCQ3NCBJVX4C1yxbNoEHxRZ0zb7OhHgmNc/gxzA5xvonvEB1QW5uz
	 D8bzJA9PFBJ7JaP/6lDI2Vpd5fCaD7Vm/0/u6Hv3u0pZ6tb0DM0ruM7Z1Dsgk7TLzW
	 Agkr9fS4RUmH1Wi6wX3kwlyjzUZlIiblSuvHcFyn4kCehyBuuiPZC4b6+6HUyev2qx
	 EPDNLXwjmK/mqsZR24ZpHkjTBJKXKEgDJMHspDOH6y6Y0/IgfiFwiv/4u6iG0/0t+s
	 OeVmDDD31DhGg==
Date: Fri, 22 Dec 2023 15:38:59 +0000
From: Conor Dooley <conor@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Hongliang Wang <wanghongliang@loongson.cn>
Subject: Re: [PATCH v6 0/7] LoongArch: Add built-in dtb support
Message-ID: <20231222-support-relieve-5d8f25292b40@spud>
References: <cover.1703229766.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cl7s7JpZ8PgKhOsN"
Content-Disposition: inline
In-Reply-To: <cover.1703229766.git.zhoubinbin@loongson.cn>


--cl7s7JpZ8PgKhOsN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Binbin,

On Fri, Dec 22, 2023 at 04:00:43PM +0800, Binbin Zhou wrote:
> Hi all:
>=20
> This patchset introduces LoongArch's built-in dtb support.
>=20
> During the upstream progress of those DT-based drivers, DT properties
> are changed a lot so very different from those in existing bootloaders.
> It is inevitably that some existing systems do not provide a standard,
> canonical device tree to the kernel at boot time. So let's provide a
> device tree table in the kernel, keyed by the dts filename, containing
> the relevant DTBs.
>=20
> We can use the built-in dts files as references. Each SoC has only one
> built-in dts file which describes all possible device information of
> that SoC, so the dts files are good examples during development.
>=20
> And as a reference, our built-in dts file only enables the most basic
> bootable combinations (so it is generic enough), acts as an alternative
> in case the dts in the bootloader is unexpected.
>=20
> In the past while, we resolved the DTC_CHK warning for the v4 patchset,
> and the relevant patchset has either been applied or had the
> Reviewed-by tag added.=20

I notice you dropped the topology information from all patches in the
series, not only the 2k0500 patch that only has one CPU. I didn't see a
response to my comments the kernel being able to assemble the topology
based on the second level caches using the generic topology code for the
systems that have more than one cpu. With the cpu-map information
dropped, do the multi-cpu systems have their topologies assembled
correctly by the kernel?
You mentioned that there is an instruction that allows you to get
information about i and d caches etc, so adding them to the DT is not
required, but does it also cover the next level caches?
The program that I am familiar with for displaying this information
is hwloc: https://github.com/open-mpi/hwloc

Cheers,
Conor.


--cl7s7JpZ8PgKhOsN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZYWtkwAKCRB4tDGHoIJi
0jCsAQDipsjMzXNhmZcK6kUY1L2Kq3wWBV5A7mZVD3TLqO7GuwEA2J94hEBmdKMK
8joYybldYGnbInCVes8NkqS2MWGODQY=
=fIt2
-----END PGP SIGNATURE-----

--cl7s7JpZ8PgKhOsN--
