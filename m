Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E71597E2
	for <loongarch@lists.linux.dev>; Fri,  7 Apr 2023 02:30:35 +0000 (UTC)
Received: from loongson.cn (unknown [192.168.200.1])
	by gateway (Coremail) with SMTP id _____8BxEJVJgC9kIasXAA--.36765S3;
	Fri, 07 Apr 2023 10:30:34 +0800 (CST)
Received: from [0.0.0.0] (unknown [192.168.200.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Dxib1HgC9kU8UXAA--.21810S3;
	Fri, 07 Apr 2023 10:30:32 +0800 (CST)
Subject: Re: [RFC PATCH 2/3] LoongArch: Add larch_insn_gen_break() to generate
 break insn
To: Tiezhu Yang <yangtiezhu@loongson.cn>
References: <1680833701-1727-1-git-send-email-yangtiezhu@loongson.cn>
 <1680833701-1727-3-git-send-email-yangtiezhu@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 loongson-kernel@lists.loongnix.cn
From: Youling Tang <tangyouling@loongson.cn>
Message-ID: <0d309725-3b91-6902-de67-08bda48ccf57@loongson.cn>
Date: Fri, 7 Apr 2023 10:30:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <1680833701-1727-3-git-send-email-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8Dxib1HgC9kU8UXAA--.21810S3
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoWrZry8uw1UXr1xAFyDGrW3KFg_yoW8Jr4kpF
	nFyF1kXrs5WrykGr9rJw4DZr1Fqws5urWqga15C3yfCrW3XwsIqr92grZFyF90kw4qkay0
	qFnrWFW0v3WxAFDanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b2AFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
	AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF
	7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
	CjxVAFwI0_Cr1j6rxdM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc80
	4VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY2
	0_WwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG
	8wCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26rWl4I8I3I0E4IkC6x0Yz7v_Jr
	0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
	67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
	8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
	v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0zRByIUUUUUU=

/* snip */

> diff --git a/arch/loongarch/kernel/kprobes.c b/arch/loongarch/kernel/kprobes.c
> index 08c78d2..a5c3712 100644
> --- a/arch/loongarch/kernel/kprobes.c
> +++ b/arch/loongarch/kernel/kprobes.c
> @@ -4,19 +4,8 @@
>  #include <linux/preempt.h>
>  #include <asm/break.h>
>
> -static const union loongarch_instruction breakpoint_insn = {
> -	.reg0i15_format = {
> -		.opcode = break_op,
> -		.immediate = BRK_KPROBE_BP,
> -	}
> -};
> -
> -static const union loongarch_instruction singlestep_insn = {
> -	.reg0i15_format = {
> -		.opcode = break_op,
> -		.immediate = BRK_KPROBE_SSTEPBP,
> -	}
> -};
> +#define breakpoint_insn larch_insn_gen_break(BRK_KPROBE_BP)
> +#define singlestep_insn larch_insn_gen_break(BRK_KPROBE_SSTEPBP)

IMO, Defined as KPROBE_BP_INSN, KPROBE_SSTEPBP_INSN may be better.

Youling.
>
>  DEFINE_PER_CPU(struct kprobe *, current_kprobe);
>  DEFINE_PER_CPU(struct kprobe_ctlblk, kprobe_ctlblk);
> @@ -253,7 +242,7 @@ bool kprobe_breakpoint_handler(struct pt_regs *regs)
>  		}
>  	}
>
> -	if (addr->word != breakpoint_insn.word) {
> +	if (*addr != breakpoint_insn) {
>  		/*
>  		 * The breakpoint instruction was removed right
>  		 * after we hit it.  Another cpu has removed
>

