Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CB1313543
	for <loongarch@lists.linux.dev>; Sun, 12 Apr 2026 08:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775984199; cv=none; b=kDC7SsXk5wra1AMqeFkIt3hHD+ZGcqWLQ/1+sH3nU0R/p72PXJuoEnJ4uUUYVXOVOFXcEgrWL3oJh9cIt4ydQMLbo1jbwhh+CbkFHmFKtv9bnVsVG+PylkAyAXAbqfpAd7QhuCQ84eZtWJsmf8h9c/UEko7KFUYRfOotErD5rh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775984199; c=relaxed/simple;
	bh=XZtsBYJ+xUzK/w66hhh7L4ep5/Nv3d9zyXSTiNiHtzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nBob1VLEdl1atvMzGDs0etxC244oFJtMYX1AdWgnFihD+AU7zegupmZAjnW6yk8Pa0oXr+P+fvoPGSzBxbhbyptXAd3G69clAMaue5FC9LCNVY9Hh9qoIEcAOZoNYKmifZkdt++NpAeeKNnTcQmQ5owvfkSjLT7qbYWa0X7k/5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BmMcTnV1; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BmMcTnV1"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488b8efed61so31603495e9.1
        for <loongarch@lists.linux.dev>; Sun, 12 Apr 2026 01:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775984196; x=1776588996; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EbDgrbrkQIZIzHMqS4zyFwb8jbE/7QCDRz8zhtNheE4=;
        b=BmMcTnV1OowlZqbZ1jrfd98WJphSxWy5+lBeGqwecH8euKBjY4tFO0fQHQTkJRIZ7w
         pWnkNg9AnO/PL9hOQgGXOjyiiRrRYM2UIuQG8eSMEeVKlHlHuIMjyqA97ASczbe+hnKs
         FbqazQ1Q1ySH4XwT1wrqQaMu2BUSrc0RoN3VZ4QqSPuZnnBQnJ6R6UCvI/SpdZ6xm2aj
         BCO1iktwBXd1krkdeTlXoTdqvfQsdgof72VbJkP+bmp4bTPH/DmsfwPtEIENYaR7FQ4c
         nt+J9lzzOYKvA3eBoaa8sed5Ql4ueHYFP3QnePmfv9+xw6yrcDgaeFpiVSKT8CAGDynV
         G1Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775984196; x=1776588996;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EbDgrbrkQIZIzHMqS4zyFwb8jbE/7QCDRz8zhtNheE4=;
        b=kd9xDhyQFtVMqxvx5ZfOU9uK8hZokJtuyjDrYw1gSXlRe3UvHgocR5EQnx/ptjF9T8
         ntKL1Hhiu6zkWAiAivHpt7HkkiS+ura6hCbc6GyOCFbb3nzWIxlkdrg+8yDkUIVY8Cw5
         10w0N4XfnzLWE5MWSF606lNQVasovYfguuw6CdshC4JPsw6XfmGsMrEKdoPqIIf7p2kY
         bBAZiIH3eZvSNeAi2QLWGdm4/cvcWzRYc4wZrJapdzLIet9fPjux5bH3M1rA/Amh+eeC
         5ylPsOBEKXLCl9g1qPGuGeFePx5MvGNsodNlyirumHrBo9btxeWKVLIEuTfVXHBP3wzO
         ECQg==
X-Forwarded-Encrypted: i=1; AJvYcCWWjRoOU+YMOLu4tw3glBrc5f9X3F4RX4HqyoDLnl3BfsAOejKqxYP0byzt7VdxAx5N2vGJL5H5COc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/Phl8lzRhel1sGlZfcZ6+wy3KbbHLT/d3uMSQDxd4ulHfztNj
	uoahe7oiZBMYG85CMOzMO86+zOwWPzZKfa8sj9IRoUJvx04tnKMt4PCK
X-Gm-Gg: AeBDievAil3yMzRJzD/c09ePVGExumO+FJtIjH2fCWhAG8GwsOemOvCYBZgkDjf2cZ+
	W+O9t8WYldt1bziW3irEaIRaa+ZtYILkEgjjoTEkMKW4XNzLfw3ZAEEq42Qtj0+I692lkKOpmJr
	KxdabTnNjM3JyS4NBObmdh2YoFLp8jSdjTb4A5Ciq8jOxvYD3t785BabGoKdkctECHObSEfCyy7
	BdeRA89ZDt5fqnQ2mTUQSo3sKi+3XomKgbRaQjq3+Y8/lHgf2HGaK2lXvLnNzKapKMccHhXcZLP
	BYYx+DXBt4OkPCvnmE4WbQiLZYkcOHYB/pj0PikjSr4X0P1h6VSVRLC+GCK4BpewjPuQv2vGYhv
	wjwKCeyT+E2FBKw55BjSIjlFoASF495LwPd4HQ8lCYt2UypaV+C1Zf0Y62vv050ImlSiL5jqnZ+
	tMOHytjm677yK7OTviAV/U7E8TTi3wCciXIHL3xXNhVL/3kR2GRH4H/p0kAYfDQOIXJkhjORIVZ
	9QjTQ==
X-Received: by 2002:a05:600c:698d:b0:487:22ad:403e with SMTP id 5b1f17b1804b1-488d6ac9ce5mr126951995e9.14.1775984195334;
        Sun, 12 Apr 2026 01:56:35 -0700 (PDT)
Received: from localhost (brnt-04-b2-v4wan-170138-cust2432.vm7.cable.virginm.net. [94.175.9.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d532ed4dsm197923925e9.4.2026.04.12.01.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 01:56:34 -0700 (PDT)
Date: Sun, 12 Apr 2026 09:56:33 +0100
From: Stafford Horne <shorne@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Jonas Bonn <jonas@southpole.se>,
	linux-openrisc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	x86@kernel.org, Lu Baolu <baolu.lu@linux.intel.com>,
	iommu@lists.linux.dev,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-crypto@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>,
	linux-mm@kvack.org, David Woodhouse <dwmw2@infradead.org>,
	Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org,
	Theodore Tso <tytso@mit.edu>, linux-ext4@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>, Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Thomas Sailer <t.sailer@alumni.ethz.ch>, linux-hams@vger.kernel.org,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	linux-alpha@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org, Dinh Nguyen <dinguyen@kernel.org>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>,
	linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>,
	linux-s390@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	sparclinux@vger.kernel.org
Subject: Re: [patch 30/38] openrisc: Select ARCH_HAS_RANDOM_ENTROPY
Message-ID: <adteQSw8c65MtX5l@antec>
References: <20260410120044.031381086@kernel.org>
 <20260410120319.593798781@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410120319.593798781@kernel.org>

On Fri, Apr 10, 2026 at 02:20:55PM +0200, Thomas Gleixner wrote:
> The only remaining non-architecture usage of get_cycles() is to provide
> random_get_entropy().
> 
> Switch openrisc over to the new scheme of selecting ARCH_HAS_RANDOM_ENTROPY
> and providing random_get_entropy() in asm/random.h.
> 
> Add 'asm/timex.h' includes to the relevant files, so the global include can
> be removed once all architectures are converted over.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Jonas Bonn <jonas@southpole.se>
> Cc: linux-openrisc@vger.kernel.org

This looks good to me.

Acked-by: Stafford Horne <shorne@gmail.com>

> ---
>  arch/openrisc/Kconfig              |    1 +
>  arch/openrisc/include/asm/random.h |   12 ++++++++++++
>  arch/openrisc/include/asm/timex.h  |    5 -----
>  arch/openrisc/lib/delay.c          |    1 +
>  4 files changed, 14 insertions(+), 5 deletions(-)
> 
> --- a/arch/openrisc/Kconfig
> +++ b/arch/openrisc/Kconfig
> @@ -10,6 +10,7 @@ config OPENRISC
>  	select ARCH_HAS_DELAY_TIMER
>  	select ARCH_HAS_DMA_SET_UNCACHED
>  	select ARCH_HAS_DMA_CLEAR_UNCACHED
> +	select ARCH_HAS_RANDOM_ENTROPY
>  	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
>  	select GENERIC_BUILTIN_DTB
>  	select COMMON_CLK
> --- /dev/null
> +++ b/arch/openrisc/include/asm/random.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#ifndef __ASM_OPENRISC_RANDOM_H
> +#define __ASM_OPENRISC_RANDOM_H
> +
> +#include <asm/timex.h>
> +
> +static inline unsigned long random_get_entropy(void)
> +{
> +	return get_cycles();
> +}
> +
> +#endif
> --- a/arch/openrisc/include/asm/timex.h
> +++ b/arch/openrisc/include/asm/timex.h
> @@ -9,13 +9,9 @@
>   * OpenRISC implementation:
>   * Copyright (C) 2010-2011 Jonas Bonn <jonas@southpole.se>
>   */
> -
>  #ifndef __ASM_OPENRISC_TIMEX_H
>  #define __ASM_OPENRISC_TIMEX_H
>  
> -#define get_cycles get_cycles
> -
> -#include <asm-generic/timex.h>
>  #include <asm/spr.h>
>  #include <asm/spr_defs.h>
>  
> @@ -23,6 +19,5 @@ static inline cycles_t get_cycles(void)
>  {
>  	return mfspr(SPR_TTCR);
>  }
> -#define get_cycles get_cycles
>  
>  #endif
> --- a/arch/openrisc/lib/delay.c
> +++ b/arch/openrisc/lib/delay.c
> @@ -18,6 +18,7 @@
>  #include <linux/init.h>
>  
>  #include <asm/param.h>
> +#include <asm/timex.h>
>  #include <asm/processor.h>
>  
>  bool delay_read_timer(unsigned long *timer_value)
> 
> 
