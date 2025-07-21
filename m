Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68660248F62
	for <loongarch@lists.linux.dev>; Mon, 21 Jul 2025 23:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753138827; cv=none; b=LVzIpnMn/2GmVrvZfCTkIA4kb4v8VqgWkXE178ElW5kvpfKAfOjNJ551yFpe5N0w5K/fBDrsoH/zmLgUVhB3mTwG7ETwcGmS33AW6YOWjnbmf142Ul3yiYD5fsXvpbajT46r5MV5v6WhSscfL/EGH071OlYR/lS+jxUXtHp+1LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753138827; c=relaxed/simple;
	bh=xTMsJ9+du2bTbDmw13ndPneOXOsiwavi94TF2rx5D0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S78JAe5t23LouRpo37bK0cO6JSD+xZ6Nk4wvx+TlSBRymF2nn8u7DRbMyrbm5pvOxfAofDBKcZYn5PKIvQfTAgzxs/5nE9KiYaXRsNE5DttY8XR4Ht9Cs8+BnLSZLwWf7an/3piNd2g1zW5BLBZRotvagmxypmDzr3hWvvhOfek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EuSxwXtv; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EuSxwXtv"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ae3ead39d72so86728966b.2
        for <loongarch@lists.linux.dev>; Mon, 21 Jul 2025 16:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753138823; x=1753743623; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I50g8CBYTAJgx5jeL63ocp0XmC4ojzYZYl9cwyXAxL0=;
        b=EuSxwXtv7B/XuL5hD2OgmQBlo/Fvq2GBYYXcF942AzTXc9DAKfqaaRgp9k91jHGXhD
         IB0PBHECucL8vCTbV9eU9AUBD+I2/RwTGhXbF/elQAWiRYHJh2+m07f7YS4LghJ71PZG
         X94qCymRI0FG1u9zEuAasf5T/9WSvEJNHlJ8V6dS7NCKl1klXcSDiycKPQ8B4efJqeCn
         H0RXRrSRv0wlUazhGqBNY48qmJ1zYUsFsAexMG0zEnRZYBVhCXsj+kr+AL/YcOR2IatM
         OsQGWb/Ka9dUItNEOuj82yw9KmtcHhRt02N79iFNpQ0h3sxOTDu/vEU1wPFq08V0PnzI
         wUEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753138823; x=1753743623;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I50g8CBYTAJgx5jeL63ocp0XmC4ojzYZYl9cwyXAxL0=;
        b=dFtxeOJ49cXyLjQ3usMnBVHRwMogPo8YQf2yzmygrf+e1t9/wN4tJMfgEOlkp0Hy12
         6D8NilO25aynskc4+YrQjIsAOXYmz+bPvFSlEHDS/52/mZAuu61nKpX3iZ8pXjVsIc1N
         C8KLNtaf9D+KmvBy6MNDLmJierW4vfV0j8Mpnp40NlE/G5xVoyDvTtYVZL64lKLlD99I
         ZkPnfYUN24+qTunyq6pi+CVnjHENdOCGoGEwx9ZFPLLCStUEEDX+pJILLOSpiGgQWEWz
         MW3haA/xwg0/RZkuxTYGP/3blGNN2pgq2RmZaf2kTDz9pSQGzEkjtKuxl2uzuOUNjkGs
         ZelA==
X-Forwarded-Encrypted: i=1; AJvYcCUlvDXOJ54GilJB8IQl7tNT067jG/5FWSZmmDjHsCwr48zr0d/xGaB+oTtNAGr5+y30EwIfxIpjxog=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3vSU4e/CVs0Z/jV/ellCEGJUluBf6l3z8FLmGr8iO/ecxzdMD
	ZEhfpLApLsoVfPAMPbhM2Dj5dB83io1T+SS7vRRmQJ6dL0lU/ZY8tpaC
X-Gm-Gg: ASbGncs6zVDXtM0vkk0yX8euvq/SQKGbiLnpNKBfql5FoWSkg4epy4nWv3vBfghKEcq
	8w5OGCZ0rSAFblIVosYxs4lsCZxHeHsgv1j1gkIIGFslSgbEBX4Vq6GFDTAVGWrfkX7LVi7KOy+
	dLFX95dgcPr+cTCAoqbdki00yZn29Oqo4DbLE0+mWtijBzsjKNEKoTR/dX5BR158Qqbhu8+P4X7
	KY6WlbKwK0tQjdzoaCHEDVVdLME7fGd+Hy3bDMwFxu41nLLh0gtZbtvlUjHvX2W0VgrtLSscaxq
	O+/uQOyl5tdjxdAhDkLlkA7LL7EsO6ynNmX3t7WSPCYO2B128vGJHENFcBvBecY6mJvzid/7GjT
	diMhAcS6vrAA1N4HBolI7/C4iW20R0xPbesLUDALZ9jQXpY3oMfKkixfz2Gd9A8FSVu15
X-Google-Smtp-Source: AGHT+IGYzqj0kH8wn480kr3FBbj99pmKP5/Eu4pwQHjyBRT16VOhkTt/2Q3FevKH1201wdR/kcGe2g==
X-Received: by 2002:a17:907:db15:b0:ad8:882e:38a with SMTP id a640c23a62f3a-ae9c9b8e572mr853708966b.14.1753138823178;
        Mon, 21 Jul 2025 16:00:23 -0700 (PDT)
Received: from [192.168.0.18] (cable-94-189-142-142.dynamic.sbb.rs. [94.189.142.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c7d8357sm753164466b.52.2025.07.21.16.00.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 16:00:22 -0700 (PDT)
Message-ID: <85de2e1f-a787-4862-87e4-2681e749cef0@gmail.com>
Date: Tue, 22 Jul 2025 01:00:03 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/12] kasan/um: select ARCH_DEFER_KASAN and call
 kasan_init_generic
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>, hca@linux.ibm.com,
 christophe.leroy@csgroup.eu, andreyknvl@gmail.com, agordeev@linux.ibm.com,
 akpm@linux-foundation.org
Cc: glider@google.com, dvyukov@google.com, kasan-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org
References: <20250717142732.292822-1-snovitoll@gmail.com>
 <20250717142732.292822-9-snovitoll@gmail.com>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <20250717142732.292822-9-snovitoll@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/17/25 4:27 PM, Sabyrzhan Tasbolatov wrote:
> UserMode Linux needs deferred KASAN initialization as it has a custom
> kasan_arch_is_ready() implementation that tracks shadow memory readiness
> via the kasan_um_is_ready flag.
> 
> Select ARCH_DEFER_KASAN to enable the unified static key mechanism
> for runtime KASAN control. Call kasan_init_generic() which handles
> Generic KASAN initialization and enables the static key.
> 
> Delete the key kasan_um_is_ready in favor of the unified kasan_enabled()
> interface.
> 
> Note that kasan_init_generic has __init macro, which is called by
> kasan_init() which is not marked with __init in arch/um code.
> 
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
> Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
> ---
> Changes in v3:
> - Added CONFIG_ARCH_DEFER_KASAN selection for proper runtime control
> ---
>  arch/um/Kconfig             | 1 +
>  arch/um/include/asm/kasan.h | 5 -----
>  arch/um/kernel/mem.c        | 4 ++--
>  3 files changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/um/Kconfig b/arch/um/Kconfig
> index f08e8a7fac9..fd6d78bba52 100644
> --- a/arch/um/Kconfig
> +++ b/arch/um/Kconfig
> @@ -8,6 +8,7 @@ config UML
>  	select ARCH_WANTS_DYNAMIC_TASK_STRUCT
>  	select ARCH_HAS_CPU_FINALIZE_INIT
>  	select ARCH_HAS_FORTIFY_SOURCE
> +	select ARCH_DEFER_KASAN
>  	select ARCH_HAS_GCOV_PROFILE_ALL
>  	select ARCH_HAS_KCOV
>  	select ARCH_HAS_STRNCPY_FROM_USER
> diff --git a/arch/um/include/asm/kasan.h b/arch/um/include/asm/kasan.h
> index f97bb1f7b85..81bcdc0f962 100644
> --- a/arch/um/include/asm/kasan.h
> +++ b/arch/um/include/asm/kasan.h
> @@ -24,11 +24,6 @@
>  
>  #ifdef CONFIG_KASAN
>  void kasan_init(void);
> -extern int kasan_um_is_ready;
> -
> -#ifdef CONFIG_STATIC_LINK
> -#define kasan_arch_is_ready() (kasan_um_is_ready)
> -#endif
>  #else
>  static inline void kasan_init(void) { }
>  #endif /* CONFIG_KASAN */
> diff --git a/arch/um/kernel/mem.c b/arch/um/kernel/mem.c
> index 76bec7de81b..058cb70e330 100644
> --- a/arch/um/kernel/mem.c
> +++ b/arch/um/kernel/mem.c
> @@ -21,9 +21,9 @@
>  #include <os.h>
>  #include <um_malloc.h>
>  #include <linux/sched/task.h>
> +#include <linux/kasan.h>
>  
>  #ifdef CONFIG_KASAN
> -int kasan_um_is_ready;
>  void kasan_init(void)
>  {
>  	/*
> @@ -32,7 +32,7 @@ void kasan_init(void)
>  	 */
>  	kasan_map_memory((void *)KASAN_SHADOW_START, KASAN_SHADOW_SIZE);
>  	init_task.kasan_depth = 0;
> -	kasan_um_is_ready = true;
> +	kasan_init_generic();

I think this runs before jump_label_init(), and static keys shouldn't be switched before that.>  }
>  
>  static void (*kasan_init_ptr)(void)

