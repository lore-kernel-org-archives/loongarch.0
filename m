Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4401454739
	for <loongarch@lists.linux.dev>; Mon, 28 Jul 2025 10:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753699636; cv=none; b=Vqq/Wfc5MxDIfo0B5uZ236kazvEcAT1vWURxZkPgKTzvDYrGFhCSD5RBAJxideEgvfiaOT5FuD/rzy+iVSAtRbz8vVoWXUs/02bBLuJWaauVyPAOpJM213P3ftNapmTpRcaGgezGU5JlxZooabM8WAnl6SKU4sh/5PAZDnQOwxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753699636; c=relaxed/simple;
	bh=8y3h100MF2waYLHxEYW4tpbWqLpE6NrR9UtGd5nEcfo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nU1aeOMHdp98EIxgJpAfRBRotYgdVdeFFTFlOsESBOnELtijcNdheB45fR9MGTXaMRvkNi6xXli143Xh6o887AF/M8hgns4lHef0N8TdjlRawznX5OZc63OdZOTzwWwEhPZqFRgHhykmeVk+7fch+On89U1px9OriCL46ZE8eDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YtEAhvjh; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YtEAhvjh"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-41b7d12401bso2496447b6e.1
        for <loongarch@lists.linux.dev>; Mon, 28 Jul 2025 03:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753699634; x=1754304434; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1/K1uetCxj7YK34KvSZ6RXT5MvbIvnxlVqahFZoYF8=;
        b=YtEAhvjhAmM0nDpUr+9nuUv7aU4O8MA9LrM/DuSNISPl/XpIPIE2HGBejb49hjJcMi
         ZEN3ZJ5l2BTeiFwjgfStslwejS97stG2JgR1ToxToREzYq2jUvvMnAq+Fbo532yocECU
         tdjXxW/o88SZwX3l1N4Ec3BNFTXkjTaCDUJt4Ws91Gk2bGNNxRL4JgG09EKuRv/CtSqa
         x0zdDtiO2uNrMCkMpFMAu9GA4k+CYSl89Vd1fFyYG3/hdZr256fAeXnbC4oYiMfkdE0e
         byRTouU1Ta4e0zSieG8OK2rlESUl1zgyFGX0XiITKdL5uQrtpQK3b+jINDmNmrKITzFc
         zMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753699634; x=1754304434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g1/K1uetCxj7YK34KvSZ6RXT5MvbIvnxlVqahFZoYF8=;
        b=adxSbYpswJDYQiQ/rsonlM+CwY30Va4BESpM8W/w8B/Z2Br51N82EZrfn/f2Z4B/sw
         fnwA8+NVyilI9mvtJBt7EDGi6q+1/NT3tEmOLk44CMM000XhqlE/cupLK4BQz1AzNzun
         JVbqxia0pOmrkr+nSot9GHZY+qVBeERQ0SsQDdxeGY7SZya67ulXU+zjmRwNXLYgCScA
         GReY1It549aIVTNEvsKmmIb/K824OHgeSr32YtNbdOd2E4AuGB0IeIHSRQyYsjlKb3eh
         tvzfLU+8N/yAPsXBRR4cbjxQQLpMPu4zsTS6wkL9KQQm4kjeD8W8hWb1VF1A6Zl7WcMb
         BtXw==
X-Forwarded-Encrypted: i=1; AJvYcCUaA4JjeNae4LHI6Nb5o/gGlGsfZs9p6olbIpJ3HwUfJPxFuqJwlhegUHpEk9r152bUyYLRNtHBJ8g=@lists.linux.dev
X-Gm-Message-State: AOJu0YxtWH08pCG28nn+hOU/IQzRmaslNwafP0RexbE7B0rPBlhK10FC
	y5myDE76fGWZiMC3olUUhfr4ZmTtjSP1BeYhSbNHRWMSXqsp0kQ7w29So2U3VO/Z4/HbxpamrdR
	48E8b0p31ULAotHSaGF0VIT4rVLGGU8jDaF6Xv0E=
X-Gm-Gg: ASbGnct7vG/PNvurXO2bOUTkReG8kprT0XLEW8p46lc/UsH6ffFm4UKjmeoFXmuqE/g
	BXq7euocDRzZvvj1NnwUn++CF/L+3XG0JGCEWg2bwTJ8yfKrr+qhQ4sGzK0EIwBXF23yUmPmoCV
	dsEKgth8KaGUqckPeyEXgLNRaKgT1pOAzs3MYCtnIDAdi7rbPmLuLCMWL9FuU/XC/y9cN7IcgEx
	g/1wVk=
X-Google-Smtp-Source: AGHT+IEbs/CPUvoC207W88gxNUz1R4xGlysm19XDoofeVgAWWcEO1zyWYEniC5FZfj/MitnvPCuEoJ2UHswDpLvRGZ8=
X-Received: by 2002:a05:6808:bc7:b0:403:50e7:83e1 with SMTP id
 5614622812f47-42bb76ddf69mr5464714b6e.11.1753699634038; Mon, 28 Jul 2025
 03:47:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250724141929.691853-1-duanchenghao@kylinos.cn> <20250724141929.691853-4-duanchenghao@kylinos.cn>
In-Reply-To: <20250724141929.691853-4-duanchenghao@kylinos.cn>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Mon, 28 Jul 2025 18:47:03 +0800
X-Gm-Features: Ac12FXz307K8bAIBPzHfaq6qmjqxxiAnHJRSewm21oMjxXanNkTh4bIvMmSs3LQ
Message-ID: <CAEyhmHREKJ7WQ+SYiGTX+zypeZYcUdPNKtHu6cPxqb1wid7TtQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] LoongArch: BPF: Add bpf_arch_xxxxx support for Loongarch
To: Chenghao Duan <duanchenghao@kylinos.cn>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	yangtiezhu@loongson.cn, chenhuacai@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev, 
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
	haoluo@google.com, jolsa@kernel.org, kernel@xen0n.name, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, bpf@vger.kernel.org, 
	guodongtai@kylinos.cn, youling.tang@linux.dev, jianghaoran@kylinos.cn, 
	vincent.mc.li@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 10:21=E2=80=AFPM Chenghao Duan <duanchenghao@kylino=
s.cn> wrote:
>
> Implement the functions of bpf_arch_text_poke, bpf_arch_text_copy, and
> bpf_arch_text_invalidate on the LoongArch architecture.
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
> Reviewed-by: Hengqi Chen <hengqi.chen@gmail.com>
> Reviewed-by: Huacai Chen <chenhuacai@kernel.org>
> ---
>  arch/loongarch/include/asm/inst.h |  1 +
>  arch/loongarch/kernel/inst.c      | 32 ++++++++++
>  arch/loongarch/net/bpf_jit.c      | 97 +++++++++++++++++++++++++++++++
>  3 files changed, 130 insertions(+)
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
> index 674e3b322..8d6594968 100644
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
> @@ -218,6 +219,37 @@ int larch_insn_patch_text(void *addr, u32 insn)
>         return ret;
>  }
>
> +int larch_insn_text_copy(void *dst, void *src, size_t len)
> +{
> +       unsigned long flags;
> +       size_t wlen =3D 0;
> +       size_t size;
> +       void *ptr;
> +       int ret =3D 0;
> +
> +       set_memory_rw((unsigned long)dst, round_up(len, PAGE_SIZE) / PAGE=
_SIZE);
> +       raw_spin_lock_irqsave(&patch_lock, flags);
> +       while (wlen < len) {
> +               ptr =3D dst + wlen;
> +               size =3D min_t(size_t, PAGE_SIZE - offset_in_page(ptr),
> +                            len - wlen);
> +
> +               ret =3D copy_to_kernel_nofault(ptr, src + wlen, size);
> +               if (ret) {
> +                       pr_err("%s: operation failed\n", __func__);
> +                       break;
> +               }
> +               wlen +=3D size;
> +       }
> +       raw_spin_unlock_irqrestore(&patch_lock, flags);
> +       set_memory_rox((unsigned long)dst, round_up(len, PAGE_SIZE) / PAG=
E_SIZE);
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
> index 7032f11d3..86504e710 100644
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
> @@ -1367,3 +1376,91 @@ bool bpf_jit_supports_subprog_tailcalls(void)
>  {
>         return true;
>  }
> +
> +static int emit_jump_and_link(struct jit_ctx *ctx, u8 rd, u64 target)
> +{
> +       if (!target) {
> +               pr_err("bpf_jit: jump target address is error\n");

is error ? is NULL ?

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
> +       if (larch_insn_text_copy(dst, inst, len))

Do we need text_mutex here and below for larch_insn_text_copy() ?

> +               ret =3D -EINVAL;
> +
> +       kvfree(inst);
> +       return ret;
> +}
> +
> +void *bpf_arch_text_copy(void *dst, void *src, size_t len)
> +{
> +       if (larch_insn_text_copy(dst, src, len))
> +               return ERR_PTR(-EINVAL);
> +
> +       return dst;
> +}
> --
> 2.25.1
>
