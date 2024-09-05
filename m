Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A5519DF68;
	Thu,  5 Sep 2024 14:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725545143; cv=none; b=B+qw5pTpXCpsKf/qMnL4SidRxFlMHel5rDNbg8N2XcYyZNDiAaATgm6PfsTGrjyy79qxgmCWsdxtxhYF7Zl1Hwi5vo3wC84o16Vz7nJ72EAhJl8YlEyOn4qnacvtDb70eRAayumULrpdh+kRCluYD1slOfZ5Vj/3JzTODxglyiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725545143; c=relaxed/simple;
	bh=0Paimslxn1yATioZQ83kmsOB3LEleAVxkHfs+MspNkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YmVddCLtB/OXrSTxfsRDWc2yipBZFbpfIak1hdb2mhrqvnwsRfUx4D4CCVidFQI7NwAyoGMj6A3lq9MW/z0Db2pTK/ImKkD7N1agW/YGvLRSkjLlW5BaoBSEvEueBL+3+NBa/D4rQ+bKZDF5OCFIJjVvkkSna7PnRAwSCxUuJSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HDexJRFt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HDexJRFt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16CE5C4CEC5;
	Thu,  5 Sep 2024 14:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725545142;
	bh=0Paimslxn1yATioZQ83kmsOB3LEleAVxkHfs+MspNkk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HDexJRFtK+lFiPyku3P+8nWS30sNzCaktc7n8MK0jhAFl/3xP1+KJh/R/oacpUbpi
	 1+pc0qG6A/FZfFMJxv7BGfbggv/97b6mQaGdVo49D7+s+YAlwesqymbBvbtoA6Vh/X
	 3QJ05HyoWQ8mrDTjb9xm5+zA8Zg5GxURwnuWJ7T8JZus1Y1ILztKBRoUv15EUY8JtT
	 Ili+bTfkQXK/nsSmd4t43LK1VkvA3bQczRHaj3VbNjdGwa0OSEnc1HohNG18BxlzSd
	 2EFj7rl1O9qr5UGICJNYrcHDqn1xt3lamfeegEg1Y2CT2UPek5sj635TBxhYran0IN
	 rEFax9vvMolWg==
Date: Thu, 5 Sep 2024 15:05:35 +0100
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
Subject: Re: [PATCH v1 02/10] ASoC: codecs: Add support for ES8323
Message-ID: <5a7357f7-da3b-4532-b055-ad33eb93fe1c@sirena.org.uk>
References: <cover.1725518229.git.zhoubinbin@loongson.cn>
 <c44a6525d77941ef235825a58a9ea91f9f7d7042.1725518229.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WZrniv5M0HT7TQNR"
Content-Disposition: inline
In-Reply-To: <c44a6525d77941ef235825a58a9ea91f9f7d7042.1725518229.git.zhoubinbin@loongson.cn>
X-Cookie: The horror... the horror!


--WZrniv5M0HT7TQNR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 05, 2024 at 03:02:15PM +0800, Binbin Zhou wrote:

This looks like it was based on some *extremely* old code and needs
quite a few updates to bring it up to modern standards.

> + * Author: Mark Brown <will@everset-semi.com>

Oh?

> +/*
> + * es8323 register cache
> + * We can't read the es8323 register space when we
> + * are using 2 wire for device control, so we cache them instead.
> + */
> +static u16 es8323_reg[] = {
> +	0x06, 0x1C, 0xC3, 0xFC,	/*  0 */
> +	0xC0, 0x00, 0x00, 0x7C,	/*  4 */

There's a bunch of regmap reimplementation in the driver, the cache and
I/O code all looks totally generic.  Just use regmap.

> +static const struct soc_enum es8323_enum[] = {
> +	SOC_VALUE_ENUM_SINGLE(ES8323_DACCONTROL16, 3, 7, ARRAY_SIZE(es8323_line_texts),
> +			      es8323_line_texts, es8323_line_values),	/* LLINE */
> +	SOC_VALUE_ENUM_SINGLE(ES8323_DACCONTROL16, 0, 7, ARRAY_SIZE(es8323_line_texts),
> +			      es8323_line_texts, es8323_line_values),	/* RLINE */

Use named variables for the enums rather than putting them into an array
that's not otherwise used...

> +static const struct snd_kcontrol_new es8323_snd_controls[] = {
> +	SOC_ENUM("3D Mode", es8323_enum[4]),
> +	SOC_ENUM("ALC Capture Function", es8323_enum[5]),

...it's *vastly* more readable and maintainable.

> +	SOC_SINGLE("Capture Mute", ES8323_ADC_MUTE, 2, 1, 0),

On/off switches should end in Switch, see control-names.rst.

> +	/* gModify.Cmmt Implement when suspend/startup */
> +	SND_SOC_DAPM_DAC("Right DAC", "Right Playback", SND_SOC_NOPM, 6, 1),

gModify.Cmmt?

> +/*
> + * Note that this should be called from init rather than from hw_params.
> + */
> +static int es8323_set_dai_sysclk(struct snd_soc_dai *codec_dai,
> +				 int clk_id, unsigned int freq, int dir)

Why?

> +	/* set master/slave audio interface */
> +	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> +	case SND_SOC_DAIFMT_CBM_CFM:	/* MASTER MODE */
> +		iface |= 0x80;
> +		break;
> +	case SND_SOC_DAIFMT_CBS_CFS:	/* SLAVE MODE */

Please use the modern naming with _CBP_CFP and so on.

> +static int es8323_mute(struct snd_soc_dai *dai, int mute,  int stream)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct es8323_priv *es8323 = snd_soc_component_get_drvdata(component);
> +
> +	if (mute) {
> +		es8323_set_gpio(ES8323_CODEC_SET_SPK,
> +				!es8323->spk_gpio_level, es8323->spk_ctl_gpio);
> +		usleep_range(2000, 3000);
> +		snd_soc_component_write(component, ES8323_DAC_MUTE, 0x06);
> +	} else {
> +		snd_soc_component_write(component, ES8323_DAC_MUTE, 0x02);
> +		usleep_range(2000, 3000);
> +		if (!es8323->hp_inserted)
> +			es8323_set_gpio(ES8323_CODEC_SET_SPK,
> +					es8323->spk_gpio_level, es8323->spk_ctl_gpio);

This appears to be controlling the speaker based on jack detection.
Unless there is some hardware restriction this should be done via DAPM
and the user allowed to manage when the speaker is used depending on
their use case.

> +static int es8323_suspend(struct snd_soc_component *component)
> +{
> +	snd_soc_component_write(component, ES8323_DAC_MUTE, 0x06);
> +	snd_soc_component_write(component, ES8323_LOUT1_VOL, 0x00);
> +	snd_soc_component_write(component, ES8323_ROUT1_VOL, 0x00);
> +	snd_soc_component_write(component, ES8323_LOUT2_VOL, 0x00);
> +	snd_soc_component_write(component, ES8323_ROUT2_VOL, 0x00);

This will overwrite user settings when suspending, the controls should
be unaffected by suspend.  If the device needs this then use cache
bypass to do the writes during suspend and resync the cache on resume.

> +	snd_soc_component_write(component, ES8323_CONTROL1, 0x06);
> +	snd_soc_component_write(component, ES8323_CONTROL2, 0x58);
> +	usleep_range(18000, 20000);

Use fsleep().

> +static void es8323_init_component_regs(struct snd_soc_component *component)
> +{

> +	snd_soc_component_write(component, ES8323_ADCCONTROL1, 0x88);
> +	snd_soc_component_write(component, ES8323_ADCCONTROL2, 0xF0);
> +	snd_soc_component_write(component, ES8323_ADCCONTROL3, 0x02);
> +	snd_soc_component_write(component, ES8323_ADCCONTROL4, 0x0C);
> +	snd_soc_component_write(component, ES8323_ADCCONTROL5, 0x02);
> +	snd_soc_component_write(component, ES8323_LADC_VOL, 0x00);
> +	snd_soc_component_write(component, ES8323_RADC_VOL, 0x00);

User visible controls should use the chip defaults as standard,
userspace can configure what it needs and this avoids us worrying about
individual use cases in the driver.

> +static int es8323_resume(struct snd_soc_component *component)
> +{
> +	es8323_init_component_regs(component);
> +	/* open dac output */
> +	snd_soc_component_write(component, ES8323_DACPOWER, 0x3c);
> +
> +	return 0;
> +}

This doesn't restore any user settings.

> +static int es8323_i2c_probe(struct i2c_client *i2c)
> +{
> +	struct es8323_priv *es8323;
> +	struct i2c_adapter *adapter = to_i2c_adapter(i2c->dev.parent);
> +
> +	if (!i2c_check_functionality(adapter, I2C_FUNC_I2C)) {
> +		dev_warn(&adapter->dev,
> +			 "I2C-Adapter doesn't support I2C_FUNC_I2C\n");
> +		return -EIO;
> +	}

Does the device really need this?  It seems to be doing very basic I/O
which should be SMBus compatible.  In any case when you move to regmap
this should be redundant.

--WZrniv5M0HT7TQNR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbZuq8ACgkQJNaLcl1U
h9Dcigf7By7JCYwoVnf6y8vJJ5aPDCumCrSV9oqSrliNd3ALjNC9GrtaYdZwbn6x
5/vPKOhiD+0wXX/hPxlErJ5xORBMbjUEeMvCa001/uzJOYHWmnTT3jD1IGpB2aOO
4TLhkibjRBk40/+Y/5ZiPs7Kw/QWtpgrvq7zyjdC+u+bklc8pGpGbvfsj/5t/Sa2
86cRVO9xzCmDA49wzZvjRCF7X0fup6ilHjMmbRol8BsXKumQjCLHCd3GT+jXxDgp
W1V5tB7fJ/jvKEcw5T0NF/4ddZy6D0UKhElAdtix+g1Kxw2YG+Iicc7ra7co7KYV
21u9Nb9xIgIlqsdTWAWx2zPHzASOTg==
=9ntq
-----END PGP SIGNATURE-----

--WZrniv5M0HT7TQNR--
