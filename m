Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934A9221F09
	for <loongarch@lists.linux.dev>; Mon, 21 Jul 2025 23:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753138807; cv=none; b=P2Gs9EVQwkDfbwgQlRs0QmCblqPaGR7RSu576zNqY0AGmfdWfsPp1QUH7yX4JuFFUs9YqyTGbXoj8QY5oVUVjEcatw/rlLw/PAkIIsP24OnIcPytllqRqPLnlSmjtFatHdFQzjGgN/6q9UHh7WERpU7akEeLkzaYfMTrEVPFTgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753138807; c=relaxed/simple;
	bh=Z4t0N4zJtY+ZALM0nLgOvZ3qBtBlLR+k/znNuxMGyCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UJBnf2zTxuAPFdBNRSLvq/3epC0IYFihVpbSaQIFacmcNyMo/nwM1kn6iSXGy8aKjcdT9oqAmxFIb7SfUOTjW4cYNEozru1tsvyhp+ymZHvNwhSdCFaXkfTJIKphb5vISrwhx8GpNMMRyUJzeJ6gTedn8sLG4QN4xWiUq7e0lWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m/7U4B+2; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m/7U4B+2"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ae34f43be56so98185366b.2
        for <loongarch@lists.linux.dev>; Mon, 21 Jul 2025 16:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753138803; x=1753743603; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/MErh+IJZfEbaFHl36LqhlLVHvlXTKmbu8riveWqw+Q=;
        b=m/7U4B+2lPO7IYR0Cyb6O94bqPYIm6VYgM8SMdzEij7uMECMMGp5f9doOTqTyj7NDM
         apDlxWmvTe1kOb3W+IV4eulhDyiKUyXwR6lFX4xXc2+jS0NsJw+mBMtq3/9MWaHSnGKl
         R6/Oo3D7aKy3DJ1fvAdi8gO4TS73jh4Wi6eZV1dVAmMG4JOWgEqxFQt6QFIhWUfc3HBh
         6XrMzpFAeoNUXs/DWhV2F05X3F28MhSFTb6f00ATijaxORk5Jyt7Z+DwQ3w004ekYGVE
         JuySa+qxsPppQg1/vVjrhgOSUasjKRpkMsRQ6FeQqSVVv4zesuYs9FJ8taF3FzRtuo0B
         UtSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753138803; x=1753743603;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/MErh+IJZfEbaFHl36LqhlLVHvlXTKmbu8riveWqw+Q=;
        b=iunMFKfxHOXqYtMG4VJ41guRd/a8dMFe/fb2KXFPg1CME87qcxBpdjRdx6lEP7rtAC
         ubvZCheWc3qWiklColM8FkkON9MIqtNF2PDPF9Bv23HzZTR2RZKhwIbk5sNcokWP3Dyy
         OL7fjFw6GO8MRb/fcglZVmCEeGtzowVPiMka5C7IhFXmo42BmEu2TH7YXfdvO5gclCzK
         07abP+WNL1Al2jMocyQeWRDq+dgi4kzfwcw4RJvErvx9CXaQV+8u3X3dVipFP2qWeMKU
         ForVSK9lnf3UUbZKw4o7SOr6b8+R/UiWCIbqRBWay9U3Hn9o/G4haQvIvm1pr7WtiCvK
         hc+A==
X-Forwarded-Encrypted: i=1; AJvYcCXV5eqip2Pgow1hYFCkiGbZjP8uRQHNFzrYzmRxu4GrhJvJMlNFbYG5wSzQvoFU9IO06w5pVbRFhl8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzV7mHJoEEFhHg78Q/mHa6QM7oOtAzpuvXnL9pqYPv8QGp4fJ8R
	pmcfM//+FKLEkQ0GeSGKuIuGI308PzfASADuNWfdZBEpYATXTK+xg/Sm
X-Gm-Gg: ASbGncsP/hN8YKBVszK/Kywf+XgKk/gL9JkUoebgtWHGR6RFXrYZrXXDeEYQTqaOqh9
	9o6GpstoSGsSgFHcbvbzhmSO18gle9uwai/oWya1uJWqKym2RsfLtMBaV2AS69PshoRC8U2JknU
	4CtryZ8eduaD6jxiUYfFOa7FqSW4sdD7S9hTPAze4BK3+xnYOiheRAkWdvN17xOJTr7EbhOm2iZ
	kOxYdM8P6OaEazUZE4c6ulvi1ecbnYGKEAT4qOTlJl+xB98l4ghA2IoLIwjk5B/wcRzvw9CD0MS
	Q5/fM0IJQBmh2jXiLFgbKvaqr8tqlbYWyjTgBj7S5zH6fROT96J5DkRKNAu7zAbyMd0zvGBrydO
	UlLrsOpWBVmptCHBhEjw3XGTwpZEy5r/WVvhFx7jcy65IkMkYazBlQ+3ohbuju1XsW5+P
X-Google-Smtp-Source: AGHT+IFhWRkAjq0kp3rYVJajv166B7T+5igJwYiG9mr5QC8ggMyhPPllogHKb3eusDQL2P7c9HNNmg==
X-Received: by 2002:a05:6402:3582:b0:612:b0d9:3969 with SMTP id 4fb4d7f45d1cf-612b0d93f03mr5896945a12.8.1753138802656;
        Mon, 21 Jul 2025 16:00:02 -0700 (PDT)
Received: from [192.168.0.18] (cable-94-189-142-142.dynamic.sbb.rs. [94.189.142.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612c8f543ddsm5962670a12.30.2025.07.21.16.00.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 16:00:01 -0700 (PDT)
Message-ID: <8f93322a-84c1-402b-b8d4-9c66a2b07b0b@gmail.com>
Date: Tue, 22 Jul 2025 00:59:41 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/12] kasan: unify static kasan_flag_enabled across
 modes
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>, hca@linux.ibm.com,
 christophe.leroy@csgroup.eu, andreyknvl@gmail.com, agordeev@linux.ibm.com,
 akpm@linux-foundation.org
Cc: glider@google.com, dvyukov@google.com, kasan-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org
References: <20250717142732.292822-1-snovitoll@gmail.com>
 <20250717142732.292822-3-snovitoll@gmail.com>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <20250717142732.292822-3-snovitoll@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/17/25 4:27 PM, Sabyrzhan Tasbolatov wrote:
> Historically, the runtime static key kasan_flag_enabled existed only for
> CONFIG_KASAN_HW_TAGS mode. Generic and SW_TAGS modes either relied on
> architecture-specific kasan_arch_is_ready() implementations or evaluated
> KASAN checks unconditionally, leading to code duplication.
> 
> This patch implements two-level approach:
> 
> 1. kasan_enabled() - controls if KASAN is enabled at all (compile-time)
> 2. kasan_shadow_initialized() - tracks shadow memory
>    initialization (runtime)
> 
> For architectures that select ARCH_DEFER_KASAN: kasan_shadow_initialized()
> uses a static key that gets enabled when shadow memory is ready.
> 
> For architectures that don't: kasan_shadow_initialized() returns
> IS_ENABLED(CONFIG_KASAN) since shadow is ready from the start.
> 
> This provides:
> - Consistent interface across all KASAN modes
> - Runtime control only where actually needed
> - Compile-time constants for optimal performance where possible
> - Clear separation between "KASAN configured" vs "shadow ready"
> 
> Also adds kasan_init_generic() function that enables the shadow flag and
> handles initialization for Generic mode, and updates SW_TAGS and HW_TAGS
> to use the unified kasan_shadow_enable() function.
> 
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
> Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
> ---
> Changes in v3:
> - Only architectures that need deferred KASAN get runtime overhead
> - Added kasan_shadow_initialized() for shadow memory readiness tracking
> - kasan_enabled() now provides compile-time check for KASAN configuration
> ---
>  include/linux/kasan-enabled.h | 34 ++++++++++++++++++++++++++--------
>  include/linux/kasan.h         |  6 ++++++
>  mm/kasan/common.c             |  9 +++++++++
>  mm/kasan/generic.c            | 11 +++++++++++
>  mm/kasan/hw_tags.c            |  9 +--------
>  mm/kasan/sw_tags.c            |  2 ++
>  6 files changed, 55 insertions(+), 16 deletions(-)
> 
> diff --git a/include/linux/kasan-enabled.h b/include/linux/kasan-enabled.h
> index 6f612d69ea0..fa99dc58f95 100644
> --- a/include/linux/kasan-enabled.h
> +++ b/include/linux/kasan-enabled.h
> @@ -4,32 +4,50 @@
>  
>  #include <linux/static_key.h>
>  
> -#ifdef CONFIG_KASAN_HW_TAGS
> +/* Controls whether KASAN is enabled at all (compile-time check). */
> +static __always_inline bool kasan_enabled(void)
> +{
> +	return IS_ENABLED(CONFIG_KASAN);
> +}
>  
> +#ifdef CONFIG_ARCH_DEFER_KASAN
> +/*
> + * Global runtime flag for architectures that need deferred KASAN.
> + * Switched to 'true' by the appropriate kasan_init_*()
> + * once KASAN is fully initialized.
> + */
>  DECLARE_STATIC_KEY_FALSE(kasan_flag_enabled);
>  
> -static __always_inline bool kasan_enabled(void)
> +static __always_inline bool kasan_shadow_initialized(void)
>  {
>  	return static_branch_likely(&kasan_flag_enabled);
>  }
>  
> -static inline bool kasan_hw_tags_enabled(void)
> +static inline void kasan_enable(void)
> +{
> +	static_branch_enable(&kasan_flag_enabled);
> +}
> +#else
> +/* For architectures that can enable KASAN early, use compile-time check. */
> +static __always_inline bool kasan_shadow_initialized(void)
>  {
>  	return kasan_enabled();
>  }
>  
> -#else /* CONFIG_KASAN_HW_TAGS */
> +/* No-op for architectures that don't need deferred KASAN. */
> +static inline void kasan_enable(void) {}
> +#endif /* CONFIG_ARCH_DEFER_KASAN */
>  
> -static inline bool kasan_enabled(void)
> +#ifdef CONFIG_KASAN_HW_TAGS
> +static inline bool kasan_hw_tags_enabled(void)
>  {
> -	return IS_ENABLED(CONFIG_KASAN);
> +	return kasan_enabled();
>  }
> -
> +#else
>  static inline bool kasan_hw_tags_enabled(void)
>  {
>  	return false;
>  }
> -
>  #endif /* CONFIG_KASAN_HW_TAGS */
>  
>  #endif /* LINUX_KASAN_ENABLED_H */
> diff --git a/include/linux/kasan.h b/include/linux/kasan.h
> index 890011071f2..51a8293d1af 100644
> --- a/include/linux/kasan.h
> +++ b/include/linux/kasan.h
> @@ -543,6 +543,12 @@ void kasan_report_async(void);
>  
>  #endif /* CONFIG_KASAN_HW_TAGS */
>  
> +#ifdef CONFIG_KASAN_GENERIC
> +void __init kasan_init_generic(void);
> +#else
> +static inline void kasan_init_generic(void) { }
> +#endif
> +
>  #ifdef CONFIG_KASAN_SW_TAGS
>  void __init kasan_init_sw_tags(void);
>  #else
> diff --git a/mm/kasan/common.c b/mm/kasan/common.c
> index ed4873e18c7..c3a6446404d 100644
> --- a/mm/kasan/common.c
> +++ b/mm/kasan/common.c
> @@ -32,6 +32,15 @@
>  #include "kasan.h"
>  #include "../slab.h"
>  
> +#ifdef CONFIG_ARCH_DEFER_KASAN
> +/*
> + * Definition of the unified static key declared in kasan-enabled.h.
> + * This provides consistent runtime enable/disable across KASAN modes.
> + */
> +DEFINE_STATIC_KEY_FALSE(kasan_flag_enabled);
> +EXPORT_SYMBOL(kasan_flag_enabled);
> +#endif
> +
>  struct slab *kasan_addr_to_slab(const void *addr)
>  {
>  	if (virt_addr_valid(addr))
> diff --git a/mm/kasan/generic.c b/mm/kasan/generic.c
> index d54e89f8c3e..03b6d322ff6 100644
> --- a/mm/kasan/generic.c
> +++ b/mm/kasan/generic.c
> @@ -36,6 +36,17 @@
>  #include "kasan.h"
>  #include "../slab.h"
>  
> +/*
> + * Initialize Generic KASAN and enable runtime checks.
> + * This should be called from arch kasan_init() once shadow memory is ready.
> + */
> +void __init kasan_init_generic(void)
> +{
> +	kasan_enable();
> +
> +	pr_info("KernelAddressSanitizer initialized (generic)\n");
> +}
> +
>  /*
>   * All functions below always inlined so compiler could
>   * perform better optimizations in each of __asan_loadX/__assn_storeX
> diff --git a/mm/kasan/hw_tags.c b/mm/kasan/hw_tags.c
> index 9a6927394b5..c8289a3feab 100644
> --- a/mm/kasan/hw_tags.c
> +++ b/mm/kasan/hw_tags.c
> @@ -45,13 +45,6 @@ static enum kasan_arg kasan_arg __ro_after_init;
>  static enum kasan_arg_mode kasan_arg_mode __ro_after_init;
>  static enum kasan_arg_vmalloc kasan_arg_vmalloc __initdata;
>  
> -/*
> - * Whether KASAN is enabled at all.
> - * The value remains false until KASAN is initialized by kasan_init_hw_tags().
> - */
> -DEFINE_STATIC_KEY_FALSE(kasan_flag_enabled);
> -EXPORT_SYMBOL(kasan_flag_enabled);
> -
>  /*
>   * Whether the selected mode is synchronous, asynchronous, or asymmetric.
>   * Defaults to KASAN_MODE_SYNC.
> @@ -260,7 +253,7 @@ void __init kasan_init_hw_tags(void)
>  	kasan_init_tags();
>  
>  	/* KASAN is now initialized, enable it. */
> -	static_branch_enable(&kasan_flag_enabled);
> +	kasan_enable();
>  

This is obviously broken for the HW_TAGS case. kasan_enable() does nothing,
and kasan_hw_tags_enabled() now always return true.
