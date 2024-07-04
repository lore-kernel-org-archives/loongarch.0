Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890B6171AA
	for <loongarch@lists.linux.dev>; Thu,  4 Jul 2024 03:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720062936; cv=none; b=lNeDNOoK3k9L4i7U4x94fV/hy3ctdUc9cvWwodVWs1WM9UMoMiWqhr0drhoDF9dHyfBW1VeoSgqf2B7svCdaPp01mrrJe7Vb6rIeyVjvk/LuW/ouWYnSIOdhFmAOH4ZOqjdmaGyQZgNoO8AaJMZc5jT01YsQPEa68rh9TwGuXdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720062936; c=relaxed/simple;
	bh=84LAN5AvodIdD2krtRzJJ7eWWZkwf62ts7mCfwmL7m0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kP9Jm9kvDqqN1Q3y77yiFKRwzjR9x1ddb7w8/zxUSK5HQE1KqRI8AnNK8NuZUiOhfR22SKXH5o4QRQJKn0Nlf3yDR2uzPNjm4SESTNWG2O9BEEJy7mTuUhlCXKNosuEpkGgYA198HD26pkFoMI2lZ/0YO+mak9Ve2iva2yTZGGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DPkTGQGf; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DPkTGQGf"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1f9de13d6baso906545ad.2
        for <loongarch@lists.linux.dev>; Wed, 03 Jul 2024 20:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720062935; x=1720667735; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OxpOKbSyZF+WftZDHrhQeUp38zw13Z/EQZYlL8Cj7SM=;
        b=DPkTGQGf2xHsBnuEYGV+riaizQGOFByShQMLg18aKE6NnM9CMcUbFL9zpVf/AqyvWW
         i24Z46SIP0awLfrz4Gv7ZIM9e0UUL7/FaKgY3ynf0wBz1lmuYfNfIvOIPb584wvxDocS
         wZIrn+NA2YpnSdpwHuLHX75WyLKJSdIfPGR7hGYvmtn2N9yNUTuvj0I9ziWi9pX38fZd
         G7oD3gIx9nQFv52Edeoz+NKXu7myRwBIHUGujieQn8+jxTGYKmgqOk+538+h/rcPf0aU
         KJPh3P4cVhm/3dIZvQxtcxL0ABxkBSuhsGdK+uVDu9gYsBTrxZD2TWsh1q/93mjvxRVU
         TN5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720062935; x=1720667735;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OxpOKbSyZF+WftZDHrhQeUp38zw13Z/EQZYlL8Cj7SM=;
        b=tD2SmLQwoo+gmpXHUfvRXVttBIClnVbxBpjXNSeYBfKBgfc7KHmPOsiIo39LzIAAnt
         Z76wFv+dJJ72ZjQrKkrshlXFQuZVVIfg8Q2+tPJb+8/tfOYeKGsifvYaCUARox3U5z7o
         4QA5gIYGi93arEJ7i1fsfsKnevHMWooXfU/tfiklLZgAfvGWQOnIPd6jNwsEDAcIF2F0
         ni/y2mML4001dPSula0oylVlb815AnJyL0HZGTU0ELOpbt7aF9ZHPv0KWHFbzKloZA4+
         hrn/f6zldmzQ2cLBPgUanP6bvNvhUbfZcuTy3KRYn7uM4OsLuLRv+GhK0GQVn7KwfC4q
         2xJQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5x6RTLrbe3nAqiL+tKN0VDZSA7c7VO/A0pLkZTOPPxeCpLyaM8cKoaZD9hiT7YitNWCUtMws9ZgSwso2/+KCVUI/W2e4odiZE
X-Gm-Message-State: AOJu0YzgeUr1BspnzMPjlfhLTD1vKdyRVVudvwurb0lpvskA2kXYNmwg
	FjFGeQe9NlASLFin8OuplWY8VUD3VDolpYL2rxQAqT5pQGpjOcgiKjgZZOZ0h6g=
X-Google-Smtp-Source: AGHT+IHuvXn0DSewmFV1N4IkbJv5j3w21MonR1q2vZlGPKXP1aEu9fzii35l9bVOl2J1zNs0Kby9/g==
X-Received: by 2002:a17:90a:eb15:b0:2c9:5c7c:815d with SMTP id 98e67ed59e1d1-2c99c57ed63mr312263a91.22.1720062934777;
        Wed, 03 Jul 2024 20:15:34 -0700 (PDT)
Received: from localhost ([122.172.82.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c99a9cd3e7sm307714a91.39.2024.07.03.20.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 20:15:34 -0700 (PDT)
Date: Thu, 4 Jul 2024 08:45:32 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>,
	"Rafael J . Wysocki" <rafael@kernel.org>, loongarch@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: Re: [PATCH V2 2/2] cpufreq: Add Loongson-3 CPUFreq driver support
Message-ID: <20240704031532.5bkh4nr7d3vcvzwq@vireshk-i7>
References: <20240702152737.1184244-1-chenhuacai@loongson.cn>
 <20240702152737.1184244-3-chenhuacai@loongson.cn>
 <20240703101850.dtck223pleiiwfxp@vireshk-i7>
 <CAAhV-H74HJr0=8g0GtHj=zZH5nJijRpc90zLLRY_sXJfKFVtHA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhV-H74HJr0=8g0GtHj=zZH5nJijRpc90zLLRY_sXJfKFVtHA@mail.gmail.com>

On 03-07-24, 22:37, Huacai Chen wrote:
> On Wed, Jul 3, 2024 at 6:18 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > > +static int loongson3_cpufreq_target(struct cpufreq_policy *policy, unsigned int index)
> > > +{
> > > +     /* setting the cpu frequency */
> > > +     return loongson3_cpufreq_set(policy, index);
> >
> > Why use a separate function for calling do_service_request() ? Just
> > open code it here.
> Hmm, there is a loongson3_cpufreq_get() function, so I make a
> loongson3_cpufreq_set() function, too.

The counterpart of _get is _target and so a separate set function
isn't required at all. Just get rid of it.

> > > +static int loongson3_cpufreq_get_freq_table(int cpu)
> > > +{
> > > +     int i, ret, boost_level, max_level, freq_level;
> > > +     struct cpufreq_frequency_table *table;
> > > +
> > > +     if (per_cpu(freq_table, cpu))
> > > +             return 0;
> > > +
> > > +     ret = do_service_request(cpu, 0, CMD_GET_FREQ_LEVEL_NUM, 0, 0);
> > > +     if (ret < 0)
> > > +             return ret;
> > > +     max_level = ret;
> > > +
> > > +     ret = do_service_request(cpu, 0, CMD_GET_FREQ_BOOST_LEVEL, 0, 0);
> > > +     if (ret < 0)
> > > +             return ret;
> > > +     boost_level = ret;
> > > +
> > > +     freq_level = min(max_level, FREQ_MAX_LEVEL);
> > > +     table = kzalloc(sizeof(struct cpufreq_frequency_table) * (freq_level + 1), GFP_KERNEL);
> >
> > devm_kcalloc(pdev, ...) instead ?
> I remember you told me this in V1, but devm_kalloc() needs a pdev
> instance, which doesn't exist here, so I keep kzalloc().

See how drivers/cpufreq/brcmstb-avs-cpufreq.c stores the pdev in
cpufreq_driver's driver_data and reuses later on.

-- 
viresh
