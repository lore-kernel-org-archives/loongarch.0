Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C7411CA4
	for <loongarch@lists.linux.dev>; Thu, 31 Aug 2023 15:17:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F29DEC433C7;
	Thu, 31 Aug 2023 15:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693495057;
	bh=5hd9jH3rvn6X17KKELd8KKlWouZRoQ1Cxuu34Bf76Ho=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=u+r1BBmQDh9HootVmaEfjAxZXu1OEpLtPRLEtHtwQJEizGQ4Vob2FZ+lpfYTUpR5W
	 C7C2q5GcnObXCpFas9bZ/fbbQEOYrhPI1N2OVESheEwDmQISOEstGjTsT7z2P9yZeo
	 ey250SDVjXbH7nQF3uz8FUmZV2f7pt4QYYpdojTfD9r6ooA2zQxNxVyx8xtD0F0HN+
	 YSI0x9/dTdkUeDB2CQF1TCqPdm3L4br1NxXvbiA1gPM9q4uD2rrFBM1HcmQkQS44ru
	 GxqZomNu06fZpOcklct1tVhRch+Q+g6yAy/qxy99sZzW4x7E1sSSdudQGh3Hx67C+A
	 zuA47+uCGc6OA==
Date: Thu, 31 Aug 2023 16:17:30 +0100
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
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2 1/5] soc: loongson: loongson_pm2: Add dependency for
 INPUT
Message-ID: <20230831-visor-tutor-b91b872e10d9@spud>
References: <cover.1693474728.git.zhoubinbin@loongson.cn>
 <13f54f2119b99f967c18c6671d7b80c62264d7ef.1693474728.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="q4SHgyGxpVgfSDK9"
Content-Disposition: inline
In-Reply-To: <13f54f2119b99f967c18c6671d7b80c62264d7ef.1693474728.git.zhoubinbin@loongson.cn>


--q4SHgyGxpVgfSDK9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 31, 2023 at 07:43:11PM +0800, Binbin Zhou wrote:
> Since commit 67694c076bd7 ("soc: loongson2_pm: add power management
> support"), the Loongson-2K PM driver was added, but it didn't update the
> Kconfig entry for the INPUT dependency, leading to build errors, so
> update the Kconfig entry to depend on INPUT.
>=20
> /opt/crosstool/gcc-13.2.0-nolibc/loongarch64-linux/bin/loongarch64-linux-=
ld:
> drivers/soc/loongson/loongson2_pm.o: in function `loongson2_power_button_=
init':
> /work/lnx/next/linux-next-20230825/LOONG64/../drivers/soc/loongson/loongs=
on2_pm.c:101:(.text+0x350): undefined reference to `input_allocate_device'
> /opt/crosstool/gcc-13.2.0-nolibc/loongarch64-linux/bin/loongarch64-linux-=
ld:
> /work/lnx/next/linux-next-20230825/LOONG64/../drivers/soc/loongson/loongs=
on2_pm.c:109:(.text+0x3dc): undefined reference to `input_set_capability'
> /opt/crosstool/gcc-13.2.0-nolibc/loongarch64-linux/bin/loongarch64-linux-=
ld:
> /work/lnx/next/linux-next-20230825/LOONG64/../drivers/soc/loongson/loongs=
on2_pm.c:111:(.text+0x3e4): undefined reference to `input_register_device'
> /opt/crosstool/gcc-13.2.0-nolibc/loongarch64-linux/bin/loongarch64-linux-=
ld:
> /work/lnx/next/linux-next-20230825/LOONG64/../drivers/soc/loongson/loongs=
on2_pm.c:125:(.text+0x3fc): undefined reference to `input_free_device'
> /opt/crosstool/gcc-13.2.0-nolibc/loongarch64-linux/bin/loongarch64-linux-=
ld: drivers/soc/loongson/loongson2_pm.o: in function `input_report_key':
> /work/lnx/next/linux-next-20230825/LOONG64/../include/linux/input.h:425:(=
=2Etext+0x58c): undefined reference to `input_event'
>=20
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  drivers/soc/loongson/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/soc/loongson/Kconfig b/drivers/soc/loongson/Kconfig
> index 314e13bb3e01..368344943a93 100644
> --- a/drivers/soc/loongson/Kconfig
> +++ b/drivers/soc/loongson/Kconfig
> @@ -20,6 +20,7 @@ config LOONGSON2_GUTS
>  config LOONGSON2_PM
>  	bool "Loongson-2 SoC Power Management Controller Driver"
>  	depends on LOONGARCH && OF
> +	depends on INPUT=3Dy

Your commit message should say why INPUT needs to not be a module.

>  	help
>  	  The Loongson-2's power management controller was ACPI, supports ACPI
>  	  S2Idle (Suspend To Idle), ACPI S3 (Suspend To RAM), ACPI S4 (Suspend =
To
> --=20
> 2.39.3
>=20

--q4SHgyGxpVgfSDK9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZPCvCgAKCRB4tDGHoIJi
0klxAQCpbfRcu6EcaoL8WccpVL0O04MhKBOMSwYzQCF5eE9hkgEArZUPu2mx4fk5
NaCtvaf0xoiYDZBe9zoPtZOQU8UhQwg=
=1IgR
-----END PGP SIGNATURE-----

--q4SHgyGxpVgfSDK9--
