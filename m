Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63F76FA2
	for <loongarch@lists.linux.dev>; Wed, 29 Mar 2023 19:02:50 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id r7-20020a17090b050700b002404be7920aso15547383pjz.5
        for <loongarch@lists.linux.dev>; Wed, 29 Mar 2023 12:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680116570;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rysh7R9x0DwpV/wCJCeDcK+KSngeOrcjw+kFGG6R2os=;
        b=U//sM9A7XL/kcpEYXKup4m2J/Sp3DBWPcq+cj4HsJc7+dUi9AsjU02Lwq3JoL1NQmq
         ismSymj4IoQJ4VYIXTTfXj4IhuTC9V8imTeRJJl8wtp+cLMVycZbZpe5adelriSCB34Z
         5JRPjQUp4XUV1p1ZJpj8FcgAadV1Nt3xAimI5KHOUF00ILkLWslBnB0DEXYGfhDpjDhs
         aIvCu/RV/2Kg07dVMVnAXRKweMCcgh7xxmTEuGKD2hPrODR6SjG1EW0qSYoJJ5V2d+iM
         usSHbr1+aiPi29yP82LVwaPfhD1cK7k46uCFb9ZLK21U4JbQEzxGF/pBiIfUsLTD3aFK
         EHOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680116570;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rysh7R9x0DwpV/wCJCeDcK+KSngeOrcjw+kFGG6R2os=;
        b=IXAcb1Hr6xWpAuy9MRvnDCQhFhmTu7qJHCGl3R32yiSqlX9FjySyaFKwtSZFFEOMvf
         qP3DHd8eHB5rUkj/eCUQtsPQg4d2DC+IGomlP9RI0+z3qrJ60U7fBE2c2BTYmi5iPYik
         2U3YGWOrO8U6wN8DK73JWBj+d5TSJC6aEbZf5z9J+01APtOnstPnSCFxtcjVeDVOZe2p
         32abR42pFvDs64EvvEjq5gGNB6O/RShCIiXIHU4VrtG5BC9tln6UiELwPK7UJp84fhIy
         Tx+tcnrL0ZRFa6iV+5a4ZTbtke2FSEMttuGFUBx8kCiPxzBdzRH4o7teWHlC2FOw78Eq
         d8aQ==
X-Gm-Message-State: AAQBX9c9Sc0JUx8XihpSUzpYhojYFJKeb7wXOvw2ADQXzinAow+d3XgO
	cMwdt9wI0ogyOJFdMc8t9QMG2BRWyu/OYaRgDoE=
X-Google-Smtp-Source: AKy350a8ZyVGR+YsV1iqviDdiXUJrnHDdWNYLxQJ15oR6ir8sjH7TDn0yq8OS/FxjL5RmpSszu69Red3FULJ3Z/k/d4=
X-Received: by 2002:a17:902:c213:b0:199:49d7:cead with SMTP id
 19-20020a170902c21300b0019949d7ceadmr7378827pll.11.1680116570333; Wed, 29 Mar
 2023 12:02:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230328111714.2056-1-zhangqing@loongson.cn>
In-Reply-To: <20230328111714.2056-1-zhangqing@loongson.cn>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Wed, 29 Mar 2023 21:02:39 +0200
Message-ID: <CA+fCnZevgYh7CzJ9gOWJ80SwY4Y9w8UO2ZiFAXEnAhQhFgrffA@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Add kernel address sanitizer support
To: Qing Zhang <zhangqing@loongson.cn>
Cc: Jonathan Corbet <corbet@lwn.net>, Huacai Chen <chenhuacai@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Alexander Potapenko <glider@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	WANG Xuerui <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, kasan-dev@googlegroups.com, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>
Content-Type: text/plain; charset="UTF-8"

> diff --git a/include/linux/kasan.h b/include/linux/kasan.h
> index f7ef70661ce2..3b91b941873d 100644
> --- a/include/linux/kasan.h
> +++ b/include/linux/kasan.h
> @@ -54,11 +54,13 @@ extern p4d_t kasan_early_shadow_p4d[MAX_PTRS_PER_P4D];
>  int kasan_populate_early_shadow(const void *shadow_start,
>                                 const void *shadow_end);
>
> +#ifndef __HAVE_ARCH_SHADOW_MAP
>  static inline void *kasan_mem_to_shadow(const void *addr)
>  {
>         return (void *)((unsigned long)addr >> KASAN_SHADOW_SCALE_SHIFT)
>                 + KASAN_SHADOW_OFFSET;
>  }
> +#endif
>
>  int kasan_add_zero_shadow(void *start, unsigned long size);
>  void kasan_remove_zero_shadow(void *start, unsigned long size);
> diff --git a/mm/kasan/generic.c b/mm/kasan/generic.c
> index e5eef670735e..f86194750df5 100644
> --- a/mm/kasan/generic.c
> +++ b/mm/kasan/generic.c
> @@ -175,6 +175,11 @@ static __always_inline bool check_region_inline(unsigned long addr,
>         if (unlikely(!addr_has_metadata((void *)addr)))
>                 return !kasan_report(addr, size, write, ret_ip);
>
> +#ifndef __HAVE_ARCH_SHADOW_MAP
> +       if (unlikely(kasan_mem_to_shadow((unsigned long *)addr) == NULL))
> +               return !kasan_report(addr, size, write, ret_ip);
> +#endif

This should have been ifdef, right?

But I don't think you need this check here at all: addr_has_metadata
already checks that shadow exists.

> +
>         if (likely(!memory_is_poisoned(addr, size)))
>                 return true;
>
> diff --git a/mm/kasan/init.c b/mm/kasan/init.c
> index cc64ed6858c6..860061a22ca9 100644
> --- a/mm/kasan/init.c
> +++ b/mm/kasan/init.c
> @@ -166,8 +166,9 @@ static int __ref zero_pud_populate(p4d_t *p4d, unsigned long addr,
>                                 if (!p)
>                                         return -ENOMEM;
>                         } else {
> -                               pud_populate(&init_mm, pud,
> -                                       early_alloc(PAGE_SIZE, NUMA_NO_NODE));
> +                               p = early_alloc(PAGE_SIZE, NUMA_NO_NODE);
> +                               pmd_init(p);
> +                               pud_populate(&init_mm, pud, p);
>                         }
>                 }
>                 zero_pmd_populate(pud, addr, next);
> @@ -207,8 +208,9 @@ static int __ref zero_p4d_populate(pgd_t *pgd, unsigned long addr,
>                                 if (!p)
>                                         return -ENOMEM;
>                         } else {
> -                               p4d_populate(&init_mm, p4d,
> -                                       early_alloc(PAGE_SIZE, NUMA_NO_NODE));
> +                               p = early_alloc(PAGE_SIZE, NUMA_NO_NODE);
> +                               pud_init(p);
> +                               p4d_populate(&init_mm, p4d, p);

Please explain why these changes are needed in the patch description.

>                         }
>                 }
>                 zero_pud_populate(p4d, addr, next);
> diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> index a61eeee3095a..033335c13b25 100644
> --- a/mm/kasan/kasan.h
> +++ b/mm/kasan/kasan.h
> @@ -291,16 +291,22 @@ struct kasan_stack_ring {
>
>  #if defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)
>
> +#ifndef __HAVE_ARCH_SHADOW_MAP
>  static inline const void *kasan_shadow_to_mem(const void *shadow_addr)
>  {
>         return (void *)(((unsigned long)shadow_addr - KASAN_SHADOW_OFFSET)
>                 << KASAN_SHADOW_SCALE_SHIFT);
>  }
> +#endif
>
>  static __always_inline bool addr_has_metadata(const void *addr)
>  {
> +#ifdef __HAVE_ARCH_SHADOW_MAP
> +       return (kasan_mem_to_shadow((void *)addr) != NULL);
> +#else
>         return (kasan_reset_tag(addr) >=
>                 kasan_shadow_to_mem((void *)KASAN_SHADOW_START));
> +#endif
>  }
>
>  /**
> --
> 2.20.1
>
