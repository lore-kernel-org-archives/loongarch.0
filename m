Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D693E2E03E4
	for <loongarch@lists.linux.dev>; Wed, 12 Nov 2025 23:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762991610; cv=none; b=t1gpEY2IjkOm5wRrmQiQ/N00Pwsr6XIL43Hsdk9YIhP2twoeae82jfOk4ZUXdS6D5WWlhTue17ILd0rLVwrH3QJAe1tl61gruAieprLHY8MsB4/H9BgvlD1dkuvGK+P1j0qoTzVHzIqX6IGMwnsEkrYy4JmRIqAbtoZ+IIYoSSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762991610; c=relaxed/simple;
	bh=1oh4kdyHSPaK+b9pJi2NRh2Nd8VTsArQsjrm7EcUryE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gSU3/rFKpMMLVaatVMiwglCY1i/dUKxe2mcPR5dEGBppgmpF9yylyA0Zac59J4E33wnYuKlNXAxakWI9bEqMK6sVy3JMVRbcIDu69Z5MgZhO80ojfD7c/g1VNFcb0FzBoNqq0a4SRT3SKVe1lH5afoPk6uEhxY0nxnOh1lk+ZH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DF9uTCgP; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DF9uTCgP"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7a9c64dfa6eso135255b3a.3
        for <loongarch@lists.linux.dev>; Wed, 12 Nov 2025 15:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762991608; x=1763596408; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lmmNifhpcubbDE9dZKiYrF4P2VKB8IFtV9YZ7wRcTbI=;
        b=DF9uTCgPdepCmA2sVNtLtdLeK9soKM/UH9wMpqHh1X/x9OZZv9UlCwcPL3I0B8gXvT
         /SQCz+L73bFUPBIomfYA1JazHTlicqIuQfRx0Az7Hk+Z817sd3g4QalkcUA8wJSwaXkt
         2VmKQUAdkborkXdZz8RgjErloebZ6eJoROP3lwFbBnOKXSauQPvJ+EmZOSXQHZAbu7qV
         QtB8gXdQsE7URNFEgG1lxfvD1XiFY2kbrVTEbsaqCOzVVXklWRddqL9ZYGaVYkGvxS0W
         zw38HjWPISh27C6u8C8vZ6OA0sM0mW/PaS1fTFpSCS1PzMYMokI/HlJJzcSPUQOfo1iF
         fi5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762991608; x=1763596408;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lmmNifhpcubbDE9dZKiYrF4P2VKB8IFtV9YZ7wRcTbI=;
        b=oOk/5RkDKHGM2h6rKCFSIqcK+I++/jRmZbvs3dOkSfXBECZ7MZWduRKKzn7VHxwAdF
         sGnV5M872cWs7ZRz/XbN6cPv2WMzlnLhGlSS19+puair5LVnVhGLXDnjyA4CTKtXlk9T
         9gvlSj9vOkpGJhK7hY+OBTIQJs2qFT+QrGQVoyfdT/mzBEYIBTK3xFUYXQhOi4L28Yvf
         LEuF3YEDzLBeyZHbllS9jbDaCUQahi3Ay2WSO9QSerY57RFgreUo5ZgpYFu52pZEulhc
         oweHZ8bHfZAk5MDUqJCG+MxeWITt4PiwExRXLHbNkTrmH6iLWMipo9VEiAmwp7nCXq6E
         X2QQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBmiiELXnW8PvsOO/QBCqjP9GODaPzVqTDMyuyeAFeo9GPxBbtsd5q7x5IKwx071CUfAuNQO+Kbh4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxFPswAweSKnduAQ8YpoWc74FNwgUE/xLZTJcyO1Q115XvQ4rss
	Hs1OTAlRiXRAD2sjT6MtwRiUlxVEW04ybp/EnFjU+7mrwlaBfwIJa2Bb
X-Gm-Gg: ASbGncs0G2XtlvzK3wrJnRHqo4vSMLF4BEwbtdK3LKR4UAEcQDxvRjdUFZbZlb0dBb+
	MIpeOKFg/9BR9nE5s/NqDOsgAWlNdViF2hADj/SK/HVOUKyMbDpsxBPGzX1JLP6R4DBwHgmtZ3e
	LkyJy04FAk7uz63mwQAZNLH9L0q4ptp//9y/BaXpSdQlz+mZ6WYa4o3W5WbuZ7wJ3rISbu5qSZh
	53D2rGAJNdlSLs+Ur9rUTQKca4rYlGO8mb8M3HUCU7HmeDTMRj0LEGcfEVbayhbFvheWaf1xKWt
	F5HoX5iOYxxyFwbgk1Jjg3h4UkHjnkHbwpTjq5n3obgatOwPzM6wl2hb4c4V3qM1IYBt4C50lAS
	qnKFWkMvksmvHk/AbYEwqsw3/G1oTYYv42JJB8zfDPxVxoHWaGA3SK6Qg282Ftn8NEuRKolnsvI
	jQrqO1pB2iBCnq
X-Google-Smtp-Source: AGHT+IFgjVC8Vixif7sXqQSZ4rTFRseItczPfc0Wpwx5dz8YYT2ndmfeYyeuO2aXuPaCsvXZJFRH2A==
X-Received: by 2002:a05:6a00:1815:b0:781:17ee:602 with SMTP id d2e1a72fcca58-7b7a4edfca8mr6079755b3a.28.1762991607917;
        Wed, 12 Nov 2025 15:53:27 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b924aee8afsm218358b3a.8.2025.11.12.15.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 15:53:27 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 12 Nov 2025 15:53:26 -0800
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
Subject: Re: [PATCH v2 1/5] watchdog: loongson1: Add missing MODULE_PARM_DESC
Message-ID: <aa2ec413-628b-4690-84f3-03ac1c435ffc@roeck-us.net>
References: <cover.1762482089.git.zhoubinbin@loongson.cn>
 <707bfcf1a45008ecf5c8d517430332a66d4ee758.1762482089.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <707bfcf1a45008ecf5c8d517430332a66d4ee758.1762482089.git.zhoubinbin@loongson.cn>

On Fri, Nov 07, 2025 at 02:01:27PM +0800, Binbin Zhou wrote:
> Add documentation for module_param so that they're visible with
> modinfo command.
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/loongson1_wdt.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/loongson1_wdt.c b/drivers/watchdog/loongson1_wdt.c
> index 0587ff44d3a1..8502263b0d6f 100644
> --- a/drivers/watchdog/loongson1_wdt.c
> +++ b/drivers/watchdog/loongson1_wdt.c
> @@ -18,10 +18,14 @@
>  #define DEFAULT_HEARTBEAT	30
>  
>  static bool nowayout = WATCHDOG_NOWAYOUT;
> -module_param(nowayout, bool, 0444);
> +module_param(nowayout, bool, 0);
> +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
> +		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>  
>  static unsigned int heartbeat;
> -module_param(heartbeat, uint, 0444);
> +module_param(heartbeat, uint, 0);
> +MODULE_PARM_DESC(heartbeat, "Watchdog heartbeat in seconds. (default="
> +		 __MODULE_STRING(DEFAULT_HEARTBEAT) ")");
>  
>  struct ls1x_wdt_drvdata {
>  	void __iomem *base;
> -- 
> 2.47.3
> 
