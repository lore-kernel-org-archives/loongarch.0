Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C6A149E17
	for <loongarch@lists.linux.dev>; Wed, 17 Sep 2025 03:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758079174; cv=none; b=BMHQYgqooSp29SpjztYtTsz5HHBc03C09f1MUGHtb1KeMTeDPMsYkgctnZtCCO+mjhT6QeHmHh/OwNPpLrKC4tVyJMK4iYiPfkH0nXVZf+mo8iqqN8byOR+FHrJIIm73OOReU30G4LwWUI1hoGCi8B+magXHGgAF9gPEYoAZhRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758079174; c=relaxed/simple;
	bh=6S0gCWOY6kuGDNtwJ/VPKF5jcUq7vUhLxKULHaynLMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FQiD7XgBlqYRQPyKdO8AkHP0ESUZry5yfSFwDU75TV1OtYqDYs2+FRW8UgeiL2UGoTWiH0UyWDabOzkIm1rsR3AHJrHmy1ynx5Mv0k9CZBOwEWWkaMcH0ilRTd2j6rOe3ypKej6H5MkpXgrXIB0JyM/xmkPIAPNky9KvXEjl8hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aLsmDNOL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aLsmDNOL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F03B2C4CEF9
	for <loongarch@lists.linux.dev>; Wed, 17 Sep 2025 03:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758079174;
	bh=6S0gCWOY6kuGDNtwJ/VPKF5jcUq7vUhLxKULHaynLMs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aLsmDNOLFmBW7N7M5/InfnmHvkfOVh434/3YxUAJxTwknAVfuxdtNJltnDcI14Zi9
	 1lROSQDHp+FA2lLFyfH2OhocJMVJEdkklMZ0ju8KwKG7xP0mUyYZqTGj1tXCw4ZLEZ
	 h5Y72Kqyv9pIR6C3J+bBP8f7WDgNeVZp5M/Jlfr9PkrWjP6YS+5SWUJLNT9/S6zcd5
	 Os0U/Iz06Mi3D4MHDvXaowQU6gLLBDn5dQF4dj8vTC3W7UQEWKgVQHOrqApYjocytF
	 UXvDBQ1MJjgorOSC98EoU5paBiBWe+v/6Lu4ST/QUJ4K2fRN+Zt2V5wvlAT4xnuWmC
	 IGdIa3ndCaNXg==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b07c081660aso901758966b.0
        for <loongarch@lists.linux.dev>; Tue, 16 Sep 2025 20:19:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV8bA/p2n9tJn78O0V4XQepvU1Ism0QsoSMdkxT1Yv15JvTLkdfRW+0glzFJ3k5DHX6Vq1bX7iFnEA=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywr4PWkH6E+lARomkWGj6ijkgZeU1k7L2UG1Y+MHLjCir/wGQwA
	RRgi0lEBa3Kw4FEnl+RVvl7lPi9wawoPzPoya1xzzs5K9QXGmysNscbxP3p5BRA9vuXLzAlo0NQ
	4u2+sZUqplas6FAjf4hj7N0/eyTBPh3c=
X-Google-Smtp-Source: AGHT+IF3vk2ScVKXYZNGNlBtmgKvZkklORPzJYbOBDL1PT1ku/va7vtCTEr72l/Gehb7CKv4sb22cBmcL1/j11IH2Xs=
X-Received: by 2002:a17:907:969e:b0:b04:85f2:d26f with SMTP id
 a640c23a62f3a-b1bb73a737bmr98734466b.25.1758079172519; Tue, 16 Sep 2025
 20:19:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250916235627.102831-1-hengqi.chen@gmail.com> <20250916235627.102831-9-hengqi.chen@gmail.com>
In-Reply-To: <20250916235627.102831-9-hengqi.chen@gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 17 Sep 2025 11:19:20 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7oOSWXYjmjXOhvEAcwQnEAs9ZfpdAps83Q=RhP6wcJrw@mail.gmail.com>
X-Gm-Features: AS18NWC_S8aSWVhS1R8lAw0UAPeKgMlZ8CVq8MOzbdw1kfV3txkJo8pA11gEtGY
Message-ID: <CAAhV-H7oOSWXYjmjXOhvEAcwQnEAs9ZfpdAps83Q=RhP6wcJrw@mail.gmail.com>
Subject: Re: [PATCH v5 8/8] LoongArch: BPF: Sign extend struct ops return
 values properly
To: Hengqi Chen <hengqi.chen@gmail.com>
Cc: yangtiezhu@loongson.cn, vincent.mc.li@gmail.com, hejinyang@loongson.cn, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Hengqi,

On Wed, Sep 17, 2025 at 9:56=E2=80=AFAM Hengqi Chen <hengqi.chen@gmail.com>=
 wrote:
>
> The ns_bpf_qdisc selftest triggers a kernel panic:
>
>     CPU 0 Unable to handle kernel paging request at virtual address 00000=
00000741d58, era =3D=3D 90000000851b5ac0, ra =3D=3D 90000000851b5aa4
>     Oops[#1]:
>     CPU: 0 UID: 0 PID: 449 Comm: test_progs Tainted: G           OE      =
 6.16.0+ #3 PREEMPT(full)
>     Tainted: [O]=3DOOT_MODULE, [E]=3DUNSIGNED_MODULE
>     Hardware name: QEMU QEMU Virtual Machine, BIOS unknown 2/2/2022
>     pc 90000000851b5ac0 ra 90000000851b5aa4 tp 90000001076b8000 sp 900000=
01076bb600
>     a0 0000000000741ce8 a1 0000000000000001 a2 90000001076bb5c0 a3 000000=
0000000008
>     a4 90000001004c4620 a5 9000000100741ce8 a6 0000000000000000 a7 010000=
0000000000
>     t0 0000000000000010 t1 0000000000000000 t2 9000000104d24d30 t3 000000=
0000000001
>     t4 4f2317da8a7e08c4 t5 fffffefffc002f00 t6 90000001004c4620 t7 ffffff=
ffc61c5b3d
>     t8 0000000000000000 u0 0000000000000001 s9 0000000000000050 s0 900000=
01075bc800
>     s1 0000000000000040 s2 900000010597c400 s3 0000000000000008 s4 900000=
01075bc880
>     s5 90000001075bc8f0 s6 0000000000000000 s7 0000000000741ce8 s8 000000=
0000000000
>        ra: 90000000851b5aa4 __qdisc_run+0xac/0x8d8
>       ERA: 90000000851b5ac0 __qdisc_run+0xc8/0x8d8
>      CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=3DCC DACM=3DCC -WE)
>      PRMD: 00000004 (PPLV0 +PIE -PWE)
>      EUEN: 00000007 (+FPE +SXE +ASXE -BTE)
>      ECFG: 00071c1d (LIE=3D0,2-4,10-12 VS=3D7)
>     ESTAT: 00010000 [PIL] (IS=3D ECode=3D1 EsubCode=3D0)
>      BADV: 0000000000741d58
>      PRID: 0014c010 (Loongson-64bit, Loongson-3A5000)
>     Modules linked in: bpf_testmod(OE) [last unloaded: bpf_testmod(OE)]
>     Process test_progs (pid: 449, threadinfo=3D000000009af02b3a, task=3D0=
0000000e9ba4956)
>     Stack : 0000000000000000 90000001075bc8ac 90000000869524a8 9000000100=
741ce8
>             90000001075bc800 9000000100415300 90000001075bc8ac 0000000000=
000000
>             900000010597c400 900000008694a000 0000000000000000 9000000105=
b59000
>             90000001075bc800 9000000100741ce8 0000000000000050 9000000085=
13000c
>             9000000086936000 0000000100094d4c fffffff400676208 0000000000=
000000
>             9000000105b59000 900000008694a000 9000000086bf0dc0 9000000105=
b59000
>             9000000086bf0d68 9000000085147010 90000001075be788 0000000000=
000000
>             9000000086bf0f98 0000000000000001 0000000000000010 9000000006=
015840
>             0000000000000000 9000000086be6c40 0000000000000000 0000000000=
000000
>             0000000000000000 4f2317da8a7e08c4 0000000000000101 4f2317da8a=
7e08c4
>             ...
>     Call Trace:
>     [<90000000851b5ac0>] __qdisc_run+0xc8/0x8d8
>     [<9000000085130008>] __dev_queue_xmit+0x578/0x10f0
>     [<90000000853701c0>] ip6_finish_output2+0x2f0/0x950
>     [<9000000085374bc8>] ip6_finish_output+0x2b8/0x448
>     [<9000000085370b24>] ip6_xmit+0x304/0x858
>     [<90000000853c4438>] inet6_csk_xmit+0x100/0x170
>     [<90000000852b32f0>] __tcp_transmit_skb+0x490/0xdd0
>     [<90000000852b47fc>] tcp_connect+0xbcc/0x1168
>     [<90000000853b9088>] tcp_v6_connect+0x580/0x8a0
>     [<90000000852e7738>] __inet_stream_connect+0x170/0x480
>     [<90000000852e7a98>] inet_stream_connect+0x50/0x88
>     [<90000000850f2814>] __sys_connect+0xe4/0x110
>     [<90000000850f2858>] sys_connect+0x18/0x28
>     [<9000000085520c94>] do_syscall+0x94/0x1a0
>     [<9000000083df1fb8>] handle_syscall+0xb8/0x158
>
>     Code: 4001ad80  2400873f  2400832d <240073cc> 001137ff  001133ff  640=
7b41f  001503cc  0280041d
>
>     ---[ end trace 0000000000000000 ]---
>
> The bpf_fifo_dequeue prog returns a skb which is a pointer.
> The pointer is treated as a 32bit value and sign extend to
> 64bit in epilogue. This behavior is right for most bpf prog
> types but wrong for struct ops which requires LoongArch ABI.
>
> So let's sign extend struct ops return values according to
> the LoongArch ABI ([0]) and return value spec in function model.
>
>   [0]: https://loongson.github.io/LoongArch-Documentation/LoongArch-ELF-A=
BI-EN.html
>
> Fixes: 6abf17d690d8 ("LoongArch: BPF: Add struct ops support for trampoli=
ne")
> Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
> ---
>  arch/loongarch/net/bpf_jit.c | 36 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 35 insertions(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
> index 6dba407c202f..6533088c86ba 100644
> --- a/arch/loongarch/net/bpf_jit.c
> +++ b/arch/loongarch/net/bpf_jit.c
> @@ -1451,6 +1451,36 @@ void arch_free_bpf_trampoline(void *image, unsigne=
d int size)
>         bpf_prog_pack_free(image, size);
>  }
>
> +/*
> + * Sign-extend the register if necessary
> + */
> +static void sign_extend(struct jit_ctx *ctx, int rd, int rj, u8 size, u8=
 flags)
> +{
> +       if (!(flags & BTF_FMODEL_SIGNED_ARG) && (size =3D=3D 1 || size =
=3D=3D 2)) {
We don't need to move_reg() for size =3D=3D 4?

And it is better to move this logic to the switch-case block.

Huacai

> +               if (rd !=3D rj)
> +                       move_reg(ctx, rd, rj);
> +               return;
> +       }
> +
> +       switch (size) {
> +       case 1:
> +               emit_insn(ctx, extwb, rd, rj);
> +               break;
> +       case 2:
> +               emit_insn(ctx, extwh, rd, rj);
> +               break;
> +       case 4:
> +               emit_insn(ctx, addiw, rd, rj, 0);
> +               break;
> +       case 8:
> +               if (rd !=3D rj)
> +                       move_reg(ctx, rd, rj);
> +               break;
> +       default:
> +               pr_warn("bpf_jit: invalid size %d for sign_extend\n", siz=
e);
> +       }
> +}
> +
>  static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, struct bpf=
_tramp_image *im,
>                                          const struct btf_func_model *m, =
struct bpf_tramp_links *tlinks,
>                                          void *func_addr, u32 flags)
> @@ -1659,8 +1689,12 @@ static int __arch_prepare_bpf_trampoline(struct ji=
t_ctx *ctx, struct bpf_tramp_i
>                 restore_args(ctx, m->nr_args, args_off);
>
>         if (save_ret) {
> -               emit_insn(ctx, ldd, LOONGARCH_GPR_A0, LOONGARCH_GPR_FP, -=
retval_off);
>                 emit_insn(ctx, ldd, regmap[BPF_REG_0], LOONGARCH_GPR_FP, =
-(retval_off - 8));
> +               if (is_struct_ops)
> +                       sign_extend(ctx, LOONGARCH_GPR_A0, regmap[BPF_REG=
_0],
> +                                   m->ret_size, m->ret_flags);
> +               else
> +                       emit_insn(ctx, ldd, LOONGARCH_GPR_A0, LOONGARCH_G=
PR_FP, -retval_off);
>         }
>
>         emit_insn(ctx, ldd, LOONGARCH_GPR_S1, LOONGARCH_GPR_FP, -sreg_off=
);
> --
> 2.43.5
>
