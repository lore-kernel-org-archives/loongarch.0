Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D173B1D133;
	Tue, 19 Dec 2023 16:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wlph3+yt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95101C433C9;
	Tue, 19 Dec 2023 16:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703001942;
	bh=1UNhhh2p2VaSEqxSYiVKpRP2qDM5jDso1KMzABjv/Z0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wlph3+ytmPN//1jbPndMQ7HZReZAxLF7+8AvcwYU480jtYcneoqnDeqxCB3EUW3Yc
	 97zfIA/RGushUnopNGpnJoHUQN9aqIKBooX8+IRpD/rl1pGd3IFwVuODYogh5UEPXS
	 3HVzGwugHFUtE1dylVfLcBDATBvdoAFHue37Dfah63Y7I70ICBOcC4e65+X8n/+SUS
	 ibfKwnV5NAYgIQxDWdiddUhICHojxW8BjtgQnkcVEUVAE6lC0rqCfUnHmloL9OlDF5
	 PGbc1i/pPQ0wntRLCrip9KL2Djt+bhA1oyIMEyH/E7IEK55gn5OC7ljTKrN66fA5Kx
	 Ky2N8JYF31E+w==
Date: Tue, 19 Dec 2023 16:05:37 +0000
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
Subject: Re: [PATCH v5 4/7] LoongArch: dts: DeviceTree for Loongson-2K0500
Message-ID: <20231219-old-outnumber-22ae5dd35a5a@spud>
References: <cover.1702862778.git.zhoubinbin@loongson.cn>
 <303e56cb6e5f82623babe18b095069b330cd37da.1702862778.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NZQCWDkC0v4tpW87"
Content-Disposition: inline
In-Reply-To: <303e56cb6e5f82623babe18b095069b330cd37da.1702862778.git.zhoubinbin@loongson.cn>


--NZQCWDkC0v4tpW87
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 18, 2023 at 09:52:58AM +0800, Binbin Zhou wrote:
> diff --git a/arch/loongarch/boot/dts/loongson-2k0500.dtsi b/arch/loongarch/boot/dts/loongson-2k0500.dtsi
> new file mode 100644
> index 000000000000..1dcb6a20fc6c
> --- /dev/null
> +++ b/arch/loongarch/boot/dts/loongson-2k0500.dtsi
> @@ -0,0 +1,274 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023 Loongson Technology Corporation Limited
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/ {
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu = <&cpu0>;
> +				};
> +			};
> +		};

You have only one CPU, this should not be needed.

> +
> +		cpu0: cpu@0 {
> +			compatible = "loongson,la264";
> +			device_type = "cpu";
> +			reg = <0x0>;
> +			clocks = <&cpu_clk>;

Is this actually a complete description of the cpu? Are there i/d caches
etc?

Cheers,
Conor.

--NZQCWDkC0v4tpW87
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZYG/UQAKCRB4tDGHoIJi
0qdCAQCddr3tYzSjfXbbdKOlHvzpa2X71EWXKPt7agWwTZiLMAD7Be76g/dRnzdJ
OpcfaqY+tCw++BjM6fD8eT4P6PEw6Ag=
=lDzh
-----END PGP SIGNATURE-----

--NZQCWDkC0v4tpW87--
