Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D009A282F06
	for <loongarch@lists.linux.dev>; Fri, 10 Jul 2026 13:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783688614; cv=none; b=Vy5lk8h66Diu3LH00UnQlYjwvozdvlGc52gmJcnFtIuBsCG11N/OG8lxWxNl269lbWJuyKvTrw2ndD0vFhC51mnD/nE4XdgE1Ec3l/0JEOuwBGzmKLoJ6lQJNhML/76QFyNpUCTXcUtNjDeWWuYepK7VwSc4qmKESbU5OwT0jwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783688614; c=relaxed/simple;
	bh=OV7h+5uYjqODTa5Z3gtOifbhO3tErEWGApV0KnHxMr4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EB8leT0fCEIukZqG60JoTxA/uWN6zedDk93IVqTJ4uupz0hKb11cinRb45P7MlkpS/trInMurM8j6gD1f/TxX31tRzCJfy+hpEFPm8nLGIY3I5YTY8ty3R+w3NsWxi5EqsJyvugE69LyjbpNCdasrqNG6CyfQhjeZLixA/R+HqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AG9YBtU4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AG9YBtU4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71F111F00A3F
	for <loongarch@lists.linux.dev>; Fri, 10 Jul 2026 13:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783688612;
	bh=wCytsM4LZXG1WYU+MdFPlf49ZntIOQI8Jxglq+DMy/0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=AG9YBtU4XLkkLikTlgrZ6T+NXgGnvsNnPzYW63U+xLdgFMGfNE+4qcKOFCWlp5VkI
	 rFoz+miTFbO+31WD4WmMkmUF6meYDX2ehbBcJXTbfUxSpTjvrGQA2kh1yLiDhvWSTL
	 Oi7ttUSTi2aBjICOOPpkwjrHKUAadMATpFA+5SyK/+uwrqku2jn2T/4oQtwCePemlE
	 UAkdgeOqFg0jX01iPWdyHcH+GhFN1w4ni9ywXfdbJzTjf6IIQ3NakivFTNfg0f9cd5
	 9C+LhSc15sVTK682vfT9yEy2FaQZ8yvKpEnR89S2GMZLxCZNyhyUDSB+VUCG3/lyYa
	 vkJuEZkUZgXrg==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-698e5859a3cso1683798a12.0
        for <loongarch@lists.linux.dev>; Fri, 10 Jul 2026 06:03:32 -0700 (PDT)
X-Gm-Message-State: AOJu0YyMpGhljl60ivqXZG60MQ8+aejhDP/A4OYIjjd+Lt1DYfI4tS7X
	5NK47rLcoORtb5yWzxcudcRQpdCIsyzrb6nbne96k11RPDCzVSTtdX43SYRmi3tRivbIlbNk+NA
	f0HkfN6xB4L5zYGTmd/9Y8cgAXYEWnMs=
X-Received: by 2002:a05:6402:1808:b0:69a:3652:9d33 with SMTP id
 4fb4d7f45d1cf-69c24ea1251mr1132423a12.19.1783688610953; Fri, 10 Jul 2026
 06:03:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260707064556.371881-1-haoran.jiang@linux.dev> <20260707064556.371881-2-haoran.jiang@linux.dev>
In-Reply-To: <20260707064556.371881-2-haoran.jiang@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 10 Jul 2026 21:03:19 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6LcvzOSOKW4eAHqZwCNRKn6dWB6GZNLha8oT9-pj2AeA@mail.gmail.com>
X-Gm-Features: AUfX_mz-fjU8JL1lI5rbs-TBpmtaAgCHD8hIzvUZXwvA4ggDKxhj6yGVC6XHPM4
Message-ID: <CAAhV-H6LcvzOSOKW4eAHqZwCNRKn6dWB6GZNLha8oT9-pj2AeA@mail.gmail.com>
Subject: Re: [PATCH 1/2] LoongArch: Enforce W^X for page-mapped virtual memory region
To: haoran.jiang@linux.dev
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, kernel@xen0n.name, 
	yangtiezhu@loongson.cn, Haoran Jiang <jianghaoran@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Haoran,

On Tue, Jul 7, 2026 at 2:47=E2=80=AFPM <haoran.jiang@linux.dev> wrote:
>
> From: Haoran Jiang <jianghaoran@kylinos.cn>
>
> Add the non-executable permission flag `_PAGE_NO_EXEC` to
> the default attributes of kernel page tables, so that page
> table permissions comply with the W^X (Write XOR Execute)
> principle by default. Also enable `STRICT_MODULE_RWX` to
> enforce strict memory permissions on the module region,
> making the code region non=E2=80=91writable, the data region non=E2=80=91=
executable,
> and the read=E2=80=91only data region both non=E2=80=91writable and non=
=E2=80=91executable.
> When code section modifications are needed, the `set_memory_xx()`
> API is used to temporarily alter the read/write permissions
> of the code section.
>
> Signed-off-by: Haoran Jiang <jianghaoran@kylinos.cn>
> ---
>  arch/loongarch/Kconfig                    |  1 +
>  arch/loongarch/include/asm/pgtable-bits.h | 12 +++---
>  arch/loongarch/kernel/ftrace_dyn.c        | 16 ++++++++
>  arch/loongarch/kernel/inst.c              | 25 ++++++++++--
>  arch/loongarch/kernel/jump_label.c        |  3 ++
>  arch/loongarch/kernel/kgdb.c              | 50 +++++++++++++++++++++++
>  arch/loongarch/kernel/kprobes.c           |  4 +-
>  7 files changed, 99 insertions(+), 12 deletions(-)
>
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index bec7cc1d72ee..2c5de66bf047 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -27,6 +27,7 @@ config LOONGARCH
>         select ARCH_HAS_PTE_SPECIAL if 64BIT
>         select ARCH_HAS_SET_MEMORY
>         select ARCH_HAS_SET_DIRECT_MAP
> +       select ARCH_HAS_STRICT_MODULE_RWX
>         select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
>         select ARCH_HAS_UBSAN
>         select ARCH_HAS_VDSO_ARCH_DATA
> diff --git a/arch/loongarch/include/asm/pgtable-bits.h b/arch/loongarch/i=
nclude/asm/pgtable-bits.h
> index b565573cd82e..8ad5dccb312e 100644
> --- a/arch/loongarch/include/asm/pgtable-bits.h
> +++ b/arch/loongarch/include/asm/pgtable-bits.h
> @@ -110,17 +110,17 @@
>  #define _HPAGE_CHG_MASK        (_PAGE_MODIFIED | _PAGE_SPECIAL | _PFN_MA=
SK | _CACHE_MASK | _PAGE_PLV | _PAGE_HUGE)
>
>  #define PAGE_NONE      __pgprot(_PAGE_PROTNONE | _PAGE_NO_READ | \
> -                                _PAGE_USER | _CACHE_CC)
> +                                _PAGE_USER | _CACHE_CC | _PAGE_NO_EXEC)
>  #define PAGE_SHARED    __pgprot(_PAGE_PRESENT | _PAGE_WRITE | \
> -                                _PAGE_USER | _CACHE_CC)
> -#define PAGE_READONLY  __pgprot(_PAGE_PRESENT | _PAGE_USER | _CACHE_CC)
> +                                _PAGE_USER | _CACHE_CC | _PAGE_NO_EXEC)
> +#define PAGE_READONLY  __pgprot(_PAGE_PRESENT | _PAGE_USER | _CACHE_CC |=
 _PAGE_NO_EXEC)
>
>  #define PAGE_KERNEL    __pgprot(_PAGE_PRESENT | __READABLE | __WRITEABLE=
 | \
> -                                _PAGE_GLOBAL | _PAGE_KERN | _CACHE_CC)
> +                                _PAGE_GLOBAL | _PAGE_KERN | _CACHE_CC | =
_PAGE_NO_EXEC)
>  #define PAGE_KERNEL_SUC __pgprot(_PAGE_PRESENT | __READABLE | __WRITEABL=
E | \
> -                                _PAGE_GLOBAL | _PAGE_KERN |  _CACHE_SUC)
> +                                _PAGE_GLOBAL | _PAGE_KERN |  _CACHE_SUC =
| _PAGE_NO_EXEC)
>  #define PAGE_KERNEL_WUC __pgprot(_PAGE_PRESENT | __READABLE | __WRITEABL=
E | \
> -                                _PAGE_GLOBAL | _PAGE_KERN |  _CACHE_WUC)
> +                                _PAGE_GLOBAL | _PAGE_KERN |  _CACHE_WUC =
| _PAGE_NO_EXEC)
>
>  #ifndef __ASSEMBLER__
>
> diff --git a/arch/loongarch/kernel/ftrace_dyn.c b/arch/loongarch/kernel/f=
trace_dyn.c
> index d5d81d74034c..d1d8c4c2da75 100644
> --- a/arch/loongarch/kernel/ftrace_dyn.c
> +++ b/arch/loongarch/kernel/ftrace_dyn.c
> @@ -8,10 +8,24 @@
>  #include <linux/ftrace.h>
>  #include <linux/kprobes.h>
>  #include <linux/uaccess.h>
> +#include <linux/memory.h>
>
>  #include <asm/inst.h>
>  #include <asm/module.h>
>
> +
> +void ftrace_arch_code_modify_prepare(void)
> +       __acquires(&text_mutex)
> +{
> +       mutex_lock(&text_mutex);
> +}
> +
> +void ftrace_arch_code_modify_post_process(void)
> +       __releases(&text_mutex)
> +{
> +       mutex_unlock(&text_mutex);
> +}
> +
>  static int ftrace_modify_code(unsigned long pc, u32 old, u32 new, bool v=
alidate)
>  {
>         u32 replaced;
> @@ -171,6 +185,8 @@ int ftrace_init_nop(struct module *mod, struct dyn_ft=
race *rec)
>         u32 old, new;
>         unsigned long pc;
>
> +       guard(mutex)(&text_mutex);
> +
>         pc =3D rec->ip;
>         old =3D larch_insn_gen_nop();
>         new =3D larch_insn_gen_move(LOONGARCH_GPR_T0, LOONGARCH_GPR_RA);
> diff --git a/arch/loongarch/kernel/inst.c b/arch/loongarch/kernel/inst.c
> index 0b9228b7c13a..3de94d465c3c 100644
> --- a/arch/loongarch/kernel/inst.c
> +++ b/arch/loongarch/kernel/inst.c
> @@ -6,12 +6,11 @@
>  #include <linux/uaccess.h>
>  #include <linux/set_memory.h>
>  #include <linux/stop_machine.h>
> +#include <linux/memory.h>
>
>  #include <asm/cacheflush.h>
>  #include <asm/inst.h>
>
> -static DEFINE_RAW_SPINLOCK(patch_lock);
> -
>  void simu_pc(struct pt_regs *regs, union loongarch_instruction insn)
>  {
>         unsigned long pc =3D regs->csr_era;
> @@ -207,14 +206,32 @@ int larch_insn_read(void *addr, u32 *insnp)
>  int larch_insn_write(void *addr, u32 insn)
>  {
>         int ret;
> +       int err =3D 0;
I think it doesn't need to initialize.

> +       size_t start;
Use "unsigned long" is better, because set_memory need "unsigned long".

>         unsigned long flags =3D 0;
>
>         if ((unsigned long)addr & 3)
>                 return -EINVAL;
>
> -       raw_spin_lock_irqsave(&patch_lock, flags);
> +       start =3D round_down((size_t)addr, PAGE_SIZE);
> +
> +       lockdep_assert_held(&text_mutex);
> +
> +       err =3D set_memory_rw(start, 1);
> +       if (err) {
> +               pr_info("%s: set_memory_rw() failed\n", __func__);
> +               return err;
> +       }
> +
> +       local_irq_save(flags);
>         ret =3D copy_to_kernel_nofault(addr, &insn, LOONGARCH_INSN_SIZE);
> -       raw_spin_unlock_irqrestore(&patch_lock, flags);
> +       local_irq_restore(flags);
> +
> +       err =3D set_memory_rox(start, 1);
> +       if (err) {
> +               pr_info("%s: set_memory_rox() failed\n", __func__);
> +               return err;
> +       }
>
>         return ret;
>  }
> diff --git a/arch/loongarch/kernel/jump_label.c b/arch/loongarch/kernel/j=
ump_label.c
> index 24a3f4d8540c..e6bb040fe4c5 100644
> --- a/arch/loongarch/kernel/jump_label.c
> +++ b/arch/loongarch/kernel/jump_label.c
> @@ -6,6 +6,7 @@
>   */
>  #include <linux/kernel.h>
>  #include <linux/jump_label.h>
> +#include <linux/memory.h>
>  #include <asm/cacheflush.h>
>  #include <asm/inst.h>
>
> @@ -19,7 +20,9 @@ bool arch_jump_label_transform_queue(struct jump_entry =
*entry, enum jump_label_t
>         else
>                 insn =3D larch_insn_gen_nop();
>
> +       mutex_lock(&text_mutex);
>         larch_insn_write(addr, insn);
> +       mutex_unlock(&text_mutex);
>
>         return true;
>  }
> diff --git a/arch/loongarch/kernel/kgdb.c b/arch/loongarch/kernel/kgdb.c
> index 17664a6043b1..cacaff338f90 100644
> --- a/arch/loongarch/kernel/kgdb.c
> +++ b/arch/loongarch/kernel/kgdb.c
> @@ -21,6 +21,7 @@
>  #include <asm/irq_regs.h>
>  #include <asm/ptrace.h>
>  #include <asm/sigcontext.h>
> +#include <asm/tlbflush.h>
>
>  int kgdb_watch_activated;
>  static unsigned int stepped_opcode;
> @@ -233,6 +234,51 @@ noinline void arch_kgdb_breakpoint(void)
>  }
>  STACK_FRAME_NON_STANDARD(arch_kgdb_breakpoint);
>
> +static inline bool kgdb_set_page_rwx(unsigned long addr, bool protect)

kgdb_set_page_rw() is better than kgdb_set_page_rwx() because you
don't touch x here, and "bool ro" is better than "bool protect"
because "protect" is too general.

> +{
> +       pte_t *pte =3D virt_to_kpte(addr);
> +
> +       if (WARN_ON(!pte) || pte_none(ptep_get(pte)))
> +               return false;
> +
> +       if (protect)
> +               set_pte(pte, __pte(pte_val(ptep_get(pte)) & ~(_PAGE_WRITE=
 | _PAGE_DIRTY)));
> +       else
> +               set_pte(pte, __pte(pte_val(ptep_get(pte)) | (_PAGE_WRITE =
| _PAGE_DIRTY)));
> +
> +       local_flush_tlb_one(addr);
> +       return true;
> +}
> +
> +int kgdb_arch_set_breakpoint(struct kgdb_bkpt *bpt)
> +{
> +       int err;
> +
> +       err =3D copy_from_kernel_nofault(bpt->saved_instr, (char *)bpt->b=
pt_addr,
> +                                       BREAK_INSTR_SIZE);
> +       if (err)
> +               return err;
> +
> +       kgdb_set_page_rwx(bpt->bpt_addr, 0);
The type is bool, so please use true and false rather than 0 and 1.

Huacai

> +       err =3D copy_to_kernel_nofault((char *)bpt->bpt_addr,
> +                                       arch_kgdb_ops.gdb_bpt_instr, BREA=
K_INSTR_SIZE);
> +       kgdb_set_page_rwx(bpt->bpt_addr, 1);
> +       return err;
> +}
> +
> +int kgdb_arch_remove_breakpoint(struct kgdb_bkpt *bpt)
> +{
> +       int err;
> +
> +       kgdb_set_page_rwx(bpt->bpt_addr, 0);
> +       err =3D copy_to_kernel_nofault((char *)bpt->bpt_addr,
> +                                       (char *)bpt->saved_instr, BREAK_I=
NSTR_SIZE);
> +       kgdb_set_page_rwx(bpt->bpt_addr, 1);
> +
> +       return err;
> +}
> +
> +
>  /*
>   * Calls linux_debug_hook before the kernel dies. If KGDB is enabled,
>   * then try to fall into the debugger
> @@ -393,9 +439,11 @@ static int do_single_step(struct pt_regs *regs)
>
>         stepped_address =3D addr;
>
> +       kgdb_set_page_rwx(stepped_address, 0);
>         /* Replace the opcode with the break instruction */
>         error =3D copy_to_kernel_nofault((void *)stepped_address,
>                                        arch_kgdb_ops.gdb_bpt_instr, BREAK=
_INSTR_SIZE);
> +       kgdb_set_page_rwx(stepped_address, 1);
>         flush_icache_range(addr, addr + BREAK_INSTR_SIZE);
>
>         if (error) {
> @@ -413,8 +461,10 @@ static int do_single_step(struct pt_regs *regs)
>  static void undo_single_step(struct pt_regs *regs)
>  {
>         if (stepped_opcode) {
> +               kgdb_set_page_rwx(stepped_address, 0);
>                 copy_to_kernel_nofault((void *)stepped_address,
>                                        (void *)&stepped_opcode, BREAK_INS=
TR_SIZE);
> +               kgdb_set_page_rwx(stepped_address, 1);
>                 flush_icache_range(stepped_address, stepped_address + BRE=
AK_INSTR_SIZE);
>         }
>
> diff --git a/arch/loongarch/kernel/kprobes.c b/arch/loongarch/kernel/kpro=
bes.c
> index 1985ed30dd16..cb3565178bb4 100644
> --- a/arch/loongarch/kernel/kprobes.c
> +++ b/arch/loongarch/kernel/kprobes.c
> @@ -12,8 +12,8 @@ DEFINE_PER_CPU(struct kprobe_ctlblk, kprobe_ctlblk);
>
>  static void arch_prepare_ss_slot(struct kprobe *p)
>  {
> -       p->ainsn.insn[0] =3D *p->addr;
> -       p->ainsn.insn[1] =3D KPROBE_SSTEPBP_INSN;
> +       larch_insn_patch_text(p->ainsn.insn, *p->addr);
> +       larch_insn_patch_text(p->ainsn.insn + 1, KPROBE_SSTEPBP_INSN);
>         p->ainsn.restore =3D (unsigned long)p->addr + LOONGARCH_INSN_SIZE=
;
>  }
>  NOKPROBE_SYMBOL(arch_prepare_ss_slot);
> --
> 2.43.0
>
