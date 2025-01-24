Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848121DB124
	for <loongarch@lists.linux.dev>; Fri, 24 Jan 2025 07:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737702570; cv=none; b=dlnAJ+iejXFB3GoFXIHNfut9VMwlxX+wwhy6z4MZwpL2t7apbtI/m3sTEODJVqAHoxV+0v9cc/GGrjNmcsQeLufECfiKuTGZOfz6N1GfkL5cg3SSAM+XRqhGvNko4bweazXKhOV1RRLT/q5DdwxlGLoERRtl5EL0cLpff3Uqp9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737702570; c=relaxed/simple;
	bh=IogimpjXBhNdG6hLg/1fe/TfK944AwTj7klLYeb7RFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fVGmSHxUmtaxOGccs9Hho4Mj1hEmCdpeNX7EEACLoBBe7AUu0Tfjfk0ed8/zwNo0E/9xRWm6x0aGUObO0PLFHbCPY6DmQVXPEuX/Ea8M31pGw9KHXbWr8c5qlF6GmCWNqKupZqLqrQAcRLGQVJIUGBAL+6ZSzx5fSnrPqH7TnMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 675D51C0004;
	Fri, 24 Jan 2025 07:09:19 +0000 (UTC)
Message-ID: <3c2d171a-1e6c-459e-b254-e9684a4e5ba4@ghiti.fr>
Date: Fri, 24 Jan 2025 08:09:16 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] riscv: entry: Convert ret_from_fork() to C
To: Charlie Jenkins <charlie@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>,
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev
References: <20250122-riscv_optimize_entry-v1-0-4ee95559cfd0@rivosinc.com>
 <20250122-riscv_optimize_entry-v1-1-4ee95559cfd0@rivosinc.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250122-riscv_optimize_entry-v1-1-4ee95559cfd0@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: alex@ghiti.fr

Hi Charlie,

On 22/01/2025 23:56, Charlie Jenkins wrote:
> Move the main section of ret_from_fork() to C to allow inlining of
> syscall_exit_to_user_mode().
>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>   arch/riscv/include/asm/asm-prototypes.h |  1 +
>   arch/riscv/kernel/entry.S               | 15 ++++++---------
>   arch/riscv/kernel/process.c             | 14 ++++++++++++--
>   3 files changed, 19 insertions(+), 11 deletions(-)
>
> diff --git a/arch/riscv/include/asm/asm-prototypes.h b/arch/riscv/include/asm/asm-prototypes.h
> index cd627ec289f163a630b73dd03dd52a6b28692997..733ff609778797001006c33bba9e3cc5b1f15387 100644
> --- a/arch/riscv/include/asm/asm-prototypes.h
> +++ b/arch/riscv/include/asm/asm-prototypes.h
> @@ -52,6 +52,7 @@ DECLARE_DO_ERROR_INFO(do_trap_ecall_s);
>   DECLARE_DO_ERROR_INFO(do_trap_ecall_m);
>   DECLARE_DO_ERROR_INFO(do_trap_break);
>   
> +asmlinkage void ret_from_fork(void *fn_arg, int (*fn)(void *), struct pt_regs *regs);
>   asmlinkage void handle_bad_stack(struct pt_regs *regs);
>   asmlinkage void do_page_fault(struct pt_regs *regs);
>   asmlinkage void do_irq(struct pt_regs *regs);
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 33a5a9f2a0d4e1eeccfb3621b9e518b88e1b0704..9225c322279aa90e737b1d7144db084319cf8103 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -319,17 +319,14 @@ SYM_CODE_END(handle_kernel_stack_overflow)
>   ASM_NOKPROBE(handle_kernel_stack_overflow)
>   #endif
>   
> -SYM_CODE_START(ret_from_fork)
> +SYM_CODE_START(ret_from_fork_asm)
>   	call schedule_tail
> -	beqz s0, 1f	/* not from kernel thread */
> -	/* Call fn(arg) */
> -	move a0, s1
> -	jalr s0
> -1:
> -	move a0, sp /* pt_regs */
> -	call syscall_exit_to_user_mode
> +	move a0, s1 /* fn */
> +	move a1, s0 /* fn_arg */


You pass the arguments in the right order but the comments are wrong (s1 
contains fn_arg and s0 fn).


> +	move a2, sp /* pt_regs */
> +	call ret_from_fork
>   	j ret_from_exception
> -SYM_CODE_END(ret_from_fork)
> +SYM_CODE_END(ret_from_fork_asm)
>   
>   #ifdef CONFIG_IRQ_STACKS
>   /*
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index 58b6482c2bf662bf5224ca50c8e21a68760a6b41..0d07e6d8f6b57beba438dbba5e8c74a014582bee 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -17,7 +17,9 @@
>   #include <linux/ptrace.h>
>   #include <linux/uaccess.h>
>   #include <linux/personality.h>
> +#include <linux/entry-common.h>
>   
> +#include <asm/asm-prototypes.h>
>   #include <asm/unistd.h>
>   #include <asm/processor.h>
>   #include <asm/csr.h>
> @@ -36,7 +38,7 @@ unsigned long __stack_chk_guard __read_mostly;
>   EXPORT_SYMBOL(__stack_chk_guard);
>   #endif
>   
> -extern asmlinkage void ret_from_fork(void);
> +extern asmlinkage void ret_from_fork_asm(void);
>   
>   void noinstr arch_cpu_idle(void)
>   {
> @@ -206,6 +208,14 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
>   	return 0;
>   }
>   
> +asmlinkage void ret_from_fork(void *fn_arg, int (*fn)(void *), struct pt_regs *regs)
> +{
> +	if (unlikely(fn))
> +		fn(fn_arg);
> +
> +	syscall_exit_to_user_mode(regs);
> +}
> +
>   int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
>   {
>   	unsigned long clone_flags = args->flags;
> @@ -242,7 +252,7 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
>   	p->thread.riscv_v_flags = 0;
>   	if (has_vector())
>   		riscv_v_thread_alloc(p);
> -	p->thread.ra = (unsigned long)ret_from_fork;
> +	p->thread.ra = (unsigned long)ret_from_fork_asm;
>   	p->thread.sp = (unsigned long)childregs; /* kernel sp */
>   	return 0;
>   }
>

With the comment fix, you can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex

