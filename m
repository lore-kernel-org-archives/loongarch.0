Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26522AEE4
	for <loongarch@lists.linux.dev>; Wed, 10 Dec 2025 04:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765340142; cv=none; b=K01LyMtLeGxHgtSeXm9HMSFPMUR6uPGrz9qYu20plScd1FciDXYY56x1IGSYO39Fvl0PajSL1UZvRxpSAYMfQ/HAZYX8qxSF+5IGFF+6c2gqVrYN+b15z4sB2XAbGkv2LH85fujp0pBdY1r+bEAUWG5M+p0iZr4GweGdw1AyUR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765340142; c=relaxed/simple;
	bh=5EPaIR2R7g4CAggpBpfR1mSfB7/jXW4i2bsziBGLHYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sNzIvKELv4qCUs9b4oOQ5aNL7Bo+OzHYTRuP9fom5mHvoi7Wy6tHMIgQTbAzlaXI0yU/Z47JbK5FIFWvI/bYzf+mijyo+xxw3BIFRs6badRTob/PAp9ab64tyVBk9w70L+Wuf8YeCJmltmGFVoDxvTjgNmlcVwG2miL7bNbJ3cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W1x0nis2; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W1x0nis2"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-45391956bfcso3642600b6e.3
        for <loongarch@lists.linux.dev>; Tue, 09 Dec 2025 20:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765340139; x=1765944939; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWvYemQmhncpEstG64l2sph/tNcUMcoJJBDBaG46h/M=;
        b=W1x0nis2vap0+0uUB4xaf1LWzzuw36KI42KNmGzOJGBRFzMwTagNbafHeEJ11t+mjQ
         3vt8iQjDfZAgL/qx/8MqHAQiqhREgJ+aDwCmCd7w0xeupjeWRj50y+Cc+SbV8sHNB2GU
         MdN1b1hK/IkgBRyh7lB704470zyFvto16OWBpztLrWwnfE2UbWoid9bP96UPr4FTgcH2
         F65ExMZjVin7dMmqQjChHbNT7pChKX16SfuR9/Kl5QTCbnRG94TCyI+FpATI6j1Wthvn
         6lCurH0txfbIcxw+UNGJI50o2HE8/uLHqGNvdcxfh24ecEqmMkfmMsU+8lnEgRnOXVaM
         6JSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765340140; x=1765944940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bWvYemQmhncpEstG64l2sph/tNcUMcoJJBDBaG46h/M=;
        b=CndrWt2eZxoDS9o4GmjZ4OZdWXD5PlSf+TqmRqYan755gxJLDaG04iWbOli79UAPu+
         JzpYk/kOBIy6e6QEPmBKB1oxPf8LzRccgTnzY/oesFOpEetJ80J7+A9k3xRWFiDwp7Qs
         qhYWCghaaSnxkcZd8IMLm9nmi5RTl/aXIxwbm+830OylCimVgrmBtTuZpZwEDjX/pNef
         J2fTDXfI92CxXPfHnuJoM4GK/Eus7H2ZIP+tY2yc6411JUSadNmSa2mtCg2UGktpFUqR
         nrz2xVyq8lvQmYYm8+VWfjIwVpia0kYVSvsjL7SxHlDn17BqRnUKrLW5KhBZl4wQAHhg
         pmOg==
X-Forwarded-Encrypted: i=1; AJvYcCWi2YhS29SVtmCkDJs4ftFdz+oEtZURVJJq4K7BZZG61x6x2WYSSocwa475HKwdaIZnFqswbZsM/UU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzz9s3yR3+GeJgtipFiBR8ZPZWvhW+zdSbJQxaEmIiM3e3OgxG6
	txVaBeBYpdFdcGYjg2/MHqQM1tWdDPYo4qprs6BK4ZkYSDPHVqmlNVnim6+Pb6rDhH8f4oEpABQ
	KQwXrjeCN77Tm0yiT4P0ptMwmdvdNpY0=
X-Gm-Gg: ASbGncvsV4lY/e7SBBYAhTdLz04GeEExqC9Qmzr9FY+zxiOyhvdHTmUDgdfj6qluXJN
	CxWh7ahUJaB9UmtF1fT22/kgVhtJe/prwmFxiZM6iao7ojoA+ke0xbswxd/SGd3+ogAqlbkmIaq
	ElhNhm2Dn9WndnhrYt/Vv/wD07OVaJ5Amz3U0lZglTJT3OyHelpis84a5Vvtz23ORWVrZIwrSiP
	Z9IsJjRuNH9e5P4TYm6JujPNs8DpUYgHrhGkcuJKk7zMy3sit4M9b4b3Suq74lXjxdn5XE=
X-Google-Smtp-Source: AGHT+IG9shwNGkCIPXbqnZ3hLxQXnM0fPOmE8ueIuhwP/BGqCHypJxaZs1+1irYu36EjoHFu20/Hw8px6n/4kjrMlJU=
X-Received: by 2002:a05:6808:1981:b0:450:c5db:32bf with SMTP id
 5614622812f47-455863d289amr756333b6e.23.1765340139444; Tue, 09 Dec 2025
 20:15:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251209093405.1309253-1-duanchenghao@kylinos.cn> <20251209093405.1309253-2-duanchenghao@kylinos.cn>
In-Reply-To: <20251209093405.1309253-2-duanchenghao@kylinos.cn>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Wed, 10 Dec 2025 12:15:28 +0800
X-Gm-Features: AQt7F2oWZxvj2sd35sJSbyXY3cHMEkhh5lB1jMgUyEaGOWlfRRufyuX8QpS69Z8
Message-ID: <CAEyhmHThf_i3xLcm4m7ZYo168tH5j5pCtC26cz4HKbwxh-1vuA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] LoongArch: Modify the jump logic of the trampoline
To: Chenghao Duan <duanchenghao@kylinos.cn>
Cc: yangtiezhu@loongson.cn, chenhuacai@kernel.org, kernel@xen0n.name, 
	zhangtianyang@loongson.cn, masahiroy@kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, bpf@vger.kernel.org, guodongtai@kylinos.cn, 
	youling.tang@linux.dev, jianghaoran@kylinos.cn, vincent.mc.li@gmail.com, 
	Youling Tang <tangyouling@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 9, 2025 at 5:34=E2=80=AFPM Chenghao Duan <duanchenghao@kylinos.=
cn> wrote:
>
> There are two methods to jump into the trampoline code for execution:
> 1. ftrace-managed.
> 2. Direct call.
>
> Whether ftrace-managed or direct jump, ensure before trampoline entry:
> t0=3Dparent func return addr, ra=3Dtraced func return addr.
> When managed by ftrace, the trampoline code execution flow utilizes
> ftrace direct call, and it is required to ensure that the original
> data in registers t0 and ra is not modification.
>
> samples/ftrace/ftrace-direct_xxxx.c: update test code for ftrace direct
> call (modify together).
>
> Trampoline: adjust jump logic to use t0 (parent func return addr) and
> ra (traced func return addr) as jump targets for respective scenarios
>
> Signed-off-by: Youling Tang <tangyouling@kylinos.cn>
> Signed-off-by: Chenghao Duan <duanchenghao@kylinos.cn>

Please add a Fixes tag.

> ---
>  arch/loongarch/kernel/mcount_dyn.S          | 14 +++++---
>  arch/loongarch/net/bpf_jit.c                | 37 +++++++++++++++------
>  samples/ftrace/ftrace-direct-modify.c       |  8 ++---
>  samples/ftrace/ftrace-direct-multi-modify.c |  8 ++---
>  samples/ftrace/ftrace-direct-multi.c        |  4 +--
>  samples/ftrace/ftrace-direct-too.c          |  4 +--
>  samples/ftrace/ftrace-direct.c              |  4 +--
>  7 files changed, 50 insertions(+), 29 deletions(-)
>
> diff --git a/arch/loongarch/kernel/mcount_dyn.S b/arch/loongarch/kernel/m=
count_dyn.S
> index d6b474ad1d5e..5729c20e5b8b 100644
> --- a/arch/loongarch/kernel/mcount_dyn.S
> +++ b/arch/loongarch/kernel/mcount_dyn.S
> @@ -94,7 +94,6 @@ SYM_INNER_LABEL(ftrace_graph_call, SYM_L_GLOBAL)
>   * at the callsite, so there is no need to restore the T series regs.
>   */
>  ftrace_common_return:
> -       PTR_L           ra, sp, PT_R1
>         PTR_L           a0, sp, PT_R4
>         PTR_L           a1, sp, PT_R5
>         PTR_L           a2, sp, PT_R6
> @@ -104,12 +103,17 @@ ftrace_common_return:
>         PTR_L           a6, sp, PT_R10
>         PTR_L           a7, sp, PT_R11
>         PTR_L           fp, sp, PT_R22
> -       PTR_L           t0, sp, PT_ERA
>         PTR_L           t1, sp, PT_R13
> -       PTR_ADDI        sp, sp, PT_SIZE
>         bnez            t1, .Ldirect
> +
> +       PTR_L           ra, sp, PT_R1
> +       PTR_L           t0, sp, PT_ERA
> +       PTR_ADDI        sp, sp, PT_SIZE
>         jr              t0
>  .Ldirect:
> +       PTR_L           t0, sp, PT_R1
> +       PTR_L           ra, sp, PT_ERA
> +       PTR_ADDI        sp, sp, PT_SIZE
>         jr              t1
>  SYM_CODE_END(ftrace_common)
>
> @@ -161,6 +165,8 @@ SYM_CODE_END(return_to_handler)
>  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
>  SYM_CODE_START(ftrace_stub_direct_tramp)
>         UNWIND_HINT_UNDEFINED
> -       jr              t0
> +       move            t1, ra
> +       move            ra, t0
> +       jr              t1
>  SYM_CODE_END(ftrace_stub_direct_tramp)
>  #endif /* CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS */
> diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
> index 8dc58781b8eb..d1f5fd5ae847 100644
> --- a/arch/loongarch/net/bpf_jit.c
> +++ b/arch/loongarch/net/bpf_jit.c
> @@ -139,6 +139,7 @@ static void build_prologue(struct jit_ctx *ctx)
>         stack_adjust =3D round_up(stack_adjust, 16);
>         stack_adjust +=3D bpf_stack_adjust;
>
> +       move_reg(ctx, LOONGARCH_GPR_T0, LOONGARCH_GPR_RA);
>         /* Reserve space for the move_imm + jirl instruction */
>         for (i =3D 0; i < LOONGARCH_LONG_JUMP_NINSNS; i++)
>                 emit_insn(ctx, nop);
> @@ -238,7 +239,7 @@ static void __build_epilogue(struct jit_ctx *ctx, boo=
l is_tail_call)
>                  * Call the next bpf prog and skip the first instruction
>                  * of TCC initialization.
>                  */
> -               emit_insn(ctx, jirl, LOONGARCH_GPR_ZERO, LOONGARCH_GPR_T3=
, 6);
> +               emit_insn(ctx, jirl, LOONGARCH_GPR_ZERO, LOONGARCH_GPR_T3=
, 7);
>         }
>  }
>
> @@ -1265,7 +1266,7 @@ static int emit_jump_or_nops(void *target, void *ip=
, u32 *insns, bool is_call)
>                 return 0;
>         }
>
> -       return emit_jump_and_link(&ctx, is_call ? LOONGARCH_GPR_T0 : LOON=
GARCH_GPR_ZERO, (u64)target);
> +       return emit_jump_and_link(&ctx, is_call ? LOONGARCH_GPR_RA : LOON=
GARCH_GPR_ZERO, (u64)target);
>  }
>
>  static int emit_call(struct jit_ctx *ctx, u64 addr)
> @@ -1289,6 +1290,10 @@ int bpf_arch_text_poke(void *ip, enum bpf_text_pok=
e_type old_t,
>                        void *new_addr)
>  {
>         int ret;
> +       unsigned long size =3D 0;
> +       unsigned long offset =3D 0;
> +       char namebuf[KSYM_NAME_LEN];
> +       void *image =3D NULL;
>         bool is_call;
>         u32 old_insns[LOONGARCH_LONG_JUMP_NINSNS] =3D {[0 ... 4] =3D INSN=
_NOP};
>         u32 new_insns[LOONGARCH_LONG_JUMP_NINSNS] =3D {[0 ... 4] =3D INSN=
_NOP};
> @@ -1296,9 +1301,18 @@ int bpf_arch_text_poke(void *ip, enum bpf_text_pok=
e_type old_t,
>         /* Only poking bpf text is supported. Since kernel function entry
>          * is set up by ftrace, we rely on ftrace to poke kernel function=
s.
>          */
> -       if (!is_bpf_text_address((unsigned long)ip))
> +       if (!__bpf_address_lookup((unsigned long)ip, &size, &offset, name=
buf))
>                 return -ENOTSUPP;
>
> +       image =3D ip - offset;
> +       /* zero offset means we're poking bpf prog entry */
> +       if (offset =3D=3D 0)
> +               /* skip to the nop instruction in bpf prog entry:
> +                * move t0, ra
> +                * nop
> +                */
> +               ip =3D image + LOONGARCH_INSN_SIZE;
> +
>         is_call =3D old_t =3D=3D BPF_MOD_CALL;
>         ret =3D emit_jump_or_nops(old_addr, ip, old_insns, is_call);
>         if (ret)
> @@ -1622,14 +1636,11 @@ static int __arch_prepare_bpf_trampoline(struct j=
it_ctx *ctx, struct bpf_tramp_i
>
>         /* To traced function */
>         /* Ftrace jump skips 2 NOP instructions */
> -       if (is_kernel_text((unsigned long)orig_call))
> +       if (is_kernel_text((unsigned long)orig_call) || is_module_text_ad=
dress((unsigned long)orig_call))
>                 orig_call +=3D LOONGARCH_FENTRY_NBYTES;
>         /* Direct jump skips 5 NOP instructions */
>         else if (is_bpf_text_address((unsigned long)orig_call))
>                 orig_call +=3D LOONGARCH_BPF_FENTRY_NBYTES;
> -       /* Module tracing not supported - cause kernel lockups */
> -       else if (is_module_text_address((unsigned long)orig_call))
> -               return -ENOTSUPP;
>
>         if (flags & BPF_TRAMP_F_CALL_ORIG) {
>                 move_addr(ctx, LOONGARCH_GPR_A0, (const u64)im);
> @@ -1722,12 +1733,16 @@ static int __arch_prepare_bpf_trampoline(struct j=
it_ctx *ctx, struct bpf_tramp_i
>                 emit_insn(ctx, ldd, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, 0=
);
>                 emit_insn(ctx, addid, LOONGARCH_GPR_SP, LOONGARCH_GPR_SP,=
 16);
>
> -               if (flags & BPF_TRAMP_F_SKIP_FRAME)
> +               if (flags & BPF_TRAMP_F_SKIP_FRAME) {
>                         /* return to parent function */
> -                       emit_insn(ctx, jirl, LOONGARCH_GPR_ZERO, LOONGARC=
H_GPR_RA, 0);
> -               else
> -                       /* return to traced function */
> +                       move_reg(ctx, LOONGARCH_GPR_RA, LOONGARCH_GPR_T0)=
;
>                         emit_insn(ctx, jirl, LOONGARCH_GPR_ZERO, LOONGARC=
H_GPR_T0, 0);
> +               } else {
> +                       /* return to traced function */
> +                       move_reg(ctx, LOONGARCH_GPR_T1, LOONGARCH_GPR_RA)=
;
> +                       move_reg(ctx, LOONGARCH_GPR_RA, LOONGARCH_GPR_T0)=
;
> +                       emit_insn(ctx, jirl, LOONGARCH_GPR_ZERO, LOONGARC=
H_GPR_T1, 0);
> +               }
>         }
>
>         ret =3D ctx->idx;
> diff --git a/samples/ftrace/ftrace-direct-modify.c b/samples/ftrace/ftrac=
e-direct-modify.c
> index da3a9f2091f5..1ba1927b548e 100644
> --- a/samples/ftrace/ftrace-direct-modify.c
> +++ b/samples/ftrace/ftrace-direct-modify.c
> @@ -176,8 +176,8 @@ asm (
>  "      st.d    $t0, $sp, 0\n"
>  "      st.d    $ra, $sp, 8\n"
>  "      bl      my_direct_func1\n"
> -"      ld.d    $t0, $sp, 0\n"
> -"      ld.d    $ra, $sp, 8\n"
> +"      ld.d    $ra, $sp, 0\n"
> +"      ld.d    $t0, $sp, 8\n"
>  "      addi.d  $sp, $sp, 16\n"
>  "      jr      $t0\n"
>  "      .size           my_tramp1, .-my_tramp1\n"
> @@ -189,8 +189,8 @@ asm (
>  "      st.d    $t0, $sp, 0\n"
>  "      st.d    $ra, $sp, 8\n"
>  "      bl      my_direct_func2\n"
> -"      ld.d    $t0, $sp, 0\n"
> -"      ld.d    $ra, $sp, 8\n"
> +"      ld.d    $ra, $sp, 0\n"
> +"      ld.d    $t0, $sp, 8\n"
>  "      addi.d  $sp, $sp, 16\n"
>  "      jr      $t0\n"
>  "      .size           my_tramp2, .-my_tramp2\n"
> diff --git a/samples/ftrace/ftrace-direct-multi-modify.c b/samples/ftrace=
/ftrace-direct-multi-modify.c
> index 8f7986d698d8..7a7822dfeb50 100644
> --- a/samples/ftrace/ftrace-direct-multi-modify.c
> +++ b/samples/ftrace/ftrace-direct-multi-modify.c
> @@ -199,8 +199,8 @@ asm (
>  "      move    $a0, $t0\n"
>  "      bl      my_direct_func1\n"
>  "      ld.d    $a0, $sp, 0\n"
> -"      ld.d    $t0, $sp, 8\n"
> -"      ld.d    $ra, $sp, 16\n"
> +"      ld.d    $ra, $sp, 8\n"
> +"      ld.d    $t0, $sp, 16\n"
>  "      addi.d  $sp, $sp, 32\n"
>  "      jr      $t0\n"
>  "      .size           my_tramp1, .-my_tramp1\n"
> @@ -215,8 +215,8 @@ asm (
>  "      move    $a0, $t0\n"
>  "      bl      my_direct_func2\n"
>  "      ld.d    $a0, $sp, 0\n"
> -"      ld.d    $t0, $sp, 8\n"
> -"      ld.d    $ra, $sp, 16\n"
> +"      ld.d    $ra, $sp, 8\n"
> +"      ld.d    $t0, $sp, 16\n"
>  "      addi.d  $sp, $sp, 32\n"
>  "      jr      $t0\n"
>  "      .size           my_tramp2, .-my_tramp2\n"
> diff --git a/samples/ftrace/ftrace-direct-multi.c b/samples/ftrace/ftrace=
-direct-multi.c
> index db326c81a27d..3fe6ddaf0b69 100644
> --- a/samples/ftrace/ftrace-direct-multi.c
> +++ b/samples/ftrace/ftrace-direct-multi.c
> @@ -131,8 +131,8 @@ asm (
>  "      move    $a0, $t0\n"
>  "      bl      my_direct_func\n"
>  "      ld.d    $a0, $sp, 0\n"
> -"      ld.d    $t0, $sp, 8\n"
> -"      ld.d    $ra, $sp, 16\n"
> +"      ld.d    $ra, $sp, 8\n"
> +"      ld.d    $t0, $sp, 16\n"
>  "      addi.d  $sp, $sp, 32\n"
>  "      jr      $t0\n"
>  "      .size           my_tramp, .-my_tramp\n"
> diff --git a/samples/ftrace/ftrace-direct-too.c b/samples/ftrace/ftrace-d=
irect-too.c
> index 3d0fa260332d..bf2411aa6fd7 100644
> --- a/samples/ftrace/ftrace-direct-too.c
> +++ b/samples/ftrace/ftrace-direct-too.c
> @@ -143,8 +143,8 @@ asm (
>  "      ld.d    $a0, $sp, 0\n"
>  "      ld.d    $a1, $sp, 8\n"
>  "      ld.d    $a2, $sp, 16\n"
> -"      ld.d    $t0, $sp, 24\n"
> -"      ld.d    $ra, $sp, 32\n"
> +"      ld.d    $ra, $sp, 24\n"
> +"      ld.d    $t0, $sp, 32\n"
>  "      addi.d  $sp, $sp, 48\n"
>  "      jr      $t0\n"
>  "      .size           my_tramp, .-my_tramp\n"
> diff --git a/samples/ftrace/ftrace-direct.c b/samples/ftrace/ftrace-direc=
t.c
> index 956834b0d19a..5368c8c39cbb 100644
> --- a/samples/ftrace/ftrace-direct.c
> +++ b/samples/ftrace/ftrace-direct.c
> @@ -124,8 +124,8 @@ asm (
>  "      st.d    $ra, $sp, 16\n"
>  "      bl      my_direct_func\n"
>  "      ld.d    $a0, $sp, 0\n"
> -"      ld.d    $t0, $sp, 8\n"
> -"      ld.d    $ra, $sp, 16\n"
> +"      ld.d    $ra, $sp, 8\n"
> +"      ld.d    $t0, $sp, 16\n"
>  "      addi.d  $sp, $sp, 32\n"
>  "      jr      $t0\n"
>  "      .size           my_tramp, .-my_tramp\n"
> --
> 2.25.1
>
