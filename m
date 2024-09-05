Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263C61DFD8;
	Thu,  5 Sep 2024 14:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725546499; cv=none; b=jlIdgogtGVAq5vlyXChN41jOgqcRM8oF4dkYXweMulW7avwL+Hr++vb7uBON1wrYbKF6W8zfzwBti36+8FXS8lKZdYtcmN3kU69gnK+ERNTTCGc5sJ6XytkxJ6tKQoqyMl9z/FzNqtW+MO6f0KIH3IKzBVbssJHXAKvlaGKQIkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725546499; c=relaxed/simple;
	bh=jmpTA9CV4UGTVFIuI2bK6R46aJZEAijyOaM3bYcYd9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qhYIMQCxhOoRooKnMMOdO7jFfkFbUm7bogtAdl2XyKL6BjTkE/Csjb6Y7FNRgM1CrVWqhCnEpWjSjUi6fJG591HM8c/jDW+edisTMrqhbIKvOxmGwDlCMuK+cMPFaBYkLDgQoV6JzxXIv7a3d8+89n6Kl6D0Zsz22iCEDTcb3Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X+f2y3Yv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X+f2y3Yv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDFAFC4CEC5;
	Thu,  5 Sep 2024 14:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725546498;
	bh=jmpTA9CV4UGTVFIuI2bK6R46aJZEAijyOaM3bYcYd9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X+f2y3YvknqA4KhuxIVOSxOqi0O3i7f/quNW1tyHXKi9hi3SxoM22uER1+QscGM77
	 jkX2idPRqJChH5Fz3ORExm3/LTuG3ZzR7ie6doiUjoaIwFY0w15ABobKXL4Tw1tgNP
	 Hrr/qFeEktuLIZOA9YfwLTzwtbXdckPHzvBQux86YM+weryqod8YSxvzol/e47X7KG
	 nHAGZ82GMSoaWZctZPn8FjhC8ou39hoN5NRf61Sa9DVWGgKOm2MMhMuDs5o1k7KkKz
	 SfLx5RyrxCtb4OTui+TVbSvzItpc99ad6DFPkG41gIkFsvPWM9yYTzkFnNN0S80MHw
	 jD4iIU7zDkXqQ==
Date: Thu, 5 Sep 2024 15:28:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Huacai Chen <chenhuacai@kernel.org>, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev
Subject: Re: [PATCH v1 04/10] ASoC: codecs: Add uda1342 codec driver
Message-ID: <eaeb0113-785c-4a41-b093-b352122b20ca@sirena.org.uk>
References: <cover.1725518229.git.zhoubinbin@loongson.cn>
 <3fd0c3a04f5f3bd293168732db457f6854db706e.1725518229.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CWe5TonQavQeUXc/"
Content-Disposition: inline
In-Reply-To: <3fd0c3a04f5f3bd293168732db457f6854db706e.1725518229.git.zhoubinbin@loongson.cn>
X-Cookie: The horror... the horror!


--CWe5TonQavQeUXc/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 05, 2024 at 03:02:53PM +0800, Binbin Zhou wrote:

> The UDA1342 is an NXP audio codec, support 2x Stereo audio ADC (4x PGA
> mic inputs), stereo audio DAC, with basic audio processing.

This looks basically fine overall, there's some issues below but they're
mostly fairly small and stylistic rather than anything major.

> --- /dev/null
> +++ b/sound/soc/codecs/uda1342.c
> @@ -0,0 +1,397 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * uda1342.c  --  UDA1342 ALSA SoC Codec driver

Please keep the entire comment a C++ one so things look more
intentional.

> +static int uda1342_mute(struct snd_soc_dai *dai, int mute, int direction)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct uda1342_priv *uda1342 = snd_soc_component_get_drvdata(component);
> +	unsigned int mask;
> +	unsigned int val = 0;
> +
> +	dev_info(&uda1342->i2c->dev, "mute: %d\n", mute);

This is far too noisy to be logged and will DoS the logs, please just
remove it.

> +
> +	/* Master mute */
> +	mask = BIT(5);
> +	val = mute ? mask : 0;

Please use normal conditional statements to improve legibility.

> +static void uda1342_shutdown(struct snd_pcm_substream *substream,
> +			     struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct uda1342_priv *uda1342 = snd_soc_component_get_drvdata(component);
> +
> +	if (uda1342->master_substream == substream)
> +		uda1342->master_substream = uda1342->slave_substream;

Please avoid using master/slave terminology, we've tended to go for
provider/consumer in ASoC.

> +static int uda1342_hw_params(struct snd_pcm_substream *substream,
> +			     struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct uda1342_priv *uda1342 = snd_soc_component_get_drvdata(component);
> +	struct device *dev = &uda1342->i2c->dev;
> +	unsigned int hw_params = 0;
> +
> +	if (substream == uda1342->slave_substream) {
> +		dev_info(dev, "ignoring hw_params for slave substream\n");
> +		return 0;
> +	}

This is also too noisy, it should be _dbg() at most.

> +	/* codec supports only full slave mode */
> +	if ((fmt & SND_SOC_DAIFMT_MASTER_MASK) != SND_SOC_DAIFMT_CBS_CFS) {
> +		dev_err(dev, "unsupported slave mode.\n");
> +		return -EINVAL;
> +	}

Use the more modern _CBC_CFC.

> +	/*
> +	 * We can't setup DAI format here as it depends on the word bit num,
> +	 * so let's just store the value for later
> +	 */
> +	uda1342->dai_fmt = fmt;

No need to even store it if only one value is supported.

> +static int uda1342_set_bias_level(struct snd_soc_component *component,
> +				  enum snd_soc_bias_level level)
> +{
> +	switch (level) {
> +	case SND_SOC_BIAS_ON:
> +		break;
> +	case SND_SOC_BIAS_PREPARE:
> +		break;
> +	case SND_SOC_BIAS_STANDBY:
> +		break;
> +	case SND_SOC_BIAS_OFF:
> +		break;
> +	}
> +
> +	return 0;
> +}

This does nothing so it can just be removed.

> +static const struct soc_enum uda1342_mixer_enum[] = {
> +	SOC_ENUM_SINGLE(0x10, 3, 0x04, uda1342_deemph),
> +	SOC_ENUM_SINGLE(0x10, 0, 0x04, uda1342_mixmode),
> +};

This doesn't seem to be referenced anywhere so can be removed, or should
be added to the controls or DAPM?

> +static int uda1342_soc_probe(struct snd_soc_component *component)
> +{
> +	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
> +
> +	snd_soc_add_component_controls(component, uda1342_snd_controls,
> +				       ARRAY_SIZE(uda1342_snd_controls));
> +	snd_soc_dapm_new_controls(dapm, uda1342_dapm_widgets,
> +				  ARRAY_SIZE(uda1342_dapm_widgets));
> +	snd_soc_dapm_add_routes(dapm, uda1342_dapm_routes,
> +				ARRAY_SIZE(uda1342_dapm_routes));

You can point to these arrays from the component struct and have the
core register them for you.

> +static const struct regmap_config uda1342_regmap = {
> +	.reg_bits = 8,
> +	.val_bits = 16,
> +	.max_register = 0x21,
> +	.reg_defaults = uda1342_reg_defaults,
> +	.num_reg_defaults = ARRAY_SIZE(uda1342_reg_defaults),
> +	.cache_type = REGCACHE_RBTREE,

In general _MAPLE is preferred for new things unless you have a specific
reason to use _RBTREE, it uses a more modern data structure and should
generally do better.

--CWe5TonQavQeUXc/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbZv/wACgkQJNaLcl1U
h9AWpQf+OvU5BHMDujrsStEk2jVQC9boM8kZySnVRUVicG2vV2zf1wzqShttlQYH
+GAmQyCaoKCDwJw3Y1wXWOckeej8HrB1qGHaaPsWxpeY/wN/qrXFZz5FYrjHolwO
OYJUxyxUhlbLDDL9FFbptj+ZGLHDv3L8lAyELr5bDIUoeoogmwjGEXKuBgk83LaF
6JXLlsGnChDF1kK7vpp92MdRTd7GyaYyhutGYhrAVhyYeviMqX4eEuAwhtUcxa1p
82vGWKwR1U3e9+1zO0T21p6nYyj0WSKCQWeBEz8151KBDtlDFveGAenaNNFMtNCo
EufV4T8/oDAK432FlAyMwOAaZImg3g==
=JqnU
-----END PGP SIGNATURE-----

--CWe5TonQavQeUXc/--
