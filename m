Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F404820E8
	for <loongarch@lists.linux.dev>; Thu, 15 Dec 2022 05:24:50 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxDOugr5pj2L0FAA--.13105S3;
	Thu, 15 Dec 2022 13:24:48 +0800 (CST)
Received: from [10.130.0.63] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxX+Sfr5pj6iQAAA--.246S3;
	Thu, 15 Dec 2022 13:24:48 +0800 (CST)
Subject: Re: [PATCH 1/6] LoongArch: Get frame info in unwind_start when regs
 is not supported
To: Jinyang He <hejinyang@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>
References: <20221215040141.18610-1-hejinyang@loongson.cn>
 <20221215040141.18610-2-hejinyang@loongson.cn>
From: Qing Zhang <zhangqing@loongson.cn>
Message-ID: <d3c5aa06-0cc3-b1a4-18b9-858e8f1216de@loongson.cn>
Date: Thu, 15 Dec 2022 13:24:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20221215040141.18610-2-hejinyang@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8AxX+Sfr5pj6iQAAA--.246S3
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxZw1fCw43uF1UJF4DGF4xCrg_yoWrWryxpr
	ZrCrsxWF4YgF9FvFy7trn8Zr95Grn7uw12gFWqy34rCFnrXFyxCr9093s8ZFs0y34kGw40
	qFn0yrsrKa1DtaUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bI8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2
	IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487Mx
	AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
	Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwI
	xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8
	JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
	C2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7_MaUUUUU

Hi, Jinyang

On 2022/12/15 下午12:01, Jinyang He wrote:
> At unwind_start, it is better to try to get its frame info even we not
> support regs rather than get them outside. So that we can simply use
> unwind_{start, next_frame, done} outside.
> 
> Signed-off-by: Jinyang He <hejinyang@loongson.cn>
> ---
>   arch/loongarch/kernel/process.c         | 12 +++---------
>   arch/loongarch/kernel/unwind_guess.c    |  6 ++++++
>   arch/loongarch/kernel/unwind_prologue.c | 16 +++++++++++++---
>   3 files changed, 22 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/loongarch/kernel/process.c b/arch/loongarch/kernel/process.c
> index 502b8b950057..6ef45174ad35 100644
> --- a/arch/loongarch/kernel/process.c
> +++ b/arch/loongarch/kernel/process.c
> @@ -197,20 +197,14 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
>   
>   unsigned long __get_wchan(struct task_struct *task)
>   {
> -	unsigned long pc;
> +	unsigned long pc = 0;
>   	struct unwind_state state;
>   
>   	if (!try_get_task_stack(task))
>   		return 0;
>   
> -	unwind_start(&state, task, NULL);
> -	state.sp = thread_saved_fp(task);
> -	get_stack_info(state.sp, state.task, &state.stack_info);
> -	state.pc = thread_saved_ra(task);
> -#ifdef CONFIG_UNWINDER_PROLOGUE
> -	state.type = UNWINDER_PROLOGUE;
> -#endif
> -	for (; !unwind_done(&state); unwind_next_frame(&state)) {
> +	for (unwind_start(&state, task, NULL); !unwind_done(&state);
> +	     unwind_next_frame(&state)) {
>   		pc = unwind_get_return_address(&state);
>   		if (!pc)
>   			break;
> diff --git a/arch/loongarch/kernel/unwind_guess.c b/arch/loongarch/kernel/unwind_guess.c
> index e2d2e4f3001f..e03864511582 100644
> --- a/arch/loongarch/kernel/unwind_guess.c
> +++ b/arch/loongarch/kernel/unwind_guess.c
> @@ -26,6 +26,12 @@ void unwind_start(struct unwind_state *state, struct task_struct *task,
>   	if (regs) {
>   		state->sp = regs->regs[3];
>   		state->pc = regs->csr_era;
> +	} else if (task == current) {
> +		state->sp = (unsigned long)__builtin_frame_address(0);
> +		state->pc = (unsigned long)__builtin_return_address(0);
> +	} else {
> +		state->sp = thread_saved_fp(task);
> +		state->pc = thread_saved_ra(task);
>   
The case for tasks is already handled in stacktrace.c, which is reusable 
code:
void arch_stack_walk(stack_trace_consume_fn consume_entry, void *cookie,
		     struct task_struct *task, struct pt_regs *regs)
{
...

	if (task == current) {
		regs->regs[3] = (unsigned long)__builtin_frame_address(0);
		regs->csr_era = (unsigned long)__builtin_return_address(0);
	} else {
		regs->regs[3] = thread_saved_fp(task);
		regs->csr_era = thread_saved_ra(task);
	}
...
	for (unwind_start(&state, task, regs);
	      !unwind_done(&state); unwind_next_frame(&state)) {
		addr = unwind_get_return_address(&state);
...
}

>   
>   	state->task = task;
> diff --git a/arch/loongarch/kernel/unwind_prologue.c b/arch/loongarch/kernel/unwind_prologue.c
> index 0f8d1451ebb8..9d51ea37782e 100644
> --- a/arch/loongarch/kernel/unwind_prologue.c
> +++ b/arch/loongarch/kernel/unwind_prologue.c
> @@ -141,12 +141,22 @@ void unwind_start(struct unwind_state *state, struct task_struct *task,
>   		    struct pt_regs *regs)
>   {
>   	memset(state, 0, sizeof(*state));
> +	state->type = UNWINDER_PROLOGUE;
>   
> -	if (regs &&  __kernel_text_address(regs->csr_era)) {
> -		state->pc = regs->csr_era;
> +	if (regs) {
>   		state->sp = regs->regs[3];
> +		state->pc = regs->csr_era;
>   		state->ra = regs->regs[1];
> -		state->type = UNWINDER_PROLOGUE;
> +		if (!__kernel_text_address(state->pc))
> +			state->type = UNWINDER_GUESS;
> +	} else if (task == current) {
> +		state->sp = (unsigned long)__builtin_frame_address(0);
> +		state->pc = (unsigned long)__builtin_return_address(0);
> +		state->ra = 0;
> +	} else {
> +		state->sp = thread_saved_fp(task);
> +		state->pc = thread_saved_ra(task);
> +		state->ra = 0;
>   	}
>   
also...
>   	state->task = task;
> 
Thanks,
-Qing

