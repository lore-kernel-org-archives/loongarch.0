Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B0F0171CC
	for <loongarch@lists.linux.dev>; Tue,  9 May 2023 07:59:24 +0000 (UTC)
Received: from loongson.cn (unknown [192.168.100.1])
	by gateway (Coremail) with SMTP id _____8Bxb+tb_VlkguQGAA--.11302S3;
	Tue, 09 May 2023 15:59:23 +0800 (CST)
Received: from [0.0.0.0] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxFLVZ_VlkgktSAA--.16934S3;
	Tue, 09 May 2023 15:59:22 +0800 (CST)
Subject: Re: [PATCH] LoongArch: Add jump-label implementation
To: Huacai Chen <chenhuacai@kernel.org>
References: <1683617390-18015-1-git-send-email-tangyouling@loongson.cn>
Cc: Jonathan Corbet <corbet@lwn.net>, Peter Zijlstra <peterz@infradead.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>,
 WANG Xuerui <kernel@xen0n.name>, Zhangjin Wu <falcon@tinylab.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev
From: Youling Tang <tangyouling@loongson.cn>
Message-ID: <88e4943e-275c-9eac-4b82-def5bf42c42c@loongson.cn>
Date: Tue, 9 May 2023 15:59:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <1683617390-18015-1-git-send-email-tangyouling@loongson.cn>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8BxFLVZ_VlkgktSAA--.16934S3
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoW3Ww15AryDAFy7JFWxCw43trb_yoW7XFW5pr
	1UArn5CF4kGF1fJrZ8tryDur45tws3G3W2gF43Kry8AFnrZ34v9rnakrWDuF1kJa93JrW0
	qF1S9Fs09a1UJ3JanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bIxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM2
	8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0V
	AKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Cr0_Gr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487Mx
	AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
	Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwI
	xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8
	JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcV
	C2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU1A9N7UUUUU==

On 05/09/2023 03:29 PM, Youling Tang wrote:
> Add jump-label implementation based on the ARM64 version.
>
> Signed-off-by: Youling Tang <tangyouling@loongson.cn>
> ---
>  .../core/jump-labels/arch-support.txt         |  2 +-
>  arch/loongarch/Kconfig                        |  2 +
>  arch/loongarch/configs/loongson3_defconfig    |  1 +
>  arch/loongarch/include/asm/jump_label.h       | 52 +++++++++++++++++++
>  arch/loongarch/kernel/Makefile                |  2 +
>  arch/loongarch/kernel/jump_label.c            | 23 ++++++++
>  6 files changed, 81 insertions(+), 1 deletion(-)
>  create mode 100644 arch/loongarch/include/asm/jump_label.h
>  create mode 100644 arch/loongarch/kernel/jump_label.c
>
> diff --git a/Documentation/features/core/jump-labels/arch-support.txt b/Documentation/features/core/jump-labels/arch-support.txt
> index 2328eada3a49..94d9dece580f 100644
> --- a/Documentation/features/core/jump-labels/arch-support.txt
> +++ b/Documentation/features/core/jump-labels/arch-support.txt
> @@ -13,7 +13,7 @@
>      |        csky: |  ok  |
>      |     hexagon: | TODO |
>      |        ia64: | TODO |
> -    |   loongarch: | TODO |
> +    |   loongarch: |  ok  |
>      |        m68k: | TODO |
>      |  microblaze: | TODO |
>      |        mips: |  ok  |
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index d38b066fc931..193a959a5611 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -83,6 +83,8 @@ config LOONGARCH
>  	select GPIOLIB
>  	select HAS_IOPORT
>  	select HAVE_ARCH_AUDITSYSCALL
> +	select HAVE_ARCH_JUMP_LABEL
> +	select HAVE_ARCH_JUMP_LABEL_RELATIVE
>  	select HAVE_ARCH_MMAP_RND_BITS if MMU
>  	select HAVE_ARCH_SECCOMP_FILTER
>  	select HAVE_ARCH_TRACEHOOK
> diff --git a/arch/loongarch/configs/loongson3_defconfig b/arch/loongarch/configs/loongson3_defconfig
> index 6cd26dd3c134..33a0f5f742f6 100644
> --- a/arch/loongarch/configs/loongson3_defconfig
> +++ b/arch/loongarch/configs/loongson3_defconfig
> @@ -63,6 +63,7 @@ CONFIG_EFI_ZBOOT=y
>  CONFIG_EFI_GENERIC_STUB_INITRD_CMDLINE_LOADER=y
>  CONFIG_EFI_CAPSULE_LOADER=m
>  CONFIG_EFI_TEST=m
> +CONFIG_JUMP_LABEL=y
>  CONFIG_MODULES=y
>  CONFIG_MODULE_FORCE_LOAD=y
>  CONFIG_MODULE_UNLOAD=y
> diff --git a/arch/loongarch/include/asm/jump_label.h b/arch/loongarch/include/asm/jump_label.h
> new file mode 100644
> index 000000000000..453a0cd3ddf0
> --- /dev/null
> +++ b/arch/loongarch/include/asm/jump_label.h
> @@ -0,0 +1,52 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2023 Loongson Technology Corporation Limited
> + *
> + * Based on arch/arm64/include/asm/jump_label.h
> + */
> +#ifndef __ASM_JUMP_LABEL_H
> +#define __ASM_JUMP_LABEL_H
> +
> +#ifndef __ASSEMBLY__
> +
> +#include <linux/types.h>
> +#include <asm/inst.h>
> +
> +#define JUMP_LABEL_NOP_SIZE		LOONGARCH_INSN_SIZE
> +
> +static __always_inline bool arch_static_branch(struct static_key * const key,
> +					       const bool branch)
> +{
> +	asm_volatile_goto(
> +		"1:	nop					\n\t"
> +		 "	.pushsection	__jump_table, \"aw\"	\n\t"
> +		 "	.align		3			\n\t"
> +		 "	.long		1b - ., %l[l_yes] - .	\n\t"
> +		 "	.quad		%0 - .			\n\t"
> +		 "	.popsection				\n\t"
> +		 :  :  "i"(&((char *)key)[branch]) :  : l_yes);
> +
> +	return false;
> +l_yes:
> +	return true;
> +}
> +
> +static __always_inline bool arch_static_branch_jump(struct static_key * const key,
> +						    const bool branch)
> +{
> +	asm_volatile_goto(
> +		"1:	b		%l[l_yes]		\n\t"
> +		 "	.pushsection	__jump_table, \"aw\"	\n\t"
> +		 "	.align		3			\n\t"
> +		 "	.long		1b - ., %l[l_yes] - .	\n\t"
> +		 "	.quad		%0 - .			\n\t"
> +		 "	.popsection				\n\t"
> +		 :  :  "i"(&((char *)key)[branch]) :  : l_yes);
> +
> +	return false;
> +l_yes:
> +	return true;
> +}
> +
> +#endif  /* __ASSEMBLY__ */
> +#endif	/* __ASM_JUMP_LABEL_H */
> diff --git a/arch/loongarch/kernel/Makefile b/arch/loongarch/kernel/Makefile
> index 9a72d91cd104..64ea76f60e2c 100644
> --- a/arch/loongarch/kernel/Makefile
> +++ b/arch/loongarch/kernel/Makefile
> @@ -54,4 +54,6 @@ obj-$(CONFIG_HAVE_HW_BREAKPOINT)	+= hw_breakpoint.o
>
>  obj-$(CONFIG_KPROBES)		+= kprobes.o kprobes_trampoline.o
>
> +obj-$(CONFIG_JUMP_LABEL)	+= jump_label.o
> +
>  CPPFLAGS_vmlinux.lds		:= $(KBUILD_CFLAGS)
> diff --git a/arch/loongarch/kernel/jump_label.c b/arch/loongarch/kernel/jump_label.c
> new file mode 100644
> index 000000000000..c3ebaa4cf1e5
> --- /dev/null
> +++ b/arch/loongarch/kernel/jump_label.c
> @@ -0,0 +1,23 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2023 Loongson Technology Corporation Limited
> + *
> + * Based on arch/arm64/include/asm/jump_label.h
Sorry, this should be changed to,
Based on arch/arm64/kernel/jump_label.c

> + */
> +#include <linux/jump_label.h>
> +#include <linux/kernel.h>
> +#include <asm/inst.h>
> +
> +void arch_jump_label_transform(struct jump_entry *entry,
> +			       enum jump_label_type type)
> +{
> +	void *addr = (void *)jump_entry_code(entry);
> +	u32 insn;
> +
> +	if (type == JUMP_LABEL_JMP)
> +		insn = larch_insn_gen_b(jump_entry_code(entry), jump_entry_target(entry));
> +	else
> +		insn = larch_insn_gen_nop();
> +
> +	larch_insn_patch_text(addr, insn);
> +}
>

