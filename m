Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D47E43B3F7
	for <loongarch@lists.linux.dev>; Thu,  9 Jul 2026 18:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783622489; cv=none; b=Wkq2ll11q8TsF5EzeV3Gi9Bbnt09TjicnZ/+Ru1sR44Vboc1HcNAnx2YG3vCzZ3Mg0DuiOqdb6ziMsQOk7e8iTCREejtHstlrHOqjnr2LlxOMySPv/wNfK6V2h7Da+fa81AMsZpzpzxqckNw7kW4wojlg1NQ5hOmNF8BCvEWgqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783622489; c=relaxed/simple;
	bh=x/B73ZAx/OZvPWDOjgMBsyCuVlSuIzuC3lusVvx1Is4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tavuu8X24XjO59De0MIH3ctzG7m0OxOxMSVNIh/BTgGJ46ELsjMJ4LmFBMhMxzzJWD8SLBzLARXb4K6bvXcd0BibDyRD1BdqcpAg1HfJQkMlzspzttYgx3z3OQH7WFBVO13CaPQgWCO7zW46ZA/im4L2JnYht+eRXMZEicUyWs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eUSNDhSc; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eUSNDhSc"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84861fc51a5so92786b3a.0
        for <loongarch@lists.linux.dev>; Thu, 09 Jul 2026 11:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783622485; x=1784227285; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aq4oHRjffhbqNLpraCJHXQbfXmiONMD/vVc6qcgWJtk=;
        b=eUSNDhSc1yJzzTk6e77huQcaJDxrvri/XcH0fcs46H0uggdYWV6BnuRlSdQHyRsfQP
         Ts+YlEhdSE9J4j6pifz/sF64MGtRY3/FlOBOYpNIitOMnWR8m921kVidJyG2HmG6C51i
         jvhcHToq0EXkWPBjglmF+cjQ72Y5UVRiFuj8b6yV/vgP54/uezDqtIopyKnip6g9WL2s
         xzPjoxMFmzt6zBiy0BGDijmEKpTjnc4wbx4oHrO6hOq6vibDoYCs50PQ+lIeelyO24i4
         /iYoMuUTDUHqIaXAuf6UBYV8DRqJbafR7h+xc5eLV1SYbzMUzLjiGJf7avDySlf0QAKU
         AvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783622485; x=1784227285;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aq4oHRjffhbqNLpraCJHXQbfXmiONMD/vVc6qcgWJtk=;
        b=MRL913C/B+g+dJVUtSEL98uhBbZ+ozUW5Uap0hr7vzuYmn1URtsVDQCKLC8/bxFzn3
         zkEV1Ku+Us63eE6hHu2HxDspLwvv6t4PMdyxxt9d2EMyVS25mZ7OMEa7N68vr62EuvRf
         fed/JaemwSHBrcYzuvJfS/BrD9kdzj8Y0Viucw8Ris8vO9PC8b/+GXpZmLlmRp7QUSn9
         T3vw1MCtHUq3A3z676bbZW899ESMEjn/jvmSoHZXiApm6CG5s1og0UoRcXUUXyqLWBr3
         bVZPX/qNGr4M6HzjCtUDsON9gscEgEeZD8VlF9Ch9TOfkOuumS6J7UBu072Qe9wjm9SE
         qjOw==
X-Forwarded-Encrypted: i=1; AHgh+Rqd59fyGcZsTUig+uxGDVweiHuj5+9VZNvw6RKHcYSGVal8SrcgPrdrT2QHEIVMt7+fLYPSky7iwyY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwOYcngKqPnLN52DSt9nnoIGvri89DrxtaXFdFPX32ZS8cKwUDQ
	NqgxRuxtn4HYY2OzGpWI/shVSo5BvznRpNaLWb95ClWW1xMLQk7ZTA20
X-Gm-Gg: AfdE7cntBhoXYuzY3repUA/c5Rd3yy5OmKOFHCIt+F6ZLRkdnCDKEmG9Mt+pWe4ZLtv
	2wNhFmizu1E9ErjDKC70wKs5G2qwnL6GbFgEqywoGSOIrkmETZhcm5Ocm9NXd7cRxvqa4HBw4Rg
	a+mKTsbUsU1cpPzu1Yn2kNP4mDiC2PrENu8a0VDLSi9zlYSZ400qYt+1BVVhORl7Nc4KzQRPufY
	OJe4aDBdDEpzx70oqMd/I1popLxysmWJWb+H6AEwnWKH4v1NDKq+qRAa1xPYfiu7Sy6fzXZY0RQ
	6kybf2nAUS5Fy2sQ6QVv+WGpstkY/HgNrKrXun2fkWvnFVAfFKOO8VFqrFKf3nSTXgReK5ivWEQ
	Ivw2S0BZr/IdOWrV+8EGFCwCMJEZcdUhDcWTG9tT/v+VvrdOu//2isANhQqjgBmAl1FM0KZeUVZ
	OLror0c94fIymOqs52s8jTu7qdKH2vhu1CdwbV8C6nIPyfZpsQ1E5/ApRHD1Jt
X-Received: by 2002:a05:6a20:3d0c:b0:3bf:80b8:9c8a with SMTP id adf61e73a8af0-3c0bcead1e2mr9967332637.6.1783622485265;
        Thu, 09 Jul 2026 11:41:25 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d7c8bsm35321002c88.12.2026.07.09.11.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:41:24 -0700 (PDT)
Date: Fri, 10 Jul 2026 00:11:04 +0530
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
Subject: Re: [patch 05/18] powerpc/syscall: Use
 syscall_enter_from_user_mode_randomize_stack()
Message-ID: <ak_rL1RfdQVJ6zeq@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260707181957.433213175@kernel.org>
 <20260707190253.918861529@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707190253.918861529@kernel.org>

On Tue, Jul 07, 2026 at 09:06:15PM +0200, Thomas Gleixner wrote:
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
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Shrikanth Hegde <sshegde@linux.ibm.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
>  arch/powerpc/kernel/syscall.c |    4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> --- a/arch/powerpc/kernel/syscall.c
> +++ b/arch/powerpc/kernel/syscall.c
> @@ -2,7 +2,6 @@
>  
>  #include <linux/compat.h>
>  #include <linux/context_tracking.h>
> -#include <linux/randomize_kstack.h>
>  #include <linux/entry-common.h>
>  
>  #include <asm/interrupt.h>
> @@ -19,8 +18,7 @@ notrace long system_call_exception(struc
>  	long ret;
>  	syscall_fn f;
>  
> -	r0 = syscall_enter_from_user_mode(regs, r0);
> -	add_random_kstack_offset();
> +	r0 = syscall_enter_from_user_mode_randomize_stack(regs, r0);
>  
>  	if (unlikely(r0 >= NR_syscalls)) {
>  		if (unlikely(trap_is_unsupported_scv(regs))) {
> 
Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
