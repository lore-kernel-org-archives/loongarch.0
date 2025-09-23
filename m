Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCEA31DD82
	for <loongarch@lists.linux.dev>; Tue, 23 Sep 2025 08:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758617291; cv=none; b=CNTFXMzQHC1pWyGRFF2b4z0iCusbJnbqPW5RF3ic7mUcA2GRxRBirMoo6JsvSX4biTGkio556nglkjRaOH3qqAeemvaWeNirC9yI3S7WPvZJG0rhC4K+ydfMRou4zEejMZ7mK6PVf9ZXCr50g09pPkdPw2SfZhJboER/vuUDrJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758617291; c=relaxed/simple;
	bh=9Pn+/xjM2TZckK8mFZxu/8lK+u70WOQjToRoc4+Trbw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FywucQK44kqB+9fT+FzeNZojXkICN8XuuOS0opUdHgU4iahlfXkVavJMTcM4oMJeaxmQvn3A5yU4eToKS3g2D4cX/9Dm/vRmRLJeqGULpfKktDKyy2jAP9IcP9sakexGriSfv1BYhaf2C+lAIHjZlrbaqKuzoqCHOd/24UnWusA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bUIU0T7G; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bUIU0T7G"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-30cceb3be82so4507281fac.2
        for <loongarch@lists.linux.dev>; Tue, 23 Sep 2025 01:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758617289; x=1759222089; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBKkjjz4JIp5ioZXg7kCjm0onUIbsGfmtZ8C//eZ6/4=;
        b=bUIU0T7GD7T8GfTS4KiLJAuYKOB+N9d9p0PyRdMYK/KxWEAtuw76Z37ey5eqDeVO4W
         YQlb6ny3zIcitzRyyNaVKti/IiTAMJD+jmaTlnNqlGPyS8HhWZ/TStZThaUkqd8QPSTR
         K+A/g2Cj2kNC1iuQIbSnERv59naUMzFnbiZHi1FigsnKhnDJ22vaKWaVzj2GBMtOxvhh
         D4kqTbTEZHgSdFx/yqdXC9HYfy54HPXYNGieYH7+P5a1Ptz8Kj3UNaOj8r5P7fOJn0FF
         rWDEsQ96EFY62LMmZMhPoch8HDrF9Jpm0r77D3OgDhK+G16/yDzgMcDAzdyol4IsyFPM
         BYQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758617289; x=1759222089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GBKkjjz4JIp5ioZXg7kCjm0onUIbsGfmtZ8C//eZ6/4=;
        b=A3S7oRJVB1l18D1Y6SmlU+FFyYGbW/0R0hJKkvnnH1WTDB5rerorwJf32TbLke7WpJ
         LdFJ+tmUUm817cmNaI29c/OVptLFqz9U28/4cMBuKIan9pxO5tHRIOfMtYgVATKE9KQO
         qwrZamy3KcZF835ZGT1R4d3tkWWfulhy2xA0yCwpsik6euYedvuF7y7kg5JfvMK49H4l
         if+7Gk13hQbwVYBKb6tqI4BH4pUaC89ganGEXp36BFmh237jt7KuaY5wzOqpaQwGBQqu
         04DiBbkJZcffJAhrZdKzC70lyM8U1JaEqtFNQu0SQ0X3s1EIK6DsXHHfNJo+rOuHi3jj
         1Jgw==
X-Forwarded-Encrypted: i=1; AJvYcCU3i5bOKIsLPxK9s74tPhvN/m2VJ7UKUUWIvEF4FIEmg4tZLJ/mpiGvIiasfjvl6sWu/1yIPImAJEg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzB3sy8fT2/SrJhYme3iGz3YziYFCjNiQ7xsAOkubqcL0438Jb8
	NomlHzpphaAQssKuJSKNhmoCtq3khmztgbSCfURhJjshdB77P5PvfaovO/EKHiJTt/nLIN9Gqik
	i8gyY7J1qJdZvDB7cvQwbSEju+Tc/nNk=
X-Gm-Gg: ASbGnctwQMZNIMyUfB+xvXhBg76D1F4PswtuoVslbNKP69bk0sHHktpolGZvkufS/CM
	qFN3BwKBtqVfOQ2gmMEAXxj6utC8Dukc1TieJl9sCmvCAK2YMCAF5gDH8EMIfxOWgYtfPnROnxN
	Bnt8hC1G30q/lVdz7MsqVj1wZPxlFHK8v1VDwSxgFdWh1o9+lg5BuFQLBXZDf+TQ5DiVOMU/POE
	xvpy04=
X-Google-Smtp-Source: AGHT+IFukBup9pT9P+90Cw9AqDdyqfzWNUZcsjl+y16EcH9M5UZswl5md0PsT1e2ADGAgf5sP/+doLQvzXQaQ4Qn9tE=
X-Received: by 2002:a05:6870:b491:b0:348:4ee3:1592 with SMTP id
 586e51a60fabf-34c87d91f0cmr804943fac.34.1758617288930; Tue, 23 Sep 2025
 01:48:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250916235627.102831-1-hengqi.chen@gmail.com>
 <20250916235627.102831-9-hengqi.chen@gmail.com> <CAAhV-H7oOSWXYjmjXOhvEAcwQnEAs9ZfpdAps83Q=RhP6wcJrw@mail.gmail.com>
 <CAEyhmHSwVTbYHdSVGyZ4wf-Sv+rhe2rF4L9H+6oOh97CU7jE1Q@mail.gmail.com>
 <CAAhV-H6gEMy0fvjFot1VZrwx319t4wJKeA769MLfmF4z7L5JHA@mail.gmail.com>
 <CAEyhmHQhEutwdD4jBrU_eJ7kDKCROusNEvVaP0nrWuKgXGB2_Q@mail.gmail.com> <CAAhV-H6Mzaef8r+nOntHiERk0-6rkCbRqD-3OFeYHV5Hj-kkYA@mail.gmail.com>
In-Reply-To: <CAAhV-H6Mzaef8r+nOntHiERk0-6rkCbRqD-3OFeYHV5Hj-kkYA@mail.gmail.com>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Tue, 23 Sep 2025 16:47:57 +0800
X-Gm-Features: AS18NWCQisd6urjJKXuiBoBvqqQiZDI6q998NndB6-kIXXbG00VnuHR7HKk6aIk
Message-ID: <CAEyhmHRzLwAaqbJqtbQx3u+LS9ZoEmQPUg+F+a7yK3jFPpXdoA@mail.gmail.com>
Subject: Re: [PATCH v5 8/8] LoongArch: BPF: Sign extend struct ops return
 values properly
To: Huacai Chen <chenhuacai@kernel.org>
Cc: yangtiezhu@loongson.cn, vincent.mc.li@gmail.com, hejinyang@loongson.cn, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 19, 2025 at 2:53=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> On Thu, Sep 18, 2025 at 8:32=E2=80=AFPM Hengqi Chen <hengqi.chen@gmail.co=
m> wrote:
> >
> > On Wed, Sep 17, 2025 at 4:58=E2=80=AFPM Huacai Chen <chenhuacai@kernel.=
org> wrote:
> > >
> > > On Wed, Sep 17, 2025 at 1:34=E2=80=AFPM Hengqi Chen <hengqi.chen@gmai=
l.com> wrote:
> > > >
> > > > On Wed, Sep 17, 2025 at 11:19=E2=80=AFAM Huacai Chen <chenhuacai@ke=
rnel.org> wrote:
> > > > >
> > > > > Hi, Hengqi,
> > > > >
> > > > > On Wed, Sep 17, 2025 at 9:56=E2=80=AFAM Hengqi Chen <hengqi.chen@=
gmail.com> wrote:
> > > > > >
> > > > > > The ns_bpf_qdisc selftest triggers a kernel panic:
> > > > > >
> > > > > >     CPU 0 Unable to handle kernel paging request at virtual add=
ress 0000000000741d58, era =3D=3D 90000000851b5ac0, ra =3D=3D 90000000851b5=
aa4
> > > > > >     Oops[#1]:
> > > > > >     CPU: 0 UID: 0 PID: 449 Comm: test_progs Tainted: G         =
  OE       6.16.0+ #3 PREEMPT(full)
> > > > > >     Tainted: [O]=3DOOT_MODULE, [E]=3DUNSIGNED_MODULE
> > > > > >     Hardware name: QEMU QEMU Virtual Machine, BIOS unknown 2/2/=
2022
> > > > > >     pc 90000000851b5ac0 ra 90000000851b5aa4 tp 90000001076b8000=
 sp 90000001076bb600
> > > > > >     a0 0000000000741ce8 a1 0000000000000001 a2 90000001076bb5c0=
 a3 0000000000000008
> > > > > >     a4 90000001004c4620 a5 9000000100741ce8 a6 0000000000000000=
 a7 0100000000000000
> > > > > >     t0 0000000000000010 t1 0000000000000000 t2 9000000104d24d30=
 t3 0000000000000001
> > > > > >     t4 4f2317da8a7e08c4 t5 fffffefffc002f00 t6 90000001004c4620=
 t7 ffffffffc61c5b3d
> > > > > >     t8 0000000000000000 u0 0000000000000001 s9 0000000000000050=
 s0 90000001075bc800
> > > > > >     s1 0000000000000040 s2 900000010597c400 s3 0000000000000008=
 s4 90000001075bc880
> > > > > >     s5 90000001075bc8f0 s6 0000000000000000 s7 0000000000741ce8=
 s8 0000000000000000
> > > > > >        ra: 90000000851b5aa4 __qdisc_run+0xac/0x8d8
> > > > > >       ERA: 90000000851b5ac0 __qdisc_run+0xc8/0x8d8
> > > > > >      CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=3DCC DACM=3DCC -WE)
> > > > > >      PRMD: 00000004 (PPLV0 +PIE -PWE)
> > > > > >      EUEN: 00000007 (+FPE +SXE +ASXE -BTE)
> > > > > >      ECFG: 00071c1d (LIE=3D0,2-4,10-12 VS=3D7)
> > > > > >     ESTAT: 00010000 [PIL] (IS=3D ECode=3D1 EsubCode=3D0)
> > > > > >      BADV: 0000000000741d58
> > > > > >      PRID: 0014c010 (Loongson-64bit, Loongson-3A5000)
> > > > > >     Modules linked in: bpf_testmod(OE) [last unloaded: bpf_test=
mod(OE)]
> > > > > >     Process test_progs (pid: 449, threadinfo=3D000000009af02b3a=
, task=3D00000000e9ba4956)
> > > > > >     Stack : 0000000000000000 90000001075bc8ac 90000000869524a8 =
9000000100741ce8
> > > > > >             90000001075bc800 9000000100415300 90000001075bc8ac =
0000000000000000
> > > > > >             900000010597c400 900000008694a000 0000000000000000 =
9000000105b59000
> > > > > >             90000001075bc800 9000000100741ce8 0000000000000050 =
900000008513000c
> > > > > >             9000000086936000 0000000100094d4c fffffff400676208 =
0000000000000000
> > > > > >             9000000105b59000 900000008694a000 9000000086bf0dc0 =
9000000105b59000
> > > > > >             9000000086bf0d68 9000000085147010 90000001075be788 =
0000000000000000
> > > > > >             9000000086bf0f98 0000000000000001 0000000000000010 =
9000000006015840
> > > > > >             0000000000000000 9000000086be6c40 0000000000000000 =
0000000000000000
> > > > > >             0000000000000000 4f2317da8a7e08c4 0000000000000101 =
4f2317da8a7e08c4
> > > > > >             ...
> > > > > >     Call Trace:
> > > > > >     [<90000000851b5ac0>] __qdisc_run+0xc8/0x8d8
> > > > > >     [<9000000085130008>] __dev_queue_xmit+0x578/0x10f0
> > > > > >     [<90000000853701c0>] ip6_finish_output2+0x2f0/0x950
> > > > > >     [<9000000085374bc8>] ip6_finish_output+0x2b8/0x448
> > > > > >     [<9000000085370b24>] ip6_xmit+0x304/0x858
> > > > > >     [<90000000853c4438>] inet6_csk_xmit+0x100/0x170
> > > > > >     [<90000000852b32f0>] __tcp_transmit_skb+0x490/0xdd0
> > > > > >     [<90000000852b47fc>] tcp_connect+0xbcc/0x1168
> > > > > >     [<90000000853b9088>] tcp_v6_connect+0x580/0x8a0
> > > > > >     [<90000000852e7738>] __inet_stream_connect+0x170/0x480
> > > > > >     [<90000000852e7a98>] inet_stream_connect+0x50/0x88
> > > > > >     [<90000000850f2814>] __sys_connect+0xe4/0x110
> > > > > >     [<90000000850f2858>] sys_connect+0x18/0x28
> > > > > >     [<9000000085520c94>] do_syscall+0x94/0x1a0
> > > > > >     [<9000000083df1fb8>] handle_syscall+0xb8/0x158
> > > > > >
> > > > > >     Code: 4001ad80  2400873f  2400832d <240073cc> 001137ff  001=
133ff  6407b41f  001503cc  0280041d
> > > > > >
> > > > > >     ---[ end trace 0000000000000000 ]---
> > > > > >
> > > > > > The bpf_fifo_dequeue prog returns a skb which is a pointer.
> > > > > > The pointer is treated as a 32bit value and sign extend to
> > > > > > 64bit in epilogue. This behavior is right for most bpf prog
> > > > > > types but wrong for struct ops which requires LoongArch ABI.
> > > > > >
> > > > > > So let's sign extend struct ops return values according to
> > > > > > the LoongArch ABI ([0]) and return value spec in function model=
.
> > > > > >
> > > > > >   [0]: https://loongson.github.io/LoongArch-Documentation/Loong=
Arch-ELF-ABI-EN.html
> > > > > >
> > > > > > Fixes: 6abf17d690d8 ("LoongArch: BPF: Add struct ops support fo=
r trampoline")
> > > > > > Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
> > > > > > ---
> > > > > >  arch/loongarch/net/bpf_jit.c | 36 ++++++++++++++++++++++++++++=
+++++++-
> > > > > >  1 file changed, 35 insertions(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/=
bpf_jit.c
> > > > > > index 6dba407c202f..6533088c86ba 100644
> > > > > > --- a/arch/loongarch/net/bpf_jit.c
> > > > > > +++ b/arch/loongarch/net/bpf_jit.c
> > > > > > @@ -1451,6 +1451,36 @@ void arch_free_bpf_trampoline(void *imag=
e, unsigned int size)
> > > > > >         bpf_prog_pack_free(image, size);
> > > > > >  }
> > > > > >
> > > > > > +/*
> > > > > > + * Sign-extend the register if necessary
> > > > > > + */
> > > > > > +static void sign_extend(struct jit_ctx *ctx, int rd, int rj, u=
8 size, u8 flags)
> > > > > > +{
> > > > > > +       if (!(flags & BTF_FMODEL_SIGNED_ARG) && (size =3D=3D 1 =
|| size =3D=3D 2)) {
> > > > > We don't need to move_reg() for size =3D=3D 4?
> > > > >
> > > >
> > > > The ABI says that unsigned char/short should be zero-extended.
> > > > But int (both signed and unsigned) should be signed-extended.
> > > >
> > > > > And it is better to move this logic to the switch-case block.
> > > > >
> > > >
> > > > I tried, it looks more complicated than the current approach.
> > > > FYI, I've done similar fix for riscv ([0]).
> > > >
> > > >   [0]: https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next=
.git/commit/?id=3Dfd2e08128944a7679e753f920e9eda72057e427c
> > > OK, then please also evaluate BTF_FMODEL_SIGNED_ARG from the caller
> >
> > I talked to Tiezhu off-list, he thinks this is unnecessary.
> > We might need to check other flag bit later.
> sign_extend() can hardly use other flags. And if really needed, we can
> use a local variable "sign" in this function that is convenient for
> below logic.
>

Fair enough, let's do it your way.

> Huacai
>
> >
> > > like RISC-V. And then adjust the condition like this (I think it is
> > > clearer):
> > > +       if (size =3D=3D 1 || size =3D=3D 2) {
> > > +               if (!sign && (rd !=3D rj))
> > > +                       move_reg(ctx, rd, rj);
> > > +               return;
> > > +       }
> > >
> >
> > Instead, I think adding a comment mentioning the ABI requirement is eno=
ugh.
> >
> > > Huacai
> > >
> > > >
> > > > > Huacai
> > > > >
> > > > > > +               if (rd !=3D rj)
> > > > > > +                       move_reg(ctx, rd, rj);
> > > > > > +               return;
> > > > > > +       }
> > > > > > +
> > > > > > +       switch (size) {
> > > > > > +       case 1:
> > > > > > +               emit_insn(ctx, extwb, rd, rj);
> > > > > > +               break;
> > > > > > +       case 2:
> > > > > > +               emit_insn(ctx, extwh, rd, rj);
> > > > > > +               break;
> > > > > > +       case 4:
> > > > > > +               emit_insn(ctx, addiw, rd, rj, 0);
> > > > > > +               break;
> > > > > > +       case 8:
> > > > > > +               if (rd !=3D rj)
> > > > > > +                       move_reg(ctx, rd, rj);
> > > > > > +               break;
> > > > > > +       default:
> > > > > > +               pr_warn("bpf_jit: invalid size %d for sign_exte=
nd\n", size);
> > > > > > +       }
> > > > > > +}
> > > > > > +
> > > > > >  static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, =
struct bpf_tramp_image *im,
> > > > > >                                          const struct btf_func_=
model *m, struct bpf_tramp_links *tlinks,
> > > > > >                                          void *func_addr, u32 f=
lags)
> > > > > > @@ -1659,8 +1689,12 @@ static int __arch_prepare_bpf_trampoline=
(struct jit_ctx *ctx, struct bpf_tramp_i
> > > > > >                 restore_args(ctx, m->nr_args, args_off);
> > > > > >
> > > > > >         if (save_ret) {
> > > > > > -               emit_insn(ctx, ldd, LOONGARCH_GPR_A0, LOONGARCH=
_GPR_FP, -retval_off);
> > > > > >                 emit_insn(ctx, ldd, regmap[BPF_REG_0], LOONGARC=
H_GPR_FP, -(retval_off - 8));
> > > > > > +               if (is_struct_ops)
> > > > > > +                       sign_extend(ctx, LOONGARCH_GPR_A0, regm=
ap[BPF_REG_0],
> > > > > > +                                   m->ret_size, m->ret_flags);
> > > > > > +               else
> > > > > > +                       emit_insn(ctx, ldd, LOONGARCH_GPR_A0, L=
OONGARCH_GPR_FP, -retval_off);
> > > > > >         }
> > > > > >
> > > > > >         emit_insn(ctx, ldd, LOONGARCH_GPR_S1, LOONGARCH_GPR_FP,=
 -sreg_off);
> > > > > > --
> > > > > > 2.43.5
> > > > > >
