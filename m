Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 642CA1F61C
	for <loongarch@lists.linux.dev>; Wed, 19 Feb 2025 17:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739985369; cv=none; b=UIby4m1prAk7o2o+Z53daJkil84hyoIIfCWuw1nBcrfWLIKP9EHu8/3cto33AfJus7iYqb1D9o/+wxPexCaP9EZegWBdFG2L4h4VbXm9omMd69s584PrtNqkMUMQPwZ6NNyf11HqyK3fmOLcMqWuMk+fkdnU0ELbYWhqUMMPxzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739985369; c=relaxed/simple;
	bh=7QI0wT4+63qh/XUmz07BMZkRninTpYvjv4idET9mc5E=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=lzfe0tj8tfEXG34Dl8inGc8kCSbtYbhfbULJUHEgnHhZYu6ezhcLk3PTLhEAfGXibgF43ybTRvYEYFbub/hNmq2sE4bmApaor5of6GCn4WbG21tcRbhdik5LjQldW22CLpSrCLYd1D3TrKfhiiZlk4COS5Y3ma1fn9yDn91L+nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 247399200B3; Wed, 19 Feb 2025 18:16:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 1E09592009E;
	Wed, 19 Feb 2025 17:16:05 +0000 (GMT)
Date: Wed, 19 Feb 2025 17:16:05 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: "Dmitry V. Levin" <ldv@strace.io>
cc: Andrew Morton <akpm@linux-foundation.org>, Oleg Nesterov <oleg@redhat.com>, 
    Alexey Gladkov <legion@kernel.org>, 
    Eugene Syromyatnikov <evgsyr@gmail.com>, 
    Charlie Jenkins <charlie@rivosinc.com>, Helge Deller <deller@gmx.de>, 
    Mike Frysinger <vapier@gentoo.org>, Renzo Davoli <renzo@cs.unibo.it>, 
    Davide Berardi <berardi.dav@gmail.com>, Vineet Gupta <vgupta@kernel.org>, 
    Russell King <linux@armlinux.org.uk>, 
    Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
    Brian Cain <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>, 
    WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, 
    Michal Simek <monstr@monstr.eu>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, 
    Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, 
    Stafford Horne <shorne@gmail.com>, 
    "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
    Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
    Christophe Leroy <christophe.leroy@csgroup.eu>, 
    Naveen N Rao <naveen@kernel.org>, 
    Madhavan Srinivasan <maddy@linux.ibm.com>, 
    Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
    Alexander Gordeev <agordeev@linux.ibm.com>, 
    Christian Borntraeger <borntraeger@linux.ibm.com>, 
    Sven Schnelle <svens@linux.ibm.com>, 
    Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
    John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
    "David S. Miller" <davem@davemloft.net>, 
    Andreas Larsson <andreas@gaisler.com>, Richard Weinberger <richard@nod.at>, 
    Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
    Johannes Berg <johannes@sipsolutions.net>, 
    Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
    Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
    x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
    Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
    Arnd Bergmann <arnd@arndb.de>, strace-devel@lists.strace.io, 
    linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-hexagon@vger.kernel.org, 
    loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
    linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
    linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
    linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
    linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
    linux-um@lists.infradead.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v6 3/6] syscall.h: introduce syscall_set_nr()
In-Reply-To: <20250217091034.GD18175@strace.io>
Message-ID: <alpine.DEB.2.21.2502191658530.65342@angie.orcam.me.uk>
References: <20250217091034.GD18175@strace.io>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 17 Feb 2025, Dmitry V. Levin wrote:

> diff --git a/arch/mips/include/asm/syscall.h b/arch/mips/include/asm/syscall.h
> index ea050b23d428..b956b015641c 100644
> --- a/arch/mips/include/asm/syscall.h
> +++ b/arch/mips/include/asm/syscall.h
> @@ -41,6 +41,20 @@ static inline long syscall_get_nr(struct task_struct *task,
>  	return task_thread_info(task)->syscall;
>  }
>  
> +static inline void syscall_set_nr(struct task_struct *task,
> +				  struct pt_regs *regs,
> +				  int nr)
> +{
> +	/*
> +	 * New syscall number has to be assigned to regs[2] because
> +	 * syscall_trace_entry() loads it from there unconditionally.

 That label is called `trace_a_syscall' in arch/mips/kernel/scall64-o32.S 
instead.  To bring some order and avoid an inaccuracy here should the odd 
one be matched to the other three?

> +	 *
> +	 * Consequently, if the syscall was indirect and nr != __NR_syscall,
> +	 * then after this assignment the syscall will cease to be indirect.
> +	 */
> +	task_thread_info(task)->syscall = regs->regs[2] = nr;
> +}
> +
>  static inline void mips_syscall_update_nr(struct task_struct *task,
>  					  struct pt_regs *regs)
>  {

 Otherwise:

Reviewed-by: Maciej W. Rozycki <macro@orcam.me.uk>

for this part, thank you!

  Maciej
