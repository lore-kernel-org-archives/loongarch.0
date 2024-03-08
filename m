Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B6060270
	for <loongarch@lists.linux.dev>; Fri,  8 Mar 2024 22:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709936874; cv=none; b=UR2FWXp9skVaKwyEU8xAgfgUJmy/AHBpwEBqZIEyEn87XyLanqfeJ74nRckamoQIaQsifgh8S8Izqh3Qk97anBGm+9EiMlFwyXboryBNM6mvOh5KcI5Uv4zQh7KBg4UIGkouFoGTbnxvMuzjD4BSREDJ3ziUofXXULL4BIsXsyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709936874; c=relaxed/simple;
	bh=NPnRFZ5W/JRhURogsF+Y0uGFxMzLl4XSlbzwLW6Yauc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IZC2LrwbszxkZVfLtmutwGA5m+JPWf+FeXxMkRTmwYtxeIJqjcOG6TDpORygWv4qsW8R6Qr+50r784xXrjviK/PW9xeu2lAELvFIH6aoaP4tZ9Tfg5lCvvbXodJpAgOFv+Yb1Gt+5hOarh1+DAtzEVFE1dS66dDNe+I2wwQPoAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kiJak8Uo; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kiJak8Uo"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d26227d508so34370041fa.2
        for <loongarch@lists.linux.dev>; Fri, 08 Mar 2024 14:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709936870; x=1710541670; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d9Cm+sjEP7eeQzRpM/dyVnRkWK0R2O4wf+q730ac8Fc=;
        b=kiJak8UoH/oA7ZP/zx2458UT8gfFvAe9lXxQi0+/7LGe+UvMrEWQZkA/EZSBSFpGto
         eSpMoReAQtjXWF8Ti1iy9cYKYDS0hR46whnwxG5rEvpQ4Y47LbeBwjzsnFk9EzLBmjen
         WcPJeGZvum1a7i1hbjzbG88Sc4/1X5eIYrlinKO5pv/+bLR2sY34kl3nb3t9H+2DWQ5H
         SltViBitVFgvfAhLMkab35VLf38JwxF+yi279UnTQozuPuCzqY4I7egIPZf1sDmyYEbF
         2lfus8JT1t2ZjB9EdDN3Hjoef1rm4lP0BZziqnqZ3MA67BeHUt4JR1E8KPMCPPfiGZn5
         scxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709936870; x=1710541670;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9Cm+sjEP7eeQzRpM/dyVnRkWK0R2O4wf+q730ac8Fc=;
        b=blyCE2VTMhuVytw+Y9bVzg5YLIoalwtX+ii5/enuzNfxyqyT3mozv60LqPv/2xvw/x
         2FwABvQvDjbkbDv44PpqCvNL8pF7Za+B5lfpbzj/gTt8yrHkZapZ5GF7st6O82Xqf+Qe
         T5hGT7GE8UTF+tIUustRQkp7ky/yfO6pZM0WNyvy98mgcE0hka3h+E7V7YWwp8QEvwbv
         GtEWq98qvrsSxyl/Fp/Sfj7Mt8ZH0g/Hx6Q/lnYxnjHqatHPuKzxRk2eMe1W5eSKzwIv
         WPm9VOd4Pm1U/BGAuSAkGRylQqT4sQVcovQtr5F9q7QooRIrVere9bPxwP8kV0r/vqD9
         0kHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyng3TyWcJ5spBKvDEF4MXUgwWqlPI/EhceMFSosA+tKjcO9Cv0+GSigGEMmtPfPNvphItN7+JV+b6ktZ+75nSIZsqiPEatF4s
X-Gm-Message-State: AOJu0YyAAIklklP/VRzap+ViQxrkpeDcAQ2RxTaDpyoJFIw4TVm9jJWO
	bzv4R6biPTuhVi2D6ZGsc80bs096vd55ZjDU+DuUy4hGD0tpaYdN
X-Google-Smtp-Source: AGHT+IEefucnzeVaDrDXp7nL1ogp1q8ajUc4eKNA2EnYRvSPiplLYVDd8jWuXxI04LK1BlfLqEEo6A==
X-Received: by 2002:ac2:44c7:0:b0:513:202b:9001 with SMTP id d7-20020ac244c7000000b00513202b9001mr214641lfm.6.1709936869789;
        Fri, 08 Mar 2024 14:27:49 -0800 (PST)
Received: from localhost (cpc1-brnt4-2-0-cust862.4-2.cable.virginm.net. [86.9.131.95])
        by smtp.gmail.com with ESMTPSA id z2-20020a5d44c2000000b0033e2b9f647asm437822wrr.31.2024.03.08.14.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Mar 2024 14:27:48 -0800 (PST)
Date: Fri, 8 Mar 2024 22:27:48 +0000
From: Stafford Horne <shorne@gmail.com>
To: Oreoluwa Babatunde <quic_obabatun@quicinc.com>
Cc: chenhuacai@kernel.org, jonas@southpole.se,
	stefan.kristiansson@saunalahti.fi, ysato@users.sourceforge.jp,
	dalias@libc.org, glaubitz@physik.fu-berlin.de, robh+dt@kernel.org,
	frowand.list@gmail.com, linux-openrisc@vger.kernel.org,
	loongarch@lists.linux.dev, linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	kernel@quicinc.com
Subject: Re: [PATCH 2/3] openrisc: Call setup_memory() earlier in the init
 sequence
Message-ID: <ZeuQ5EFFCw3O8qkS@antec>
References: <1707524971-146908-1-git-send-email-quic_obabatun@quicinc.com>
 <1707524971-146908-3-git-send-email-quic_obabatun@quicinc.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1707524971-146908-3-git-send-email-quic_obabatun@quicinc.com>

On Fri, Feb 09, 2024 at 04:29:30PM -0800, Oreoluwa Babatunde wrote:
> The unflatten_and_copy_device_tree() function contains a call to
> memblock_alloc(). This means that memblock is allocating memory before
> any of the reserved memory regions are set aside in the setup_memory()
> function which calls early_init_fdt_scan_reserved_mem(). Therefore,
> there is a possibility for memblock to allocate from any of the
> reserved memory regions.
> 
> Hence, move the call to setup_memory() to be earlier in the init
> sequence so that the reserved memory regions are set aside before any
> allocations are done using memblock.
> 
> Signed-off-by: Oreoluwa Babatunde <quic_obabatun@quicinc.com>
> ---
>  arch/openrisc/kernel/setup.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/openrisc/kernel/setup.c b/arch/openrisc/kernel/setup.c
> index 9cf7fb6..be56eaa 100644
> --- a/arch/openrisc/kernel/setup.c
> +++ b/arch/openrisc/kernel/setup.c
> @@ -255,6 +255,9 @@ void calibrate_delay(void)
>  
>  void __init setup_arch(char **cmdline_p)
>  {
> +	/* setup memblock allocator */
> +	setup_memory();
> +
>  	unflatten_and_copy_device_tree();
>  
>  	setup_cpuinfo();
> @@ -278,9 +281,6 @@ void __init setup_arch(char **cmdline_p)
>  	}
>  #endif
>  
> -	/* setup memblock allocator */
> -	setup_memory();
> -
>  	/* paging_init() sets up the MMU and marks all pages as reserved */
>  	paging_init();

This looks good.  I will merge it via the openrisc queue as you requested.

-Stafford
