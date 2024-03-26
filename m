Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDEB3DABF5;
	Tue, 26 Mar 2024 18:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711479273; cv=none; b=Ykeye5Zc0riw+HK/8XyYJuxB7SRGOUSIwysFyD7RN5gH8IPMxRNYIWirCQROns1Ar1R5sQ5pmPEB1RLBQEVy6pNQ2taFRk+k1TW1XOPqn56slMjplgSOIrdfZ+up+z46d8s4jqlsp4YGdUZlKo76ilPxFqjfyIi1APWYJM9dfgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711479273; c=relaxed/simple;
	bh=tGfgiG77z8IX9FLQTwqR6BIYgNfoRKojvZtLLr0/uQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FBkY5dsUR9+PFzwvj6+itPxf4EzpXNHV65BI5LRTWGb8cq61s9QI+QTLl+ZU0R8NbCxpja2wBnRjEomu1DR9Z74u5XLO3/Kbf7ArYH8w0pr3R7v1pWmWsJGFZyMGe++9I7XZFv73iEZsFuOzvyeCjN9rU4BDAdRb8U0rp2aQVBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GYA3NHSW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GYA3NHSW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D06F6C433F1;
	Tue, 26 Mar 2024 18:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711479272;
	bh=tGfgiG77z8IX9FLQTwqR6BIYgNfoRKojvZtLLr0/uQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GYA3NHSW8Mk9Y02rQc2/IkqCghEehWti1i0XdhjdPZKEur4T/b3U4Ldzde3Wbytd8
	 h+F5dYMQEh+uMcQDlLJlnK6+wWUlI95As6mUrhQfO+TdNxkFfeKLUh6Um82u4WT8Pw
	 I1rmcMj/nff3dP4JMVudG/mvUuDHYU7Y9l32VtYiU/QO/Zhrw3lTdSCN290BQ/d3gw
	 M+4D4USuzyBMTvouGPY8uRQMJQR3XlqJH0D+qsFVvC/U3qAIQDTgIQvOzmHEB3RmQX
	 i+juyzOFNkFIAFLxZRzp0XmF8Ur6TOcfOP271P65srKK4mb9WMYa4IOhfMTjtssfEk
	 L4mqtfW+IIdBQ==
Date: Tue, 26 Mar 2024 18:54:27 +0000
From: Conor Dooley <conor@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev
Subject: Re: [PATCH v1 1/8] dt-bindings: clock: add Loongson-2K expand clock
 index
Message-ID: <20240326-shifter-zeppelin-1d8616dc82f9@spud>
References: <cover.1710926402.git.zhoubinbin@loongson.cn>
 <0cfd237c2c7c1e4f89b6e5f7af0a64d306de1c8f.1710926402.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bRdTAQrFxCUTITyF"
Content-Disposition: inline
In-Reply-To: <0cfd237c2c7c1e4f89b6e5f7af0a64d306de1c8f.1710926402.git.zhoubinbin@loongson.cn>


--bRdTAQrFxCUTITyF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 26, 2024 at 05:01:00PM +0800, Binbin Zhou wrote:

> -#define LOONGSON2_CLK_END				18


> +#define LOONGSON2_CLK_END	35

Please just delete this. If you can change it, it is not a binding.
Just define it in the driver if it is needed there.

Thanks,
Conor.

--bRdTAQrFxCUTITyF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZgMZ4wAKCRB4tDGHoIJi
0ueCAP9EmF5JTO76DGRqT1zQ5QuMi/98/VJ8LUy1k0LvczdHRQD/cGkdYGmfhbIG
qaLEAKksA3Zfz4QnPkwAq4NFySpCjgQ=
=0+yR
-----END PGP SIGNATURE-----

--bRdTAQrFxCUTITyF--
