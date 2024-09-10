Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC2217B4FF
	for <loongarch@lists.linux.dev>; Tue, 10 Sep 2024 07:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725951652; cv=none; b=E/4GAQjG7+M5APR6XqaJ6ZbgjkDbZhjZpyQ3MnM3ARREpfsw3y/nzr1VbIkEPU23EXUALppdUl3PxigMhKnyMf6hFc8apyMGZP56bu55CyhSCY/V2jA390jBueF48POK9cMTEANi6k22a8scJCRyIjAcBBM8vX/RR4VchijWyD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725951652; c=relaxed/simple;
	bh=fKFDtJX6H4J4ft9KA8cVnAC7FeDdliRD0lLCvf/mcpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ExCiaUpsGOh3yyXOf4rilL4COnDQEnS+bqKrFvcQrM5ygwysvh/uBfE45S+X8wGGlPNEQy1/nn2daXlaOmKLw9r0Sa2IHXQugTOou/+4Vj9BmK7aoSWFsNrEnLwDv4NeoB3LFm9hgBTGFDGikCtA/qgUuJOKRNxuZYzkwMwqA5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=VlyKD2zw; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="VlyKD2zw"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-374c6187b6eso3150010f8f.0
        for <loongarch@lists.linux.dev>; Tue, 10 Sep 2024 00:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725951649; x=1726556449; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MLdy1HqCe/P/wfI/U0dXpj5UGtLrwYaUul2f80rYcsE=;
        b=VlyKD2zwUZVoCbJ7qbihrNKoyvzULOV40X5FhDL8xoskNunihCE++ba+AzXOhtfYbv
         09Stf5+lwAA1FYiTfHGNXeEGfi8Ga7FWX4wb1O9nLjdrhQKetyTE0hwu6BvgHQW1t5Uu
         d810mdquwjEYsXUDqU9rRkLKAgZF6CdrbleqUEAx5UdoVcFsy5bffKmIVACnRKYOyiBT
         BjGTN27IM9SvQ/JVm8/8Sq6NihxKkL+hsVsAvKoliFcPpfUYpQEh7YCeq5IN39vb2FRl
         NSSRPfcuv/dqFp9qACmdl5R4wzEV0ZNFQoQS7d1mvnxjOQIzaALtjX/Xh5/vp2Kvf04P
         JRJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725951649; x=1726556449;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MLdy1HqCe/P/wfI/U0dXpj5UGtLrwYaUul2f80rYcsE=;
        b=PKNE13U73yY7p+cgPfToC1ElfzHay8uotU7lEPxbUOD5YymlRTjAk3F0DKd7Lxj5O2
         pg0cbAe/wE9rhGOKE1jU/gzGghfnnBp50v8FJm2b5H/2ME1meLunrH6TcUl0dXcB44+J
         ffIkJkiiZv9Y5rtWBCVqhhPQZOoINkz7LsW3Fak8Uf/F/1j7/7mimZrQC3F3sY9BR1BC
         W6fIo7UbLv6vYXvvSbbbDp0HxUNVuXtCPra1F1Y4JP7aU8kbELBhfB4w137rWFTammDJ
         Zedhkg8RE89l5x7DmufkgNohzGfpfMqIHLJ6zphTAvBj878+0yDgdoWgosyqK71hdS1T
         WfCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHGpiunG2vxt+OuB3OmzBVTRoHNpZ35CiIt9VkI7TGJWCJKBpHUcY7sx4Nd/Th5Z4yqkbGdv0sreg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxZoqNJyyY2vwJyo/vbgl5lZ5mhLR7oQJk2ndJ7FiMIy1+idpkz
	kMQzLU3d2mNT4+rEpVvztls0Y8Opq2nAeotSVmXIxAKf3TEBCkC5sGiT4TZ81PQ=
X-Google-Smtp-Source: AGHT+IGSpgZGxNJQq/Qo4D8JhGcF7UkYtWKkqi99YliN+/1ihfgtjS4RGuaumEGAlmzP201Le1guqQ==
X-Received: by 2002:a5d:4386:0:b0:374:bb2b:e7c4 with SMTP id ffacd0b85a97d-378896b1c82mr8978817f8f.57.1725951648885;
        Tue, 10 Sep 2024 00:00:48 -0700 (PDT)
Received: from localhost (p5dc68d3d.dip0.t-ipconnect.de. [93.198.141.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42caeb8b2f4sm100972925e9.45.2024.09.10.00.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 00:00:48 -0700 (PDT)
Date: Tue, 10 Sep 2024 09:00:46 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, 
	Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Juxin Gao <gaojuxin@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
Subject: Re: [PATCH v5 2/2] pwm: Add Loongson PWM controller support
Message-ID: <awru62rcjkkb6n4sa2abmilzmu5ddxiv5s52tnkm2jcwi4isnt@djpzrj6asxok>
References: <cover.1720516327.git.zhoubinbin@loongson.cn>
 <63a540e93147eff5e7c942133c462530689f707c.1720516327.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w4t66meuz2x6g6x5"
Content-Disposition: inline
In-Reply-To: <63a540e93147eff5e7c942133c462530689f707c.1720516327.git.zhoubinbin@loongson.cn>


--w4t66meuz2x6g6x5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

On Wed, Jul 10, 2024 at 10:04:07AM +0800, Binbin Zhou wrote:
> diff --git a/drivers/pwm/pwm-loongson.c b/drivers/pwm/pwm-loongson.c
> new file mode 100644
> index 000000000000..17ab2a2f48ad
> --- /dev/null
> +++ b/drivers/pwm/pwm-loongson.c
> @@ -0,0 +1,285 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Loongson PWM driver
> + *
> + * Author: Juxin Gao <gaojuxin@loongson.cn>
> + * Further cleanup and restructuring by:
> + *         Binbin Zhou <zhoubinbin@loongson.cn>
> + *
> + * Copyright (C) 2017-2024 Loongson Technology Corporation Limited.
> + *
> + * Limitations:
> + * - The buffer register value should be written before the CTRL register.
> + * - When disabled the output is driven to 0 independent of the configured
> + *   polarity.

An info about possible glitches and if a period is completed on
reconfiguration or when the PWM is disabled would be great.

Also if there is a publically available manual, please add a link here.

> + */
> +
> [...]
> +static int pwm_loongson_apply(struct pwm_chip *chip, struct pwm_device *pwm,
> +			      const struct pwm_state *state)
> +{
> +	int ret;
> +	u64 period, duty_cycle;
> +	bool enabled = pwm->state.enabled;
> +
> +	if (enabled && !state->enabled) {
> +		pwm_loongson_disable(chip, pwm);
> +		return 0;
> +	}

You can also shortcut if !pwm->state.enabled. Something like:

	if (!state->enabled) {
		if (enabled)
			pwm_loongson_disable(chip, pwm);
		return 0;
	}

> +	if (state->polarity != pwm->state.polarity) {
> +		ret = pwm_loongson_set_polarity(chip, pwm, state->polarity);
> +		if (ret)
> +			return ret;
> +	}

Together with the shortcut above this is buggy. Consider:

	pwm_apply_might_sleep(mypwm, &(struct pwm_state){
			.period = A,
			.duty_cycle = B,
			.polarity = PWM_POLARITY_NORMAL,
			.enabled = true});
	pwm_apply_might_sleep(mypwm, &(struct pwm_state){
			.period = A,
			.duty_cycle = B,
			.polarity = PWM_POLARITY_INVERSED,
			.enabled = false});
	pwm_apply_might_sleep(mypwm, &(struct pwm_state){
			.period = A,
			.duty_cycle = B,
			.polarity = PWM_POLARITY_INVERSED,
			.enabled = true});

After the 2nd call you left pwm_loongson_apply() early without writing
the inversed polarity to the register space. In the 3rd call you have
state->polarity == pwm->state.polarity and so skip configuring the
polarity again.

I suggest to just do pwm_loongson_set_polarity() unconditionally if
state->enabled = true.

> +	period = min(state->period, NANOHZ_PER_HZ);
> +	duty_cycle = min(state->duty_cycle, NANOHZ_PER_HZ);
> +
> +	ret = pwm_loongson_config(chip, pwm, duty_cycle, period);
> +	if (ret)
> +		return ret;
> +
> +	if (!enabled && state->enabled)
> +		ret = pwm_loongson_enable(chip, pwm);
> +
> +	return ret;
> +}

Best regards
Uwe

--w4t66meuz2x6g6x5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmbf7pMACgkQj4D7WH0S
/k5t/QgAofx2pNsRH3IuK4/XzJXnm6mE1nKFc6tbO+Z+q4IJ6d74I4YvT2+XoYBp
efq6UR+1TTL2e0kkaoKhqIEfhA2ol371vVbsK9GXbFcnb4hfJFF4K9XD62oynakN
FgdMByd4DxiLTY2m5HJiLFNgUHHWQ23o6QPJ3GrLfA4nHXTpNHiBRSPiXHfMSqSH
TtqZELnnIadnGXE8DZbmxKims3D/Lg/nJoPggcYRtjXpJ0cY5PVaB2JULjb9Ul87
fGC7GdAEYYnRMly5inlY/1UqPUw9aWirjsp1/7vaxorgoe+Rc9l4z1V0BdT/q1tp
bOJo74ocmKhmUdMIJx5XraMrtFYcKw==
=rDRR
-----END PGP SIGNATURE-----

--w4t66meuz2x6g6x5--
