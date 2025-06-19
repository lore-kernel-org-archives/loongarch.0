Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A5D1917CD
	for <loongarch@lists.linux.dev>; Thu, 19 Jun 2025 15:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750346100; cv=none; b=P4FEvqUaqhkv806E49VSJ8fBElOum7ojXkyicrUdIdq+Pxx11T1po0LcfFNJ1dcUBr5D3PslTnjkd4UUrJTe0K++y6rK/jSR/XTKLyW/r0k0cBQZvvMhzixNc+S4rJ2yBYv3Xx/GZWDhu9R8F5cva4AOfq12JeIln0YAxjBJNyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750346100; c=relaxed/simple;
	bh=IBdeGa1U8TuUchxzsvRO7qA6eHVSDVNim0wcrdeNMfs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uTY0yQAASMFJHovOoUjPgKZpX4CTe7FOfh8eXAh6s06/qKxTVGdDsQ6C7DA11DAVvcoA7cWhU7Rr13su1hNntA73LIf/Cn4GNjeSlKkpinxUQdVH6A29wIRejbRDsEgd+oYYKCcLT7+e+VIZ9csmJhkn16Dg6vJ8cNrgFIJh040=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tAp3Q1YD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tAp3Q1YD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBF2FC4CEF1
	for <loongarch@lists.linux.dev>; Thu, 19 Jun 2025 15:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750346099;
	bh=IBdeGa1U8TuUchxzsvRO7qA6eHVSDVNim0wcrdeNMfs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tAp3Q1YD4q3hWJbIaPmd1JRDiEE4qw9qwmkL+A1U4eUGmkwrbAixlbOUT7G/7qCaf
	 m/m6SP8PO+T20qlDAdTSoLDzV3agi9jx0/0zVdyNEyocO1d62tgOKDa6E01MPDA9Am
	 6W6mw8zVcadEIVd7N05F7EZmvmH2xA08ePO0BZ/QP/wXKs1zHQKkIhjx0dhrmjlJVR
	 kdTykr76XNtokqhgMJRa/vl+J0AsyfwC2810CkUfSOH73YV5JGaLs4OtPioW1XTQZV
	 VVvhU1DuuaRBoCM4S0BLc3mkSjpCjfymPbV7pke5PH3QXtuMFSBCg5uIc5VLLYj3gZ
	 UOho41MdvF7aA==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-60768f080d8so1445901a12.1
        for <loongarch@lists.linux.dev>; Thu, 19 Jun 2025 08:14:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUjnMvbC7JUWK5gwYZ9vNNoxANitgjdRHkNY/fHnDtQQ5cAbDqJ9JUny7srUshQlk9TX31AZAsKDqk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5jNeprT8ybYCKM07AFR/d6UC6T7UJTrJqUGZPyI5YAtTd0+9G
	hUs1pDI34ZEtBgkXn3XdzWuWt4cpy/6JZi43bODDfR8WhoxgEKSBo0hyQrbuWgk3GsKNkutHaZi
	Sd5Cs3TyhNQdh83eQKMfQqOmf8iacmCE=
X-Google-Smtp-Source: AGHT+IGNuewH/yn7Y6NsMIUk7rodKyLo9wuc+RDEaO77sr8hKurxZDoSPM8QxKQQYvi/GTNuqTayViX+Hq8SdzEozuw=
X-Received: by 2002:a05:6402:1d4d:b0:607:ea0c:6590 with SMTP id
 4fb4d7f45d1cf-608d09e303cmr18529770a12.24.1750346098356; Thu, 19 Jun 2025
 08:14:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250618105048.1510560-1-duanchenghao@kylinos.cn> <20250618105048.1510560-3-duanchenghao@kylinos.cn>
In-Reply-To: <20250618105048.1510560-3-duanchenghao@kylinos.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 19 Jun 2025 23:14:46 +0800
X-Gmail-Original-Message-ID: <CAAhV-H42ofJ_z1Pj4OVwpROzOODqdBMg+ChJ9ULguVkOfLQkkg@mail.gmail.com>
X-Gm-Features: AX0GCFvCWmaDlT5i9aUgfnYqdGQK1YqVU2zM6ddnVh_qCXLgwqPBxd73dFXlSFc
Message-ID: <CAAhV-H42ofJ_z1Pj4OVwpROzOODqdBMg+ChJ9ULguVkOfLQkkg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] LoongArch: BPF: Add bpf_arch_text_poke support for Loongarch
To: Chenghao Duan <duanchenghao@kylinos.cn>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	yangtiezhu@loongson.cn, hengqi.chen@gmail.com, martin.lau@linux.dev, 
	eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev, 
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
	haoluo@google.com, jolsa@kernel.org, kernel@xen0n.name, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, bpf@vger.kernel.org, 
	guodongtai@kylinos.cn, youling.tang@linux.dev, jianghaoran@kylinos.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Chenghao,

On Wed, Jun 18, 2025 at 6:51=E2=80=AFPM Chenghao Duan <duanchenghao@kylinos=
.cn> wrote:
>
> Implement the bpf_arch_text_poke function for the LoongArch
> architecture. On LoongArch, since symbol addresses in the direct mapping
> region cannot be reached via relative jump instructions from the paged
> mapping region, we use the move_imm+jirl instruction pair as absolute
> jump instructions. These require 2-5 instructions, so we reserve 5 NOP
> instructions in the program as placeholders for function jumps.
I think this patch is a preparation for the 3rd one, then I think
bpf_arch_text_copy and bpf_arch_text_invalidate should also be moved
here because they are the same class as bpf_arch_text_poke.


Huacai

>
> Co-developed-by: George Guo <guodongtai@kylinos.cn>
> Signed-off-by: George Guo <guodongtai@kylinos.cn>
> Signed-off-by: Chenghao Duan <duanchenghao@kylinos.cn>
> ---
>  arch/loongarch/net/bpf_jit.c | 62 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>
> diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
> index fa1500d4a..24332c596 100644
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
> @@ -1359,3 +1360,64 @@ bool bpf_jit_supports_subprog_tailcalls(void)
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
> --
> 2.43.0
>
>
