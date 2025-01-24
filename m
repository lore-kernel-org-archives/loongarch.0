Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57532219EA5
	for <loongarch@lists.linux.dev>; Fri, 24 Jan 2025 09:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737709532; cv=none; b=juZXgPBv2UpqXc+Fhliz1lfJpwG3OF81n9rW8C7jRO453hrrbUAPIO1nEBJfVcaYiq9CYynTznxxAvUwNqHAEqu47HupdshQWNNRmUDqX981JqUwFQOlLaSkhSnaqtvtdwWzBLCjm+E95uH4RWbzytprFJaJWMlfTOVgHxpcps0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737709532; c=relaxed/simple;
	bh=Lqlp7MyQNz39W8P9ZqUKNLj/uTj0W2CY9rnVn7UkN6E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WRV5Q6WyI7BpxYc/vmckXbkK6fQmsZEg/QyZQ/bZmjY59Fpi/SYNbXiqvhSmqvbvwGCOTWF+6an3suW9rO4T8BwuytcQK5NJsyiOXFzSJpSYtZkZrZhBDgb9z+9x+x5UEhLlAOX3BiJqnGTMC9KjBzsCTiSDMprX4kOEC9SciXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k8M2dPct; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k8M2dPct"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 319ACC4CEE4
	for <loongarch@lists.linux.dev>; Fri, 24 Jan 2025 09:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737709532;
	bh=Lqlp7MyQNz39W8P9ZqUKNLj/uTj0W2CY9rnVn7UkN6E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=k8M2dPctcUrkDwaW6JFaPB4remmUAl44Da+yQc2Z/jr4ebyvLBNPY0Eo6FYaL9+LM
	 AInUQvIgtcbbWfol0t8hSVLUlRQQrrMzV/QiXiTy50QWIo4BZAbT3x9wGSZh1hQvW3
	 tnNMf+zUnuP83Gb/edLPiLZ6+9dEh6D1sm/tX1aZHiP32I87f0SFSv36vAPFfh4Cw7
	 V1elVpskHZuVDWsQV1rWWp0k1Ev5tCLgNS6eN97okaLrO6ez77vRx6ohScGcMuJE+s
	 c7DsP9+yW0rTmXJ92CgPuPLMujYWOfCvy45pGQcv0JHnfEAEolDkPAorWn/xPcCCE7
	 oGVrOas/2X0Kw==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aaecf50578eso432051266b.2
        for <loongarch@lists.linux.dev>; Fri, 24 Jan 2025 01:05:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWH7y2oQ5WJcMhGx8gci6gIFC9P0bHAJKJzXYNpdxbYVkfsh/ltqm7HCrafGOuERxgeigPlU2Ry5JE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwWIepjq/i/z4dAelQenDpa3O98ojCxWFmdd3oLxzinNnwkqJQc
	8SV1DKoJGU8HrRJslQGZ1xs9RDhVYBbbmwgAEmu8SsctG2SObccsLAv8/Jkiy9ppLe/2SRLDMQb
	tjQmI3DHKDpf8P7LDn99fpR8QzXo=
X-Google-Smtp-Source: AGHT+IHG0k2FyeWUT/medUJbo4t6MJmnpFSJ3HJ1L4LPVA5YC4vbKPPO3C/X37BPV/1UrON5UcNYFMH8y1ldCcFm3/M=
X-Received: by 2002:a17:907:7ba9:b0:ab2:c0c8:383f with SMTP id
 a640c23a62f3a-ab38b0b684fmr2975925866b.1.1737709530490; Fri, 24 Jan 2025
 01:05:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250123-riscv_optimize_entry-v2-0-7c259492d508@rivosinc.com> <20250123-riscv_optimize_entry-v2-3-7c259492d508@rivosinc.com>
In-Reply-To: <20250123-riscv_optimize_entry-v2-3-7c259492d508@rivosinc.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 24 Jan 2025 17:05:21 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7RSn2ek5CeLnohTcrh=0unDNmaLDq+yDH2oqshoeRMNQ@mail.gmail.com>
X-Gm-Features: AWEUYZnmCgndjX3TxIbo0KY3PK02_EADQhJH2tzMemU92v6WAVFWS0P9mXQrh4Y
Message-ID: <CAAhV-H7RSn2ek5CeLnohTcrh=0unDNmaLDq+yDH2oqshoeRMNQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] loongarch: entry: Migrate ret_from_fork() to C
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Charlie,

On Fri, Jan 24, 2025 at 3:15=E2=80=AFAM Charlie Jenkins <charlie@rivosinc.c=
om> wrote:
>
> Loongarch is the only architecture that calls
We usually use "LoongArch" instead of "loongarch" or "Loongarch".

> syscall_exit_to_user_mode() from asm. Move the call into C so that this
> function can be inlined across all architectures.
>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  arch/loongarch/include/asm/asm-prototypes.h |  5 +++++
>  arch/loongarch/include/asm/switch_to.h      |  8 +++++++
>  arch/loongarch/kernel/entry.S               | 22 +++++++++----------
>  arch/loongarch/kernel/process.c             | 34 +++++++++++++++++++++++=
+-----
>  4 files changed, 51 insertions(+), 18 deletions(-)
>
> diff --git a/arch/loongarch/include/asm/asm-prototypes.h b/arch/loongarch=
/include/asm/asm-prototypes.h
> index 51f224bcfc654228ae423e9a066b25b35102a5b9..0195d4309fd29f94664d5f342=
47198c769033b1b 100644
> --- a/arch/loongarch/include/asm/asm-prototypes.h
> +++ b/arch/loongarch/include/asm/asm-prototypes.h
> @@ -12,3 +12,8 @@ __int128_t __ashlti3(__int128_t a, int b);
>  __int128_t __ashrti3(__int128_t a, int b);
>  __int128_t __lshrti3(__int128_t a, int b);
>  #endif
> +
> +asmlinkage void noinstr __no_stack_protector ret_from_kernel_thread(stru=
ct task_struct *prev,
> +                                                                   struc=
t pt_regs *regs,
> +                                                                   int (=
*fn)(void *),
> +                                                                   void =
*fn_arg);
It is a little strange that we only need to declare
ret_from_kernel_thread() but not ret_from_fork().

> diff --git a/arch/loongarch/include/asm/switch_to.h b/arch/loongarch/incl=
ude/asm/switch_to.h
> index 5b225aff3ba21aa06d0713bc8e73e1b941389630..a1c5576f1fd145670e13038be=
c6dd390486099ab 100644
> --- a/arch/loongarch/include/asm/switch_to.h
> +++ b/arch/loongarch/include/asm/switch_to.h
> @@ -26,6 +26,14 @@ extern asmlinkage struct task_struct *__switch_to(stru=
ct task_struct *prev,
>                         struct task_struct *next, struct thread_info *nex=
t_ti,
>                         void *sched_ra, void *sched_cfa);
>
> +void noinstr __no_stack_protector ret_from_kernel_thread(struct task_str=
uct *prev,
> +                                                        struct pt_regs *=
regs,
> +                                                        int (*fn)(void *=
),
> +                                                        void *fn_arg);
> +
> +void noinstr __no_stack_protector ret_from_fork(struct task_struct *prev=
,
> +                                               struct pt_regs *regs);
> +
I prefer alpha-betical order, which means put ret_from_fork() before
ret_from_kernel_thread().

>  /*
>   * For newly created kernel threads switch_to() will return to
>   * ret_from_kernel_thread, newly created user threads to ret_from_fork.
> diff --git a/arch/loongarch/kernel/entry.S b/arch/loongarch/kernel/entry.=
S
> index 48e7e34e355e83eae8165957ba2eac05a8bf17df..2abc29e573810e000f2fef464=
6ddca0dbb80eabe 100644
> --- a/arch/loongarch/kernel/entry.S
> +++ b/arch/loongarch/kernel/entry.S
> @@ -77,24 +77,22 @@ SYM_CODE_START(handle_syscall)
>  SYM_CODE_END(handle_syscall)
>  _ASM_NOKPROBE(handle_syscall)
>
> -SYM_CODE_START(ret_from_fork)
> +SYM_CODE_START(ret_from_fork_asm)
>         UNWIND_HINT_REGS
> -       bl              schedule_tail           # a0 =3D struct task_stru=
ct *prev
> -       move            a0, sp
> -       bl              syscall_exit_to_user_mode
> +       move            a1, sp
> +       bl              ret_from_fork
>         RESTORE_STATIC
>         RESTORE_SOME
>         RESTORE_SP_AND_RET
> -SYM_CODE_END(ret_from_fork)
> +SYM_CODE_END(ret_from_fork_asm)
>
> -SYM_CODE_START(ret_from_kernel_thread)
> +SYM_CODE_START(ret_from_kernel_thread_asm)
>         UNWIND_HINT_REGS
> -       bl              schedule_tail           # a0 =3D struct task_stru=
ct *prev
> -       move            a0, s1
> -       jirl            ra, s0, 0
> -       move            a0, sp
> -       bl              syscall_exit_to_user_mode
> +       move            a1, sp
> +       move            a2, s0
> +       move            a3, s1
> +       bl              ret_from_kernel_thread
>         RESTORE_STATIC
>         RESTORE_SOME
>         RESTORE_SP_AND_RET
> -SYM_CODE_END(ret_from_kernel_thread)
> +SYM_CODE_END(ret_from_kernel_thread_asm)
> diff --git a/arch/loongarch/kernel/process.c b/arch/loongarch/kernel/proc=
ess.c
> index 6e58f65455c7ca3eae2e88ed852c8655a6701e5c..16cc949fe43443d70f1d865ce=
04595c2d8c1615b 100644
> --- a/arch/loongarch/kernel/process.c
> +++ b/arch/loongarch/kernel/process.c
> @@ -14,6 +14,7 @@
>  #include <linux/init.h>
>  #include <linux/kernel.h>
>  #include <linux/errno.h>
> +#include <linux/entry-common.h>
>  #include <linux/sched.h>
>  #include <linux/sched/debug.h>
>  #include <linux/sched/task.h>
> @@ -33,6 +34,7 @@
>  #include <linux/prctl.h>
>  #include <linux/nmi.h>
>
> +#include <asm/asm-prototypes.h>
>  #include <asm/asm.h>
>  #include <asm/bootinfo.h>
>  #include <asm/cpu.h>
> @@ -47,6 +49,7 @@
>  #include <asm/pgtable.h>
>  #include <asm/processor.h>
>  #include <asm/reg.h>
> +#include <asm/switch_to.h>
>  #include <asm/unwind.h>
>  #include <asm/vdso.h>
>
> @@ -63,8 +66,9 @@ EXPORT_SYMBOL(__stack_chk_guard);
>  unsigned long boot_option_idle_override =3D IDLE_NO_OVERRIDE;
>  EXPORT_SYMBOL(boot_option_idle_override);
>
> -asmlinkage void ret_from_fork(void);
> -asmlinkage void ret_from_kernel_thread(void);
> +asmlinkage void restore_and_ret(void);
> +asmlinkage void ret_from_fork_asm(void);
> +asmlinkage void ret_from_kernel_thread_asm(void);
>
>  void start_thread(struct pt_regs *regs, unsigned long pc, unsigned long =
sp)
>  {
> @@ -138,6 +142,24 @@ int arch_dup_task_struct(struct task_struct *dst, st=
ruct task_struct *src)
>         return 0;
>  }
>
> +asmlinkage void noinstr __no_stack_protector ret_from_kernel_thread(stru=
ct task_struct *prev,
> +                                                                   struc=
t pt_regs *regs,
> +                                                                   int (=
*fn)(void *),
> +                                                                   void =
*fn_arg)
> +{
> +       schedule_tail(prev);
> +
> +       fn(fn_arg);
> +
The two blank lines can be removed, and again, I prefer alpha-betical
order, which means put ret_from_fork() before
ret_from_kernel_thread().

Huacai

> +       syscall_exit_to_user_mode(regs);
> +}
> +
> +void noinstr __no_stack_protector ret_from_fork(struct task_struct *prev=
, struct pt_regs *regs)
> +{
> +       schedule_tail(prev);
> +       syscall_exit_to_user_mode(regs);
> +}
> +
>  /*
>   * Copy architecture-specific thread state
>   */
> @@ -165,8 +187,8 @@ int copy_thread(struct task_struct *p, const struct k=
ernel_clone_args *args)
>                 p->thread.reg03 =3D childksp;
>                 p->thread.reg23 =3D (unsigned long)args->fn;
>                 p->thread.reg24 =3D (unsigned long)args->fn_arg;
> -               p->thread.reg01 =3D (unsigned long)ret_from_kernel_thread=
;
> -               p->thread.sched_ra =3D (unsigned long)ret_from_kernel_thr=
ead;
> +               p->thread.reg01 =3D (unsigned long)ret_from_kernel_thread=
_asm;
> +               p->thread.sched_ra =3D (unsigned long)ret_from_kernel_thr=
ead_asm;
>                 memset(childregs, 0, sizeof(struct pt_regs));
>                 childregs->csr_euen =3D p->thread.csr_euen;
>                 childregs->csr_crmd =3D p->thread.csr_crmd;
> @@ -182,8 +204,8 @@ int copy_thread(struct task_struct *p, const struct k=
ernel_clone_args *args)
>                 childregs->regs[3] =3D usp;
>
>         p->thread.reg03 =3D (unsigned long) childregs;
> -       p->thread.reg01 =3D (unsigned long) ret_from_fork;
> -       p->thread.sched_ra =3D (unsigned long) ret_from_fork;
> +       p->thread.reg01 =3D (unsigned long) ret_from_fork_asm;
> +       p->thread.sched_ra =3D (unsigned long) ret_from_fork_asm;
>
>         /*
>          * New tasks lose permission to use the fpu. This accelerates con=
text
>
> --
> 2.43.0
>
