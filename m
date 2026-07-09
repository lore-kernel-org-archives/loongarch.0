Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CA93C1402
	for <loongarch@lists.linux.dev>; Thu,  9 Jul 2026 19:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783626218; cv=none; b=QgrMdODiO1fgxdtUdLyN0n7uAc6Dvz6Mu2GwidzM6sJ0OBvYn0drHAT0xL5cr0+NtlSpL+HETUcGeW34KfUhrBQzuPdsfs/gV7d894r4FMr1jtFEjH4GpHOba4nXi+3vgVLC86mT18yK2OxZubmJmBp8pi9r9SasA7pPY/suxII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783626218; c=relaxed/simple;
	bh=jWS6CuM01KL0TKzupA5IpoB96YuuBOzox4OyTj5L3ho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=etNzbFKGmHQHXPi6IWD57ivhoP8nrEK8ZcPM3yzscEO95nwEVPJ8sNwniOt92LM4cuGG6ZmRYJdXadfT8wNWclKS/lxro7IuVGRbzqOxksyDJdysJcv5J8eDKVawtv7OUAPR652vYLoy8YyMbTrKreUZahRjviGJ/NxM8f4wyrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b+kAfNGt; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b+kAfNGt"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84861fc51a5so134704b3a.0
        for <loongarch@lists.linux.dev>; Thu, 09 Jul 2026 12:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783626215; x=1784231015; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vcViCEZV9Tm/crNMdaH3VAbncnTvlz/mpQaPDKjBGxQ=;
        b=b+kAfNGtFlnT87Xrn548wrM+/2Ru1kH3qG7yG03KE5rIUrijXXJDaoZWrgnf589uKB
         dPOq7IIPifblaEOfz0kRqOT+xdDpSb8HuqqQbfWWeaBUgO8ss78CpmcCFNd2Bk3oc6S1
         pxdE7Mj0tGvj+c5hcpQhMEK5HBhdPPLzc0OAYm8SzVS93GAcFwM80TZtiLl1yfeDjQrg
         wz0uE5lhKHpsu2PaRm1amK4BBo5z84/jXqpptaztzfcRsZ3eXpsMqJT/KAESKCxdfxJz
         kg7FYyU+hY6TfKZQwAfUq01pzMl0IXlavSgbLd6N1lmJXioxsBzbOBs66wZISyomEDKK
         B1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783626215; x=1784231015;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vcViCEZV9Tm/crNMdaH3VAbncnTvlz/mpQaPDKjBGxQ=;
        b=CQk9flLiqNFis2i3J4Hk7hCbO6WNFlf8kjxO9ZIkER3BC8IDGjJU4xiJxkekJjfTNp
         E02MDOmXHD9HXg4d+5shGPwf3gthrhEWbTkMnqnRT5ZONx631eBOtMyhSb51JU/LZzV0
         V1taKpdMOaJWYLM5nbxvLKZ8yy6oS2bXLqVX0N3dgnf6zJdlCP9+iIqeAr9lR6VK0By6
         t7BFw5JjS5PPG11r5+5zyR0t1cjo6rvPN5O6OgDIaOyb3sc/gQjZN3Mn1BZf6GwOceZ8
         CoNTyIUz/fXtaJucvWNNn5PWXu4C/y/tJNsxc6pbOgKQQPD00B+bylj3DsUsbwMVNAMw
         rSSg==
X-Forwarded-Encrypted: i=1; AHgh+RoYmglO3ThpPdrjsxho56ZhqCM08KQjHjUa8EGia9jrucOg6OgvmB00I/MaHAgM+6qKnJMQeRDbM60=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyke2/9PdN/y/GkdHoYzMMM2BPmbp123Th8zz6AQzqqv3cawnD7
	byk6xYbto45+AIqaVES9TfVylqbQ66AuhfsQv9COyoY0rjiN3MBqo8HR
X-Gm-Gg: AfdE7cmj20beUeepSnVIwG6Dcb/XvzY0Q1BNdrWRdQy/cXInB/CorLYwFbcaYr7MgyU
	RaQ6AevE8txoONJi8Gc11JrQLiyI2/zOdOXi96/4d4IMphFcVe7l7uev6RP7x3YihCmDZKo7po/
	kqXZ+sKn1awqAq5bhtmzjKHuyIzZJ9x47X0+CbqHfqia1W8T2sbJVAgFUJ+HHvnm0qTwaEmCGne
	HQ7LDiIWns+Ckcg0iRbJMrvzin8nONpiPS+1dGD0wSVDvMpTXERyyOh4n2RFvAAONayj+5X89X9
	7qLkAbXNHY1QSBHkh5lfbnJ4048H4gU2kSw/KhAQd1VwdzzGhiS5HYWOVDbXwcFMTrd9LrZwv4A
	iiWkEH7ZVjo3wlgtO/v+WU/YVaECt3ymwG1/p5DqSiQiH1BgnSdXh+luOiBsQfZyhRYSYtr24Ro
	GwoEpwQw54b7s3NzZ/aSS8qiE0dr80vE9rKQFY14d2oAfIo47WfhUgHQ0LqEh9
X-Received: by 2002:a05:6a21:6daa:b0:3c0:9c1a:8949 with SMTP id adf61e73a8af0-3c0bd287dd3mr11145411637.65.1783626215188;
        Thu, 09 Jul 2026 12:43:35 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b6593c9a1sm39667491c88.2.2026.07.09.12.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 12:43:34 -0700 (PDT)
Date: Fri, 10 Jul 2026 01:13:15 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>, 
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
Subject: Re: [patch 15/18] x86/entry: Make syscall functions static
Message-ID: <ak_5y-p4DPztR-CH@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260707181957.433213175@kernel.org>
 <20260707190254.438361565@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707190254.438361565@kernel.org>

On Tue, Jul 07, 2026 at 09:06:57PM +0200, Thomas Gleixner wrote:
> They are only used in the respective source files. No point in exposing
> them.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> ---
>  arch/x86/entry/syscall_32.c    |    2 +-
>  arch/x86/entry/syscall_64.c    |   10 ++++++----
>  arch/x86/include/asm/syscall.h |    8 --------
>  3 files changed, 7 insertions(+), 13 deletions(-)
> 
> --- a/arch/x86/entry/syscall_32.c
> +++ b/arch/x86/entry/syscall_32.c
> @@ -41,7 +41,7 @@ const sys_call_ptr_t sys_call_table[] =
>  #endif
>  
>  #define __SYSCALL(nr, sym) case nr: return __ia32_##sym(regs);
> -long ia32_sys_call(const struct pt_regs *regs, unsigned int nr)
> +static noinline long ia32_sys_call(const struct pt_regs *regs, unsigned int nr)
>  {
>  	switch (nr) {
>  	#include <asm/syscalls_32.h>
> --- a/arch/x86/entry/syscall_64.c
> +++ b/arch/x86/entry/syscall_64.c
> @@ -32,7 +32,7 @@ const sys_call_ptr_t sys_call_table[] =
>  #undef  __SYSCALL
>  
>  #define __SYSCALL(nr, sym) case nr: return __x64_##sym(regs);
> -long x64_sys_call(const struct pt_regs *regs, unsigned int nr)
> +static noinline long x64_sys_call(const struct pt_regs *regs, unsigned int nr)
>  {
>  	switch (nr) {
>  	#include <asm/syscalls_64.h>
> @@ -40,15 +40,17 @@ long x64_sys_call(const struct pt_regs *
>  	}
>  }
>  
> -#ifdef CONFIG_X86_X32_ABI
> -long x32_sys_call(const struct pt_regs *regs, unsigned int nr)
> +static noinline long x32_sys_call(const struct pt_regs *regs, unsigned int nr)
>  {
> +#ifdef CONFIG_X86_X32_ABI
>  	switch (nr) {
>  	#include <asm/syscalls_x32.h>
>  	default: return __x64_sys_ni_syscall(regs);
>  	}
> -}
> +#else
> +	return -ENOSYS;
>  #endif
> +}
>  
>  static __always_inline bool do_syscall_x64(struct pt_regs *regs, int nr)
>  {
> --- a/arch/x86/include/asm/syscall.h
> +++ b/arch/x86/include/asm/syscall.h
> @@ -21,14 +21,6 @@ typedef long (*sys_call_ptr_t)(const str
>  extern const sys_call_ptr_t sys_call_table[];
>  
>  /*
> - * These may not exist, but still put the prototypes in so we
> - * can use IS_ENABLED().
> - */
> -extern long ia32_sys_call(const struct pt_regs *, unsigned int nr);
> -extern long x32_sys_call(const struct pt_regs *, unsigned int nr);
> -extern long x64_sys_call(const struct pt_regs *, unsigned int nr);
> -
> -/*
>   * Only the low 32 bits of orig_ax are meaningful, so we return int.
>   * This importantly ignores the high bits on 64-bit, so comparisons
>   * sign-extend the low 32 bits.
> 
Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
