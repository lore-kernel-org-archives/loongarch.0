Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D6010FD
	for <loongarch@lists.linux.dev>; Fri, 24 Jan 2025 07:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737703170; cv=none; b=A+aGI9d7FZA2QiVgxuB6/ArkMmlTDL6xzONhlGGBDB7mrqgWWYcTml3MV0ygYxvJ4YWnZltMbnUxuiHbg9aYQYHXr/+AUndr3jRr3HipeogVqLQe1FYBIjXFHfGWFInFHT8rQan0Q0ThlzBFfgL4xr0sAlde8rOP+yEr7F543C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737703170; c=relaxed/simple;
	bh=ty6PJA0cvMBNiFkEQhgHKj+YplhNpKgo2SvAFjLrC+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k2lhfbgwADEpPPkLydNQn4+Oemwy9CPB0WizutxRERuGQ6lsvrzXc0UXyWnYvJsxO2QQLFLv5MfFfQ/QLlY4KbKAtTNqoFJhaZUoKxGzGTf3LGrsuufdhl9v9gF6Rzm/L7CHrZAA69n9QJ3D8bMqLlPYRDeveKqqvYbicc/8vhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id E5207C0002;
	Fri, 24 Jan 2025 07:19:18 +0000 (UTC)
Message-ID: <6ebe8b7c-7df3-4bea-9175-35512e9960a7@ghiti.fr>
Date: Fri, 24 Jan 2025 08:19:18 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] riscv: entry: Split ret_from_fork() into user and
 kernel
Content-Language: en-US
To: Charlie Jenkins <charlie@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>,
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev
References: <20250123-riscv_optimize_entry-v2-0-7c259492d508@rivosinc.com>
 <20250123-riscv_optimize_entry-v2-2-7c259492d508@rivosinc.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250123-riscv_optimize_entry-v2-2-7c259492d508@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: alex@ghiti.fr

Hi Charlie,

On 23/01/2025 20:14, Charlie Jenkins wrote:
> This function was unified into a single function in commit ab9164dae273
> ("riscv: entry: Consolidate ret_from_kernel_thread into ret_from_fork").
> However that imposed a performance degradation. Partially reverting this
> commit to have ret_from_fork() split again results in a 1% increase on
> the number of times fork is able to be called per second.
>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>   arch/riscv/include/asm/asm-prototypes.h |  3 ++-
>   arch/riscv/kernel/entry.S               | 13 ++++++++++---
>   arch/riscv/kernel/process.c             | 17 +++++++++++------
>   3 files changed, 23 insertions(+), 10 deletions(-)
>
> diff --git a/arch/riscv/include/asm/asm-prototypes.h b/arch/riscv/include/asm/asm-prototypes.h
> index 733ff609778797001006c33bba9e3cc5b1f15387..bfc8ea5f9319b19449ec59493b45b926df888832 100644
> --- a/arch/riscv/include/asm/asm-prototypes.h
> +++ b/arch/riscv/include/asm/asm-prototypes.h
> @@ -52,7 +52,8 @@ DECLARE_DO_ERROR_INFO(do_trap_ecall_s);
>   DECLARE_DO_ERROR_INFO(do_trap_ecall_m);
>   DECLARE_DO_ERROR_INFO(do_trap_break);
>   
> -asmlinkage void ret_from_fork(void *fn_arg, int (*fn)(void *), struct pt_regs *regs);
> +asmlinkage void ret_from_fork_kernel(void *fn_arg, int (*fn)(void *), struct pt_regs *regs);
> +asmlinkage void ret_from_fork_user(struct pt_regs *regs);
>   asmlinkage void handle_bad_stack(struct pt_regs *regs);
>   asmlinkage void do_page_fault(struct pt_regs *regs);
>   asmlinkage void do_irq(struct pt_regs *regs);
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 9225c322279aa90e737b1d7144db084319cf8103..9386ef7444267f0b9bf8a0550f4e31deaeb85881 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -319,14 +319,21 @@ SYM_CODE_END(handle_kernel_stack_overflow)
>   ASM_NOKPROBE(handle_kernel_stack_overflow)
>   #endif
>   
> -SYM_CODE_START(ret_from_fork_asm)
> +SYM_CODE_START(ret_from_fork_kernel_asm)
>   	call schedule_tail
>   	move a0, s1 /* fn */
>   	move a1, s0 /* fn_arg */
>   	move a2, sp /* pt_regs */
> -	call ret_from_fork
> +	call ret_from_fork_kernel
>   	j ret_from_exception
> -SYM_CODE_END(ret_from_fork_asm)
> +SYM_CODE_END(ret_from_fork_kernel_asm)
> +
> +SYM_CODE_START(ret_from_fork_user_asm)
> +	call schedule_tail
> +	move a0, sp /* pt_regs */
> +	call ret_from_fork_user
> +	j ret_from_exception
> +SYM_CODE_END(ret_from_fork_user_asm)
>   
>   #ifdef CONFIG_IRQ_STACKS
>   /*
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index 0d07e6d8f6b57beba438dbba5e8c74a014582bee..5f15236cb526bd9fe61636ed372b4b76c94df946 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -38,7 +38,8 @@ unsigned long __stack_chk_guard __read_mostly;
>   EXPORT_SYMBOL(__stack_chk_guard);
>   #endif
>   
> -extern asmlinkage void ret_from_fork_asm(void);
> +extern asmlinkage void ret_from_fork_kernel_asm(void);
> +extern asmlinkage void ret_from_fork_user_asm(void);
>   
>   void noinstr arch_cpu_idle(void)
>   {
> @@ -208,14 +209,18 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
>   	return 0;
>   }
>   
> -asmlinkage void ret_from_fork(void *fn_arg, int (*fn)(void *), struct pt_regs *regs)
> +asmlinkage void ret_from_fork_kernel(void *fn_arg, int (*fn)(void *), struct pt_regs *regs)
>   {
> -	if (unlikely(fn))
> -		fn(fn_arg);
> +	fn(fn_arg);
>   
>   	syscall_exit_to_user_mode(regs);
>   }
>   
> +asmlinkage void ret_from_fork_user(struct pt_regs *regs)
> +{
> +	syscall_exit_to_user_mode(regs);
> +}
> +
>   int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
>   {
>   	unsigned long clone_flags = args->flags;
> @@ -238,6 +243,7 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
>   
>   		p->thread.s[0] = (unsigned long)args->fn;
>   		p->thread.s[1] = (unsigned long)args->fn_arg;
> +		p->thread.ra = (unsigned long)ret_from_fork_kernel_asm;
>   	} else {
>   		*childregs = *(current_pt_regs());
>   		/* Turn off status.VS */
> @@ -247,12 +253,11 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
>   		if (clone_flags & CLONE_SETTLS)
>   			childregs->tp = tls;
>   		childregs->a0 = 0; /* Return value of fork() */
> -		p->thread.s[0] = 0;
> +		p->thread.ra = (unsigned long)ret_from_fork_user_asm;
>   	}
>   	p->thread.riscv_v_flags = 0;
>   	if (has_vector())
>   		riscv_v_thread_alloc(p);
> -	p->thread.ra = (unsigned long)ret_from_fork_asm;
>   	p->thread.sp = (unsigned long)childregs; /* kernel sp */
>   	return 0;
>   }
>

Can you benchmark this change on some HW? I'm not sure we would indeed 
gain this 1%.

Thanks,

Alex

