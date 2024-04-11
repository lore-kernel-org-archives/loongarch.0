Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783FB205E1A
	for <loongarch@lists.linux.dev>; Thu, 11 Apr 2024 19:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712862737; cv=none; b=haG/KfXkS/JwpZgx54sVwuXCCZke25Et8BSOw4J0feLAMeGZQPBQ4tYRlNJ+tp1QlxqDWXv0/PH5EsbcEKQESytaBqAsYkcH0qmcR8QMmXWyX9+L/pzwvwu2RnsARnCIdBiNVV4K1/bE1bntpU/Quz1ldqqhkk6OnGfFWPZZVeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712862737; c=relaxed/simple;
	bh=eFFDOYCijLRK2Jw3Ui1NSz1Q85P0U2Cz5lmx2t1mKp4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LKp49JaAhHscLlYhvLwAftkOKj7i083biuNYTCXX95cl1m3qsRktVDxUyHXHUT3UzHIJXmGElBlO1LVYRQ51L9WX2J25ZSpAjwwK7Hh0G6JvqLclcRtJq+TcCcPLMJUEIPSFKB5/z5r1ulNqEckgniqeQwY8jkbuUX19qlqNqek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZKqFgBl+; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZKqFgBl+"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-346b480e1acso65590f8f.0
        for <loongarch@lists.linux.dev>; Thu, 11 Apr 2024 12:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712862734; x=1713467534; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YeZyNokGKdFPotQZCmtk4+giEamRAWAsbLUX1ROpg9U=;
        b=ZKqFgBl+NtlfmaFPE8YeY1BYPA5vohvJX8xKqyuMOUV9bm9z+DZ8WZw/avt57nz7H7
         drsNwulglPgq21iy001Y7T5sCiJJv8d81FTyBjBVZ1QyOuYsQHV0phZxnpd5hX960/rh
         v/Rsmk1GLO0+VSEc3GEb9D/FNWjJPcZe3ewu5g1DDpjYwMSfZ8jQQObSmnAGfwhL5IHY
         1pZu76uTTU7kXYeuB2jYiP0tcG+W3NzNp8PcPWs2MJSAq9IXhK1c23v7xfORYqwZFX4v
         vD2oJ7u0eVGv1IsW7jI2xw932b3EfdMd8zcat1CszWAlxgqbxiZJt7UQh4P6ToMwrYK7
         b2Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712862734; x=1713467534;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YeZyNokGKdFPotQZCmtk4+giEamRAWAsbLUX1ROpg9U=;
        b=Do6ZOzgdldtg8XcHqXeTcpPEupm6Gxo+VNO+zsD8fUsN/XQbVyfNVvvUFgMzeNOUIJ
         GLKuT2iH9DJxV2J2wMYgAN+X/tbX2bWnQqHwT6vaD9I+hdzB6rMLbQULGW2M8oftSW6x
         csax5EEcrKzUqRDwQQ2VceDDTIU+Yai1XLQMGk0ZfDhczeTFFmJCn7XlARMmQqHFO8M1
         uOYVToX9yOP/L9u3lWYCFkR+P3KDxEZPBYq75+GK9evbDbGTlf00QZXfaz13+EZcX6L8
         h+P5LBnUW8lP82YrAdhWE/be9D8LY9CxJwrNftlBNPpDmALcIYpQNjjbL/WaIbVzO9ru
         8cmw==
X-Forwarded-Encrypted: i=1; AJvYcCUAdZBt61QFEfH/LD6gdqq/0jqk0FHZLs4wHKw1wa6e9p2cqbb160HxMBY5t2Qd+fA/2t9k07HJnf8z1OgBwV3xfsoYPcRpm8vT
X-Gm-Message-State: AOJu0Yyz8wPDwVz5R+aftFv/L3Q17Uk+spv8QZqXOKoHGYtC7ppeygbi
	fTEqoceRSE4RHsPcvJ3DtPxUW0dXMsnYEcHkBNHuOazuQgXxn08vkcMkvLUHVM4=
X-Google-Smtp-Source: AGHT+IFMz+ZBVFgSP87EdKwwjghK5e69H4EIvxpdY8uuJy+BkE+7QgPD7ZQ9ZOUKHFL3hKQ0ncAtRg==
X-Received: by 2002:a05:6000:144:b0:33d:5fa6:79bf with SMTP id r4-20020a056000014400b0033d5fa679bfmr254957wrx.71.1712862733807;
        Thu, 11 Apr 2024 12:12:13 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id l26-20020adfa39a000000b00343e825d679sm2418010wrb.87.2024.04.11.12.12.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Apr 2024 12:12:13 -0700 (PDT)
Message-ID: <fbd5d34d-db01-473e-998a-95cc3cfd61e2@linaro.org>
Date: Thu, 11 Apr 2024 21:12:11 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: pwm: Add Loongson PWM controller
To: Binbin Zhou <zhoubinbin@loongson.cn>, Binbin Zhou
 <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Juxin Gao <gaojuxin@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongson-kernel@lists.loongnix.cn,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
References: <cover.1712732719.git.zhoubinbin@loongson.cn>
 <38c234d548b4b9c334cda6e7664a803896b31f6f.1712732719.git.zhoubinbin@loongson.cn>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <38c234d548b4b9c334cda6e7664a803896b31f6f.1712732719.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/04/2024 11:16, Binbin Zhou wrote:
> Add Loongson PWM controller binding with DT schema format using
> json-schema.
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

