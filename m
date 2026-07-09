Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093D643B489
	for <loongarch@lists.linux.dev>; Thu,  9 Jul 2026 18:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783622634; cv=none; b=EP5dXFsGV9qrvYARY/nf8tsjWQyZ++sNYWoxuLePgevHvgCjLHkHvREmjqJDFJmo0C/tExAZJWgHUVIfy6x5u928bY/C0o5o9Df71bI//vEreXGTZNAX2JdeqyBo75ajwsaQhlHbkgmJ1MbjaEKAw9MVGip7OdrhIxJqvExK5zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783622634; c=relaxed/simple;
	bh=5522vd31FFvseMtFKZmNLN0MO3Bnoibk1qUMw3Ml4Kg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fJ8pLwRuBuIblv418epjwmdVRD70UwNgwqJCp2rftOR3omwB93dvIBxIwimT99snQrqgqszFKWn31ypGTgL6VClt8xvZaVnXHnsz9JWvLfD/01nUYRpvRQzNN0z2IQaEd/dRZW+NUXTs4L8KT3b7lZZtERGR9WLNYDTwmD5ogYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ODRXHoDj; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ODRXHoDj"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so227084a91.3
        for <loongarch@lists.linux.dev>; Thu, 09 Jul 2026 11:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783622632; x=1784227432; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0SnVDTLPnMBjkQSM4oCN+URozdUIH28ywJdKUrWn7bI=;
        b=ODRXHoDjfTxo0rc1twBFjcFfRjtHJI6zLv1sFtp+LeKIhMug0Ig27VePTjDgnDzkcW
         Jfl5rgRINj87pu53qcU/OI5NzadAKe50G5Hvh8U4Sa7IF4CuwJZZJH29Dj6zKmV3q7kV
         rI/d1HGDmKz4WddV9+WCZ2ExaQjoTh775nfeweckCvh4uPUhpUyGPm3MLIyPV4mtYcqP
         l8tUzcuMA4LjaqBJG9+wLlSIoWlZc4EDnVE8RdnhQ7yUWkTrRd7Q91jjvSsDC4KeiK/a
         UZLVAYtN03ZQyI9EygaFNwR1ihlo0QW+LQR+wX1WZTlqZ7QJnrAUUy+ZkWKpRBKy/50O
         uTXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783622632; x=1784227432;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0SnVDTLPnMBjkQSM4oCN+URozdUIH28ywJdKUrWn7bI=;
        b=jTQB+fGvHJTF+ItFIQE7DtBgaE/B+MwP7A6X0++yclltjziw5jKQrPIYBr+f6Vx1fu
         3+cYhNW8Vi0XzgYOILpsx4rUzATd9feD84gSBb9yGNie/IVt8lG30yKPirFwXOmhE/A+
         qbdxxMRNRT0Kp9mRD1kMw1qnw0PdlWO7X+jtci8zAkcEYPbx/b1UuSe3Qak3nOCVV1yy
         LMHfE4a6WHNU1JlRL1yVdOwvDgX8ktsweHRFKTW5EC9jnuIh39wHveGdM1cPxMHS4APq
         KeAqh6A4wjs/lZtcFI25vYGLpeqeVwY92rTI77vV2VyESRS47T2HinHaqmbD/lnva6bP
         Zpuw==
X-Forwarded-Encrypted: i=1; AHgh+RpHUX28xkysRAApbTtecZMkLC1NepHV9AYIOC09zcfHZgNG+zDFOtsGpB7Ltg3mTt4/sDTy9Xw4fis=@lists.linux.dev
X-Gm-Message-State: AOJu0YzVwjmNGDDVBILNZ27LyigO8D/vR8NJvllgZaVGVwHm3hrbK4kR
	QIrBROmOSvzMqvsrW1cfv2obZKGe4u0vtD49EzA4C5f6DtOakjcPukNq
X-Gm-Gg: AfdE7cnefDj+2UUdDrdGnkIcbG0ZSGK2QZcH8Xu9vJ0DFe6o1FJjlvEIGR5fgIJjL/F
	Pj4FVWOXYQ5SW3Hx1YJ9GTZbJ84IP1HSvcQnuVWFF1SVG5CO9gbTuU0fh1dUz1bDtbNqaGDp+eV
	O+Hctpt4w0CtAa4vquGod+jqnALpvW9n8YIOQ92YhojbCw+Q4x+0YyrPrIpQ6ogmDP5BjbYjtGS
	DrmZdDwChIiDtIM6FfARO3DxSlCD/85rneN8l4OSnqFuCQWlSnhkXl6sFKeRNeNcAJRf17OiUc6
	CsAHO2/y7AGt4gHaDiHBr54eA9vsRilHGEII2vo94nqH/Nj8bHWuEmQIvbaOvsJOsPjQGj43m8x
	r9+p7XRKCH+U7DIMTdjSdgsGQNhfkcn+DcjR/L4Mn0YLF+bWHqv9uMEjcKeEZhfWObRIFFifXBz
	3WW1gezcPy1c6jmhJkc+XOSerng3CL+8m05O4FbDyj0wwzEd8rr1fZyR1hpVPn
X-Received: by 2002:a17:90b:564d:b0:387:e0db:3d90 with SMTP id 98e67ed59e1d1-38943d404dfmr8538131a91.43.1783622632431;
        Thu, 09 Jul 2026 11:43:52 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accb0esm35673867eec.30.2026.07.09.11.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:43:52 -0700 (PDT)
Date: Fri, 10 Jul 2026 00:13:32 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, x86@kernel.org, 
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
Subject: Re: [patch 07/18] s390/syscall: Use
 enter_from_user_mode_randomize_stack()
Message-ID: <ak_rx2gFCLtG-Qpy@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260707181957.433213175@kernel.org>
 <20260707190254.030598804@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707190254.030598804@kernel.org>

On Tue, Jul 07, 2026 at 09:06:23PM +0200, Thomas Gleixner wrote:
> enter_from_user_mode_randomize_stack() replaces enter_from_user_mode() and
> the subsequent invocation of add_random_kstack_offset_irqsoff().
> 
> As a bonus this avoids the overhead of get/put_cpu_var() in
> add_random_kstack_offset().
> 
> No functional change.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Sven Schnelle <svens@linux.ibm.com>
> Cc: linux-s390@vger.kernel.org
> ---
>  arch/s390/kernel/syscall.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> --- a/arch/s390/kernel/syscall.c
> +++ b/arch/s390/kernel/syscall.c
> @@ -97,8 +97,8 @@ void noinstr __do_syscall(struct pt_regs
>  {
>  	unsigned long nr;
>  
> -	enter_from_user_mode(regs);
> -	add_random_kstack_offset();
> +	enter_from_user_mode_randomize_stack(regs);
> +
>  	regs->psw = get_lowcore()->svc_old_psw;
>  	regs->int_code = get_lowcore()->svc_int_code;
>  	update_timer_sys();
> 
Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
