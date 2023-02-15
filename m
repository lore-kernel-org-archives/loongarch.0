Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB5FCBA7
	for <loongarch@lists.linux.dev>; Wed, 15 Feb 2023 05:22:25 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id bt14so4987438pfb.13
        for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 21:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tV+nl5/6nbPk/6HA5pQX/rHuTHF5S4E9f4KJMF/h5x0=;
        b=fhWxOvSg47bnqh1vlUb0tg8U7zRfENd11uhGOf5Jsz/ZocWHFEI68pLXo5d9vBVXvT
         wSDFNO3/CV6QVriW/uJf7uSjBsTIo2nfhwr90ljf0Mtrv3l+ZNz03APZ/NoeYJxIi8AS
         eT1BnG6scYkTL0mRsKAhicVLLfSox5xFSJlK+m4CcZ2f/19AZeBmn0TeLDNpHHUJ+j//
         pNGe52xRL7NHFqYuRqi8NBAMhHiUAqm3krXcV9gB6lQ+ZUL8htkaq+hcUOto2vJWmQ/P
         1t61ly6hek8z31+cUX+0shb1PAvYlU/KvbO9KdB05jwbmNe1/Zq0XZpFJiImeu8sqMJC
         uFRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tV+nl5/6nbPk/6HA5pQX/rHuTHF5S4E9f4KJMF/h5x0=;
        b=jmjzLF6I/UxcNbkhZ+iu10rME77xO9TxYl1rBkgagByPgb+lOXlvoLJn/wJ1spNc5S
         o+3RluQCgPAwjSh4NlPoWqGFGByzQtYR+2X68jziiBgCdrjvMb4rVwD/WIXs+agy4gDz
         dmxE99ZuO7IgvYRGBK9SkIo/JRobRl7dZv8IrQ8ncWKPeqyQ6JFXa8KH/jZXVnBsAmyu
         Jn78CK04xCrCxRGamwjKJd9FfjXbXzm0yDig4ui/XsmRmvtFuUmcLKc/4rYRB5k4c86/
         98yswbW9/ux8fiOe6tX/jpYdZK6narsq1IftwmUDOoOsMhpGPimWwExIdbc0IbfVulAG
         DF6A==
X-Gm-Message-State: AO0yUKUAQ9X3Mqjn/rZea4hWdBaLikY2p7JfnvV0xVfiO06Lk7t2Tlfx
	fUfzPFs5LBH+VxJOiq1kSPivdA==
X-Google-Smtp-Source: AK7set/rdrNLm8tItidqjsvagDbtl5rYMULe1MueAmQXNPzlIf4+Jxy35EVuWqAlcqe6sRrK/ndqkQ==
X-Received: by 2002:aa7:9f85:0:b0:577:272f:fdb with SMTP id z5-20020aa79f85000000b00577272f0fdbmr600755pfr.29.1676438545117;
        Tue, 14 Feb 2023 21:22:25 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id n14-20020aa78a4e000000b005a8d396ae27sm2788868pfa.8.2023.02.14.21.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 21:22:24 -0800 (PST)
Date: Tue, 14 Feb 2023 21:22:24 -0800 (PST)
X-Google-Original-Date: Tue, 14 Feb 2023 21:22:11 PST (-0800)
Subject:     Re: [PATCH 13/19] arch/riscv: rename internal name __xchg to __arch_xchg
In-Reply-To: <20221222114635.1251934-14-andrzej.hajda@intel.com>
CC: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
  linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-hexagon@vger.kernel.org,
  linux-ia64@vger.kernel.org, loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
  linux-mips@vger.kernel.org, openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
  linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
  linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
  intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, andrzej.hajda@intel.com,
  Arnd Bergmann <arnd@arndb.de>, rodrigo.vivi@intel.com, akpm@linux-foundation.org,
  andriy.shevchenko@linux.intel.com, peterz@infradead.org, boqun.feng@gmail.com, mark.rutland@arm.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: andrzej.hajda@intel.com
Message-ID: <mhng-e75808d7-21de-4ef8-a606-b7c652a1f38e@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Thu, 22 Dec 2022 03:46:29 PST (-0800), andrzej.hajda@intel.com wrote:
> __xchg will be used for non-atomic xchg macro.
>
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>  arch/riscv/include/asm/atomic.h  | 2 +-
>  arch/riscv/include/asm/cmpxchg.h | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
> index 0dfe9d857a762b..bba472928b5393 100644
> --- a/arch/riscv/include/asm/atomic.h
> +++ b/arch/riscv/include/asm/atomic.h
> @@ -261,7 +261,7 @@ c_t arch_atomic##prefix##_xchg_release(atomic##prefix##_t *v, c_t n)	\
>  static __always_inline							\
>  c_t arch_atomic##prefix##_xchg(atomic##prefix##_t *v, c_t n)		\
>  {									\
> -	return __xchg(&(v->counter), n, size);				\
> +	return __arch_xchg(&(v->counter), n, size);			\
>  }									\
>  static __always_inline							\
>  c_t arch_atomic##prefix##_cmpxchg_relaxed(atomic##prefix##_t *v,	\
> diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
> index 12debce235e52d..2f4726d3cfcc25 100644
> --- a/arch/riscv/include/asm/cmpxchg.h
> +++ b/arch/riscv/include/asm/cmpxchg.h
> @@ -114,7 +114,7 @@
>  					    _x_, sizeof(*(ptr)));	\
>  })
>
> -#define __xchg(ptr, new, size)						\
> +#define __arch_xchg(ptr, new, size)					\
>  ({									\
>  	__typeof__(ptr) __ptr = (ptr);					\
>  	__typeof__(new) __new = (new);					\
> @@ -143,7 +143,7 @@
>  #define arch_xchg(ptr, x)						\
>  ({									\
>  	__typeof__(*(ptr)) _x_ = (x);					\
> -	(__typeof__(*(ptr))) __xchg((ptr), _x_, sizeof(*(ptr)));	\
> +	(__typeof__(*(ptr))) __arch_xchg((ptr), _x_, sizeof(*(ptr)));	\
>  })
>
>  #define xchg32(ptr, x)							\

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
