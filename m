Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE1338F93B
	for <loongarch@lists.linux.dev>; Sun, 19 Jul 2026 11:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784460349; cv=pass; b=CFhEBO11yWtsWhbHJKHJDkcx1zon0/jClt2NkL6qEUD7JKbEYipZn1SddmYHMJEdAqg2RozTH4SGSHAiszddPRYDTYicYs3kPYlH2cNEHfRPQOvfs8Xd42sfjfgRZKM8OurYTZGUYt1FI3JgR1cG2NE+TxpGMAyUqTCHMbBhT1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784460349; c=relaxed/simple;
	bh=rgcqbxa6lEmJgPeR85dLIKFK2p9ERX+2iKovNt7jIVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ldTmxO2Tnm0vw9s99LXrUAOzGajGh3ETPx+50N6yNlkjsEJ+9h+4/q+NSdgIcQ3GdLBiBt70cUHuN8ZwjFffo1st/Dmtql4cBRdnHZ6La7NvpTJywmfNOyabNECT+SRWWE8mXo5VbPMsAGjBA/X/cGl1tOdE7b2n6lDjNxRpZ2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sEl1nA1q; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sEl1nA1q"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-69c600f76ccso9261066a12.0
        for <loongarch@lists.linux.dev>; Sun, 19 Jul 2026 04:25:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784460345; cv=none;
        d=google.com; s=arc-20260327;
        b=qBmyE9AE83iM55jfSff+XbzJRU0h0pYAWSgJOFicGSASOYLzXZP/lwsUgrtK3ygMKQ
         xIAy12LxJEEDRr+3B7wOPtd2Kow3Lp13jGWdHOyNwXnQX2BI1lBs9QMEhg0yS1zYkZ9Q
         VBJiT61Y/kiogMycxEA2FFBsWA23ZLTzYajpum42G4sGeQgw39RxnrPNGiv6sz5yE30T
         3kOEm1vwa/4m8iRnJxXppY+rjV+b4iibNPaqa8D/kshnjXQwGw2wp5pri7TyCwyIf3EE
         OrX1S/dR1cbl7jZZS+mOf8Zl9X7oqtSljcJ1n5HcYsfZVZtEKueyoRRbca8PqkVZydmb
         tpxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HjwBEg56Cr9vHNVIU01sUWrlM5gmQ+vCUXpN04JdIto=;
        fh=sAds406PTEp1QZnoYVtzXAf0vF1iAKJNzko7XQ/gMqM=;
        b=e2e5ms8ogyDhoadS9tmKCoMR+klcPh7liOoch+tzspBtOPuwqyVOWDwxxRTBPjxhzp
         pAGzJ9iuPxSnXW1n9gFd3qmIDgvwxfoXoYcX3Nd7vFaGfqKjONhghKfs7Z9e8s7RxBvb
         GKQgZ4r7LpLlzcndDSN6QSsdfYEjk0ClK6b0Fs5PpZpb1Z3yLTE/SKPbVqhzNqwNWVAW
         vS9Nw+jmf7EdQCcH/7hfB1Vn8fOJs8MtlloXc5FvLb5pnFibL/s0+ghaq60Ofvt137Vc
         80J6F8ujCJ18lD/ryqqjWhPyCWtgK9Pd5zW7Ae6ebn7+ihnErJGW2+/6+EgY3VUyzgFo
         /5wA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784460345; x=1785065145; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HjwBEg56Cr9vHNVIU01sUWrlM5gmQ+vCUXpN04JdIto=;
        b=sEl1nA1qQjp7Pgk1QC1vnqavf05oPjJMQjNuAo3BQKFCgCCifx26rDEfVFOQBure48
         2aUVPzN+1oP+ljSY94Lnhw3ezQ9NPJjikpsomNGIfxe5+4mbJvvlBYqS+y+I45zS2FlS
         lnGlymMf2KlR/M820RmOtZqZrsn3/ZBvUeXvBGBE6x6e1A4hnXDxDHu94m0vF3QTcdQJ
         8FJd1UP5qn9S7+vQQj7iVhRl/wMlr/jmjkGJI9v6hYtoHjX+BuvP6x1jbzIZU8i+Bil6
         bvOYXKXitUDhiyUijJ/uacBw4aGCgMIUFkHlrOPOlC7qi2YRRvP5vJlIOXi0wgwuj0Rn
         vFYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784460345; x=1785065145;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HjwBEg56Cr9vHNVIU01sUWrlM5gmQ+vCUXpN04JdIto=;
        b=sMYalUdFI7Joh6gbY11FcLW9KkkA378vT8DGQyYFPQG1qAPCnEPhGbly+7yb8Tsx4t
         3DhO/frSFU23ieaxUjjZ+QucMgY+MMzHGobVU8NddQ+pyXPS+kag76LKRZ5glxlo5cn8
         J8WW/2CemR9HNCaYS4AG0jfIfe9+HGniVSRZZEj/Z4TkHrLG7fIpPsKuuS5BuWyceca5
         hXM7dC3vFzIU+6ddGM4vmkLCNkljtEa00lJ37bJNw10sbTpWRi3ZF5AejxtkHvL4gMCG
         1mVc1ZFE1d+9tRPfOr0uGuuz7/bVQhkgLuxXp5mV9YKSEvUKYKJUZ4f1b7Jrt/GSxmTP
         5Qsg==
X-Forwarded-Encrypted: i=1; AHgh+RpxRPgDjPXhcw27nrYh0hlVNVAaIh5J4cBImKxSeAwiXtlHGBtgKN13uOUw0sPg55+vbDv9YEYycqE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxn29iKTy5bpNaHCEV9XFB5urpN5X0h8OD0WX+vJvKntPxTgABw
	ieMDp8tG8l48Zey5Xm7M0hC3bKUzEYTE7qkC0U5FDgWWpLIQ6OdR+KAkoRBmhhogY9cn7qycsgE
	r/uqZU8Mjk/09QCpBfYYpu8h1M3Xy5FY=
X-Gm-Gg: AfdE7cmaxWC2dnVrodgXEFcmxDnSAzTeTGl4XMyZmd9xGSI4kzevZ9S8juIa4f8GvBx
	qZDKlWNm3hQI82tIPZiLQH/GmSs2oDvMnZr1LQhUWeFcZTdM93a58+2HJvOcfgCcZKirE7rp+Yf
	RFW8HhQn+Tl/sYmBDWdU3seIRzcvd2RYkLCwXVyGVirp+MWuqoVDmjY8q6AFBX7LoI3iUrHuDvN
	ScqXSD3MatUyhHxdQxX7usdOHaR9sOyh0XzUhlU5jIk8Ike84Mn+mxWNPhNneApWKhAX4RaoRNH
	uDa1qlAOQ7hKEY/vNmyPyCiPE4HagZUd8M03vwme/g==
X-Received: by 2002:a05:6402:34d5:b0:698:3b7b:e48a with SMTP id
 4fb4d7f45d1cf-69e652f908dmr3652615a12.32.1784460344585; Sun, 19 Jul 2026
 04:25:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260707181957.433213175@kernel.org>
In-Reply-To: <20260707181957.433213175@kernel.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 19 Jul 2026 13:25:32 +0200
X-Gm-Features: AUfX_mzTzrHRlu_CZJHA0P1GUw_Z2tfq0CbfsG-DFTqsEJDFIQx7LWbdfB3YWqk
Message-ID: <CA+=Fv5TDNH8+JAojV9_W36kUkEE68uiA00FQ7i0vJunebqs1sA@mail.gmail.com>
Subject: Re: [patch 00/18] entry: Consolidate and rework syscall entry handling
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Andy Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Helge Deller <deller@gmx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Richard Weinberger <richard@nod.at>, Chris Zankel <chris@zankel.net>, linux-arm-kernel@lists.infradead.org, 
	linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-um@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>, 
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-arch@vger.kernel.org, =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> With that all architectures using the generic syscall entry code follow the
> same scheme, apply stack randomization at the correct and earliest possible
> place and skip syscall processing depending on the boolean return value of
> syscall_enter_from_user_mode[_work]().
>
> There should be no functional changes, at least there are none intended.
>
> The resulting text size for the syscall entry code on x8664 is slightly
> smaller than before these changes.
>
> Testing syscall heavy workloads and micro benchmarks shows a small
> performance gain for the general rework, but the last patch, which changes
> the logic to be more understandable has no measurable impact in either
> direction.
>
> The series applies on Linus tree and is also available from git:
>
>         git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git entry-rework-v1
>

Hi Thomas,

I did another round of testing of this series on Alpha, this time with my
Alpha GENERIC_ENTRY conversion rebased on top of this series.

For this test I also manually applied the seccomp fixup discussed earlier in
this thread, i.e. fixing the recheck-after-trace logic in
__seccomp_filter() along the lines suggested by Jinjie/Oleg.

With that in place, the kernel boots on Alpha and I do not see any
regressions in the seccomp_bpf kernel selftest or in the strace testsuite.

One note: the seccomp_bpf selftest run on Alpha uses this not-yet-upstream
Alpha selftest enablement patch:

https://lore.kernel.org/linux-alpha/20260203063357.14320-1-linmag7@gmail.com/

One Alpha-specific wrinkle I hit while rebasing the GENERIC_ENTRY patch is
that Alpha cannot unconditionally pre-seed the normal -ENOSYS return state
before calling into the generic entry code: syscall_set_return_value() also
updates r19/a3, which is still syscall argument 4 on the normal entry path.
Doing that too early broke early userspace mmap() during boot.

The Alpha conversion therefore handles this on the no-dispatch path instead:
after the generic entry helper returns, if the syscall is not to be invoked
or the resulting syscall number is invalid, Alpha skips the call, preserves
any ptrace/seccomp/BPF-provided return value, and only synthesizes -ENOSYS if
the return state was otherwise unchanged. That was needed for the
TRACE_syscall.ptrace.syscall_faked and syscall_errno seccomp_bpf cases to
pass.

So from the Alpha side, with the seccomp fixup applied:

Tested-by: Magnus Lindholm linmag7@gmail.com

Are you planning to send a v2 with the seccomp recheck fix and any other
review fixups folded in? Is the intention to route this upstream
during the next merge window?

Thanks,
Magnus
