Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C913D8912;
	Fri,  9 Oct 2026 14:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791556695; cv=none; b=loss0ksKU7qSSWEpfqPsHk3sDMX4UabiXDFcS0/jBi2Z4Gh+kGdGgi5m6iVgzYiz3b7bE72vl7LcNHIuUqaH0NreYxwjQSlVKEN+so/8Qlj3fsHt9zaH+LkAaAUPfP9OC8RF8rtnmkYqOchBCyc7N9LbowWQZfbnGi5P9uhzFJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791556695; c=relaxed/simple;
	bh=eqM0PlWr9ch6DbXUrK6cEvNGXKpkn6AF+myqT2bnA88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JBN7laBHylTB2877VVME8AU1zmhKdcm5nqlCvgAiSzMaM0Ggzy9NfqJ4VdBn5oy1RZkRSzzs+xAdXyya3AmMPbJ/1Pp4HrxzCMCUjyL/XtTtT/i7rAtuvG+ZY6rleR+Ysrt5bBZFYC3A6YTWnIQJBoD70ofVVMrVx8cOhGI4fvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LRTqMRX7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LRTqMRX7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43C7E1F00893;
	Fri,  9 Oct 2026 14:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791556694;
	bh=J8ci6W9gR1MxfR9kQ57wvearjwn0nXnoa8PuuUu+648=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LRTqMRX7IAs1Pe4elORWf5oNSrRK/alsop9l5NZzialDBQtNjblXusxzeL5f4HQc9
	 f2D5VoLZAGlIeqgQTjNeclGCzgXluujD4iyUeejETwiPQQvd9eDdNNbjbG0T5/jCx7
	 QMMLVrvizZpYoCl31/29k7s4xXy22Kslv63kmQgtDb3DM3qCJZ1t1bQGxmFGPHUdvW
	 CX7dpSLxGxFuVTLJZp+hX5ZvfULMOQZiQeAREALdAFdFUN3PCExoKh9ZM7BqzlMVpz
	 Mjsm8FIvnkfrOLXdTbAn937twm+L2SE5kjHakg17fm92h2ZRfGUFyZ7YvS/rvBcFiQ
	 GRzEaKl6zEutQ==
Date: Fri, 9 Oct 2026 15:38:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
	devicetree@vger.kernel.org, Keguang Zhang <keguang.zhang@gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: dma: loongson: Add Loongson-2 DMA
 mux request IDs
Message-ID: <20261009-4d8fbb63fbd8466681aa7acc@squawk>
References: <cover.1791535540.git.zhoubinbin@loongson.cn>
 <e61992f8e86c69305f984da676092019c0210649.1791535540.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ME+wEtJIPtCBZWH0"
Content-Disposition: inline
In-Reply-To: <e61992f8e86c69305f984da676092019c0210649.1791535540.git.zhoubinbin@loongson.cn>

--ME+wEtJIPtCBZWH0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 09, 2026 at 05:19:32PM +0800, Binbin Zhou wrote:
> Add DT binding constants for the Loongson-2 DMA mux.
>=20
> The header defines the peripheral request IDs used in the DMA specifier
> <request channel flags> for Loongson-2K0300, covering UART0-9, I2C0-3,
> SPI2/3, I2S, ADC and CAN0-3. It also documents the channel-pair semantics
> for peripherals that use paired DMA channels.
>=20
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Squash this with the binding patch please.
If checkpatch told you to split this, binding headers are bindings and
such that warning is a false positive.

pw-bot: changes-requested

Thanks,
Conor.
> ---
>  MAINTAINERS                                   |  1 +
>  .../dt-bindings/dma/loongson,ls2k-dmamux.h    | 53 +++++++++++++++++++
>  2 files changed, 54 insertions(+)
>  create mode 100644 include/dt-bindings/dma/loongson,ls2k-dmamux.h
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 42f5165019ee..172dde21275f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15354,6 +15354,7 @@ F:	Documentation/devicetree/bindings/dma/loongson=
,ls2k0300-dma.yaml
>  F:	Documentation/devicetree/bindings/dma/loongson,ls2x-apbdma.yaml
>  F:	drivers/dma/loongson/loongson2-apb-cmc-dma.c
>  F:	drivers/dma/loongson/loongson2-apb-dma.c
> +F:	include/dt-bindings/dma/loongson,ls2k-dmamux.h
> =20
>  LOONGSON LS2X I2C DRIVER
>  M:	Binbin Zhou <zhoubinbin@loongson.cn>
> diff --git a/include/dt-bindings/dma/loongson,ls2k-dmamux.h b/include/dt-=
bindings/dma/loongson,ls2k-dmamux.h
> new file mode 100644
> index 000000000000..1e2907ab069d
> --- /dev/null
> +++ b/include/dt-bindings/dma/loongson,ls2k-dmamux.h
> @@ -0,0 +1,53 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Loongson-2 SoC DMA Mux dt-bindings
> + *
> + * DMA specifier format:
> + *   dmas =3D <&dma_mux <request> <channel> <flags>>;
> + *
> + * The <channel> cell selects a physical CMC DMA channel (0-7)
> + * For peripherals using channel pairs (UART, I2C, SPI2/3, I2S),
> + * the channel number selects the pair: 0/1 -> pair 0, 2/3 -> pair 1,
> + * 4/5 -> pair 2, 6/7 -> pair 3.
> + *
> + * Copyright (C) 2026 Loongson Technology Corporation Limited
> + */
> +
> +#ifndef _DT_BINDINGS_DMA_LOONGSON_LS2K_DMAMUX_H
> +#define _DT_BINDINGS_DMA_LOONGSON_LS2K_DMAMUX_H
> +
> +/* UART controllers */
> +#define LS2K0300_DMA_UART0		0
> +#define LS2K0300_DMA_UART1		1
> +#define LS2K0300_DMA_UART2		2
> +#define LS2K0300_DMA_UART3		3
> +#define LS2K0300_DMA_UART4		4
> +#define LS2K0300_DMA_UART5		5
> +#define LS2K0300_DMA_UART6		6
> +#define LS2K0300_DMA_UART7		7
> +#define LS2K0300_DMA_UART8		8
> +#define LS2K0300_DMA_UART9		9
> +
> +/* I2C controllers */
> +#define LS2K0300_DMA_I2C0		10
> +#define LS2K0300_DMA_I2C1		11
> +#define LS2K0300_DMA_I2C2		12
> +#define LS2K0300_DMA_I2C3		13
> +
> +/* SPI controllers (IO mode) */
> +#define LS2K0300_DMA_SPI2		14
> +#define LS2K0300_DMA_SPI3		15
> +
> +/* I2S controller */
> +#define LS2K0300_DMA_I2S		16
> +
> +/* ADC controller */
> +#define LS2K0300_DMA_ADC		17
> +
> +/* CAN-FD controllers */
> +#define LS2K0300_DMA_CAN0		18
> +#define LS2K0300_DMA_CAN1		19
> +#define LS2K0300_DMA_CAN2		20
> +#define LS2K0300_DMA_CAN3		21
> +
> +#endif /* _DT_BINDINGS_DMA_LOONGSON_LS2K_DMAMUX_H */
> --=20
> 2.52.0
>=20

--ME+wEtJIPtCBZWH0
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasj8TQAKCRB4tDGHoIJi
0hB6APwIHW2m5Gtbr7+I/gCy0JMndRo93Chpi4SzuPTRHL2psAEAnSt/1xEJlu81
oqDq8mDQ6ZEwXdr5gZu+xF5kgxWMtAc=
=Ay2H
-----END PGP SIGNATURE-----

--ME+wEtJIPtCBZWH0--
