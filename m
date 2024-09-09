Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508FA22081
	for <loongarch@lists.linux.dev>; Mon,  9 Sep 2024 07:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725867925; cv=none; b=JsbXIlQO3nz0J+VbSmy+PD7mopOYSUuGHsqjo/G31yObg/rqtQFyOXkltnwvWfVZD247rbKgsYx0xioqJ8ml5nqYCqk3WBBeNkMRdbVfogpPvf3jP8fRJ3kJFfxFxqD218fW7kNCWuh30sUwAJX/T6Z6ARJJe2IJi7+gpeR2V70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725867925; c=relaxed/simple;
	bh=YXgyD+BvDAYww72xsg/3C/Emt8qX1a+X/XRm4a+MPxM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bhezFJVTzMuHsAAG+hNYGOw/Clp/mWuzqH+M0OHxqR6S8mfTKRRlLrYH/Na/lamm+vOo9B0E/QhTnrlGCwRxZF01KD115pJl5dmyXJ9xXjz0O8qvuNBzjzOAo1zC2h1+M3XmBI9YK1+I0vTxtm5MyKzmQhjck1ZFhFt7D2tvJ7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e5fHxAsm; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e5fHxAsm"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42cb1e3b449so2060105e9.3
        for <loongarch@lists.linux.dev>; Mon, 09 Sep 2024 00:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725867920; x=1726472720; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fjQh2XJsv0I6HwPdG7/UttA/rIwMQb/L5sm8jJh9P18=;
        b=e5fHxAsmWSWX/o5MHPzgMlKbYq9oLwjqUJmcFYID5kcJQnW6Xn7A72gHYsIpLtheCB
         L6SnUS+ExUlZQO2DsNF0sl0bUxD4y7liVjNxaSyF5vrOEZWId8uTl2L4mW5falN2sd92
         L3FiAPOT2AyDH/Ikn2lKtnQu2dxqsQfs94zEmmO/bTzsxrbfY//dqza8tXMTeeCAqQWJ
         7sKsCHxuhckPSoifm9Vk5TYY1YHVCr0NxcTk14WEIJMPEgLxSj3os/s9VH4C9ZyWPINC
         UKtXApveS0Q+mSkrGkO8iG6mTmaD04nOJZRsX8LG/3jfyZqcxzyfkrsWfIc/2FA5+0yv
         D9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725867920; x=1726472720;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fjQh2XJsv0I6HwPdG7/UttA/rIwMQb/L5sm8jJh9P18=;
        b=YVnjSikQbW4Yv4t59D0m6ft2wx5MKPuPlDghp6ay/JA1PO8PcV2yaS5r+9V6o63wTw
         Mbb2J5y15usl5As3ckVj1EETjCvzQszNShNqNsUvsMmDEZrIxSZ5u5PLApmCD545qX8h
         CTH5S7O3jWuf+IPMpeKJzStsdlLmJCWZDdhGZxMa1PtECSpyIFJdLxB58zvI/HHwgwOq
         VBaM8hpM3rdDz9jzYGuq8Vtx4ntMMgpOa+q73p//go4t0YNqWEICgjMgGIzsqeKWu1EA
         bjx0wHVjhFHNeRjbs9mFuGBQK2PoqbBaWAu3p1RWQEUmCOlEMbZq59L7KMfc+s05ibai
         iHvw==
X-Forwarded-Encrypted: i=1; AJvYcCUoqaaeAxUgmx/W9T7llm0nuZ90PGXJNTm4mrfc8eB5yCLns0dB9kZEMXSE2GQ+mgDdeF2RmFB2PVM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6nBGwM3w3g0Pat8MdKGME1sBTJABVgoodpnDOIRJFazAJwOz8
	jUBQvQO7ETowkCY0dRRwEz1T7Cx8SBX68KkZw7iDrzo2rWfvEaPrt8ux3X+tcgA=
X-Google-Smtp-Source: AGHT+IFawsjy94sm9JTMSlJcXrLVFefQrZYbDPUs2sfuWsg3M2tnsyv4eD/Rq9JW3lkycM+4pIbD2w==
X-Received: by 2002:a05:600c:19cc:b0:426:5dd5:f245 with SMTP id 5b1f17b1804b1-42c9f97d30amr34465475e9.2.1725867920051;
        Mon, 09 Sep 2024 00:45:20 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956dddacsm5244840f8f.107.2024.09.09.00.45.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 00:45:19 -0700 (PDT)
Message-ID: <739f8f91-a751-4e4f-8239-078466415272@linaro.org>
Date: Mon, 9 Sep 2024 09:45:16 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/8] ASoC: loongson: Simplify with dev_err_probe()
To: Binbin Zhou <zhoubinbin@loongson.cn>, Binbin Zhou
 <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
 Tang Bin <tangbin@cmss.chinamobile.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-sound@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>,
 loongarch@lists.linux.dev
References: <cover.1725844530.git.zhoubinbin@loongson.cn>
 <07855aa6c290ec826d63e68b898e7f4afac5e30d.1725844530.git.zhoubinbin@loongson.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <07855aa6c290ec826d63e68b898e7f4afac5e30d.1725844530.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/09/2024 09:19, Binbin Zhou wrote:
> Error handling in probe() can be a bit simpler with dev_err_probe().
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

...

>  
> -	if (has_acpi_companion(dev))
> -		ret = loongson_card_parse_acpi(ls_priv);
> -	else
> -		ret = loongson_card_parse_of(ls_priv);
> -	if (ret < 0)
> -		return ret;
> +	ret = has_acpi_companion(dev) ? loongson_card_parse_acpi(ls_priv)
> +				      : loongson_card_parse_of(ls_priv);
> +	if (ret)
> +		dev_err_probe(dev, ret, "Error parsing acpi/of properties\n");

This does not make anything simpler - you don't use dev_err_probe()
features here. OTOH, you duplicate error messages.

Best regards,
Krzysztof

