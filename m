Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DCB439F
	for <loongarch@lists.linux.dev>; Fri, 24 Nov 2023 02:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from loongson.cn (unknown [111.9.175.10])
	by gateway (Coremail) with SMTP id _____8CxLOu6C2BlLHY8AA--.48816S3;
	Fri, 24 Nov 2023 10:34:35 +0800 (CST)
Received: from [10.136.12.26] (unknown [111.9.175.10])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxE+S1C2BlKk1LAA--.37054S3;
	Fri, 24 Nov 2023 10:34:30 +0800 (CST)
Subject: Re: [PATCH] LoongArch: Check unwind_error() in show_backtrace()
To: Hengqi Chen <hengqi.chen@gmail.com>, loongarch@lists.linux.dev
Cc: chenhuacai@kernel.org, kernel@xen0n.name,
 Tiezhu Yang <yangtiezhu@loongson.cn>
References: <20231124014822.7894-1-hengqi.chen@gmail.com>
From: Jinyang He <hejinyang@loongson.cn>
Message-ID: <cdc62ae9-87f0-c9c8-a37a-d2fe24c224af@loongson.cn>
Date: Fri, 24 Nov 2023 10:34:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20231124014822.7894-1-hengqi.chen@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-CM-TRANSID:AQAAf8BxE+S1C2BlKk1LAA--.37054S3
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoWxGw1UAFyxKw13Gr1fXry7Jwc_yoW5ur15pr
	W5ZFs7CrWkJryDJwnrC34UZrWDXFn7uFsFgFs5J34fCF18Xr17JrnFyryUWr4YyrZ5Jasa
	qFWkArW5Kay2y3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_
	JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
	CYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
	xVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU2MKZDUUUU


On 2023-11-24 09:48, Hengqi Chen wrote:
> While tracking down the CPU stall issues ([0]), I saw
> that show_backtrace() stuck in an infinite loop ([1]):
>
>    [  153.610816] Call Trace:
>    [  153.610929] [<9000000002723eb8>] show_stack+0x5c/0x180
>    [  153.611252] [<90000000038e9954>] dump_stack_lvl+0x60/0x88
>    [  153.611349] [<90000000038cf8ec>] rcu_dump_cpu_stacks+0xf8/0x150
>    [  153.611452] [<90000000027dc5dc>] rcu_sched_clock_irq+0x69c/0xf10
>    [  153.611585] [<90000000027f0dfc>] update_process_times+0x6c/0xb4
>    [  153.611696] [<9000000002801fb8>] tick_nohz_highres_handler+0x54/0xe0
>    [  153.611808] [<90000000027f1898>] __hrtimer_run_queues+0x178/0x344
>    [  153.611909] [<90000000027f29dc>] hrtimer_interrupt+0x108/0x28c
>    [  153.612009] [<90000000027269c4>] constant_timer_interrupt+0x38/0x48
>    [  153.612113] [<90000000027b7824>] __handle_irq_event_percpu+0x68/0x24c
>    [  153.612223] [<90000000027b7a20>] handle_irq_event_percpu+0x18/0x6c
>    [  153.612327] [<90000000027bdae0>] handle_percpu_irq+0x54/0x88
>    [  153.612420] [<90000000027b6af8>] generic_handle_domain_irq+0x28/0x40
>    [  153.612524] [<9000000003085b0c>] handle_cpu_irq+0x6c/0xa8
>    [  153.612621] [<90000000038e9c28>] handle_loongarch_irq+0x30/0x48
>    [  153.612721] [<90000000038e9cc0>] do_vint+0x80/0xb4
>    [  153.612906] [<90000000038e9cc0>] do_vint+0x80/0xb4
>    [  153.612985] [<90000000038e9cc0>] do_vint+0x80/0xb4
>    [  153.613066] [<90000000038e9cc0>] do_vint+0x80/0xb4
>    [  153.613150] [<90000000038e9cc0>] do_vint+0x80/0xb4
>    ...
>
> This is because the unwinder does not stop immediately when
> it reaches non-kernel stackframe at which point it sets
> unwind_state::error.

Hi, Hengqi,


I think we can set `state->stack_info.type = STACK_TYPE_UNKNOWN` in 
next_frame() where set `state->error = true`.

Stack type change to unknown also indicate that the unwind should stop.

The patch way makes us need fix the other place where call unwind_XXX().

Seems commit 370a3b8f5874 ("LoongArch: Check unwind_error() in 
arch_stack_walk()") can be improved.


Thanks,

Jinyang


> Add the missing unwind_error() check
> to resolve the issue.
>
>    [0]: https://lore.kernel.org/loongarch/CAEyhmHT6UOryPZi7eEfw01Y_CjAqxy8NM6eKkdvdojJqB9P7eQ@mail.gmail.com/T/#u
>    [1]: https://github.com/chenhengqi/public/blob/main/verifier_movsx
>
> Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
> ---
>   arch/loongarch/kernel/traps.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
> index aebfc3733a76..63bf24295e3d 100644
> --- a/arch/loongarch/kernel/traps.c
> +++ b/arch/loongarch/kernel/traps.c
> @@ -65,7 +65,8 @@ static void show_backtrace(struct task_struct *task, const struct pt_regs *regs,
>   
>   	printk("%sCall Trace:", loglvl);
>   	for (unwind_start(&state, task, pregs);
> -	      !unwind_done(&state); unwind_next_frame(&state)) {
> +	    !unwind_done(&state) && !unwind_error(&state);
> +	     unwind_next_frame(&state)) {
>   		addr = unwind_get_return_address(&state);
>   		print_ip_sym(loglvl, addr);
>   	}

