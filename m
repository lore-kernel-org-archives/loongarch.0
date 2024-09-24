Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39F180C13;
	Tue, 24 Sep 2024 09:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727168982; cv=none; b=GurhEbONA/8CLJc1JY9OYlQSByGjASkdNDpgF64jWBOKI173qwPEsZH0jpZaozjY2yKRaOjDLuFlA28l4ZCWn2RgX1rsJmQ1yW/aR5RBEkp1yitVLAy5c4rUzXcRwI+o5jiESztCDZQKi+D74oaEaahrPTmZFWmn3GWsZ+oOujc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727168982; c=relaxed/simple;
	bh=Of3TLifmfEX3z9oAoHvM7xFqDqAJPLHDmoeETxQhNhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n4+z/dUagJdY35pAJZ2BtxH6JLtJ6lfLam5dCSEIe03NS2YJ+cNEOSSukvFUoFRD8n+1oynnyV1aMV2D+6PJsE8q/B7/mlT2EHXYVsD4H6x7dLV6ufUMOZapC7AMFF/xHqRYoHzEEmelGf5H+AUJGGZGsSEzI8lWD7R6w0PO7ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UTSJDqGq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UTSJDqGq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3274AC4CEC5;
	Tue, 24 Sep 2024 09:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727168982;
	bh=Of3TLifmfEX3z9oAoHvM7xFqDqAJPLHDmoeETxQhNhA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UTSJDqGqV4GEcLfuM4w46JqSBejhv2Nb8WZHUH+jkgxEo2u0P3CCkPZ5aUI4i56wX
	 rJSzkEvXXVk0wTs3tN1A144aSzr26G9QCXcYwpFKVZ990kZT4M5fk8YhCxf3U8sLss
	 6PUCxLGUeoA1KlwQSB2y9ZG6JPb0AyBGEFVdlrRctIf5+oyhS0FRVfnULaBLBZPjpo
	 FHuq7VwcYrJGV6H41UJJryehoO3DmbfEEVtQUkY0F+2EPmEHX/OLWGr5HdxOk6c+ZE
	 oQyHRs8dfb0owEFP/xPkq8G2+64EUrjFzNOU5wM22IRGFkBI08kFdrRLt26UX8Dhi7
	 OjQuiHHko3FTQ==
Date: Tue, 24 Sep 2024 11:09:38 +0200
From: Mark Brown <broonie@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Shuming Fan <shumingf@realtek.com>
Subject: Re: [PATCH v2 4/9] ASoC: codecs: Add uda1342 codec driver
Message-ID: <ZvKB0lklaxP1IEtT@finisterre.sirena.org.uk>
References: <cover.1727056789.git.zhoubinbin@loongson.cn>
 <c69743ea929fed210128de765967ea045ebd6b27.1727056789.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l162EgbDltgxmdqs"
Content-Disposition: inline
In-Reply-To: <c69743ea929fed210128de765967ea045ebd6b27.1727056789.git.zhoubinbin@loongson.cn>
X-Cookie: Editing is a rewording activity.


--l162EgbDltgxmdqs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 24, 2024 at 03:00:31PM +0800, Binbin Zhou wrote:

> @@ -0,0 +1,355 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * uda1342.c  --  UDA1342 ALSA SoC Codec driver
> + *
> + * Modifications by Christian Pellegrin <chripell@evolware.org>

Please make the entire comment a C++ comment so things look more
intentional.

> +static int uda1342_hw_params(struct snd_pcm_substream *substream,
> +			     struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct uda1342_priv *uda1342 = snd_soc_component_get_drvdata(component);
> +	struct device *dev = &uda1342->i2c->dev;
> +	unsigned int hw_params = 0;
> +
> +	if (substream == uda1342->consumer_substream) {
> +		dev_info(dev, "ignoring hw_params for consumer substream\n");
> +		return 0;
> +	}

This is going to spam the logs loudly, dev_dbg() at most.  For modern
ALSA it's probably good to check that the configuration is the same,
indeed it'd be good to set constraints for the configuration of the
parent stream.  We used to have to care about OSS which would
transiently write invalid configurations but that was well over 10 years
ago so probably isn't relevant here.

--l162EgbDltgxmdqs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbygdEACgkQJNaLcl1U
h9DLZQf/RcDLcHgVzOfjs3Cu8np9ipBkoMzqn+74rnewI8WuDcO2VPsfLWw4bttP
QBSxxbEbjHEEr+ClFSL8knZpFRlsLB4MheOe6v6kOCLkiiILEZGXcDxQrM6KTzcd
yyvsnFHrlBSi14Rw8Fhz0g6NlK0rlrur39dSv+4B8VfhWomJ+KOIwDEPE3nwh57S
0uCzophxgxh3ZzA5LIskuoTUwQZuFd5hcSaLVPH0ke0Or+dlD/mG0gYQlob/vnDp
JCstpLMSZnude6zivNJ0MunWNV2RtKF5OcZ7y3OXsKoTIG9aIS4SKn6X8L+Lvwo3
9RWZiX/R+qHDZmwaz4A+anAHE04DSA==
=AecI
-----END PGP SIGNATURE-----

--l162EgbDltgxmdqs--
