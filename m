Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53521125D1
	for <loongarch@lists.linux.dev>; Sat, 16 Sep 2023 16:23:25 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-68fb85afef4so2982197b3a.1
        for <loongarch@lists.linux.dev>; Sat, 16 Sep 2023 09:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694881404; x=1695486204; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vnbqp2QICXtxCRvhqirbkk4LQUQEjriYEsYOyafJQnA=;
        b=h67TSeHgRFsMUaDPGfSZ93E4L9+XLsuRasiIsTJhHQ5ibfkAwek5MYQjh2hU8D76xZ
         tQUulvEvqLelCm7Of36CV0NJF6nfS9bE4DBDCCbnxwJYoKRddgv2iB2cblJUKpT9+g2o
         RVwJ7SCgQOi3p/eUGkaqoL6ATVEVRPhdWuWqjtYWVEaqU/s+vG+Ey5oY5ZloqFEjKav8
         +FO2nIyp0PFwbePz/UvBilSbeZ9h4swjoS+Kg25rUwWJ8zxSvEnjiBztNMVz1u+0Ibt+
         CacUyrhhBaS5vseSpiOwuTKGXL9bpDZCtrtJpbSpbpjluReMlBYyWUNBHKJBljxm6JVR
         +Vsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694881404; x=1695486204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vnbqp2QICXtxCRvhqirbkk4LQUQEjriYEsYOyafJQnA=;
        b=KRHws3d3xz2km43ahrIvM63+4qhsgNWJibdgy6Djn2wtlgEmLo170vc0o4l/3tRHms
         3kBbneMZMkjiGGMJMKSnkIHqcSXh6De12hbGJR0U192AfVrBDX/NUPDuJCOOxUZ0QP7j
         RJlsrl7RCrRvjALjWVPzR7Wsw8QwBcHo6uvKctt4KBmdq5sJieT9kPAlg/Sl2Y1zSgLD
         R/bW7czxQmfBzMkQtKaNX3hewBZery8I12E6h4zYQZAqwHey7ml2L0Rcz8SjEUQRjIDt
         5EtF4Yche99KXlG9O9aSHkm9VQQgZG9reSUDOLxpgN718Q40xZIDtUqAEEbVigqim7Js
         GhPA==
X-Gm-Message-State: AOJu0Ywwl9pTSYCc5kpFLQyv/PkxmJA50ZzybWkII5nbmfgmul1UyUVc
	KnNj1ySLQYZtvk2FSk0vKG40rkdt7D78Ov91oYY=
X-Google-Smtp-Source: AGHT+IEfXOCC/sICfnIRMCLDsK6b3IEs/xbd1z457jQO3JvhocT+ttSvPY+qyY1L2eoGhwW9HnpvD/EI34DzlGuujic=
X-Received: by 2002:a05:6a20:e11a:b0:14c:76bd:10c1 with SMTP id
 kr26-20020a056a20e11a00b0014c76bd10c1mr5776753pzb.21.1694881404475; Sat, 16
 Sep 2023 09:23:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230912031750.3319584-1-chenhuacai@loongson.cn>
In-Reply-To: <20230912031750.3319584-1-chenhuacai@loongson.cn>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Sat, 16 Sep 2023 18:23:13 +0200
Message-ID: <CA+fCnZcSZi5nPPnbC3Ce7qChUFMwwSkP13fGSG4VXpDqOUimOg@mail.gmail.com>
Subject: Re: [PATCH V2] kasan: Cleanup the __HAVE_ARCH_SHADOW_MAP usage
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, loongarch@lists.linux.dev, 
	Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	loongson-kernel@lists.loongnix.cn, 
	Linus Torvalds <torvalds@linux-foundation.org>, WANG Xuerui <git@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 12, 2023 at 5:18=E2=80=AFAM Huacai Chen <chenhuacai@loongson.cn=
> wrote:
>
> As Linus suggested, __HAVE_ARCH_XYZ is "stupid" and "having historical
> uses of it doesn't make it good". So migrate __HAVE_ARCH_SHADOW_MAP to
> separate macros named after the respective functions.
>
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Reviewed-by: WANG Xuerui <git@xen0n.name>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
> V2: Update commit messages.
>
>  arch/loongarch/include/asm/kasan.h | 10 ++++++++--
>  include/linux/kasan.h              |  2 +-
>  mm/kasan/kasan.h                   |  8 +++-----
>  3 files changed, 12 insertions(+), 8 deletions(-)
>
> diff --git a/arch/loongarch/include/asm/kasan.h b/arch/loongarch/include/=
asm/kasan.h
> index deeff8158f45..a12ecab37da7 100644
> --- a/arch/loongarch/include/asm/kasan.h
> +++ b/arch/loongarch/include/asm/kasan.h
> @@ -10,8 +10,6 @@
>  #include <asm/io.h>
>  #include <asm/pgtable.h>
>
> -#define __HAVE_ARCH_SHADOW_MAP
> -
>  #define KASAN_SHADOW_SCALE_SHIFT 3
>  #define KASAN_SHADOW_OFFSET    _AC(CONFIG_KASAN_SHADOW_OFFSET, UL)
>
> @@ -68,6 +66,7 @@ static __always_inline bool kasan_arch_is_ready(void)
>         return !kasan_early_stage;
>  }
>
> +#define kasan_mem_to_shadow kasan_mem_to_shadow
>  static inline void *kasan_mem_to_shadow(const void *addr)
>  {
>         if (!kasan_arch_is_ready()) {
> @@ -97,6 +96,7 @@ static inline void *kasan_mem_to_shadow(const void *add=
r)
>         }
>  }
>
> +#define kasan_shadow_to_mem kasan_shadow_to_mem
>  static inline const void *kasan_shadow_to_mem(const void *shadow_addr)
>  {
>         unsigned long addr =3D (unsigned long)shadow_addr;
> @@ -119,6 +119,12 @@ static inline const void *kasan_shadow_to_mem(const =
void *shadow_addr)
>         }
>  }
>
> +#define addr_has_metadata addr_has_metadata
> +static __always_inline bool addr_has_metadata(const void *addr)
> +{
> +       return (kasan_mem_to_shadow((void *)addr) !=3D NULL);
> +}
> +
>  void kasan_init(void);
>  asmlinkage void kasan_early_init(void);
>
> diff --git a/include/linux/kasan.h b/include/linux/kasan.h
> index 3df5499f7936..842623d708c2 100644
> --- a/include/linux/kasan.h
> +++ b/include/linux/kasan.h
> @@ -54,7 +54,7 @@ extern p4d_t kasan_early_shadow_p4d[MAX_PTRS_PER_P4D];
>  int kasan_populate_early_shadow(const void *shadow_start,
>                                 const void *shadow_end);
>
> -#ifndef __HAVE_ARCH_SHADOW_MAP
> +#ifndef kasan_mem_to_shadow
>  static inline void *kasan_mem_to_shadow(const void *addr)
>  {
>         return (void *)((unsigned long)addr >> KASAN_SHADOW_SCALE_SHIFT)
> diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> index f70e3d7a602e..d37831b8511c 100644
> --- a/mm/kasan/kasan.h
> +++ b/mm/kasan/kasan.h
> @@ -291,7 +291,7 @@ struct kasan_stack_ring {
>
>  #if defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)
>
> -#ifndef __HAVE_ARCH_SHADOW_MAP
> +#ifndef kasan_shadow_to_mem
>  static inline const void *kasan_shadow_to_mem(const void *shadow_addr)
>  {
>         return (void *)(((unsigned long)shadow_addr - KASAN_SHADOW_OFFSET=
)
> @@ -299,15 +299,13 @@ static inline const void *kasan_shadow_to_mem(const=
 void *shadow_addr)
>  }
>  #endif
>
> +#ifndef addr_has_metadata
>  static __always_inline bool addr_has_metadata(const void *addr)
>  {
> -#ifdef __HAVE_ARCH_SHADOW_MAP
> -       return (kasan_mem_to_shadow((void *)addr) !=3D NULL);
> -#else
>         return (kasan_reset_tag(addr) >=3D
>                 kasan_shadow_to_mem((void *)KASAN_SHADOW_START));
> -#endif
>  }
> +#endif
>
>  /**
>   * kasan_check_range - Check memory region, and report if invalid access=
.
> --
> 2.39.3
>

Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>

Thanks!
