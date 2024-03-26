Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC8113C69D;
	Tue, 26 Mar 2024 18:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711479382; cv=none; b=n0tSDlNb5fRuDOsc+Dc/Eam/TmrafLhaYq2yU2Rb6lPTO8+PlhOk0CPTsRJl0O9yBEgpgrtM1RwDREHUxqIHQtDYoGppt2podo47ImQenJOrjPEqlXR7uJQa5LqYOFUEhpDDteC9maDcMSYwtBW5QUQYhVyAu06ORWEmO6dimtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711479382; c=relaxed/simple;
	bh=HeSCOyWRkgF4bDb2OVsj+wKkCFrlnU2oRKaZ9XqzH3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R7EA4BUXSRDWGYKbqIEuyVgeOzxKJKOtvnIK+hjeS8yTTXJgCuaEJJoP+Iy1vMd6rQNBtPAnD+HoQ9hwwMAZtXsQAS/D1s2pKlKdqt1LWWNwhbV1n2mzDhRHQ1u7Ipu1zxXHxeDvpsgdjpsWM9tA6YcMiZgVm2qxj+9BsHG9OOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nyEAN5Jy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nyEAN5Jy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48BF5C43390;
	Tue, 26 Mar 2024 18:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711479382;
	bh=HeSCOyWRkgF4bDb2OVsj+wKkCFrlnU2oRKaZ9XqzH3k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nyEAN5JyF/m1Qv57aHSYEhlpYY2sILPOwySbnLRpB3T2H7ZkI/4Edsbn51vZGt9Qm
	 N8SN1oZWC/kIanLsthnJGbKOCLAI47q8lJvaAY9w/97ydQbuR2HHjFvSyWrvxOBdwX
	 VS7QLI5qW9Y2fFS70gtYYunGmYg7BZZpaqKwrZTRxWivmtmZEoosbEq/rHfVwcNJsW
	 /u6Ril5qbCOrtX2gtS1UlykL0AD2ol9NVR8+enkCIuOPnmT7QnHRf6aFaixKboeJep
	 9gyNvhPlP1nxulwWqssFzbC33Y3BvL79IdS0Mfkb5+UnxQut0mdiAZ2EhI3AE9GrHO
	 ETtgfSEBR65rw==
Date: Tue, 26 Mar 2024 18:56:17 +0000
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
Subject: Re: [PATCH v1 3/8] dt-bindings: clock: loongson2: add
 Loongson-2K0500 compatible
Message-ID: <20240326-dimmer-undrafted-9cabaaec1abc@spud>
References: <cover.1710926402.git.zhoubinbin@loongson.cn>
 <7c7728451fdea3977c492f3daee260590af78d16.1710926402.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eFlUKDOKmoTO6ljZ"
Content-Disposition: inline
In-Reply-To: <7c7728451fdea3977c492f3daee260590af78d16.1710926402.git.zhoubinbin@loongson.cn>


--eFlUKDOKmoTO6ljZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 26, 2024 at 05:01:02PM +0800, Binbin Zhou wrote:
> Add the devicetree compatible for Loongson-2K0500 clocks.
>=20
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.ya=
ml b/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml
> index 63a59015987e..83baee40e200 100644
> --- a/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml
> +++ b/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml
> @@ -16,7 +16,8 @@ description: |
>  properties:
>    compatible:
>      enum:
> -      - loongson,ls2k-clk
> +      - loongson,ls2k0500-clk
> +      - loongson,ls2k-clk  # This is for Loongson-2K1000

Ah yes, the generic "ls2k" compatibles strike again :)
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--eFlUKDOKmoTO6ljZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZgMaUQAKCRB4tDGHoIJi
0iQCAQDlCmyyuYtsHRjUL1psOLIvbbdZiQAV5e5mdGofHGaP+QEAqBFXxrR+h0QL
QTrlkp/FPyBAkCZoDRYS23vA/77EHQU=
=f9bv
-----END PGP SIGNATURE-----

--eFlUKDOKmoTO6ljZ--
