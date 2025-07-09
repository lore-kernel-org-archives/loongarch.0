Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0917823B63F
	for <loongarch@lists.linux.dev>; Wed,  9 Jul 2025 19:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752088122; cv=none; b=uQQWO8r5/Hwnf1arF435wTyyN7OuQxeUMk7riWu5GRyFth/+42CKTBHRAy/wEfgRbH43lL1s0u+Q3AXeehJMwrs6xmhUWkGvrHu8F70c31TNwGVkeXZ6xKpAOk93htBiSCcN+BMWbudswG/7pjpF7k/Zz9LjWs2szOkx0hhWWhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752088122; c=relaxed/simple;
	bh=IkCHy5opOJ6W+Ak1u09oRniGEV0VW+Nv6r9mNDEKQhI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r8YmuexIaHzrEnlGw/bC33xa2Ci9woSYGM7TvwroXxDdeuT8qf9DhuJ3hm2gRWURPaU37SL2rQYIEM5EINCxNNMQE69pGgR/cLYJ7OkJNzFMZFvrko8bZIg6nmemSi0lYvmUB3XiVixDY61D7uSLdxGjyHcUCm6YzJsJW3eQb48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H4bLP5SS; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H4bLP5SS"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4a9e7c12decso2838201cf.2
        for <loongarch@lists.linux.dev>; Wed, 09 Jul 2025 12:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752088119; x=1752692919; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BAifU8qHciwTJGUFZqywVYApmk7cJSEiiC7MAY7eSGY=;
        b=H4bLP5SSD/xR8zDf9s9gz/sJEvnAVbz+XZcaGBZC2zTibpNvPbaWxrgkX9juBpALI2
         cT3u10ZklaVzZiqgfkFIoWryO5tvtbz+ldCrDbzM43fXY/DKCKp6ItXVTbzFhgGd0rIH
         Tqj3e65e90HiTFnbgoTwMT/5vvXq3KFA+LrFrdwjqXFi3CeWGs3dCYgUzqa9d6tgn4KL
         UpiqdS9FfPg8Ydt/6ygSLwYf/FNJ4WF/VsQW9+hwyR2eibM8gxZz88ybrGY7jvX65e4M
         lVtljLcOfASW4lp9m17jdEKA40T/Uu25aWWyn/FuRiaW25GFaF780GfejMsSQQxuhCHW
         TK4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752088119; x=1752692919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BAifU8qHciwTJGUFZqywVYApmk7cJSEiiC7MAY7eSGY=;
        b=vFMRn0R6MJRrfTbPwpNjKXxqYkb8yBC85H9V/ny4FoDkrR0rEoWZ1nH5sNwLfia+0K
         RBQnxObovyD/9xs76+YgB//2fzyzehjxSlSdI3+mP9A/sdhpEJu66oJWMTIInz/JVRI2
         g6v+PPy6hIOChFpFh5rqSF+mgBwzpHEG4Lm7zj3rUOuq6qmT1BnRejv6Rdcc6O+NpqYv
         FKtfK7guNGMOeac5NuxpzsDh+zlANFb4ey4w0O/QVWOGT3n+tG3We3MS5zLaqXtULu04
         wTEu0UqhhoMphS15q/a0ga7bAyTIa+GTkSW2EAXJ5ccumz/ktUF0Apz48Ix9JF9sM2eO
         YtYw==
X-Forwarded-Encrypted: i=1; AJvYcCUmGWHuNpFXiZynqhkamB0WRrC14Q/74K2GXrfalsFYfXo01CVYmCHvq3k8WwYjKwM+olBS8DcjQF4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzDY6aUva2k9s6CFOctO5hWRyWsNO4AxmHf6gHR5dFJKKUIWLE/
	u9glwTmXb79wli+IflomVjpDRs/z4EBc28qokskzTRODMvOKXAM3ZOcyjUGvrJlRHzcLN8EryDS
	hFBqPndsOPPpYYMEeAuQ2jl+U18bombO0nj97
X-Gm-Gg: ASbGnctlM16/rFlqJ+3N0mx13g5T1ypy+HNz+AM3h28OCNFVVyrNQdMNO0EJaUpD1MN
	Mzdr+dB4lCwqhfLvaDJtiI0DJWjUSSl4irGtJguy/2pBmHuSsTSSJOw9aXn0f1Rc22IKqZRSjII
	EuQoyQ9GCJUiwv2I+yHJuv20Gk7XOQAXc+2G0Gjo7MbHI=
X-Google-Smtp-Source: AGHT+IHUP9N4Q1aNzCO2QgzcFeIYqeePt5J0ifU7IdBIibbWhp+Jtz7060ZtQz9QqDYej8Tnod20aYru4zswGmMP5HI=
X-Received: by 2002:a05:622a:c3:b0:4a7:ae49:8049 with SMTP id
 d75a77b69052e-4a9decf39f3mr36579561cf.24.1752088118490; Wed, 09 Jul 2025
 12:08:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250709055029.723243-1-duanchenghao@kylinos.cn> <20250709055029.723243-6-duanchenghao@kylinos.cn>
In-Reply-To: <20250709055029.723243-6-duanchenghao@kylinos.cn>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Wed, 9 Jul 2025 12:08:27 -0700
X-Gm-Features: Ac12FXyb3Y1_UxijGrDVtsBoKQs87ZO-Zm-YbpecOtu7qcwV5rlPzMoCVItIaHY
Message-ID: <CAK3+h2zyhKYjRNV+25pngfrtPQdKe6gJFbkmanBx_9Fp+C8VYw@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] LoongArch: BPF: Add bpf trampoline support for Loongarch
To: Chenghao Duan <duanchenghao@kylinos.cn>
Cc: yangtiezhu@loongson.cn, hengqi.chen@gmail.com, chenhuacai@kernel.org, 
	kernel@xen0n.name, loongarch@lists.linux.dev, guodongtai@kylinos.cn, 
	jianghaoran@kylinos.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chenghao,

I removed many email recipients for my question because I don't want
to bother others, so you could  reply to this and not CC others who
may not want to be bothered.  Thanks for working on this BPF
trampoline feature for loongarch, I have been waiting for the bpf
trampoline feature for loongarch for a long time.


On Tue, Jul 8, 2025 at 10:52=E2=80=AFPM Chenghao Duan <duanchenghao@kylinos=
.cn> wrote:
>
> BPF trampoline is the critical infrastructure of the BPF subsystem, actin=
g
> as a mediator between kernel functions and BPF programs. Numerous importa=
nt
> features, such as using BPF program for zero overhead kernel introspectio=
n,
> rely on this key component.
>
> The related tests have passed, Including the following technical points:
> 1. fentry
> 2. fmod_ret
> 3. fexit
>

My firewall project https://github.com/vincentmli/loongfire relies on
https://github.com/xdp-project/xdp-tools/tree/main/lib/libxdp which
relies on "BPF program extension" to attach multiple XDP program to
one single network interface. Now I can't attach multiple XDP programs
to one network interface through libxdp so I use bpf tail call as a
workaround.  I am not a kernel developer and not  familiar with the
kernel code so I am not sure if the "BPF program extension" is
automatically supported after bpf trampoline is supported for
loongarch, could you shed some light on this? thanks!

> Co-developed-by: George Guo <guodongtai@kylinos.cn>
> Signed-off-by: George Guo <guodongtai@kylinos.cn>
> Signed-off-by: Chenghao Duan <duanchenghao@kylinos.cn>
> ---
>  arch/loongarch/net/bpf_jit.c | 391 +++++++++++++++++++++++++++++++++++
>  arch/loongarch/net/bpf_jit.h |   6 +
>  2 files changed, 397 insertions(+)
>
> diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
> index 9cb01f0b0..6820558af 100644
> --- a/arch/loongarch/net/bpf_jit.c
> +++ b/arch/loongarch/net/bpf_jit.c
> @@ -7,6 +7,10 @@
>  #include <linux/memory.h>
>  #include "bpf_jit.h"
>
> +#define LOONGARCH_MAX_REG_ARGS 8
> +#define LOONGARCH_FENTRY_NINSNS 2
> +#define LOONGARCH_FENTRY_NBYTES (LOONGARCH_FENTRY_NINSNS * 4)
> +
>  #define REG_TCC                LOONGARCH_GPR_A6
>  #define TCC_SAVED      LOONGARCH_GPR_S5
>
> @@ -1400,6 +1404,16 @@ static int gen_jump_or_nops(void *target, void *ip=
, u32 *insns, bool is_call)
>                                   (unsigned long)ip, (unsigned long)targe=
t);
>  }
>
> +static int emit_call(struct jit_ctx *ctx, u64 addr)
> +{
> +       u64 ip;
> +
> +       if (addr && ctx->image && ctx->ro_image)
> +               ip =3D (u64)(ctx->image + ctx->idx);
> +
> +       return emit_jump_and_link(ctx, LOONGARCH_GPR_RA, ip, addr);
> +}
> +
>  int bpf_arch_text_poke(void *ip, enum bpf_text_poke_type poke_type,
>                        void *old_addr, void *new_addr)
>  {
> @@ -1457,3 +1471,380 @@ void *bpf_arch_text_copy(void *dst, void *src, si=
ze_t len)
>
>         return dst;
>  }
> +
> +static void store_args(struct jit_ctx *ctx, int nargs, int args_off)
> +{
> +       int i;
> +
> +       for (i =3D 0; i < nargs; i++) {
> +               emit_insn(ctx, std, LOONGARCH_GPR_A0 + i, LOONGARCH_GPR_F=
P, -args_off);
> +               args_off -=3D 8;
> +       }
> +}
> +
> +static void restore_args(struct jit_ctx *ctx, int nargs, int args_off)
> +{
> +       int i;
> +
> +       for (i =3D 0; i < nargs; i++) {
> +               emit_insn(ctx, ldd, LOONGARCH_GPR_A0 + i, LOONGARCH_GPR_F=
P, -args_off);
> +               args_off -=3D 8;
> +       }
> +}
> +
> +static int invoke_bpf_prog(struct jit_ctx *ctx, struct bpf_tramp_link *l=
,
> +                          int args_off, int retval_off,
> +                          int run_ctx_off, bool save_ret)
> +{
> +       int ret;
> +       u32 *branch;
> +       struct bpf_prog *p =3D l->link.prog;
> +       int cookie_off =3D offsetof(struct bpf_tramp_run_ctx, bpf_cookie)=
;
> +
> +       if (l->cookie) {
> +               move_imm(ctx, LOONGARCH_GPR_T1, l->cookie, false);
> +               emit_insn(ctx, std, LOONGARCH_GPR_T1, LOONGARCH_GPR_FP, -=
run_ctx_off + cookie_off);
> +       } else {
> +               emit_insn(ctx, std, LOONGARCH_GPR_ZERO, LOONGARCH_GPR_FP,
> +                         -run_ctx_off + cookie_off);
> +       }
> +
> +       /* arg1: prog */
> +       move_imm(ctx, LOONGARCH_GPR_A0, (const s64)p, false);
> +       /* arg2: &run_ctx */
> +       emit_insn(ctx, addid, LOONGARCH_GPR_A1, LOONGARCH_GPR_FP, -run_ct=
x_off);
> +       ret =3D emit_call(ctx, (const u64)bpf_trampoline_enter(p));
> +       if (ret)
> +               return ret;
> +
> +       /* store prog start time */
> +       move_reg(ctx, LOONGARCH_GPR_S1, LOONGARCH_GPR_A0);
> +
> +       /* if (__bpf_prog_enter(prog) =3D=3D 0)
> +        *      goto skip_exec_of_prog;
> +        *
> +        */
> +       branch =3D (u32 *)ctx->image + ctx->idx;
> +       /* nop reserved for conditional jump */
> +       emit_insn(ctx, nop);
> +
> +       /* arg1: &args_off */
> +       emit_insn(ctx, addid, LOONGARCH_GPR_A0, LOONGARCH_GPR_FP, -args_o=
ff);
> +       if (!p->jited)
> +               move_imm(ctx, LOONGARCH_GPR_A1, (const s64)p->insnsi, fal=
se);
> +       ret =3D emit_call(ctx, (const u64)p->bpf_func);
> +       if (ret)
> +               return ret;
> +
> +       if (save_ret) {
> +               emit_insn(ctx, std, LOONGARCH_GPR_A0, LOONGARCH_GPR_FP, -=
retval_off);
> +               emit_insn(ctx, std, regmap[BPF_REG_0], LOONGARCH_GPR_FP, =
-(retval_off - 8));
> +       }
> +
> +       /* update branch with beqz */
> +       if (ctx->image) {
> +               int offset =3D (void *)(&ctx->image[ctx->idx]) - (void *)=
branch;
> +               *branch =3D larch_insn_gen_beq(LOONGARCH_GPR_A0, LOONGARC=
H_GPR_ZERO, offset);
> +       }
> +
> +       /* arg1: prog */
> +       move_imm(ctx, LOONGARCH_GPR_A0, (const s64)p, false);
> +       /* arg2: prog start time */
> +       move_reg(ctx, LOONGARCH_GPR_A1, LOONGARCH_GPR_S1);
> +       /* arg3: &run_ctx */
> +       emit_insn(ctx, addid, LOONGARCH_GPR_A2, LOONGARCH_GPR_FP, -run_ct=
x_off);
> +       ret =3D emit_call(ctx, (const u64)bpf_trampoline_exit(p));
> +
> +       return ret;
> +}
> +
> +static void invoke_bpf_mod_ret(struct jit_ctx *ctx, struct bpf_tramp_lin=
ks *tl,
> +                              int args_off, int retval_off, int run_ctx_=
off, u32 **branches)
> +{
> +       int i;
> +
> +       emit_insn(ctx, std, LOONGARCH_GPR_ZERO, LOONGARCH_GPR_FP, -retval=
_off);
> +       for (i =3D 0; i < tl->nr_links; i++) {
> +               invoke_bpf_prog(ctx, tl->links[i], args_off, retval_off,
> +                               run_ctx_off, true);
> +               emit_insn(ctx, ldd, LOONGARCH_GPR_T1, LOONGARCH_GPR_FP, -=
retval_off);
> +               branches[i] =3D (u32 *)ctx->image + ctx->idx;
> +               emit_insn(ctx, nop);
> +       }
> +}
> +
> +u64 bpf_jit_alloc_exec_limit(void)
> +{
> +       return VMALLOC_END - VMALLOC_START;
> +}
> +
> +void *arch_alloc_bpf_trampoline(unsigned int size)
> +{
> +       return bpf_prog_pack_alloc(size, jit_fill_hole);
> +}
> +
> +void arch_free_bpf_trampoline(void *image, unsigned int size)
> +{
> +       bpf_prog_pack_free(image, size);
> +}
> +
> +static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, struct bpf=
_tramp_image *im,
> +                                        const struct btf_func_model *m,
> +                                        struct bpf_tramp_links *tlinks,
> +                                        void *func_addr, u32 flags)
> +{
> +       int i;
> +       int stack_size =3D 0, nargs =3D 0;
> +       int retval_off, args_off, nargs_off, ip_off, run_ctx_off, sreg_of=
f;
> +       struct bpf_tramp_links *fentry =3D &tlinks[BPF_TRAMP_FENTRY];
> +       struct bpf_tramp_links *fexit =3D &tlinks[BPF_TRAMP_FEXIT];
> +       struct bpf_tramp_links *fmod_ret =3D &tlinks[BPF_TRAMP_MODIFY_RET=
URN];
> +       int ret, save_ret;
> +       void *orig_call =3D func_addr;
> +       u32 **branches =3D NULL;
> +
> +       if (flags & (BPF_TRAMP_F_ORIG_STACK | BPF_TRAMP_F_SHARE_IPMODIFY)=
)
> +               return -ENOTSUPP;
> +
> +       /*
> +        * FP + 8       [ RA to parent func ] return address to parent
> +        *                    function
> +        * FP + 0       [ FP of parent func ] frame pointer of parent
> +        *                    function
> +        * FP - 8       [ T0 to traced func ] return address of traced
> +        *                    function
> +        * FP - 16      [ FP of traced func ] frame pointer of traced
> +        *                    function
> +        *
> +        * FP - retval_off  [ return value      ] BPF_TRAMP_F_CALL_ORIG o=
r
> +        *                    BPF_TRAMP_F_RET_FENTRY_RET
> +        *                  [ argN              ]
> +        *                  [ ...               ]
> +        * FP - args_off    [ arg1              ]
> +        *
> +        * FP - nargs_off   [ regs count        ]
> +        *
> +        * FP - ip_off      [ traced func   ] BPF_TRAMP_F_IP_ARG
> +        *
> +        * FP - run_ctx_off [ bpf_tramp_run_ctx ]
> +        *
> +        * FP - sreg_off    [ callee saved reg  ]
> +        *
> +        */
> +
> +       if (m->nr_args > LOONGARCH_MAX_REG_ARGS)
> +               return -ENOTSUPP;
> +
> +       if (flags & (BPF_TRAMP_F_ORIG_STACK | BPF_TRAMP_F_SHARE_IPMODIFY)=
)
> +               return -ENOTSUPP;
> +
> +       stack_size =3D 0;
> +
> +       /* room of trampoline frame to store return address and frame poi=
nter */
> +       stack_size +=3D 16;
> +
> +       save_ret =3D flags & (BPF_TRAMP_F_CALL_ORIG | BPF_TRAMP_F_RET_FEN=
TRY_RET);
> +       if (save_ret) {
> +               /* Save BPF R0 and A0 */
> +               stack_size +=3D 16;
> +               retval_off =3D stack_size;
> +       }
> +
> +       /* room of trampoline frame to store args */
> +       nargs =3D m->nr_args;
> +       stack_size +=3D nargs * 8;
> +       args_off =3D stack_size;
> +
> +       /* room of trampoline frame to store args number */
> +       stack_size +=3D 8;
> +       nargs_off =3D stack_size;
> +
> +       /* room of trampoline frame to store ip address */
> +       if (flags & BPF_TRAMP_F_IP_ARG) {
> +               stack_size +=3D 8;
> +               ip_off =3D stack_size;
> +       }
> +
> +       /* room of trampoline frame to store struct bpf_tramp_run_ctx */
> +       stack_size +=3D round_up(sizeof(struct bpf_tramp_run_ctx), 8);
> +       run_ctx_off =3D stack_size;
> +
> +       stack_size +=3D 8;
> +       sreg_off =3D stack_size;
> +
> +       stack_size =3D round_up(stack_size, 16);
> +
> +       /* For the trampoline called from function entry */
> +       /* RA and FP for parent function*/
> +       emit_insn(ctx, addid, LOONGARCH_GPR_SP, LOONGARCH_GPR_SP, -16);
> +       emit_insn(ctx, std, LOONGARCH_GPR_RA, LOONGARCH_GPR_SP, 8);
> +       emit_insn(ctx, std, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, 0);
> +       emit_insn(ctx, addid, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, 16);
> +
> +       /* RA and FP for traced function*/
> +       emit_insn(ctx, addid, LOONGARCH_GPR_SP, LOONGARCH_GPR_SP, -stack_=
size);
> +       emit_insn(ctx, std, LOONGARCH_GPR_T0, LOONGARCH_GPR_SP, stack_siz=
e - 8);
> +       emit_insn(ctx, std, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, stack_siz=
e - 16);
> +       emit_insn(ctx, addid, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, stack_s=
ize);
> +
> +       /* callee saved register S1 to pass start time */
> +       emit_insn(ctx, std, LOONGARCH_GPR_S1, LOONGARCH_GPR_FP, -sreg_off=
);
> +
> +       /* store ip address of the traced function */
> +       if (flags & BPF_TRAMP_F_IP_ARG) {
> +               move_imm(ctx, LOONGARCH_GPR_T1, (const s64)func_addr, fal=
se);
> +               emit_insn(ctx, std, LOONGARCH_GPR_T1, LOONGARCH_GPR_FP, -=
ip_off);
> +       }
> +
> +       /* store nargs number*/
> +       move_imm(ctx, LOONGARCH_GPR_T1, nargs, false);
> +       emit_insn(ctx, std, LOONGARCH_GPR_T1, LOONGARCH_GPR_FP, -nargs_of=
f);
> +
> +       store_args(ctx, nargs, args_off);
> +
> +       /* To traced function */
> +       orig_call +=3D LOONGARCH_FENTRY_NBYTES;
> +       if (flags & BPF_TRAMP_F_CALL_ORIG) {
> +               move_imm(ctx, LOONGARCH_GPR_A0, (const s64)im, false);
> +               ret =3D emit_call(ctx, (const u64)__bpf_tramp_enter);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       for (i =3D 0; i < fentry->nr_links; i++) {
> +               ret =3D invoke_bpf_prog(ctx, fentry->links[i], args_off, =
retval_off,
> +                                     run_ctx_off, flags & BPF_TRAMP_F_RE=
T_FENTRY_RET);
> +               if (ret)
> +                       return ret;
> +       }
> +       if (fmod_ret->nr_links) {
> +               branches  =3D kcalloc(fmod_ret->nr_links, sizeof(u32 *), =
GFP_KERNEL);
> +               if (!branches)
> +                       return -ENOMEM;
> +
> +               invoke_bpf_mod_ret(ctx, fmod_ret, args_off, retval_off,
> +                                  run_ctx_off, branches);
> +       }
> +
> +       if (flags & BPF_TRAMP_F_CALL_ORIG) {
> +               restore_args(ctx, m->nr_args, args_off);
> +               ret =3D emit_call(ctx, (const u64)orig_call);
> +               if (ret)
> +                       goto out;
> +               emit_insn(ctx, std, LOONGARCH_GPR_A0, LOONGARCH_GPR_FP, -=
retval_off);
> +               emit_insn(ctx, std, regmap[BPF_REG_0], LOONGARCH_GPR_FP, =
-(retval_off - 8));
> +               im->ip_after_call =3D ctx->ro_image + ctx->idx;
> +               /* Reserve space for the move_imm + jirl instruction */
> +               emit_insn(ctx, nop);
> +               emit_insn(ctx, nop);
> +               emit_insn(ctx, nop);
> +               emit_insn(ctx, nop);
> +               emit_insn(ctx, nop);
> +       }
> +
> +       for (i =3D 0; ctx->image && i < fmod_ret->nr_links; i++) {
> +               int offset =3D (void *)(&ctx->image[ctx->idx]) - (void *)=
branches[i];
> +               *branches[i] =3D larch_insn_gen_bne(LOONGARCH_GPR_T1, LOO=
NGARCH_GPR_ZERO, offset);
> +       }
> +
> +       for (i =3D 0; i < fexit->nr_links; i++) {
> +               ret =3D invoke_bpf_prog(ctx, fexit->links[i], args_off, r=
etval_off,
> +                                     run_ctx_off, false);
> +               if (ret)
> +                       goto out;
> +       }
> +
> +       if (flags & BPF_TRAMP_F_CALL_ORIG) {
> +               im->ip_epilogue =3D ctx->ro_image + ctx->idx;
> +               move_imm(ctx, LOONGARCH_GPR_A0, (const s64)im, false);
> +               ret =3D emit_call(ctx, (const u64)__bpf_tramp_exit);
> +               if (ret)
> +                       goto out;
> +       }
> +
> +       if (flags & BPF_TRAMP_F_RESTORE_REGS)
> +               restore_args(ctx, m->nr_args, args_off);
> +
> +       if (save_ret) {
> +               emit_insn(ctx, ldd, LOONGARCH_GPR_A0, LOONGARCH_GPR_FP, -=
retval_off);
> +               emit_insn(ctx, ldd, regmap[BPF_REG_0], LOONGARCH_GPR_FP, =
-(retval_off - 8));
> +       }
> +
> +       emit_insn(ctx, ldd, LOONGARCH_GPR_S1, LOONGARCH_GPR_FP, -sreg_off=
);
> +
> +       /* trampoline called from function entry */
> +       emit_insn(ctx, ldd, LOONGARCH_GPR_T0, LOONGARCH_GPR_SP, stack_siz=
e - 8);
> +       emit_insn(ctx, ldd, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, stack_siz=
e - 16);
> +       emit_insn(ctx, addid, LOONGARCH_GPR_SP, LOONGARCH_GPR_SP, stack_s=
ize);
> +
> +       emit_insn(ctx, ldd, LOONGARCH_GPR_RA, LOONGARCH_GPR_SP, 8);
> +       emit_insn(ctx, ldd, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, 0);
> +       emit_insn(ctx, addid, LOONGARCH_GPR_SP, LOONGARCH_GPR_SP, 16);
> +
> +       if (flags & BPF_TRAMP_F_SKIP_FRAME)
> +               /* return to parent function */
> +               emit_insn(ctx, jirl, LOONGARCH_GPR_ZERO, LOONGARCH_GPR_RA=
, 0);
> +       else
> +               /* return to traced function */
> +               emit_insn(ctx, jirl, LOONGARCH_GPR_ZERO, LOONGARCH_GPR_T0=
, 0);
> +
> +       ret =3D ctx->idx;
> +out:
> +       kfree(branches);
> +
> +       return ret;
> +}
> +
> +int arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *ro_ima=
ge,
> +                               void *ro_image_end, const struct btf_func=
_model *m,
> +                               u32 flags, struct bpf_tramp_links *tlinks=
,
> +                               void *func_addr)
> +{
> +       int ret;
> +       void *image, *tmp;
> +       u32 size =3D ro_image_end - ro_image;
> +
> +       image =3D kvmalloc(size, GFP_KERNEL);
> +       if (!image)
> +               return -ENOMEM;
> +
> +       struct jit_ctx ctx =3D {
> +               .image =3D (union loongarch_instruction *)image,
> +               .ro_image =3D (union loongarch_instruction *)ro_image,
> +               .idx =3D 0,
> +       };
> +
> +       jit_fill_hole(image, (unsigned int)(ro_image_end - ro_image));
> +       ret =3D __arch_prepare_bpf_trampoline(&ctx, im, m, tlinks, func_a=
ddr, flags);
> +       if (ret > 0 && validate_code(&ctx) < 0) {
> +               ret =3D -EINVAL;
> +               goto out;
> +       }
> +
> +       tmp =3D bpf_arch_text_copy(ro_image, image, size);
> +       if (IS_ERR(tmp)) {
> +               ret =3D PTR_ERR(tmp);
> +               goto out;
> +       }
> +
> +       bpf_flush_icache(ro_image, ro_image_end);
> +out:
> +       kvfree(image);
> +       return ret < 0 ? ret : size;
> +}
> +
> +int arch_bpf_trampoline_size(const struct btf_func_model *m, u32 flags,
> +                            struct bpf_tramp_links *tlinks, void *func_a=
ddr)
> +{
> +       struct bpf_tramp_image im;
> +       struct jit_ctx ctx;
> +       int ret;
> +
> +       ctx.image =3D NULL;
> +       ctx.idx =3D 0;
> +
> +       ret =3D __arch_prepare_bpf_trampoline(&ctx, &im, m, tlinks, func_=
addr, flags);
> +
> +       /* Page align */
> +       return ret < 0 ? ret : round_up(ret * LOONGARCH_INSN_SIZE, PAGE_S=
IZE);
> +}
> diff --git a/arch/loongarch/net/bpf_jit.h b/arch/loongarch/net/bpf_jit.h
> index f9c569f53..5697158fd 100644
> --- a/arch/loongarch/net/bpf_jit.h
> +++ b/arch/loongarch/net/bpf_jit.h
> @@ -18,6 +18,7 @@ struct jit_ctx {
>         u32 *offset;
>         int num_exentries;
>         union loongarch_instruction *image;
> +       union loongarch_instruction *ro_image;
>         u32 stack_size;
>  };
>
> @@ -308,3 +309,8 @@ static inline int emit_tailcall_jmp(struct jit_ctx *c=
tx, u8 cond, enum loongarch
>
>         return -EINVAL;
>  }
> +
> +static inline void bpf_flush_icache(void *start, void *end)
> +{
> +       flush_icache_range((unsigned long)start, (unsigned long)end);
> +}
> --
> 2.43.0
>
>
