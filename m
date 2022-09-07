Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F445C91
	for <loongarch@lists.linux.dev>; Wed,  7 Sep 2022 14:01:06 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id t70so7856924pgc.5
        for <loongarch@lists.linux.dev>; Wed, 07 Sep 2022 07:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=0QqI1eS1GH+f33AOXjhFrIuSdAou37LhIWffzyjHK2I=;
        b=O9IeFBSi8ZBU1osJ++JFi48Gq6gZHmFZDOLdcPAynpNMnEVoS9bSPCvcCjSMhJSRHP
         GrG+v6yMn/7u7EIohXQrpPbU1tZiKeCTCrVGCdMyM5/VeFLxvzMAZVnB9yAKzl7FnPHC
         /n8mcM/yVXZD42/S+KsmN3+ZBciLBR0ixgzfVwRSq38cnqUwZqLGgEsGJK8W9Ui1tHVr
         pJmkELpPaBMvx2HU2QcbmCasttq6Pa3mq8mz6dQPV94Y65EMMhnexjUFDHkOxcGXio51
         Fy9KvQwYhzpHi/CSA5c2SdkA21xVCGid2BgK6MJyQ7aVor9l3w9FItJXYLLbadUbLSns
         8Ewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=0QqI1eS1GH+f33AOXjhFrIuSdAou37LhIWffzyjHK2I=;
        b=LYRywVXSe+AAAOHdYJ1ncC9P98x59nMacHv+mogQIZMy9QgHIkuUcxB80QMT4kMKxd
         x3QTFqMPn4Uj6EVnA0yaYnu7tmxAb9cVkWUXxrohvbuj4uUwE6XpY5FyeRrbRSbGfwDP
         ckxlaNKQLHwIt1ougIxNVIQQUlSI/kAOmrbc4S0fsNqkvUd8Rzwwn1dUe4Mw227pry3d
         E6X5JQepOCFMg9uQkZ7A/Uw9CXGWJRokQi3hNWqFO7FDT5qLvUodS+6kaELnzh4adfZ/
         gaEOPAA7EypbidHDXYGjGRncOJiCdrjBHeDHDlZklBJDQYDjaKzc2Is2jUY1Pob3T8j4
         s1hA==
X-Gm-Message-State: ACgBeo3vFj9SlLZzzxrUVeQMMLQrXGxQH6AAlnZo9apXkFVZ6GBuurGD
	abiElHS666JwyPeiVJfDdJufaZceZJn/wY6FXpU=
X-Google-Smtp-Source: AA6agR6p8DeuoDcwpQ36L3QqW7W+vu15NoHAPvewZ/zbjehdTmZBjOsA8LpWoTYOMlxNIxRx56eLkNANkOLxHBuSxzU=
X-Received: by 2002:a63:5345:0:b0:42b:ce4e:760c with SMTP id
 t5-20020a635345000000b0042bce4e760cmr3317381pgl.505.1662559266327; Wed, 07
 Sep 2022 07:01:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220907100626.32657-1-zhangqing@loongson.cn>
In-Reply-To: <20220907100626.32657-1-zhangqing@loongson.cn>
From: Jeff Xie <xiehuan09@gmail.com>
Date: Wed, 7 Sep 2022 22:00:54 +0800
Message-ID: <CAEr6+EBHrShLC9oWb0kVpy44gcHoQ-bnLoEN-bA0WR2VN0CLuw@mail.gmail.com>
Subject: Re: [PATCH v3 10/10] LoongArch/ftrace: Fix unwind state when option func_stack_trace
To: Qing Zhang <zhangqing@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Ingo Molnar <mingo@redhat.com>, WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	hejinyang@loongson.cn
Content-Type: text/plain; charset="UTF-8"

Hi Qing,

On Wed, Sep 7, 2022 at 7:56 PM Qing Zhang <zhangqing@loongson.cn> wrote:
>
> Ftrace plays like function head exception, prologue analysis will stop soon
> because PC is at entry.
>
>    90000000004c5a54 <callee>:
>    90000000004c5a54:    03400000  andi   $zero, $zero, 0x0   ==>move  t0, ra
>    90000000004c5a58:    03400000  andi   $zero, $zero, 0x0   ==>bl callsite
> ==>90000000004c5a5c:    02fcc063  addi.d $sp, $sp, -208(0xf30)
>    ...
>
> When encountering ftrace_call, save trace function ra at PT_ERA, save parent ra
> at PT_R1, At this time, pc is the position after the two nops of callee. There is
> no conventional prologue operation between this position and the function entry,
> so we need to resetthe first flag to make the caller continue to unwind.
>
> testing method:
>   echo path_openat > ./set_ftrace_filter
>   echo 1 > ./options/func_stack_trace
>   echo function > ./current_tracer
>
> Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
> ---
>  arch/loongarch/include/asm/unwind.h     |  2 +-
>  arch/loongarch/kernel/unwind_prologue.c | 33 +++++++++++++++++++++----
>  2 files changed, 29 insertions(+), 6 deletions(-)
>
> diff --git a/arch/loongarch/include/asm/unwind.h b/arch/loongarch/include/asm/unwind.h
> index f66b07c3e6a1..f2b52b9ea93d 100644
> --- a/arch/loongarch/include/asm/unwind.h
> +++ b/arch/loongarch/include/asm/unwind.h
> @@ -20,7 +20,7 @@ struct unwind_state {
>         char type; /* UNWINDER_XXX */
>         struct stack_info stack_info;
>         struct task_struct *task;
> -       bool first, error;
> +       bool first, error, is_ftrace;
>         int graph_idx;
>         unsigned long sp, pc, ra;
>  };
> diff --git a/arch/loongarch/kernel/unwind_prologue.c b/arch/loongarch/kernel/unwind_prologue.c
> index 03f8b31a90cc..0bb19d3ae8ba 100644
> --- a/arch/loongarch/kernel/unwind_prologue.c
> +++ b/arch/loongarch/kernel/unwind_prologue.c
> @@ -14,9 +14,7 @@ unsigned long unwind_get_return_address(struct unwind_state *state)
>
>         if (unwind_done(state))
>                 return 0;
> -       else if (state->type)
> -               return state->pc;
> -       else if (state->first)
> +       else if (state->type || state->first)
>                 return state->pc;
>
>         return *(unsigned long *)(state->sp);
> @@ -42,16 +40,39 @@ static bool unwind_by_guess(struct unwind_state *state)
>         return false;
>  }
>
> +static void unwind_state_fixup(struct unwind_state *state)
> +{
> +       static unsigned long ftrace_case = (unsigned long)ftrace_call + 4;
> +
> +       if (state->pc == ftrace_case)
> +               state->is_ftrace = true;
> +}
> +
>  static bool unwind_by_prologue(struct unwind_state *state)
>  {
>         struct stack_info *info = &state->stack_info;
>         union loongarch_instruction *ip, *ip_end;
>         unsigned long frame_size = 0, frame_ra = -1;
>         unsigned long size, offset, pc = state->pc;
> +       struct pt_regs *regs;
>
>         if (state->sp >= info->end || state->sp < info->begin)
>                 return false;
>
> +       if (state->is_ftrace) {
> +               /*
> +                * As we meet ftrace_regs_entry, reset first flag like first doing
> +                * tracing, Prologue analysis will stop soon because PC is at entry.
> +                */
> +               regs = (struct pt_regs *)state->sp;
> +               state->pc = regs->csr_era;
> +               state->ra = regs->regs[1];
> +               state->sp = regs->regs[3];
> +               state->first = true;
> +               state->is_ftrace = false;
> +               return true;
> +       }
> +
>         if (!kallsyms_lookup_size_offset(pc, &size, &offset))
>                 return false;
>
> @@ -97,7 +118,7 @@ static bool unwind_by_prologue(struct unwind_state *state)
>
>         state->pc = *(unsigned long *)(state->sp + frame_ra);
>         state->sp = state->sp + frame_size;
> -       return !!__kernel_text_address(state->pc);
> +       goto out;
>
>  first:
>         state->first = false;
> @@ -106,7 +127,9 @@ static bool unwind_by_prologue(struct unwind_state *state)
>
>         state->pc = state->ra;
>
> -       return !!__kernel_text_address(state->ra);
> +out:
> +       unwind_state_fixup(state);
> +       return !!__kernel_text_address(state->pc);
>  }
>
>  void unwind_start(struct unwind_state *state, struct task_struct *task,
> --
> 2.20.1
>

The patch looks good.

Tested-by: Jeff Xie <xiehuan09@gmail.com>

-- 
Thanks,
JeffXie
