Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C21C3717C;
	Tue, 19 Sep 2023 15:48:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBD44C433C8;
	Tue, 19 Sep 2023 15:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695138520;
	bh=YMEj73REI1J6u0MY5w+tGzdmS4rNaNnduItLCa1dOts=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=sYq30tepoj+a11qJWgfcbXS96cvQhIhJjGEsH/TFIk3mIZyMU3YYX2XvkQ/ArdbR8
	 MzGYrS8YeM+/7tPvIAh166EidCKOgkZkrIlPPhIrxAsYxdBJ2lHUv+71t4+NBrSLMU
	 NT/OrxW1k0xSq756KaCShLkPYV4Kk5rEtPViW+1ibz37jZCLKW77J9qHhum+yU7G48
	 cPfgvkWzLtP48/OL6SsKupPfc9NtFnJ5JO6r5g91pviFXxm8ZRftKSvHZH+BuniDaq
	 UzEoROLt2xc5HArvfN5zwQH/v93aHlMKXxhaxB9fsAiGOE6uki2nKJyZE5K56HpcQ1
	 cjfCN+JkAroQA==
Date: Tue, 19 Sep 2023 16:48:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
List-Id: <soc.lore.kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>,
	Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Yinbo Zhu <zhuyinbo@loongson.cn>, Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn, soc@kernel.org,
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
Subject: Re: [PATCH v3 1/5] soc: loongson: loongson2_pm: Add dependency for
 INPUT
Message-ID: <20230919-9ce82588fccdd641574b468c@fedora>
References: <cover.1693623752.git.zhoubinbin@loongson.cn>
 <16a37f6ad3cc9417b6638c2cd532d88c79468eb1.1693623752.git.zhoubinbin@loongson.cn>
 <885eab85-2c11-cf20-9187-55cd647fbe9f@infradead.org>
 <c7604f6c-4da7-47c4-abe9-e626b3efc665@infradead.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t2Nc9cLRgLLRvvZk"
Content-Disposition: inline
In-Reply-To: <c7604f6c-4da7-47c4-abe9-e626b3efc665@infradead.org>


--t2Nc9cLRgLLRvvZk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 19, 2023 at 08:36:50AM -0700, Randy Dunlap wrote:
> Hi--
>=20
> On 9/2/23 08:43, Randy Dunlap wrote:
> >=20
> >=20
> > On 9/2/23 01:47, Binbin Zhou wrote:
> >> Since commit 67694c076bd7 ("soc: loongson2_pm: add power management
> >> support"), the Loongson-2K PM driver was added, but it didn't update t=
he
> >> Kconfig entry for the INPUT dependency, leading to build errors:
> >>
> >> /opt/crosstool/gcc-13.2.0-nolibc/loongarch64-linux/bin/loongarch64-lin=
ux-ld:
> >> drivers/soc/loongson/loongson2_pm.o: in function `loongson2_power_butt=
on_init':
> >> /work/lnx/next/linux-next-20230825/LOONG64/../drivers/soc/loongson/loo=
ngson2_pm.c:101:(.text+0x350): undefined reference to `input_allocate_devic=
e'
> >> /opt/crosstool/gcc-13.2.0-nolibc/loongarch64-linux/bin/loongarch64-lin=
ux-ld:
> >> /work/lnx/next/linux-next-20230825/LOONG64/../drivers/soc/loongson/loo=
ngson2_pm.c:109:(.text+0x3dc): undefined reference to `input_set_capability'
> >> /opt/crosstool/gcc-13.2.0-nolibc/loongarch64-linux/bin/loongarch64-lin=
ux-ld:
> >> /work/lnx/next/linux-next-20230825/LOONG64/../drivers/soc/loongson/loo=
ngson2_pm.c:111:(.text+0x3e4): undefined reference to `input_register_devic=
e'
> >> /opt/crosstool/gcc-13.2.0-nolibc/loongarch64-linux/bin/loongarch64-lin=
ux-ld:
> >> /work/lnx/next/linux-next-20230825/LOONG64/../drivers/soc/loongson/loo=
ngson2_pm.c:125:(.text+0x3fc): undefined reference to `input_free_device'
> >> /opt/crosstool/gcc-13.2.0-nolibc/loongarch64-linux/bin/loongarch64-lin=
ux-ld: drivers/soc/loongson/loongson2_pm.o: in function `input_report_key':
> >> /work/lnx/next/linux-next-20230825/LOONG64/../include/linux/input.h:42=
5:(.text+0x58c): undefined reference to `input_event'
> >>
> >> Also, since this driver can only be built-in, it fails to link when the
> >> INPUT is in a loadable module, so we should update the Kconfig entry to
> >> depend on INPUT=3Dy.
> >>
> >> Fixes: 67694c076bd7 ("soc: loongson2_pm: add power management support")
> >> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> >> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> >=20
> > Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> > Tested-by: Randy Dunlap <rdunlap@infradead.org>
> >=20
> > Thanks.
>=20
> What's the status of this patch?
> linux-next builds are still failing without this patch.

Likely suffering (still) from:

https://lore.kernel.org/all/58500dc7-af1b-4edb-bb2b-93be454ec151@app.fastma=
il.com/

:)

Seemingly this was sent again in isolation 2 weeks ago, but neither the
maintainer (Huacai) nor soc@kernel.org were on cc:

https://lore.kernel.org/all/20230905123629.4510-1-zhuyinbo@loongson.cn/

/shrug
Conor.

>=20
> Thanks.
>=20
> >=20
> >> ---
> >>  drivers/soc/loongson/Kconfig | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/soc/loongson/Kconfig b/drivers/soc/loongson/Kconf=
ig
> >> index 314e13bb3e01..368344943a93 100644
> >> --- a/drivers/soc/loongson/Kconfig
> >> +++ b/drivers/soc/loongson/Kconfig
> >> @@ -20,6 +20,7 @@ config LOONGSON2_GUTS
> >>  config LOONGSON2_PM
> >>  	bool "Loongson-2 SoC Power Management Controller Driver"
> >>  	depends on LOONGARCH && OF
> >> +	depends on INPUT=3Dy
> >>  	help
> >>  	  The Loongson-2's power management controller was ACPI, supports AC=
PI
> >>  	  S2Idle (Suspend To Idle), ACPI S3 (Suspend To RAM), ACPI S4 (Suspe=
nd To
> >=20
>=20
> --=20
> ~Randy

--t2Nc9cLRgLLRvvZk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQnCzgAKCRB4tDGHoIJi
0jO4AP975FE6oYmpGallhbaLdc+2T3L7g7mWuaSE3yE6mN2obAD9HhjeJqVe5JIE
yPXMrHl5ifXinHzf9ci5k4OIolVEOgs=
=xPZ9
-----END PGP SIGNATURE-----

--t2Nc9cLRgLLRvvZk--
