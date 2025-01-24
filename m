Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8845935945
	for <loongarch@lists.linux.dev>; Fri, 24 Jan 2025 13:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737724464; cv=none; b=c7uWWqgu+erKI028Ss7mAT8cBZOsQat80Kgs8NukbnVgps0T+H7fLXwuIMZpViJVAFkBQcL6CQpLr1G9TaDR8S66LW+1AiOPbQm2L/0N2mom340sDnNzKwXkdNu4j6ecAwhTSm888ud3vCzB2zmaX+s6/gi1LYYqlK1VsWjU+1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737724464; c=relaxed/simple;
	bh=KeerULSa1kVYVhzLuXVvIJZSxHdpQc8tSAQQdaXu30Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EXfv7G+ua7MOPPcBt/p46tegE/ui6RWx4G3Lg6oux/fPwDTo+XJqsbfnKIr2Xqdf/dI8G3r2cZUckqMr3a17sbfzXKW9SxG7fpy+2h4C8wz9h+YKRV7XIlE7X9HCv//DtO0CJ7sJQL+eVfqJGj2klkL235GdtjK6s1icQjCjRH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QrNUFXzt; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QrNUFXzt"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53ff1f7caaeso2145868e87.0
        for <loongarch@lists.linux.dev>; Fri, 24 Jan 2025 05:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737724461; x=1738329261; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NC2yTzK8NlSU4Cwgnl73gs8h6Jp1JNKpbTuyPayDCE4=;
        b=QrNUFXztytvBUfXHM7ig+NtQr2Hhr4tK7BR0HA7kaNjKK7ive8Kufk/eaFzjvZMI2O
         5RQMmW6qzvXBo3dG2MLB/Sw7czub2H9IrqXbtr4S2pe0l/UiZqwhpozQa5b2dy1Lcy0j
         oJEUY8rNf82XL8pyPxo8AoW1CNtPzBHzJnNk5lQ3NIGHeDwGn4LrYD9tw5lkQxZAFLqK
         6ARN9WSQ5Lb5KyAFDWal3asCzGSwfgTY1qvvN0xRvnhRCjpUwVpFpmZcgnsqvRkwR7Br
         R7TWzoC/a11M/iy3d91lQXJCftjPZVJF/bovlHCCnwn/NLBOiOtURynh24Wo17tjdw9Q
         lB9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737724461; x=1738329261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NC2yTzK8NlSU4Cwgnl73gs8h6Jp1JNKpbTuyPayDCE4=;
        b=K/TRbnn4EhZF/vQ4eqVSMZSppWFdSw5+spku+eariqdoM6LMA2+hVwxE3rF9Zxq5LW
         xjptf11EOA4jEjqev0moLGUuacBzST49th0kiNQvMWMZfGXK6Y6U47ysmOV7Druo3TkI
         E998kBF8VVbpWKZU4GwsI9DB9Xg8AJPJMzNFSaE6OIWisVW0z1NVy5kEwVaDIfP9UIjt
         PuA+5eAR9sKapvx8qNFO3Wrey86MoqThtSJZNHV2z2uw2HE9OdMjrmJt5+vhjCh0ERCq
         04pH4oEGWGY2SM2dKWT+lL+xT0Jd1mpTaRwcPYzCgxUCHOhgmEEonh8PiGl1Wk24lwsc
         o0DA==
X-Forwarded-Encrypted: i=1; AJvYcCXtoQ7UPw53zv9a+AdkuBH/WdzeK2Ln2Z3toVRswQresAvjuUrwXrmnisdI+jgzW5bN5pMeu9aGToA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2JQGAX0x6ZhijiblGh2SKwT8jsmgM7f6JNQE764KkyxvzY7k0
	vgcOf6gmkryfMP0hoMuIktsTtMKQP+1SgH0IuQT1c7rzsl27Kr/DIxsyEyOv2f6CnEX2wAQHO2U
	3prC2VxPTDNOwjHPiSbvJM2BmRw==
X-Gm-Gg: ASbGncuiIIfPbejwhHksW7UR+wJ/pL4vWp6+u8HY6/cvuMvtvyFcFEqdBVMoH9oIdxm
	winAu6h6mDZyEVESo4U19D2s5r4z6XeMXiWqbGyNb6nDqCVAtrymq+KUTy3zRV0U5orZs578OGN
	ib
X-Google-Smtp-Source: AGHT+IH+KvzJHaBHBXGO+RKDTTaxF3dQyjfjmqAp7LLumZtS6SwcRxLQMF1eOIJBsvKWAhVUAORXGdyTR8KOE/uJovw=
X-Received: by 2002:a05:6512:b94:b0:542:2240:8c0 with SMTP id
 2adb3069b0e04-5439c23f364mr10465174e87.12.1737724460425; Fri, 24 Jan 2025
 05:14:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250123-riscv_optimize_entry-v2-0-7c259492d508@rivosinc.com> <20250123-riscv_optimize_entry-v2-1-7c259492d508@rivosinc.com>
In-Reply-To: <20250123-riscv_optimize_entry-v2-1-7c259492d508@rivosinc.com>
From: Brian Gerst <brgerst@gmail.com>
Date: Fri, 24 Jan 2025 08:14:08 -0500
X-Gm-Features: AWEUYZn_d1UqcapzOaVQPSA4ZFujGiTaEyjTyTvGvgwrsZe0oNKflw9JGjkne7k
Message-ID: <CAMzpN2gZrL8xusm8oDz-Oy6sZwjmYWshfx=hTUe7yL5M6UJSmw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] riscv: entry: Convert ret_from_fork() to C
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Andy Lutomirski <luto@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 23, 2025 at 2:15=E2=80=AFPM Charlie Jenkins <charlie@rivosinc.c=
om> wrote:
>
> Move the main section of ret_from_fork() to C to allow inlining of
> syscall_exit_to_user_mode().
>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  arch/riscv/include/asm/asm-prototypes.h |  1 +
>  arch/riscv/kernel/entry.S               | 15 ++++++---------
>  arch/riscv/kernel/process.c             | 14 ++++++++++++--
>  3 files changed, 19 insertions(+), 11 deletions(-)
>
> diff --git a/arch/riscv/include/asm/asm-prototypes.h b/arch/riscv/include=
/asm/asm-prototypes.h
> index cd627ec289f163a630b73dd03dd52a6b28692997..733ff609778797001006c33bb=
a9e3cc5b1f15387 100644
> --- a/arch/riscv/include/asm/asm-prototypes.h
> +++ b/arch/riscv/include/asm/asm-prototypes.h
> @@ -52,6 +52,7 @@ DECLARE_DO_ERROR_INFO(do_trap_ecall_s);
>  DECLARE_DO_ERROR_INFO(do_trap_ecall_m);
>  DECLARE_DO_ERROR_INFO(do_trap_break);
>
> +asmlinkage void ret_from_fork(void *fn_arg, int (*fn)(void *), struct pt=
_regs *regs);
>  asmlinkage void handle_bad_stack(struct pt_regs *regs);
>  asmlinkage void do_page_fault(struct pt_regs *regs);
>  asmlinkage void do_irq(struct pt_regs *regs);
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 33a5a9f2a0d4e1eeccfb3621b9e518b88e1b0704..9225c322279aa90e737b1d714=
4db084319cf8103 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -319,17 +319,14 @@ SYM_CODE_END(handle_kernel_stack_overflow)
>  ASM_NOKPROBE(handle_kernel_stack_overflow)
>  #endif
>
> -SYM_CODE_START(ret_from_fork)
> +SYM_CODE_START(ret_from_fork_asm)
>         call schedule_tail
> -       beqz s0, 1f     /* not from kernel thread */
> -       /* Call fn(arg) */
> -       move a0, s1
> -       jalr s0
> -1:
> -       move a0, sp /* pt_regs */
> -       call syscall_exit_to_user_mode
> +       move a0, s1 /* fn */
> +       move a1, s0 /* fn_arg */
> +       move a2, sp /* pt_regs */
> +       call ret_from_fork
>         j ret_from_exception
> -SYM_CODE_END(ret_from_fork)
> +SYM_CODE_END(ret_from_fork_asm)
>
>  #ifdef CONFIG_IRQ_STACKS
>  /*
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index 58b6482c2bf662bf5224ca50c8e21a68760a6b41..0d07e6d8f6b57beba438dbba5=
e8c74a014582bee 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -17,7 +17,9 @@
>  #include <linux/ptrace.h>
>  #include <linux/uaccess.h>
>  #include <linux/personality.h>
> +#include <linux/entry-common.h>
>
> +#include <asm/asm-prototypes.h>
>  #include <asm/unistd.h>
>  #include <asm/processor.h>
>  #include <asm/csr.h>
> @@ -36,7 +38,7 @@ unsigned long __stack_chk_guard __read_mostly;
>  EXPORT_SYMBOL(__stack_chk_guard);
>  #endif
>
> -extern asmlinkage void ret_from_fork(void);
> +extern asmlinkage void ret_from_fork_asm(void);
>
>  void noinstr arch_cpu_idle(void)
>  {
> @@ -206,6 +208,14 @@ int arch_dup_task_struct(struct task_struct *dst, st=
ruct task_struct *src)
>         return 0;
>  }
>
> +asmlinkage void ret_from_fork(void *fn_arg, int (*fn)(void *), struct pt=
_regs *regs)
> +{
> +       if (unlikely(fn))
> +               fn(fn_arg);
> +
> +       syscall_exit_to_user_mode(regs);
> +}
> +
>  int copy_thread(struct task_struct *p, const struct kernel_clone_args *a=
rgs)
>  {
>         unsigned long clone_flags =3D args->flags;
> @@ -242,7 +252,7 @@ int copy_thread(struct task_struct *p, const struct k=
ernel_clone_args *args)
>         p->thread.riscv_v_flags =3D 0;
>         if (has_vector())
>                 riscv_v_thread_alloc(p);
> -       p->thread.ra =3D (unsigned long)ret_from_fork;
> +       p->thread.ra =3D (unsigned long)ret_from_fork_asm;
>         p->thread.sp =3D (unsigned long)childregs; /* kernel sp */
>         return 0;
>  }
>
> --
> 2.43.0
>
>

Is there a specific reason you didn't move the call to schedule_tail()
to the C function, like on x86?


Brian Gerst
