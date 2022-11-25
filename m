Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB96F17C6
	for <loongarch@lists.linux.dev>; Fri, 25 Nov 2022 05:02:16 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id w15-20020a17090a380f00b0021873113cb4so3169877pjb.0
        for <loongarch@lists.linux.dev>; Thu, 24 Nov 2022 21:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LnBJVB4KaZdcEW58Kanpt6jGScoaRbxEgLlWXWeBlSY=;
        b=n0yyP8Rl6+wgNuIOv5AjRMCrUC909PNo1zY/y1UMSSMB+TqIWZH5aPgZFSXEAxeIor
         O+OCV2DYXiHv0rF5jIiubixGukh2rmVEd0W5Ia56w9tne8MhuDBk5kb+LyBSWK63+X0d
         dQSi1O3oz4b/ycyckpf5qE5of8O5gtnNAPE85cskLZ5lH33tKpklZEZk/A4xMNaRvU5N
         Z40tTwZTjEDTst7uqX5Y7r00Q1DEk0GqcWDSrSHTlyhZaspyE8C8LndhSCsRIuSN/IVc
         FXGzbS9AT2EAY8nAGxCJjgb6o7+BJuhQNlAQMe2Oiuw0/7wGucBuhBTDrVODBxPQLUkV
         ugSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LnBJVB4KaZdcEW58Kanpt6jGScoaRbxEgLlWXWeBlSY=;
        b=IIqa9JuaYehgSt60KU2DYPxxfGi7EeVuPZN6iMaz79WFQbGnm2TJ/YeFPx4DrMWRNH
         mjcj6fMXIQm2VEVU8mX+x9C2xeC5EuyE+woRgv7vuJfPkEzyZwv0ZxjtAZ/StVWPZcCZ
         K89nWIj2pxDsoNLXoFCDxDErBQebHcSzhPpOYuA8hl3YjRvRw7wmqmpm69PrXaRLQTJr
         NDzcR5dGgaDIX2nSmd+z1sFW3XjzqSAWtcBTM9D4RZ7mFvHl6cetwvOo7aQGiIrVMjzR
         Qupa+INFGv48HMD5Po3cErkzxDyptaZW/KSJwkokXggfvGhT9TCvtOyojdTQW0/7ShdR
         C1jw==
X-Gm-Message-State: ANoB5pnW8ql0EnbkVSb1O8xxREZ5xxCzpbK1fdSREp9ulBUgopDzjf+Z
	+m+tvf2tg4vRPfI+Y27HHyorj4MFVkoj9XY00NY=
X-Google-Smtp-Source: AA0mqf7TxJa6ln6wOx6/FbHPbCk/DKtdvApZwC+PpeBCroySRXLzB2x6qmiL5FGW5KtWDOm38KD0GrVPiAprcXi8Cbs=
X-Received: by 2002:a17:903:486:b0:186:95ca:1e4c with SMTP id
 jj6-20020a170903048600b0018695ca1e4cmr17236835plb.13.1669352536196; Thu, 24
 Nov 2022 21:02:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221116082338.5145-1-zhangqing@loongson.cn> <CAAhV-H4qOW_qw3wD0bdO9P8sCYAoLUHcPS1rpVfMsS36RSX_ZQ@mail.gmail.com>
In-Reply-To: <CAAhV-H4qOW_qw3wD0bdO9P8sCYAoLUHcPS1rpVfMsS36RSX_ZQ@mail.gmail.com>
From: Jeff Xie <xiehuan09@gmail.com>
Date: Fri, 25 Nov 2022 13:02:04 +0800
Message-ID: <CAEr6+EAKdvHC_eQXA3GWNAFtp9g0JSYZcQrqUqiTyCQpXMFSNw@mail.gmail.com>
Subject: Re: [PATCH RESEND v8 0/9] LoongArch: Add ftrace support
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Qing Zhang <zhangqing@loongson.cn>, Steven Rostedt <rostedt@goodmis.org>, 
	Ingo Molnar <mingo@redhat.com>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Nov 19, 2022 at 1:21 PM Huacai Chen <chenhuacai@kernel.org> wrote:
>
> Hi, Qing,
>
> I have applied this series to
> https://github.com/loongson/linux/commits/loongarch-next with some
> slight modifications, please test that branch to see if everything is
> correct.

I found the call trace relative issue for the branch:
https://github.com/loongson/linux/commits/loongarch-next

test01:

[root@loongarch tracing]# echo do_sys_openat2 > ./set_ftrace_filter
[root@loongarch tracing]# echo 1 > ./options/func_stack_trace
[root@loongarch tracing]# echo function > ./current_tracer
[root@loongarch tracing]# cat ./trace
# tracer: function
#
# entries-in-buffer/entries-written: 6/6   #P:1
#
#                                _-----=> irqs-off/BH-disabled
#                               / _----=> need-resched
#                              | / _---=> hardirq/softirq
#                              || / _--=> preempt-depth
#                              ||| / _-=> migrate-disable
#                              |||| /     delay
#           TASK-PID     CPU#  |||||  TIMESTAMP  FUNCTION
#              | |         |   |||||     |         |
              sh-84      [000] .....    37.784924: do_sys_openat2 <-sys_openat
              sh-84      [000] .....    37.786382: <stack trace>
 => sys_openat
 => do_syscall
 => handle_syscall
 => 0                  // abnormal output

test02:

[root@loongarch tracing]# echo do_sys_openat2:stacktrace > ./set_ftrace_filter
[root@loongarch tracing]# cat ./trace
# tracer: nop
#
# entries-in-buffer/entries-written: 3/3   #P:1
#
#                                _-----=> irqs-off/BH-disabled
#                               / _----=> need-resched
#                              | / _---=> hardirq/softirq
#                              || / _--=> preempt-depth
#                              ||| / _-=> migrate-disable
#                              |||| /     delay
#           TASK-PID     CPU#  |||||  TIMESTAMP  FUNCTION
#              | |         |   |||||     |         |
              sh-84      [000] .n.2.   107.946986: <stack trace>
 => do_syscall
 => handle_syscall
 => 0xd9ad812ae
              sh-84      [000] ...2.   110.584354: <stack trace>
 => do_syscall
 => handle_syscall
 => 0xd9ad812ae    // abnormal output

test03:

[root@loongarch tracing]# echo 1 > ./options/stacktrace
[root@loongarch tracing]# echo 1 > ./events/sched/sched_switch/enable
[root@loongarch tracing]# cat ./trace
...
<idle>-0       [000] d..2.    27.981495: sched_switch:
prev_comm=swapper/0 prev_pid=0 prev_prio=120 prev_state=R ==>
next_comm=rcu_preempt next
_pid=15 next_prio=120
          <idle>-0       [000] d..2.    27.981508: <stack trace>
 => __schedule
 => schedule_idle
 => cpu_startup_entry
 => kernel_init
 => 0x0074706d   // abnormal output



>
> Huacai
>
> On Wed, Nov 16, 2022 at 4:23 PM Qing Zhang <zhangqing@loongson.cn> wrote:
> >
> > This patch series to support basic and dynamic ftrace.
> >
> > 1) -pg
> > Use `-pg` makes stub like a child function `void _mcount(void *ra)`.
> > Thus, it can be seen store RA and open stack before `call _mcount`.
> > Find `open stack` at first, and then find `store RA`.
> >
> > 2) -fpatchable-function-entry=2
> > The compiler has inserted 2 NOPs before the regular function prologue.
> > T series registers are available and safe because of LoongArch psABI.
> >
> > At runtime, replace nop with bl to enable ftrace call and replace bl with
> > nop to disable ftrace call. The bl requires us to save the original RA value,
> > so here it saves RA at t0.
> > details are:
> >
> > | Compiled   |       Disabled         |        Enabled         |
> > +------------+------------------------+------------------------+
> > | nop        | move     t0, ra        | move     t0, ra        |
> > | nop        | nop                    | bl      ftrace_caller  |
> > | func_body  | func_body              | func_body              |
> >
> > The RA value will be recovered by ftrace_regs_entry, and restored into RA
> > before returning to the regular function prologue. When a function is not
> > being traced, the move t0, ra is not harmful.
> >
> > performs a series of startup tests on ftrace and The test cases in selftests
> > has passed on LoongArch.
> >
> > Changes in v2:
> >  - Remove patch "LoongArch: ftrace: Add CALLER_ADDRx macros" there are other
> >    better ways
> >  Suggested by Steve:
> >  - Add HAVE_DYNAMIC_FTRACE_WITH_ARGS support (6/10)
> >  Suggested by Jinyang:
> >  - Change addu16id to lu12iw and Adjust module_finalize return value (7/10)
> >  - Use the "jr" pseudo-instruction where applicable (1/10)
> >  - Use the "la.pcrel" instead of "la" (3/10)
> >
> > Changes in v3:
> >  Reported by Jeff:
> >  - Fix unwind state when option func_stack_trace (10/10)
> >
> > Changes in v4:
> >  - No comments. Just resend the series.
> >  - Rebased onto v6.0.0-rc4.
> >
> > Changes in v5:
> >  - Modify the indentation of Kconfig and small changes
> >
> > Changes in v6:
> >  Suggested by Huacai:
> >  - Adjusting the patch Sequence
> >  - renamed mcount-dyn.S for consistency
> >
> > Changes in v7:
> >  - delete redefinition
> >
> > Changes in v8:
> >  - remove useless macro judgment and modify the return location
> >  - move some code to Patch-3
> >
> > Qing Zhang (9):
> >   LoongArch/ftrace: Add basic support
> >   LoongArch/ftrace: Add recordmcount support
> >   LoongArch/ftrace: Add dynamic function tracer support
> >   LoongArch/ftrace: Add dynamic function graph tracer support
> >   LoongArch/ftrace: Add HAVE_DYNAMIC_FTRACE_WITH_REGS support
> >   LoongArch/ftrace: Add HAVE_DYNAMIC_FTRACE_WITH_ARGS support
> >   LoongArch/ftrace: Add HAVE_FUNCTION_GRAPH_RET_ADDR_PTR support
> >   LoongArch: modules/ftrace: Initialize PLT at load time
> >   LoongArch: Enable CONFIG_KALLSYMS_ALL and CONFIG_DEBUG_FS
> >
> >  arch/loongarch/Kconfig                     |   7 +
> >  arch/loongarch/Makefile                    |   5 +
> >  arch/loongarch/configs/loongson3_defconfig |   2 +
> >  arch/loongarch/include/asm/ftrace.h        |  59 +++++
> >  arch/loongarch/include/asm/inst.h          |  15 ++
> >  arch/loongarch/include/asm/module.h        |   5 +-
> >  arch/loongarch/include/asm/module.lds.h    |   1 +
> >  arch/loongarch/include/asm/unwind.h        |   3 +-
> >  arch/loongarch/kernel/Makefile             |  13 +
> >  arch/loongarch/kernel/ftrace.c             |  74 ++++++
> >  arch/loongarch/kernel/ftrace_dyn.c         | 264 +++++++++++++++++++++
> >  arch/loongarch/kernel/inst.c               | 127 ++++++++++
> >  arch/loongarch/kernel/mcount.S             |  94 ++++++++
> >  arch/loongarch/kernel/mcount_dyn.S         | 154 ++++++++++++
> >  arch/loongarch/kernel/module-sections.c    |  11 +
> >  arch/loongarch/kernel/module.c             |  21 ++
> >  arch/loongarch/kernel/unwind_guess.c       |   4 +-
> >  arch/loongarch/kernel/unwind_prologue.c    |  46 +++-
> >  scripts/recordmcount.c                     |  23 ++
> >  19 files changed, 918 insertions(+), 10 deletions(-)
> >  create mode 100644 arch/loongarch/include/asm/ftrace.h
> >  create mode 100644 arch/loongarch/kernel/ftrace.c
> >  create mode 100644 arch/loongarch/kernel/ftrace_dyn.c
> >  create mode 100644 arch/loongarch/kernel/mcount.S
> >  create mode 100644 arch/loongarch/kernel/mcount_dyn.S
> >
> > --
> > 2.36.0
> >
> >


-- 
Thanks,
JeffXie
