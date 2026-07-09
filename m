Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CC63AC0C9
	for <loongarch@lists.linux.dev>; Thu,  9 Jul 2026 18:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783622763; cv=none; b=UlRP2OJulB9XMtq8BbmOkgUirtPb78RWNIF53o8fviiQbctcr59jy6Axibkp2iiZh1Ur5u5htfK1zF0jQVmV7dNsHuKEVlz0ereQmitjbERDrQX7A86YoN11srqkjPf6xH0HopOTWV8KjXB89kehTT1UFeb299wudzIBCdpGYcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783622763; c=relaxed/simple;
	bh=A1OBNebquFU3MF2aPZ7eZX3e0k19s823QYdyxywOM48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F2LXvybnQ8wA5NcSJ53CHeFlGo9CjJIylTH5EFP92P1mYu3bwyHUxW/ddngUttH2pUt9di7/D738r5fL/RuO7/hFaUoylJVcgptayvcXEt7Ld3HDfesUzV+p+glz8xLvp65rU1MF+10u8YcMJsaBYo7tgkOdF++Oh8wfEJT9/pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BW1V2gu0; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BW1V2gu0"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c998fd549a8so109074a12.2
        for <loongarch@lists.linux.dev>; Thu, 09 Jul 2026 11:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783622760; x=1784227560; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QPf+9G20chtvWfhmlbsBAcrLn3a4nXZU9b8fTPixMo0=;
        b=BW1V2gu0P308j+8CpfOYVSR8rb89ouQecLiCCwFs8JiIiTRc3m1QLznMJth0igv5Rw
         j5vm4s59N96YdMfzDEF12WfnQig8pcQgTQp50qhlsYm6qnxA77+/DjYdT1d67r7xSBU2
         JxtxJR3ET37dCs5Q7kyJLtfIuP+wqfr47TcEaqShgT7tYApg3yl8B0KaOMLOSL/FUiOM
         DnTdFpaI4g2BPMz8201SuKxT4BbTxmNQkL69pFDjdN2r9DHFm8ZAyRhpknXipeP5W3KF
         RQxCGLO2kn+SuO6K+KBjZ2d8g4oShLByIFBv+huaofgzHRs+qz+ACBvO4c7Rfb1nP1rh
         mf/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783622760; x=1784227560;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QPf+9G20chtvWfhmlbsBAcrLn3a4nXZU9b8fTPixMo0=;
        b=OTm9QAjNMCs2uk+zMUq99LdsKbNfjdhPxH1PDG2ECwMIbJt/sTDgmoi+yx9kVRt5/S
         Qv+iPLO0EiCHBoDUBF7aR3MGf+cN2+Xztdzw7YuZ0Kd+Ix597w8J6e6K9g9UywwJf9W1
         l8XoS9SwTwliY1DzPTWgj6XeKLi9GpiEhiSZfgVS1mUKpsCMrzvBQ4qoAxcvVLDJ22pK
         Kk0ju8gshHLn2fOiI/MNZwXhbmdYm8fWG6ojeKa4VIsBhRY+G0cmBdlj1AMr6czRFX10
         0GNp9q70p09bgKjSHYSlY02WVd2CqUs5IKa3SqstY6gscWC42NZUzX+UfUHGqvLHp2jn
         8rwQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqd2DfyOnWn04WpfgA/kBgSMwtGnMaXu0PUtYfv5moH3ox5o2Ngv+LCeMVbAbjYclINOAqPx/rItMM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3ewOvWIWxM+PvMf2u5Fs90hRt5mQD2Dps0WORxcEXLY2mmKFT
	GywCJaDf/pTvxGYdlBsSPH4mycEvbdM08DWUorJYk36/LYWiawZ9VAIk
X-Gm-Gg: AfdE7cmJSWNr/9nm2YAdX08Q96AfLIf1nhZgAzrlhDNOFRaSENMwbYsk3AbHS3w8p8q
	8QkJ0OZwvkoi9UXoLALnbQ7fxLarY7KtBdcNM7sNqvWx7ub2JnWQy4qlbcr7qzDWcrdMQXtcaId
	NaVOCSmqqRV5qTz7vaGJ8tI2bMyIz1FKKv7+u4H9g5amIaCe7cr5nDDqZrxy58bBzmTsAV4TrBo
	TALVvnye40nW6A2OGv2E4nvKJWpCpoRe6SdgMq3NivE/5vuDgqnr2aenmw5HD10Y3bDUy5aU+Kg
	ZknZxYwompL6XFmk0P9xzzK4U/OTFp1J0Sq24rX4rRKTT4PnRCYMmWCA9O1G7ZT9kgPdKLY4bfd
	ggC30KthzEvfpppesFoyJLtRUD+5woFTOuGM7O/pAGiXhcpmcXs5tytxfBvGhHFFtZUrly+05T4
	oYYNKs5OrdiJzYT/uzjb9ZYHJLsnYPY0LeQjqOK/HeR7b2LFRIypd4/UgvS15y
X-Received: by 2002:a05:6a20:430b:b0:3bf:ae43:4d26 with SMTP id adf61e73a8af0-3c0bcf49cacmr9958974637.5.1783622760038;
        Thu, 09 Jul 2026 11:46:00 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f596asm33384231eec.2.2026.07.09.11.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:45:59 -0700 (PDT)
Date: Fri, 10 Jul 2026 00:15:39 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, Michael Ellerman <mpe@ellerman.id.au>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Andy Lutomirski <luto@kernel.org>, 
	Oleg Nesterov <oleg@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Guo Ren <guoren@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Helge Deller <deller@gmx.de>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, 
	Chris Zankel <chris@zankel.net>, linux-arm-kernel@lists.infradead.org, 
	linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-um@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Vineet Gupta <vgupta@kernel.org>, 
	Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>, Michal Simek <monstr@monstr.eu>, 
	Dinh Nguyen <dinguyen@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, linux-snps-arc@lists.infradead.org, 
	linux-hexagon@vger.kernel.org, linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-arch@vger.kernel.org, Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [patch 08/18] x86/syscall: Use
 [syscall_]enter_from_user_mode_randomize_stack()
Message-ID: <ak_sOt1kr8nrVCju@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260707181957.433213175@kernel.org>
 <20260707190254.079478122@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707190254.079478122@kernel.org>

On Tue, Jul 07, 2026 at 09:06:27PM +0200, Thomas Gleixner wrote:
> These functions integrate the stack randomization.
> 
> syscall_enter_from_user_mode_randomize_stack() has the advantage that the
> randomization happens early right after enter_from_user_mode().
> 
> In both cases also the overhead of get/put_cpu_var() in
> add_random_kstack_offset() is avoided.
> 
> No functional change.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: x86@kernel.org
> ---
>  arch/x86/entry/syscall_32.c         |   19 +++++--------------
>  arch/x86/entry/syscall_64.c         |    3 +--
>  arch/x86/include/asm/entry-common.h |    1 -
>  3 files changed, 6 insertions(+), 17 deletions(-)
> 
> --- a/arch/x86/entry/syscall_32.c
> +++ b/arch/x86/entry/syscall_32.c
> @@ -142,10 +142,9 @@ static __always_inline bool int80_is_ext
>  	 * int80_is_external() below which calls into the APIC driver.
>  	 * Identical for soft and external interrupts.
>  	 */
> -	enter_from_user_mode(regs);
> +	enter_from_user_mode_randomize_stack(regs);
>  
>  	instrumentation_begin();
> -	add_random_kstack_offset();
>  
>  	/* Validate that this is a soft interrupt to the extent possible */
>  	if (unlikely(int80_is_external()))
> @@ -210,11 +209,9 @@ DEFINE_FREDENTRY_RAW(int80_emulation)
>  {
>  	int nr;
>  
> -	enter_from_user_mode(regs);
> +	enter_from_user_mode_randomize_stack(regs);
>  
>  	instrumentation_begin();
> -	add_random_kstack_offset();
> -
>  	/*
>  	 * FRED pushed 0 into regs::orig_ax and regs::ax contains the
>  	 * syscall number.
> @@ -252,10 +249,10 @@ DEFINE_FREDENTRY_RAW(int80_emulation)
>  	 * orig_ax, the int return value truncates it. This matches
>  	 * the semantics of syscall_get_nr().
>  	 */
> -	nr = syscall_enter_from_user_mode(regs, nr);
> +	nr = syscall_enter_from_user_mode_randomize_stack(regs, nr);
> +
>  	instrumentation_begin();
>  
> -	add_random_kstack_offset();
>  	do_syscall_32_irqs_on(regs, nr);
>  
>  	instrumentation_end();
> @@ -268,15 +265,9 @@ static noinstr bool __do_fast_syscall_32
>  	int nr = syscall_32_enter(regs);
>  	int res;
>  
> -	/*
> -	 * This cannot use syscall_enter_from_user_mode() as it has to
> -	 * fetch EBP before invoking any of the syscall entry work
> -	 * functions.
> -	 */
> -	enter_from_user_mode(regs);
> +	enter_from_user_mode_randomize_stack(regs);
>  
>  	instrumentation_begin();
> -	add_random_kstack_offset();
>  	local_irq_enable();
>  	/* Fetch EBP from where the vDSO stashed it. */
>  	if (IS_ENABLED(CONFIG_X86_64)) {
> --- a/arch/x86/entry/syscall_64.c
> +++ b/arch/x86/entry/syscall_64.c
> @@ -86,10 +86,9 @@ static __always_inline bool do_syscall_x
>  /* Returns true to return using SYSRET, or false to use IRET */
>  __visible noinstr bool do_syscall_64(struct pt_regs *regs, int nr)
>  {
> -	nr = syscall_enter_from_user_mode(regs, nr);
> +	nr = syscall_enter_from_user_mode_randomize_stack(regs, nr);
>  
>  	instrumentation_begin();
> -	add_random_kstack_offset();
>  
>  	if (!do_syscall_x64(regs, nr) && !do_syscall_x32(regs, nr) && nr != -1) {
>  		/* Invalid system call, but still a system call. */
> --- a/arch/x86/include/asm/entry-common.h
> +++ b/arch/x86/include/asm/entry-common.h
> @@ -2,7 +2,6 @@
>  #ifndef _ASM_X86_ENTRY_COMMON_H
>  #define _ASM_X86_ENTRY_COMMON_H
>  
> -#include <linux/randomize_kstack.h>
>  #include <linux/user-return-notifier.h>
>  
>  #include <asm/nospec-branch.h>
> 
Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
