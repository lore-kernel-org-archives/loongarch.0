Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DF527466D
	for <loongarch@lists.linux.dev>; Thu, 10 Jul 2025 15:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752159850; cv=none; b=qwDFcEixS4rX28+wMxXTOHl2xTlCSV02qvvHjX1moeZDcuKGTDxfY/JP0+hRX3nd2x3mlwqIjpBZmcD6Vxr2Kd2DAyU7qBwiaC61svodLIV7XaIJuIE3cVpyTCGXLPXPpxTnwSms5Xl66JuYSzSvJAdZEmc7az26e7cQAMCKxAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752159850; c=relaxed/simple;
	bh=uQIUQsM3xQKnJ3s9bXPYrYO+O0UignahrZ+lLkMb68A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RlB3sW4KKuAmrmCZt78z/BmLNYg2vBq0hHL1u4Fr1I5xYWUXa0HKUQXkgA7e4Th4Mxwo59C/BHeDBqANSx5JFL2yYg4UMLJVmnWrT0vOn3Pof3oOMaGtxo5NAq+TPKid3iibBxnpU0GyZ4CpwK+Cil+zrEkiFku7TicUTd0tHvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W3n8sqy8; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W3n8sqy8"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4a9741b513eso15601931cf.1
        for <loongarch@lists.linux.dev>; Thu, 10 Jul 2025 08:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752159847; x=1752764647; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BiJM2Mhma4lCGBNRh3hgOCoGaewre1ofRWR1RNhD7y4=;
        b=W3n8sqy8ktXQwljzc3iBCWxuXow5Ma8E/iMYdjXOREQqBu8803yayGHRQUqHnuU3c+
         Fy/g6blsm8yludYW84wPhlvaaASiJQp4MlwFhEbPaxhBBL79JL6uYFktHYVFvpKAk9vR
         ZvsUmuT0qcxCi3s4zx1qlxuVZJh+xl7U9NGSjBiLT++KeqwxW1fHC9JchkWznJ/aX3/G
         t3RRslTaWt1sIXt7UR9TIU8kzhDjh+6/d6wa7V4lzcxfu/JW8bDFQ8SmPUH0iVJ+rcHM
         candGrBYbsOuBNWu2AlzjwYDlHmoHAO4lZnPs4OrQzvsFodVYzWC83HmGBYe9XyDKYN+
         RUyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752159847; x=1752764647;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BiJM2Mhma4lCGBNRh3hgOCoGaewre1ofRWR1RNhD7y4=;
        b=rQYKNTUxkVUx7RTLxQ+1sdv8lbAzr7drTxWafpQR6LGdv0orOtdSIt6/jQuWx6446z
         QNxyGwSI5oiOHsp7KDe9J2cDl4MGe98Pw8f0O9QiCBmZvPLrK2YClRwnOvBLVjrXPEkJ
         JGauXRdEA9PIDfycopiHxSdiwMO4XT2FFGNEBQFUrcwXF0FNJxRzLx+VFdZHuXt0fqtF
         aa/c1TQgBlF4ngO9p0fjs3YwXW+Y9FH71h7qR37X0TTE3fVO5sSLxJWO8Vpv4uMnLskV
         Zqv+lPUVvX04tGSkmEFY/8KKkeDDsstdRctnsl6U5DYcO0cugbc/7l7/FhEKA6tASiGN
         6EyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVisU4urSieylNVNr8WL5LdUqIY/q4hrNj5g8qmtfnOzqron2otXcwUo5YEUcki3d3DKrg7H5PyXWU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzkbzQVdjOGzY2qpPMzacoBTMNCBcj7VSbb+zdyhl6dBXjRpaPn
	hFCybju1Z4ixSMbDfGv6JcHt98Q9YlMUNOElUDuFWVqXQEDNxk2ngTy7oNVwrqyoXqJ8QXS0yrP
	Vh082M+HjLEQS4/nJfmXUQ5YXk0l+TOY=
X-Gm-Gg: ASbGncvsNLV6bkx+h8fLGsIu7vWsLQrE1e0FX6kmnPEFdPjT7CBAbOZrNZopyNBpEhc
	6+Nf625OrCbi05m1FpdEYgpYa5Ye3jDRrZnWNwRnvT7zc8dKSh3pL4dWMg1qe7X7nyWLBQzTfxg
	H8PCUQKbC788e6Md4r1ZdHWJfFBuiFN1XgBN0+txVjQUs=
X-Google-Smtp-Source: AGHT+IHWrntobsQBruozSXi4evnf7r903124M25drM/+KtH4yHn3Kd9ESj+jC0UD0EryiKyreI/yntSsaVVMFGLPM58=
X-Received: by 2002:a05:622a:1819:b0:4a9:dda8:7f22 with SMTP id
 d75a77b69052e-4a9e94746c4mr56154761cf.38.1752159847121; Thu, 10 Jul 2025
 08:04:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250709055029.723243-1-duanchenghao@kylinos.cn>
 <20250709055029.723243-6-duanchenghao@kylinos.cn> <CAK3+h2zyhKYjRNV+25pngfrtPQdKe6gJFbkmanBx_9Fp+C8VYw@mail.gmail.com>
 <20250710080456.GB839477@chenghao-pc>
In-Reply-To: <20250710080456.GB839477@chenghao-pc>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Thu, 10 Jul 2025 08:03:56 -0700
X-Gm-Features: Ac12FXwvqUm8sDWLiUhrQzrjgS8_BZlmf_6RQd0yIQlqN4-DvBzUbAXWq7SueHM
Message-ID: <CAK3+h2yc6m1c-EpwK+Lmrb9eV7ZbU1ibJHVzygqjc6QjQid7cQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] LoongArch: BPF: Add bpf trampoline support for Loongarch
To: Chenghao Duan <duanchenghao@kylinos.cn>
Cc: yangtiezhu@loongson.cn, hengqi.chen@gmail.com, chenhuacai@kernel.org, 
	kernel@xen0n.name, loongarch@lists.linux.dev, guodongtai@kylinos.cn, 
	jianghaoran@kylinos.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 10, 2025 at 1:05=E2=80=AFAM Chenghao Duan <duanchenghao@kylinos=
.cn> wrote:
>
> On Wed, Jul 09, 2025 at 12:08:27PM -0700, Vincent Li wrote:
> > Hi Chenghao,
> >
> > I removed many email recipients for my question because I don't want
> > to bother others, so you could  reply to this and not CC others who
> > may not want to be bothered.  Thanks for working on this BPF
> > trampoline feature for loongarch, I have been waiting for the bpf
> > trampoline feature for loongarch for a long time.
> >
> >
> > On Tue, Jul 8, 2025 at 10:52=E2=80=AFPM Chenghao Duan <duanchenghao@kyl=
inos.cn> wrote:
> > >
> > > BPF trampoline is the critical infrastructure of the BPF subsystem, a=
cting
> > > as a mediator between kernel functions and BPF programs. Numerous imp=
ortant
> > > features, such as using BPF program for zero overhead kernel introspe=
ction,
> > > rely on this key component.
> > >
> > > The related tests have passed, Including the following technical poin=
ts:
> > > 1. fentry
> > > 2. fmod_ret
> > > 3. fexit
> > >
> >
> > My firewall project https://github.com/vincentmli/loongfire relies on
> > https://github.com/xdp-project/xdp-tools/tree/main/lib/libxdp which
> > relies on "BPF program extension" to attach multiple XDP program to
> > one single network interface. Now I can't attach multiple XDP programs
> > to one network interface through libxdp so I use bpf tail call as a
> > workaround.  I am not a kernel developer and not  familiar with the
> > kernel code so I am not sure if the "BPF program extension" is
> > automatically supported after bpf trampoline is supported for
> > loongarch, could you shed some light on this? thanks!
> >
>
> Hi Vincent,
>
> I sincerely apologize, but I'm not quite sure about the specific
> scenarios where the "BPF Program Extension" you mentioned is applied.
> The trampoline feature allows multiple BPF programs to be attached to
> the fentry/fexit points of kernel functions at runtime. I'm not sure if
> this aligns with your technical approach.
>
> Chenghao
>

Thanks for the feedback, the
https://github.com/xdp-project/xdp-tools/tree/main/lib/libxdp has
section
Kernel and BPF program feature compatibility.

"The ability to attach multiple BPF programs to a single interface
relies on the kernel =E2=80=9CBPF program extension=E2=80=9D feature which =
was
introduced by commit be8704ff07d2 (=E2=80=9Cbpf: Introduce dynamic program
extensions=E2=80=9D) in the upstream kernel and first appeared in kernel
release 5.6. To incrementally attach multiple programs, a further
refinement added by commit 4a1e7c0c63e0 (=E2=80=9Cbpf: Support attaching
freplace programs to multiple attach points=E2=80=9D) is needed; this first
appeared in the upstream kernel version 5.10. The functionality relies
on the =E2=80=9CBPF trampolines=E2=80=9D feature which is unfortunately onl=
y available
on the x86_64 architecture. In other words, kernels before 5.6 can
only attach a single XDP program to each interface, kernels 5.6+ can
attach multiple programs if they are all attached at the same time,
and kernels 5.10 have full support for XDP multiprog on x86_64. On
other architectures, only a single program can be attached to each
interface."

According to the above mentioned commit and  paragraph, I think =E2=80=9CBP=
F
program extension=E2=80=9D should be  supported if the architecture support=
s
trampoline, when libxdp author wrote the above paragraph, probably
only X86_64 architecture supported BPF trampolines at that time. I
will be glad to help testing that when loongarch BPF trampoline
feature is supported :)

> > > Co-developed-by: George Guo <guodongtai@kylinos.cn>
> > > Signed-off-by: George Guo <guodongtai@kylinos.cn>
> > > Signed-off-by: Chenghao Duan <duanchenghao@kylinos.cn>
> > > ---
> > >  arch/loongarch/net/bpf_jit.c | 391 +++++++++++++++++++++++++++++++++=
++
> > >  arch/loongarch/net/bpf_jit.h |   6 +
> > >  2 files changed, 397 insertions(+)
> > >
> > > diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_ji=
t.c
> > > index 9cb01f0b0..6820558af 100644
> > > --- a/arch/loongarch/net/bpf_jit.c
> > > +++ b/arch/loongarch/net/bpf_jit.c
> > > @@ -7,6 +7,10 @@
> > >  #include <linux/memory.h>
> > >  #include "bpf_jit.h"
> > >
> > > +#define LOONGARCH_MAX_REG_ARGS 8
> > > +#define LOONGARCH_FENTRY_NINSNS 2
> > > +#define LOONGARCH_FENTRY_NBYTES (LOONGARCH_FENTRY_NINSNS * 4)
> > > +
> > >  #define REG_TCC                LOONGARCH_GPR_A6
> > >  #define TCC_SAVED      LOONGARCH_GPR_S5
> > >
> > > @@ -1400,6 +1404,16 @@ static int gen_jump_or_nops(void *target, void=
 *ip, u32 *insns, bool is_call)
> > >                                   (unsigned long)ip, (unsigned long)t=
arget);
> > >  }
> > >
> > > +static int emit_call(struct jit_ctx *ctx, u64 addr)
> > > +{
> > > +       u64 ip;
> > > +
> > > +       if (addr && ctx->image && ctx->ro_image)
> > > +               ip =3D (u64)(ctx->image + ctx->idx);
> > > +
> > > +       return emit_jump_and_link(ctx, LOONGARCH_GPR_RA, ip, addr);
> > > +}
> > > +
> > >  int bpf_arch_text_poke(void *ip, enum bpf_text_poke_type poke_type,
> > >                        void *old_addr, void *new_addr)
> > >  {
> > > @@ -1457,3 +1471,380 @@ void *bpf_arch_text_copy(void *dst, void *src=
, size_t len)
> > >
> > >         return dst;
> > >  }
> > > +
> > > +static void store_args(struct jit_ctx *ctx, int nargs, int args_off)
> > > +{
> > > +       int i;
> > > +
> > > +       for (i =3D 0; i < nargs; i++) {
> > > +               emit_insn(ctx, std, LOONGARCH_GPR_A0 + i, LOONGARCH_G=
PR_FP, -args_off);
> > > +               args_off -=3D 8;
> > > +       }
> > > +}
> > > +
> > > +static void restore_args(struct jit_ctx *ctx, int nargs, int args_of=
f)
> > > +{
> > > +       int i;
> > > +
> > > +       for (i =3D 0; i < nargs; i++) {
> > > +               emit_insn(ctx, ldd, LOONGARCH_GPR_A0 + i, LOONGARCH_G=
PR_FP, -args_off);
> > > +               args_off -=3D 8;
> > > +       }
> > > +}
> > > +
> > > +static int invoke_bpf_prog(struct jit_ctx *ctx, struct bpf_tramp_lin=
k *l,
> > > +                          int args_off, int retval_off,
> > > +                          int run_ctx_off, bool save_ret)
> > > +{
> > > +       int ret;
> > > +       u32 *branch;
> > > +       struct bpf_prog *p =3D l->link.prog;
> > > +       int cookie_off =3D offsetof(struct bpf_tramp_run_ctx, bpf_coo=
kie);
> > > +
> > > +       if (l->cookie) {
> > > +               move_imm(ctx, LOONGARCH_GPR_T1, l->cookie, false);
> > > +               emit_insn(ctx, std, LOONGARCH_GPR_T1, LOONGARCH_GPR_F=
P, -run_ctx_off + cookie_off);
> > > +       } else {
> > > +               emit_insn(ctx, std, LOONGARCH_GPR_ZERO, LOONGARCH_GPR=
_FP,
> > > +                         -run_ctx_off + cookie_off);
> > > +       }
> > > +
> > > +       /* arg1: prog */
> > > +       move_imm(ctx, LOONGARCH_GPR_A0, (const s64)p, false);
> > > +       /* arg2: &run_ctx */
> > > +       emit_insn(ctx, addid, LOONGARCH_GPR_A1, LOONGARCH_GPR_FP, -ru=
n_ctx_off);
> > > +       ret =3D emit_call(ctx, (const u64)bpf_trampoline_enter(p));
> > > +       if (ret)
> > > +               return ret;
> > > +
> > > +       /* store prog start time */
> > > +       move_reg(ctx, LOONGARCH_GPR_S1, LOONGARCH_GPR_A0);
> > > +
> > > +       /* if (__bpf_prog_enter(prog) =3D=3D 0)
> > > +        *      goto skip_exec_of_prog;
> > > +        *
> > > +        */
> > > +       branch =3D (u32 *)ctx->image + ctx->idx;
> > > +       /* nop reserved for conditional jump */
> > > +       emit_insn(ctx, nop);
> > > +
> > > +       /* arg1: &args_off */
> > > +       emit_insn(ctx, addid, LOONGARCH_GPR_A0, LOONGARCH_GPR_FP, -ar=
gs_off);
> > > +       if (!p->jited)
> > > +               move_imm(ctx, LOONGARCH_GPR_A1, (const s64)p->insnsi,=
 false);
> > > +       ret =3D emit_call(ctx, (const u64)p->bpf_func);
> > > +       if (ret)
> > > +               return ret;
> > > +
> > > +       if (save_ret) {
> > > +               emit_insn(ctx, std, LOONGARCH_GPR_A0, LOONGARCH_GPR_F=
P, -retval_off);
> > > +               emit_insn(ctx, std, regmap[BPF_REG_0], LOONGARCH_GPR_=
FP, -(retval_off - 8));
> > > +       }
> > > +
> > > +       /* update branch with beqz */
> > > +       if (ctx->image) {
> > > +               int offset =3D (void *)(&ctx->image[ctx->idx]) - (voi=
d *)branch;
> > > +               *branch =3D larch_insn_gen_beq(LOONGARCH_GPR_A0, LOON=
GARCH_GPR_ZERO, offset);
> > > +       }
> > > +
> > > +       /* arg1: prog */
> > > +       move_imm(ctx, LOONGARCH_GPR_A0, (const s64)p, false);
> > > +       /* arg2: prog start time */
> > > +       move_reg(ctx, LOONGARCH_GPR_A1, LOONGARCH_GPR_S1);
> > > +       /* arg3: &run_ctx */
> > > +       emit_insn(ctx, addid, LOONGARCH_GPR_A2, LOONGARCH_GPR_FP, -ru=
n_ctx_off);
> > > +       ret =3D emit_call(ctx, (const u64)bpf_trampoline_exit(p));
> > > +
> > > +       return ret;
> > > +}
> > > +
> > > +static void invoke_bpf_mod_ret(struct jit_ctx *ctx, struct bpf_tramp=
_links *tl,
> > > +                              int args_off, int retval_off, int run_=
ctx_off, u32 **branches)
> > > +{
> > > +       int i;
> > > +
> > > +       emit_insn(ctx, std, LOONGARCH_GPR_ZERO, LOONGARCH_GPR_FP, -re=
tval_off);
> > > +       for (i =3D 0; i < tl->nr_links; i++) {
> > > +               invoke_bpf_prog(ctx, tl->links[i], args_off, retval_o=
ff,
> > > +                               run_ctx_off, true);
> > > +               emit_insn(ctx, ldd, LOONGARCH_GPR_T1, LOONGARCH_GPR_F=
P, -retval_off);
> > > +               branches[i] =3D (u32 *)ctx->image + ctx->idx;
> > > +               emit_insn(ctx, nop);
> > > +       }
> > > +}
> > > +
> > > +u64 bpf_jit_alloc_exec_limit(void)
> > > +{
> > > +       return VMALLOC_END - VMALLOC_START;
> > > +}
> > > +
> > > +void *arch_alloc_bpf_trampoline(unsigned int size)
> > > +{
> > > +       return bpf_prog_pack_alloc(size, jit_fill_hole);
> > > +}
> > > +
> > > +void arch_free_bpf_trampoline(void *image, unsigned int size)
> > > +{
> > > +       bpf_prog_pack_free(image, size);
> > > +}
> > > +
> > > +static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, struct=
 bpf_tramp_image *im,
> > > +                                        const struct btf_func_model =
*m,
> > > +                                        struct bpf_tramp_links *tlin=
ks,
> > > +                                        void *func_addr, u32 flags)
> > > +{
> > > +       int i;
> > > +       int stack_size =3D 0, nargs =3D 0;
> > > +       int retval_off, args_off, nargs_off, ip_off, run_ctx_off, sre=
g_off;
> > > +       struct bpf_tramp_links *fentry =3D &tlinks[BPF_TRAMP_FENTRY];
> > > +       struct bpf_tramp_links *fexit =3D &tlinks[BPF_TRAMP_FEXIT];
> > > +       struct bpf_tramp_links *fmod_ret =3D &tlinks[BPF_TRAMP_MODIFY=
_RETURN];
> > > +       int ret, save_ret;
> > > +       void *orig_call =3D func_addr;
> > > +       u32 **branches =3D NULL;
> > > +
> > > +       if (flags & (BPF_TRAMP_F_ORIG_STACK | BPF_TRAMP_F_SHARE_IPMOD=
IFY))
> > > +               return -ENOTSUPP;
> > > +
> > > +       /*
> > > +        * FP + 8       [ RA to parent func ] return address to paren=
t
> > > +        *                    function
> > > +        * FP + 0       [ FP of parent func ] frame pointer of parent
> > > +        *                    function
> > > +        * FP - 8       [ T0 to traced func ] return address of trace=
d
> > > +        *                    function
> > > +        * FP - 16      [ FP of traced func ] frame pointer of traced
> > > +        *                    function
> > > +        *
> > > +        * FP - retval_off  [ return value      ] BPF_TRAMP_F_CALL_OR=
IG or
> > > +        *                    BPF_TRAMP_F_RET_FENTRY_RET
> > > +        *                  [ argN              ]
> > > +        *                  [ ...               ]
> > > +        * FP - args_off    [ arg1              ]
> > > +        *
> > > +        * FP - nargs_off   [ regs count        ]
> > > +        *
> > > +        * FP - ip_off      [ traced func   ] BPF_TRAMP_F_IP_ARG
> > > +        *
> > > +        * FP - run_ctx_off [ bpf_tramp_run_ctx ]
> > > +        *
> > > +        * FP - sreg_off    [ callee saved reg  ]
> > > +        *
> > > +        */
> > > +
> > > +       if (m->nr_args > LOONGARCH_MAX_REG_ARGS)
> > > +               return -ENOTSUPP;
> > > +
> > > +       if (flags & (BPF_TRAMP_F_ORIG_STACK | BPF_TRAMP_F_SHARE_IPMOD=
IFY))
> > > +               return -ENOTSUPP;
> > > +
> > > +       stack_size =3D 0;
> > > +
> > > +       /* room of trampoline frame to store return address and frame=
 pointer */
> > > +       stack_size +=3D 16;
> > > +
> > > +       save_ret =3D flags & (BPF_TRAMP_F_CALL_ORIG | BPF_TRAMP_F_RET=
_FENTRY_RET);
> > > +       if (save_ret) {
> > > +               /* Save BPF R0 and A0 */
> > > +               stack_size +=3D 16;
> > > +               retval_off =3D stack_size;
> > > +       }
> > > +
> > > +       /* room of trampoline frame to store args */
> > > +       nargs =3D m->nr_args;
> > > +       stack_size +=3D nargs * 8;
> > > +       args_off =3D stack_size;
> > > +
> > > +       /* room of trampoline frame to store args number */
> > > +       stack_size +=3D 8;
> > > +       nargs_off =3D stack_size;
> > > +
> > > +       /* room of trampoline frame to store ip address */
> > > +       if (flags & BPF_TRAMP_F_IP_ARG) {
> > > +               stack_size +=3D 8;
> > > +               ip_off =3D stack_size;
> > > +       }
> > > +
> > > +       /* room of trampoline frame to store struct bpf_tramp_run_ctx=
 */
> > > +       stack_size +=3D round_up(sizeof(struct bpf_tramp_run_ctx), 8)=
;
> > > +       run_ctx_off =3D stack_size;
> > > +
> > > +       stack_size +=3D 8;
> > > +       sreg_off =3D stack_size;
> > > +
> > > +       stack_size =3D round_up(stack_size, 16);
> > > +
> > > +       /* For the trampoline called from function entry */
> > > +       /* RA and FP for parent function*/
> > > +       emit_insn(ctx, addid, LOONGARCH_GPR_SP, LOONGARCH_GPR_SP, -16=
);
> > > +       emit_insn(ctx, std, LOONGARCH_GPR_RA, LOONGARCH_GPR_SP, 8);
> > > +       emit_insn(ctx, std, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, 0);
> > > +       emit_insn(ctx, addid, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, 16)=
;
> > > +
> > > +       /* RA and FP for traced function*/
> > > +       emit_insn(ctx, addid, LOONGARCH_GPR_SP, LOONGARCH_GPR_SP, -st=
ack_size);
> > > +       emit_insn(ctx, std, LOONGARCH_GPR_T0, LOONGARCH_GPR_SP, stack=
_size - 8);
> > > +       emit_insn(ctx, std, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, stack=
_size - 16);
> > > +       emit_insn(ctx, addid, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, sta=
ck_size);
> > > +
> > > +       /* callee saved register S1 to pass start time */
> > > +       emit_insn(ctx, std, LOONGARCH_GPR_S1, LOONGARCH_GPR_FP, -sreg=
_off);
> > > +
> > > +       /* store ip address of the traced function */
> > > +       if (flags & BPF_TRAMP_F_IP_ARG) {
> > > +               move_imm(ctx, LOONGARCH_GPR_T1, (const s64)func_addr,=
 false);
> > > +               emit_insn(ctx, std, LOONGARCH_GPR_T1, LOONGARCH_GPR_F=
P, -ip_off);
> > > +       }
> > > +
> > > +       /* store nargs number*/
> > > +       move_imm(ctx, LOONGARCH_GPR_T1, nargs, false);
> > > +       emit_insn(ctx, std, LOONGARCH_GPR_T1, LOONGARCH_GPR_FP, -narg=
s_off);
> > > +
> > > +       store_args(ctx, nargs, args_off);
> > > +
> > > +       /* To traced function */
> > > +       orig_call +=3D LOONGARCH_FENTRY_NBYTES;
> > > +       if (flags & BPF_TRAMP_F_CALL_ORIG) {
> > > +               move_imm(ctx, LOONGARCH_GPR_A0, (const s64)im, false)=
;
> > > +               ret =3D emit_call(ctx, (const u64)__bpf_tramp_enter);
> > > +               if (ret)
> > > +                       return ret;
> > > +       }
> > > +
> > > +       for (i =3D 0; i < fentry->nr_links; i++) {
> > > +               ret =3D invoke_bpf_prog(ctx, fentry->links[i], args_o=
ff, retval_off,
> > > +                                     run_ctx_off, flags & BPF_TRAMP_=
F_RET_FENTRY_RET);
> > > +               if (ret)
> > > +                       return ret;
> > > +       }
> > > +       if (fmod_ret->nr_links) {
> > > +               branches  =3D kcalloc(fmod_ret->nr_links, sizeof(u32 =
*), GFP_KERNEL);
> > > +               if (!branches)
> > > +                       return -ENOMEM;
> > > +
> > > +               invoke_bpf_mod_ret(ctx, fmod_ret, args_off, retval_of=
f,
> > > +                                  run_ctx_off, branches);
> > > +       }
> > > +
> > > +       if (flags & BPF_TRAMP_F_CALL_ORIG) {
> > > +               restore_args(ctx, m->nr_args, args_off);
> > > +               ret =3D emit_call(ctx, (const u64)orig_call);
> > > +               if (ret)
> > > +                       goto out;
> > > +               emit_insn(ctx, std, LOONGARCH_GPR_A0, LOONGARCH_GPR_F=
P, -retval_off);
> > > +               emit_insn(ctx, std, regmap[BPF_REG_0], LOONGARCH_GPR_=
FP, -(retval_off - 8));
> > > +               im->ip_after_call =3D ctx->ro_image + ctx->idx;
> > > +               /* Reserve space for the move_imm + jirl instruction =
*/
> > > +               emit_insn(ctx, nop);
> > > +               emit_insn(ctx, nop);
> > > +               emit_insn(ctx, nop);
> > > +               emit_insn(ctx, nop);
> > > +               emit_insn(ctx, nop);
> > > +       }
> > > +
> > > +       for (i =3D 0; ctx->image && i < fmod_ret->nr_links; i++) {
> > > +               int offset =3D (void *)(&ctx->image[ctx->idx]) - (voi=
d *)branches[i];
> > > +               *branches[i] =3D larch_insn_gen_bne(LOONGARCH_GPR_T1,=
 LOONGARCH_GPR_ZERO, offset);
> > > +       }
> > > +
> > > +       for (i =3D 0; i < fexit->nr_links; i++) {
> > > +               ret =3D invoke_bpf_prog(ctx, fexit->links[i], args_of=
f, retval_off,
> > > +                                     run_ctx_off, false);
> > > +               if (ret)
> > > +                       goto out;
> > > +       }
> > > +
> > > +       if (flags & BPF_TRAMP_F_CALL_ORIG) {
> > > +               im->ip_epilogue =3D ctx->ro_image + ctx->idx;
> > > +               move_imm(ctx, LOONGARCH_GPR_A0, (const s64)im, false)=
;
> > > +               ret =3D emit_call(ctx, (const u64)__bpf_tramp_exit);
> > > +               if (ret)
> > > +                       goto out;
> > > +       }
> > > +
> > > +       if (flags & BPF_TRAMP_F_RESTORE_REGS)
> > > +               restore_args(ctx, m->nr_args, args_off);
> > > +
> > > +       if (save_ret) {
> > > +               emit_insn(ctx, ldd, LOONGARCH_GPR_A0, LOONGARCH_GPR_F=
P, -retval_off);
> > > +               emit_insn(ctx, ldd, regmap[BPF_REG_0], LOONGARCH_GPR_=
FP, -(retval_off - 8));
> > > +       }
> > > +
> > > +       emit_insn(ctx, ldd, LOONGARCH_GPR_S1, LOONGARCH_GPR_FP, -sreg=
_off);
> > > +
> > > +       /* trampoline called from function entry */
> > > +       emit_insn(ctx, ldd, LOONGARCH_GPR_T0, LOONGARCH_GPR_SP, stack=
_size - 8);
> > > +       emit_insn(ctx, ldd, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, stack=
_size - 16);
> > > +       emit_insn(ctx, addid, LOONGARCH_GPR_SP, LOONGARCH_GPR_SP, sta=
ck_size);
> > > +
> > > +       emit_insn(ctx, ldd, LOONGARCH_GPR_RA, LOONGARCH_GPR_SP, 8);
> > > +       emit_insn(ctx, ldd, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, 0);
> > > +       emit_insn(ctx, addid, LOONGARCH_GPR_SP, LOONGARCH_GPR_SP, 16)=
;
> > > +
> > > +       if (flags & BPF_TRAMP_F_SKIP_FRAME)
> > > +               /* return to parent function */
> > > +               emit_insn(ctx, jirl, LOONGARCH_GPR_ZERO, LOONGARCH_GP=
R_RA, 0);
> > > +       else
> > > +               /* return to traced function */
> > > +               emit_insn(ctx, jirl, LOONGARCH_GPR_ZERO, LOONGARCH_GP=
R_T0, 0);
> > > +
> > > +       ret =3D ctx->idx;
> > > +out:
> > > +       kfree(branches);
> > > +
> > > +       return ret;
> > > +}
> > > +
> > > +int arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *ro=
_image,
> > > +                               void *ro_image_end, const struct btf_=
func_model *m,
> > > +                               u32 flags, struct bpf_tramp_links *tl=
inks,
> > > +                               void *func_addr)
> > > +{
> > > +       int ret;
> > > +       void *image, *tmp;
> > > +       u32 size =3D ro_image_end - ro_image;
> > > +
> > > +       image =3D kvmalloc(size, GFP_KERNEL);
> > > +       if (!image)
> > > +               return -ENOMEM;
> > > +
> > > +       struct jit_ctx ctx =3D {
> > > +               .image =3D (union loongarch_instruction *)image,
> > > +               .ro_image =3D (union loongarch_instruction *)ro_image=
,
> > > +               .idx =3D 0,
> > > +       };
> > > +
> > > +       jit_fill_hole(image, (unsigned int)(ro_image_end - ro_image))=
;
> > > +       ret =3D __arch_prepare_bpf_trampoline(&ctx, im, m, tlinks, fu=
nc_addr, flags);
> > > +       if (ret > 0 && validate_code(&ctx) < 0) {
> > > +               ret =3D -EINVAL;
> > > +               goto out;
> > > +       }
> > > +
> > > +       tmp =3D bpf_arch_text_copy(ro_image, image, size);
> > > +       if (IS_ERR(tmp)) {
> > > +               ret =3D PTR_ERR(tmp);
> > > +               goto out;
> > > +       }
> > > +
> > > +       bpf_flush_icache(ro_image, ro_image_end);
> > > +out:
> > > +       kvfree(image);
> > > +       return ret < 0 ? ret : size;
> > > +}
> > > +
> > > +int arch_bpf_trampoline_size(const struct btf_func_model *m, u32 fla=
gs,
> > > +                            struct bpf_tramp_links *tlinks, void *fu=
nc_addr)
> > > +{
> > > +       struct bpf_tramp_image im;
> > > +       struct jit_ctx ctx;
> > > +       int ret;
> > > +
> > > +       ctx.image =3D NULL;
> > > +       ctx.idx =3D 0;
> > > +
> > > +       ret =3D __arch_prepare_bpf_trampoline(&ctx, &im, m, tlinks, f=
unc_addr, flags);
> > > +
> > > +       /* Page align */
> > > +       return ret < 0 ? ret : round_up(ret * LOONGARCH_INSN_SIZE, PA=
GE_SIZE);
> > > +}
> > > diff --git a/arch/loongarch/net/bpf_jit.h b/arch/loongarch/net/bpf_ji=
t.h
> > > index f9c569f53..5697158fd 100644
> > > --- a/arch/loongarch/net/bpf_jit.h
> > > +++ b/arch/loongarch/net/bpf_jit.h
> > > @@ -18,6 +18,7 @@ struct jit_ctx {
> > >         u32 *offset;
> > >         int num_exentries;
> > >         union loongarch_instruction *image;
> > > +       union loongarch_instruction *ro_image;
> > >         u32 stack_size;
> > >  };
> > >
> > > @@ -308,3 +309,8 @@ static inline int emit_tailcall_jmp(struct jit_ct=
x *ctx, u8 cond, enum loongarch
> > >
> > >         return -EINVAL;
> > >  }
> > > +
> > > +static inline void bpf_flush_icache(void *start, void *end)
> > > +{
> > > +       flush_icache_range((unsigned long)start, (unsigned long)end);
> > > +}
> > > --
> > > 2.43.0
> > >
> > >
