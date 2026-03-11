Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61EA3E121E;
	Wed, 11 Mar 2026 16:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773245725; cv=none; b=RoG7kCVPn2DRIGNMZxsainqKAmdO74Ys8wlibWhXqHKxVH/dUzpfJMwkIc1J8v/MDKTBlOWvaJ985IYwZ3jpLeW5aQsUdIo/gMngxv2GfjZzAARpJnoDDAMPLgIic4xsDFh8TGDJm0i50pzGWe5sQSgLsJxz+5l0FWpfaxbEb5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773245725; c=relaxed/simple;
	bh=peLGTHMQedas99d563bn3rT8GdsZdOfBPrz9+9nCb6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k+L40L2umZbv+aLgUwRe10VH48FXsyMbWR4zxKLcnufCK3PmUns8BQWpgXat1nkaa4ZB7eDrmEFfTPU94jeWBev/jfR7JcspcpfdWKT3PH9DqS+eLKHDG7rWmmotKBsqCYvfLJiIMFiZKoR+vWKuJxiBcSOxApv6TWemyKvBlbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gLslAale; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gLslAale"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3FFEC4CEF7;
	Wed, 11 Mar 2026 16:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773245724;
	bh=peLGTHMQedas99d563bn3rT8GdsZdOfBPrz9+9nCb6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gLslAale4vLmG470jQxB1+dfPXaBtKKNOG+Zme6vowFkywCr0u+t/r2G2diuqJdq9
	 XMOIU2R+7Xt1g7KGaKmbzaOVyGYyKn/G6kl1Q5s306lRYNZLbX0o43In64Ne31m9cI
	 vTOAeHZ2DZip8xUPhud9S2siJM5KHh/Er0qrevzANaPWRknSM/6qNdeuAcIK5EFE1Q
	 MAkAgZmzF0ihghmS48ZcmfTfIMJbZ0sqsquHQHSRIIMmvDeshbBoMlAVfa0kqaLrHp
	 obkRUBiQTmXNE8T38CfzYNnYtUHKhA3IvKp0nXet1WjCHWHymuuuCPeVqq058NquIX
	 6wec8qWJzax2g==
Date: Wed, 11 Mar 2026 16:15:19 +0000
From: Mark Brown <broonie@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 6/6] ASoC: loongson: Add Loongson-2k0300 I2S controller
 support
Message-ID: <dea0bc84-c039-449c-8a6b-652062df75aa@sirena.org.uk>
References: <cover.1773107475.git.zhoubinbin@loongson.cn>
 <cb7062433863aea0d66959fc0f4aee791cab6402.1773107475.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s2U7mnTw8PGiDvVS"
Content-Disposition: inline
In-Reply-To: <cb7062433863aea0d66959fc0f4aee791cab6402.1773107475.git.zhoubinbin@loongson.cn>
X-Cookie: When all else fails, EAT!!!


--s2U7mnTw8PGiDvVS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 11, 2026 at 02:37:48PM +0800, Binbin Zhou wrote:

> Due to a hardware design flaw, PCM_START requires an explicit reset.
> It has been tested and does not affect other machines.

Are you sure?  It just does a reset whenever we start a stream which
means if one direction is already running the controller will get reset
underneath it and disrupt things if the other is started.  If this IP
requires it I guess that's just unfortunate but presumably existing
devices don't require the reset and will be regressed.

> +++ b/sound/soc/loongson/loongson_card.c
> @@ -61,7 +61,7 @@ static struct snd_soc_dai_link loongson_dai_links[] = {
>  	{
>  		.name = "Loongson Audio Port",
>  		.stream_name = "Loongson Audio",
> -		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_IB_NF
> +		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
>  			| SND_SOC_DAIFMT_CBC_CFC,
>  		SND_SOC_DAILINK_REG(analog),
>  		.ops = &loongson_ops,

This changes the clock inversion for everything - should this be
parameterised as that seems to be a fairly generic card?

--s2U7mnTw8PGiDvVS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmxlRYACgkQJNaLcl1U
h9CbzQf8Cg25VuvcG1peyTjrx3lXqm0InC7MMkeb6Cktsz9SzZlDZnkZr4o908CL
XJh4iRSmkqwHnFWbS6Gld+RaoSCZlUfpTU5VspzlhDn1cCsQ+RKaXieq+ZARUnk6
Byyqu2bPNMVbdgxW9SdI/hQ9wg1yE1GJovLTmEQV62T00MZBTo32oyrQt/Q07nS5
kbIWTIR+aHMB4D+RiES0tgiOmfFGHym1FjpiFtu1oMc7WAoSqav052O218W3KaKB
Gqixk+000vMekmEGtHfrfveAZgym7lYNCR87T1ATe8IS3vQeo6cuchzHCAvMxz/H
kH2nbX63f+2WmBq84hWnPO+MJ8tY3g==
=zKND
-----END PGP SIGNATURE-----

--s2U7mnTw8PGiDvVS--
