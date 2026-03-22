Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E189221FBD;
	Sun, 22 Mar 2026 08:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774169737; cv=none; b=sTCEsdpKebpn+qTSoCLS9kYRHYIYdTlBsoOEDq60bwiIBhj/FKRSJoPEuopbJZROM/PhfbSJRvdwOJZxyxxgVX+9X4fDWtGva88UkfiyNtohhZzcAaPSgnBKePAa+gfENEAaLFmASIrTx0GMtcK/yLBd+uUJu9cMQkvDlmDp3zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774169737; c=relaxed/simple;
	bh=NQfFwxBc3n5Lmt/kvNF54o/UqadTepG6z61Dd0RjFTs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aKk05U9NaxK5Dg4PmQINkIWZh14sCJ/L4K4YvUMnjDZKb62VjJwjNZSyE0KGOhD+xXN9xNv/8t0ijmaTb57Qy6Vi8VhlpjIGzjpzPWKNoNfIem1sySlVIm+jh5JAUfnCt2dH4fo2gXYL7sNnXSbG07MoIpGXgK7mNnQDRU/oDTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WvjSe20c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WvjSe20c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 245BFC19424;
	Sun, 22 Mar 2026 08:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774169737;
	bh=NQfFwxBc3n5Lmt/kvNF54o/UqadTepG6z61Dd0RjFTs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WvjSe20cA/0Su7tSkF3kIbPRASw2txORaTfrK03PMrx6A6TYxeWFsERqXasv3rmfL
	 ZjlYRUyX+0oDYk+o/dlAEm80GxaCJNSNy53YXXoCDSGrJ6sqi7uQT7Cz4SX8SDUxUC
	 lHX7NkQ4W4L2eHECUkflkDY/QgGHXuS3ekcwipdTIHbLu+z1Q/KR2Z7zHI8kYYqWxP
	 kC0OktjXkmWsEqIEYukBP7R+etPr+IZXHvryGvntP0Xo+M0QVVvfny7UPG4/RO/jgN
	 AuEgSWwqVzTq5XvNhGPICkV4LWZkgtEQsiGozOT9l/vujS8ICsy9k8v8KsEv4dbGfp
	 vES7WTPfxO5PA==
Message-ID: <8cb8ec5d-770e-477d-af5b-efaef8a3973a@kernel.org>
Date: Sun, 22 Mar 2026 09:55:32 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: loongson2: add support for ls2k1000 compatible
To: wjjsn <wjjsn@qq.com>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, chenhuacai@kernel.org, zhuyinbo@loongson.cn,
 mturquette@baylibre.com, sboyd@kernel.org
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, kernel@xen0n.name, devicetree@vger.kernel.org,
 wjjsn <2858482031@qq.com>
References: <20260322080327.1606799-1-wjjsn@qq.com>
 <tencent_19D06CEA85762ACE74DF6B745A2EE0BCAA06@qq.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <tencent_19D06CEA85762ACE74DF6B745A2EE0BCAA06@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/03/2026 09:03, wjjsn wrote:
> From: wjjsn <2858482031@qq.com>
> 
> Add driver support for the "loongson,ls2k1000-clk" compatible
> and update the Loongson-2K1000 DTS to use it while retaining
> "loongson,ls2k-clk" as a fallback.
> 
> Signed-off-by: wjjsn <wjjsn@qq.com>
> ---
>  arch/loongarch/boot/dts/loongson-2k1000.dtsi | 2 +-

This is not driver.

>  drivers/clk/clk-loongson2.c                  | 1 +

Why are you combining these? Please read submitting patches in DT and
maintainer-soc profile to understand. Then read submitting patches and
split your code in logical chunks.

>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/loongarch/boot/dts/loongson-2k1000.dtsi b/arch/loongarch/boot/dts/loongson-2k1000.dtsi
> index ab6a55937e9e..61cdae438cb0 100644
> --- a/arch/loongarch/boot/dts/loongson-2k1000.dtsi
> +++ b/arch/loongarch/boot/dts/loongson-2k1000.dtsi
> @@ -156,7 +156,7 @@ pctrl: pinctrl@1fe00420 {
>  		};
>  
>  		clk: clock-controller@1fe00480 {
> -			compatible = "loongson,ls2k-clk";
> +			compatible = "loongson,ls2k1000-clk", "loongson,ls2k-clk";

You never tested your code. You have warning here.

>  			reg = <0x0 0x1fe00480 0x0 0x58>;
>  			#clock-cells = <1>;
>  			clocks = <&ref_100m>;
> diff --git a/drivers/clk/clk-loongson2.c b/drivers/clk/clk-loongson2.c
> index 9c4c6c99db3e..48d00578b26f 100644
> --- a/drivers/clk/clk-loongson2.c
> +++ b/drivers/clk/clk-loongson2.c
> @@ -441,6 +441,7 @@ static const struct of_device_id loongson2_clk_match_table[] = {
>  	{ .compatible = "loongson,ls2k0300-clk", .data = &ls2k0300_clks },
>  	{ .compatible = "loongson,ls2k0500-clk", .data = &ls2k0500_clks },
>  	{ .compatible = "loongson,ls2k-clk", .data = &ls2k1000_clks },
> +	{ .compatible = "loongson,ls2k1000-clk", .data = &ls2k1000_clks },

What is the point of this change? It's redundant.

>  	{ .compatible = "loongson,ls2k2000-clk", .data = &ls2k2000_clks },
>  	{ }
>  };


Best regards,
Krzysztof
