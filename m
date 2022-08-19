Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B46E4697
	for <loongarch@lists.linux.dev>; Fri, 19 Aug 2022 17:24:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04697C433D6;
	Fri, 19 Aug 2022 17:24:56 +0000 (UTC)
Date: Fri, 19 Aug 2022 13:25:09 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Qing Zhang <zhangqing@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, hejinyang@loongson.cn
Subject: Re: [PATCH 1/9] LoongArch/ftrace: Add basic support
Message-ID: <20220819132509.127a1353@gandalf.local.home>
In-Reply-To: <20220819081403.7143-2-zhangqing@loongson.cn>
References: <20220819081403.7143-1-zhangqing@loongson.cn>
	<20220819081403.7143-2-zhangqing@loongson.cn>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 19 Aug 2022 16:13:55 +0800
Qing Zhang <zhangqing@loongson.cn> wrote:

> +#define MCOUNT_STACK_SIZE	(2 * SZREG)
> +#define MCOUNT_S0_OFFSET	(0)
> +#define MCOUNT_RA_OFFSET	(SZREG)
> +
> +	.macro MCOUNT_SAVE_REGS
> +	PTR_ADDI sp, sp, -MCOUNT_STACK_SIZE
> +	PTR_S	s0, sp, MCOUNT_S0_OFFSET
> +	PTR_S	ra, sp, MCOUNT_RA_OFFSET
> +	move	s0, a0
> +	.endm
> +
> +	.macro MCOUNT_RESTORE_REGS
> +	move	a0, s0
> +	PTR_L	ra, sp, MCOUNT_RA_OFFSET
> +	PTR_L	s0, sp, MCOUNT_S0_OFFSET
> +	PTR_ADDI sp, sp, MCOUNT_STACK_SIZE
> +	.endm
> +
> +
> +SYM_FUNC_START(_mcount)
> +	la	t1, ftrace_stub
> +	la	t2, ftrace_trace_function	/* Prepare t2 for (1) */
> +	PTR_L	t2, t2, 0
> +	beq	t1, t2, fgraph_trace
> +
> +	MCOUNT_SAVE_REGS
> +
> +	move	a0, ra				/* arg0: self return address */
> +	move	a1, s0				/* arg1: parent's return address */
> +	jirl	ra, t2, 0			/* (1) call *ftrace_trace_function */
> +
> +	MCOUNT_RESTORE_REGS

You know, if you can implement CONFIG_FTRACE_WITH_ARGS, where the default
function callback gets a ftrace_regs pointer (that only holds what is
needed for the arguments of the function as well as the stack pointer),
then you could also implement function graph on top of that, and remove the
need for the below "fgraph_trace" trampoline.

I'd really would like all architectures to go that way. Also, the
CONFIG_FTRACE_WITH_ARGS is all you need for live kernel patching.

-- Steve


> +
> +fgraph_trace:
> +#ifdef	CONFIG_FUNCTION_GRAPH_TRACER
> +	la	t1, ftrace_stub
> +	la	t3, ftrace_graph_return
> +	PTR_L	t3, t3, 0
> +	bne	t1, t3, ftrace_graph_caller
> +	la	t1, ftrace_graph_entry_stub
> +	la	t3, ftrace_graph_entry
> +	PTR_L	t3, t3, 0
> +	bne	t1, t3, ftrace_graph_caller
> +#endif
> +
> +	.globl ftrace_stub
> +ftrace_stub:
> +	jirl	zero, ra, 0
> +SYM_FUNC_END(_mcount)
> +EXPORT_SYMBOL(_mcount)
> +
> +#ifdef CONFIG_FUNCTION_GRAPH_TRACER
> +SYM_FUNC_START(ftrace_graph_caller)
> +	MCOUNT_SAVE_REGS
> +
> +	PTR_ADDI	a0, ra, -4			/* arg0: Callsite self return addr */
> +	PTR_ADDI	a1, sp, MCOUNT_STACK_SIZE	/* arg1: Callsite sp */
> +	move	a2, s0					/* arg2: Callsite parent ra */
> +	bl	prepare_ftrace_return
> +
> +	MCOUNT_RESTORE_REGS
> +	jirl	zero, ra, 0
> +SYM_FUNC_END(ftrace_graph_caller)
