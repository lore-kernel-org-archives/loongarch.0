Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62EE1863
	for <loongarch@lists.linux.dev>; Fri,  3 Feb 2023 09:00:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86805C4339B
	for <loongarch@lists.linux.dev>; Fri,  3 Feb 2023 09:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675414856;
	bh=avk4N2a89jQv7e0ooxsBmJAbAtZiCU8GOuT9TlvNP9Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LxI6bgSuPltAUHn4UtV6KhJ9k0YNJsdljB9npoPsfhr3OOC+EasUlFlj+BDO5lAoT
	 xTXGXr0tbi1PKoOFwAGrbY0vwBACEPFBH8Qva1jUcFwpbnX4TbOxDhAC4ti3mptu7v
	 J9Ld9mHsJvplngw8fG5q1tG5suB9YcYKDLHHwFhpRmaNPYhkeU4Z2qzQ4efY5wz+Fw
	 7uEafK5YVM+Z0tzJhHOWakKoJ5hcv24/Pn45UwmQcKdJmwwghGLIHKUYdI5RegGnkU
	 90Lhyh2xoRL30Y5yAxVLTYQdkvMnn96pbclLmnHbM2P/H/oaeNk2/oZL8V67A5hOts
	 VtIv52mopIwVg==
Received: by mail-ej1-f44.google.com with SMTP id mc11so13406399ejb.10
        for <loongarch@lists.linux.dev>; Fri, 03 Feb 2023 01:00:56 -0800 (PST)
X-Gm-Message-State: AO0yUKWdiIuxqfR+ycyi7k+Ug7U1Objt5NNwnvAgwLXiA7zgldzlxo6B
	saLpJ7Mrn3cgpw8K3lvt5jT15dZnJ+glnbYvnvU=
X-Google-Smtp-Source: AK7set/3SdmQ07a0yiJMR3tYJFTZFyl0onlRD+uq6uk/P6Yi21hRYnQHvA6LoTkjDL4DZQd57bsStT7iSHGoM65vbbw=
X-Received: by 2002:a17:907:6087:b0:889:7bef:3a9d with SMTP id
 ht7-20020a170907608700b008897bef3a9dmr3060315ejc.150.1675414854779; Fri, 03
 Feb 2023 01:00:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1675414264-28241-1-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1675414264-28241-1-git-send-email-yangtiezhu@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 3 Feb 2023 17:00:44 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4tMC+y9enyvWj9hu0ngin6ND4DPKbcFybVzU=A-7tLSA@mail.gmail.com>
Message-ID: <CAAhV-H4tMC+y9enyvWj9hu0ngin6ND4DPKbcFybVzU=A-7tLSA@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Add kprobe on ftrace support
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: WANG Xuerui <kernel@xen0n.name>, Masami Hiramatsu <mhiramat@kernel.org>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi, Tiezhu,

On Fri, Feb 3, 2023 at 4:51 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>
> Add kprobe_ftrace_handler() and arch_prepare_kprobe_ftrace() to support
> kprobe on ftrace, the code is similar with x86 and riscv.
>
> Here is a simple example:
>
>   # echo 'p:myprobe kernel_clone' > /sys/kernel/debug/tracing/kprobe_events
>   # echo 'r:myretprobe kernel_clone $retval' >> /sys/kernel/debug/tracing/kprobe_events
>   # echo 1 > /sys/kernel/debug/tracing/events/kprobes/myprobe/enable
>   # echo 1 > /sys/kernel/debug/tracing/events/kprobes/myretprobe/enable
>   # echo 1 > /sys/kernel/debug/tracing/tracing_on
>   # cat /sys/kernel/debug/tracing/trace
>   # tracer: nop
>   #
>   # entries-in-buffer/entries-written: 2/2   #P:4
>   #
>   #                                _-----=> irqs-off/BH-disabled
>   #                               / _----=> need-resched
>   #                              | / _---=> hardirq/softirq
>   #                              || / _--=> preempt-depth
>   #                              ||| / _-=> migrate-disable
>   #                              |||| /     delay
>   #           TASK-PID     CPU#  |||||  TIMESTAMP  FUNCTION
>   #              | |         |   |||||     |         |
>               bash-488     [002] .....  2041.190681: myprobe: (kernel_clone+0x0/0x40c)
>               bash-488     [002] .....  2041.190788: myretprobe: (__do_sys_clone+0x84/0xb8 <- kernel_clone) arg1=0x200
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/loongarch/Kconfig             |  1 +
>  arch/loongarch/kernel/ftrace_dyn.c | 65 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 66 insertions(+)
>
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index 134a2f8..22a3e77 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -104,6 +104,7 @@ config LOONGARCH
>         select HAVE_IRQ_EXIT_ON_IRQ_STACK
>         select HAVE_IRQ_TIME_ACCOUNTING
>         select HAVE_KPROBES
> +       select HAVE_KPROBES_ON_FTRACE
>         select HAVE_KRETPROBES
>         select HAVE_MOD_ARCH_SPECIFIC
>         select HAVE_NMI
> diff --git a/arch/loongarch/kernel/ftrace_dyn.c b/arch/loongarch/kernel/ftrace_dyn.c
> index 0f07591..7b074c2 100644
> --- a/arch/loongarch/kernel/ftrace_dyn.c
> +++ b/arch/loongarch/kernel/ftrace_dyn.c
> @@ -6,6 +6,7 @@
>   */
>
>  #include <linux/ftrace.h>
> +#include <linux/kprobes.h>
>  #include <linux/uaccess.h>
>
>  #include <asm/inst.h>
> @@ -271,3 +272,67 @@ int ftrace_disable_ftrace_graph_caller(void)
>  }
>  #endif /* CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS */
>  #endif /* CONFIG_FUNCTION_GRAPH_TRACER */
> +
> +#ifdef CONFIG_KPROBES_ON_FTRACE
> +/* Ftrace callback handler for kprobes -- called under preepmt disabled */
> +void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
> +                          struct ftrace_ops *ops, struct ftrace_regs *fregs)
> +{
> +       struct kprobe *p;
> +       struct pt_regs *regs;
> +       struct kprobe_ctlblk *kcb;
> +       int bit;
> +
> +       bit = ftrace_test_recursion_trylock(ip, parent_ip);
> +       if (bit < 0)
> +               return;
> +
In the old version I see preempt_disable_notrace() here and
preempt_enable_notrace() at the end. And I prefer to add this one to
the kprobes series rather than a separate patch.

Huacai
> +       p = get_kprobe((kprobe_opcode_t *)ip);
> +       if (unlikely(!p) || kprobe_disabled(p))
> +               goto out;
> +
> +       regs = ftrace_get_regs(fregs);
> +       if (!regs)
> +               goto out;
> +
> +       kcb = get_kprobe_ctlblk();
> +       if (kprobe_running()) {
> +               kprobes_inc_nmissed_count(p);
> +       } else {
> +               unsigned long orig_ip = instruction_pointer(regs);
> +
> +               instruction_pointer_set(regs, ip);
> +
> +               __this_cpu_write(current_kprobe, p);
> +               kcb->kprobe_status = KPROBE_HIT_ACTIVE;
> +               if (!p->pre_handler || !p->pre_handler(p, regs)) {
> +                       /*
> +                        * Emulate singlestep (and also recover regs->csr_era)
> +                        * as if there is a nop
> +                        */
> +                       instruction_pointer_set(regs,
> +                               (unsigned long)p->addr + MCOUNT_INSN_SIZE);
> +                       if (unlikely(p->post_handler)) {
> +                               kcb->kprobe_status = KPROBE_HIT_SSDONE;
> +                               p->post_handler(p, regs, 0);
> +                       }
> +                       instruction_pointer_set(regs, orig_ip);
> +               }
> +
> +               /*
> +                * If pre_handler returns !0, it changes regs->csr_era. We have to
> +                * skip emulating post_handler.
> +                */
> +               __this_cpu_write(current_kprobe, NULL);
> +       }
> +out:
> +       ftrace_test_recursion_unlock(bit);
> +}
> +NOKPROBE_SYMBOL(kprobe_ftrace_handler);
> +
> +int arch_prepare_kprobe_ftrace(struct kprobe *p)
> +{
> +       p->ainsn.insn = NULL;
> +       return 0;
> +}
> +#endif /* CONFIG_KPROBES_ON_FTRACE */
> --
> 2.1.0
>
