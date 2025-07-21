Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A25923D2B6
	for <loongarch@lists.linux.dev>; Mon, 21 Jul 2025 23:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753138821; cv=none; b=uHKxxxBUzD0I+6jv8C5lcaircU+8Z6upRBMJ2ghO9T4eMLJECLw3tJLw7yRv2y8TUK977MLTgsvSK33wFoZHotacFiqkWruxCEGqoj4KUjsBJ/MGUI5TYaBBp1PvVmQcoZyYrNZETAE5pxIpBsiHOw70CGfFnEIRXiRsXydeWUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753138821; c=relaxed/simple;
	bh=B65sCoFaiHCK/8GSMjA44vvmKa4nvP6+C+DFiICR3ds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Itocyix0l1gFodzt7Y+IroJEx0MzswkNYA+P0ijCarUo+GDiaqxxCMKH3souEPLindij7jnhA1raOtlJsG/0GXNfP2e9huih5Re45Q9MPu14crv7SR0QsGTIb7qPlMjqlvU2h83Qmtgt9oMDi+80dOyrlyfHMnrNk7RW9cxptFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CaLW3UAm; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CaLW3UAm"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ae0df0bb8fbso82987166b.3
        for <loongarch@lists.linux.dev>; Mon, 21 Jul 2025 16:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753138818; x=1753743618; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qL9A0aUIl8Uddr//bj642F7utZi72l2outni4topsME=;
        b=CaLW3UAmrXubeztXKSXlaO4ou0blzoGKeWf06QBA+SeeEAyjmmx3O8Ap4C62vkaR42
         RaRWPvdZ0+kpRZTh19I09TDucWS3UTEN/KBhNXLL5n4jPpQ6PxPdo2I0FYJAzbZiI/9z
         5oG/j04ChNoHIrmfMKzTcN7hjvgRvadbEjqo5fnSx5S+mqY2A153YKIzrQQrEAeULRFp
         PfwlyU3pmpAwI1P8Jks7xpPZ1H/X3EJiuw0p8fioeqkjuZ+g6CdXEEhrOk6KudnC1LDr
         mhpHuR8dpRwU50HEAvUeaKXEQ09jXk6If3RcrL5jsUS5kqR8CFu+dCpmjbFV5enWo8+U
         +2Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753138818; x=1753743618;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qL9A0aUIl8Uddr//bj642F7utZi72l2outni4topsME=;
        b=frebeVCn0nG/FeQt/S3Qb/ZowJV/eKRVgq/Xic3ar6vRY8B/1v3bo05ngXvgXOy3G4
         2NQcktUpxtLO3Nu7WG39mAX9jcWGlA2PLRNCAjM+wig575+MR3ud7GHTlYPMrV1u/TZI
         8mgfKLMC66PnnxUDLvucwAWgOSjd/rOCjsGizeMR/ois7oGJ5WzWtP3slq96KiCmfSqJ
         EjZBHKWz7aUN9uQpctcJzz7LACNeZRiNnwni5wIBQNLlEguhKc3VeCGY5RuQx6U5hQQl
         jFqfMXdwQiHQmMo+ftrmsYEecqKb8fB5ntPXxNYlqE50vsjjr3pWhrEUIAUn8Les7kRM
         JVpw==
X-Forwarded-Encrypted: i=1; AJvYcCW2DmwRQW/cS0rwgMRhy7vBjpkecEvxAMmJjjy4xSyox61SCNWP6hptbh8cizEzA+g8UEqJV81oOI8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwzS0olTpkAISO4q9FcPKRL/0uxEZDDFcWcMfQ9ojVl7TMejZEf
	dRpQoz8L5jCuFxtvm20YaHBOer2OCB0RSw09jDUAmh8Em1F48jeS+NjA
X-Gm-Gg: ASbGncvroOvuUo9Xoj7ExbYt4iBnYP15WNrgdH93b3RNYAjUa4EwMGOMru2k2/o/IGq
	0fJsZPYUd2cULwOu20esTIQ+Wi1xAQx0P5OyAQhSEm9xQ5FvlaA0gkSTfD5oXvxB3nr4eimgM8Z
	4yOpBORAKba7VN/rVsVjcCL1mgtlJt8aqxmUVkEQh/c0xrVz57bCldRxg9IG9BiQ01u9jjyiq6O
	Kqa6RVu6K2lEfxfmyy+jqzqCg05kuhiYSg9qJ34rhX0+C33Nvs5cW4c05pLQOpNdG/f7Cp9NCyP
	8qKJaYbp4nRKp/n7F3c3vgTqjzGVxa+JL0so/Vd1d5w+q/9s6iPCSZYjuw8Yhls0OpRBuwnVMJS
	BiCgjbOPxhvzNi6k8WRqqoCQqpEGe5NKu4EmWTnAqICX75BXK9tFxHVCl5ObT3IlE5dM2
X-Google-Smtp-Source: AGHT+IHckuXEWvfAMpSzjjL6pEsgi7MWI7yYCMOiqpAqEO5gMn0ATvaVtw0/vmnoItEaOlX4DlEKBQ==
X-Received: by 2002:a17:907:7fa1:b0:ae6:c555:8dbb with SMTP id a640c23a62f3a-ae9c9af98e3mr887526166b.11.1753138817353;
        Mon, 21 Jul 2025 16:00:17 -0700 (PDT)
Received: from [192.168.0.18] (cable-94-189-142-142.dynamic.sbb.rs. [94.189.142.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c7d8357sm753164466b.52.2025.07.21.16.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 16:00:16 -0700 (PDT)
Message-ID: <c8b0be89-6c89-46ed-87c3-8905b6ccbbeb@gmail.com>
Date: Tue, 22 Jul 2025 00:59:56 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/12] kasan/loongarch: select ARCH_DEFER_KASAN and
 call kasan_init_generic
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>, hca@linux.ibm.com,
 christophe.leroy@csgroup.eu, andreyknvl@gmail.com, agordeev@linux.ibm.com,
 akpm@linux-foundation.org
Cc: glider@google.com, dvyukov@google.com, kasan-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org
References: <20250717142732.292822-1-snovitoll@gmail.com>
 <20250717142732.292822-8-snovitoll@gmail.com>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <20250717142732.292822-8-snovitoll@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/17/25 4:27 PM, Sabyrzhan Tasbolatov wrote:

> diff --git a/arch/loongarch/include/asm/kasan.h b/arch/loongarch/include/asm/kasan.h
> index 62f139a9c87..0e50e5b5e05 100644
> --- a/arch/loongarch/include/asm/kasan.h
> +++ b/arch/loongarch/include/asm/kasan.h
> @@ -66,7 +66,6 @@
>  #define XKPRANGE_WC_SHADOW_OFFSET	(KASAN_SHADOW_START + XKPRANGE_WC_KASAN_OFFSET)
>  #define XKVRANGE_VC_SHADOW_OFFSET	(KASAN_SHADOW_START + XKVRANGE_VC_KASAN_OFFSET)
>  
> -extern bool kasan_early_stage;
>  extern unsigned char kasan_early_shadow_page[PAGE_SIZE];
>  
>  #define kasan_mem_to_shadow kasan_mem_to_shadow
> @@ -75,12 +74,6 @@ void *kasan_mem_to_shadow(const void *addr);
>  #define kasan_shadow_to_mem kasan_shadow_to_mem
>  const void *kasan_shadow_to_mem(const void *shadow_addr);
>  
> -#define kasan_arch_is_ready kasan_arch_is_ready
> -static __always_inline bool kasan_arch_is_ready(void)
> -{
> -	return !kasan_early_stage;
> -}
> -
>  #define addr_has_metadata addr_has_metadata
>  static __always_inline bool addr_has_metadata(const void *addr)
>  {
> diff --git a/arch/loongarch/mm/kasan_init.c b/arch/loongarch/mm/kasan_init.c
> index d2681272d8f..cf8315f9119 100644
> --- a/arch/loongarch/mm/kasan_init.c
> +++ b/arch/loongarch/mm/kasan_init.c
> @@ -40,11 +40,9 @@ static pgd_t kasan_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
>  #define __pte_none(early, pte) (early ? pte_none(pte) : \
>  ((pte_val(pte) & _PFN_MASK) == (unsigned long)__pa(kasan_early_shadow_page)))
>  
> -bool kasan_early_stage = true;
> -
>  void *kasan_mem_to_shadow(const void *addr)
>  {
> -	if (!kasan_arch_is_ready()) {
> +	if (!kasan_enabled()) {

This doesn't make sense, !kasan_enabled() is compile-time check which is always false here.

>  		return (void *)(kasan_early_shadow_page);
>  	} else {
>  		unsigned long maddr = (unsigned long)addr;
