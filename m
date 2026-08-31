Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A550489863
	for <loongarch@lists.linux.dev>; Mon, 31 Aug 2026 14:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788184991; cv=none; b=MplhD5Msuyet12HDLIwB6NbIlwMzgmTSewIwfS6a9P3MFuxkwt/xOEDwd+xD479S9zPPcUQiZbAEZ0sn8YAztq7IkHGaK1fN/oC1l4S7DHebUaODJZ6MTSLg2JWM8cL/1+HpvkuwS08JIyZyHA2X9NtE0RwQouJiffjZ4EMZpok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788184991; c=relaxed/simple;
	bh=ET1sM9TeGg/w2GTUGB0gztT4T55XpGaCdywqlv0aSYo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ysh6Jq9JWDsJepSdPL4aICwsy+PQuDq+Vps+DycQTlnLQeID1jyrLVilzoshZEiOnAAf2TQsh7zlobCpUdmTG4hpH/z6abie0ajH9RQcQUMr1wqdpQIW/oXwr1SuYwQGMa1JzA0GFfdFhB19MRQPCNX2d7kwvspv7JXsn60mYuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DzlMAMyT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DzlMAMyT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7A981F00A3F
	for <loongarch@lists.linux.dev>; Mon, 31 Aug 2026 14:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788184989;
	bh=aNbW8TKN783W/BbmTH8HUadI4hpvfofki8XNkpdLV3M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=DzlMAMyT5BooccEeYfGl0PJEaj7pcKd+C9CdUwGd0c0tCnsxIyS5r1UmoijkXmoGZ
	 ftj/0wiOlnNkvwnAVHPcQogbK2fGet2zMgKDrpVIXvqfKtb8izHNt+SMHWWaaAh+rZ
	 6/kovEivlDneY8Xc9vsjCnnLtw1xod2oaNqg7d4T8YtDQt1GgxeThoW7bIqCQjnsqt
	 kWtUwpe53LDzPhBxHyc3y+jdoUzFJRm/Qy0QoL9y1rlVAR5C8cT/v9KfJCzLZvxZub
	 CSE8jGiJsxqjJW/kAGImFM51peiRnJmIupd+QUGTuwY9ZXIVJfb37yJO8a34vxH2qt
	 rSp3eZmDBa7HQ==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c250f28f1cdso550557466b.0
        for <loongarch@lists.linux.dev>; Mon, 31 Aug 2026 07:03:09 -0700 (PDT)
X-Gm-Message-State: AFuF++ldN8VzLs23NLapVPsW6VW/UB2ZUJ+7dA96OghD8jnTw+5xohWa
	ynkUW+vQ4VNNljdOPnwwnpRR9JYRWChA3Is4g3PuVpqwPdbMBquRtUeyn3aWcduerWWJ9Dl+vpb
	xODj6BJTmwMqVvImYQt2lu4eyzi9so+U=
X-Received: by 2002:a17:907:c01c:b0:c20:af9d:454a with SMTP id
 a640c23a62f3a-c25571deba3mr1723328766b.16.1788184988499; Mon, 31 Aug 2026
 07:03:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260826110306.6847-1-yangtiezhu@loongson.cn> <20260826110306.6847-5-yangtiezhu@loongson.cn>
In-Reply-To: <20260826110306.6847-5-yangtiezhu@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 31 Aug 2026 22:02:56 +0800
X-Gmail-Original-Message-ID: <CAAhV-H40Zu0zTLQ7-S0tzqMNJ8KRB4iF+rzzrZG_Nd4ETveDDA@mail.gmail.com>
X-Gm-Features: AcwNN1X_6WBpHG3gihHTVs_XRqFKefNZvR5N4u9_hVJ9zKsZDotRCmyRhMQQEsU
Message-ID: <CAAhV-H40Zu0zTLQ7-S0tzqMNJ8KRB4iF+rzzrZG_Nd4ETveDDA@mail.gmail.com>
Subject: Re: [PATCH v1 4/6] LoongArch: Only send SIGTRAP signal if necessary
 in do_watch()
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Tiezhu,

On Wed, Aug 26, 2026 at 7:03=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> In do_watch(), the kernel unconditionally forces a SIGTRAP signal at the
> end of the handler via force_sig(SIGTRAP). This is essential for ptrace
> operations, but it severely disrupts standard perf_event usage.
>
> Under normal perf usage, it is not necessary to force a SIGTRAP signal
> on every hit. Forcing it unnecessarily aborts the target process if no
> user-space signal handler is registered, which violates performance
> monitoring behaviors and injects context switch overheads.
>
> However, a conditional check using only 'current->ptrace' would block
> legitimate user-requested signals when a perf_event is configured with
> 'attr.sigtrap =3D 1' for asynchronous user-space tracking.
>
> Fix this by refactoring breakpoint_handler() and watchpoint_handler()
> to return a boolean status indicating whether any triggered breakpoint
> explicitly requires a signal notification. Update do_watch() to enforce
> the SIGTRAP signal only when the process is actively being debugged via
> ptrace, or when the underlying perf_event infrastructure specifically
> demands it via 'attr.sigtrap'.
>
> Fixes: 424421a7f34c ("LoongArch: ptrace: Add hardware single step support=
")
> Cc: stable@vger.kernel.org
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/loongarch/include/asm/hw_breakpoint.h |  4 ++--
>  arch/loongarch/kernel/hw_breakpoint.c      | 18 ++++++++++++++++--
>  arch/loongarch/kernel/traps.c              |  8 +++++---
>  3 files changed, 23 insertions(+), 7 deletions(-)
>
> diff --git a/arch/loongarch/include/asm/hw_breakpoint.h b/arch/loongarch/=
include/asm/hw_breakpoint.h
> index 5faa97a87a9e..d202052df8a1 100644
> --- a/arch/loongarch/include/asm/hw_breakpoint.h
> +++ b/arch/loongarch/include/asm/hw_breakpoint.h
> @@ -116,8 +116,8 @@ extern void arch_uninstall_hw_breakpoint(struct perf_=
event *bp);
>  extern int hw_breakpoint_slots(int type);
>  extern void hw_breakpoint_pmu_read(struct perf_event *bp);
>
> -void breakpoint_handler(struct pt_regs *regs);
> -void watchpoint_handler(struct pt_regs *regs);
> +bool breakpoint_handler(struct pt_regs *regs);
> +bool watchpoint_handler(struct pt_regs *regs);
>
>  #ifdef CONFIG_HAVE_HW_BREAKPOINT
>  extern void ptrace_hw_copy_thread(struct task_struct *task);
> diff --git a/arch/loongarch/kernel/hw_breakpoint.c b/arch/loongarch/kerne=
l/hw_breakpoint.c
> index 7f69cf361a5e..3683a52b2368 100644
> --- a/arch/loongarch/kernel/hw_breakpoint.c
> +++ b/arch/loongarch/kernel/hw_breakpoint.c
> @@ -482,10 +482,11 @@ NOKPROBE_SYMBOL(update_bp_registers);
>  /*
>   * Debug exception handlers.
>   */
> -void breakpoint_handler(struct pt_regs *regs)
> +bool breakpoint_handler(struct pt_regs *regs)
>  {
>         int i;
>         struct perf_event *bp, **slots;
> +       bool need_sigtrap =3D false;
>
>         slots =3D this_cpu_ptr(bp_on_reg);
>
> @@ -494,18 +495,25 @@ void breakpoint_handler(struct pt_regs *regs)
>                         bp =3D slots[i];
>                         if (bp =3D=3D NULL)
>                                 continue;
> +
>                         perf_bp_event(bp, regs);
> +                       if (bp->attr.sigtrap)
> +                               need_sigtrap =3D true;
> +
>                         csr_write32(0x1 << i, LOONGARCH_CSR_FWPS);
>                         update_bp_registers(regs, 0, 0);
>                 }
>         }
> +
> +       return need_sigtrap;
>  }
>  NOKPROBE_SYMBOL(breakpoint_handler);
>
> -void watchpoint_handler(struct pt_regs *regs)
> +bool watchpoint_handler(struct pt_regs *regs)
>  {
>         int i;
>         struct perf_event *wp, **slots;
> +       bool need_sigtrap =3D false;
>
>         slots =3D this_cpu_ptr(wp_on_reg);
>
> @@ -514,11 +522,17 @@ void watchpoint_handler(struct pt_regs *regs)
>                         wp =3D slots[i];
>                         if (wp =3D=3D NULL)
>                                 continue;
> +
>                         perf_bp_event(wp, regs);
> +                       if (wp->attr.sigtrap)
> +                               need_sigtrap =3D true;
> +
>                         csr_write32(0x1 << i, LOONGARCH_CSR_MWPS);
>                         update_bp_registers(regs, 0, 1);
>                 }
>         }
> +
> +       return need_sigtrap;
>  }
>  NOKPROBE_SYMBOL(watchpoint_handler);
>
> diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.=
c
> index c4d7e55fb3ea..de0c9b03d551 100644
> --- a/arch/loongarch/kernel/traps.c
> +++ b/arch/loongarch/kernel/traps.c
> @@ -811,6 +811,7 @@ asmlinkage void noinstr do_bp(struct pt_regs *regs)
>  asmlinkage void noinstr do_watch(struct pt_regs *regs)
>  {
>         irqentry_state_t state =3D irqentry_enter(regs);
> +       bool perf_sigtrap =3D false;
This is not for perf only, so need_sigtrap is better.

>
>  #ifndef CONFIG_HAVE_HW_BREAKPOINT
>         pr_warn("Hardware watch point handler not implemented!\n");
> @@ -851,11 +852,12 @@ asmlinkage void noinstr do_watch(struct pt_regs *re=
gs)
>                         }
>                 }
>         } else {
> -               breakpoint_handler(regs);
> -               watchpoint_handler(regs);
> +               perf_sigtrap |=3D breakpoint_handler(regs);
> +               perf_sigtrap |=3D watchpoint_handler(regs);
Let breakpoint_handler() and watchpoint_handler() return "int", then
see below...

>         }
>
> -       force_sig(SIGTRAP);
> +       if (current->ptrace || perf_sigtrap)
Define need_sigtrap as "int" and initialize it as current->ptrace,
then we can only use "if (need_sigtrap)" here.

Huacai

> +               force_sig(SIGTRAP);
>  out:
>  #endif
>         irqentry_exit(regs, state);
> --
> 2.42.0
>
