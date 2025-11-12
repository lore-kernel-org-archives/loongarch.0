Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1A52BD022
	for <loongarch@lists.linux.dev>; Wed, 12 Nov 2025 23:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762991619; cv=none; b=nTGahG3YPzMgallK8SH8yBaww15/ReoLl+NM991PmqPUj8XgNPdM2mlDln1wWzvpebSXWPH1SmcGzsgVWjWro11Rl1jhr6D+zdECFxWzEvyUgG5rASyHcFLIhGeTA/DK2lOOvRjhgWboH7BGqZQxrwqtoqYoNXpgJKfU6d+dVa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762991619; c=relaxed/simple;
	bh=kMdTi/9PzGiJMaxiPkLUgJ7n4V8tYlMU2D/cLBH81AA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nbEzTQ8IT+lLJ48rnRD7w1OO0XxRRo3FRkjl/7u67JGFzL9wDJ60N39pblThluzardFtXoYGzWeihpl3EwTrjTp0Y+bKQzO6nDhNNM67dY5aCoGGgGhSh4/0IO5JA9rksHOJukSUnrRxkmTkZ8GnIPESlteL5qZhuY09QZOE6eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ajxgXlD8; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ajxgXlD8"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2980d9b7df5so1645675ad.3
        for <loongarch@lists.linux.dev>; Wed, 12 Nov 2025 15:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762991617; x=1763596417; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MpudN9GMhBh6pD3dB69HdEEsYghlO45WOLumGV5q+OI=;
        b=ajxgXlD835kq58zQqgWf05OIxVWBtbYr2vGRuhI+WCKnpPxxX4pQ8/Dmd6vnMCwxHJ
         ClowwuYHqz8HZqsFKQCJ9WGKNxFU86j0msN+z01HKDao9oP17e+r6qOBkUeDi76YYwIf
         ko0O5cPiz9JXj9dQoMv442cRIpQ3FHYoZCeF4XLv4NkKyCeiiCoLZMS9/yR+42r7H8Mh
         oEl1w8ItJUe3w2A0stlOAd8WD8QlZuJh75W8IlXyDovyxQWexn7neU2z/y9f7YnmDQRs
         VMvSN2pgxCed4gFwHjo2rq5LtUtrU6RL1rSmBd3fCZfQU9QUGJYkeGlpmhh50qlAhV+Q
         P0sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762991617; x=1763596417;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MpudN9GMhBh6pD3dB69HdEEsYghlO45WOLumGV5q+OI=;
        b=chdSMAUeRhgRMk1INZILsC7aAT3vZQWSQNlSbLftdcpaSWP6KV+TYPgRUjvdILBADo
         vluoVPAfR2B4kML+qxrqZX9f6F9abbQC1Clw7hVac5YL2S7lHGOWnF1eUd9rPY9KLqrL
         zCjmhfV4SIp9HrQOFQbZkWVjoFJwEV04JBP/zqTbcZ7gCnMukBlDaCv/cjjgVQKjFyPY
         mR3/xDjgfdKniqKtT/YlD7X7VtrNbUPQtniEz9dTXyy6dAIzQ4iSgmqV6UGUsVgM5XNu
         SYhN1S4+moMAe6nWFnKkFhZ5duM01r230QFon6V2cbB6vaCxhjqe5+Gda7Si84mdfMOX
         KPsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUh/CCyvU1OrBrgpRaV9lt9DDuTExB9fpKLfzuONlArPRE5tnpcZTp/3ItP6J1GYwscmynnBXFQ5P8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8AcZRKUo8c9zzIa25kVGy+HvZi3TaGLPPQKaIZ7moGNbRC6Ck
	e1a5rYVzdEwV4tnhfsxT83ZKe6POdgpV6U14W6NqJ7XxH4WFhlpAL33v
X-Gm-Gg: ASbGncvgQZYb+51/cpErygMDg5EFl8hW69GrdaFzPNzcDAi5misu53ovgP6dNd5nGhX
	feS99WrUIz+jtvou9qQgveWTrswT+XVTLgC2z032ak2wOQI60Te502uVeQI4sNGHHwl4a/nZVCk
	CdMy+2pPjje0/o2k1M0RRbIhWvZ/JrRWD8O5ZrO2nA6MjC+eCYuFO+IlwuKR0LFb4fiV8jIDpGO
	0NpcoHHY6CbTuOyBq8hH24HhVUfNe8fN8mgsj5YobzNsm1HE+6Yr33D26TmfYyAfiHnmBZmqnpf
	VCx5f2OTA9e6j3mMuIYKZKUCxTnqh3mn9+7hlfa5FsxnyPwsmEYDMV0VvANNQe1v/ggRA3ndD8U
	gqZ75K2W1gL7P+8przx60Bb/JSLK18p+pRSx0JBNUUZD3QoopyBVNZsm/O4IuBRklMHvfMQhLuJ
	9Iq5U9Vn5AokBz
X-Google-Smtp-Source: AGHT+IGt5oL86/oFkHaVKTMcmQvak29A8nDf4vHESVHp1UA4vDa+W7Wh11xzw7bq1b/+OE8a+9PL/g==
X-Received: by 2002:a17:903:22c8:b0:295:59ef:809e with SMTP id d9443c01a7336-2984ed41fd6mr55346245ad.24.1762991616951;
        Wed, 12 Nov 2025 15:53:36 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b106bsm3241805ad.58.2025.11.12.15.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 15:53:36 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 12 Nov 2025 15:53:35 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
	devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2 2/5] watchdog: loongson1: Simplify ls1x_wdt_probe code
Message-ID: <412c28f7-c552-4691-9cb2-98b67b4404ef@roeck-us.net>
References: <cover.1762482089.git.zhoubinbin@loongson.cn>
 <7d792b573160cbeb0f797f6b8e2f5dcb54f8b490.1762482089.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d792b573160cbeb0f797f6b8e2f5dcb54f8b490.1762482089.git.zhoubinbin@loongson.cn>

On Fri, Nov 07, 2025 at 02:01:28PM +0800, Binbin Zhou wrote:
> Remove meaningless output to simplify ls1x_wdt_probe().
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/loongson1_wdt.c | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/watchdog/loongson1_wdt.c b/drivers/watchdog/loongson1_wdt.c
> index 8502263b0d6f..781f01f1f888 100644
> --- a/drivers/watchdog/loongson1_wdt.c
> +++ b/drivers/watchdog/loongson1_wdt.c
> @@ -108,11 +108,11 @@ static int ls1x_wdt_probe(struct platform_device *pdev)
>  	struct ls1x_wdt_drvdata *drvdata;
>  	struct watchdog_device *ls1x_wdt;
>  	unsigned long clk_rate;
> -	int err;
>  
>  	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
>  	if (!drvdata)
>  		return -ENOMEM;
> +	platform_set_drvdata(pdev, drvdata);
>  
>  	drvdata->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(drvdata->base))
> @@ -139,15 +139,7 @@ static int ls1x_wdt_probe(struct platform_device *pdev)
>  	watchdog_set_nowayout(ls1x_wdt, nowayout);
>  	watchdog_set_drvdata(ls1x_wdt, drvdata);
>  
> -	err = devm_watchdog_register_device(dev, &drvdata->wdt);
> -	if (err)
> -		return err;
> -
> -	platform_set_drvdata(pdev, drvdata);
> -
> -	dev_info(dev, "Loongson1 Watchdog driver registered\n");
> -
> -	return 0;
> +	return devm_watchdog_register_device(dev, &drvdata->wdt);
>  }
>  
>  #ifdef CONFIG_OF
> -- 
> 2.47.3
> 
