Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7D52C15BE
	for <loongarch@lists.linux.dev>; Wed, 12 Nov 2025 23:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762991644; cv=none; b=ijHj879SIKNkmt4j0cGQsE95fACwa0dzfepjw6BpGm+foYaKZG65JN6np9xKzKko0F9o1aVlzn5gJYqvKuWeee8BfEQkqnAvhzjNcdCnhIb35P+JKutq4Nl8DRsER+NpbBJRTCugKod91LQGO2I8UERYvDuMLMtTY4IL2JYMAgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762991644; c=relaxed/simple;
	bh=bfdAnt6N21QgkLRaO8Sbl/J0PbMxqUZVFCqbeYrPwlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V6DuxLV2jSzhGITRkH6hjQLlrIkQIBhkaESEy8UawfAoA54qxsbYYktBtVmfy5qMBM3c+zO27xI+xFtrciUqKQAwnP3TFYZ1puA7dfUfx0eFH++ZE1GhOjFTIhC1is/YFaTukvrv3EnFMSpwIcmMcdikQN8+NmicONkyjFMrGP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IYhP2i+r; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IYhP2i+r"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-29586626fbeso1962875ad.0
        for <loongarch@lists.linux.dev>; Wed, 12 Nov 2025 15:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762991643; x=1763596443; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SFSHq2TQze931jnwJtfVu6NeRHbqYueJM+k+Hey5afg=;
        b=IYhP2i+rJXe+RnSRQgMS5LHbOnVaa9t1CCnf/lARjIh7YrpBV5OyaVrhBCkNv/cX64
         H9hD5uA7altjsU6hF+ai+YlRifTjkFHTZfwOtmmW4YshJvIHfGRSuyQcBSSW94Q+cjC0
         enOhXoCEAs/ZxsAJygFyFs2qvbBdVjxo8JZuEDPfx33FgvSZHjUYgXLe+Rk0MBOAYuDt
         9r/WqRTtsUCB81f4wN9V49QD7nkH3zhd7Ln+ED7uwySFxAtTqcVHEajpW+mXBwrvOCfu
         7Y0YD49EBfzdlEH5Yjn/pdXGsQjX1uPjF5rzoK1oy8n4qR6qhiCi6xbqdt9l3ui4Q8Y8
         eFug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762991643; x=1763596443;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SFSHq2TQze931jnwJtfVu6NeRHbqYueJM+k+Hey5afg=;
        b=KQXH8no0VtYQpg+i/FCgiBqUR6LwFRVPfroAj3T5aLYso7trhnmGKgXnjZIl2RlNCZ
         v7VrfkU9ViDMeZ0wT8lrgypP1iCmm/abrwbzj8ZJFc7osej+d+gSH5uDRxlxin3cS9Cm
         wAWozYhJgk9ZTMilcth5Gwhxkup81IU53XlAWxTaQ7AuNDmUfjRyAzJS5wBr4YAMuSwq
         mfGo9M9P1SbqYvsHVMLRJom9gJT9LqRCtwaysQADr9G88UEPNbTY1ivPpg7CQdRfuFDF
         XhEJ58HtvNOfHjdykL5vV1nFo1IRgqScbZy3HWwZMFIYv7Fmv3evbk64xwtODFl/Z6Lt
         T+Cw==
X-Forwarded-Encrypted: i=1; AJvYcCWtXBTaLbVdztCd1t1fjpfq3SlGRlxRB9RZQFtfokManLVMMpp+VP/CheVy1UZSfmwS9HnGwX0KCW8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0qpNW2x7QRqZYocAZwaBTMu1NkXKRNKPuPizKVmTtoRqE2DiC
	7b8u39xqF6iCvlzg3e/ja0WwgY7i8h90V0fXGIzferl53RJ/VaOJUmM1
X-Gm-Gg: ASbGnct/rDZb6oQ0SIiwVIIcfngLgYZoHxZL0GP5cWJwdgdOAWyshX3V12cIl2uehzI
	3WmbWvKSJN415RCEw/zxEf30B6+bPCqvwA57mZ4vj+YN/rkROoiD8sXMjyiEaFGTU4gyd86cQuz
	WFbfqKxrigfNXSH7falVzcWv5nKWLVKkst2WnQs/fuUuBhOr591gjwnrV23eojv6D+gQMA9apy4
	Px0hQpADD+zUbzQFKYbKgnfetIP338ii3kRy/RcJvdJSllw3yJ0n6/ikDSCiT6bZA5FVe3ta/LA
	Fe9B1On9WmzLUxevjKVdcPoyJ1ACHHegorNi7ArSE6UjNkBIxkjY9w4IcGQQmCOSM4e2odXdAOP
	INQn2tFA3ZcC8hsZJb8Ecn3hWJ7NsxyNTt5hakjWJf9Mda01ieLNKqkTkSB+voiIhiLkoqbbT6U
	A74kDRu3w1fEcRq6vmt+lwur4=
X-Google-Smtp-Source: AGHT+IEGOc1HlsHsRPGcd+y4vVfFBFj9v2mqQOArxmZBimDRKkrkYiGkzRLMz1a5z/lHBc3UTthgsw==
X-Received: by 2002:a17:903:2f88:b0:274:5030:2906 with SMTP id d9443c01a7336-2984edcd3a1mr61466505ad.46.1762991642666;
        Wed, 12 Nov 2025 15:54:02 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245e04sm3389265ad.38.2025.11.12.15.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 15:54:02 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 12 Nov 2025 15:54:01 -0800
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
Subject: Re: [PATCH v2 3/5] watchdog: loongson1: Drop CONFIG_OF
Message-ID: <74ea5501-e4ea-4dbc-8c94-a1ca5d4abc66@roeck-us.net>
References: <cover.1762482089.git.zhoubinbin@loongson.cn>
 <a374b938f2cc304b7e618bf22a5e8fa9f32e3efd.1762482089.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a374b938f2cc304b7e618bf22a5e8fa9f32e3efd.1762482089.git.zhoubinbin@loongson.cn>

On Fri, Nov 07, 2025 at 02:01:29PM +0800, Binbin Zhou wrote:
> The general recommendation is to not use of_match_ptr() or CONFIG_OF
> ifdef.
> 
> Drop them.
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/loongson1_wdt.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/loongson1_wdt.c b/drivers/watchdog/loongson1_wdt.c
> index 781f01f1f888..255198cbf5bf 100644
> --- a/drivers/watchdog/loongson1_wdt.c
> +++ b/drivers/watchdog/loongson1_wdt.c
> @@ -142,20 +142,18 @@ static int ls1x_wdt_probe(struct platform_device *pdev)
>  	return devm_watchdog_register_device(dev, &drvdata->wdt);
>  }
>  
> -#ifdef CONFIG_OF
>  static const struct of_device_id ls1x_wdt_dt_ids[] = {
>  	{ .compatible = "loongson,ls1b-wdt", },
>  	{ .compatible = "loongson,ls1c-wdt", },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, ls1x_wdt_dt_ids);
> -#endif
>  
>  static struct platform_driver ls1x_wdt_driver = {
>  	.probe = ls1x_wdt_probe,
>  	.driver = {
>  		.name = "ls1x-wdt",
> -		.of_match_table = of_match_ptr(ls1x_wdt_dt_ids),
> +		.of_match_table = ls1x_wdt_dt_ids,
>  	},
>  };
>  
> -- 
> 2.47.3
> 
