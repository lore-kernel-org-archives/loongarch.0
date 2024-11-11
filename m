Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D279812EBDB
	for <loongarch@lists.linux.dev>; Mon, 11 Nov 2024 03:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731297489; cv=none; b=L8eK8aHCRuLi8I9Sk4HZMJUaW7lslDNaUflIb50zu8d/ASHqOEtPu8ezVZK+SCG6tGB/SipiF6CNzFwwr4c+VyzxJVTRKRbCITc/BsPfoIzPFaF4DA6ul5bB7jk1gjZJcrNEMkTm6QMTxxPlHLP2oRWB847fIw6GoGdOs/H6CQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731297489; c=relaxed/simple;
	bh=8Uh0uUSImmTy+qzL1Iu5nFKpjUikB4VJwYS9Y1E24Xw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QSBvt59bCKEbZlduelqq/snNhBZtMLiKlhiDlJJnDuuafSLG/4XOBn1gakwb8BD4Ihh8ktkoARbpYdgkDLOUryCOlBKGppXJXNQLGkSkkVhYHYZ3oJ55oOY/nA3zhBjZHoodUi63hByLHp5n8J6IWguOBsk2GGLpev4WS0jYSq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g1eGviAF; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g1eGviAF"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20cbcd71012so47304745ad.3
        for <loongarch@lists.linux.dev>; Sun, 10 Nov 2024 19:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731297487; x=1731902287; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mtCdbHmWUy1kL6nMDSsqmJyY6FPNtwwaaMfxqv080TQ=;
        b=g1eGviAF5JABtvxbYfS8DxGER9Ns1rK8N5zx2JaGOPbOpDFvzg9+gXNceNeBYvqoPS
         qqIefEHX6P9wNZiK41rRtSWVXurKuxUZ/ZMMUVZ8aEvp9kAQpbQCt6KgvXHDBxKtXLWC
         elqrbp8shYxA4rL5is/R/o7YjnJVoVTGgPOlIDg1bA02i9cupdV358DQI9RJBjToX+uh
         YrvJAS8C7OB2JsLGboTgyL1WPsynBKcu/ZsxjmWMnjbEkn6nMNIu9vpoD/kctei3TUfT
         CL1zS81S7rcDjRUq7sjyHjwDnvTCyWv0lCfrPFpHY9L28+zXjK8Ei7QTe2SrFmEWS5pR
         mJ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731297487; x=1731902287;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mtCdbHmWUy1kL6nMDSsqmJyY6FPNtwwaaMfxqv080TQ=;
        b=cVN8pEGN0TeAyUw6FjcnXl7QmR6ynCIq3NzkR2sn39lyVyn5liIL4t8vAhI/48QXIV
         zyvst51Nlm83NLSrB1AxD2pKffekrtLfxNushBjAR/JzX5KbpWisK/f4g60qeHL5Gcd3
         Ht6pMqh5dAgZO1K1Ae1XlNVpVfN10NHwXy9QkOTG4YSgFZffeZSMCKzoU9+5+esCWjdo
         jJarEL7ZzyPRlFlWXjo3BgZksaTGt1DMI/17giXBLYWuzsLz2ZDonSzF6PpUo9y5sXro
         bMDDzJyUFGGRSo+fGp2RPmCMV3nvpO/4OByTMfMjfnUFBqqlXR+yFTKdB+auFYXV1FTx
         xZVw==
X-Forwarded-Encrypted: i=1; AJvYcCU6B5YH4O3RCyBqfr1Ld/cJBSsZYbZRdoxh7V+YjIjTu9EiHLOFQhtfi/VGlKtO3aBWlNGfDN2NI0s=@lists.linux.dev
X-Gm-Message-State: AOJu0YyLote+O/2rLp/iOYHXv2gq50KltV3J1A0k4IgFBrqtxq9o44zR
	NefpUeHZhm3CSzu+A0PnWOqYoWXhoUOlw4gRSZTcUfO5CHiOj4Ys39vaHp3NIkc=
X-Google-Smtp-Source: AGHT+IHPAn0saGccs4AgqLf8m0L9+JHHSw7AZDB4NvdRcyZctr50eyoVzjWGg/yZrgu0QilvtBenig==
X-Received: by 2002:a17:902:f641:b0:20b:58f2:e1a0 with SMTP id d9443c01a7336-2118350b048mr170353675ad.18.1731297487182;
        Sun, 10 Nov 2024 19:58:07 -0800 (PST)
Received: from localhost ([122.172.86.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177dc826fsm66579705ad.11.2024.11.10.19.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2024 19:58:06 -0800 (PST)
Date: Mon, 11 Nov 2024 09:28:04 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: chenhuacai@kernel.org, kernel@xen0n.name, rafael@kernel.org,
	zhoubinbin@loongson.cn, loongarch@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: loongson3: Check error for devm_mutex_init()
Message-ID: <20241111035804.zc3gwtg5ms3bz34h@vireshk-i7>
References: <20241105032053.1782082-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105032053.1782082-1-ruanjinjie@huawei.com>

On 05-11-24, 11:20, Jinjie Ruan wrote:
> devm_mutex_init() may return error, and the avoidance of checking
> the error code from devm_mutex_init() call diminishes the point of
> using devm variant of it. Add the missed check.
> 
> Fixes: ccf51454145b ("cpufreq: Add Loongson-3 CPUFreq driver support")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/cpufreq/loongson3_cpufreq.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/cpufreq/loongson3_cpufreq.c b/drivers/cpufreq/loongson3_cpufreq.c
> index 6b5e6798d9a2..a923e196ec86 100644
> --- a/drivers/cpufreq/loongson3_cpufreq.c
> +++ b/drivers/cpufreq/loongson3_cpufreq.c
> @@ -346,8 +346,11 @@ static int loongson3_cpufreq_probe(struct platform_device *pdev)
>  {
>  	int i, ret;
>  
> -	for (i = 0; i < MAX_PACKAGES; i++)
> -		devm_mutex_init(&pdev->dev, &cpufreq_mutex[i]);
> +	for (i = 0; i < MAX_PACKAGES; i++) {
> +		ret = devm_mutex_init(&pdev->dev, &cpufreq_mutex[i]);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	ret = do_service_request(0, 0, CMD_GET_VERSION, 0, 0);
>  	if (ret <= 0)

Applied. Thanks.

-- 
viresh
