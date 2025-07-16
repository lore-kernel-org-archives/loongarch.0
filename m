Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD3729AAF9
	for <loongarch@lists.linux.dev>; Wed, 16 Jul 2025 18:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752691298; cv=none; b=GYGqFx+507WOGhkyXwsPXHnRCYUQ/d3QJ7hAl7MZl4VjEeWSU9nKqQXR3vTprnB1Jlxhu6N/e6MC9Uw3VrFa7zNt7bOILs2Gaqdstkde57aciuVAgYi69A/WPQGwbXqUr2+zBqm/fbC8q4qvaDIXyvbn7ubnvC/w6OiOV2pv9m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752691298; c=relaxed/simple;
	bh=VumIU/sQM3hsahHgvU+bHUnU0BcQF4aFEvHlkCVGo4c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uE9SvjaIPI282l1EYjKtxNvG0WewB0PptPWc/7Eq1gdGA1gYqLuxtSpqATwxV2cM8IpXxCA9+lDITtcYIAns7cTLX5RI1jbWjpE0QJIXNNKbwSuYpfny9lzwsXI1P/FOOLDvrlzix/Yl368HgZzqL1KXyawG+L+JGaWIzw6O4Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bw+H3AUJ; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bw+H3AUJ"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4ab6b3e8386so1849841cf.3
        for <loongarch@lists.linux.dev>; Wed, 16 Jul 2025 11:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752691296; x=1753296096; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=20DFtMKXGjzMStkeiX0rV+WhW7MQLkFjtE1G1H2gznA=;
        b=Bw+H3AUJd2ITHNL/QNjA8oCBstcfMhPyQ/ZRPrW1f6SY9tcoKNto9b/MUim7JoY/r2
         u7rQ/YkUDSTZ6gr7kWZ8ExEQdEiBstDXK0C7ESQplw+BOCcpOQmrG5y/DYqZiZuif4VV
         WaMkn5xtbmKXcLpma8tz5XGwZWan8DoBdu79hmgHiqOu7R6n7eb+mO2knA3+Z65rQMeJ
         IUCedWyAauC3ZCfMxMdqcEE8tya+OXy5t/AftM7NiJmrAgqmwwJNjhvixqlpRbGPUlNI
         uQRI6ga6sVFfS4BCf5vIVaacRQoEwdxGxeZ8sjfckqtDdn1C4Kn8BsymfzHFhjubLys0
         FNng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752691296; x=1753296096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=20DFtMKXGjzMStkeiX0rV+WhW7MQLkFjtE1G1H2gznA=;
        b=FH+3xPToeoNrM3hKyZyDBIUymQuvHhTSBOXoqQnXfrHlqq7YkDu1MoIxEr8Aj6UCAu
         C33KMK8Xo/sl0yOhz6pyzdSN6DQZ4qo9p+aM7n+Q2feLeMKiq3NMv+kP4ZjSx4B75TDY
         9J1ePQJCvQOdzWUa7Eet6WGgfhJSryUCOMQCuhUpv5gyMSpxw8nZbP7fz8Pc7VbIaScy
         xV/FR0Im1ccRX682k3rVHi/4q2roRZAQ9sem+n1w7MXQ+fqxDI3nPEbQiBK5v7xjh3CV
         xgjaZW7/9Ky4IB7S08Hj0rMyGicfmAf8WrXodjFDoh+rFiqxsMOHv+ccIoSOULaJIO82
         CoRA==
X-Forwarded-Encrypted: i=1; AJvYcCWCnCrMDofBlV+AStNvshgjbe7DzzUDB9I732ap5XrJ4q6pn5nkGxjKn1MX3cjJp0eZaG8FnWytz4o=@lists.linux.dev
X-Gm-Message-State: AOJu0YzqyQ0Mr1oNlvZ/gFnnU2G3GccJeTW15gaqT4hyTXPKuqs8OneE
	+ax848/s01Nt5jPBpDqUOKt/rSSho1dkgG4wp1LO1RH/IesWN5kJ1hsJqP1EObRgp7ZA/B3rQnf
	BTLWrjv3dap+hO+ZE8X1S5tpfL2+oeFo=
X-Gm-Gg: ASbGnctpA9lOxyhH7U7AfWVi3o2F69yFASMduhef4OzQqKD1T6MRcRtiMJn780az5aG
	8qrLTdls4bMqls8qkRfKCPwgIYkqFQT2ifmhKNubCXKr9J8POE3UmIASd3AT1vmxDeXGGhIGGDG
	eJ/iNgDVxBYDUk6EDl2uglcGU1o/GJaxpzO1AJ01Ml/naQgCyMyDbZjnhja2GjJITpM2AUiKJYV
	eDLP3I=
X-Google-Smtp-Source: AGHT+IFZwWhnvlktHUbt+Kieuk0AwdbSCwlwmi+WtIYajV9/Z+Oy1x/flaxD7uD3ONgFDnnoPfGTonQLpOquT9UuWu8=
X-Received: by 2002:a05:622a:7289:b0:4ab:9586:bdd8 with SMTP id
 d75a77b69052e-4ab9586c4f5mr41812881cf.55.1752691295354; Wed, 16 Jul 2025
 11:41:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250709055029.723243-1-duanchenghao@kylinos.cn> <20250709055029.723243-5-duanchenghao@kylinos.cn>
In-Reply-To: <20250709055029.723243-5-duanchenghao@kylinos.cn>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Wed, 16 Jul 2025 11:41:24 -0700
X-Gm-Features: Ac12FXwCRPmy4fnOAV5BMBHHNEa-DFWYMRw-qWQJNXIcPq2W8Wh-_O30cTGVz84
Message-ID: <CAK3+h2zbcumLibRXi0Oh5zc1FB6JcQco5CTjTYd8o0DOkijjAw@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] LoongArch: BPF: Add bpf_arch_xxxxx support for Loongarch
To: Chenghao Duan <duanchenghao@kylinos.cn>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	yangtiezhu@loongson.cn, hengqi.chen@gmail.com, chenhuacai@kernel.org, 
	martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org, 
	yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org, 
	sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, kernel@xen0n.name, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, bpf@vger.kernel.org, 
	guodongtai@kylinos.cn, youling.tang@linux.dev, jianghaoran@kylinos.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 8, 2025 at 11:02=E2=80=AFPM Chenghao Duan <duanchenghao@kylinos=
.cn> wrote:
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
> Co-developed-by: George Guo <guodongtai@kylinos.cn>
> Signed-off-by: George Guo <guodongtai@kylinos.cn>
> Signed-off-by: Chenghao Duan <duanchenghao@kylinos.cn>
> ---
>  arch/loongarch/include/asm/inst.h |  1 +
>  arch/loongarch/kernel/inst.c      | 32 +++++++++++
>  arch/loongarch/net/bpf_jit.c      | 90 +++++++++++++++++++++++++++++++
>  3 files changed, 123 insertions(+)
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
> index 7032f11d3..9cb01f0b0 100644
> --- a/arch/loongarch/net/bpf_jit.c
> +++ b/arch/loongarch/net/bpf_jit.c
> @@ -4,6 +4,7 @@
>   *
>   * Copyright (C) 2022 Loongson Technology Corporation Limited
>   */
> +#include <linux/memory.h>
>  #include "bpf_jit.h"
>
>  #define REG_TCC                LOONGARCH_GPR_A6
> @@ -1367,3 +1368,92 @@ bool bpf_jit_supports_subprog_tailcalls(void)
>  {
>         return true;
>  }
> +
> +static int emit_jump_and_link(struct jit_ctx *ctx, u8 rd, u64 ip, u64 ta=
rget)
> +{
> +       s64 offset =3D (s64)(target - ip);
> +
> +       if (offset && (offset >=3D -SZ_128M && offset < SZ_128M)) {
> +               emit_insn(ctx, bl, offset >> 2);
> +       } else {
> +               move_imm(ctx, LOONGARCH_GPR_T1, target, false);
> +               emit_insn(ctx, jirl, rd, LOONGARCH_GPR_T1, 0);
> +       }
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
> +                                 (unsigned long)ip, (unsigned long)targe=
t);
> +}
> +
> +int bpf_arch_text_poke(void *ip, enum bpf_text_poke_type poke_type,
> +                      void *old_addr, void *new_addr)
> +{
> +       u32 old_insns[5] =3D {[0 ... 4] =3D INSN_NOP};
> +       u32 new_insns[5] =3D {[0 ... 4] =3D INSN_NOP};
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
> +       if (memcmp(ip, old_insns, 5 * 4))
> +               return -EFAULT;
> +
> +       ret =3D gen_jump_or_nops(new_addr, ip, new_insns, is_call);
> +       if (ret)
> +               return ret;
> +
> +       mutex_lock(&text_mutex);
> +       if (memcmp(ip, new_insns, 5 * 4))
> +               ret =3D larch_insn_text_copy(ip, new_insns, 5 * 4);
> +       mutex_unlock(&text_mutex);
> +       return ret;
> +}
> +

I recommend to add comment for bpf_arch_text_poke() similar to
bpf_arch_text_poke() in arch/arm64/net/bpf_jit_comp.c so we have clear
understanding on how it works, given we already have issue with it
when running xdp-filter from xdp-tools that I reported from another
email thread.

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
> 2.43.0
>
>
