Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E38DB7495
	for <loongarch@lists.linux.dev>; Tue, 13 Jun 2023 08:04:30 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxOuoHI4hkyYMEAA--.9804S3;
	Tue, 13 Jun 2023 16:04:23 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxVeQFI4hkN60YAA--.5284S3;
	Tue, 13 Jun 2023 16:04:22 +0800 (CST)
Subject: Re: [PATCH v3] LoongArch/rethook: Replace kretprobe with rethook on
 LoongArch
To: Haoran Jiang <jianghaoran@kylinos.cn>
References: <20230613011439.59168-1-jianghaoran@kylinos.cn>
 <20230613060329.356201-1-jianghaoran@kylinos.cn>
Cc: chenhuacai@kernel.org, conor.dooley@microchip.com, hejinyang@loongson.cn,
 jhrhhao@163.com, kernel@xen0n.name, l3b2w1@gmail.com,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 masahiroy@kernel.org, mhiramat@kernel.org, palmer@rivosinc.com,
 tangyouling@loongson.cn, zhangqing@loongson.cn
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <8ffd58dd-2e0c-0078-5e3f-a1139f05720b@loongson.cn>
Date: Tue, 13 Jun 2023 16:04:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20230613060329.356201-1-jianghaoran@kylinos.cn>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8DxVeQFI4hkN60YAA--.5284S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxur1rArW8tr45uF1rCF4rJFc_yoW5CFWxpF
	9rArn5Cr4Uur1qvryDAw1rZF40vrn3ua17WF1DG34fCF90qrZ8JryxXrWqvFWrKwnYvr4F
	qF4FqryqyFZrJ3cCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
	ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zw
	Z7UUUUU==



On 06/13/2023 02:03 PM, Haoran Jiang wrote:
> That's an adaptation of commit f3a112c0c40d ("x86,rethook,kprobes:
> Replace kretprobe with rethook on x86")and commit b57c2f124098
> ("riscv: add riscv rethook implementation") to LoongArch.
> Mainly refer to this commit
> b57c2f124098 ("riscv: add riscv rethook implementation").
>
> Replaces the kretprobe code with rethook on LoongArch. With this patch,
> kretprobe on LoongArch uses the rethook instead of kretprobe specific
> trampoline code.

Maybe Huacai can refine the commit message.

>
> Signed-off-by: Haoran Jiang <jianghaoran@kylinos.cn>

...

> diff --git a/arch/loongarch/kernel/kprobes.c b/arch/loongarch/kernel/kprobes.c
> index 56c8c4b09a42..dbce23ba9970 100644
> --- a/arch/loongarch/kernel/kprobes.c
> +++ b/arch/loongarch/kernel/kprobes.c
> @@ -378,26 +378,6 @@ int __init arch_init_kprobes(void)
>  	return 0;
>  }
>
> -/* ASM function that handles the kretprobes must not be probed */
> -NOKPROBE_SYMBOL(__kretprobe_trampoline);
> -
> -/* Called from __kretprobe_trampoline */
> -void __used *trampoline_probe_handler(struct pt_regs *regs)
> -{
> -	return (void *)kretprobe_trampoline_handler(regs, NULL);
> -}
> -NOKPROBE_SYMBOL(trampoline_probe_handler);
> -
> -void arch_prepare_kretprobe(struct kretprobe_instance *ri,
> -			    struct pt_regs *regs)
> -{
> -	ri->ret_addr = (kprobe_opcode_t *)regs->regs[1];
> -	ri->fp = NULL;
> -
> -	/* Replace the return addr with trampoline addr */
> -	regs->regs[1] = (unsigned long)&__kretprobe_trampoline;
> -}
> -NOKPROBE_SYMBOL(arch_prepare_kretprobe);
>

Please remove the blank line.

>  int arch_trampoline_kprobe(struct kprobe *p)
>  {
> diff --git a/arch/loongarch/kernel/rethook.c b/arch/loongarch/kernel/rethook.c
> new file mode 100644
> index 000000000000..b5e7f62f7dea
> --- /dev/null
> +++ b/arch/loongarch/kernel/rethook.c
> @@ -0,0 +1,27 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Generic return hook for LoongArch.
> + */
> +
> +#include <linux/kprobes.h>
> +#include <linux/rethook.h>
> +#include "rethook.h"
> +
> +/* This is called from arch_rethook_trampoline() */
> +unsigned long __used arch_rethook_trampoline_callback(struct pt_regs *regs)
> +{
> +	return rethook_trampoline_handler(regs, 0);
> +}
> +

Ditto

> +NOKPROBE_SYMBOL(arch_rethook_trampoline_callback);
> +
> +void arch_rethook_prepare(struct rethook_node *rhn, struct pt_regs *regs, bool mcount)
> +{
> +	rhn->ret_addr = regs->regs[1];
> +	rhn->frame = 0;
> +
> +	/* replace return addr with trampoline */
> +	regs->regs[1] = (unsigned long)arch_rethook_trampoline;
> +}
> +

Ditto

> +NOKPROBE_SYMBOL(arch_rethook_prepare);

Like s390 and x86, please add:

/* assembler function that handles the rethook must not be probed itself */
NOKPROBE_SYMBOL(arch_rethook_trampoline);

> diff --git a/arch/loongarch/kernel/rethook.h b/arch/loongarch/kernel/rethook.h

...

> -SYM_CODE_END(__kretprobe_trampoline)
> +SYM_CODE_END(arch_rethook_trampoline)

Thanks,
Tiezhu

