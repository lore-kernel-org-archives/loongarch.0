Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6121D145B18
	for <loongarch@lists.linux.dev>; Mon, 11 Nov 2024 04:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731298270; cv=none; b=cfAcDnznCbXkXZObkBWXmDeepQ96tpjQDJMUl2NNQ/Nv7SvzAyvZUigUETB1B7gpKP7bcOlmTWZxfSAkJSYBJVx609eiXiuKRmcqRLxkT7ym7Ct029KFzp6AZP4oqlrkIyQCCN/v9YdLLSV3C8w0nqs4KlkJsiJjuMj1vM2bpnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731298270; c=relaxed/simple;
	bh=ytkqzmxvwKpxZEwBtyFIRhXqEMAvdvtQybyYLYu65U4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ALsVFLyazLfhxD8yCkvKGgYfmXwQzIK84PQbZeFlj/QjfPhhDVJiqX9FZN0ezD4vGlLYXL4bkFOq/11RIempnMUoBewHEn2Ho8EvC73XyfRIJjGdc5Htrx2HjQw+M3HM3Mv1243VT3xaGMR1cApbUl2hCb9oM0KlxWhFXY8ASs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zF3goZJF; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zF3goZJF"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20c7edf2872so40769905ad.1
        for <loongarch@lists.linux.dev>; Sun, 10 Nov 2024 20:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731298267; x=1731903067; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ctH8t+j4ut9lhSE/gmof2Pt3Enum2gsVdHRiz0klkzA=;
        b=zF3goZJFgHhdzD0dppEv+S4RGkRVlKJWcOvq6xUHFLwS0hx27idvg6/reF/nUVMDhz
         sgcsySCez3N9CtjNbTvc/qygfqmnWScTtRIpfv4UE03ScdXlqrnXDQm9cq0d/68iB0ty
         NMIE0jS8w6AdMglvX3GCptifoAgy0h93uEZ940Xfc+1YRgpAZn28x18Sar8iviSeB4zZ
         Wk98BFn9cpMAICh19nPUbWt6Fp/jp+DdOm6bQ8jL8z1/RGasLniQsCoL4dM3tefcrNQg
         +VZj74V7UEHOEETKd3dxlzfB/kgu7TKxFcre5R0Z6iHp7SvjeUVpZTiCOBVlpU7Hw0u/
         lpsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731298267; x=1731903067;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ctH8t+j4ut9lhSE/gmof2Pt3Enum2gsVdHRiz0klkzA=;
        b=QwO4Wq89M8QNm3jwsQl7aye2Ipn2nn5mjqLTc6RnK014aMzJxMaQpiq0+RYJnH5Rpa
         fjg3ULf8U34TDlXOjojRb3UTb2vHpcqEIAW51zwEslcjc3XQkbCBl2dSpEFZOcrRyzay
         qz9b1PGLKpcIt7S9aMttMqqz7cWqdY1jxsUKu4YjMuI+hJrvKyQaTlvABw18On58HcBi
         AHM3wJ4N0rdtQLl9y+qeIIkIm9mgYSFA/z1+HofylXu3vCDHYaQl59Xp+XYYNS0/Uzlk
         MTuE7oRmeHW6hw/XNSP19e+jH9c9oRzO6e7XZp4LX9SlzHl5iiI/PGbCGC6tNlA9NmVa
         GusQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPx+gdi/YfK4T6soRQt/agQYtG0mD5LQcP9ILuN7A1rRjISb599IEfVT3APXUaJVqw5bAp/KvbTIA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9W3k/bd+3bdPErLQQ8SnO+WtfGoomuZnVrvrJFq9NOivvI2bX
	REllj3RlkNWhMEmUk3fafL8kI7762qs7iW1MEGEiEZgkHNvSLK6FXQvG/b+e13s=
X-Google-Smtp-Source: AGHT+IFubI0BiE6KUfLJ0py24LTyD/KjdzxzHwV6n/RQ++K7sXtjjfVIWoq+ZzOvhHe3GI8kMUqAng==
X-Received: by 2002:a17:902:f60f:b0:20b:723a:cba1 with SMTP id d9443c01a7336-2118215cc8amr178953965ad.1.1731298266670;
        Sun, 10 Nov 2024 20:11:06 -0800 (PST)
Received: from localhost ([122.172.86.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e44812sm66595515ad.144.2024.11.10.20.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2024 20:11:06 -0800 (PST)
Date: Mon, 11 Nov 2024 09:41:04 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: chenhuacai@kernel.org, kernel@xen0n.name, rafael@kernel.org,
	zhoubinbin@loongson.cn, loongarch@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: loongson3: Check error for devm_mutex_init()
Message-ID: <20241111041104.c3bfz5yukz7ahxlg@vireshk-i7>
References: <20241105032053.1782082-1-ruanjinjie@huawei.com>
 <20241111035804.zc3gwtg5ms3bz34h@vireshk-i7>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111035804.zc3gwtg5ms3bz34h@vireshk-i7>

On 11-11-24, 09:28, Viresh Kumar wrote:
> On 05-11-24, 11:20, Jinjie Ruan wrote:
> > devm_mutex_init() may return error, and the avoidance of checking
> > the error code from devm_mutex_init() call diminishes the point of
> > using devm variant of it. Add the missed check.
> > 
> > Fixes: ccf51454145b ("cpufreq: Add Loongson-3 CPUFreq driver support")
> > Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> > ---
> >  drivers/cpufreq/loongson3_cpufreq.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/cpufreq/loongson3_cpufreq.c b/drivers/cpufreq/loongson3_cpufreq.c
> > index 6b5e6798d9a2..a923e196ec86 100644
> > --- a/drivers/cpufreq/loongson3_cpufreq.c
> > +++ b/drivers/cpufreq/loongson3_cpufreq.c
> > @@ -346,8 +346,11 @@ static int loongson3_cpufreq_probe(struct platform_device *pdev)
> >  {
> >  	int i, ret;
> >  
> > -	for (i = 0; i < MAX_PACKAGES; i++)
> > -		devm_mutex_init(&pdev->dev, &cpufreq_mutex[i]);
> > +	for (i = 0; i < MAX_PACKAGES; i++) {
> > +		ret = devm_mutex_init(&pdev->dev, &cpufreq_mutex[i]);
> > +		if (ret)
> > +			return ret;
> > +	}
> >  
> >  	ret = do_service_request(0, 0, CMD_GET_VERSION, 0, 0);
> >  	if (ret <= 0)
> 
> Applied. Thanks.

Rather applied the one from Andy as he posted it first.

https://lore.kernel.org/all/20241031134719.2508841-1-andriy.shevchenko@linux.intel.com/

-- 
viresh
