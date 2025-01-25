Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB6182063FA
	for <loongarch@lists.linux.dev>; Sat, 25 Jan 2025 23:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737847814; cv=none; b=AD+zo33dpyOqRXnCHzTTLaBKVzf4nJ/ExBSCce2wwn4xaF5nVa7tS2DKROYHZ/YNcO83N5ALEb8MVcFHUnD7zgRq6gNbVMFs632nwDOAPx7pNI5Au94dGDVl10qTyLrhRdsxY5m4riuvepX8pkOLfc0qYNP2bbjPXv6oO/hwxf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737847814; c=relaxed/simple;
	bh=uA5DzJWXYvWHSNF5tPtCDFdBLhV3Bbaloa5KKdTgrsk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=VBHd9KWNJHIMQY5HRmVeHq7DZLiPGFDandUYVrMszxLZR8Y5F12wUIJO3fFOfstmCj2Ev3p37V7GhNZjwVy+aFAXbSafhrzX907LBcDngsLm/srCtk9FyKMC7/Arwc64HEz3UcR065d6tU6c5z4hxgGSp1GWly5qTLqS6drTHc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 63B2D92009C; Sun, 26 Jan 2025 00:30:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 564F092009B;
	Sat, 25 Jan 2025 23:30:09 +0000 (GMT)
Date: Sat, 25 Jan 2025 23:30:09 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Charlie Jenkins <charlie@rivosinc.com>
cc: Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Huacai Chen <chenhuacai@kernel.org>, 
    WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>, 
    Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
    Alexandre Ghiti <alexghiti@rivosinc.com>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
Subject: Re: [PATCH 1/4] riscv: entry: Convert ret_from_fork() to C
In-Reply-To: <20250122-riscv_optimize_entry-v1-1-4ee95559cfd0@rivosinc.com>
Message-ID: <alpine.DEB.2.21.2501252313210.27203@angie.orcam.me.uk>
References: <20250122-riscv_optimize_entry-v1-0-4ee95559cfd0@rivosinc.com> <20250122-riscv_optimize_entry-v1-1-4ee95559cfd0@rivosinc.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 22 Jan 2025, Charlie Jenkins wrote:

> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 33a5a9f2a0d4e1eeccfb3621b9e518b88e1b0704..9225c322279aa90e737b1d7144db084319cf8103 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -319,17 +319,14 @@ SYM_CODE_END(handle_kernel_stack_overflow)
>  ASM_NOKPROBE(handle_kernel_stack_overflow)
>  #endif
>  
> -SYM_CODE_START(ret_from_fork)
> +SYM_CODE_START(ret_from_fork_asm)
>  	call schedule_tail
> -	beqz s0, 1f	/* not from kernel thread */
> -	/* Call fn(arg) */
> -	move a0, s1
> -	jalr s0
> -1:
> -	move a0, sp /* pt_regs */
> -	call syscall_exit_to_user_mode
> +	move a0, s1 /* fn */
> +	move a1, s0 /* fn_arg */
> +	move a2, sp /* pt_regs */
> +	call ret_from_fork
>  	j ret_from_exception

 Wouldn't it make sense to save a jump here and make it a tail call, i.e.:

	la ra, ret_from_exception
	tail ret_from_fork

?

  Maciej
