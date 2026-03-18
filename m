Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3A3376494;
	Wed, 18 Mar 2026 14:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773843382; cv=none; b=BsfPQwm9YN+q+Ox2Y4wGKiQ5eQIthvUjLm/+pGlHZpA6dUPlqyNtrEtM/TRRcL7LybtBG4pkFWuy3XpEBOCD4ekP1n6AISqh+bMVbygsPyF4nkJmFKWw4ndKTenHfcedzLk+cHcPN7KkYzqOhidcoNHrAFJWalZC6dVwTCTKwFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773843382; c=relaxed/simple;
	bh=U+geDLQctOzjU6lpYMPmK82jS4J8nkFiv2wgeZj38Ek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jfbr/bQzq/kcUUKDgYlc+MXlRCKWM9FgIUoSY1i/dV6B4lGQSFagt/Yxz6SYcIHTW9XfBNW65uHcQSi8u7ahB9F2Y3sdVguKx94ToUs5k1hl70D9VeSsRwOGwMxpTwOQUh6V0Y7kps5CenC4U/kB8LwrfI6+BOjyuhsvEh6jvS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BQWzXqzf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BQWzXqzf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2DECC19421;
	Wed, 18 Mar 2026 14:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773843382;
	bh=U+geDLQctOzjU6lpYMPmK82jS4J8nkFiv2wgeZj38Ek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BQWzXqzfHbPJtflPDM7mtNdEmDMy6FXO9ifJZrK+7KoyOczb/euvMyik/yngFsA3H
	 POyiLnn5BRCtTpwat1gSTWYbJsIzd+8dPeMWKHqYoEnOIY7B6jzNqcfq55y3wch0ue
	 Cdf+iNoX4wqKmkjqOsWJdiPDDDUvID4lse5/53BId11/QdtwVg1662gxvrYiW6mHBq
	 deQR887EVev1FfyCTN2usy6SpZATevMxOUPEPlZpZAg+ubP+iNtvbo/TCgVeR9TuxR
	 JQxS6JOqFymNu/YQudXC2EZ2TRxak41Mre87y2JShHBGYMhRoFZIaQqWjYnn68tvKP
	 lWGAS1mcQbnPA==
Date: Wed, 18 Mar 2026 14:16:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 2/4] ASoC: loongson: Combined regmap definitions
Message-ID: <f68854fb-bb50-4975-b6b1-708aac149993@sirena.org.uk>
References: <cover.1773821115.git.zhoubinbin@loongson.cn>
 <f6768a2027f788697ed9f7bb161c8564261f02bb.1773821115.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="alM+PLk1P/8XtCCf"
Content-Disposition: inline
In-Reply-To: <f6768a2027f788697ed9f7bb161c8564261f02bb.1773821115.git.zhoubinbin@loongson.cn>
X-Cookie: The coast was clear.


--alM+PLk1P/8XtCCf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 18, 2026 at 05:16:36PM +0800, Binbin Zhou wrote:

> +static bool loongson_i2s_volatile_reg(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case LS_I2S_CFG:
> +	case LS_I2S_CTRL:
> +	case LS_I2S_RX_DATA:
> +	case LS_I2S_TX_DATA:
> +	case LS_I2S_CFG1:
> +		return true;
> +	default:
> +		return false;
> +	};
> +}

This is the same as what was in the PCI driver but...

> --- a/sound/soc/loongson/loongson_i2s_plat.c
> +++ b/sound/soc/loongson/loongson_i2s_plat.c

> -static const struct regmap_config loongson_i2s_regmap_config = {
> -	.reg_bits = 32,
> -	.reg_stride = 4,
> -	.val_bits = 32,
> -	.max_register = 0x14,
> -	.cache_type = REGCACHE_FLAT,
> -};

...the platform driver marked all the registers as cacheable.  With
registers like LS_I2S_CTRL marked as volatile this means we'll stop
caching the configuration done by set_fmt(), and currently the driver
uses a regcache sync to restore from suspend so things might get
confused.

If you're just marking things volatile to stop the warnings and the zero
defaults are actually fine you can also supply explicit zero defaults
for all the registers, or switch to a sparse cache type if the
performance and allocation requirements you have are OK with that.

I think this means there was an issue that got missed in the PCI
driver..

--alM+PLk1P/8XtCCf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm6s7AACgkQJNaLcl1U
h9AfiAf+IZUNY2T/y43Qsi2c49Q/84v3I4kxZuHSn2j4UCiDIh6lTsZHeBTBxj1y
JQ6c46kyq77LOLbY856WW03u3D0IYkWU5f1geU91obKLHCOBmWGvafCkRNDY6ViQ
SdjTAh2PIVfpCfUticlzsqP20ANHVtfPT3vzO6IEkJ0JLRL9NsIwMPXlQ2XjWL6/
4ViYUPBjoHN8rA9FHbQGP/LLP/xM2Wxt0stduLAd7NrZkY+Tg9AQAx9lnltu0q0F
O8o8tUU21XMSqkVb6s9F66mI014ovrSBNq0WSnFjiqv6cm/gu3ChyMwCmEkgAZOZ
xVbj1JEMQICJaqICTGmkHjQbnyR7JQ==
=Fgu1
-----END PGP SIGNATURE-----

--alM+PLk1P/8XtCCf--
