Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB1F79C5
	for <loongarch@lists.linux.dev>; Thu, 29 Dec 2022 16:22:27 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id r18so12651527pgr.12
        for <loongarch@lists.linux.dev>; Thu, 29 Dec 2022 08:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PMNgd8bQDMgdEx3QpMo3jWGl4T1DZKXjFMtqF5doPS4=;
        b=qXEmllgjQDDILSAqKv5rHoGkicbo4R4i0RBYCEbuy5JWCS9/AA+DWTMXLQgqDAappW
         903kwqubN40SB2KttGjjG54UgZAHr5bwFbysTxqCEokE3BNB09i/uefHEDV0SvFj1/tu
         1Lu+CFCesVDE+jl4EXnA8KkiboPktg6mieeJ7onX1tkrVdG7KvaiHAaOG9gcqJyJPbGd
         pCkV7szyzafl528HANkkvX+fSJQQtn4lOJvi8JPHEP8zM7yI6lOkG51EtxjdpiS6qS6y
         bkQ9rcSKWrjbuS7i9mSjttcyHwgDwy/ruAPC9lLbcJkXlwaOVpsqeXNx1gIuMeQUkJfm
         MIkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PMNgd8bQDMgdEx3QpMo3jWGl4T1DZKXjFMtqF5doPS4=;
        b=e605/Ui5MsE4aHbN9btnAdmaSA5d3ZPi1wWlxk7dbK2y/JZDym75X4iE06QSMfoscy
         w4UKh1rFG4C2X7gnN//MwrL1/pCbyx4JVYu/L8YJfO3hK0JConNWGhwyT9n2aMgjhzqE
         Zg8uPcogvnmwuU1yT1xW0gaR2g6pJDuR6JqV4q1dvSIDtpTXbkeCj8KP4ON/rZWJ1j3G
         /hWbkb6oQJp0hIiXuYzK2J16hLUiy72uVOhy8liGmoduAflgepdRsxxO8BiG/2F1AhdN
         jC2ylemRlpmkg4pVGgfBvqvW7AuBsY6m9q/6DIxA0ftkxsPgTYvWlM4ko3/NBLU5BhcC
         qoeA==
X-Gm-Message-State: AFqh2kpOpLqQn+OuX8joql8BOdHGNH/tPqiWMaiKNptj316GZWvGr8E+
	0M4h4k9UmEAuzZic/6xxB92kqA==
X-Google-Smtp-Source: AMrXdXtoQHTvZGkC4TohzHT3/NWYHx9KB7DMUUCuZrQkc/ivfhp4AP56ANclvtUxYpd25RIK3u76xw==
X-Received: by 2002:a05:6a00:1c92:b0:576:f322:419f with SMTP id y18-20020a056a001c9200b00576f322419fmr28959611pfw.28.1672330946621;
        Thu, 29 Dec 2022 08:22:26 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id l190-20020a6225c7000000b005771d583893sm12598441pfl.96.2022.12.29.08.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 08:22:26 -0800 (PST)
Date: Thu, 29 Dec 2022 08:22:26 -0800 (PST)
X-Google-Original-Date: Thu, 29 Dec 2022 07:53:49 PST (-0800)
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
Message-ID: <mhng-8937d883-402e-4523-a023-8171ed0e386b@palmer-ri-x1c9>
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

Thanks!
