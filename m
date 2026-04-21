Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F0E3BE630
	for <loongarch@lists.linux.dev>; Tue, 21 Apr 2026 11:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776770576; cv=none; b=Sv+wJ/bn7cZ+3lFIM2zqbUnGdkyQ4cr/v2Te5SNSkadpDO5auTIH+HRR6VJbUWhT6jhifMNqYdfeCiLAM3kyKp1vSzgLHIgzWnLSKEV0GTtygtanqVrNVogDlHPmV2LR9NmPjizjh7WkCLrOSDkIM0DP/mbw/CieMu6AiZHb/5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776770576; c=relaxed/simple;
	bh=7J5sLUyTcEtZ5b/o54KJz2TjlXrWGH0W+oigsdVGJYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qkAwih4ysMmyabH1mUakM68Sfs7EtZcIJFZ/xeIIFFBE4/c0ZVxKisXG9qTDiusO5uNhdZWvBqa9CMB+sPSm8Iyr72F/1UcDktnpb8aKlDiv4TevaOxe+XfLpQKBCuc7O03VSmEf3VPz8rNOHmRJbxoMPbrQB8OpLLPfezRvmUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qt5tYEHs; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qt5tYEHs"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82f33d28c1dso2248099b3a.3
        for <loongarch@lists.linux.dev>; Tue, 21 Apr 2026 04:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776770574; x=1777375374; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pbepvZoiaQHnY8ojgGndHUN0tqRJnJo2KRx8HLgDgUI=;
        b=Qt5tYEHsZVMsVADO5g2oK6XlFXsGr3FzRRPhYPG4oIGd443zerq+6ihtJV+Ke67qd5
         K7q9KpnwT2VI61yZ85yHOQHu9wHdNv5orMPh7nZW4WiRveCSqkVe3jabuksJPJE39j2L
         JTQPHw8uTCL30IrpWghB6+nJ5nwUuKLUXDK4NrooFT+rENWXZKMIxsmg+yNkC4TXEVJJ
         1hws5n0Vgjv/Go1vlznQwHoEy73Lqelz4gH8RYDIAYGTOJ8WJ5yB/KLd2psWU/iIWNOv
         4rz/TEn4hJ9YmBNzxgYhDC/1Rr6heZWkyZ9/d41PasihBhzClTeGDdU8Ma2c4OPMoi2D
         /YLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776770574; x=1777375374;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pbepvZoiaQHnY8ojgGndHUN0tqRJnJo2KRx8HLgDgUI=;
        b=r5/A0KcMBbh8qKd0Umck0uO40veujgzTHh1EWWaWHGFCyWaUgPhWXfDRQky138KK0O
         ERXlsz1dU5a4ZLrD9MqcXcsOp8vPnE7W74P7mFs4354f7llZl/KmOZG2ev+Az67j1uHO
         GKUX83RWK4BFpp4cL2q32jec4kmjTIK3h88d+rQDoS5QFQ4KrUgrDxwOodkFy/Xqpa+A
         TYUbjMqECaYl6I6bd9Ks4Pj7d2zcTC74TZwTSq9GeM3PIMym61NE/Cs/DfBWG/toltMN
         aoeVOXQB94vtBbt/uufT8vlZxfyYzWGPQEyUdyQEJN3SarKBIgjzzUCHCPC9O89Qn7ic
         lAqw==
X-Forwarded-Encrypted: i=1; AFNElJ/zrDPJLxyu8Lrx75bBnxAniGd8ScYRW67Nzc157CTk95ioER1j13+Q/WxNrXvrm6fhb8D3yFhRWvE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxnHvJqPEVrqCdskBv+QYYQg+nEZ3EFeE4jtTj2QUUynDcH/4fn
	MIsE/HYBl/6/yPQLrT+fDe2XW7gJdfbHs0uZePMsra5eRFnPYvr0ZW7j
X-Gm-Gg: AeBDiesRjD28+rWwGfnXna/VT4jZTsX0mnEVpX1EEmpexAbhOrimkN2gafpVOVyNoYU
	D0E2W6DoOMlQm6bevdClGHUJEQEVDx8xjE7fqgq4NEXCYODwlbqYJ8T7NeKjSQtDcl6QuZ8ArfB
	cIWvhWWMntVXJikP/ijp5pBydbgH+jm6srKt/Yit7p/Oq1XPQcjJQ9Q5/UNFZd7WFL4UKnpa56L
	nRGH0Mg+tPhmyCadugwuKkMJHetqDCePMdAyHiOjk179G90IRzynj5EyyZhSBigsL/laEY9ohe+
	298LrSUdDWki7a+rF4LkXaPz7OHgGHkBGZAI6xWPevK8cZe57pWYC2OQqO7NUbAeBznV6eXfWOq
	mpd3H0br6ngNPQbG5337O6UAzTEHCE23W5TIM1OHATyuJ1E5Q5kvSQPwlyG9zf9GtEH4EJ0tRpK
	EZ4PpZSBfAsNZQEaX/MIumDn/7h2WCnaqI0mJtwNrrzEMmQffulGiyxdUtnM7X8ogSZHIsxooej
	wyyng==
X-Received: by 2002:a05:6a00:6988:b0:82f:aae5:c7a9 with SMTP id d2e1a72fcca58-82faae5d438mr7228492b3a.27.1776770573719;
        Tue, 21 Apr 2026 04:22:53 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e981a0asm14155014b3a.3.2026.04.21.04.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 04:22:53 -0700 (PDT)
Date: Tue, 21 Apr 2026 16:52:37 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, 
	x86@kernel.org, Lu Baolu <baolu.lu@linux.intel.com>, iommu@lists.linux.dev, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	Herbert Xu <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org, 
	Vlastimil Babka <vbabka@kernel.org>, linux-mm@kvack.org, David Woodhouse <dwmw2@infradead.org>, 
	Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org, Theodore Tso <tytso@mit.edu>, 
	linux-ext4@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Marco Elver <elver@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Thomas Sailer <t.sailer@alumni.ethz.ch>, 
	linux-hams@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, 
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
	linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Subject: Re: [patch 33/38] powerpc: Select ARCH_HAS_RANDOM_ENTROPY
Message-ID: <aedc9UddBSYXzrAj@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260410120044.031381086@kernel.org>
 <20260410120319.789114053@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410120319.789114053@kernel.org>

On Fri, Apr 10, 2026 at 02:21:09PM +0200, Thomas Gleixner wrote:
> The only remaining usage of get_cycles() is to provide random_get_entropy().
> 
> Switch powerpc over to the new scheme of selecting ARCH_HAS_RANDOM_ENTROPY
> and providing random_get_entropy() in asm/random.h.
> 
> Remove asm/timex.h as it has no functionality anymore.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
>  arch/powerpc/Kconfig              |    1 +
>  arch/powerpc/include/asm/random.h |   13 +++++++++++++
>  arch/powerpc/include/asm/timex.h  |   21 ---------------------
>  3 files changed, 14 insertions(+), 21 deletions(-)
> 
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -150,6 +150,7 @@ config PPC
>  	select ARCH_HAS_PREEMPT_LAZY
>  	select ARCH_HAS_PTDUMP
>  	select ARCH_HAS_PTE_SPECIAL
> +	select ARCH_HAS_RANDOM_ENTROPY
>  	select ARCH_HAS_SCALED_CPUTIME		if VIRT_CPU_ACCOUNTING_NATIVE && PPC_BOOK3S_64
>  	select ARCH_HAS_SET_MEMORY
>  	select ARCH_HAS_STRICT_KERNEL_RWX	if (PPC_BOOK3S || PPC_8xx) && !HIBERNATION
> --- /dev/null
> +++ b/arch/powerpc/include/asm/random.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_POWERPC_RANDOM_H
> +#define _ASM_POWERPC_RANDOM_H
> +
> +#include <asm/cputable.h>
> +#include <asm/vdso/timebase.h>
> +
> +static inline unsigned long random_get_entropy(void)
> +{
> +	return mftb();
> +}
> +
> +#endif	/* _ASM_POWERPC_RANDOM_H */
> --- a/arch/powerpc/include/asm/timex.h
> +++ b/arch/powerpc/include/asm/timex.h
> @@ -1,21 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef _ASM_POWERPC_TIMEX_H
> -#define _ASM_POWERPC_TIMEX_H
> -
> -#ifdef __KERNEL__
> -
> -/*
> - * PowerPC architecture timex specifications
> - */
> -
> -#include <asm/cputable.h>
> -#include <asm/vdso/timebase.h>
> -
> -ostatic inline cycles_t get_cycles(void)
> -{
R> -	return mftb();
> -}
> -#define get_cycles get_cycles
> -
> -#endif	/* __KERNEL__ */
> -#endif	/* _ASM_POWERPC_TIMEX_H */
> 
Build tested for this series with allmodconfig and allyesconfig on ppc64le
machine for ppc64le.
tree: git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git getcycles-v1

Boot tested for this series on powernv9 qemu, powernv10 qemu and pSeries
power11 hardware.

Tested-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>

