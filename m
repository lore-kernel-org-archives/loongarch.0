Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55A0B28EB
	for <loongarch@lists.linux.dev>; Fri, 17 Feb 2023 09:50:35 +0000 (UTC)
Received: from loongson.cn (unknown [192.168.200.1])
	by gateway (Coremail) with SMTP id _____8AxqtnjTe9jvLkBAA--.3917S3;
	Fri, 17 Feb 2023 17:50:27 +0800 (CST)
Received: from [0.0.0.0] (unknown [192.168.200.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxtOXiTe9jkjg1AA--.64968S3;
	Fri, 17 Feb 2023 17:50:26 +0800 (CST)
Subject: Re: [PATCH v4 2/3] LoongArch: Add ptrace single step support
To: Qing Zhang <zhangqing@loongson.cn>, WANG Xuerui <kernel@xen0n.name>
References: <20230217023745.20800-1-zhangqing@loongson.cn>
 <20230217023745.20800-3-zhangqing@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
From: Youling Tang <tangyouling@loongson.cn>
Message-ID: <f9d21b99-a9a4-1d5a-86cf-314cac461e16@loongson.cn>
Date: Fri, 17 Feb 2023 17:50:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20230217023745.20800-3-zhangqing@loongson.cn>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8BxtOXiTe9jkjg1AA--.64968S3
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoW3ZF4xJw13Ar1DAFW8AF18Krg_yoWDtw17pF
	9rAF1kGr48Kr1I9FnxX3W5Zr15tws7Ww42gFyak34SywnFqryrJr1vkryqvFnYyw4DGa4I
	gFnIgwsIgF4DJaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bOkFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
	AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF
	7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
	CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2
	zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0E
	wIxGrwCF04k20xvE74AGY7Cv6cx26rWl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1D
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8
	JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj4RC_
	MaUUUUU

Hi, Qing

On 02/17/2023 10:37 AM, Qing Zhang wrote:
> Use the generic ptrace_resume code for PTRACE_SYSCALL, PTRACE_CONT,
> PTRACE_KILL and PTRACE_SINGLESTEP. This implies defining
> arch_has_single_step in  and implementing the
> user_enable_single_step and user_disable_single_step functions.
>
> LongArch has no hardware single-step register. the hardware single-step
> function multiplex fetch instruction watchpoint(FWPS) and specifies that
> the next instruction must trigger the watch exception by setting the mask bit.
> Some scenarios use CSR.FWPS.Skip to ignore the next hit result, not to trigger
> the watchpoint exception, and proceed to the next instruction.
>
> Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
> ---
>  arch/loongarch/include/asm/inst.h      | 39 +++++++++++++++
>  arch/loongarch/include/asm/loongarch.h |  3 ++
>  arch/loongarch/include/asm/processor.h |  3 ++
>  arch/loongarch/include/asm/ptrace.h    |  2 +
>  arch/loongarch/kernel/hw_breakpoint.c  | 35 +++++++++++--
>  arch/loongarch/kernel/ptrace.c         | 68 ++++++++++++++++++++++++++
>  arch/loongarch/kernel/traps.c          | 34 +++++++++++--
>  7 files changed, 176 insertions(+), 8 deletions(-)
>
> diff --git a/arch/loongarch/include/asm/inst.h b/arch/loongarch/include/asm/inst.h
> index ba18ce8fbdf2..00c6f261d9a2 100644
> --- a/arch/loongarch/include/asm/inst.h
> +++ b/arch/loongarch/include/asm/inst.h
> @@ -368,6 +368,45 @@ static inline bool is_stack_alloc_ins(union loongarch_instruction *ip)
>  		is_imm12_negative(ip->reg2i12_format.immediate);
>  }
>
> +static inline bool branch_ins_target_pc(union loongarch_instruction *ip)
> +{
> +	switch (ip->reg0i26_format.opcode) {
> +	case b_op:
> +	case bl_op:
> +		if (ip->reg0i26_format.immediate_l == 0
> +		   && ip->reg0i26_format.immediate_h == 0)
> +			return false;
> +	}
> +
> +	switch (ip->reg1i21_format.opcode) {
> +	case beqz_op:
> +	case bnez_op:
> +	case bceqz_op:
> +		if (ip->reg1i21_format.immediate_l == 0
> +		   && ip->reg1i21_format.immediate_h == 0)
> +			return false;
> +	}
> +
> +	switch (ip->reg2i16_format.opcode) {
> +	case jirl_op:
> +		if (ip->reg2i16_format.rj == 0x1
> +		   && ip->reg2i16_format.rd == 0x1
LOONGARCH_GPR_RA can be used instead of 0x1.

> +		   && ip->reg2i16_format.immediate == 0)
> +			return false;
> +		break;
> +	case beq_op:
> +	case bne_op:
> +	case blt_op:
> +	case bge_op:
> +	case bltu_op:
> +	case bgeu_op:
> +		if (ip->reg2i16_format.immediate == 0)
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
>  void simu_pc(struct pt_regs *regs, union loongarch_instruction insn);
>  void simu_branch(struct pt_regs *regs, union loongarch_instruction insn);
>
> diff --git a/arch/loongarch/include/asm/loongarch.h b/arch/loongarch/include/asm/loongarch.h
> index e9aed583a064..65b7dcdea16d 100644
> --- a/arch/loongarch/include/asm/loongarch.h
> +++ b/arch/loongarch/include/asm/loongarch.h
> @@ -1055,6 +1055,9 @@ static __always_inline void iocsr_write64(u64 val, u32 reg)
>  #define LOONGARCH_CSR_DERA		0x501	/* debug era */
>  #define LOONGARCH_CSR_DESAVE		0x502	/* debug save */
>
> +#define CSR_FWPC_SKIP_SHIFT		16
> +#define CSR_FWPC_SKIP			(_ULCAST_(1) << CSR_FWPC_SKIP_SHIFT)
> +
>  /*
>   * CSR_ECFG IM
>   */
> diff --git a/arch/loongarch/include/asm/processor.h b/arch/loongarch/include/asm/processor.h
> index db060c5a976f..3ea0f1910c23 100644
> --- a/arch/loongarch/include/asm/processor.h
> +++ b/arch/loongarch/include/asm/processor.h
> @@ -131,6 +131,9 @@ struct thread_struct {
>  	struct perf_event	*hbp_break[LOONGARCH_MAX_BRP];
>  	struct perf_event	*hbp_watch[LOONGARCH_MAX_WRP];
>
> +	/* Used by ptrace single_step */
> +	unsigned long single_step;
> +
>  	/*
>  	 * FPU & vector registers, must be at last because
>  	 * they are conditionally copied at fork().
> diff --git a/arch/loongarch/include/asm/ptrace.h b/arch/loongarch/include/asm/ptrace.h
> index 58596c4f8a0f..66a0e6c480a3 100644
> --- a/arch/loongarch/include/asm/ptrace.h
> +++ b/arch/loongarch/include/asm/ptrace.h
> @@ -150,4 +150,6 @@ static inline void user_stack_pointer_set(struct pt_regs *regs,
>  	regs->regs[3] = val;
>  }
>
> +#define arch_has_single_step()		(1)
> +
>  #endif /* _ASM_PTRACE_H */
> diff --git a/arch/loongarch/kernel/hw_breakpoint.c b/arch/loongarch/kernel/hw_breakpoint.c
> index 6431cd319c32..75d3652fbe00 100644
> --- a/arch/loongarch/kernel/hw_breakpoint.c
> +++ b/arch/loongarch/kernel/hw_breakpoint.c
> @@ -153,6 +153,22 @@ static int hw_breakpoint_slot_setup(struct perf_event **slots, int max_slots,
>   */
>  void flush_ptrace_hw_breakpoint(struct task_struct *tsk)
>  {
> +	int i;
> +	struct thread_struct *t = &tsk->thread;
> +
> +	for (i = 0; i < LOONGARCH_MAX_BRP; i++) {
> +		if (t->hbp_break[i]) {
> +			unregister_hw_breakpoint(t->hbp_break[i]);
> +			t->hbp_break[i] = NULL;
> +		}
> +	}
> +
> +	for (i = 0; i < LOONGARCH_MAX_WRP; i++) {
> +		if (t->hbp_watch[i]) {
> +			unregister_hw_breakpoint(t->hbp_watch[i]);
> +			t->hbp_watch[i] = NULL;
> +		}
> +	}
>  }
>
>  void ptrace_hw_copy_thread(struct task_struct *tsk)
> @@ -498,11 +514,20 @@ arch_initcall(arch_hw_breakpoint_init);
>  void hw_breakpoint_thread_switch(struct task_struct *next)
>  {
>  	struct pt_regs *regs = task_pt_regs(next);
> -
> -	/* Update breakpoints */
> -	update_bp_registers(regs, 1, 0);
> -	/* Update watchpoints */
> -	update_bp_registers(regs, 1, 1);
> +	u64 addr, mask;
> +
> +	if (test_bit(TIF_SINGLESTEP, &task_thread_info(next)->flags)) {
> +		addr = read_wb_reg(CSR_CFG_ADDR, 0, 0);
> +		mask = read_wb_reg(CSR_CFG_MASK, 0, 0);
> +		if ((task_pt_regs(next)->csr_era & ~mask) == (addr & ~mask))
> +			csr_write32(CSR_FWPC_SKIP, LOONGARCH_CSR_FWPS);
> +		regs->csr_prmd |= CSR_PRMD_PWE;
> +	} else {
> +		/* Update breakpoints */
> +		update_bp_registers(regs, 1, 0);
> +		/* Update watchpoints */
> +		update_bp_registers(regs, 1, 1);
> +	}
>  }
>
>  void hw_breakpoint_pmu_read(struct perf_event *bp)
> diff --git a/arch/loongarch/kernel/ptrace.c b/arch/loongarch/kernel/ptrace.c
> index bee4194177fd..52a3ee4366f4 100644
> --- a/arch/loongarch/kernel/ptrace.c
> +++ b/arch/loongarch/kernel/ptrace.c
> @@ -20,6 +20,7 @@
>  #include <linux/context_tracking.h>
>  #include <linux/elf.h>
>  #include <linux/errno.h>
> +#include <linux/hw_breakpoint.h>
>  #include <linux/mm.h>
>  #include <linux/ptrace.h>
>  #include <linux/regset.h>
> @@ -30,6 +31,7 @@
>  #include <linux/stddef.h>
>  #include <linux/seccomp.h>
>  #include <linux/uaccess.h>
> +#include <linux/thread_info.h>
>
>  #include <asm/byteorder.h>
>  #include <asm/cpu.h>
> @@ -39,6 +41,7 @@
>  #include <asm/page.h>
>  #include <asm/pgtable.h>
>  #include <asm/processor.h>
> +#include <asm/ptrace.h>
>  #include <asm/reg.h>
>  #include <asm/syscall.h>
>
> @@ -541,3 +544,68 @@ long arch_ptrace(struct task_struct *child, long request,
>
>  	return ret;
>  }
> +
> +void ptrace_triggered(struct perf_event *bp,
> +		      struct perf_sample_data *data, struct pt_regs *regs)
> +{
> +	struct perf_event_attr attr;
> +
> +	attr = bp->attr;
> +	attr.disabled = true;
> +	modify_user_hw_breakpoint(bp, &attr);
> +}
> +
> +static int set_single_step(struct task_struct *tsk, unsigned long addr)
> +{
> +	struct thread_struct *thread = &tsk->thread;
> +	struct perf_event *bp;
> +	struct perf_event_attr attr;
> +	struct arch_hw_breakpoint *info;
> +
> +	bp = thread->hbp_break[0];
> +	if (!bp) {
> +		ptrace_breakpoint_init(&attr);
> +
> +		attr.bp_addr = addr;
> +		attr.bp_len = HW_BREAKPOINT_LEN_8;
> +		attr.bp_type = HW_BREAKPOINT_X;
> +
> +		bp = register_user_hw_breakpoint(&attr, ptrace_triggered,
> +						 NULL, tsk);
> +		if (IS_ERR(bp))
> +			return PTR_ERR(bp);
> +
> +		thread->hbp_break[0] = bp;
> +	} else {
> +		int err;
> +
> +		attr = bp->attr;
> +		attr.bp_addr = addr;
> +		/* reenable breakpoint */
> +		attr.disabled = false;
> +		err = modify_user_hw_breakpoint(bp, &attr);
> +		if (unlikely(err))
> +			return err;
> +
> +		csr_write64(attr.bp_addr, LOONGARCH_CSR_IB0ADDR);
> +	}
> +	info = counter_arch_bp(bp);
> +	info->mask = 0xffffffffffff;
If `mask` is only used for user space address mask, it should not be
fixed to 0xffffffffffff, the user space address size may have many
situations, which can be defined according to TASK_SIZE.

Use (TASK_SIZE - 1) instead.

> +
> +	return 0;
> +}
> +
> +/* ptrace API */
> +void user_enable_single_step(struct task_struct *task)
> +{
> +	struct thread_info *ti = task_thread_info(task);
> +
> +	set_single_step(task, task_pt_regs(task)->csr_era);
> +	task->thread.single_step = task_pt_regs(task)->csr_era;
> +	set_ti_thread_flag(ti, TIF_SINGLESTEP);
> +}
> +
> +void user_disable_single_step(struct task_struct *task)
> +{
> +	clear_tsk_thread_flag(task, TIF_SINGLESTEP);
> +}
> diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
> index 2b133079e0f3..a59275a43bd1 100644
> --- a/arch/loongarch/kernel/traps.c
> +++ b/arch/loongarch/kernel/traps.c
> @@ -511,9 +511,37 @@ asmlinkage void noinstr do_watch(struct pt_regs *regs)
>  #ifdef CONFIG_HAVE_HW_BREAKPOINT
>  	irqentry_state_t state = irqentry_enter(regs);
>
> -	breakpoint_handler(regs);
> -	watchpoint_handler(regs);
> -	force_sig(SIGTRAP);
> +	if (test_tsk_thread_flag(current, TIF_SINGLESTEP)) {
> +		int llbit = (csr_read32(LOONGARCH_CSR_LLBCTL) & 0x1);
> +		unsigned long pc = regs->csr_era;
> +		union loongarch_instruction *ip = (union loongarch_instruction *)pc;
> +
> +		if (llbit) {
> +		/*
> +		 * When the ll-sc combo is encountered, it is regarded as an single
> +		 * instruction. So don't clear llbit and reset CSR.FWPS.Skip until
> +		 * the llsc execution is completed.
> +		 */
Comments should be aligned with code, similar modifications in other
places.

> +			csr_write32(CSR_FWPC_SKIP, LOONGARCH_CSR_FWPS);
> +			csr_write32(CSR_LLBCTL_KLO, LOONGARCH_CSR_LLBCTL);
> +		} else if (pc == current->thread.single_step) {
> +		/*
> +		 * Maybe some hardware Bug caused that certain insns are occasionally
> +		 * not skipped when CSR.FWPS.Skip is set, such as fld.d/fst.d. So Singlestep
> +		 * needs to compare whether the csr_era is equal to the value of singlestep
> +		 * which last time set.
> +		 */
> +			if (branch_ins_target_pc(ip))
> +			/* Prevent rd == pc from causing single step to fail to stop */
IMO, that comment description is not accurate enough.

Youling.

> +				csr_write32(CSR_FWPC_SKIP, LOONGARCH_CSR_FWPS);
> +		} else {
> +			force_sig(SIGTRAP);
> +		}
> +	} else {
> +		breakpoint_handler(regs);
> +		watchpoint_handler(regs);
> +		force_sig(SIGTRAP);
> +	}
>
>  	irqentry_exit(regs, state);
>  #endif
>

