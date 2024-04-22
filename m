Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6306518F
	for <loongarch@lists.linux.dev>; Mon, 22 Apr 2024 09:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713779067; cv=none; b=n+RnjfhHg47ETLx7K8mfEo1HizmwoHuBNi5OIlmmIe6ADmeNxDEIAHzifCnT4ezYj4xYimDntZ3Yeq9NAMH8MVBBX44aIWRV6ox9XoT8to0IN4IXRiWSKwHCSS5by8zxhpYcPZ7tJX6N3I/Rfc9oQDF+Vr/E8Iy3i4yM+ZmBtZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713779067; c=relaxed/simple;
	bh=fc72h3f1uuW1Y3i/oR5o+u9TvVvqU6JW02wnfcUEaYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tPaENQt23K8cFfW7rJ6IBDQi7sXOaxz5etwzBguCPNgyUO9UyB/n+JlE6orJ1DTPQhNv6Tf4tpNXT/oOLAtTMpgyUs37EdiTFbnCV0OjyNhxp9uZZKXW9k4CBt4YaNNmsAP2Rn2mDhF4UfrluG7BzQ/gbGQ46pSCqD/L+Zlkd4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UlzL/OEh; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UlzL/OEh"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-41a72f3a20dso3088455e9.0
        for <loongarch@lists.linux.dev>; Mon, 22 Apr 2024 02:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713779063; x=1714383863; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p8Wu3wsA6l8PNq8s+rNlFLDmhVVJi5fhCRWYrZwDPqQ=;
        b=UlzL/OEheWwYJ3PP+BaHZzsj2Dvd9EsdLzfPAB0lawA675f1yzqSYqMQBbPQcYs2es
         iLvuL6DPlth8+fDs3a4qVkRsfVCNpkPOji3+sst5QjL4AmaH8Rkk9rP/Vjrd26lCfD0P
         EECU8bETMK9+rjWHHNyI/97s8RE+bWonxhc7GG26uByzozSz9b5xr7nPx5n4pvvJTcVA
         NB/5xADElCqC30XNsaOUJwQVn5S9PBx+uHzDy/AkHcUganJJEVG8o9wnydBBz8GHH9MF
         EyASHi/c3wkSApe5vd+SCQryCuWSf4XWVGvfoy//rUo0xhnGO7AwE50vYhrhh6kUW40s
         J3AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713779063; x=1714383863;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p8Wu3wsA6l8PNq8s+rNlFLDmhVVJi5fhCRWYrZwDPqQ=;
        b=gK8YP2ga+BsWQyszGo5sopvPACN2J208ktx2F9ARfL8O49eye4CVjq+746H1SqS8tw
         PKxG/hrPAJAiogu5vXiHmdWzD02G3FzpPibo5bbXtIy5tzjkaVclDVnrqIIxB5XyqmWF
         CFJ1kFL36y/52p4L11nRBrZ79u3bzgaUzP3dl4TxM/G1kZKHTRW+TFazWzCfE/RQ9wvT
         ygTWTCzxgfl/LX1MX7BaFlbRg6fLeCbZWz8E4JpgPspEh6Ona86cRxlGmml1lzoNu3Hq
         nLuEPtOtG/gZu9rfX0Tl6LfX0tRiCv6LI6gJikoVg6/1U/j3cqcHiFBYUxXod4P9ED8U
         pYLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWS2iB8OHTf9prnWz8UIqfxsCQ/XNE13fdlNea4cILstMjz/mdA+ARr+Rfifr4CBk9e62JWfn9h24rgj2athSgj1xodtpofmHf+
X-Gm-Message-State: AOJu0YxrAvAY8bs4adNpMkkTekdJuI04rtFE7+sYCm1shw4B4M3I0CXs
	NJEfxaoQvDZmEm8vZ4Y8BGGzWRfxGT3Vanr1b8vbzfGDJdwGoO7tjF55Pkz4DH4=
X-Google-Smtp-Source: AGHT+IEU6I0opmVnr591cUgtsGJXlxHYTlf3UTRKYdnkAFPg93fgVxLtjz27g4+8aBrCRFbltjjSxw==
X-Received: by 2002:a05:600c:3b11:b0:418:17e9:c23f with SMTP id m17-20020a05600c3b1100b0041817e9c23fmr5820026wms.31.1713779063000;
        Mon, 22 Apr 2024 02:44:23 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id jg23-20020a05600ca01700b004189cf6bd6esm19393018wmb.22.2024.04.22.02.44.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Apr 2024 02:44:22 -0700 (PDT)
Message-ID: <e2cd6b13-62ca-415a-a015-0bf30e77535c@linaro.org>
Date: Mon, 22 Apr 2024 11:44:21 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] thermal: loongson2: Trivial code style adjustment
Content-Language: en-US
To: Binbin Zhou <zhoubinbin@loongson.cn>, Binbin Zhou
 <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Amit Kucheria <amitk@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongson-kernel@lists.loongnix.cn,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 Yinbo Zhu <zhuyinbo@loongson.cn>, WANG Xuerui <git@xen0n.name>,
 loongarch@lists.linux.dev
References: <cover.1713509889.git.zhoubinbin@loongson.cn>
 <58c3a812746affb331147d0d9f2f5b8f62f120cf.1713509889.git.zhoubinbin@loongson.cn>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <58c3a812746affb331147d0d9f2f5b8f62f120cf.1713509889.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 20/04/2024 03:45, Binbin Zhou wrote:
> Here are some minor code style adjustment. Such as fix whitespace code
> style; align function call arguments to opening parenthesis, and add
> devm_thermal_add_hwmon_sysfs() return value checking.
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> Acked-by: Huacai Chen <chenhuacai@loongson.cn>
> ---

[ ... ]

>   	}
>   
>   	ret = devm_request_threaded_irq(dev, irq, NULL, loongson2_thermal_irq_thread,
> -			IRQF_ONESHOT, "loongson2_thermal", tzd);
> +					IRQF_ONESHOT, "loongson2_thermal", tzd);
>   	if (ret < 0)
>   		return dev_err_probe(dev, ret, "failed to request alarm irq\n");
>   
> -	devm_thermal_add_hwmon_sysfs(dev, tzd);
> -
> -	return 0;
> +	return devm_thermal_add_hwmon_sysfs(dev, tzd);

You may not want to do this change. If the devm_thermal_add_hwmon_sysfs 
function fails, that does not jeopardize the initialization of this driver.


>   }
>   
>   static const struct loongson2_thermal_chip_data loongson2_thermal_ls2k1000_data = {
> @@ -167,4 +167,5 @@ static struct platform_driver loongson2_thermal_driver = {
>   module_platform_driver(loongson2_thermal_driver);
>   
>   MODULE_DESCRIPTION("Loongson2 thermal driver");
> +MODULE_AUTHOR("Loongson Technology Corporation Limited");
>   MODULE_LICENSE("GPL");

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

