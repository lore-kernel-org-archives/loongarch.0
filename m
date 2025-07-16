Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B992F3C38
	for <loongarch@lists.linux.dev>; Wed, 16 Jul 2025 12:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752668533; cv=none; b=mgh2IES3sDjx8tG3KSakCS+F9oKQ8P1zhkmW79IpBJ4Z3wBtd2bkdgcHhb6vjO50KkRXEaJjPskjVgVsT5/scxmnA2sDbku7FH/rr7zPIsWEF16f9UKzXzNwgRczWRhbdB8BOOVigX431Vx+85CuikMkX78DaAGkcCP+T3B6S94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752668533; c=relaxed/simple;
	bh=EJGOiFH+EU5CNzkZ/PqBKWLV7F65x+cAx3JuBIlqwMo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hC7lNnj5ubunVbaEUnaN9VY4I+GkChnSDP/W2G1DaiaeZ44oLR9KX7DcAq7WwEKhWXhMf7yUzlSdXAd6iXkRlH1cpx24XSAUePkuTtfkzPDlRpJ47PPybfOxxDk01yR3ep9BQrzXX9BmTplR9XEE2uSS277d8FopMsaDcq9iUKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C7422kuI; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C7422kuI"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-41d826eb310so87178b6e.0
        for <loongarch@lists.linux.dev>; Wed, 16 Jul 2025 05:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752668530; x=1753273330; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G+tnr3e4/mymYLtJajATmZkmmv8sB/rgRTqanOQGPLM=;
        b=C7422kuIBopdApSoQ8MyNThbM8lh+V3+2dYH5T+WBTnJ7pj65ni5ItZJSYkOQWVApI
         YOP6Vvl4f7LHmOJ6iRa21aAndWcos6LcqolnIaNSgXKM1GDh8oGPdQ8ODk7JmIe/uz/5
         kr8v/XsBrvfQ+Z9e5061y0JBsXVvSLb7dNYNo/qZgg491l7C8OVFaenRj8J19RnZr3bt
         LNqdOwScfFiNO7L+cmIKEMaysV6U3mQAElhxPBHVdm5dGu0LERmdHAuvl/KwJqTarG08
         YdLT81c4ZA+yPsKqhcSfW3NfadyUyPlfXEgP9I5a/TW32nUQrK1ejDEtaumq8zSRA+zE
         Ms1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752668530; x=1753273330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G+tnr3e4/mymYLtJajATmZkmmv8sB/rgRTqanOQGPLM=;
        b=TQAI/nEXzAUyFM/xr4XZYDO8eWwc+Jr/kwcWaye3cLn7Q5zZTQUS99blCmpOOJxqiy
         IJmMGuQ1qZeex6XPGgdqYeLnSL9S2VFycAqzR1J5mIGZo4GfCn153QvQSU1hELNzjcAF
         yJnbJzUXVVFbhsMX9bWVzEQ3QDDkU92etx6lwVAc2GYSS0WRjRSh02WWoudp3keobuH5
         DuvyWsE/2DeKZ6BEya7vtKB4YHumKjaTmfAcdPp2JkyumWv9+jaEvJylBX+KIqrGTuZl
         IMSNrC5DfRX8PnPHzu0EtsNzabziZIYgA5aie7bYG/tu7DeZZS7a3d/macvXOdCoazsZ
         SedA==
X-Forwarded-Encrypted: i=1; AJvYcCX6Exc75uwFtKnz7KH5ZUm0KYYtyJ5yQRizu1Ogd1b6cCELFuryRgIVH6UtamPdjQsGPJv/Lhgz9w0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/wMB65jBQ+pj5WUbVfVACsPR+oYHOOUVNxePPwU+ZUvHwm4gx
	cqU/9XT12oDUkk/xMcsev6krWM2v73e3AcbInM3DBPEZ+uAOjfXXBvnurM0kMNiA9b+SjX51G90
	BKYmpi9CmXBaCbVktMAhNK0jwsyF4Wdw=
X-Gm-Gg: ASbGncv+fxSZGv9LJV6xPd+G0suOCv9iyDR3DBKpJCOzleP4iDdVr3iJ2Yp9b03A6dn
	xv9z6Yl9qxygvNwIJG8FqxnXkpw5VWlbyKvsibVvoeftm6QZhmqtYJk+tBXOPGMh65AKXw9NPzO
	BswLt2DFx2zbl3nQZO3F4wZ87eDADOV3qmQH7PgD8VO4XF2Gcz6NYYQf7Fq/y3IEyxa+fW74X7Q
	W/uNZo=
X-Google-Smtp-Source: AGHT+IGL7XLsKwtMZM/7v+p6warUqLB5ZMqihYIBn4laUW39QjxxtyX3/q++rHGgY6HE0TYuHA1qbA7pXZ2XHUIrfDk=
X-Received: by 2002:a05:6808:d4a:b0:409:52f:b361 with SMTP id
 5614622812f47-41ceb405866mr2082913b6e.0.1752668530359; Wed, 16 Jul 2025
 05:22:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250709055029.723243-1-duanchenghao@kylinos.cn> <20250709055029.723243-5-duanchenghao@kylinos.cn>
In-Reply-To: <20250709055029.723243-5-duanchenghao@kylinos.cn>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Wed, 16 Jul 2025 20:21:59 +0800
X-Gm-Features: Ac12FXyuUgPud7MHnYU5OY6d35OPLh1aCxgn6SeR3TFritbJv3zps56X5lpe79c
Message-ID: <CAEyhmHS__fqHS8Bpg7+4apO7OuXG1sP3miCcAMT+Y3uU0+_xjg@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] LoongArch: BPF: Add bpf_arch_xxxxx support for Loongarch
To: Chenghao Duan <duanchenghao@kylinos.cn>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	yangtiezhu@loongson.cn, chenhuacai@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev, 
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
	haoluo@google.com, jolsa@kernel.org, kernel@xen0n.name, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, bpf@vger.kernel.org, 
	guodongtai@kylinos.cn, youling.tang@linux.dev, jianghaoran@kylinos.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 9, 2025 at 1:50=E2=80=AFPM Chenghao Duan <duanchenghao@kylinos.=
cn> wrote:
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

Again, why do you do copy_to_kernel_nofault() in a loop ?
This larch_insn_text_copy() can be part of the first patch like
larch_insn_gen_{beq,bne}. WDYT ?

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
