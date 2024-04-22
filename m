Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5761D153BEE
	for <loongarch@lists.linux.dev>; Mon, 22 Apr 2024 17:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713807660; cv=none; b=DTu+JHJt+UVJ/jtKVCFbJUs6Dm2jcy1yd4oVfHoMIzM3nH1G6FPX7h4sa8rFKwRGF0rIcE/J/pB9mtCTo0EFQL5gPUzpfvS6Cw33BfAo0EBPrUJemHkYR4TLbm/8VN++cgEOjcum8r2UGwFkcC/KOPC6Cx+zs/LDJbsHmjsIWps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713807660; c=relaxed/simple;
	bh=p8f3mDhOFdkK6vQBSO2RmHu0Eih8xW1uX/u+4OJ4ags=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fg5H8QEf/Hc9xW+FDYCMzPBlR26RNUYgtdpGdFxtTd4GpyV1CFmtnbs255yGB2QOC4Duoakzpm948YE4A9q1fu5X8NExAel4ulyrosrUAby8kxaiCTeI4TXvJQOkpmF/NIgGXgLDsbEIwfnyo2lCwJF33Qcrrlk81x2j4A3Dv6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=DP+i4rGd; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="DP+i4rGd"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-61816fc256dso41151367b3.0
        for <loongarch@lists.linux.dev>; Mon, 22 Apr 2024 10:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713807657; x=1714412457; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8oSz86JzOY9DQvGvueAGk0oxmVKc1JpB72xgEu0TDts=;
        b=DP+i4rGdGTTkqPIpujs/urnBModZBCCRpnxt9eH4XmlSrYRB3UQuoLIhY4DfXCruPo
         GE4ZvHJcFq8rSe0nFrirf1WtNHx+Lo8ynY9ucOiWisN034dVYNigw+ulDlvfv4PGtN3u
         rCbXgW2zCIJalrjeVlOT3N6juNygM6/tV/dheIDkCLh1HhkRL6lha180wPL1H0NUeiMk
         AD+xOvxnVH7XOacrhW4z5FUSsRib3RnTvTnviDW8y1Eqm+vMZwoMP5ceyVnHfIazbFuf
         pOqlmF9FaOUCO9Etn6pmJIVE0y8lQLqV6rYAwT5nvmLnJEQFBBbG13ET5gNwYuB+WJTo
         nYNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713807657; x=1714412457;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8oSz86JzOY9DQvGvueAGk0oxmVKc1JpB72xgEu0TDts=;
        b=tjmzkD6dL5Bxo/WckfgDRwp5tNYZpkGfmt5CXEz6ZtdGqTN1PURh0lL2Q9JawT+MuC
         d5GcCATBy4DPfFke7dEI/Bf/HOc9WLRFnTR4lxPlwdHKGBihhnaLGa37UmCCvtfba1+8
         OiGsb9HTzTS3EzSBLcRSmrRuLL/rKoJ7+xIwAwyQrnxqdZdcwDrG5O0FxIL6Ce+QKDkU
         E9zGTdleXvKyTmP18hld8xh7lSKgKRPlsvH4M7HG+dgMm+SRSL8xTpOR9Q65bOWLcNHd
         5JExvc+r7RK3eoYf7GzCmYFYXseriF0KA8jx1TVK8UFNcKhcFLmT8shEbaanfPOw6BSO
         eTfw==
X-Forwarded-Encrypted: i=1; AJvYcCWI61sHETOWYodGXbyp+PNB03C0kDObFL3bYB2L5RLeByndPH5iYx5PZIH9dyhd7CGxgKahDEN8hoOCiy/O1vouocv5jMHzeGl8
X-Gm-Message-State: AOJu0YxYoZ6OKZCic14PfsBCHy2FUdE2jMrmpObkNKuRSOu1kVxxuKgP
	m6P8ellErICwurl51zElNuirxa6zsVEOVWtJKXrppHozK4WCj0I8kFi/V2Xsp2o=
X-Google-Smtp-Source: AGHT+IF6LQ8zdofhxJ/PNSOv5IQXexYxxfrsaWAs34RmUulyK1yyuZ4SFyNwWs4DcElioVxSqpYRPw==
X-Received: by 2002:a05:690c:3685:b0:617:c9b0:e12c with SMTP id fu5-20020a05690c368500b00617c9b0e12cmr10651242ywb.38.1713807655898;
        Mon, 22 Apr 2024 10:40:55 -0700 (PDT)
Received: from ghost ([50.146.0.2])
        by smtp.gmail.com with ESMTPSA id r29-20020a81441d000000b00608876ed731sm2060370ywa.126.2024.04.22.10.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 10:40:55 -0700 (PDT)
Date: Mon, 22 Apr 2024 13:40:53 -0400
From: Charlie Jenkins <charlie@rivosinc.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Kees Cook <keescook@chromium.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	David Gow <davidgow@google.com>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, loongarch@lists.linux.dev,
	netdev@vger.kernel.org, x86@kernel.org,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v3 14/15] riscv: Add support for suppressing warning
 backtraces
Message-ID: <ZiahJT8MTFqAlD5A@ghost>
References: <20240403131936.787234-1-linux@roeck-us.net>
 <20240403131936.787234-15-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240403131936.787234-15-linux@roeck-us.net>

On Wed, Apr 03, 2024 at 06:19:35AM -0700, Guenter Roeck wrote:
> Add name of functions triggering warning backtraces to the __bug_table
> object section to enable support for suppressing WARNING backtraces.
> 
> To limit image size impact, the pointer to the function name is only added
> to the __bug_table section if both CONFIG_KUNIT_SUPPRESS_BACKTRACE and
> CONFIG_DEBUG_BUGVERBOSE are enabled. Otherwise, the __func__ assembly
> parameter is replaced with a (dummy) NULL parameter to avoid an image size
> increase due to unused __func__ entries (this is necessary because __func__
> is not a define but a virtual variable).
> 
> To simplify the implementation, unify the __BUG_ENTRY_ADDR and
> __BUG_ENTRY_FILE macros into a single macro named __BUG_REL() which takes
> the address, file, or function reference as parameter.
> 
> Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v2:
> - Rebased to v6.9-rc1
> - Added Tested-by:, Acked-by:, and Reviewed-by: tags
> - Introduced KUNIT_SUPPRESS_BACKTRACE configuration option
> v3:
> - Rebased to v6.9-rc2
> 
>  arch/riscv/include/asm/bug.h | 38 ++++++++++++++++++++++++------------
>  1 file changed, 26 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/bug.h b/arch/riscv/include/asm/bug.h
> index 1aaea81fb141..79f360af4ad8 100644
> --- a/arch/riscv/include/asm/bug.h
> +++ b/arch/riscv/include/asm/bug.h
> @@ -30,26 +30,39 @@
>  typedef u32 bug_insn_t;
>  
>  #ifdef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
> -#define __BUG_ENTRY_ADDR	RISCV_INT " 1b - ."
> -#define __BUG_ENTRY_FILE	RISCV_INT " %0 - ."
> +#define __BUG_REL(val)	RISCV_INT " " __stringify(val) " - ."
>  #else
> -#define __BUG_ENTRY_ADDR	RISCV_PTR " 1b"
> -#define __BUG_ENTRY_FILE	RISCV_PTR " %0"
> +#define __BUG_REL(val)	RISCV_PTR " " __stringify(val)
>  #endif
>  
>  #ifdef CONFIG_DEBUG_BUGVERBOSE
> +
> +#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
> +# define HAVE_BUG_FUNCTION
> +# define __BUG_FUNC_PTR	__BUG_REL(%1)
> +#else
> +# define __BUG_FUNC_PTR
> +#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
> +
>  #define __BUG_ENTRY			\
> -	__BUG_ENTRY_ADDR "\n\t"		\
> -	__BUG_ENTRY_FILE "\n\t"		\
> -	RISCV_SHORT " %1\n\t"		\
> -	RISCV_SHORT " %2"
> +	__BUG_REL(1b) "\n\t"		\
> +	__BUG_REL(%0) "\n\t"		\
> +	__BUG_FUNC_PTR "\n\t"		\
> +	RISCV_SHORT " %2\n\t"		\
> +	RISCV_SHORT " %3"
>  #else
>  #define __BUG_ENTRY			\
> -	__BUG_ENTRY_ADDR "\n\t"		\
> -	RISCV_SHORT " %2"
> +	__BUG_REL(1b) "\n\t"		\
> +	RISCV_SHORT " %3"
>  #endif
>  
>  #ifdef CONFIG_GENERIC_BUG
> +#ifdef HAVE_BUG_FUNCTION
> +# define __BUG_FUNC	__func__
> +#else
> +# define __BUG_FUNC	NULL
> +#endif
> +
>  #define __BUG_FLAGS(flags)					\
>  do {								\
>  	__asm__ __volatile__ (					\
> @@ -58,10 +71,11 @@ do {								\
>  			".pushsection __bug_table,\"aw\"\n\t"	\
>  		"2:\n\t"					\
>  			__BUG_ENTRY "\n\t"			\
> -			".org 2b + %3\n\t"                      \
> +			".org 2b + %4\n\t"                      \
>  			".popsection"				\
>  		:						\
> -		: "i" (__FILE__), "i" (__LINE__),		\
> +		: "i" (__FILE__), "i" (__BUG_FUNC),		\
> +		  "i" (__LINE__),				\
>  		  "i" (flags),					\
>  		  "i" (sizeof(struct bug_entry)));              \
>  } while (0)
> -- 
> 2.39.2
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

- Charlie

