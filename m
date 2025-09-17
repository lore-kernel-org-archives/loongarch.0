Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACC8BA42
	for <loongarch@lists.linux.dev>; Wed, 17 Sep 2025 05:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758087269; cv=none; b=Gw9lPSkWys3mgYQqa8h+So3vXfVE4BAbAVlFXoRo0pKI+X2Xp92+rj3m0bohnepaIhu31TTK85XLKOwIHSjEUOz7a+qcy29tA+EKFL+MvCCYezFsYBKKtHmO7qZL5+EYq5swNswuMF0vq4yMyUteFcQnfuh4gyigwFl53inBnUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758087269; c=relaxed/simple;
	bh=1uzWEU2n2vxr1OMlmYbiQk3oxeizxr/uMed+6cfte9k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pOijORuXq7t9+FEiIkjViKILuyWZe/tlAwOln+ap4c8wefPs0T+sV1c2OlJdSUyPo00dJws0T/Kwufx30DCe5uAy7dCoYnigXPqwBn7a7HbsosFoL4OWa3afBXOBG6xgsLyzBZw/97hWLII2WaYrQwpjW/eBWS1SwZcynJZas6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZtcSJAk1; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZtcSJAk1"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-331e80c3985so3441478fac.3
        for <loongarch@lists.linux.dev>; Tue, 16 Sep 2025 22:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758087266; x=1758692066; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KVgqbFzZq/p4neP1CdZOmw/K9sa7eTaKLtFMzO8QVSc=;
        b=ZtcSJAk1JS6+cszMx0u/sHwEz8UJQIk1+2ca6WftQehoxhwOtMnqcx42ioaPnNjA92
         imbrreSXwb540Fk/zlrGCLnNcm5rG9XGOWU9xETCR83WZXG9pZSbUmPCSMSL7RZXicEE
         5j07z8GFpYtSZ79Y3b07OwivDLkV37ZeuVDoPzTQXjC/34kwyALXplCcn4ynVbNHzcv7
         AGhb+7/Do+hss0l1APfOooxGAcRgyjc9De3lC03oYC6gN3jMbfCIRdqQtSPtZ51RkqZG
         1n0eAkFriRKMpziBRJjlEJnW4hSC+Ttpu3JKqCRGEpasxSw9isisMY/Ch4H0b65L8c0I
         9oUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758087266; x=1758692066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KVgqbFzZq/p4neP1CdZOmw/K9sa7eTaKLtFMzO8QVSc=;
        b=JeAH1uit8njdYwXvM2qdjrlb9pU8RL3R5+mgeln3p+v6C5cUft9T0sMo0IEOmdRvCV
         DtCemcGeGNbIael1jEivaFvWRo0+yWHxrdWcSsr2dFqVJu/nUwhV5d0a87/XEee4+e09
         2ASySm/LjSE9AW4CLmn8EGZx2UUqiXTH+B+lewdmKXtEm7rZ2rgQyQjHNKG3JP9MqSaH
         /Y604781qxFv4Slu1g0CgYL86fFp6HOailzzLNRnAE2KjyO/0E2iJMZlGDzxL30sLX0X
         d8v9bQU5GfOLECaYSjDxbu66hNEiEudJb5b26LuAFTIPEBucwhrZ2kbwLBuaYYFHOSEq
         rekA==
X-Forwarded-Encrypted: i=1; AJvYcCVO21AhxKlUMZH7KMCl2PvTY2iNaJn1S3Qs6qFogA/X66bUlb5MB7BluC81Mdo7rtRayV/Rukmn3Es=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2aWnzuLUXUO6UBbLmBwj7a3C7WIM7O11hvr13IdulLSXe8UKP
	8wO74G7oeEkJjdEg5dRGbOpJIi909LFEl961/0LSmvVuswezxivcrs78Njt6MmE8TiX6nmA/mmI
	gZAHX647J6UnbxsLsczhGhQM5jpOO5lU=
X-Gm-Gg: ASbGncvRovTmePMO75Eqc8yPrP2dWFpATc+kFXN9qecNAATHU/HZ/YGBFKu9jsZ09w0
	ADKhfQ8/HvNISVR1HgdLNY7rqx0LixAJh6S/BO3yaS77vBgcj9bh00t9vn2NR+eGh93Nfox3c0n
	dYJYpMCZirB/vh8LG0vxpzvTklNK1yfpuaICbM8xkXGcWW4YQrMVABEn/jU1xY3dMsvoouWw05a
	upTZnk=
X-Google-Smtp-Source: AGHT+IFAn//hz2o2CIl+qtYYyb8uJXJ7xypmv+tNsI8KFYupCMEed7xbZXJiu+IRjVtF5TtkMViKOif3tPB7YU0QsXk=
X-Received: by 2002:a05:6870:322c:b0:31a:eb87:75b8 with SMTP id
 586e51a60fabf-335bfa3aabcmr509188fac.37.1758087266358; Tue, 16 Sep 2025
 22:34:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250916235627.102831-1-hengqi.chen@gmail.com>
 <20250916235627.102831-9-hengqi.chen@gmail.com> <CAAhV-H7oOSWXYjmjXOhvEAcwQnEAs9ZfpdAps83Q=RhP6wcJrw@mail.gmail.com>
In-Reply-To: <CAAhV-H7oOSWXYjmjXOhvEAcwQnEAs9ZfpdAps83Q=RhP6wcJrw@mail.gmail.com>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Wed, 17 Sep 2025 13:34:14 +0800
X-Gm-Features: AS18NWA9z4V_uQqJYxTaPtwTchGITdu_YjPMR-cWSPfwBjIPX7rlmJJjp5zlCDQ
Message-ID: <CAEyhmHSwVTbYHdSVGyZ4wf-Sv+rhe2rF4L9H+6oOh97CU7jE1Q@mail.gmail.com>
Subject: Re: [PATCH v5 8/8] LoongArch: BPF: Sign extend struct ops return
 values properly
To: Huacai Chen <chenhuacai@kernel.org>
Cc: yangtiezhu@loongson.cn, vincent.mc.li@gmail.com, hejinyang@loongson.cn, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 17, 2025 at 11:19=E2=80=AFAM Huacai Chen <chenhuacai@kernel.org=
> wrote:
>
> Hi, Hengqi,
>
> On Wed, Sep 17, 2025 at 9:56=E2=80=AFAM Hengqi Chen <hengqi.chen@gmail.co=
m> wrote:
> >
> > The ns_bpf_qdisc selftest triggers a kernel panic:
> >
> >     CPU 0 Unable to handle kernel paging request at virtual address 000=
0000000741d58, era =3D=3D 90000000851b5ac0, ra =3D=3D 90000000851b5aa4
> >     Oops[#1]:
> >     CPU: 0 UID: 0 PID: 449 Comm: test_progs Tainted: G           OE    =
   6.16.0+ #3 PREEMPT(full)
> >     Tainted: [O]=3DOOT_MODULE, [E]=3DUNSIGNED_MODULE
> >     Hardware name: QEMU QEMU Virtual Machine, BIOS unknown 2/2/2022
> >     pc 90000000851b5ac0 ra 90000000851b5aa4 tp 90000001076b8000 sp 9000=
0001076bb600
> >     a0 0000000000741ce8 a1 0000000000000001 a2 90000001076bb5c0 a3 0000=
000000000008
> >     a4 90000001004c4620 a5 9000000100741ce8 a6 0000000000000000 a7 0100=
000000000000
> >     t0 0000000000000010 t1 0000000000000000 t2 9000000104d24d30 t3 0000=
000000000001
> >     t4 4f2317da8a7e08c4 t5 fffffefffc002f00 t6 90000001004c4620 t7 ffff=
ffffc61c5b3d
> >     t8 0000000000000000 u0 0000000000000001 s9 0000000000000050 s0 9000=
0001075bc800
> >     s1 0000000000000040 s2 900000010597c400 s3 0000000000000008 s4 9000=
0001075bc880
> >     s5 90000001075bc8f0 s6 0000000000000000 s7 0000000000741ce8 s8 0000=
000000000000
> >        ra: 90000000851b5aa4 __qdisc_run+0xac/0x8d8
> >       ERA: 90000000851b5ac0 __qdisc_run+0xc8/0x8d8
> >      CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=3DCC DACM=3DCC -WE)
> >      PRMD: 00000004 (PPLV0 +PIE -PWE)
> >      EUEN: 00000007 (+FPE +SXE +ASXE -BTE)
> >      ECFG: 00071c1d (LIE=3D0,2-4,10-12 VS=3D7)
> >     ESTAT: 00010000 [PIL] (IS=3D ECode=3D1 EsubCode=3D0)
> >      BADV: 0000000000741d58
> >      PRID: 0014c010 (Loongson-64bit, Loongson-3A5000)
> >     Modules linked in: bpf_testmod(OE) [last unloaded: bpf_testmod(OE)]
> >     Process test_progs (pid: 449, threadinfo=3D000000009af02b3a, task=
=3D00000000e9ba4956)
> >     Stack : 0000000000000000 90000001075bc8ac 90000000869524a8 90000001=
00741ce8
> >             90000001075bc800 9000000100415300 90000001075bc8ac 00000000=
00000000
> >             900000010597c400 900000008694a000 0000000000000000 90000001=
05b59000
> >             90000001075bc800 9000000100741ce8 0000000000000050 90000000=
8513000c
> >             9000000086936000 0000000100094d4c fffffff400676208 00000000=
00000000
> >             9000000105b59000 900000008694a000 9000000086bf0dc0 90000001=
05b59000
> >             9000000086bf0d68 9000000085147010 90000001075be788 00000000=
00000000
> >             9000000086bf0f98 0000000000000001 0000000000000010 90000000=
06015840
> >             0000000000000000 9000000086be6c40 0000000000000000 00000000=
00000000
> >             0000000000000000 4f2317da8a7e08c4 0000000000000101 4f2317da=
8a7e08c4
> >             ...
> >     Call Trace:
> >     [<90000000851b5ac0>] __qdisc_run+0xc8/0x8d8
> >     [<9000000085130008>] __dev_queue_xmit+0x578/0x10f0
> >     [<90000000853701c0>] ip6_finish_output2+0x2f0/0x950
> >     [<9000000085374bc8>] ip6_finish_output+0x2b8/0x448
> >     [<9000000085370b24>] ip6_xmit+0x304/0x858
> >     [<90000000853c4438>] inet6_csk_xmit+0x100/0x170
> >     [<90000000852b32f0>] __tcp_transmit_skb+0x490/0xdd0
> >     [<90000000852b47fc>] tcp_connect+0xbcc/0x1168
> >     [<90000000853b9088>] tcp_v6_connect+0x580/0x8a0
> >     [<90000000852e7738>] __inet_stream_connect+0x170/0x480
> >     [<90000000852e7a98>] inet_stream_connect+0x50/0x88
> >     [<90000000850f2814>] __sys_connect+0xe4/0x110
> >     [<90000000850f2858>] sys_connect+0x18/0x28
> >     [<9000000085520c94>] do_syscall+0x94/0x1a0
> >     [<9000000083df1fb8>] handle_syscall+0xb8/0x158
> >
> >     Code: 4001ad80  2400873f  2400832d <240073cc> 001137ff  001133ff  6=
407b41f  001503cc  0280041d
> >
> >     ---[ end trace 0000000000000000 ]---
> >
> > The bpf_fifo_dequeue prog returns a skb which is a pointer.
> > The pointer is treated as a 32bit value and sign extend to
> > 64bit in epilogue. This behavior is right for most bpf prog
> > types but wrong for struct ops which requires LoongArch ABI.
> >
> > So let's sign extend struct ops return values according to
> > the LoongArch ABI ([0]) and return value spec in function model.
> >
> >   [0]: https://loongson.github.io/LoongArch-Documentation/LoongArch-ELF=
-ABI-EN.html
> >
> > Fixes: 6abf17d690d8 ("LoongArch: BPF: Add struct ops support for trampo=
line")
> > Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
> > ---
> >  arch/loongarch/net/bpf_jit.c | 36 +++++++++++++++++++++++++++++++++++-
> >  1 file changed, 35 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.=
c
> > index 6dba407c202f..6533088c86ba 100644
> > --- a/arch/loongarch/net/bpf_jit.c
> > +++ b/arch/loongarch/net/bpf_jit.c
> > @@ -1451,6 +1451,36 @@ void arch_free_bpf_trampoline(void *image, unsig=
ned int size)
> >         bpf_prog_pack_free(image, size);
> >  }
> >
> > +/*
> > + * Sign-extend the register if necessary
> > + */
> > +static void sign_extend(struct jit_ctx *ctx, int rd, int rj, u8 size, =
u8 flags)
> > +{
> > +       if (!(flags & BTF_FMODEL_SIGNED_ARG) && (size =3D=3D 1 || size =
=3D=3D 2)) {
> We don't need to move_reg() for size =3D=3D 4?
>

The ABI says that unsigned char/short should be zero-extended.
But int (both signed and unsigned) should be signed-extended.

> And it is better to move this logic to the switch-case block.
>

I tried, it looks more complicated than the current approach.
FYI, I've done similar fix for riscv ([0]).

  [0]: https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/com=
mit/?id=3Dfd2e08128944a7679e753f920e9eda72057e427c

> Huacai
>
> > +               if (rd !=3D rj)
> > +                       move_reg(ctx, rd, rj);
> > +               return;
> > +       }
> > +
> > +       switch (size) {
> > +       case 1:
> > +               emit_insn(ctx, extwb, rd, rj);
> > +               break;
> > +       case 2:
> > +               emit_insn(ctx, extwh, rd, rj);
> > +               break;
> > +       case 4:
> > +               emit_insn(ctx, addiw, rd, rj, 0);
> > +               break;
> > +       case 8:
> > +               if (rd !=3D rj)
> > +                       move_reg(ctx, rd, rj);
> > +               break;
> > +       default:
> > +               pr_warn("bpf_jit: invalid size %d for sign_extend\n", s=
ize);
> > +       }
> > +}
> > +
> >  static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, struct b=
pf_tramp_image *im,
> >                                          const struct btf_func_model *m=
, struct bpf_tramp_links *tlinks,
> >                                          void *func_addr, u32 flags)
> > @@ -1659,8 +1689,12 @@ static int __arch_prepare_bpf_trampoline(struct =
jit_ctx *ctx, struct bpf_tramp_i
> >                 restore_args(ctx, m->nr_args, args_off);
> >
> >         if (save_ret) {
> > -               emit_insn(ctx, ldd, LOONGARCH_GPR_A0, LOONGARCH_GPR_FP,=
 -retval_off);
> >                 emit_insn(ctx, ldd, regmap[BPF_REG_0], LOONGARCH_GPR_FP=
, -(retval_off - 8));
> > +               if (is_struct_ops)
> > +                       sign_extend(ctx, LOONGARCH_GPR_A0, regmap[BPF_R=
EG_0],
> > +                                   m->ret_size, m->ret_flags);
> > +               else
> > +                       emit_insn(ctx, ldd, LOONGARCH_GPR_A0, LOONGARCH=
_GPR_FP, -retval_off);
> >         }
> >
> >         emit_insn(ctx, ldd, LOONGARCH_GPR_S1, LOONGARCH_GPR_FP, -sreg_o=
ff);
> > --
> > 2.43.5
> >
