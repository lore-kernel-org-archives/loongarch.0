Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F755111F
	for <loongarch@lists.linux.dev>; Mon, 17 Apr 2023 02:04:06 +0000 (UTC)
Received: from loongson.cn (unknown [192.168.200.1])
	by gateway (Coremail) with SMTP id _____8Cxf80UqTxkarkdAA--.46119S3;
	Mon, 17 Apr 2023 10:04:04 +0800 (CST)
Received: from [0.0.0.0] (unknown [192.168.200.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxC74SqTxkFD4qAA--.49428S3;
	Mon, 17 Apr 2023 10:04:03 +0800 (CST)
Subject: Re: [PATCH v2 4/4] LoongArch: Add uprobes support
To: Tiezhu Yang <yangtiezhu@loongson.cn>
References: <1681464781-4428-1-git-send-email-yangtiezhu@loongson.cn>
 <1681464781-4428-5-git-send-email-yangtiezhu@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 loongson-kernel@lists.loongnix.cn
From: Youling Tang <tangyouling@loongson.cn>
Message-ID: <26d4d13f-d678-be54-6b40-b87c71856eff@loongson.cn>
Date: Mon, 17 Apr 2023 10:04:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <1681464781-4428-5-git-send-email-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8DxC74SqTxkFD4qAA--.49428S3
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7tF4kCr4UKw4rKrWUKw17KFg_yoW8Ar48pa
	yDCFy8GFs7GFn5AFyUJayv9F1Iqr9Y9a1xK3sFkayrCF4avws5Wrykury7XayUA390qrW0
	gFy8tanYvFZ0vF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bYAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
	AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF
	7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x
	0267AKxVW8JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE
	44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26rWlOx8S6xCaFVCjc4
	AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vI
	r41l42xK82IY6x8ErcxFaVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
	AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCI
	c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267
	AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_
	Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvj4RC_MaUU
	UUU

Hi, Tiezhu

On 04/14/2023 05:33 PM, Tiezhu Yang wrote:

/* snip */

> diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
> index de8ebe2..cfc2e0c 100644
> --- a/arch/loongarch/kernel/traps.c
> +++ b/arch/loongarch/kernel/traps.c
> @@ -45,6 +45,7 @@
>  #include <asm/tlb.h>
>  #include <asm/types.h>
>  #include <asm/unwind.h>
> +#include <asm/uprobes.h>
>
>  #include "access-helper.h"
>
> @@ -440,7 +441,6 @@ asmlinkage void noinstr do_bp(struct pt_regs *regs)
>  	if (regs->csr_prmd & CSR_PRMD_PIE)
>  		local_irq_enable();
>
> -	current->thread.trap_nr = read_csr_excode();
>  	if (__get_inst(&opcode, (u32 *)era, user))
>  		goto out_sigsegv;
>
> @@ -462,18 +462,17 @@ asmlinkage void noinstr do_bp(struct pt_regs *regs)
>  		else
>  			break;
>  	case BRK_UPROBE_BP:
> -		if (notify_die(DIE_UPROBE, "Uprobe", regs, bcode,
> -			       current->thread.trap_nr, SIGTRAP) == NOTIFY_STOP)
> +		if (uprobe_breakpoint_handler(regs))
>  			goto out;
>  		else
>  			break;
>  	case BRK_UPROBE_XOLBP:
> -		if (notify_die(DIE_UPROBE_XOL, "Uprobe_XOL", regs, bcode,
> -			       current->thread.trap_nr, SIGTRAP) == NOTIFY_STOP)
> +		if (uprobe_singlestep_handler(regs))

After the above modification, we should remove the DIE_UPROBE and
DIE_UPROBE_XOL definitions in arch/loongarch/include/asm/kdebug.h.

At the same time DIE_BREAK, DIE_SSTEPBP and DIE_PAGE_FAULT also need to
be removed after 6d4cc40fb5f581 ("LoongArch: Add kprobes support").

Thanks,
Youling
>  			goto out;
>  		else
>  			break;
>  	default:
> +		current->thread.trap_nr = read_csr_excode();
>  		if (notify_die(DIE_TRAP, "Break", regs, bcode,
>  			       current->thread.trap_nr, SIGTRAP) == NOTIFY_STOP)
>  			goto out;

