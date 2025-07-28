Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978251D130E
	for <loongarch@lists.linux.dev>; Mon, 28 Jul 2025 10:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753700335; cv=none; b=C3+0QN1dquUhLt1DCsuh8BKfZa18ybJOEpRF9yy2r5zi3dKhXYaOSgYNCQMaVX0vCQ217/eb1LqsWV2pSh99vlE2qaGVGgLF3YmT8eLmK3ueJoM9VfkxpcWrfgys84H4WWaT0UYN0VAR2BGL7jyDCYQvlSz6ovWvdm2lXn1qSDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753700335; c=relaxed/simple;
	bh=PJx5QFJu4D/LZBoDqRYRjZDFXuO2cYXXjGixhwMsXMc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UrMSMXmnE0ZxBubbwtEsOIFKlvvIPFxX3DL4GnGbWOKgN/FB5nm9eDv9cYFUt1mOIiFsX2VCzFjF66N2lE7qh3pkLvmvY1RimiXA6qmhGikDkuwnJ2pTRMcQMNfM2X49j4SlAxdPL4bxsrHwuCIbiT68aJBW3pVdKgEg7EGM58Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WkwT9E7C; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WkwT9E7C"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-41bc2668f85so2538048b6e.2
        for <loongarch@lists.linux.dev>; Mon, 28 Jul 2025 03:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753700333; x=1754305133; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eDEJIKTxjQ+aMs9QZUcVbyCxKMaauKOrQlNqFqKUv+Q=;
        b=WkwT9E7C9X6ON1DARw+iXSbxGYcT9kblp/3J03oMg+J5erCn8WFaiQri3U7TjpY/Ao
         v9PLPv5+oHKnlVxk+gXB1zhWHw4eR0wZ/Iy++mpzKfPisaUZG6owY5+se9ott1o556MH
         NwfnKjDSEfLfr8uM+B3C1NP8IazI5I+duPknBcIMdc1Lg2Kws/SYp3MLDMjUs3Upym9Q
         CuurPJXfufJHGLPjGctxvQPIF2ZYWU2TVe2Olx8tkkwvMygUYnn3lRnaQJTx4KiVq2od
         3EegZzMZjGWDXpjP70UUZwYgUqZIDk/Dxp8wM0VsC3G6tHMTfE4EUr7ESrzYo37gCYuZ
         jv5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753700333; x=1754305133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eDEJIKTxjQ+aMs9QZUcVbyCxKMaauKOrQlNqFqKUv+Q=;
        b=ddGrjBnQFqwODR3vkjiYF/qCDpI3m60JTaaW/xx9TKf7u/jMn/g9RO933Zj6WzJVHo
         k8r2JIGq3wWkGZ+scj6rA4eevTaXsjNejxTjOO5e2b1f3aaP3KhfMR8BgH1zhN6DQvwL
         9BwOWxrjn/saYhdhM25mHcQHaU6Ik7u+OhiK6+AvEhgzbfFYp+oXMiyIlCvAvYylmD98
         lsoQzl4uBCzdI057uv1wCq+CiXSXzCrzNG/qhTXikCkp4CuCzsyRVAxbxTqC9m9RR8my
         j8DEjlgFAR1D/ZSgQxnsKqrzH22dJ/4R1CK8Xm9y0hsz6cInKv1c5oj4cR3wEpZSHlrl
         9IxA==
X-Forwarded-Encrypted: i=1; AJvYcCWlNV8NqcVtaUmRLS/O5iwG9RpqP4JQkAtnd1SOqJvoODFz1lJ8J348fsM8i+7CwXVoWzp+umG+WYo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyD9nr9T13T8vv+U5GmB2UE8SoTVczDyTwAjeIG5kkmtwFZgL23
	vsHNTF5USpjsLJhI6Pc+YOmSKvNxce7eKRCl2x6TghDH94N2fLxOb6c9dXa4VlSFbAE/HLgJdDL
	wqsJB58On+npf5/ixEIN5TCul7g/tEwM=
X-Gm-Gg: ASbGncsBaEH6KNE20FQWDZw23C1SRqgjCcViDr++Vi95paoTuhxQFO68YLZgN2W9Sij
	PZ5I2LdFg4/5wwCiBePgbDBMb2D/EWwLyLM84enEPLFtGLSG0EQdXom3TauZZ0RpsbO+nzpnWSE
	OIieb2ODn2UvJDQEscI6zMtxYXs4hUXNNwSEKdMYwGzk1Vm02/LuBT1Z1OoZJQD3tYeOJXvMYwt
	qhe/tg=
X-Google-Smtp-Source: AGHT+IGpUAIuaI/QMGskND7VYzAO96CE8mnJtwOJyCoN9XAfCpbJjoFiBQK5I0m0bWthNQwudSVYkrlN95R2xNODggQ=
X-Received: by 2002:a05:6808:13d6:b0:41c:4d35:c1c2 with SMTP id
 5614622812f47-42bb77d78aamr5784172b6e.11.1753700332574; Mon, 28 Jul 2025
 03:58:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250724141929.691853-1-duanchenghao@kylinos.cn> <20250724141929.691853-4-duanchenghao@kylinos.cn>
In-Reply-To: <20250724141929.691853-4-duanchenghao@kylinos.cn>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Mon, 28 Jul 2025 18:58:41 +0800
X-Gm-Features: Ac12FXyGftQxSZt7TbOWZ5dGm2PuD9KdlQWwA3g-Yhu287iIO8pn3G1CvgOw6Xk
Message-ID: <CAEyhmHQAAE_a7X4UWHVsKq3hp2jd4LRDP31kOjL_E-bz9coqYw@mail.gmail.com>
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

The subject line seems kind of casual, bpf_arch_xxxxx ?

> Co-developed-by: George Guo <guodongtai@kylinos.cn>
> Signed-off-by: George Guo <guodongtai@kylinos.cn>
> Signed-off-by: Chenghao Duan <duanchenghao@kylinos.cn>
> Reviewed-by: Hengqi Chen <hengqi.chen@gmail.com>
> Reviewed-by: Huacai Chen <chenhuacai@kernel.org>

I didn't leave a Reviewed-by tag last time, no ?

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
