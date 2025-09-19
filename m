Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBA5277C95
	for <loongarch@lists.linux.dev>; Fri, 19 Sep 2025 06:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758264787; cv=none; b=lM7L+15LLQPt7y99LJMvdgz5svwGEYIuQRdMqoeQr8Ks5YWH2KMw/2ToE9DEgDHLuNQGaluM/6S0b3ugpA8nMv6OZFfUvObpO3r4q9JSUU1jVZKkaVhhHR7Zurd/VqmaFvxeQNnvv5CLMm5aALuD+JSS3fLuLz8JiUp4ThvmT1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758264787; c=relaxed/simple;
	bh=xHnquOqSX3ANSv/VLcyjTGkQOGzW8lCY89iculM2yQg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HWpuni6yTth1ltANJvEZkcc7BlB+uH/uQK9FD8hrQ/chR2+lasF0jHesMwObCnvuOGTNELw+oeowKHZtvKvH4v7MaRR+TkzsYW7Xqe/bfW+r5gD1VOKFhfDkogsHJAHtbcojxhNCeQhXjAqwQoIDiZk1tdI6NGtHePyf3tEAu64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=shJCGwT2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="shJCGwT2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77A5AC4CEF1
	for <loongarch@lists.linux.dev>; Fri, 19 Sep 2025 06:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758264787;
	bh=xHnquOqSX3ANSv/VLcyjTGkQOGzW8lCY89iculM2yQg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=shJCGwT2+EjHcmGWSnRW6zUAs1/Ff08OvWr1uLhCGCp/jtvnEPfYdBUCEM2x7Khj8
	 tBB7xaZlVKcYnz7icJzF1gv+brD9kAYYS43FFSFVl8Zo3NME61RUI8szfgrjy4DCWW
	 WiL0ZagYR+wG3IEK6OG+NcHfLDDQatCc5/20qwSqJ0jaKJS2mAR7iD0D5mJCePjrqx
	 CniOJ8kPU7fspPCyFxzr4lO0knzLBVNUxddNDIFRK3ZfaHCAV8B3Iz4VGypfzudb1L
	 5WHuDGFIOh/JKgBGMje2UDKpq+gZsM/7crMKBEy/m2iu5gDDapDsTt6SlOAH4/OAJt
	 dupPqapQkQMYA==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-62fc2d92d34so735214a12.2
        for <loongarch@lists.linux.dev>; Thu, 18 Sep 2025 23:53:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXjWotjtIZEyg4CdkvOZhB5UVR/Bc/pm4BXbouKnz8Lr0JIKkBu4jCtes2hJLzvlZ0LJ8opiIq/qWM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzCf2jhane3deessMQRmMayvw+JvODPEhOygh38n57Ju5uqcTaq
	txiDXDDKcD5KYWQKWZg8tCnsafMaGIn7ekdtHESE8CTCJPUHyBhEYx8gSPSzdoeqEyn52nuwepA
	DgKYvk/S1EPGiBvi+fbSL0CL2kOX+4xw=
X-Google-Smtp-Source: AGHT+IFc/Fpj/ukN4/atKPKL8E8Lu2yEPdJCnEgMdClfLHXcrjzhf/VJiH9a+YQhmqUGaOXl9C62KCggazdE8poOwyo=
X-Received: by 2002:a17:907:7241:b0:b04:3f35:9761 with SMTP id
 a640c23a62f3a-b24ee6ef78amr186287266b.1.1758264786006; Thu, 18 Sep 2025
 23:53:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250916235627.102831-1-hengqi.chen@gmail.com>
 <20250916235627.102831-9-hengqi.chen@gmail.com> <CAAhV-H7oOSWXYjmjXOhvEAcwQnEAs9ZfpdAps83Q=RhP6wcJrw@mail.gmail.com>
 <CAEyhmHSwVTbYHdSVGyZ4wf-Sv+rhe2rF4L9H+6oOh97CU7jE1Q@mail.gmail.com>
 <CAAhV-H6gEMy0fvjFot1VZrwx319t4wJKeA769MLfmF4z7L5JHA@mail.gmail.com> <CAEyhmHQhEutwdD4jBrU_eJ7kDKCROusNEvVaP0nrWuKgXGB2_Q@mail.gmail.com>
In-Reply-To: <CAEyhmHQhEutwdD4jBrU_eJ7kDKCROusNEvVaP0nrWuKgXGB2_Q@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 19 Sep 2025 14:52:53 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6Mzaef8r+nOntHiERk0-6rkCbRqD-3OFeYHV5Hj-kkYA@mail.gmail.com>
X-Gm-Features: AS18NWCTVZMVU49CndW2kz1wIFZCDi_I463iHFBxdD3ZbqIvGURNqeIhJg_gC8M
Message-ID: <CAAhV-H6Mzaef8r+nOntHiERk0-6rkCbRqD-3OFeYHV5Hj-kkYA@mail.gmail.com>
Subject: Re: [PATCH v5 8/8] LoongArch: BPF: Sign extend struct ops return
 values properly
To: Hengqi Chen <hengqi.chen@gmail.com>
Cc: yangtiezhu@loongson.cn, vincent.mc.li@gmail.com, hejinyang@loongson.cn, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2025 at 8:32=E2=80=AFPM Hengqi Chen <hengqi.chen@gmail.com>=
 wrote:
>
> On Wed, Sep 17, 2025 at 4:58=E2=80=AFPM Huacai Chen <chenhuacai@kernel.or=
g> wrote:
> >
> > On Wed, Sep 17, 2025 at 1:34=E2=80=AFPM Hengqi Chen <hengqi.chen@gmail.=
com> wrote:
> > >
> > > On Wed, Sep 17, 2025 at 11:19=E2=80=AFAM Huacai Chen <chenhuacai@kern=
el.org> wrote:
> > > >
> > > > Hi, Hengqi,
> > > >
> > > > On Wed, Sep 17, 2025 at 9:56=E2=80=AFAM Hengqi Chen <hengqi.chen@gm=
ail.com> wrote:
> > > > >
> > > > > The ns_bpf_qdisc selftest triggers a kernel panic:
> > > > >
> > > > >     CPU 0 Unable to handle kernel paging request at virtual addre=
ss 0000000000741d58, era =3D=3D 90000000851b5ac0, ra =3D=3D 90000000851b5aa=
4
> > > > >     Oops[#1]:
> > > > >     CPU: 0 UID: 0 PID: 449 Comm: test_progs Tainted: G           =
OE       6.16.0+ #3 PREEMPT(full)
> > > > >     Tainted: [O]=3DOOT_MODULE, [E]=3DUNSIGNED_MODULE
> > > > >     Hardware name: QEMU QEMU Virtual Machine, BIOS unknown 2/2/20=
22
> > > > >     pc 90000000851b5ac0 ra 90000000851b5aa4 tp 90000001076b8000 s=
p 90000001076bb600
> > > > >     a0 0000000000741ce8 a1 0000000000000001 a2 90000001076bb5c0 a=
3 0000000000000008
> > > > >     a4 90000001004c4620 a5 9000000100741ce8 a6 0000000000000000 a=
7 0100000000000000
> > > > >     t0 0000000000000010 t1 0000000000000000 t2 9000000104d24d30 t=
3 0000000000000001
> > > > >     t4 4f2317da8a7e08c4 t5 fffffefffc002f00 t6 90000001004c4620 t=
7 ffffffffc61c5b3d
> > > > >     t8 0000000000000000 u0 0000000000000001 s9 0000000000000050 s=
0 90000001075bc800
> > > > >     s1 0000000000000040 s2 900000010597c400 s3 0000000000000008 s=
4 90000001075bc880
> > > > >     s5 90000001075bc8f0 s6 0000000000000000 s7 0000000000741ce8 s=
8 0000000000000000
> > > > >        ra: 90000000851b5aa4 __qdisc_run+0xac/0x8d8
> > > > >       ERA: 90000000851b5ac0 __qdisc_run+0xc8/0x8d8
> > > > >      CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=3DCC DACM=3DCC -WE)
> > > > >      PRMD: 00000004 (PPLV0 +PIE -PWE)
> > > > >      EUEN: 00000007 (+FPE +SXE +ASXE -BTE)
> > > > >      ECFG: 00071c1d (LIE=3D0,2-4,10-12 VS=3D7)
> > > > >     ESTAT: 00010000 [PIL] (IS=3D ECode=3D1 EsubCode=3D0)
> > > > >      BADV: 0000000000741d58
> > > > >      PRID: 0014c010 (Loongson-64bit, Loongson-3A5000)
> > > > >     Modules linked in: bpf_testmod(OE) [last unloaded: bpf_testmo=
d(OE)]
> > > > >     Process test_progs (pid: 449, threadinfo=3D000000009af02b3a, =
task=3D00000000e9ba4956)
> > > > >     Stack : 0000000000000000 90000001075bc8ac 90000000869524a8 90=
00000100741ce8
> > > > >             90000001075bc800 9000000100415300 90000001075bc8ac 00=
00000000000000
> > > > >             900000010597c400 900000008694a000 0000000000000000 90=
00000105b59000
> > > > >             90000001075bc800 9000000100741ce8 0000000000000050 90=
0000008513000c
> > > > >             9000000086936000 0000000100094d4c fffffff400676208 00=
00000000000000
> > > > >             9000000105b59000 900000008694a000 9000000086bf0dc0 90=
00000105b59000
> > > > >             9000000086bf0d68 9000000085147010 90000001075be788 00=
00000000000000
> > > > >             9000000086bf0f98 0000000000000001 0000000000000010 90=
00000006015840
> > > > >             0000000000000000 9000000086be6c40 0000000000000000 00=
00000000000000
> > > > >             0000000000000000 4f2317da8a7e08c4 0000000000000101 4f=
2317da8a7e08c4
> > > > >             ...
> > > > >     Call Trace:
> > > > >     [<90000000851b5ac0>] __qdisc_run+0xc8/0x8d8
> > > > >     [<9000000085130008>] __dev_queue_xmit+0x578/0x10f0
> > > > >     [<90000000853701c0>] ip6_finish_output2+0x2f0/0x950
> > > > >     [<9000000085374bc8>] ip6_finish_output+0x2b8/0x448
> > > > >     [<9000000085370b24>] ip6_xmit+0x304/0x858
> > > > >     [<90000000853c4438>] inet6_csk_xmit+0x100/0x170
> > > > >     [<90000000852b32f0>] __tcp_transmit_skb+0x490/0xdd0
> > > > >     [<90000000852b47fc>] tcp_connect+0xbcc/0x1168
> > > > >     [<90000000853b9088>] tcp_v6_connect+0x580/0x8a0
> > > > >     [<90000000852e7738>] __inet_stream_connect+0x170/0x480
> > > > >     [<90000000852e7a98>] inet_stream_connect+0x50/0x88
> > > > >     [<90000000850f2814>] __sys_connect+0xe4/0x110
> > > > >     [<90000000850f2858>] sys_connect+0x18/0x28
> > > > >     [<9000000085520c94>] do_syscall+0x94/0x1a0
> > > > >     [<9000000083df1fb8>] handle_syscall+0xb8/0x158
> > > > >
> > > > >     Code: 4001ad80  2400873f  2400832d <240073cc> 001137ff  00113=
3ff  6407b41f  001503cc  0280041d
> > > > >
> > > > >     ---[ end trace 0000000000000000 ]---
> > > > >
> > > > > The bpf_fifo_dequeue prog returns a skb which is a pointer.
> > > > > The pointer is treated as a 32bit value and sign extend to
> > > > > 64bit in epilogue. This behavior is right for most bpf prog
> > > > > types but wrong for struct ops which requires LoongArch ABI.
> > > > >
> > > > > So let's sign extend struct ops return values according to
> > > > > the LoongArch ABI ([0]) and return value spec in function model.
> > > > >
> > > > >   [0]: https://loongson.github.io/LoongArch-Documentation/LoongAr=
ch-ELF-ABI-EN.html
> > > > >
> > > > > Fixes: 6abf17d690d8 ("LoongArch: BPF: Add struct ops support for =
trampoline")
> > > > > Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
> > > > > ---
> > > > >  arch/loongarch/net/bpf_jit.c | 36 ++++++++++++++++++++++++++++++=
+++++-
> > > > >  1 file changed, 35 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bp=
f_jit.c
> > > > > index 6dba407c202f..6533088c86ba 100644
> > > > > --- a/arch/loongarch/net/bpf_jit.c
> > > > > +++ b/arch/loongarch/net/bpf_jit.c
> > > > > @@ -1451,6 +1451,36 @@ void arch_free_bpf_trampoline(void *image,=
 unsigned int size)
> > > > >         bpf_prog_pack_free(image, size);
> > > > >  }
> > > > >
> > > > > +/*
> > > > > + * Sign-extend the register if necessary
> > > > > + */
> > > > > +static void sign_extend(struct jit_ctx *ctx, int rd, int rj, u8 =
size, u8 flags)
> > > > > +{
> > > > > +       if (!(flags & BTF_FMODEL_SIGNED_ARG) && (size =3D=3D 1 ||=
 size =3D=3D 2)) {
> > > > We don't need to move_reg() for size =3D=3D 4?
> > > >
> > >
> > > The ABI says that unsigned char/short should be zero-extended.
> > > But int (both signed and unsigned) should be signed-extended.
> > >
> > > > And it is better to move this logic to the switch-case block.
> > > >
> > >
> > > I tried, it looks more complicated than the current approach.
> > > FYI, I've done similar fix for riscv ([0]).
> > >
> > >   [0]: https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.g=
it/commit/?id=3Dfd2e08128944a7679e753f920e9eda72057e427c
> > OK, then please also evaluate BTF_FMODEL_SIGNED_ARG from the caller
>
> I talked to Tiezhu off-list, he thinks this is unnecessary.
> We might need to check other flag bit later.
sign_extend() can hardly use other flags. And if really needed, we can
use a local variable "sign" in this function that is convenient for
below logic.

Huacai

>
> > like RISC-V. And then adjust the condition like this (I think it is
> > clearer):
> > +       if (size =3D=3D 1 || size =3D=3D 2) {
> > +               if (!sign && (rd !=3D rj))
> > +                       move_reg(ctx, rd, rj);
> > +               return;
> > +       }
> >
>
> Instead, I think adding a comment mentioning the ABI requirement is enoug=
h.
>
> > Huacai
> >
> > >
> > > > Huacai
> > > >
> > > > > +               if (rd !=3D rj)
> > > > > +                       move_reg(ctx, rd, rj);
> > > > > +               return;
> > > > > +       }
> > > > > +
> > > > > +       switch (size) {
> > > > > +       case 1:
> > > > > +               emit_insn(ctx, extwb, rd, rj);
> > > > > +               break;
> > > > > +       case 2:
> > > > > +               emit_insn(ctx, extwh, rd, rj);
> > > > > +               break;
> > > > > +       case 4:
> > > > > +               emit_insn(ctx, addiw, rd, rj, 0);
> > > > > +               break;
> > > > > +       case 8:
> > > > > +               if (rd !=3D rj)
> > > > > +                       move_reg(ctx, rd, rj);
> > > > > +               break;
> > > > > +       default:
> > > > > +               pr_warn("bpf_jit: invalid size %d for sign_extend=
\n", size);
> > > > > +       }
> > > > > +}
> > > > > +
> > > > >  static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, st=
ruct bpf_tramp_image *im,
> > > > >                                          const struct btf_func_mo=
del *m, struct bpf_tramp_links *tlinks,
> > > > >                                          void *func_addr, u32 fla=
gs)
> > > > > @@ -1659,8 +1689,12 @@ static int __arch_prepare_bpf_trampoline(s=
truct jit_ctx *ctx, struct bpf_tramp_i
> > > > >                 restore_args(ctx, m->nr_args, args_off);
> > > > >
> > > > >         if (save_ret) {
> > > > > -               emit_insn(ctx, ldd, LOONGARCH_GPR_A0, LOONGARCH_G=
PR_FP, -retval_off);
> > > > >                 emit_insn(ctx, ldd, regmap[BPF_REG_0], LOONGARCH_=
GPR_FP, -(retval_off - 8));
> > > > > +               if (is_struct_ops)
> > > > > +                       sign_extend(ctx, LOONGARCH_GPR_A0, regmap=
[BPF_REG_0],
> > > > > +                                   m->ret_size, m->ret_flags);
> > > > > +               else
> > > > > +                       emit_insn(ctx, ldd, LOONGARCH_GPR_A0, LOO=
NGARCH_GPR_FP, -retval_off);
> > > > >         }
> > > > >
> > > > >         emit_insn(ctx, ldd, LOONGARCH_GPR_S1, LOONGARCH_GPR_FP, -=
sreg_off);
> > > > > --
> > > > > 2.43.5
> > > > >
