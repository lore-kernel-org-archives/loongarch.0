Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9C02E414
	for <loongarch@lists.linux.dev>; Wed, 12 Jun 2024 04:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718167149; cv=none; b=WwTkhTDQ2rSWww/5GTqf6lr0aPscONLBkifSefi+5r2VsOS83NV6uy6HhZvaVBCjZP/8Uqs6SaLEYMIqY9WLLb1xtbleeVwR2OUKFLrj/2pcXZ3ppzayEw/cXGePiZ8MCJUnmIFFVPpDPGZ48zCWEV7WQI6YULRuq1C/N4SWHJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718167149; c=relaxed/simple;
	bh=QBnNWQoBfhrqdIiv9FnohE3ypcjo8iq9gggp690uSNs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U8V/WKbeq9mSjxnPfbhs80U29DfeTRlcUaYJYI+LpcvW25mKL1H8HzDyC41+OR7PriZR309szNw+OpLZ7wPPNuwFrk6/2YwXhiTBj9RsbyeLETJieykca8zikaVBBgxZ2HVh1KuEnPKzCfYmrqMrcFMcmEE6aOTAKcmvNBplxbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=naSsGulj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="naSsGulj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3A47C4AF48
	for <loongarch@lists.linux.dev>; Wed, 12 Jun 2024 04:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718167149;
	bh=QBnNWQoBfhrqdIiv9FnohE3ypcjo8iq9gggp690uSNs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=naSsGuljjfpSCpKFkDuJQ7Lpk3PSFt0GtJUUPFWSw6/P0g22ts0wu6kZHPnZI+cgo
	 AcTS/ItBrZBH+O7Wo5qCIzZBYDNhEd2Tk8nFcXt7XDAsZorIAIWm/Sq84pCX9AC3LJ
	 s6pSIqLbp+6sDJQuOhzrnbAWyzucj/+PQN2IQCOx8Y3wn1cmxG/9AoTeY20pSSWEG3
	 YIqy2FL5ZT2xMuXQiP5qaSPEDIOG117Znj62tRogBQu4Z+gDWwPBN6CfPvs8CCPGu5
	 vZ8TWcADAV1lrqQZ1DtJxTQj9VIzwmsuP+uX/9mnGOMuB3JJR6nKfwwbL4hd7rkLEA
	 oX4k/GZoIgyxg==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a6269885572so84599366b.1
        for <loongarch@lists.linux.dev>; Tue, 11 Jun 2024 21:39:08 -0700 (PDT)
X-Gm-Message-State: AOJu0YyF9LVzC20Efbh5sh8bl0HpLC2QBnfRH1XbpRsY4Y/dy5w8C5CC
	zO0wnehJIYSvDW1PMn7alPG8ZMTqM7hX+gljffSNWUmC1GTQYLTq8DDH1gv4vfQdgxgTMpql3EQ
	NwAYpNpVBkHHvFmi8Jw9gE4ZvC6Y=
X-Google-Smtp-Source: AGHT+IFahumydduoPyO1r4l4bIXaV6Dxwli4/NC3ifDbHfZortWfdLVzpkQtkwOHHi2dzUBs3L7z8ll8C1+IflE7vis=
X-Received: by 2002:a17:906:cc82:b0:a6f:11f8:c220 with SMTP id
 a640c23a62f3a-a6f4680068cmr49889666b.15.1718167147439; Tue, 11 Jun 2024
 21:39:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240611114939.23586-1-lihui@loongson.cn> <20240611114939.23586-3-lihui@loongson.cn>
In-Reply-To: <20240611114939.23586-3-lihui@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 12 Jun 2024 12:38:56 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6XxYmrJZ-hxJqdj5H547nOoV1VgUhqCRMdrM5h-ZPGtQ@mail.gmail.com>
Message-ID: <CAAhV-H6XxYmrJZ-hxJqdj5H547nOoV1VgUhqCRMdrM5h-ZPGtQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] LoongArch: Trigger user-space watchpoints correctly
To: Hui Li <lihui@loongson.cn>
Cc: loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn, 
	Jinyang He <hejinyang@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Hui,


On Tue, Jun 11, 2024 at 7:49=E2=80=AFPM Hui Li <lihui@loongson.cn> wrote:
>
> In the current code, gdb can set the watchpoint successfully through
> ptrace interface, but watchpoint will not be triggered.
>
> When debugging the following code using gdb.
>
> lihui@bogon:~$ cat test.c
>   #include <stdio.h>
>   int a =3D 0;
>   int main()
>   {
>         a =3D 1;
>         printf("a =3D %d\n", a);
>         return 0;
>   }
> lihui@bogon:~$ gcc -g test.c -o test
> lihui@bogon:~$ gdb test
> ...
> (gdb) watch a
> ...
> (gdb) r
> ...
> a =3D 1
> [Inferior 1 (process 4650) exited normally]
>
> No watchpoints were triggered, the root causes are:
>
> 1. The kernel uses perf_event and hw_breakpoint framework to control
>    watchpoint. But the perf_event corresponding to watchpoint is not
>    enabled, so it needs to be enabled according to MWPnCFG3.PLV3. And
>    a judgment is added in ptrace_hbp_set_addr() to ensure that kernel
>    space cannot be monitored in user mode.
>
> 2. The global enable control for all watchpoints is the WE bit of
>    CSR.CRMD, and hardware sets the value to 0 when an exception is
>    triggered. When the ERTN instruction is executed to return, the
>    hardware restores the value of the PWE field of CSR.PRMD here.
>    So, before a thread containing watchpoints be scheduled, the PWE
>    field of CSR.PRMD needs to be set to 1. Add this modification in
>    hw_breakpoint_control().
>
> All changes according to the LoongArch Reference Manual:
> https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.html=
#control-and-status-registers-related-to-watchpoints
> https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.html=
#basic-control-and-status-registers
>
> with this patch:
>
> lihui@bogon:~$ gdb test
> ...
> (gdb) watch a
> Hardware watchpoint 1: a
> (gdb) r
> ...
> Hardware watchpoint 1: a
>
> Old value =3D 0
> New value =3D 1
> main () at test.c:6
> 6               printf("a =3D %d\n", a);
> (gdb) c
> Continuing.
> a =3D 1
> [Inferior 1 (process 775) exited normally]
>
> Signed-off-by: Hui Li <lihui@loongson.cn>
> ---
>  arch/loongarch/include/asm/hw_breakpoint.h |  1 +
>  arch/loongarch/kernel/hw_breakpoint.c      |  9 +++++++++
>  arch/loongarch/kernel/ptrace.c             | 16 +++++++++++++---
>  3 files changed, 23 insertions(+), 3 deletions(-)
>
> diff --git a/arch/loongarch/include/asm/hw_breakpoint.h b/arch/loongarch/=
include/asm/hw_breakpoint.h
> index a8ce580f4fc6..16016e4384d8 100644
> --- a/arch/loongarch/include/asm/hw_breakpoint.h
> +++ b/arch/loongarch/include/asm/hw_breakpoint.h
> @@ -75,6 +75,7 @@ do {                                                   =
       \
>  #define CSR_MWPC_NUM           0x3f
>
>  #define CTRL_PLV_ENABLE                0x1e
> +#define CTRL_PLV3_ENABLE       0x10
>
>  #define MWPnCFG3_LoadEn                8
>  #define MWPnCFG3_StoreEn       9
> diff --git a/arch/loongarch/kernel/hw_breakpoint.c b/arch/loongarch/kerne=
l/hw_breakpoint.c
> index 2d311aff91af..f9e8ed49cfdc 100644
> --- a/arch/loongarch/kernel/hw_breakpoint.c
> +++ b/arch/loongarch/kernel/hw_breakpoint.c
> @@ -178,6 +178,11 @@ static int hw_breakpoint_control(struct perf_event *=
bp,
>         int i, max_slots, enable;
>         struct perf_event **slots;
>         struct arch_hw_breakpoint *info =3D counter_arch_bp(bp);
> +       struct pt_regs *regs;
> +
> +       /*  Whether bp belongs to a task. */
> +       if (bp->hw.target)
> +               regs =3D task_pt_regs(bp->hw.target);
>
>         if (info->ctrl.type =3D=3D LOONGARCH_BREAKPOINT_EXECUTE) {
>                 /* Breakpoint */
> @@ -211,6 +216,8 @@ static int hw_breakpoint_control(struct perf_event *b=
p,
>                 }
>                 enable =3D csr_read64(LOONGARCH_CSR_CRMD);
>                 csr_write64(CSR_CRMD_WE | enable, LOONGARCH_CSR_CRMD);
> +               if (bp->hw.target)
> +                       regs->csr_prmd |=3D CSR_PRMD_PWE;
>                 break;
>         case HW_BREAKPOINT_UNINSTALL:
>                 /* Reset the FWPnCFG/MWPnCFG 1~4 register. */
> @@ -222,6 +229,8 @@ static int hw_breakpoint_control(struct perf_event *b=
p,
>                 write_wb_reg(CSR_CFG_CTRL, i, 1, 0);
>                 write_wb_reg(CSR_CFG_ASID, i, 0, 0);
>                 write_wb_reg(CSR_CFG_ASID, i, 1, 0);
> +               if (bp->hw.target)
> +                       regs->csr_prmd &=3D ~CSR_PRMD_PWE;
>                 break;
>         }
>
> diff --git a/arch/loongarch/kernel/ptrace.c b/arch/loongarch/kernel/ptrac=
e.c
> index 16b756c6049b..4566059bd0a2 100644
> --- a/arch/loongarch/kernel/ptrace.c
> +++ b/arch/loongarch/kernel/ptrace.c
> @@ -589,6 +589,7 @@ static int ptrace_hbp_set_ctrl(unsigned int note_type=
,
>         struct perf_event *bp;
>         struct perf_event_attr attr;
>         struct arch_hw_breakpoint_ctrl ctrl;
> +       int hbp_enable =3D uctrl & CTRL_PLV_ENABLE;
>
>         bp =3D ptrace_hbp_get_initialised_bp(note_type, tsk, idx);
>         if (IS_ERR(bp))
> @@ -608,9 +609,14 @@ static int ptrace_hbp_set_ctrl(unsigned int note_typ=
e,
>                 return -EINVAL;
>         }
>
> -       err =3D ptrace_hbp_fill_attr_ctrl(note_type, ctrl, &attr);
> -       if (err)
> -               return err;
> +       if (hbp_enable =3D=3D CTRL_PLV3_ENABLE) {
After some thinking, It seems reasonable to set a user address be
watched at any PLVs (but of course user programs cannot watch a kernel
address), so the best condition here may be:
if (hbp_enable & CTRL_PLV_ENABLE)

And  in Patch-3, we should set the same PLVs exactly the same as user reque=
sts.

> +               err =3D ptrace_hbp_fill_attr_ctrl(note_type, ctrl, &attr)=
;
> +               if (err)
> +                       return err;
> +               attr.disabled =3D 0;
> +       } else {
> +               attr.disabled =3D 1;
> +       }
>
>         return modify_user_hw_breakpoint(bp, &attr);
>  }
> @@ -641,6 +647,10 @@ static int ptrace_hbp_set_addr(unsigned int note_typ=
e,
>         struct perf_event *bp;
>         struct perf_event_attr attr;
>
> +       /* Kernel-space address cannot be monitored by user-space */
> +       if ((addr & XKPRANGE) =3D=3D XKPRANGE)
> +               return -EINVAL;
XKVRANGE addresses are also kernel address, so here you can use:
if ((unsigned long)addr >=3D XKPRANGE)

Huacai

> +
>         bp =3D ptrace_hbp_get_initialised_bp(note_type, tsk, idx);
>         if (IS_ERR(bp))
>                 return PTR_ERR(bp);
> --
> 2.38.1
>
