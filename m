Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A46388374
	for <loongarch@lists.linux.dev>; Tue,  3 Mar 2026 08:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772528056; cv=none; b=S9uycw+VSQ9Bqe43Y98ilZs7ohBA8P8k3HNwxhJ5R0OgHZGTQkC9NHadSlgugiDi/0EfYl8GCSCNoR8jDC2EFSmjaNxvnumA6czY54dg+Gnc5zzinjHoi8qYahqrpDjyNVssWzWDTIx1J8qLEuhFapD342ddqUFpQst/Mw8ADK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772528056; c=relaxed/simple;
	bh=KkBvZN2UrRbMKIJxIwzV7ERk5ExBbZF42dvqj208KhA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P48ANKgqdrFx0Kbz0YuQ0XgSO9GXNwDGSkHLfo11wcr1ksCDHoZHUDuGItwqXCV+vmqK1qU3XJzWW18Zv3Sy3HXzORGwK6PHR4IeVYxFKfDSEV+dHpwYBe0EJoqtMcLvKrL5eEkJ1/sTVfFQm5043vQacOUJAZSo2QSr2eAHCjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V/Jj3iMZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V/Jj3iMZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56C43C2BCB6
	for <loongarch@lists.linux.dev>; Tue,  3 Mar 2026 08:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772528056;
	bh=KkBvZN2UrRbMKIJxIwzV7ERk5ExBbZF42dvqj208KhA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=V/Jj3iMZ3dGQ/UjjyhddtlriHgSThZaZKboUfQrw9X0lzyq6ahOb8ktvj0ROvKX9b
	 ag4wKyPM06mjPp+s7m+WMt9Im2HOEFR1KKm70+N1P/pUYmmJt1kNoT4R0AbCiR738O
	 eVR9il9KI0tzZyIpvjr/OnjotXOPsjhLyeYxa3osNDPcCr56DA+ayAhyEC6fQV89fR
	 Hy+Z24EOQ1FpeY3jGFGApACdQdqENMp5gKhECnd6JNoKoQgnzXbZxV6o68cRWbqcJ7
	 /1ASADTkC+ZYd2LeWbJjar10Izvn1aOwYqqb0Fsr9thS/uwJ3eAKsLJkrycOZM0N3s
	 TPFlZQ2/gDH6A==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-65fb991d7e7so7766087a12.1
        for <loongarch@lists.linux.dev>; Tue, 03 Mar 2026 00:54:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXCARJT5MjGc+RyVxOUgxjfz4WyiL8lvwMMKL/HJLE8A0k6JmvcadNkOgit4xOrxmB/iRwfaISsJVA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzZXmja4StXuVptE4pSDI/c8twzcr9tytCKhw2JS4sWOV78dmat
	nVy4rYyQxr2xAuXp+lipMhPcjzmM6NImSNuSy3I9F3C1m9rWaTagxxtc4n4C+TLF5zAYWjTOiwJ
	3fRMB/E5cNOJymeTwuBH8gBBa/fBiW9w=
X-Received: by 2002:a05:6402:270a:b0:65b:ef58:4ce5 with SMTP id
 4fb4d7f45d1cf-65fde4cd49emr9719023a12.28.1772528054520; Tue, 03 Mar 2026
 00:54:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260303083248.567185-1-xry111@xry111.site>
In-Reply-To: <20260303083248.567185-1-xry111@xry111.site>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 3 Mar 2026 16:54:18 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4mk5f4RMspuwFtWpT775zwJMhiOy2W83jav5XZfg_L-A@mail.gmail.com>
X-Gm-Features: AaiRm53bH_Q9hYJG6f6kdB46zhIF4WWpyF9stIs_oxydYBY29KY6n66KBgbwMwE
Message-ID: <CAAhV-H4mk5f4RMspuwFtWpT775zwJMhiOy2W83jav5XZfg_L-A@mail.gmail.com>
Subject: Re: [PATCH v3] LoongArch: vDSO: Emit GNU_EH_FRAME correctly
To: Xi Ruoyao <xry111@xry111.site>
Cc: WANG Xuerui <kernel@xen0n.name>, Jinyang He <hejinyang@loongson.cn>, 
	WANG Rui <wangrui@loongson.cn>, Mingcong Bai <jeffbai@aosc.io>, Zixing Liu <liushuyu@aosc.io>, 
	"H . Peter Anvin" <hpa@zytor.com>, stable@vger.kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Menglong Dong <menglong8.dong@gmail.com>, 
	Bibo Mao <maobibo@loongson.cn>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	Hanlu Li <lihanlu@loongson.cn>, Nathan Chancellor <nathan@kernel.org>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Wentao Guan <guanwentao@uniontech.com>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Ruoyao,

On Tue, Mar 3, 2026 at 4:33=E2=80=AFPM Xi Ruoyao <xry111@xry111.site> wrote=
:
>
> With -fno-asynchronous-unwind-tables and --no-eh-frame-hdr (the default
> of the linker), the GNU_EH_FRAME segment (specified by vdso.lds.S) is
> empty.  This is not valid, as the current DWARF specification mandates
> the first byte of the EH frame to be the version number 1.  It causes
> some unwinders to complain, for example the ClickHouse query profiler
> spams the log with messages:
>
>     clickhouse-server[365854]: libunwind: unsupported .eh_frame_hdr
>     version: 127 at 7ffffffb0000
>
> Here "127" is just the byte located at the p_vaddr (0, i.e. the
> beginning of the vDSO) of the empty GNU_EH_FRAME segment.
> Cross-checking with /proc/365854/maps has also proven 7ffffffb0000 is
> the start of vDSO in the process VM image.
>
> In LoongArch the -fno-asynchronous-unwind-tables option seems just a
> MIPS legacy, and MIPS only uses this option to satisfy the MIPS-specific
> "genvdso" program, per the commit cfd75c2db17e ("MIPS: VDSO: Explicitly
> use -fno-asynchronous-unwind-tables").  IIRC it indicates some inherent
> limitation of the MIPS ELF ABI and has nothing to do with LoongArch.  So
> we can simply flip it over to -fasynchronous-unwind-tables and pass
> --eh-frame-hdr for linking the vDSO, allowing the profilers to unwind the
> stack for statistics even if the sample point is taken when the PC is in
> the vDSO.
>
> However simply adjusting the options above would exploit an issue: when
> the libgcc unwinder saw the invalid GNU_EH_FRAME segment, it silently
> falled back to a machine-specific routine to match the code pattern of
> rt_sigreturn and extract the registers saved in the sigframe if the code
> pattern is matched.  As unwinding from signal handlers is vital for
> libgcc to support pthread cancellation etc., the fall-back routine had
> been silently keeping the LoongArch Linux systems functioning since
> Linux 5.19.  But when we start to emit GNU_EH_FRAME with the correct
> format, fall-back routine will no longer be used and libgcc will fail
> to unwind the sigframe, and unwinding from signal handlers will no
> longer work, causing dozens of glibc test failures.  To make it possible
> to unwind from signal handlers again, it's necessary to code the unwind
> info in __vdso_rt_sigreturn via .cfi_* directives.
>
> The offsets in the .cfi_* directives depend on the layout of struct
> sigframe, notably the offset of sigcontect in the sigframe.  To use the
> offset in the assembly file, factor out struct sigframe into a header to
> allow asm-offsets.c to output the offset for assembly.
>
> To work around a long-term issue in the libgcc unwinder (the pc is
> unconditionally substracted by 1: doing so is technically incorrect for
> a signal frame), a nop instruction is included with the two real
> instructions in __vdso_rt_sigreturn in the same FDE PC range.  The same
> hack has been used on x86 for a long time.
>
> Fixes: c6b99bed6b8f ("LoongArch: Add VDSO and VSYSCALL support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> ---
>
> Changes from [v2]:
> - Wrap .cfi_* for signal trampoline in SYM_SIGFUNC_START.
> - Remove comment lines in sigframe.h not so meaningful.
>
> Changes from [v1] to v2:
> - Use DWARF column 0 instead of the libgcc-specific column 72.
> - Style change to sigframe.h.
>
> [v1]: https://lore.kernel.org/20260225104607.3803060-1-xry111@xry111.site
>
>  arch/loongarch/include/asm/linkage.h  | 34 +++++++++++++++++++++++++++
>  arch/loongarch/include/asm/sigframe.h |  9 +++++++
>  arch/loongarch/kernel/asm-offsets.c   |  2 ++
>  arch/loongarch/kernel/signal.c        |  6 +----
>  arch/loongarch/vdso/Makefile          |  4 ++--
>  arch/loongarch/vdso/sigreturn.S       | 10 +++-----
>  6 files changed, 51 insertions(+), 14 deletions(-)
>  create mode 100644 arch/loongarch/include/asm/sigframe.h
>
> diff --git a/arch/loongarch/include/asm/linkage.h b/arch/loongarch/includ=
e/asm/linkage.h
> index e2eca1a25b4e..db465036385f 100644
> --- a/arch/loongarch/include/asm/linkage.h
> +++ b/arch/loongarch/include/asm/linkage.h
> @@ -42,3 +42,37 @@
>         SYM_END(name, SYM_T_NONE)
>
>  #endif
> +
> +/*
> + * This is for the signal handler trampoline, which is used as the retur=
n
> + * address of the signal handlers in userspace instead of called normall=
y.
> + * The long standing libgcc bug https://gcc.gnu.org/PR124050 requires a
> + * nop between .cfi_startproc and the actual address of the trampoline, =
so
> + * we cannot simply use SYM_FUNC_START.
> + *
> + * This wrapper also contains all the .cfi_* directives for recovering
> + * the content of the GPRs and the "return address" (where the rt_sigret=
urn
> + * syscall will jump to), assuming there is a struct rt_sigframe (where
> + * a struct sigcontext containing those information we need to recover) =
at
> + * $sp.  The "DWARF for the LoongArch(TM) Architecture" manual states
> + * column 0 is for $zero, but it does not make too much sense to
> + * save/restore the hardware zero register.  Repurpose this column here
> + * for the return address (here it's not the content of $ra we cannot us=
e
> + * the default column 3).
> + */
> +#define SYM_SIGFUNC_START(name)                                \
> +       .cfi_startproc;                                 \
> +       .cfi_signal_frame;                              \
> +       .cfi_def_cfa 3, RT_SIGFRAME_SC;                 \
> +       .cfi_return_column 0;                           \
> +       .cfi_offset 0, SC_PC;                           \
> +       .irp    num, 1, 2, 3, 4, 5, 6, 7, 8,            \
> +                    9, 10, 11, 12, 13, 14, 15, 16,     \
> +                    17, 18, 19, 20, 21, 22, 23, 24,    \
> +                    25, 26, 27, 28, 29, 30, 31;        \
> +       .cfi_offset \num, SC_REGS + \num * SZREG;       \
> +       .endr;                                          \
> +       nop;                                            \
> +       SYM_START(name, SYM_L_GLOBAL, SYM_A_ALIGN)
> +
> +#define SYM_SIGFUNC_END(name) SYM_FUNC_END(name)
Why this block is out of #endif ?

> diff --git a/arch/loongarch/include/asm/sigframe.h b/arch/loongarch/inclu=
de/asm/sigframe.h
> new file mode 100644
> index 000000000000..109298b8d7e0
> --- /dev/null
> +++ b/arch/loongarch/include/asm/sigframe.h
> @@ -0,0 +1,9 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +
> +#include <asm/siginfo.h>
> +#include <asm/ucontext.h>
> +
> +struct rt_sigframe {
> +       struct siginfo rs_info;
> +       struct ucontext rs_uctx;
> +};
> diff --git a/arch/loongarch/kernel/asm-offsets.c b/arch/loongarch/kernel/=
asm-offsets.c
> index 3017c7157600..2cc953f113ac 100644
> --- a/arch/loongarch/kernel/asm-offsets.c
> +++ b/arch/loongarch/kernel/asm-offsets.c
> @@ -16,6 +16,7 @@
>  #include <asm/ptrace.h>
>  #include <asm/processor.h>
>  #include <asm/ftrace.h>
> +#include <asm/sigframe.h>
>  #include <vdso/datapage.h>
>
>  static void __used output_ptreg_defines(void)
> @@ -220,6 +221,7 @@ static void __used output_sc_defines(void)
>         COMMENT("Linux sigcontext offsets.");
>         OFFSET(SC_REGS, sigcontext, sc_regs);
>         OFFSET(SC_PC, sigcontext, sc_pc);
> +       OFFSET(RT_SIGFRAME_SC, rt_sigframe, rs_uctx.uc_mcontext);
>         BLANK();
>  }
>
> diff --git a/arch/loongarch/kernel/signal.c b/arch/loongarch/kernel/signa=
l.c
> index c9f7ca778364..e297d54ea638 100644
> --- a/arch/loongarch/kernel/signal.c
> +++ b/arch/loongarch/kernel/signal.c
> @@ -37,6 +37,7 @@
>  #include <asm/lbt.h>
>  #include <asm/ucontext.h>
>  #include <asm/vdso.h>
> +#include <asm/sigframe.h>
>
>  #ifdef DEBUG_SIG
>  #  define DEBUGP(fmt, args...) printk("%s: " fmt, __func__, ##args)
> @@ -51,11 +52,6 @@
>  #define lock_lbt_owner()       ({ preempt_disable(); pagefault_disable()=
; })
>  #define unlock_lbt_owner()     ({ pagefault_enable(); preempt_enable(); =
})
>
> -struct rt_sigframe {
> -       struct siginfo rs_info;
> -       struct ucontext rs_uctx;
> -};
> -
>  struct _ctx_layout {
>         struct sctx_info *addr;
>         unsigned int size;
> diff --git a/arch/loongarch/vdso/Makefile b/arch/loongarch/vdso/Makefile
> index 520f1513f07d..294c16b9517f 100644
> --- a/arch/loongarch/vdso/Makefile
> +++ b/arch/loongarch/vdso/Makefile
> @@ -26,7 +26,7 @@ cflags-vdso :=3D $(ccflags-vdso) \
>         $(filter -W%,$(filter-out -Wa$(comma)%,$(KBUILD_CFLAGS))) \
>         -std=3Dgnu11 -fms-extensions -O2 -g -fno-strict-aliasing -fno-com=
mon -fno-builtin \
>         -fno-stack-protector -fno-jump-tables -DDISABLE_BRANCH_PROFILING =
\
> -       $(call cc-option, -fno-asynchronous-unwind-tables) \
> +       $(call cc-option, -fasynchronous-unwind-tables) \
>         $(call cc-option, -fno-stack-protector)
>  aflags-vdso :=3D $(ccflags-vdso) \
>         -D__ASSEMBLY__ -Wa,-gdwarf-2
> @@ -41,7 +41,7 @@ endif
>
>  # VDSO linker flags.
>  ldflags-y :=3D -Bsymbolic --no-undefined -soname=3Dlinux-vdso.so.1 \
> -       $(filter -E%,$(KBUILD_CFLAGS)) -shared --build-id -T
> +       $(filter -E%,$(KBUILD_CFLAGS)) -shared --build-id --eh-frame-hdr =
-T
>
>  #
>  # Shared build commands.
> diff --git a/arch/loongarch/vdso/sigreturn.S b/arch/loongarch/vdso/sigret=
urn.S
> index 9cb3c58fad03..e40bf4186f29 100644
> --- a/arch/loongarch/vdso/sigreturn.S
> +++ b/arch/loongarch/vdso/sigreturn.S
> @@ -12,13 +12,9 @@
>
>  #include <asm/regdef.h>
>  #include <asm/asm.h>
> +#include <asm/asm-offsets.h>
>
> -       .section        .text
Can we keep this line?

Huacai

> -       .cfi_sections   .debug_frame
> -
> -SYM_FUNC_START(__vdso_rt_sigreturn)
> -
> +SYM_SIGFUNC_START(__vdso_rt_sigreturn)
>         li.w    a7, __NR_rt_sigreturn
>         syscall 0
> -
> -SYM_FUNC_END(__vdso_rt_sigreturn)
> +SYM_SIGFUNC_END(__vdso_rt_sigreturn)
> --
> 2.53.0
>
