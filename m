Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E522BE628
	for <loongarch@lists.linux.dev>; Tue, 15 Jul 2025 21:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752616483; cv=none; b=pP1VIDNMNT+ikxrglyf1BR5PGiVsdrZac3GWC078CkpekURhIFc3BU4DVYAp/1u6AsHxJQWqtL1PL/Aw4SCQ7JkE7DeBSTtjsoMB0yu03hKEV/3LYCd2BjLTTtDLCrV1vXZu++89Ih2THHAmF1LszHnNdAFGEh44jdFWr1AKxYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752616483; c=relaxed/simple;
	bh=ygdo0itQuhATHf8hAGsn1Rjt15Wnp0gJSsgA6gVXnuU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eV3WBMZ6HE+bJIC7T0Ji/L77cu3RkiBlkBxkVMxYEM5Mj8YNjUnM7C93M49s+cnHnMZ78WdUPLpEOq6gJIMFeN5Q9LkSg5GzRug1xvEcPKiaoyx4I8j7gnpOXTo+DbqXlhYMyQIYBPV2GNFm29dAMURqbLeOVsja/BgFU4BMH7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BfgnmGnF; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BfgnmGnF"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4ab6b3e8386so25485471cf.3
        for <loongarch@lists.linux.dev>; Tue, 15 Jul 2025 14:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752616479; x=1753221279; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ui5vjLnqYHob+Tdt+y11y1lbCGyolG4v9SdZeQBkg1s=;
        b=BfgnmGnFwbiisdk7RBIbeFyy68tsGwudifhHgGuGi+FtYMhH8WIHIT2P6pjElfFz+t
         DDrpW1XK9lXECARptXqC9UcRRTZMBteXpsT9b5ptFapc6qMMiq74Wmq9hpPRWbCsL9+n
         fJxW+3FkLIGNWNSGMYsDB53KXRvxM79fSIlTu9crml9ThN+jRuy6aZdaq0xMyQwI4ZvF
         kNO7HSyDTPZGaxAe6Gz2crafqOV5amy+Oomw17ULsN/KSTdXhPgMEGtM+aMgVXryW8A7
         QdxHi52S7bAFTWvlWRGI2LgxZ8C6AeOfVsfpBw1xYoSufQQnn6xmEXyOKHt2epk0fB8a
         ztog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752616479; x=1753221279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ui5vjLnqYHob+Tdt+y11y1lbCGyolG4v9SdZeQBkg1s=;
        b=poLLtT+tZg64YBSubY+wnITuK4T2cxLSQhsiKdmRHmImjvJugh46MB20QlF1PQTGgR
         wPEn/q1aNdrRPqt0aY01Rd6ENsaoOaQXKHaoAVjjvTcM3zzhrn7vK/1GwlgbvpzJZzX0
         /hkyRuedTwZeyN0IBvja8k78hxWlOvkMJJYQOKWoilGQode3cm7PBstTFwH4SzE2eEcJ
         yLb06WBd5BP0cfMFY/oUrOxGwkjCFNX3Nt0CTiiuMyoBrvJhw6Yv7cq2gqgBVIyvvlXX
         dxw7G7wbKy4jULudxxKHIZFTbVpE94hGSplqcsDqG2C5g1dUO/mDpHEaESxUosOn7hbn
         vpOw==
X-Forwarded-Encrypted: i=1; AJvYcCVla+y8EiYbrwZgfvf3zbVOj3Dyru2HClbZXXRBXFesLuJ0rMRNvsOcQKpXfys56fi3O1hEx9hqKgU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/nqsN9CRI5wk5VbijRZVfskQEooZrBgtcSKcD4BO0FTVlPGIw
	NSCVc7Ne/t6fxuI0yUp9iyrTnlWX9X1Pebhq2RMdmH/j6yMxdbvwdDKYp1c1v2hRdEjupe4T+L4
	RR5x/Y8AL/TfHjr4UbySuiBR4fQQzEbVGelB/
X-Gm-Gg: ASbGncuzIEHnXsSDiB4selMf5M+ggL+pI8QBhEGOBfWHziSlrs7Yt6kQXe38kB/HXLQ
	pZOt3LSEx2Xj1RByruTjpURvVt/Ap9vzLb7iZL36UEbelNLn1h1tuSdCZPflo+31PPTM3lWA9rC
	AGS0Rp8wfpMuNSK6jdzytzcQexLe6SZpM+ixauQ+NpROi3IIePLLHtBwmtK++t7+zjd4+rh6l7H
	LFHNBs=
X-Google-Smtp-Source: AGHT+IEgQzasPmLhlF95Mz+163v4BMZKF4mirulvrJaT01dPSe5qomdQA2qD1xJS9Jedc3DJuLjcc8a/J6OsvX8V3ng=
X-Received: by 2002:a05:622a:1a96:b0:4ab:66c5:b265 with SMTP id
 d75a77b69052e-4ab90718b3cmr17609491cf.0.1752616478573; Tue, 15 Jul 2025
 14:54:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250709055029.723243-1-duanchenghao@kylinos.cn>
 <20250709055029.723243-6-duanchenghao@kylinos.cn> <CAK3+h2zyhKYjRNV+25pngfrtPQdKe6gJFbkmanBx_9Fp+C8VYw@mail.gmail.com>
 <20250710080456.GB839477@chenghao-pc> <CAK3+h2yc6m1c-EpwK+Lmrb9eV7ZbU1ibJHVzygqjc6QjQid7cQ@mail.gmail.com>
 <CAK3+h2yhB3_v8m-5Q0ePDfhH-h1=hK9aCqsN7BHk8NEcwaas5Q@mail.gmail.com>
In-Reply-To: <CAK3+h2yhB3_v8m-5Q0ePDfhH-h1=hK9aCqsN7BHk8NEcwaas5Q@mail.gmail.com>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Tue, 15 Jul 2025 14:54:27 -0700
X-Gm-Features: Ac12FXyLseT80-M4kSeLdXIaV7TtHbYAQvjIr5TCPEaS3K8oP7IV-Opju4xqsjM
Message-ID: <CAK3+h2xZ6yh7N0abu5DP_ftaiE1gQEy8qVi-VvrePssc5+m=eQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] LoongArch: BPF: Add bpf trampoline support for Loongarch
To: Chenghao Duan <duanchenghao@kylinos.cn>
Cc: yangtiezhu@loongson.cn, hengqi.chen@gmail.com, chenhuacai@kernel.org, 
	kernel@xen0n.name, loongarch@lists.linux.dev, guodongtai@kylinos.cn, 
	jianghaoran@kylinos.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 15, 2025 at 2:19=E2=80=AFPM Vincent Li <vincent.mc.li@gmail.com=
> wrote:
>
> On Thu, Jul 10, 2025 at 8:03=E2=80=AFAM Vincent Li <vincent.mc.li@gmail.c=
om> wrote:
> >
> > On Thu, Jul 10, 2025 at 1:05=E2=80=AFAM Chenghao Duan <duanchenghao@kyl=
inos.cn> wrote:
> > >
> > > On Wed, Jul 09, 2025 at 12:08:27PM -0700, Vincent Li wrote:
> > > > Hi Chenghao,
> > > >
> > > > I removed many email recipients for my question because I don't wan=
t
> > > > to bother others, so you could  reply to this and not CC others who
> > > > may not want to be bothered.  Thanks for working on this BPF
> > > > trampoline feature for loongarch, I have been waiting for the bpf
> > > > trampoline feature for loongarch for a long time.
> > > >
> > > >
> > > > On Tue, Jul 8, 2025 at 10:52=E2=80=AFPM Chenghao Duan <duanchenghao=
@kylinos.cn> wrote:
> > > > >
> > > > > BPF trampoline is the critical infrastructure of the BPF subsyste=
m, acting
> > > > > as a mediator between kernel functions and BPF programs. Numerous=
 important
> > > > > features, such as using BPF program for zero overhead kernel intr=
ospection,
> > > > > rely on this key component.
> > > > >
> > > > > The related tests have passed, Including the following technical =
points:
> > > > > 1. fentry
> > > > > 2. fmod_ret
> > > > > 3. fexit
> > > > >
> > > >
> > > > My firewall project https://github.com/vincentmli/loongfire relies =
on
> > > > https://github.com/xdp-project/xdp-tools/tree/main/lib/libxdp which
> > > > relies on "BPF program extension" to attach multiple XDP program to
> > > > one single network interface. Now I can't attach multiple XDP progr=
ams
> > > > to one network interface through libxdp so I use bpf tail call as a
> > > > workaround.  I am not a kernel developer and not  familiar with the
> > > > kernel code so I am not sure if the "BPF program extension" is
> > > > automatically supported after bpf trampoline is supported for
> > > > loongarch, could you shed some light on this? thanks!
> > > >
> > >
> > > Hi Vincent,
> > >
> > > I sincerely apologize, but I'm not quite sure about the specific
> > > scenarios where the "BPF Program Extension" you mentioned is applied.
> > > The trampoline feature allows multiple BPF programs to be attached to
> > > the fentry/fexit points of kernel functions at runtime. I'm not sure =
if
> > > this aligns with your technical approach.
> > >
> > > Chenghao
> > >
> >
> > Thanks for the feedback, the
> > https://github.com/xdp-project/xdp-tools/tree/main/lib/libxdp has
> > section
> > Kernel and BPF program feature compatibility.
> >
> > "The ability to attach multiple BPF programs to a single interface
> > relies on the kernel =E2=80=9CBPF program extension=E2=80=9D feature wh=
ich was
> > introduced by commit be8704ff07d2 (=E2=80=9Cbpf: Introduce dynamic prog=
ram
> > extensions=E2=80=9D) in the upstream kernel and first appeared in kerne=
l
> > release 5.6. To incrementally attach multiple programs, a further
> > refinement added by commit 4a1e7c0c63e0 (=E2=80=9Cbpf: Support attachin=
g
> > freplace programs to multiple attach points=E2=80=9D) is needed; this f=
irst
> > appeared in the upstream kernel version 5.10. The functionality relies
> > on the =E2=80=9CBPF trampolines=E2=80=9D feature which is unfortunately=
 only available
> > on the x86_64 architecture. In other words, kernels before 5.6 can
> > only attach a single XDP program to each interface, kernels 5.6+ can
> > attach multiple programs if they are all attached at the same time,
> > and kernels 5.10 have full support for XDP multiprog on x86_64. On
> > other architectures, only a single program can be attached to each
> > interface."
> >
> > According to the above mentioned commit and  paragraph, I think =E2=80=
=9CBPF
> > program extension=E2=80=9D should be  supported if the architecture sup=
ports
> > trampoline, when libxdp author wrote the above paragraph, probably
> > only X86_64 architecture supported BPF trampolines at that time. I
> > will be glad to help testing that when loongarch BPF trampoline
> > feature is supported :)
> >
>
> I applied the patches on top of 6.16.0-rc6 on my local loongarch
> machine, then tried to run xdp-filter program from xdp-tools project,
> it looks not working with xdp-tools libxdp, got "Bad address" error:
>
> ./xdp-filter/xdp-filter load -m skb -vvv lo
>
>  libxdp: Loaded XDP program xdp_pass, got fd 22
>  libxdp: Duplicated fd 22 to 23 for prog xdp_pass
>  libxdp: Failed to attach test program to dispatcher: Bad address <=3D=3D=
=3D=3D
>  libxdp: Compatibility check for dispatcher program failed: Bad address
>  libxdp: Falling back to loading single prog without dispatcher
>  libxdp: Checking for kernel frags support
>  libxdp: Loading XDP program 'xdp-dispatcher.o' from embedded object file
>
> the error is from xdp-tools lib/libxdp/libxdp.c
>
>         bpf_program__set_type(test_prog->bpf_prog, BPF_PROG_TYPE_EXT);
>         bpf_program__set_expected_attach_type(test_prog->bpf_prog, 0);
>         err =3D xdp_program__load(test_prog);
>         if (err) {
>                 char buf[100] =3D {};
>                 libxdp_strerror(err, buf, sizeof(buf));
>                 pr_debug("Failed to load program %s: %s\n",
>                         xdp_program__name(test_prog), buf);
>                 goto out;
>         }
>
>         test_prog->link_fd =3D bpf_raw_tracepoint_open(NULL, test_prog->p=
rog_fd);
>         if (test_prog->link_fd < 0) {
>                 err =3D -errno;
>                 pr_debug("Failed to attach test program to dispatcher:
> %s\n",  <=3D=3D=3D=3D=3D=3Derror Bad address
>                          strerror(-err));
>                 goto out;
>         }
>

here is strace:

2754  write(2, "libxdp: Duplicated fd 22 to 23 for prog xdp_pass\n", 49) =
=3D 49
2754  bpf(BPF_RAW_TRACEPOINT_OPEN, {raw_tracepoint=3D{name=3DNULL,
prog_fd=3D23}}, 24) =3D -1 EFAULT (Bad address)
2754  write(2, " ", 1)                  =3D 1
2754  write(2, "libxdp: Failed to attach test program to dispatcher:
Bad address\n", 65) =3D 65

deepseek says the  bpf syscall raw tracepoint name should not be NULL,
something related to raw tracepoint?


> xdp-tools/libxdp is a popular project to attach multiple XDP programs
> to a single network interface, packaged in mainstream Linux
> distributions, so it would be nice to get the loongarch kernel bpf
> trampoline working with xdp-tools/libxdp :).
>
> > > > > Co-developed-by: George Guo <guodongtai@kylinos.cn>
> > > > > Signed-off-by: George Guo <guodongtai@kylinos.cn>
> > > > > Signed-off-by: Chenghao Duan <duanchenghao@kylinos.cn>
> > > > > ---
> > > > >  arch/loongarch/net/bpf_jit.c | 391 +++++++++++++++++++++++++++++=
++++++
> > > > >  arch/loongarch/net/bpf_jit.h |   6 +
> > > > >  2 files changed, 397 insertions(+)
> > > > >
> > > > > diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bp=
f_jit.c
> > > > > index 9cb01f0b0..6820558af 100644
> > > > > --- a/arch/loongarch/net/bpf_jit.c
> > > > > +++ b/arch/loongarch/net/bpf_jit.c
> > > > > @@ -7,6 +7,10 @@
> > > > >  #include <linux/memory.h>
> > > > >  #include "bpf_jit.h"
> > > > >
> > > > > +#define LOONGARCH_MAX_REG_ARGS 8
> > > > > +#define LOONGARCH_FENTRY_NINSNS 2
> > > > > +#define LOONGARCH_FENTRY_NBYTES (LOONGARCH_FENTRY_NINSNS * 4)
> > > > > +
> > > > >  #define REG_TCC                LOONGARCH_GPR_A6
> > > > >  #define TCC_SAVED      LOONGARCH_GPR_S5
> > > > >
> > > > > @@ -1400,6 +1404,16 @@ static int gen_jump_or_nops(void *target, =
void *ip, u32 *insns, bool is_call)
> > > > >                                   (unsigned long)ip, (unsigned lo=
ng)target);
> > > > >  }
> > > > >
> > > > > +static int emit_call(struct jit_ctx *ctx, u64 addr)
> > > > > +{
> > > > > +       u64 ip;
> > > > > +
> > > > > +       if (addr && ctx->image && ctx->ro_image)
> > > > > +               ip =3D (u64)(ctx->image + ctx->idx);
> > > > > +
> > > > > +       return emit_jump_and_link(ctx, LOONGARCH_GPR_RA, ip, addr=
);
> > > > > +}
> > > > > +
> > > > >  int bpf_arch_text_poke(void *ip, enum bpf_text_poke_type poke_ty=
pe,
> > > > >                        void *old_addr, void *new_addr)
> > > > >  {
> > > > > @@ -1457,3 +1471,380 @@ void *bpf_arch_text_copy(void *dst, void =
*src, size_t len)
> > > > >
> > > > >         return dst;
> > > > >  }
> > > > > +
> > > > > +static void store_args(struct jit_ctx *ctx, int nargs, int args_=
off)
> > > > > +{
> > > > > +       int i;
> > > > > +
> > > > > +       for (i =3D 0; i < nargs; i++) {
> > > > > +               emit_insn(ctx, std, LOONGARCH_GPR_A0 + i, LOONGAR=
CH_GPR_FP, -args_off);
> > > > > +               args_off -=3D 8;
> > > > > +       }
> > > > > +}
> > > > > +
> > > > > +static void restore_args(struct jit_ctx *ctx, int nargs, int arg=
s_off)
> > > > > +{
> > > > > +       int i;
> > > > > +
> > > > > +       for (i =3D 0; i < nargs; i++) {
> > > > > +               emit_insn(ctx, ldd, LOONGARCH_GPR_A0 + i, LOONGAR=
CH_GPR_FP, -args_off);
> > > > > +               args_off -=3D 8;
> > > > > +       }
> > > > > +}
> > > > > +
> > > > > +static int invoke_bpf_prog(struct jit_ctx *ctx, struct bpf_tramp=
_link *l,
> > > > > +                          int args_off, int retval_off,
> > > > > +                          int run_ctx_off, bool save_ret)
> > > > > +{
> > > > > +       int ret;
> > > > > +       u32 *branch;
> > > > > +       struct bpf_prog *p =3D l->link.prog;
> > > > > +       int cookie_off =3D offsetof(struct bpf_tramp_run_ctx, bpf=
_cookie);
> > > > > +
> > > > > +       if (l->cookie) {
> > > > > +               move_imm(ctx, LOONGARCH_GPR_T1, l->cookie, false)=
;
> > > > > +               emit_insn(ctx, std, LOONGARCH_GPR_T1, LOONGARCH_G=
PR_FP, -run_ctx_off + cookie_off);
> > > > > +       } else {
> > > > > +               emit_insn(ctx, std, LOONGARCH_GPR_ZERO, LOONGARCH=
_GPR_FP,
> > > > > +                         -run_ctx_off + cookie_off);
> > > > > +       }
> > > > > +
> > > > > +       /* arg1: prog */
> > > > > +       move_imm(ctx, LOONGARCH_GPR_A0, (const s64)p, false);
> > > > > +       /* arg2: &run_ctx */
> > > > > +       emit_insn(ctx, addid, LOONGARCH_GPR_A1, LOONGARCH_GPR_FP,=
 -run_ctx_off);
> > > > > +       ret =3D emit_call(ctx, (const u64)bpf_trampoline_enter(p)=
);
> > > > > +       if (ret)
> > > > > +               return ret;
> > > > > +
> > > > > +       /* store prog start time */
> > > > > +       move_reg(ctx, LOONGARCH_GPR_S1, LOONGARCH_GPR_A0);
> > > > > +
> > > > > +       /* if (__bpf_prog_enter(prog) =3D=3D 0)
> > > > > +        *      goto skip_exec_of_prog;
> > > > > +        *
> > > > > +        */
> > > > > +       branch =3D (u32 *)ctx->image + ctx->idx;
> > > > > +       /* nop reserved for conditional jump */
> > > > > +       emit_insn(ctx, nop);
> > > > > +
> > > > > +       /* arg1: &args_off */
> > > > > +       emit_insn(ctx, addid, LOONGARCH_GPR_A0, LOONGARCH_GPR_FP,=
 -args_off);
> > > > > +       if (!p->jited)
> > > > > +               move_imm(ctx, LOONGARCH_GPR_A1, (const s64)p->ins=
nsi, false);
> > > > > +       ret =3D emit_call(ctx, (const u64)p->bpf_func);
> > > > > +       if (ret)
> > > > > +               return ret;
> > > > > +
> > > > > +       if (save_ret) {
> > > > > +               emit_insn(ctx, std, LOONGARCH_GPR_A0, LOONGARCH_G=
PR_FP, -retval_off);
> > > > > +               emit_insn(ctx, std, regmap[BPF_REG_0], LOONGARCH_=
GPR_FP, -(retval_off - 8));
> > > > > +       }
> > > > > +
> > > > > +       /* update branch with beqz */
> > > > > +       if (ctx->image) {
> > > > > +               int offset =3D (void *)(&ctx->image[ctx->idx]) - =
(void *)branch;
> > > > > +               *branch =3D larch_insn_gen_beq(LOONGARCH_GPR_A0, =
LOONGARCH_GPR_ZERO, offset);
> > > > > +       }
> > > > > +
> > > > > +       /* arg1: prog */
> > > > > +       move_imm(ctx, LOONGARCH_GPR_A0, (const s64)p, false);
> > > > > +       /* arg2: prog start time */
> > > > > +       move_reg(ctx, LOONGARCH_GPR_A1, LOONGARCH_GPR_S1);
> > > > > +       /* arg3: &run_ctx */
> > > > > +       emit_insn(ctx, addid, LOONGARCH_GPR_A2, LOONGARCH_GPR_FP,=
 -run_ctx_off);
> > > > > +       ret =3D emit_call(ctx, (const u64)bpf_trampoline_exit(p))=
;
> > > > > +
> > > > > +       return ret;
> > > > > +}
> > > > > +
> > > > > +static void invoke_bpf_mod_ret(struct jit_ctx *ctx, struct bpf_t=
ramp_links *tl,
> > > > > +                              int args_off, int retval_off, int =
run_ctx_off, u32 **branches)
> > > > > +{
> > > > > +       int i;
> > > > > +
> > > > > +       emit_insn(ctx, std, LOONGARCH_GPR_ZERO, LOONGARCH_GPR_FP,=
 -retval_off);
> > > > > +       for (i =3D 0; i < tl->nr_links; i++) {
> > > > > +               invoke_bpf_prog(ctx, tl->links[i], args_off, retv=
al_off,
> > > > > +                               run_ctx_off, true);
> > > > > +               emit_insn(ctx, ldd, LOONGARCH_GPR_T1, LOONGARCH_G=
PR_FP, -retval_off);
> > > > > +               branches[i] =3D (u32 *)ctx->image + ctx->idx;
> > > > > +               emit_insn(ctx, nop);
> > > > > +       }
> > > > > +}
> > > > > +
> > > > > +u64 bpf_jit_alloc_exec_limit(void)
> > > > > +{
> > > > > +       return VMALLOC_END - VMALLOC_START;
> > > > > +}
> > > > > +
> > > > > +void *arch_alloc_bpf_trampoline(unsigned int size)
> > > > > +{
> > > > > +       return bpf_prog_pack_alloc(size, jit_fill_hole);
> > > > > +}
> > > > > +
> > > > > +void arch_free_bpf_trampoline(void *image, unsigned int size)
> > > > > +{
> > > > > +       bpf_prog_pack_free(image, size);
> > > > > +}
> > > > > +
> > > > > +static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, st=
ruct bpf_tramp_image *im,
> > > > > +                                        const struct btf_func_mo=
del *m,
> > > > > +                                        struct bpf_tramp_links *=
tlinks,
> > > > > +                                        void *func_addr, u32 fla=
gs)
> > > > > +{
> > > > > +       int i;
> > > > > +       int stack_size =3D 0, nargs =3D 0;
> > > > > +       int retval_off, args_off, nargs_off, ip_off, run_ctx_off,=
 sreg_off;
> > > > > +       struct bpf_tramp_links *fentry =3D &tlinks[BPF_TRAMP_FENT=
RY];
> > > > > +       struct bpf_tramp_links *fexit =3D &tlinks[BPF_TRAMP_FEXIT=
];
> > > > > +       struct bpf_tramp_links *fmod_ret =3D &tlinks[BPF_TRAMP_MO=
DIFY_RETURN];
> > > > > +       int ret, save_ret;
> > > > > +       void *orig_call =3D func_addr;
> > > > > +       u32 **branches =3D NULL;
> > > > > +
> > > > > +       if (flags & (BPF_TRAMP_F_ORIG_STACK | BPF_TRAMP_F_SHARE_I=
PMODIFY))
> > > > > +               return -ENOTSUPP;
> > > > > +
> > > > > +       /*
> > > > > +        * FP + 8       [ RA to parent func ] return address to p=
arent
> > > > > +        *                    function
> > > > > +        * FP + 0       [ FP of parent func ] frame pointer of pa=
rent
> > > > > +        *                    function
> > > > > +        * FP - 8       [ T0 to traced func ] return address of t=
raced
> > > > > +        *                    function
> > > > > +        * FP - 16      [ FP of traced func ] frame pointer of tr=
aced
> > > > > +        *                    function
> > > > > +        *
> > > > > +        * FP - retval_off  [ return value      ] BPF_TRAMP_F_CAL=
L_ORIG or
> > > > > +        *                    BPF_TRAMP_F_RET_FENTRY_RET
> > > > > +        *                  [ argN              ]
> > > > > +        *                  [ ...               ]
> > > > > +        * FP - args_off    [ arg1              ]
> > > > > +        *
> > > > > +        * FP - nargs_off   [ regs count        ]
> > > > > +        *
> > > > > +        * FP - ip_off      [ traced func   ] BPF_TRAMP_F_IP_ARG
> > > > > +        *
> > > > > +        * FP - run_ctx_off [ bpf_tramp_run_ctx ]
> > > > > +        *
> > > > > +        * FP - sreg_off    [ callee saved reg  ]
> > > > > +        *
> > > > > +        */
> > > > > +
> > > > > +       if (m->nr_args > LOONGARCH_MAX_REG_ARGS)
> > > > > +               return -ENOTSUPP;
> > > > > +
> > > > > +       if (flags & (BPF_TRAMP_F_ORIG_STACK | BPF_TRAMP_F_SHARE_I=
PMODIFY))
> > > > > +               return -ENOTSUPP;
> > > > > +
> > > > > +       stack_size =3D 0;
> > > > > +
> > > > > +       /* room of trampoline frame to store return address and f=
rame pointer */
> > > > > +       stack_size +=3D 16;
> > > > > +
> > > > > +       save_ret =3D flags & (BPF_TRAMP_F_CALL_ORIG | BPF_TRAMP_F=
_RET_FENTRY_RET);
> > > > > +       if (save_ret) {
> > > > > +               /* Save BPF R0 and A0 */
> > > > > +               stack_size +=3D 16;
> > > > > +               retval_off =3D stack_size;
> > > > > +       }
> > > > > +
> > > > > +       /* room of trampoline frame to store args */
> > > > > +       nargs =3D m->nr_args;
> > > > > +       stack_size +=3D nargs * 8;
> > > > > +       args_off =3D stack_size;
> > > > > +
> > > > > +       /* room of trampoline frame to store args number */
> > > > > +       stack_size +=3D 8;
> > > > > +       nargs_off =3D stack_size;
> > > > > +
> > > > > +       /* room of trampoline frame to store ip address */
> > > > > +       if (flags & BPF_TRAMP_F_IP_ARG) {
> > > > > +               stack_size +=3D 8;
> > > > > +               ip_off =3D stack_size;
> > > > > +       }
> > > > > +
> > > > > +       /* room of trampoline frame to store struct bpf_tramp_run=
_ctx */
> > > > > +       stack_size +=3D round_up(sizeof(struct bpf_tramp_run_ctx)=
, 8);
> > > > > +       run_ctx_off =3D stack_size;
> > > > > +
> > > > > +       stack_size +=3D 8;
> > > > > +       sreg_off =3D stack_size;
> > > > > +
> > > > > +       stack_size =3D round_up(stack_size, 16);
> > > > > +
> > > > > +       /* For the trampoline called from function entry */
> > > > > +       /* RA and FP for parent function*/
> > > > > +       emit_insn(ctx, addid, LOONGARCH_GPR_SP, LOONGARCH_GPR_SP,=
 -16);
> > > > > +       emit_insn(ctx, std, LOONGARCH_GPR_RA, LOONGARCH_GPR_SP, 8=
);
> > > > > +       emit_insn(ctx, std, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, 0=
);
> > > > > +       emit_insn(ctx, addid, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP,=
 16);
> > > > > +
> > > > > +       /* RA and FP for traced function*/
> > > > > +       emit_insn(ctx, addid, LOONGARCH_GPR_SP, LOONGARCH_GPR_SP,=
 -stack_size);
> > > > > +       emit_insn(ctx, std, LOONGARCH_GPR_T0, LOONGARCH_GPR_SP, s=
tack_size - 8);
> > > > > +       emit_insn(ctx, std, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, s=
tack_size - 16);
> > > > > +       emit_insn(ctx, addid, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP,=
 stack_size);
> > > > > +
> > > > > +       /* callee saved register S1 to pass start time */
> > > > > +       emit_insn(ctx, std, LOONGARCH_GPR_S1, LOONGARCH_GPR_FP, -=
sreg_off);
> > > > > +
> > > > > +       /* store ip address of the traced function */
> > > > > +       if (flags & BPF_TRAMP_F_IP_ARG) {
> > > > > +               move_imm(ctx, LOONGARCH_GPR_T1, (const s64)func_a=
ddr, false);
> > > > > +               emit_insn(ctx, std, LOONGARCH_GPR_T1, LOONGARCH_G=
PR_FP, -ip_off);
> > > > > +       }
> > > > > +
> > > > > +       /* store nargs number*/
> > > > > +       move_imm(ctx, LOONGARCH_GPR_T1, nargs, false);
> > > > > +       emit_insn(ctx, std, LOONGARCH_GPR_T1, LOONGARCH_GPR_FP, -=
nargs_off);
> > > > > +
> > > > > +       store_args(ctx, nargs, args_off);
> > > > > +
> > > > > +       /* To traced function */
> > > > > +       orig_call +=3D LOONGARCH_FENTRY_NBYTES;
> > > > > +       if (flags & BPF_TRAMP_F_CALL_ORIG) {
> > > > > +               move_imm(ctx, LOONGARCH_GPR_A0, (const s64)im, fa=
lse);
> > > > > +               ret =3D emit_call(ctx, (const u64)__bpf_tramp_ent=
er);
> > > > > +               if (ret)
> > > > > +                       return ret;
> > > > > +       }
> > > > > +
> > > > > +       for (i =3D 0; i < fentry->nr_links; i++) {
> > > > > +               ret =3D invoke_bpf_prog(ctx, fentry->links[i], ar=
gs_off, retval_off,
> > > > > +                                     run_ctx_off, flags & BPF_TR=
AMP_F_RET_FENTRY_RET);
> > > > > +               if (ret)
> > > > > +                       return ret;
> > > > > +       }
> > > > > +       if (fmod_ret->nr_links) {
> > > > > +               branches  =3D kcalloc(fmod_ret->nr_links, sizeof(=
u32 *), GFP_KERNEL);
> > > > > +               if (!branches)
> > > > > +                       return -ENOMEM;
> > > > > +
> > > > > +               invoke_bpf_mod_ret(ctx, fmod_ret, args_off, retva=
l_off,
> > > > > +                                  run_ctx_off, branches);
> > > > > +       }
> > > > > +
> > > > > +       if (flags & BPF_TRAMP_F_CALL_ORIG) {
> > > > > +               restore_args(ctx, m->nr_args, args_off);
> > > > > +               ret =3D emit_call(ctx, (const u64)orig_call);
> > > > > +               if (ret)
> > > > > +                       goto out;
> > > > > +               emit_insn(ctx, std, LOONGARCH_GPR_A0, LOONGARCH_G=
PR_FP, -retval_off);
> > > > > +               emit_insn(ctx, std, regmap[BPF_REG_0], LOONGARCH_=
GPR_FP, -(retval_off - 8));
> > > > > +               im->ip_after_call =3D ctx->ro_image + ctx->idx;
> > > > > +               /* Reserve space for the move_imm + jirl instruct=
ion */
> > > > > +               emit_insn(ctx, nop);
> > > > > +               emit_insn(ctx, nop);
> > > > > +               emit_insn(ctx, nop);
> > > > > +               emit_insn(ctx, nop);
> > > > > +               emit_insn(ctx, nop);
> > > > > +       }
> > > > > +
> > > > > +       for (i =3D 0; ctx->image && i < fmod_ret->nr_links; i++) =
{
> > > > > +               int offset =3D (void *)(&ctx->image[ctx->idx]) - =
(void *)branches[i];
> > > > > +               *branches[i] =3D larch_insn_gen_bne(LOONGARCH_GPR=
_T1, LOONGARCH_GPR_ZERO, offset);
> > > > > +       }
> > > > > +
> > > > > +       for (i =3D 0; i < fexit->nr_links; i++) {
> > > > > +               ret =3D invoke_bpf_prog(ctx, fexit->links[i], arg=
s_off, retval_off,
> > > > > +                                     run_ctx_off, false);
> > > > > +               if (ret)
> > > > > +                       goto out;
> > > > > +       }
> > > > > +
> > > > > +       if (flags & BPF_TRAMP_F_CALL_ORIG) {
> > > > > +               im->ip_epilogue =3D ctx->ro_image + ctx->idx;
> > > > > +               move_imm(ctx, LOONGARCH_GPR_A0, (const s64)im, fa=
lse);
> > > > > +               ret =3D emit_call(ctx, (const u64)__bpf_tramp_exi=
t);
> > > > > +               if (ret)
> > > > > +                       goto out;
> > > > > +       }
> > > > > +
> > > > > +       if (flags & BPF_TRAMP_F_RESTORE_REGS)
> > > > > +               restore_args(ctx, m->nr_args, args_off);
> > > > > +
> > > > > +       if (save_ret) {
> > > > > +               emit_insn(ctx, ldd, LOONGARCH_GPR_A0, LOONGARCH_G=
PR_FP, -retval_off);
> > > > > +               emit_insn(ctx, ldd, regmap[BPF_REG_0], LOONGARCH_=
GPR_FP, -(retval_off - 8));
> > > > > +       }
> > > > > +
> > > > > +       emit_insn(ctx, ldd, LOONGARCH_GPR_S1, LOONGARCH_GPR_FP, -=
sreg_off);
> > > > > +
> > > > > +       /* trampoline called from function entry */
> > > > > +       emit_insn(ctx, ldd, LOONGARCH_GPR_T0, LOONGARCH_GPR_SP, s=
tack_size - 8);
> > > > > +       emit_insn(ctx, ldd, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, s=
tack_size - 16);
> > > > > +       emit_insn(ctx, addid, LOONGARCH_GPR_SP, LOONGARCH_GPR_SP,=
 stack_size);
> > > > > +
> > > > > +       emit_insn(ctx, ldd, LOONGARCH_GPR_RA, LOONGARCH_GPR_SP, 8=
);
> > > > > +       emit_insn(ctx, ldd, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, 0=
);
> > > > > +       emit_insn(ctx, addid, LOONGARCH_GPR_SP, LOONGARCH_GPR_SP,=
 16);
> > > > > +
> > > > > +       if (flags & BPF_TRAMP_F_SKIP_FRAME)
> > > > > +               /* return to parent function */
> > > > > +               emit_insn(ctx, jirl, LOONGARCH_GPR_ZERO, LOONGARC=
H_GPR_RA, 0);
> > > > > +       else
> > > > > +               /* return to traced function */
> > > > > +               emit_insn(ctx, jirl, LOONGARCH_GPR_ZERO, LOONGARC=
H_GPR_T0, 0);
> > > > > +
> > > > > +       ret =3D ctx->idx;
> > > > > +out:
> > > > > +       kfree(branches);
> > > > > +
> > > > > +       return ret;
> > > > > +}
> > > > > +
> > > > > +int arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void=
 *ro_image,
> > > > > +                               void *ro_image_end, const struct =
btf_func_model *m,
> > > > > +                               u32 flags, struct bpf_tramp_links=
 *tlinks,
> > > > > +                               void *func_addr)
> > > > > +{
> > > > > +       int ret;
> > > > > +       void *image, *tmp;
> > > > > +       u32 size =3D ro_image_end - ro_image;
> > > > > +
> > > > > +       image =3D kvmalloc(size, GFP_KERNEL);
> > > > > +       if (!image)
> > > > > +               return -ENOMEM;
> > > > > +
> > > > > +       struct jit_ctx ctx =3D {
> > > > > +               .image =3D (union loongarch_instruction *)image,
> > > > > +               .ro_image =3D (union loongarch_instruction *)ro_i=
mage,
> > > > > +               .idx =3D 0,
> > > > > +       };
> > > > > +
> > > > > +       jit_fill_hole(image, (unsigned int)(ro_image_end - ro_ima=
ge));
> > > > > +       ret =3D __arch_prepare_bpf_trampoline(&ctx, im, m, tlinks=
, func_addr, flags);
> > > > > +       if (ret > 0 && validate_code(&ctx) < 0) {
> > > > > +               ret =3D -EINVAL;
> > > > > +               goto out;
> > > > > +       }
> > > > > +
> > > > > +       tmp =3D bpf_arch_text_copy(ro_image, image, size);
> > > > > +       if (IS_ERR(tmp)) {
> > > > > +               ret =3D PTR_ERR(tmp);
> > > > > +               goto out;
> > > > > +       }
> > > > > +
> > > > > +       bpf_flush_icache(ro_image, ro_image_end);
> > > > > +out:
> > > > > +       kvfree(image);
> > > > > +       return ret < 0 ? ret : size;
> > > > > +}
> > > > > +
> > > > > +int arch_bpf_trampoline_size(const struct btf_func_model *m, u32=
 flags,
> > > > > +                            struct bpf_tramp_links *tlinks, void=
 *func_addr)
> > > > > +{
> > > > > +       struct bpf_tramp_image im;
> > > > > +       struct jit_ctx ctx;
> > > > > +       int ret;
> > > > > +
> > > > > +       ctx.image =3D NULL;
> > > > > +       ctx.idx =3D 0;
> > > > > +
> > > > > +       ret =3D __arch_prepare_bpf_trampoline(&ctx, &im, m, tlink=
s, func_addr, flags);
> > > > > +
> > > > > +       /* Page align */
> > > > > +       return ret < 0 ? ret : round_up(ret * LOONGARCH_INSN_SIZE=
, PAGE_SIZE);
> > > > > +}
> > > > > diff --git a/arch/loongarch/net/bpf_jit.h b/arch/loongarch/net/bp=
f_jit.h
> > > > > index f9c569f53..5697158fd 100644
> > > > > --- a/arch/loongarch/net/bpf_jit.h
> > > > > +++ b/arch/loongarch/net/bpf_jit.h
> > > > > @@ -18,6 +18,7 @@ struct jit_ctx {
> > > > >         u32 *offset;
> > > > >         int num_exentries;
> > > > >         union loongarch_instruction *image;
> > > > > +       union loongarch_instruction *ro_image;
> > > > >         u32 stack_size;
> > > > >  };
> > > > >
> > > > > @@ -308,3 +309,8 @@ static inline int emit_tailcall_jmp(struct ji=
t_ctx *ctx, u8 cond, enum loongarch
> > > > >
> > > > >         return -EINVAL;
> > > > >  }
> > > > > +
> > > > > +static inline void bpf_flush_icache(void *start, void *end)
> > > > > +{
> > > > > +       flush_icache_range((unsigned long)start, (unsigned long)e=
nd);
> > > > > +}
> > > > > --
> > > > > 2.43.0
> > > > >
> > > > >
