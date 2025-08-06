Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F6428B516
	for <loongarch@lists.linux.dev>; Wed,  6 Aug 2025 13:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754487308; cv=none; b=FDdWv7LLrK+pnbfMc/jvRmq7UE2igqQ2Wp/Y94Lt3reUqTu+gTEt/bNy29tWv+RGJ7kH1QA/FPeOTEnfTetYoHyPAj/e9UsR795dM0t+58UcOaqrU/8//NDOOoTXBxMCju5fI11w2VetQmHSpB6fpsYVVfVK3NuqXVn1udLGxYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754487308; c=relaxed/simple;
	bh=4pdWS84KRZO1SXuKgGgyD1aaqPQhqa/LVwQApBfPiyk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C7Yj6F8X5tL6hzN9EMZgPwIablReKYCmpnHWtekEW5rZKdA+NStw5RHMzLhSC7B7/QqzsOx6toMMYbRinihR2zdTbsZEKENZ7gB9Eo97YUstmMJp1NMRcBbLzVjH5P1GDJzbGi3NohX8gj6lKk7qyRpgv87EPlKkjX0KGrb1f/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R37H9WYG; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R37H9WYG"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-55ba2644bdaso562222e87.0
        for <loongarch@lists.linux.dev>; Wed, 06 Aug 2025 06:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754487304; x=1755092104; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GkBywKSK+jarcaDEWkMpZ6690o3qyLvHV2Ljs5N+BnY=;
        b=R37H9WYGGzcst0uq9tcKOiFF25KCRMvWsM05lQL/ro9b+knqfx9b6fYtJ2vGs9F98o
         50uWjYD6mNc2NLqs6qbpg6QAWj9ti6tnBJLtn2Bg8DE8sZYs3bu2kWGx/sIVgWeNCM9w
         qJt/bmwtq+QQSKLlXDAhRsLFhichFz9dkjyF1iSFklq/MZYiTey9K5Q87lA/kpunZScg
         rGG/oxgsZBkRdb1l9nY9v0BXrCC4gAG/7aeeht+Db8Z5IiJxtK4gXfcHgMaCS+iuoouQ
         BxzqW9G2KLnFXUKVvNTglMSSzJCWoRenKC5XbqmSvbJlZ7u6N/YbRkJlzuo6td/IY60S
         Leaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754487304; x=1755092104;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GkBywKSK+jarcaDEWkMpZ6690o3qyLvHV2Ljs5N+BnY=;
        b=P0HN0rC6HyBx8RttSG7waM3n1ZuZhqGd/kdrqSb2RfsV65Z2cKjK6b7lMosRzrSo7C
         Sviili2EMndEpbsP9NsuZJ5bTLq984ymYq48aYCUAWNJtuwRstEwMDhuqyIHCnOb648J
         v+eDMQjjRnDhRitgOCpam99g/8Y1xYoKGZGOaw+fRIMH9lNkfGCeKa926KzktQcDsvcv
         pZoe6OdvYKPPQilDgPPpXsZ+h6e/R65Ra7xyPFDq8VYe5f41KgyV8Xsuo/KReNJHf21/
         KryAg0xOGCuXU7wXgVNTUdFQv/PTw6Qrrw7aR1aBkKF5EyMzeSaoMHoipfum0gvpPYXN
         Xd8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXfYKigm/AkX2GBCmR7VaEicQjtX5jtaQsJ3Cpu1P6z8zZ2raR09re2lQpp1ZZZsB/j112m3CzFWU0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwfujvkIBg4209EibTvOQz8Nd2E/HrBL3pyCQhsxvSPtz9g46l6
	SETpTTOKFyHFwZrrYzAI9mrVb62/0UCMfF5UtIsxOZKKjHOkV1INe+fa
X-Gm-Gg: ASbGncstHopYFkiX0SjLDLd6m5Wr9liVCQ5a/yBJt9J+3Sfb+f9yiknxgENP2Kxe9EL
	bALL1C/HnRDRq0lwKTd9TsCUkKxprBY+iOu4aC3IBBui7URDCM1y8RJLOhZBM8IpHm09uvwvMRE
	IeEC5i+qbYHT9VXYmjA8/MHY4GI+HsGNSqdDrGICwUm13VekK1u1to0OblPdMh3FbEdbK0A3mqI
	IUh/qwba5n1s5daYrkG6NLP3ZcJd79FlBvrIXrsuLB841g5vL7CXuTO2eKiLh2eo4+QvoK+CvtF
	mxnprTuhRJBojvy8FosC68WW3Z+Uah8dgrncssqmVAgN5Hue8aoVfw2q+XpeVmECD/ZSev/PlMK
	MMPWFgiRUmVrqxApY+28E9rLTNgDB
X-Google-Smtp-Source: AGHT+IG/+xV14jPScIlu8zUGGDD+ajQ7/dFSreWgfNZ5pS9U8lvRiqBw989XNjNOSP9y7GWZ8ScIMA==
X-Received: by 2002:a05:6512:ad1:b0:55a:4d9e:6536 with SMTP id 2adb3069b0e04-55caf2f956dmr417291e87.2.1754487304191;
        Wed, 06 Aug 2025 06:35:04 -0700 (PDT)
Received: from [10.214.35.248] ([80.93.240.68])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b8899ebd2sm2302283e87.42.2025.08.06.06.35.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 06:35:03 -0700 (PDT)
Message-ID: <5a73e633-a374-47f2-a1e1-680e24d9f260@gmail.com>
Date: Wed, 6 Aug 2025 15:34:15 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] kasan: introduce ARCH_DEFER_KASAN and unify static
 key across modes
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>, hca@linux.ibm.com,
 christophe.leroy@csgroup.eu, andreyknvl@gmail.com, agordeev@linux.ibm.com,
 akpm@linux-foundation.org, zhangqing@loongson.cn, chenhuacai@loongson.cn,
 trishalfonso@google.com, davidgow@google.com
Cc: glider@google.com, dvyukov@google.com, kasan-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org
References: <20250805142622.560992-1-snovitoll@gmail.com>
 <20250805142622.560992-2-snovitoll@gmail.com>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <20250805142622.560992-2-snovitoll@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/5/25 4:26 PM, Sabyrzhan Tasbolatov wrote:
> Introduce CONFIG_ARCH_DEFER_KASAN to identify architectures that need
> to defer KASAN initialization until shadow memory is properly set up,
> and unify the static key infrastructure across all KASAN modes.
> 
> Some architectures (like PowerPC with radix MMU) need to set up their
> shadow memory mappings before KASAN can be safely enabled, while others
> (like s390, x86, arm) can enable KASAN much earlier or even from the
> beginning.
> 
> Historically, the runtime static key kasan_flag_enabled existed only for
> CONFIG_KASAN_HW_TAGS mode. Generic and SW_TAGS modes either relied on
> architecture-specific kasan_arch_is_ready() implementations or evaluated
> KASAN checks unconditionally, leading to code duplication.
> 
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
> Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
> ---
> Changes in v4:
> - Fixed HW_TAGS static key functionality (was broken in v3)

I don't think it fixed. Before you patch kasan_enabled() esentially
worked like this:

 if (IS_ENABLED(CONFIG_KASAN_HW_TAGS))
        return static_branch_likely(&kasan_flag_enabled);
 else
        return IS_ENABLED(CONFIG_KASAN);

Now it's just IS_ENABLED(CONFIG_KASAN);

And there are bunch of kasan_enabled() calls left whose behavior changed for
no reason.


> - Merged configuration and implementation for atomicity
> ---
>  include/linux/kasan-enabled.h | 36 +++++++++++++++++++++++-------
>  include/linux/kasan.h         | 42 +++++++++++++++++++++++++++--------
>  lib/Kconfig.kasan             |  8 +++++++
>  mm/kasan/common.c             | 18 ++++++++++-----
>  mm/kasan/generic.c            | 23 +++++++++++--------
>  mm/kasan/hw_tags.c            |  9 +-------
>  mm/kasan/kasan.h              | 36 +++++++++++++++++++++---------
>  mm/kasan/shadow.c             | 32 ++++++--------------------
>  mm/kasan/sw_tags.c            |  4 +++-
>  mm/kasan/tags.c               |  2 +-
>  10 files changed, 133 insertions(+), 77 deletions(-)
> 
> diff --git a/include/linux/kasan-enabled.h b/include/linux/kasan-enabled.h
> index 6f612d69ea0..52a3909f032 100644
> --- a/include/linux/kasan-enabled.h
> +++ b/include/linux/kasan-enabled.h
> @@ -4,32 +4,52 @@
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
> +#if defined(CONFIG_ARCH_DEFER_KASAN) || defined(CONFIG_KASAN_HW_TAGS)
> +/*
> + * Global runtime flag for KASAN modes that need runtime control.
> + * Used by ARCH_DEFER_KASAN architectures and HW_TAGS mode.
> + */
>  DECLARE_STATIC_KEY_FALSE(kasan_flag_enabled);
>  
> -static __always_inline bool kasan_enabled(void)
> +/*
> + * Runtime control for shadow memory initialization or HW_TAGS mode.
> + * Uses static key for architectures that need deferred KASAN or HW_TAGS.
> + */
> +static __always_inline bool kasan_shadow_initialized(void)

Don't rename it, just leave as is - kasan_enabled().
It's better name, shorter and you don't need to convert call sites, so
there is less chance of mistakes due to unchanged kasan_enabled() -> kasan_shadow_initialized().


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

...

>  
>  void kasan_populate_early_vm_area_shadow(void *start, unsigned long size);
> -int kasan_populate_vmalloc(unsigned long addr, unsigned long size);
> -void kasan_release_vmalloc(unsigned long start, unsigned long end,
> +
> +int __kasan_populate_vmalloc(unsigned long addr, unsigned long size);
> +static inline int kasan_populate_vmalloc(unsigned long addr, unsigned long size)
> +{
> +	if (!kasan_shadow_initialized())
> +		return 0;


What's the point of moving these checks to header?
Leave it in C, it's easier to grep and navigate code this way.


> +	return __kasan_populate_vmalloc(addr, size);
> +}
> +
> +void __kasan_release_vmalloc(unsigned long start, unsigned long end,
>  			   unsigned long free_region_start,
>  			   unsigned long free_region_end,
>  			   unsigned long flags);
> +static inline void kasan_release_vmalloc(unsigned long start,
> +			   unsigned long end,
> +			   unsigned long free_region_start,
> +			   unsigned long free_region_end,
> +			   unsigned long flags)
> +{
> +	if (kasan_shadow_initialized())
> +		__kasan_release_vmalloc(start, end, free_region_start,
> +			   free_region_end, flags);
> +}
>  

...> @@ -250,7 +259,7 @@ static inline void poison_slab_object(struct kmem_cache *cache, void *object,
>  bool __kasan_slab_pre_free(struct kmem_cache *cache, void *object,
>  				unsigned long ip)
>  {
> -	if (!kasan_arch_is_ready() || is_kfence_address(object))
> +	if (is_kfence_address(object))
>  		return false;
>  	return check_slab_allocation(cache, object, ip);
>  }
> @@ -258,7 +267,7 @@ bool __kasan_slab_pre_free(struct kmem_cache *cache, void *object,
>  bool __kasan_slab_free(struct kmem_cache *cache, void *object, bool init,
>  		       bool still_accessible)
>  {
> -	if (!kasan_arch_is_ready() || is_kfence_address(object))
> +	if (is_kfence_address(object))
>  		return false;
>  
>  	poison_slab_object(cache, object, init, still_accessible);
> @@ -282,9 +291,6 @@ bool __kasan_slab_free(struct kmem_cache *cache, void *object, bool init,
>  
>  static inline bool check_page_allocation(void *ptr, unsigned long ip)
>  {
> -	if (!kasan_arch_is_ready())
> -		return false;
> -


Well, you can't do this yet, because no arch using ARCH_DEFER_KASAN yet, so this breaks
bisectability.
Leave it, and remove with separate patch only when there are no users left.

>  	if (ptr != page_address(virt_to_head_page(ptr))) {
>  		kasan_report_invalid_free(ptr, ip, KASAN_REPORT_INVALID_FREE);
>  		return true;
> @@ -511,7 +517,7 @@ bool __kasan_mempool_poison_object(void *ptr, unsigned long ip)
>  		return true;
>  	}
>  
> -	if (is_kfence_address(ptr) || !kasan_arch_is_ready())
> +	if (is_kfence_address(ptr))
>  		return true;
>  
>  	slab = folio_slab(folio);


