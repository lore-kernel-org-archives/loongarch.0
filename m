Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5EA3B38BD
	for <loongarch@lists.linux.dev>; Fri,  3 Jul 2026 11:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783077223; cv=none; b=b/CvxoFhskpPGNQ8mPg7xvzQSyZbIhHeytWbCCfq2PBtuLlYaY1ZZVNiMHjIGZ16yn3eY+3WFMPBonEGvUofgYX2KrAKItYwhsOuoNEPo8k58JWBl9IdWQWaTW4sWvxZZ/8eQlm4RwKVyy0tcu1NeNV5UUqBJFGJKraIGRSkFG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783077223; c=relaxed/simple;
	bh=0R/8mfoGHKVSozW1Ez1MzZvYqXwfoib+2mD9On0/6SM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kdePwKHAq87gc+VmuTPoU9Uaf7cqNZHFh6XhFIOzsHh18n5dBEJnsb96msKidks8yIaMFe6Z0nx/AsjAJ3jIo6/EeDUPxMun08sw7j/wCR5ARFwD1w2fN2XGfA/yX2VqUVpavlrGKpGQwaJCAOif96qKAS/+nbZ8TL6wpvqNg7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B+Pn300V; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B+Pn300V"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-847a5528b33so215344b3a.3
        for <loongarch@lists.linux.dev>; Fri, 03 Jul 2026 04:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783077221; x=1783682021; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A/K+DNLo6Rw5LUNC5Lpk7uYC0BgYbu/q5E/KtMAPChI=;
        b=B+Pn300V0X1+LcrGkHqHK4qtqY5X0N6ncASNvPMbxEEb8ZXoe2C1qpsKn3cFg0BfPW
         t9l27hiYpkSlcUbAhyY0vVPziUNOUeKJOZtGsT/32B4oawYMJ6827f1ucXO42oZ7oCzY
         YasUNkydghjN2ycH2sD72TX0uo1nAM15kwNU+UG3sb5iqe9Qf8dK/79dqfXRqcVbz0Qb
         7cZZYTjUsEfaBJc4yxZiQKLRd3BvJRhiDRM71siy3MkmMsyYVJOyoxa3ou85Dq+QU535
         zD4zaDFRuGV2+iBBbptviYj3xIVhpYY2ezZNeGgp2pUcuACKgPgb3GTg+dYbtJf9dTKv
         83tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783077221; x=1783682021;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A/K+DNLo6Rw5LUNC5Lpk7uYC0BgYbu/q5E/KtMAPChI=;
        b=ZvbRewkRfL27ftbUZkydwy7ccjMV8eD7/QX7dseYz1qzvIEESMvMbCgcDSrLfN/dnw
         mqjimw6Vv1e7Ton7Rf2Q9rfyRYJIT2LSj0QEqjg6MvxKKwZDXIzD6iag1m4IvTyKk0ng
         R4VDi+xagoDpOki4y48D2UOb5omFxQu9SY1cCLiSiRpaduqsgSfKAYW0yIwKY+fYFWXw
         1B8uwASRn713E47zvRsImbhMajxwwN45DvA/DdEZpHkQosgtLNjIxyUHBRzF9RQcNEuY
         NCr/eFMWKLMKaH8q8bRTKvqhjfruSfub56A/3yX7EBQr7cjvJQec1d1u0Gr7HPIAj1v/
         c5qg==
X-Forwarded-Encrypted: i=1; AFNElJ+3/rQoZnpQVd/ZNRE4n3hE6DyvlnKofJ3Ojx2953Cc0MRIAbKoZN6CvnLq/E7TvB0eCtL0Lz8derM=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywt3gVqCEyzqnwjHw3WVUsYp1nTIQfEGZsXeOuym+H+2F9lTFr1
	ONjsqlBQrReK4jB7qmF6lyCiWxTOXAylJEmMLd7oUABex4/KdMsiwp/l
X-Gm-Gg: AfdE7ck7wMhMoNskQm10II1P/oOdM5dU9/Krj2CN+wFEsO0UvtDQlSq6TjxL9gvxv8X
	wNsjs+zYlcifUJ5aRd4o4v7svKGP/6X0Obe+yQORr/xrs8EQy+KsTZDHAsQwmU8T1Tn5fPyC+Sj
	Y+kl8UDQ5bW7/LYTSTPAPWVzq9o0yGPEtQKDbSk2DhQRt5Na/FtXmLubsfs54UrYw+xs/vFmLap
	tgg355oP6i467FzjdDbVQzcDmu162vebzlStj7COBWLoDnAF5MY4FmsGBtvRxcj2b9Yy2iku/NA
	h0SAj0jSsyFh2k9ZG3aJ6OCf42r2Gje6nNzyHpcafXNEdnWkdFsVBq1RK3U8WbsEKAxcPzGFhQc
	d0Wr2cK0vvDZMvEgUou1/fK6Re47yXQ2O8Dgu3ZCOZZo4OTS32EU6xaipAF77MbtGP+dGSVrSSu
	gSI1c37zWt4QVDafjzOwWMJGnvbxqNu6N3WnYqPUQvd5Ogx3uxYryRoo0w5H/7
X-Received: by 2002:a05:6a00:ac8a:b0:847:9c3a:b77f with SMTP id d2e1a72fcca58-847c512cab4mr8348296b3a.35.1783077220720;
        Fri, 03 Jul 2026 04:13:40 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb6dc4d0sm2701298b3a.3.2026.07.03.04.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:13:40 -0700 (PDT)
Date: Fri, 3 Jul 2026 16:43:11 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oleg@redhat.com, richard.henderson@linaro.org, mattst88@gmail.com, 
	linmag7@gmail.com, linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	kees@kernel.org, guoren@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, 
	geert@linux-m68k.org, tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com, 
	deller@gmx.de, maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	borntraeger@linux.ibm.com, svens@linux.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org, 
	glaubitz@physik.fu-berlin.de, richard@nod.at, anton.ivanov@cambridgegreys.com, 
	johannes@sipsolutions.net, luto@kernel.org, tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, chris@zankel.net, jcmvbkbc@gmail.com, 
	peterz@infradead.org, wad@chromium.org, thuth@redhat.com, mark.rutland@arm.com, 
	ada.coupriediaz@arm.com, kevin.brodsky@arm.com, linusw@kernel.org, yeoreum.yun@arm.com, 
	song@kernel.org, james.morse@arm.com, anshuman.khandual@arm.com, 
	broonie@kernel.org, liqiang01@kylinos.cn, pengcan@kylinos.cn, ryan.roberts@arm.com, 
	yangtiezhu@loongson.cn, sshegde@linux.ibm.com, mchauras@linux.ibm.com, 
	austin.kim@lge.com, jchrist@linux.ibm.com, arnd@arndb.de, 
	thomas.weissschuh@linutronix.de, sohil.mehta@intel.com, andrew.cooper3@citrix.com, 
	jgross@suse.com, kas@kernel.org, x86@kernel.org, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-um@lists.infradead.org
Subject: Re: [PATCH v16 02/18] syscall_user_dispatch: Introduce a weak
 fallback for arch_syscall_is_vdso_sigreturn()
Message-ID: <akeYzL3uQoxaddgU@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260629130616.642022-1-ruanjinjie@huawei.com>
 <20260629130616.642022-3-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629130616.642022-3-ruanjinjie@huawei.com>

On Mon, Jun 29, 2026 at 09:06:00PM +0800, Jinjie Ruan wrote:
> Currently, multiple architectures (LoongArch, RISC-V, S390, Powerpc)
> provide identical stubs for arch_syscall_is_vdso_sigreturn() that simply
> return false. This results in redundant boilerplate code across the tree.
> 
> Introduce a default __weak implementation of
> arch_syscall_is_vdso_sigreturn() directly in syscall_user_dispatch.c that
> returns false. This allows architectures that do not utilize a vDSO
> sigreturn to entirely drop their redundant inline definitions.
> 
> Architectures requiring a specialized check (such as x86) will continue to
> override this fallback with their strong symbol definitions.
> 
> Clean up the redundant implementations in loongarch, riscv, s390
> and powerpc.
> 
> Cc: Thomas Gleixner <tglx@kernel.org>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/loongarch/include/asm/syscall.h  | 5 -----
>  arch/powerpc/include/asm/syscall.h    | 5 -----
>  arch/riscv/include/asm/syscall.h      | 5 -----
>  arch/s390/include/asm/syscall.h       | 5 -----
>  include/linux/syscall_user_dispatch.h | 1 +
>  kernel/entry/syscall_user_dispatch.c  | 5 +++++
>  6 files changed, 6 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/loongarch/include/asm/syscall.h b/arch/loongarch/include/asm/syscall.h
> index df8ea223c77b..946886794ced 100644
> --- a/arch/loongarch/include/asm/syscall.h
> +++ b/arch/loongarch/include/asm/syscall.h
> @@ -85,9 +85,4 @@ static inline int syscall_get_arch(struct task_struct *task)
>  #endif
>  }
>  
> -static inline bool arch_syscall_is_vdso_sigreturn(struct pt_regs *regs)
> -{
> -	return false;
> -}
> -
>  #endif	/* __ASM_LOONGARCH_SYSCALL_H */
> diff --git a/arch/powerpc/include/asm/syscall.h b/arch/powerpc/include/asm/syscall.h
> index 834fcc4f7b54..4b3c52ed6e9d 100644
> --- a/arch/powerpc/include/asm/syscall.h
> +++ b/arch/powerpc/include/asm/syscall.h
> @@ -139,9 +139,4 @@ static inline int syscall_get_arch(struct task_struct *task)
>  	else
>  		return AUDIT_ARCH_PPC64;
>  }
> -
> -static inline bool arch_syscall_is_vdso_sigreturn(struct pt_regs *regs)
> -{
> -	return false;
> -}
>  #endif	/* _ASM_SYSCALL_H */
> diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
> index 8067e666a4ca..987c9a78806f 100644
> --- a/arch/riscv/include/asm/syscall.h
> +++ b/arch/riscv/include/asm/syscall.h
> @@ -112,11 +112,6 @@ static inline void syscall_handler(struct pt_regs *regs, ulong syscall)
>  	regs->a0 = fn(regs);
>  }
>  
> -static inline bool arch_syscall_is_vdso_sigreturn(struct pt_regs *regs)
> -{
> -	return false;
> -}
> -
>  asmlinkage long sys_riscv_flush_icache(uintptr_t, uintptr_t, uintptr_t);
>  
>  asmlinkage long sys_riscv_hwprobe(struct riscv_hwprobe *, size_t, size_t,
> diff --git a/arch/s390/include/asm/syscall.h b/arch/s390/include/asm/syscall.h
> index 4271e4169f45..5f310caad1fc 100644
> --- a/arch/s390/include/asm/syscall.h
> +++ b/arch/s390/include/asm/syscall.h
> @@ -89,11 +89,6 @@ static inline int syscall_get_arch(struct task_struct *task)
>  	return AUDIT_ARCH_S390X;
>  }
>  
> -static inline bool arch_syscall_is_vdso_sigreturn(struct pt_regs *regs)
> -{
> -	return false;
> -}
> -
>  #define SYSCALL_FMT_0
>  #define SYSCALL_FMT_1 , "0" (r2)
>  #define SYSCALL_FMT_2 , "d" (r3) SYSCALL_FMT_1
> diff --git a/include/linux/syscall_user_dispatch.h b/include/linux/syscall_user_dispatch.h
> index 3858a6ffdd5c..73d69e02807d 100644
> --- a/include/linux/syscall_user_dispatch.h
> +++ b/include/linux/syscall_user_dispatch.h
> @@ -10,6 +10,7 @@
>  
>  #ifdef CONFIG_GENERIC_ENTRY
>  
> +bool arch_syscall_is_vdso_sigreturn(struct pt_regs *regs);
>  int set_syscall_user_dispatch(unsigned long mode, unsigned long offset,
>  			      unsigned long len, char __user *selector);
>  
> diff --git a/kernel/entry/syscall_user_dispatch.c b/kernel/entry/syscall_user_dispatch.c
> index d89dffcc2d64..acf545774d37 100644
> --- a/kernel/entry/syscall_user_dispatch.c
> +++ b/kernel/entry/syscall_user_dispatch.c
> @@ -32,6 +32,11 @@ static void trigger_sigsys(struct pt_regs *regs)
>  	force_sig_info(&info);
>  }
>  
> +bool __weak arch_syscall_is_vdso_sigreturn(struct pt_regs *regs)
> +{
> +	return false;
> +}
> +
>  bool syscall_user_dispatch(struct pt_regs *regs)
>  {
>  	struct syscall_user_dispatch *sd = &current->syscall_dispatch;
> -- 
> 2.34.1
> 

Build and boot tested on ppc with P11 LPAR. LGTM.

Tested-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
