Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06722D600;
	Fri,  6 Sep 2024 10:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725618542; cv=none; b=BhZRexnJR6gR59igHgpsZy8LmvjMMwWAMvcr6u3jgbhxoYwekJ3ppc2mY8o1QR1jN59mg/FPoay850iJb2oa33uLLfo7FLtlBCYLldz3uSHuZJ3HvXB0TmuQ2O7LkxaSAFdeblgqthobq+QJOONhxy8OMTR7Q5IqT/FbE2pS0YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725618542; c=relaxed/simple;
	bh=ewoUSpD+jsuG97f6zhJYRHrylPQTOxOQQpBb+FirDiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kv45sCrEcjwHwAC0ufGBczF5mALx7pbfREnyzHMTVWI7zA04iASI25F7/Das7Ru3obm/ZME3OttplKXQc32T23bXsVrztYI7in/KHdkdBOc/wZTmPR0ABrEdnBTvSstDWlpY9QcEE+YehNpLkHu35G57vOUnvFOOy4fHzJ0wiXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MwgJf3L9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MwgJf3L9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3DFEC4CEC4;
	Fri,  6 Sep 2024 10:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725618542;
	bh=ewoUSpD+jsuG97f6zhJYRHrylPQTOxOQQpBb+FirDiI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MwgJf3L9wQWge9t74ekAwke2UNtQDao/ymn+JSUdslmBr3jmD9lgXomYimyYCwOs5
	 jYtZVpm+8KMSsLqLzNHBpPdHMTvluz58r7wNtXiEZVcIHwtEya6IHJP9ctS0JA/kdu
	 nYZLEUMCra17fOm0ZWlVSygIE6tOJwoYAepBoMLp9BpTvCIeb82++UKw2mO1xv5Oik
	 MAsYrVKlG3hCK1nuJEVzhh2aBZCZKCNA3ZgAJMF4iuog/eqJFjS3xXJgQ3DTA632AX
	 t88ydsHhihZJZUYE3lAPNpymDZX8urCOwXJud6SuqfzVviYcO5YznRDQ/8aUmzOQkt
	 IZ3Fz8FNhOf2w==
Date: Fri, 6 Sep 2024 12:28:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, 
	Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Huacai Chen <chenhuacai@kernel.org>, devicetree@vger.kernel.org, linux-sound@vger.kernel.org, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
Subject: Re: [PATCH v1 06/10] ASoC: loongson: Fix codec detection failure on
 FDT systems
Message-ID: <x2vcgpjlamobnlsj7ty5aekj35kjzpraizqd2zhvbwi7mhputx@snxtfb3hgznb>
References: <cover.1725518229.git.zhoubinbin@loongson.cn>
 <f9111564acc6c9ac011318a7eb3c6843ea0529ce.1725518229.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f9111564acc6c9ac011318a7eb3c6843ea0529ce.1725518229.git.zhoubinbin@loongson.cn>

On Thu, Sep 05, 2024 at 03:02:55PM +0800, Binbin Zhou wrote:
> When the Codec is compiled into a module, we can't use
> snd_soc_of_get_dlc() to get the codec dai_name, use
> snd_soc_get_dai_name() instead.
> 
> Also, for the cpu dailink, its dai_name is already defined as
> "loongson-i2s", so just get the corresponding of_node attribute here.
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  sound/soc/loongson/loongson_card.c | 89 +++++++++++++++++++++---------
>  1 file changed, 63 insertions(+), 26 deletions(-)
> 
> diff --git a/sound/soc/loongson/loongson_card.c b/sound/soc/loongson/loongson_card.c
> index a25287efdd5c..d45a3e77cb90 100644
> --- a/sound/soc/loongson/loongson_card.c
> +++ b/sound/soc/loongson/loongson_card.c
> @@ -119,44 +119,81 @@ static int loongson_card_parse_acpi(struct loongson_card_data *data)
>  	return 0;
>  }
>  
> -static int loongson_card_parse_of(struct loongson_card_data *data)
> +static int loongson_parse_cpu(struct device *dev, struct device_node **dai_node)
>  {
> -	struct snd_soc_card *card = &data->snd_card;
> -	struct device_node *cpu, *codec;
> -	struct device *dev = card->dev;
> -	int ret, i;
> +	struct device_node *cpu;
> +	int ret = 0;
>  
>  	cpu = of_get_child_by_name(dev->of_node, "cpu");
> -	if (!cpu) {
> -		dev_err(dev, "platform property missing or invalid\n");
> +	if (!cpu)
>  		return -EINVAL;
> -	}
> +
> +	*dai_node = of_parse_phandle(cpu, "sound-dai", 0);
> +	if (!*dai_node)
> +		ret = -EINVAL;
> +
> +	of_node_put(cpu);

This goes just after of_parse_phandle, which simplifies your code.

> +	return ret;
> +}
> +
> +static int loongson_parse_codec(struct device *dev, struct device_node **dai_node,
> +				const char **dai_name)
> +{
> +	struct of_phandle_args args;
> +	struct device_node *codec;
> +	int ret = 0;
>  
>  	codec = of_get_child_by_name(dev->of_node, "codec");
> -	if (!codec) {
> -		dev_err(dev, "audio-codec property missing or invalid\n");
> +	if (!codec)

Hm? So you exit here and then caller does of_node_put on stack value.
This is buggy.

> +		return -EINVAL;
> +
> +	ret = of_parse_phandle_with_args(codec, "sound-dai", "#sound-dai-cells", 0, &args);
> +	if (ret)
> +		goto free_codec;
> +
> +	ret = snd_soc_get_dai_name(&args, dai_name);
> +	if (ret)

Your error paths should clean here. Each function is responsible to
clean up after itself in case of errors, not rely on caller.

> +		goto free_codec;
> +
> +	*dai_node = of_parse_phandle(codec, "sound-dai", 0);
> +	if (!*dai_node)
>  		ret = -EINVAL;
> -		goto free_cpu;
> +
> +free_codec:

You are not freeing any resources here (at least not directly). You are
dropping reference. Use matching label name. free is associated with
kalloc()..


> +	of_node_put(codec);
> +	return ret;
> +}
> +
> +static int loongson_card_parse_of(struct loongson_card_data *data)
> +{
> +	struct device_node *codec_dai_node, *cpu_dai_node;
> +	struct snd_soc_card *card = &data->snd_card;
> +	struct device *dev = card->dev;
> +	const char *codec_dai_name;
> +	int ret = 0, i;
> +
> +	ret = loongson_parse_cpu(dev, &cpu_dai_node);
> +	if (ret) {
> +		dev_err(dev, "cpu property missing or invalid.\n");
> +		goto out;
> +	}
> +
> +	ret = loongson_parse_codec(dev, &codec_dai_node, &codec_dai_name);
> +	if (ret) {
> +		dev_err(dev, "audio-codec property missing or invalid.\n");
> +		goto out;
>  	}
>  
>  	for (i = 0; i < card->num_links; i++) {
> -		ret = snd_soc_of_get_dlc(cpu, NULL, loongson_dai_links[i].cpus, 0);
> -		if (ret) {
> -			dev_err(dev, "getting cpu dlc error (%d)\n", ret);
> -			goto free_codec;
> -		}
> -
> -		ret = snd_soc_of_get_dlc(codec, NULL, loongson_dai_links[i].codecs, 0);
> -		if (ret) {
> -			dev_err(dev, "getting codec dlc error (%d)\n", ret);
> -			goto free_codec;
> -		}
> +		loongson_dai_links[i].platforms->of_node = cpu_dai_node;
> +		loongson_dai_links[i].cpus->of_node = cpu_dai_node;
> +		loongson_dai_links[i].codecs->of_node = codec_dai_node;
> +		loongson_dai_links[i].codecs->dai_name = codec_dai_name;
>  	}
>  
> -free_codec:
> -	of_node_put(codec);
> -free_cpu:
> -	of_node_put(cpu);
> +out:
> +	of_node_put(codec_dai_node);

Yeah, so here we see drop of reference from stack-based pointer...

Best regards,
Krzysztof

