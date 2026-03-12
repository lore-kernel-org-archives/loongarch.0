Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E000B39936F
	for <loongarch@lists.linux.dev>; Thu, 12 Mar 2026 12:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773320028; cv=none; b=Z5BVA/YkUWAsKZZHPRPrsjIhtcXwZgBPp07LOTXsxp4wvhpZKenhfUpzxkRVhle+9BOlgoTKdraq2sYwf9wQkhyGIhhTp5S2LVLWnlHYno0GGH5pmowJ5AYGMaN5cCA4jJpN6n7k8BbcFAtBUGSnjxgG3h1x49aCvaxzUMldBV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773320028; c=relaxed/simple;
	bh=C8Tmx+wVgPaQO3SA5g1GPxNl28HZYA6VUhyX4LUkXAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mwd+TLe5NVkf3Rz/Z4nLvuEjTDcDe+bafwgjasUVJu0pty/6IxWmAOCMzZ6tRKNDo4vnhSz0C07NK+2oJqHABpj9xi+1rm+NAUxmHb3/A3dAhHsjLzot6U37JOJHc0SBDXfk88Lo/GgBIEFIoFxDQ1cJ82d0rJLA7dejzC4jI/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=NzLKp1qc; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="NzLKp1qc"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-40ef10ec84cso666900fac.2
        for <loongarch@lists.linux.dev>; Thu, 12 Mar 2026 05:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1773320025; x=1773924825; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ky7U0hmCeNi6OyUrf2MxogfDAlaxZWXxIQIvc2Y9k8Y=;
        b=NzLKp1qcJECyXZP5TibRb1PvnY70VCaUHd3adNLJYmI6XvMeH+XjOHXBB/DwPEJnG1
         ZKFdaHGJawnRJCxO3a+rOB+oOXOQKc3dgdOSQq5XWMW58nSuwET1ngZXHPw3I7hkpFPv
         wOQ4ui6vADWHsPAN2/eenQMVfQNTo7rOQ3XcCjmomzOIDFLe/Y1Sype2OQgecRs9juY3
         N24SytDT+ZKAMvCiON0KiSFD1OVlIEbBvHUZJOgsPe+amvD+TpnJ4I8TfhaLailmzygG
         LXPnDmNtFsvp7QrSHF1EA8ihMgoEpDtgp8vNkPkaoJssKqJ/CXtvtEz0F5RPYAA7xc6j
         0RCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773320025; x=1773924825;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ky7U0hmCeNi6OyUrf2MxogfDAlaxZWXxIQIvc2Y9k8Y=;
        b=kJUK+XK7MIn4i5ZKhjRU4TqtAaJztnCi83JV+Tvn7zhkEEOjRdfkrSNsPfX1fpTOqQ
         kqFG943wuReY2ZsUZtvGIMfLJZEWKbrh5QE8aCQpTh/If12crRximoyevkPoK1lREJZL
         noSy//rEMij2mcibUl9pgPl7kh0NmLMyugRtRnE0H46KUuKlzpx8Qi5oRmEgmCSNd0LS
         03Tf92z1L7+Kw3wvEhgQRgYPs3GfnQgAm94R6aineeus/t8VOmO4ftX77WUbF2sfJLyJ
         8QO+3w6h7E8ghMIt5PfwmlR71qim/kTak/WN+9v+qoyyzhgtJvP3V9crfI60K9fLM4oL
         CGuA==
X-Forwarded-Encrypted: i=1; AJvYcCW8/ktWBgLIhhxxhjV7XeO4Vzgna0EdAM3F4pLa2uCCTnWReBnnxGzQgVJ2T4U2AzCI5w5REtTohB8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwanKuh5vA20o5NQvMy+TrzHKAP57I06PtF+uyD3nrb4EHTy9NT
	tOHDh+hXUsQMF0qOGi+SPOTLHR0X5kozxhrT0qZmr9/VG5j6TvRF2UkptcuyTVGWoNI=
X-Gm-Gg: ATEYQzx4i23tRMkMEXRtYmFCvrOOYsl2NkykDJF12QLO8ycYtid72HvhBAseSmYtREV
	7coyXuo8KFdaGsdeO8M2baFco5cXgGRrZxodnCfJOiYAUQpmEOqb5cxACoxNSTxQe2IRsgxmTLG
	VjBeKXS011WeapYXIaoFmJLk2536ZGrNkodfKe+IFtpyul6gyimkSEF+WqVmdgbz/y+F/qsYxTX
	Lp8LPbYDmOB/Sy977QR2rQU9xuUVJ7neQXJeolf5nT8Oo5XvpJGEBby6/sMHjwiEh44uOuQt6/2
	aQX4nk40kfHCHIlWsqZQ5yv0/DRayFFJQXw94E6qwe/VqVZ6c0Tbdr3A+52SaLnL2SRJB5t+4dl
	NwXiZAtryY7peXqHyMCbPUaA3xo6ddff3KzY4z+RftUjzB4GPHJv+ViKO4ictwpEOgEQp2Avd01
	YMoamHYqeOJLaYAgHoXkI8lfnv9Ve0Cu4Q+W+HQwk=
X-Received: by 2002:a05:6870:649f:b0:409:74c7:1cbb with SMTP id 586e51a60fabf-4177c6f1d08mr3392540fac.7.1773320024820;
        Thu, 12 Mar 2026 05:53:44 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.103.0])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41791432d87sm3765785fac.1.2026.03.12.05.53.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 05:53:44 -0700 (PDT)
Message-ID: <f7054184-dca2-4c7c-9e2e-4a5e3e1c81da@sifive.com>
Date: Thu, 12 Mar 2026 07:53:42 -0500
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/15] mm/kasan: add document into
 kernel-parameters.txt
To: Baoquan He <bhe@redhat.com>, kasan-dev@googlegroups.com
Cc: linux-mm@kvack.org, andreyknvl@gmail.com, ryabinin.a.a@gmail.com,
 glider@google.com, dvyukov@google.com, linux-kernel@vger.kernel.org,
 linux-um@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, x86@kernel.org, chris@zankel.net,
 jcmvbkbc@gmail.com, linux-s390@vger.kernel.org, hca@linux.ibm.com
References: <20260225081412.76502-1-bhe@redhat.com>
 <20260225081412.76502-15-bhe@redhat.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20260225081412.76502-15-bhe@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Baoquan,

On 2026-02-25 2:14 AM, Baoquan He wrote:
> And also remove the relevant description in dev-tools/kasan.rst
> which is hw_tags specificially.
> 
> Signed-off-by: Baoquan He <bhe@redhat.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 4 ++++
>  Documentation/dev-tools/kasan.rst               | 2 --
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index cb850e5290c2..e0115fad9e60 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -2899,6 +2899,10 @@ Kernel parameters
>  	js=		[HW,JOY] Analog joystick
>  			See Documentation/input/joydev/joystick.rst.
>  
> +	kasan=		[KNL] controls whether KASAN is enabled.
> +			Format: off | on
> +			default: on
> +
>  	kasan_multi_shot
>  			[KNL] Enforce KASAN (Kernel Address Sanitizer) to print
>  			report on every invalid memory access. Without this
> diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
> index a034700da7c4..eaae83fcb5e4 100644
> --- a/Documentation/dev-tools/kasan.rst
> +++ b/Documentation/dev-tools/kasan.rst
> @@ -129,8 +129,6 @@ Hardware Tag-Based KASAN mode is intended for use in production as a security
>  mitigation. Therefore, it supports additional boot parameters that allow
>  disabling KASAN altogether or controlling its features:

The sentence above is now incorrect as well. I would recommend documenting the
parameter earlier in the "Boot parameters" section instead of removing it from
this document entirely.

Regards,
Samuel

>  
> -- ``kasan=off`` or ``=on`` controls whether KASAN is enabled (default: ``on``).
> -
>  - ``kasan.mode=sync``, ``=async`` or ``=asymm`` controls whether KASAN
>    is configured in synchronous, asynchronous or asymmetric mode of
>    execution (default: ``sync``).

