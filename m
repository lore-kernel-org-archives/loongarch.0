Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE504446F3
	for <loongarch@lists.linux.dev>; Thu,  9 Jul 2026 18:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783622565; cv=none; b=jG1eMByiz2qvzTW2tygB95ASlVqbyv/Ttvh71mCBy088wtt0G4NsV2P/rrPkeHVPsmhrXhIegleMn8pb9OZQx6+iC4ibO2+5q2CmJ6SWu7H0uKsMRPYRo5pXwIM45X/2e8I2+jTLlyBk3h44zvY67NvM/beRMHTwWTNyq99kL10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783622565; c=relaxed/simple;
	bh=jxrFwpuvrTS1XNI/bITRNy4rM5f6KM69+ytcvmY9Kws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dsH/8/EPlrEAal3PtHHCluON9YppZbBDJ3ptyBBNsGpDb1Q1uwQMW22jymL/DDZv+n22sM0iwX8UWlCu3WA54Dr5UgxzVcxqhW1crHcr/T+VlDCWHFMy4j4fGXJqjrfIbH/8RrjRd2u5qvFHpXRk4+HsJZe2HgHswFkjfoUsUQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sTp/EwgZ; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sTp/EwgZ"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c95d0a54ea5so140327a12.0
        for <loongarch@lists.linux.dev>; Thu, 09 Jul 2026 11:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783622563; x=1784227363; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SzGAEyDF8npliwHJTsZ1x6gPZlMpJ+A+8igDYDtce2g=;
        b=sTp/EwgZXizCaYE5fUfUa4f/M3Dx/PgvA2SAoCFX4Zz7E/8hcpHOJrmcrVCnMts3+F
         bC22kVbbJ4d66tCzpQOVrwWWkO/Z/GzFLhy6vfwMzW28rftvV51e0jIIy9Ga+Q4DO+FQ
         cQwjoVlapx4PAlaJnfbrkd/HaebHtL4SfXEDzWhYTzoKUl+oFN16bOsjfBtZ3dwCyau4
         q14jfAsiX7FjVhydcEdigQluF2SRbv67h0KV6rzqAbglC1VxSZgKwO+DIqfx6ywa3TvG
         F2ji5B8SyZs35bk3cZSSNUtXiyYY/Ghw0wEZPlDjqiDPD+CxC2N9w3rlN2DV+plriuKW
         LTFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783622563; x=1784227363;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SzGAEyDF8npliwHJTsZ1x6gPZlMpJ+A+8igDYDtce2g=;
        b=mnxSQQFg5Q2wdc3fXXPkdTAxhTz+cyZq3LmvXKE2pH685zzfwHZENKjNWc0MDfqC9l
         +Gd8y4ummizx5j3azcPoiQ3vtKtctCl83fa9qboEaQg0p1674MWHDGVncMp4O7PxX/cf
         vdYKWB6qLrdIxsaWeUZOnG1yGmi83QI5vxnLV6n7uV4oSmEvXwO+Ie5EW3fi+9QoVMn+
         5jD/LmzzW7aRyF8US2WsySpJ+EJ8454Cw2rRB6JiyvtqUKr9Teq7746hUsjivMfjciTY
         zxXqEaym3vUk1GRlViVeAYrQbErR8JH7ZJHEI6W1xNlH4npQzXp0z9MD34B1+nmHitdO
         5egA==
X-Forwarded-Encrypted: i=1; AHgh+RpfkFBUGNlDYjQBCTQGsWPaWzfIyX4iCaG8x/Y6lKnsYPflURx7oHMLVZiZkaa/eX2+ZOWlpL6gsTs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyl+ZQaBw4NAStxgES1LQUHVYNTeyZnqzMvg2rIkpnZy1MzbUb/
	wKhDSqs5qNwiqIgniYQ5txzzT5eSwUryAqnaiFdl3dNVJgalC0WN64qE
X-Gm-Gg: AfdE7ckTKw3iGpo1lKdY+sBrBTx+VnPv+D6wP+ZijjPZ0r+l/1rXgUl8B1sK/QZ5gam
	c5pTkrVJ4MTGbOUwQWfarVG+bAr9oNslInW7I5CEjWPsAng2CRxNUjPfraQQ9b2msrHvju6vc4J
	DRH5oLaH5P31TZ8oDkDpnasI342h5Po1JK6rbAIHeLzmgwDIhKb/nDvxw2XTZv2aEKG40lfyaPc
	LQKZx6A6xeehRJTN3hYdJPtsZeXH0tJNmU+EHFAoPnQUuWKKwmyOyoVrWqE2qyNelBeXeg3Qr0x
	f5JAjkk58AZYmLzplBx0BA8yKknAW3g5a5QCobH7BVZzgp/AWHJzjeXSwcEWXnwmCrFHjuzQbJz
	VSn9GMQnB3WL/aU9pa/Zg4j8mzjMSHTXGpzW8HZl09gKcaT3yXys1QI7qN3164K5GB8vQ4A+qs7
	4zM00KEJvlT4suBewn7Vs+LbVntryaj9rfa2f0R2QKaThlMVgeBsxA3UluI59J
X-Received: by 2002:a05:6a21:682:b0:3bf:b50f:71bb with SMTP id adf61e73a8af0-3c0bc9acb33mr9806931637.27.1783622563297;
        Thu, 09 Jul 2026 11:42:43 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3118ee6080dsm19491362eec.17.2026.07.09.11.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:42:42 -0700 (PDT)
Date: Fri, 10 Jul 2026 00:12:23 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, 
	x86@kernel.org, Mark Rutland <mark.rutland@arm.com>, 
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
Subject: Re: [patch 06/18] riscv/syscall: Use
 syscall_enter_from_user_mode_randomize_stack()
Message-ID: <ak_rfwwd1OtaQxka@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260707181957.433213175@kernel.org>
 <20260707190253.974626922@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707190253.974626922@kernel.org>

On Tue, Jul 07, 2026 at 09:06:19PM +0200, Thomas Gleixner wrote:
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
> Cc: Paul Walmsley <pjw@kernel.org>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: linux-riscv@lists.infradead.org
> ---
>  arch/riscv/kernel/traps.c |    5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -7,7 +7,6 @@
>  #include <linux/kernel.h>
>  #include <linux/init.h>
>  #include <linux/irqflags.h>
> -#include <linux/randomize_kstack.h>
>  #include <linux/sched.h>
>  #include <linux/sched/debug.h>
>  #include <linux/sched/signal.h>
> @@ -333,9 +332,7 @@ void do_trap_ecall_u(struct pt_regs *reg
>  
>  		riscv_v_vstate_discard(regs);
>  
> -		syscall = syscall_enter_from_user_mode(regs, syscall);
> -
> -		add_random_kstack_offset();
> +		syscall = syscall_enter_from_user_mode_randomize_stack(regs, syscall);
>  
>  		if (syscall >= 0 && syscall < NR_syscalls) {
>  			syscall = array_index_nospec(syscall, NR_syscalls);
> 
Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
