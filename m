Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E944920B22
	for <loongarch@lists.linux.dev>; Thu, 28 Aug 2025 09:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756373076; cv=none; b=ioR8g+DRfrYvyAHtOoXojbnDUtaYMODIc/XO9iG6ZpPdQ2AtwZDP13SwMf2JyyOdPTAQSUEIgkYZziLAuS2Ss3wr3uZTyjRg9Z0+uIbO/v9pndijefqnCWzN92ZHRNfm7CVNOQzqVFyzGd9XrVYSWB9XSIOIvTY/qBxd8jxOxSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756373076; c=relaxed/simple;
	bh=Ib4NfGmrQJX9P35EE+eLxssXTGZdi8t/GoO6BvM9kmQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cLvwQiaI8EdBW6RwswFFyA9l7x6EBBSAthh+XwkOl8GnQ9OtOMniIVmTxWXrPeYRN9azL/suasICn51eYYr6BaY1kj3LFK+1HY9Te25olLIyGvvHvM3UZODRRYZZOsXSUN7c36am46g4g1Vm5w1ihVn2HDM8lNcbrQsHxDFquxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I1fUwMe0; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I1fUwMe0"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7454fee9da0so83554a34.3
        for <loongarch@lists.linux.dev>; Thu, 28 Aug 2025 02:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756373074; x=1756977874; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Quc6I6Su9WvgTjecf2EdrBlaVUYn6U2V55JHRDMWt1I=;
        b=I1fUwMe0HDQJwGGY0OGHMjioRPiECC8vKystWHqR31oxOWE1apkAHm2/1xPlZPN8W1
         im7T/xIrrCIQ0lNDALl52QDW0YrMf8MDYRhdFJ19Sbpb/BUBHoGCWZ2K3pLYMHjqXFXU
         YwzXyX1oir7d3DYlSf+riZo3x8cLKtET5x8LMRGYWt0xnGcnrnGkppPDwqPdidjTf14u
         lDMwRFxt4OhvmhmAWnkfgJt9glzsr8Ogjjw4NZ5UXvlE3DVsZUh4cse6UcRd13Kc0G5T
         bCWi56/coChDR1mcPdEHII1WyhbvxmpQ05QYnGv8tqtZjxUvR0l41LHjcI9FtCiOELtB
         RXbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756373074; x=1756977874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Quc6I6Su9WvgTjecf2EdrBlaVUYn6U2V55JHRDMWt1I=;
        b=JAFDX6D8ppthek63nGaddazoCDwON5tg0xLgLEU7WKrRK5wIfrf1uv0m9WHECnn4VL
         jGaKX1rlnthJ14lZrYKNfKODm9HcpdZjx9zZYMxS/Z3i86F1+TBxJ8buOb1NGgA1wd/f
         iqhAOoJKuCouSqKgCNDSNa6e5zxmq3vDKFBOUBh4jfiZ7qAYrij4k1cDO7Y5s5DU7SWT
         FTw5xvTC+zawu1Di90M7+p1urSZfNAyjs0zW7wSggYpC9b4jHSrjuSQtsPfYYK042CfT
         qTvDiXy6+XDNsYRQy8gmRyKWJMaPh6UoU8M966oeY7w83q3twpjUNg7TvvYaAivupoFi
         Vaiw==
X-Forwarded-Encrypted: i=1; AJvYcCWgLfaelm/r4DJZQKxSAjfKcAD4oQgToqgDrF1r5VJlYXKOOzZJEgpMZQ00akMp+O2cTXXi/Trs4Hg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxe+0U7lcxdOZXpuTo27YLWZXBdk9xuXih0zgxs7egcS9YBPUjl
	bI2vDyFz6D/2sGmXBEslBT8JjGd7+A9XjbUgUX14BGp+HoYBkNNtMDKCKMc5IXayGgDqOoF3zy8
	Npp5UPH47McrXeI4xleR4Z13UnQzGYsw=
X-Gm-Gg: ASbGnctI1J1D1p+rmVaAZmph9lNlrlfLtUIYRqfIKRKjzbXhBHCa6S5Mlnrnf6WtRGc
	bcvnhtdVw6MEvUG7q3sC0fgt8X1NNLrLc9xFKKPsnlEsoKXtUM+bPy/F0AfDooEoEOZYNxY6sJV
	X8GGWpWIMCpgBmbp3cBtj/QgMVDhWrEibKJJz4aFhgOoB0ClgIr+yfG4+VH7POlXLqFVAq16DYF
	2DFavLBquEZxTb9vQ==
X-Google-Smtp-Source: AGHT+IFERU330xTzKRCpvZPUubftKsdMVPj99p/W7kFLYg9PWOX8/m9hU06+De/gWAxDsjRVtZel2FkTdxPMRXOh+yM=
X-Received: by 2002:a05:6808:bcd:b0:437:7574:abb5 with SMTP id
 5614622812f47-4378539685cmr9834388b6e.47.1756373073787; Thu, 28 Aug 2025
 02:24:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250827094733.426839-1-hengqi.chen@gmail.com>
 <20250827094733.426839-3-hengqi.chen@gmail.com> <9cf3a423-6d7d-91ae-d9af-3587fad9b70b@loongson.cn>
In-Reply-To: <9cf3a423-6d7d-91ae-d9af-3587fad9b70b@loongson.cn>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Thu, 28 Aug 2025 17:24:22 +0800
X-Gm-Features: Ac12FXy_IoKndpmGki_M8UcbCd7gMkgmE9HTW97-9jlwVuiMq7zRk1OQh--KOyo
Message-ID: <CAEyhmHQodsW4WTOezi73-chmutoAxM-2qAdTO6NkYQ7brq2iQA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] LoongArch: BPF: Sign extend struct ops return
 values properly
To: Jinyang He <hejinyang@loongson.cn>
Cc: chenhuacai@kernel.org, yangtiezhu@loongson.cn, jianghaoran@kylinos.cn, 
	duanchenghao@kylinos.cn, ast@kernel.org, daniel@iogearbox.net, 
	andrii@kernel.org, martin.lau@linux.dev, vincent.mc.li@gmail.com, 
	bpf@vger.kernel.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 28, 2025 at 2:11=E2=80=AFPM Jinyang He <hejinyang@loongson.cn> =
wrote:
>
> On 2025-08-27 17:47, Hengqi Chen wrote:
>
> > The ns_bpf_qdisc selftest triggers a kernel panic:
> >
> >      CPU 0 Unable to handle kernel paging request at virtual address 00=
00000000741d58, era =3D=3D 90000000851b5ac0, ra =3D=3D 90000000851b5aa4
> >      Oops[#1]:
> >      CPU: 0 UID: 0 PID: 449 Comm: test_progs Tainted: G           OE   =
    6.16.0+ #3 PREEMPT(full)
> >      Tainted: [O]=3DOOT_MODULE, [E]=3DUNSIGNED_MODULE
> >      Hardware name: QEMU QEMU Virtual Machine, BIOS unknown 2/2/2022
> >      pc 90000000851b5ac0 ra 90000000851b5aa4 tp 90000001076b8000 sp 900=
00001076bb600
> >      a0 0000000000741ce8 a1 0000000000000001 a2 90000001076bb5c0 a3 000=
0000000000008
> >      a4 90000001004c4620 a5 9000000100741ce8 a6 0000000000000000 a7 010=
0000000000000
> >      t0 0000000000000010 t1 0000000000000000 t2 9000000104d24d30 t3 000=
0000000000001
> >      t4 4f2317da8a7e08c4 t5 fffffefffc002f00 t6 90000001004c4620 t7 fff=
fffffc61c5b3d
> >      t8 0000000000000000 u0 0000000000000001 s9 0000000000000050 s0 900=
00001075bc800
> >      s1 0000000000000040 s2 900000010597c400 s3 0000000000000008 s4 900=
00001075bc880
> >      s5 90000001075bc8f0 s6 0000000000000000 s7 0000000000741ce8 s8 000=
0000000000000
> >         ra: 90000000851b5aa4 __qdisc_run+0xac/0x8d8
> >        ERA: 90000000851b5ac0 __qdisc_run+0xc8/0x8d8
> >       CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=3DCC DACM=3DCC -WE)
> >       PRMD: 00000004 (PPLV0 +PIE -PWE)
> >       EUEN: 00000007 (+FPE +SXE +ASXE -BTE)
> >       ECFG: 00071c1d (LIE=3D0,2-4,10-12 VS=3D7)
> >      ESTAT: 00010000 [PIL] (IS=3D ECode=3D1 EsubCode=3D0)
> >       BADV: 0000000000741d58
> >       PRID: 0014c010 (Loongson-64bit, Loongson-3A5000)
> >      Modules linked in: bpf_testmod(OE) [last unloaded: bpf_testmod(OE)=
]
> >      Process test_progs (pid: 449, threadinfo=3D000000009af02b3a, task=
=3D00000000e9ba4956)
> >      Stack : 0000000000000000 90000001075bc8ac 90000000869524a8 9000000=
100741ce8
> >              90000001075bc800 9000000100415300 90000001075bc8ac 0000000=
000000000
> >              900000010597c400 900000008694a000 0000000000000000 9000000=
105b59000
> >              90000001075bc800 9000000100741ce8 0000000000000050 9000000=
08513000c
> >              9000000086936000 0000000100094d4c fffffff400676208 0000000=
000000000
> >              9000000105b59000 900000008694a000 9000000086bf0dc0 9000000=
105b59000
> >              9000000086bf0d68 9000000085147010 90000001075be788 0000000=
000000000
> >              9000000086bf0f98 0000000000000001 0000000000000010 9000000=
006015840
> >              0000000000000000 9000000086be6c40 0000000000000000 0000000=
000000000
> >              0000000000000000 4f2317da8a7e08c4 0000000000000101 4f2317d=
a8a7e08c4
> >              ...
> >      Call Trace:
> >      [<90000000851b5ac0>] __qdisc_run+0xc8/0x8d8
> >      [<9000000085130008>] __dev_queue_xmit+0x578/0x10f0
> >      [<90000000853701c0>] ip6_finish_output2+0x2f0/0x950
> >      [<9000000085374bc8>] ip6_finish_output+0x2b8/0x448
> >      [<9000000085370b24>] ip6_xmit+0x304/0x858
> >      [<90000000853c4438>] inet6_csk_xmit+0x100/0x170
> >      [<90000000852b32f0>] __tcp_transmit_skb+0x490/0xdd0
> >      [<90000000852b47fc>] tcp_connect+0xbcc/0x1168
> >      [<90000000853b9088>] tcp_v6_connect+0x580/0x8a0
> >      [<90000000852e7738>] __inet_stream_connect+0x170/0x480
> >      [<90000000852e7a98>] inet_stream_connect+0x50/0x88
> >      [<90000000850f2814>] __sys_connect+0xe4/0x110
> >      [<90000000850f2858>] sys_connect+0x18/0x28
> >      [<9000000085520c94>] do_syscall+0x94/0x1a0
> >      [<9000000083df1fb8>] handle_syscall+0xb8/0x158
> >
> >      Code: 4001ad80  2400873f  2400832d <240073cc> 001137ff  001133ff  =
6407b41f  001503cc  0280041d
> >
> >      ---[ end trace 0000000000000000 ]---
> >
> > The bpf_fifo_dequeue prog returns a skb which is a pointer.
> > The pointer is treated as a 32bit value and sign extend to
> > 64bit in epilogue. This behavior is right for most bpf prog
> > types but wrong for struct ops which requires LoongArch ABI.
> >
> > So let's sign extend struct ops return values according to
> > the return value spec in function model.
> >
> > Fixes: 6abf17d690d8 ("LoongArch: BPF: Add struct ops support for trampo=
line")
> > Tested-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> > Tested-by: Vincent Li <vincent.mc.li@gmail.com>
> > Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
> > ---
> >   arch/loongarch/net/bpf_jit.c | 26 ++++++++++++++++++++++++++
> >   1 file changed, 26 insertions(+)
> >
> > diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.=
c
> > index b646c6b73014..c239e5ed0c92 100644
> > --- a/arch/loongarch/net/bpf_jit.c
> > +++ b/arch/loongarch/net/bpf_jit.c
> > @@ -1448,6 +1448,28 @@ void arch_free_bpf_trampoline(void *image, unsig=
ned int size)
> >       bpf_prog_pack_free(image, size);
> >   }
> >
> > +/*
> > + * Sign-extend the register if necessary
> > + */
> > +static void sign_extend(struct jit_ctx *ctx, int r, u8 size)
> > +{
> > +     switch (size) {
> > +     case 1:
> > +             emit_insn(ctx, extwb, r, r);
> > +             break;
> > +     case 2:
> > +             emit_insn(ctx, extwh, r, r);
> > +             break;
> > +     case 4:
> > +             emit_insn(ctx, addiw, r, r, 0);
> > +             break;
> > +     case 8:
> > +             break;
> > +     default:
> > +             pr_warn("bpf_jit: invalid size %d for sign_extend\n", siz=
e);
> > +     }
> > +}
> > +
> >   static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, struct =
bpf_tramp_image *im,
> >                                        const struct btf_func_model *m, =
struct bpf_tramp_links *tlinks,
> >                                        void *func_addr, u32 flags)
> > @@ -1654,6 +1676,10 @@ static int __arch_prepare_bpf_trampoline(struct =
jit_ctx *ctx, struct bpf_tramp_i
> >       if (save_ret) {
> >               emit_insn(ctx, ldd, LOONGARCH_GPR_A0, LOONGARCH_GPR_FP, -=
retval_off);
> >               emit_insn(ctx, ldd, regmap[BPF_REG_0], LOONGARCH_GPR_FP, =
-(retval_off - 8));
> > +             if (is_struct_ops) {
> > +                     move_reg(ctx, LOONGARCH_GPR_A0, regmap[BPF_REG_0]=
);
> > +                     sign_extend(ctx, LOONGARCH_GPR_A0, m->ret_size);
> > +             }
> >       }
> Hi, Hengqi,
>
> It can be did same as Tiezhu's patch, named "LoongArch: BPF: Optimize
> sign-extention mov instructions", which use only one sign-extend
> instruction.
>
> And btw, how about,
> if (save_ret) {
>    if (is_struct_ops) {
>      ld.{d,w,h,b} LOONGARCH_GPR_A0, LOONGARCH_GPR_FP, -(retval_off - 8)
>      emit_insn(ctx, ldd, regmap[BPF_REG_0], LOONGARCH_GPR_FP,
> -(retval_off - 8)); // I don't know is it needed.
>    } else {
>      emit_insn(ctx, ldd, LOONGARCH_GPR_A0, LOONGARCH_GPR_FP, -retval_off)=
;
>      emit_insn(ctx, ldd, regmap[BPF_REG_0], LOONGARCH_GPR_FP,
> -(retval_off - 8));
>    }

Hmm, how about:

static void sign_extend(struct jit_ctx *ctx, int rd, int rj, u8 size)

and sign extend regmap[BPF_REG_0] to LOONGARCH_GPR_A0

> }
> >
> >       emit_insn(ctx, ldd, LOONGARCH_GPR_S1, LOONGARCH_GPR_FP, -sreg_off=
);
>
