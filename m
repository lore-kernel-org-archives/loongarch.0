Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A867F
	for <loongarch@lists.linux.dev>; Mon,  1 Aug 2022 15:31:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC721C433D7
	for <loongarch@lists.linux.dev>; Mon,  1 Aug 2022 15:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659367903;
	bh=aklGnDNOtlMe5c7cG6k7R15eB9as0Owo2oWNBYYr90I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jH+X/aKmUanHxiztvjB1cJw7wLM43PoEawebJUeNdeKRj/wnOamV2Pwo1hhpZhx5t
	 lH7kSTwHGVx0Km2HI3t2RNYko7Q2rLlelFS6KfNPq4ti1jV1b3mFfPx7FhjkpmhfFd
	 vVOP1AhKy59MXNU9e87tiRUD2hu8g5fuoUR7BdzCjv0ZdM7BMtVWKEVT+KYLoBht7S
	 ytIMTcwFdp3uOXNGMUka7SnLSzPAb3z5E/SNDCGGRtm9c68dT0c2S5ow1sknoFGR/2
	 zefGT/PhpDF8lmIDVrdyrSNC+UsMvrQynSQuK88SNiNK2Iyex2oKCqgw17vdGLfy0V
	 tSuVHHRvHnSHQ==
Received: by mail-ua1-f42.google.com with SMTP id t21so4714882uaq.3
        for <loongarch@lists.linux.dev>; Mon, 01 Aug 2022 08:31:43 -0700 (PDT)
X-Gm-Message-State: ACgBeo20MMpg8LIqEUUp0N4hcj6+yUkBAx/kbRwCBHujBFuTb8PjcmWL
	OqoK++zYlSd6P1T0EtrzmRzCaxK3MT7dDy+1VdE=
X-Google-Smtp-Source: AA6agR6ZSi49f7Dbvw1WdPAr4rK0mQspB7bEBrz460ZjbJKxu9WMsgXat3RKLkDpBHZJbT2egAHLKN8C2k2lbaZZ88k=
X-Received: by 2002:ab0:2359:0:b0:387:2dff:87d5 with SMTP id
 h25-20020ab02359000000b003872dff87d5mr6455801uao.104.1659367902719; Mon, 01
 Aug 2022 08:31:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220801121726.9681-1-zhangqing@loongson.cn> <20220801121726.9681-5-zhangqing@loongson.cn>
In-Reply-To: <20220801121726.9681-5-zhangqing@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 1 Aug 2022 23:31:30 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4qSbaS3=JJXk4fLMnVp2L_ZbFkrddzad0J3ewZDuGMMg@mail.gmail.com>
Message-ID: <CAAhV-H4qSbaS3=JJXk4fLMnVp2L_ZbFkrddzad0J3ewZDuGMMg@mail.gmail.com>
Subject: Re: [PATCH 4/4] LoongArch: Add USER_STACKTRACE support
To: Qing Zhang <zhangqing@loongson.cn>
Cc: WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Jinyang He <hejinyang@loongson.cn>
Content-Type: text/plain; charset="UTF-8"

Hi, Qing,

On Mon, Aug 1, 2022 at 8:17 PM Qing Zhang <zhangqing@loongson.cn> wrote:
>
> To get the best output you can compile your userspace programs with
> frame pointers (at least glibc + the app you are tracing export "CC
> =gcc -fno-omit-frame-pointer".
>
> ...
>      echo 'p:malloc /usr/lib64/libc.so.6:0x0a4704 size=%r4:u64'
>                                                 > uprobe_events
>      echo 'p:free /usr/lib64/libc.so.6:0x0a4d50 ptr=%r4:x64'
>                                                >> uprobe_events
>      echo 'comm == "demo"' > ./events/uprobes/malloc/filter
>      echo 'comm == "demo"' > ./events/uprobes/free/filter
>      echo 1 > ./options/userstacktrace
>      echo 1 > ./options/sym-userobj
>  ...
>
> Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
> ---
>  arch/loongarch/Kconfig                  |  1 +
>  arch/loongarch/include/asm/stacktrace.h |  5 +++
>  arch/loongarch/kernel/stacktrace.c      | 42 +++++++++++++++++++++++++
>  3 files changed, 48 insertions(+)
>
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index 85d0fa3147cd..05906384d564 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -107,6 +107,7 @@ config LOONGARCH
>         select SWIOTLB
>         select TRACE_IRQFLAGS_SUPPORT
>         select USE_PERCPU_NUMA_NODE_ID
> +       select USER_STACKTRACE_SUPPORT
>         select ZONE_DMA32
>         select MMU_GATHER_MERGE_VMAS if MMU
>
> diff --git a/arch/loongarch/include/asm/stacktrace.h b/arch/loongarch/include/asm/stacktrace.h
> index 49cb89213aeb..77fdb8ad662d 100644
> --- a/arch/loongarch/include/asm/stacktrace.h
> +++ b/arch/loongarch/include/asm/stacktrace.h
> @@ -21,6 +21,11 @@ struct stack_info {
>         unsigned long begin, end, next_sp;
>  };
>
> +struct stack_frame {
> +       unsigned long   fp;
> +       unsigned long   ra;
> +};
> +
>  bool in_task_stack(unsigned long stack, struct task_struct *task,
>                         struct stack_info *info);
>  bool in_irq_stack(unsigned long stack, struct stack_info *info);
> diff --git a/arch/loongarch/kernel/stacktrace.c b/arch/loongarch/kernel/stacktrace.c
> index f4f4b8ad3917..344224c7cb0e 100644
> --- a/arch/loongarch/kernel/stacktrace.c
> +++ b/arch/loongarch/kernel/stacktrace.c
> @@ -6,6 +6,7 @@
>   */
>  #include <linux/sched.h>
>  #include <linux/stacktrace.h>
> +#include <linux/uaccess.h>
>
>  #include <asm/stacktrace.h>
>  #include <asm/unwind.h>
> @@ -35,3 +36,44 @@ void arch_stack_walk(stack_trace_consume_fn consume_entry, void *cookie,
>                         break;
>         }
>  }
> +
> +static int
> +copy_stack_frame(unsigned long fp, struct stack_frame *frame)
> +{
> +       int ret;
> +       unsigned long err;
> +       unsigned long __user *user_frame_tail;
> +
> +       user_frame_tail = (unsigned long *)(fp - sizeof(struct stack_frame));
> +       if (!access_ok(user_frame_tail, sizeof(*frame)))
> +               return 0;
> +
> +       ret = 1;
Maybe initializing it at its definition is better?

Huacai
> +       pagefault_disable();
> +       err = (__copy_from_user_inatomic(frame, user_frame_tail, sizeof(*frame)));
> +       if (err || (unsigned long)user_frame_tail >= frame->fp)
> +               ret = 0;
> +       pagefault_enable();
> +
> +       return ret;
> +}
> +
> +void arch_stack_walk_user(stack_trace_consume_fn consume_entry, void *cookie,
> +                         const struct pt_regs *regs)
> +{
> +       unsigned long fp = regs->regs[22];
> +
> +       while (fp && !((unsigned long)fp & 0xf)) {
> +               struct stack_frame frame;
> +
> +               frame.fp = 0;
> +               frame.ra = 0;
> +               if (!copy_stack_frame(fp, &frame))
> +                       break;
> +               if (!frame.ra)
> +                       break;
> +               if (!consume_entry(cookie, frame.ra))
> +                       break;
> +               fp = frame.fp;
> +       }
> +}
> --
> 2.20.1
>
>
