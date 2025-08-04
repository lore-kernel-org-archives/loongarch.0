Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7574D15E97
	for <loongarch@lists.linux.dev>; Mon,  4 Aug 2025 02:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754274297; cv=none; b=O/VB2g1IGA0bJ0ZhLwxtCsCcQNWpw6l+4ugncXKYvQBBcFDMeU4QTVFspNUjrroOPJVg7Ndh9UiMHf7U6Z05O0naFUbH90nbfu7C7Dn1ziavvHpI1+S/yYFalyR4MiuKPTG5iFqs4aCy9ZB1sUeQNGsbf2CdYR58HabT8M0IOGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754274297; c=relaxed/simple;
	bh=vIoLQAriU9QLyBP+GEsvN1SPVlN57wrfxtqM44gQ6uA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZfQ5NB3uWJt3Juv8mnvV1iVQAGeIjvJw1KP4QDiJlE0lu8vP2ajS58ZZwovAJ1Jdx59I8XFm3g0FSYBAdxmYpGBU2U5oTrCKCErDWMmXmtNC0PsifVuyWxdFvNXjya2jT5yZSK9eHx/i7d5b8VDULAS+WEdUkzQ2M73bIR5C7UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LWW4CjRF; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LWW4CjRF"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-433f42c9fe3so1080160b6e.1
        for <loongarch@lists.linux.dev>; Sun, 03 Aug 2025 19:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754274294; x=1754879094; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BnRa1JA/UK/K7tosARzyACz2l637qczjgSNLiyAn2po=;
        b=LWW4CjRFWqXD9UpPs7J3xuwmrCbao6yZcfilUilA+tdrPMXxAtDXYIxec90h8VOT0p
         Tz/j+wiPKvqT2+sWVg5ZM1fD+I31saCu3F6qcsmOmwOPEi2UKhGnQDWAJdcg9z6oVWj2
         /U3z+0UD1+fIHt9sqSPHvEVgXM1hnaClUhzDY2/Nu8DcX8oxOLmA0Q7KumwXraX4kWvG
         ucv/Du6tU2/F4O53NZ+CdJJO2pr9KTnEQWyO7CtnOxamK5gBHQCIv+ySNG+mFsaC4jRn
         7ghx6me8/XEgXPEbukmRMjhqR4dgGY5BHdmkjYtTZLt0K9U8B/mEKNz4lVG6HgOXvkRF
         82dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754274294; x=1754879094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BnRa1JA/UK/K7tosARzyACz2l637qczjgSNLiyAn2po=;
        b=Mzw2Ycc9GiG6gXYm6LBuVr2guYpEQIOQuj1oQbA66/J7fYDcnsW19K8TQk5qW5A8OZ
         Q6PALBS+fzTMCaWycsQ4P4B8p4G/7UOcJRn999845luDXzAb1QDHrn2OGsQ/RcFrpVaj
         e49frczupewHonbomrBYtR4+AaEFAyMzMS1qF2cdIiBnYj+y6qX8UxSYwzA+S/lvk/zx
         C5+GW01pvcFA82IOWrKq2+s56z7mQWhObFHVc/vP9dEW0h8CdXjxXa0u29n6picuVRrg
         Gn3QaxGewWdPY/UPhqCKB9nBVAtaweap7k9mfqHYbOJZY6IGXbHPLAj84q/SCtC1Yp+Y
         fqCA==
X-Forwarded-Encrypted: i=1; AJvYcCXrRWD0bd2sE6X90ZgScnc5MqWaahbcfEiom57CElapSDmRZb78zVrVgwkUfS8UphaFa9+vdxiqMQk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzwj8WvL9dlx5qmMFvSsqTSlniexsYWtsLqK90XBR8/OtNbP+r7
	Hx3L2HqcYk0YU7RCcKy/MLBHmBCSlv+4iVGi1bF9hQwAteLBt+/Ina/n3varKizkOCc7b8DXaQc
	LogzXuaLKBAMh3kViuPHJO3tiAv8vW9c=
X-Gm-Gg: ASbGncsFVMN7HYQ83+NmVUU2JaB3nm9U0IZDkIs+IpbadvgOKf5VQi1E5oyFwASYZEN
	MRRaqaO8qFJwg4REJb5oE8Z7WHqRBZlbq2JJmtwT47F0ZcFW2kKfLemUPZY5Uk0onZDewqXeVJs
	WzKdSb7JYOLF/O4r1czwI5QCM4EdIxYVOmsxt7L+B7AtinjFt+v79t9I8ppmSkJAsIN8e8JtLz/
	uYQcag=
X-Google-Smtp-Source: AGHT+IHhH1YIlg21cr4MIGPuqerm1W25W6/jSAdfR4y9B8Edf1oakdGia3Vc0Pk46NXYA8Hkr1xOm7gYnffSPLFPPZ0=
X-Received: by 2002:a05:6808:1910:b0:433:ff53:1b7e with SMTP id
 5614622812f47-433ff532639mr2765208b6e.11.1754274294309; Sun, 03 Aug 2025
 19:24:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250730131257.124153-1-duanchenghao@kylinos.cn> <20250730131257.124153-4-duanchenghao@kylinos.cn>
In-Reply-To: <20250730131257.124153-4-duanchenghao@kylinos.cn>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Mon, 4 Aug 2025 10:24:43 +0800
X-Gm-Features: Ac12FXw54_4HRJNzwKhuZVYGpesI_S2zavu44x_15b5aAywWy_Y1r58SRvoBSUo
Message-ID: <CAEyhmHQOeKmQZnq9RvaPANdLfcsAJX=xU+nL+p4=sPwcYPOfGw@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] LoongArch: BPF: Implement dynamic code
 modification support
To: Chenghao Duan <duanchenghao@kylinos.cn>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	yangtiezhu@loongson.cn, chenhuacai@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev, 
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
	haoluo@google.com, jolsa@kernel.org, kernel@xen0n.name, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, bpf@vger.kernel.org, 
	guodongtai@kylinos.cn, youling.tang@linux.dev, jianghaoran@kylinos.cn, 
	vincent.mc.li@gmail.com, geliang@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2025 at 9:13=E2=80=AFPM Chenghao Duan <duanchenghao@kylinos=
.cn> wrote:
>
> This commit adds support for BPF dynamic code modification on the
> LoongArch architecture.:
> 1. Implement bpf_arch_text_poke() for runtime instruction patching.
> 2. Add bpf_arch_text_copy() for instruction block copying.
> 3. Create bpf_arch_text_invalidate() for code invalidation.
>
> On LoongArch, since symbol addresses in the direct mapping
> region cannot be reached via relative jump instructions from the paged
> mapping region, we use the move_imm+jirl instruction pair as absolute
> jump instructions. These require 2-5 instructions, so we reserve 5 NOP
> instructions in the program as placeholders for function jumps.
>
> larch_insn_text_copy is solely used for BPF. The use of
> larch_insn_text_copy() requires page_size alignment. Currently, only
> the size of the trampoline is page-aligned.
>
> Co-developed-by: George Guo <guodongtai@kylinos.cn>
> Signed-off-by: George Guo <guodongtai@kylinos.cn>
> Signed-off-by: Chenghao Duan <duanchenghao@kylinos.cn>
> ---
>  arch/loongarch/include/asm/inst.h |   1 +
>  arch/loongarch/kernel/inst.c      |  27 ++++++++
>  arch/loongarch/net/bpf_jit.c      | 104 ++++++++++++++++++++++++++++++
>  3 files changed, 132 insertions(+)
>
> diff --git a/arch/loongarch/include/asm/inst.h b/arch/loongarch/include/a=
sm/inst.h
> index 2ae96a35d..88bb73e46 100644
> --- a/arch/loongarch/include/asm/inst.h
> +++ b/arch/loongarch/include/asm/inst.h
> @@ -497,6 +497,7 @@ void arch_simulate_insn(union loongarch_instruction i=
nsn, struct pt_regs *regs);
>  int larch_insn_read(void *addr, u32 *insnp);
>  int larch_insn_write(void *addr, u32 insn);
>  int larch_insn_patch_text(void *addr, u32 insn);
> +int larch_insn_text_copy(void *dst, void *src, size_t len);
>
>  u32 larch_insn_gen_nop(void);
>  u32 larch_insn_gen_b(unsigned long pc, unsigned long dest);
> diff --git a/arch/loongarch/kernel/inst.c b/arch/loongarch/kernel/inst.c
> index 674e3b322..7df63a950 100644
> --- a/arch/loongarch/kernel/inst.c
> +++ b/arch/loongarch/kernel/inst.c
> @@ -4,6 +4,7 @@
>   */
>  #include <linux/sizes.h>
>  #include <linux/uaccess.h>
> +#include <linux/set_memory.h>
>
>  #include <asm/cacheflush.h>
>  #include <asm/inst.h>
> @@ -218,6 +219,32 @@ int larch_insn_patch_text(void *addr, u32 insn)
>         return ret;
>  }
>
> +int larch_insn_text_copy(void *dst, void *src, size_t len)
> +{
> +       int ret;
> +       unsigned long flags;
> +       unsigned long dst_start, dst_end, dst_len;
> +
> +       dst_start =3D round_down((unsigned long)dst, PAGE_SIZE);
> +       dst_end =3D round_up((unsigned long)dst + len, PAGE_SIZE);
> +       dst_len =3D dst_end - dst_start;
> +
> +       set_memory_rw(dst_start, dst_len / PAGE_SIZE);
> +       raw_spin_lock_irqsave(&patch_lock, flags);
> +
> +       ret =3D copy_to_kernel_nofault(dst, src, len);
> +       if (ret)
> +               pr_err("%s: operation failed\n", __func__);
> +
> +       raw_spin_unlock_irqrestore(&patch_lock, flags);
> +       set_memory_rox(dst_start, dst_len / PAGE_SIZE);
> +
> +       if (!ret)
> +               flush_icache_range((unsigned long)dst, (unsigned long)dst=
 + len);
> +
> +       return ret;
> +}
> +
>  u32 larch_insn_gen_nop(void)
>  {
>         return INSN_NOP;
> diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
> index 7032f11d3..5e6ae7e0e 100644
> --- a/arch/loongarch/net/bpf_jit.c
> +++ b/arch/loongarch/net/bpf_jit.c
> @@ -4,8 +4,12 @@
>   *
>   * Copyright (C) 2022 Loongson Technology Corporation Limited
>   */
> +#include <linux/memory.h>
>  #include "bpf_jit.h"
>
> +#define LOONGARCH_LONG_JUMP_NINSNS 5
> +#define LOONGARCH_LONG_JUMP_NBYTES (LOONGARCH_LONG_JUMP_NINSNS * 4)
> +
>  #define REG_TCC                LOONGARCH_GPR_A6
>  #define TCC_SAVED      LOONGARCH_GPR_S5
>
> @@ -88,6 +92,7 @@ static u8 tail_call_reg(struct jit_ctx *ctx)
>   */
>  static void build_prologue(struct jit_ctx *ctx)
>  {
> +       int i;
>         int stack_adjust =3D 0, store_offset, bpf_stack_adjust;
>
>         bpf_stack_adjust =3D round_up(ctx->prog->aux->stack_depth, 16);
> @@ -98,6 +103,10 @@ static void build_prologue(struct jit_ctx *ctx)
>         stack_adjust =3D round_up(stack_adjust, 16);
>         stack_adjust +=3D bpf_stack_adjust;
>
> +       /* Reserve space for the move_imm + jirl instruction */
> +       for (i =3D 0; i < LOONGARCH_LONG_JUMP_NINSNS; i++)
> +               emit_insn(ctx, nop);
> +
>         /*
>          * First instruction initializes the tail call count (TCC).
>          * On tail call we skip this instruction, and the TCC is
> @@ -1367,3 +1376,98 @@ bool bpf_jit_supports_subprog_tailcalls(void)
>  {
>         return true;
>  }
> +
> +static int emit_jump_and_link(struct jit_ctx *ctx, u8 rd, u64 target)
> +{
> +       if (!target) {
> +               pr_err("bpf_jit: jump target address is error\n");
> +               return -EFAULT;
> +       }
> +
> +       move_imm(ctx, LOONGARCH_GPR_T1, target, false);
> +       emit_insn(ctx, jirl, rd, LOONGARCH_GPR_T1, 0);
> +
> +       return 0;
> +}
> +
> +static int gen_jump_or_nops(void *target, void *ip, u32 *insns, bool is_=
call)
> +{
> +       struct jit_ctx ctx;
> +
> +       ctx.idx =3D 0;
> +       ctx.image =3D (union loongarch_instruction *)insns;
> +
> +       if (!target) {
> +               emit_insn((&ctx), nop);
> +               emit_insn((&ctx), nop);
> +               return 0;
> +       }
> +
> +       return emit_jump_and_link(&ctx, is_call ? LOONGARCH_GPR_T0 : LOON=
GARCH_GPR_ZERO,
> +                                 (unsigned long)target);
> +}
> +
> +int bpf_arch_text_poke(void *ip, enum bpf_text_poke_type poke_type,
> +                      void *old_addr, void *new_addr)
> +{
> +       u32 old_insns[LOONGARCH_LONG_JUMP_NINSNS] =3D {[0 ... 4] =3D INSN=
_NOP};
> +       u32 new_insns[LOONGARCH_LONG_JUMP_NINSNS] =3D {[0 ... 4] =3D INSN=
_NOP};
> +       bool is_call =3D poke_type =3D=3D BPF_MOD_CALL;
> +       int ret;
> +
> +       if (!is_kernel_text((unsigned long)ip) &&
> +               !is_bpf_text_address((unsigned long)ip))
> +               return -ENOTSUPP;
> +
> +       ret =3D gen_jump_or_nops(old_addr, ip, old_insns, is_call);
> +       if (ret)
> +               return ret;
> +
> +       if (memcmp(ip, old_insns, LOONGARCH_LONG_JUMP_NBYTES))
> +               return -EFAULT;
> +
> +       ret =3D gen_jump_or_nops(new_addr, ip, new_insns, is_call);
> +       if (ret)
> +               return ret;
> +
> +       mutex_lock(&text_mutex);
> +       if (memcmp(ip, new_insns, LOONGARCH_LONG_JUMP_NBYTES))
> +               ret =3D larch_insn_text_copy(ip, new_insns, LOONGARCH_LON=
G_JUMP_NBYTES);
> +       mutex_unlock(&text_mutex);

The text_mutex and patch_lock inside larch_insn_text_copy() ONLY
prevent concurrent modifications.
You may need stop_machine() to prevent concurrent modifications/executions.

> +       return ret;
> +}
> +
> +int bpf_arch_text_invalidate(void *dst, size_t len)
> +{
> +       int i;
> +       int ret =3D 0;
> +       u32 *inst;
> +
> +       inst =3D kvmalloc(len, GFP_KERNEL);
> +       if (!inst)
> +               return -ENOMEM;
> +
> +       for (i =3D 0; i < (len/sizeof(u32)); i++)
> +               inst[i] =3D INSN_BREAK;
> +
> +       mutex_lock(&text_mutex);
> +       if (larch_insn_text_copy(dst, inst, len))
> +               ret =3D -EINVAL;
> +       mutex_unlock(&text_mutex);
> +
> +       kvfree(inst);
> +       return ret;
> +}
> +
> +void *bpf_arch_text_copy(void *dst, void *src, size_t len)
> +{
> +       int ret;
> +
> +       mutex_lock(&text_mutex);
> +       ret =3D larch_insn_text_copy(dst, src, len);
> +       mutex_unlock(&text_mutex);
> +       if (ret)
> +               return ERR_PTR(-EINVAL);
> +
> +       return dst;
> +}
> --
> 2.25.1
>
