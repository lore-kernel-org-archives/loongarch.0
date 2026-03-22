Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739A7281525;
	Sun, 22 Mar 2026 08:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774169586; cv=none; b=RNYX3Xr5yO21wp6M/pE53xdY54BplaCl9Kzwkr4bALMck6hvGIPvvwfflqJtoV8MvWxvSm4J0fOWuDhw3NlMY9eaLlRbugusVJ98OaVbLPtz1FHsIrLNZ6xUmTwBrYpLgJ9qP0HIwGN/kpcfFGBLNJHLJwsZfAwBXtDJCD3RWyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774169586; c=relaxed/simple;
	bh=Va0U52DqCKKaVRH0WESCP+nzlnU8n221flnex2Rx3pg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dmsqTj0BzA6GVUxG+4UtPXw+SOosX+zMR4LH163AFsvNI/9RhFJwxewkE0PlwV75UbpJFt6+f6iiaQMAOqVJIBoiDkFbd0+lT6/219hsqQ0kt3lZfJfmDIYpjYSc407kqwo08JgYtxFslpqk6CItbCJGPu71gBljpBT1VeGG04Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jDN16Wj+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jDN16Wj+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3A03C19424;
	Sun, 22 Mar 2026 08:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774169586;
	bh=Va0U52DqCKKaVRH0WESCP+nzlnU8n221flnex2Rx3pg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jDN16Wj+2W8NKjCk+fuquGOTFFAiBzJaBv/evcnEZDYzHKz/xmWgf9eT92YMk+5OR
	 Ob2hPkM/aPOowiTDhJiWiqn9Cc75fg6B+S9jvkPVKhVFdvQNLAA0d60yanJftyLYfY
	 k3/5UNZIzhogNYN5JxyWn3ddhBVTc2dYonB0jD7v+M8Hk1+5Y7kbajyi2hyKoGH5UP
	 E+NNKbOr9UI/31xFtqkEXHk8XVMZomoZga2wp+AHUFGjRP2SZsu2RLrBvYfiivVErX
	 F9dzngGPw6h3fJGklv4s3WnZY34HeAaOqEi7KuSJcXLAI1TEU095i2yh5wD8ozA9/1
	 khr3tYHYzZBeQ==
Message-ID: <c26f35ce-6d15-4f6d-8ac9-e52a0aa0b44f@kernel.org>
Date: Sun, 22 Mar 2026 09:53:01 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] loongarch: boot: dts: Add Loongson-2K0300 support
To: wjjsn <wjjsn@qq.com>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, chenhuacai@kernel.org
Cc: kernel@xen0n.name, devicetree@vger.kernel.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, wjjsn <2858482031@qq.com>
References: <20260322071316.1537953-1-wjjsn@qq.com>
 <tencent_6C692FE25219A76D5F73D250006D543B6709@qq.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJoF1BKBQkWlnSaAAoJEBuTQ307
 QWKbHukP/3t4tRp/bvDnxJfmNdNVn0gv9ep3L39IntPalBFwRKytqeQkzAju0whYWg+R/rwp
 +r2I1Fzwt7+PTjsnMFlh1AZxGDmP5MFkzVsMnfX1lGiXhYSOMP97XL6R1QSXxaWOpGNCDaUl
 ajorB0lJDcC0q3xAdwzRConxYVhlgmTrRiD8oLlSCD5baEAt5Zw17UTNDnDGmZQKR0fqLpWy
 786Lm5OScb7DjEgcA2PRm17st4UQ1kF0rQHokVaotxRM74PPDB8bCsunlghJl1DRK9s1aSuN
 hL1Pv9VD8b4dFNvCo7b4hfAANPU67W40AaaGZ3UAfmw+1MYyo4QuAZGKzaP2ukbdCD/DYnqi
 tJy88XqWtyb4UQWKNoQqGKzlYXdKsldYqrLHGoMvj1UN9XcRtXHST/IaLn72o7j7/h/Ac5EL
 8lSUVIG4TYn59NyxxAXa07Wi6zjVL1U11fTnFmE29ALYQEXKBI3KUO1A3p4sQWzU7uRmbuxn
 naUmm8RbpMcOfa9JjlXCLmQ5IP7Rr5tYZUCkZz08LIfF8UMXwH7OOEX87Y++EkAB+pzKZNNd
 hwoXulTAgjSy+OiaLtuCys9VdXLZ3Zy314azaCU3BoWgaMV0eAW/+gprWMXQM1lrlzvwlD/k
 whyy9wGf0AEPpLssLVt9VVxNjo6BIkt6d1pMg6mHsUEVzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmgXUF8FCRaWWyoACgkQG5NDfTtBYptO0w//dlXJs5/42hAXKsk+PDg3wyEFb4NpyA1v
 qmx7SfAzk9Hf6lWwU1O6AbqNMbh6PjEwadKUk1m04S7EjdQLsj/MBSgoQtCT3MDmWUUtHZd5
 RYIPnPq3WVB47GtuO6/u375tsxhtf7vt95QSYJwCB+ZUgo4T+FV4hquZ4AsRkbgavtIzQisg
 Dgv76tnEv3YHV8Jn9mi/Bu0FURF+5kpdMfgo1sq6RXNQ//TVf8yFgRtTUdXxW/qHjlYURrm2
 H4kutobVEIxiyu6m05q3e9eZB/TaMMNVORx+1kM3j7f0rwtEYUFzY1ygQfpcMDPl7pRYoJjB
 dSsm0ZuzDaCwaxg2t8hqQJBzJCezTOIkjHUsWAK+tEbU4Z4SnNpCyM3fBqsgYdJxjyC/tWVT
 AQ18NRLtPw7tK1rdcwCl0GFQHwSwk5pDpz1NH40e6lU+NcXSeiqkDDRkHlftKPV/dV+lQXiu
 jWt87ecuHlpL3uuQ0ZZNWqHgZoQLXoqC2ZV5KrtKWb/jyiFX/sxSrodALf0zf+tfHv0FZWT2
 zHjUqd0t4njD/UOsuIMOQn4Ig0SdivYPfZukb5cdasKJukG1NOpbW7yRNivaCnfZz6dTawXw
 XRIV/KDsHQiyVxKvN73bThKhONkcX2LWuD928tAR6XMM2G5ovxLe09vuOzzfTWQDsm++9UKF a/A=
In-Reply-To: <tencent_6C692FE25219A76D5F73D250006D543B6709@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/03/2026 08:13, wjjsn wrote:
> From: wjjsn <2858482031@qq.com>
> 
> Signed-off-by: wjjsn <2858482031@qq.com>

I don't understand what is happening here. You sent bunch of unthreaded
patches, empty commit msgs, some are being duplicated (seems at least?)...

> ---
>  arch/loongarch/boot/dts/Makefile              |  2 +-
>  .../boot/dts/loongson-2k0300-ref.dts          | 34 +++++++
>  arch/loongarch/boot/dts/loongson-2k0300.dtsi  | 94 +++++++++++++++++++
>  3 files changed, 129 insertions(+), 1 deletion(-)
>  create mode 100644 arch/loongarch/boot/dts/loongson-2k0300-ref.dts
>  create mode 100644 arch/loongarch/boot/dts/loongson-2k0300.dtsi
> 
> diff --git a/arch/loongarch/boot/dts/Makefile b/arch/loongarch/boot/dts/Makefile
> index 15d5e14fe418..4a096608cfad 100644
> --- a/arch/loongarch/boot/dts/Makefile
> +++ b/arch/loongarch/boot/dts/Makefile
> @@ -1,3 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  
> -dtb-y = loongson-2k0500-ref.dtb loongson-2k1000-ref.dtb loongson-2k2000-ref.dtb
> +dtb-y = loongson-2k0300-ref.dtb loongson-2k0500-ref.dtb loongson-2k1000-ref.dtb loongson-2k2000-ref.dtb
> diff --git a/arch/loongarch/boot/dts/loongson-2k0300-ref.dts b/arch/loongarch/boot/dts/loongson-2k0300-ref.dts
> new file mode 100644
> index 000000000000..f85d2caa94b0
> --- /dev/null
> +++ b/arch/loongarch/boot/dts/loongson-2k0300-ref.dts
> @@ -0,0 +1,34 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023 Loongson Technology Corporation Limited
> + */
> +
> +/dts-v1/;
> +
> +#include "loongson-2k0300.dtsi"
> +
> +/ {
> +	compatible = "loongson,ls2k0300-ref", "loongson,ls2k0300";
> +	model = "Loongson-2K0300 Reference Board";
> +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	memory@200000 {
> +		device_type = "memory";
> +		reg = <0x0 0x00200000 0x0 0x0ee00000>,
> +			  <0x0 0x90000000 0x0 0x10000000>;
> +	};
> +
> +};
> +
> +

This code has many white space issues. Please clean it up everywhere.

> +&uart0 {
> +	status = "okay";
> +};
> +

And here



Best regards,
Krzysztof
