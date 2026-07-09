Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C8E437472
	for <loongarch@lists.linux.dev>; Thu,  9 Jul 2026 18:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783622422; cv=none; b=EI1oSG0ZxNytKE8nhO+cMljTKWIiJyoK2ZTDe8qWYHkfjJWgIOZXRSBCeelAVD+vXzyu0aqeaCXtkExkbdt/bcMuVEkNSTME+qBGKrvAqIoEkxo8/EWznGhSyY93iKwhqRNnL5RonPuNEdjBbZXbtTJMd1pvCai/5jI3C1atKJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783622422; c=relaxed/simple;
	bh=rnI8Mtk7zFh67ToOxrITQJjhD2smVc7SMC3A0Srfn7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G14pEQF+ipxnGOAQvGcMSZA4IBXUMZu16pdyp/pjB6n8aAWbyBNwgtVSJ8GkrJpdmodtnV93DFYHmkwI9T7nzEb68cj6ZHWxf6kCjTulzmkDE+h1YOz+jrN1ScFLMt5tl/fbg3RuKfyCUVNdLEB8Q3qHRRtz8B7gtZx2CNH85Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IyxbYCMG; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IyxbYCMG"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-ca97d139d8dso89020a12.2
        for <loongarch@lists.linux.dev>; Thu, 09 Jul 2026 11:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783622419; x=1784227219; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v3NWG3nzWzn0lD5brSEphHHDIxNRitNNFv0e1po41sA=;
        b=IyxbYCMG1jdLGTwXOwn1A2vmW5sjA5Izuk5j7w5whi9YMvkMMlzxqmqCt8BLYLlDAd
         UECzOaMakNoKuHWMGfKAu4xLz5c4iHjczPO01aUT2Z4gnSSoGL1Q6iE5I8xcDo+vxt/P
         HiJo4gcO3nFPLT5M8xb1N4WoAG284wG2QB7kFQs0nmNExSrIvN0/VgbLpkyOW1UkZyM0
         yAGGqF8ja3OfIx0EtMjAGxIpVghHVsJLkrgG91qfd/aDHovFJM4KQkUGLZH8fuNBszpy
         iHmaRCM9NVmdGiRAZ385m3XMwr2NpF3+j/GeHEJLY7ICrc+rHL+Zpc9F3sVqbHhU+GzG
         aD2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783622419; x=1784227219;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v3NWG3nzWzn0lD5brSEphHHDIxNRitNNFv0e1po41sA=;
        b=XMhWYQjDGCDwEOFyS77yYffsmmyzVGN1NpI9QfxsX22kx/a1rpezpz6q4oeX7IDaru
         yxm1O5Bjc7DfaiPi9Lpadd+PRwRybcy+uJ21FNmy45zpPIkVeA25XiCRHvAvtvbeySqK
         TK8Q/mQT4PYC7B+rafn2aBPibdqwvSKEiJE/A4I5IujSIYNChESz+5udeKp8yYCls7IU
         FMkjYy2TAIigb0Z9aZ6yzDJzTxNFl3yEaSVRiZUQdD51WvMrC3UGm+o66jPU0LNRyTT3
         xrgp1WLIz9S0L+eV+cG+IuubvpdaYhbai6esNpGt9tJU0lCALH268yg74uuHnF8pEu9n
         UVBg==
X-Forwarded-Encrypted: i=1; AHgh+RoHh1HAZm7JIaDAQZTi06KBHaZDw/KR4Qr5F1Qw2FK0/YROFybUVtp1d2YxNpe6Snnmd6gazo8gVkw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxuyHMBkHriHj8+MwYuAU/DI6ECkMTIxiRCJtCx0LkUVucNsGeP
	JrMPsIvx2PRawfC0F09qOify33+nhpalyzf5/S0vDWDWU3UQfuierWHv
X-Gm-Gg: AfdE7ckJEsW1fuV4fFyIFbkKoydtUwkuzjowsvdJzKFpmH3RNHA9RXw9QCsk6Z3/knX
	t2Ex62JvKQH3LPXQffJmdw8C6Pgp/Cu5cjHEgwySXdet2uQghf4IW1j2Yujido718eoVcj58apv
	1p3mNVr7Z7EL+12weo9mFsXimDZWOTipYk4ikj3woqNMsPxgYzBAS1vdEnKM41TQiAticrmoR3h
	xyQrIuV5/++sJu1d+cvAt1B4SvgegYUmwIvIl9irsI8CJtyxB25u1q1ueeMMYwoCgoaNXWEeuJH
	ySNnuwK/v2YJRGuhp0Xfxwjl5nqbMeZPGZAGaMTTRLlIzPeaMpt1oqLelwCiGCXLx5fupTwBG4V
	/MWKin0tYKw4pneLPkwutvMwq8grHS8t51JT/B+w8ujRVFLMav1JcWehLKKXbBqRwcqWPPQc3G0
	pAK8dJdrujnduO4vgInu4fe4U6DG2jh23LijFYg7Wv4TQxAKeQP3BMXIUWdhmq
X-Received: by 2002:a05:6a21:4902:b0:3b4:8300:7019 with SMTP id adf61e73a8af0-3c0bcf656a1mr10343651637.18.1783622418932;
        Thu, 09 Jul 2026 11:40:18 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3118ee6091dsm28653518eec.14.2026.07.09.11.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:40:18 -0700 (PDT)
Date: Fri, 10 Jul 2026 00:10:01 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	Michael Ellerman <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Andy Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Helge Deller <deller@gmx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Richard Weinberger <richard@nod.at>, Chris Zankel <chris@zankel.net>, 
	linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-um@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>, 
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, 
	Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [patch 04/18] loongarch/syscall: Use
 syscall_enter_from_user_mode_randomize_stack()
Message-ID: <ak_q9qWuifFdo_9S@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260707181957.433213175@kernel.org>
 <20260707190253.865955911@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707190253.865955911@kernel.org>

On Tue, Jul 07, 2026 at 09:06:11PM +0200, Thomas Gleixner wrote:
> syscall_enter_from_user_mode_randomize_stack() replaces
> syscall_enter_from_user_mode() and the subsequent invocation of
> add_random_kstack_offset().
> 
> The advantage is that it applies the stack randomization right after
> enter_from_user_mode() and thereby avoids the overhead of get/put_cpu_var()
> as that code is invoked with interrupts disabled.
> 
> No functional change.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Cc: loongarch@lists.linux.dev
> ---
>  arch/loongarch/kernel/syscall.c |    5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> --- a/arch/loongarch/kernel/syscall.c
> +++ b/arch/loongarch/kernel/syscall.c
> @@ -11,7 +11,6 @@
>  #include <linux/linkage.h>
>  #include <linux/nospec.h>
>  #include <linux/objtool.h>
> -#include <linux/randomize_kstack.h>
>  #include <linux/syscalls.h>
>  #include <linux/unistd.h>
>  
> @@ -70,9 +69,7 @@ void noinstr __no_stack_protector do_sys
>  	regs->orig_a0 = regs->regs[4];
>  	regs->regs[4] = -ENOSYS;
>  
> -	nr = syscall_enter_from_user_mode(regs, nr);
> -
> -	add_random_kstack_offset();
> +	nr = syscall_enter_from_user_mode_randomize_stack(regs, nr);
>  
>  	if (nr < NR_syscalls) {
>  		syscall_fn = sys_call_table[array_index_nospec(nr, NR_syscalls)];
> 
> 
Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> _______________________________________________
> linux-snps-arc mailing list
> linux-snps-arc@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-snps-arc
