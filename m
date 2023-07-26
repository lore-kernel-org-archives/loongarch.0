Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90E2F1108
	for <loongarch@lists.linux.dev>; Wed, 26 Jul 2023 02:59:11 +0000 (UTC)
Received: from loongson.cn (unknown [111.9.175.10])
	by gateway (Coremail) with SMTP id _____8Dx6er9i8BktgcKAA--.19487S3;
	Wed, 26 Jul 2023 10:59:09 +0800 (CST)
Received: from [10.136.12.26] (unknown [111.9.175.10])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Dx5sz6i8BkwEY7AA--.7565S3;
	Wed, 26 Jul 2023 10:59:07 +0800 (CST)
Subject: Re: [PATCH 2/4 v2] LoongArch: Get stack without NMI when providing
 regs parameter
To: Enze Li <lienze@kylinos.cn>, chenhuacai@kernel.org, kernel@xen0n.name,
 loongarch@lists.linux.dev, glider@google.com, elver@google.com,
 akpm@linux-foundation.org, kasan-dev@googlegroups.com, linux-mm@kvack.org
Cc: yangtiezhu@loongson.cn, dvyukov@google.com
References: <20230725061451.1231480-1-lienze@kylinos.cn>
 <20230725061451.1231480-3-lienze@kylinos.cn>
From: Jinyang He <hejinyang@loongson.cn>
Message-ID: <e325ac53-ba3f-db7a-ccc2-5cfadf6462b9@loongson.cn>
Date: Wed, 26 Jul 2023 10:59:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20230725061451.1231480-3-lienze@kylinos.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:AQAAf8Dx5sz6i8BkwEY7AA--.7565S3
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoWxZr45Wr1UGry5tF47Jw13GFX_yoWrCr1kpr
	Z7CFZ3G3yUZrWIyr17Jr1UXryYyF4vga1UuF1xCa4fGr43JryUt34jgFy5Xr1DCrW8A3yU
	Xry5tF1q9ws0yagCm3ZEXasCq-sJn29KB7ZKAUJUUUU3529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJwAaw2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_
	Jw1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
	CYjI0SjxkI62AI1cAE67vIY487MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48J
	MxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUcbAwUUUUU

On 2023-07-25 14:14, Enze Li wrote:

> Currently, arch_stack_walk() can only get the full stack information
> including NMI.  This is because the implementation of arch_stack_walk()
> is forced to ignore the information passed by the regs parameter and use
> the current stack information instead.
>
> For some detection systems like KFENCE, only partial stack information
> is needed.  In particular, the stack frame where the interrupt occurred.
>
> To support KFENCE, this patch modifies the implementation of the
> arch_stack_walk() function so that if this function is called with the
> regs argument passed, it retains all the stack information in regs and
> uses it to provide accurate information.
>
> Before the patch applied, I get,
> [    1.531195 ] ==================================================================
> [    1.531442 ] BUG: KFENCE: out-of-bounds read in stack_trace_save_regs+0x48/0x6c
> [    1.531442 ]
> [    1.531900 ] Out-of-bounds read at 0xffff800012267fff (1B left of kfence-#12):
> [    1.532046 ]  stack_trace_save_regs+0x48/0x6c
> [    1.532169 ]  kfence_report_error+0xa4/0x528
> [    1.532276 ]  kfence_handle_page_fault+0x124/0x270
> [    1.532388 ]  no_context+0x50/0x94
> [    1.532453 ]  do_page_fault+0x1a8/0x36c
> [    1.532524 ]  tlb_do_page_fault_0+0x118/0x1b4
> [    1.532623 ]  test_out_of_bounds_read+0xa0/0x1d8
> [    1.532745 ]  kunit_generic_run_threadfn_adapter+0x1c/0x28
> [    1.532854 ]  kthread+0x124/0x130
> [    1.532922 ]  ret_from_kernel_thread+0xc/0xa4
> <snip>
>
> With this patch applied, I get the correct stack information.
> [    1.320220 ] ==================================================================
> [    1.320401 ] BUG: KFENCE: out-of-bounds read in test_out_of_bounds_read+0xa8/0x1d8
> [    1.320401 ]
> [    1.320898 ] Out-of-bounds read at 0xffff800012257fff (1B left of kfence-#10):
> [    1.321134 ]  test_out_of_bounds_read+0xa8/0x1d8
> [    1.321264 ]  kunit_generic_run_threadfn_adapter+0x1c/0x28
> [    1.321392 ]  kthread+0x124/0x130
> [    1.321459 ]  ret_from_kernel_thread+0xc/0xa4
> <snip>
>
> Signed-off-by: Enze Li <lienze@kylinos.cn>
> ---
>   arch/loongarch/kernel/stacktrace.c | 20 ++++++++++++++------
>   1 file changed, 14 insertions(+), 6 deletions(-)
>
> diff --git a/arch/loongarch/kernel/stacktrace.c b/arch/loongarch/kernel/stacktrace.c
> index 2463d2fea21f..9dab30ae68ec 100644
> --- a/arch/loongarch/kernel/stacktrace.c
> +++ b/arch/loongarch/kernel/stacktrace.c
> @@ -18,16 +18,24 @@ void arch_stack_walk(stack_trace_consume_fn consume_entry, void *cookie,
>   	struct pt_regs dummyregs;
>   	struct unwind_state state;
>   
> -	regs = &dummyregs;
> -
>   	if (task == current) {
> -		regs->regs[3] = (unsigned long)__builtin_frame_address(0);
> -		regs->csr_era = (unsigned long)__builtin_return_address(0);
> +		if (regs)
> +			memcpy(&dummyregs, regs, sizeof(*regs));
> +		else {
> +			dummyregs.regs[3] = (unsigned long)__builtin_frame_address(0);
> +			dummyregs.csr_era = (unsigned long)__builtin_return_address(0);
> +		}
>   	} else {
> -		regs->regs[3] = thread_saved_fp(task);
> -		regs->csr_era = thread_saved_ra(task);
> +		if (regs)
> +			memcpy(&dummyregs, regs, sizeof(*regs));
> +		else {
> +			dummyregs.regs[3] = thread_saved_fp(task);
> +			dummyregs.csr_era = thread_saved_ra(task);
> +		}
>   	}
>   
> +	regs = &dummyregs;
> +

if (!regs) {
     regs = &dummyregs;

     if (task == current) {
         regs->regs[3] = (unsigned long)__builtin_frame_address(0);
         regs->csr_era = (unsigned long)__builtin_return_address(0);
     } else {
         regs->regs[3] = thread_saved_fp(task);
         regs->csr_era = thread_saved_ra(task);
     }
     regs->regs[1] = 0;
}

BTW, I remembered that __unwind_start() deals with this issue in regs,
task and current. arch_stack_walk() is unnecessary to provide current
or task regs if we fix the unwind_start() skip its parent frame
(caller is arch_stack_walk). But the current state is better, I think.


Thanks,

Jinyang

>   	regs->regs[1] = 0;
>   	for (unwind_start(&state, task, regs);
>   	     !unwind_done(&state) && !unwind_error(&state); unwind_next_frame(&state)) {

