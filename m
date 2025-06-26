Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161171AC88A
	for <loongarch@lists.linux.dev>; Thu, 26 Jun 2025 01:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750901959; cv=none; b=dtkVsRRV++1EhEFZGcQvdwXUtFaiPsDmjwXeov8qLF83creBrRW7S+bW7X0D1In706v3XZAxvVmMLxfWbE5/9PtkKbskrMU7P4clRuD964IbeiOzENkdeQobTryq66COOwCpXULi5LXIo73jXwghKMiLO7R8lSYzwutP2ClV6lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750901959; c=relaxed/simple;
	bh=OoPZ/xKEZhH4/ie5suCdrwcei67FVrAhuZ8OTbN6fD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ir/X6oetkufSnjX2othtSKFigYu9NGVUiMjPhKARmFpmZl0/2Ya8vQqGxCpQDSDsstJXjrD5cMbzLB8ZYw5bLAsT+jv3o1wVkVIw92M9bHIQx/MZXsmD0pbMxWxyvtBdxV0UVFJoKRwXLznHAY2lLhomNF104svVp78gtJQ1Drc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tn7T+kJM; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tn7T+kJM"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-60f0a92391bso283415eaf.0
        for <loongarch@lists.linux.dev>; Wed, 25 Jun 2025 18:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750901956; x=1751506756; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SA6izG67AC7Rft8ICsngF2Dm1AqxKaO0/xyCqToZhWA=;
        b=Tn7T+kJMLq4kdSSbb1mTQYBDaWlkqO6Wlgg/aY5FCYvvFtwavi1a2mk8yWfJdtrLoA
         CydMMV9IcaQzwRoQg4WLHqCN43KykjFiMcOg85cChy+18krsmSIGrNNHuptNsGmieALZ
         XXAUehyEeSFKJYcuj2GpIxHDQIy6mZvNuYpBLbAvL4QVWmlScmZrm0hdKtGa7f+VFrQ/
         wawsCYU07Yb2Rk2v9mjDoyXc5HWZ81WpFs53JnIquLN444tf8uZ/viJbtzgrXFTlhoqL
         lyKHaUWbbkw5ULSSqoO4MKH0JyAfqcv8pf8NT8pd3MmyVnAWI/fGn9pHzqcbcDFcDRAv
         MpmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750901956; x=1751506756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SA6izG67AC7Rft8ICsngF2Dm1AqxKaO0/xyCqToZhWA=;
        b=WJFyyEbMYpF2lQsYN1+EyfywSbQpr26AvAnpG+1e0U8YiPuIc8M28cwi/va3jw31Pp
         OtFObC3RopwGr/OiJP4HSJeSxntO+aXUVniCFUNJhFYOFJe+PSZ1CdCkVrKq9DXol7YA
         ONYlj4R5K73wxiLstani1f3H/Ra6jKsS4zBNUxwp+oLpTSIDWwpjH6agqta+q0E0k4la
         pSCGhTErSWTtM5HH2hWp4ASxAgm5faCSkQrU+gy1pfVXWMw430nlWNJ+GK0+YDXSyl3E
         HsxfrEEkZDtVjZuCp7XaN8A3jx32z8QSkKmFl9+XrVN5DyEyFm08xBD1L3Efw7/XAu+O
         hiBA==
X-Forwarded-Encrypted: i=1; AJvYcCX4XYjiHJARcGm722hmJV4/dLD0ZNYdStjlCK0Mn2EIuBp9dZFcdkdK3bxOVWe5E6fi7BPhZhMB700=@lists.linux.dev
X-Gm-Message-State: AOJu0YwpI0RvvbYGqZyGSG+1O8YgWDJWSuu411hTefiUrFWIw0exSDOh
	Z+rR2SlWbtHXKKzrslhJvmUJY+clXGrissJ7HBE0ei94ST7MK5DOSA9RDd7Y/sMxkrzfJtx8b5h
	eMfg0MieBKauz6RC+GQ2jcx621OHplVU=
X-Gm-Gg: ASbGncsAjwQEik+mpTFF3cI6lwx32aVs9G2OpSqK4z4W4satwyJ1vVoS1HNiyGP79vu
	7e+0teO8Lv7rab1RATuvVAXtxLHhrcer5IpJwfB3AsMHgF3zkjMLBbrO8hwBmGL9XKD8PbA9GoH
	foYAALZ2RpEagley7uJwjICX7+sc10yV0Rp3MJFmiKVbg=
X-Google-Smtp-Source: AGHT+IFOwGEPnagR6chR2pgl9dZj8xnYqBB6sJKwhM8ym0W00BxzcsnReqW2Qj8u0WxKmR2qxqDwdA4Jl8mCypuNnQs=
X-Received: by 2002:a05:6871:8117:b0:2ea:6ec5:f182 with SMTP id
 586e51a60fabf-2efb29c36d7mr3665910fac.38.1750901956008; Wed, 25 Jun 2025
 18:39:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250618105048.1510560-1-duanchenghao@kylinos.cn> <20250618105048.1510560-2-duanchenghao@kylinos.cn>
In-Reply-To: <20250618105048.1510560-2-duanchenghao@kylinos.cn>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Thu, 26 Jun 2025 09:39:04 +0800
X-Gm-Features: Ac12FXyvsWhMw83Xbvuq3TX3OUb846H4mw0SBKx4nYB1SN5YUlkOtRBLdFMmCo8
Message-ID: <CAEyhmHTA+6RdD4CbQuMn2E887Z3E6RudJQb3Wnmqosj1ozrXPw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] LoongArch: BPF: The operation commands needed to
 add a trampoline
To: Chenghao Duan <duanchenghao@kylinos.cn>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	yangtiezhu@loongson.cn, chenhuacai@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev, 
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
	haoluo@google.com, jolsa@kernel.org, kernel@xen0n.name, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, bpf@vger.kernel.org, 
	guodongtai@kylinos.cn, youling.tang@linux.dev, jianghaoran@kylinos.cn, 
	Youling Tang <tangyouling@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 6:51=E2=80=AFPM Chenghao Duan <duanchenghao@kylinos=
.cn> wrote:
>
> Add branch jump function:
> larch_insn_gen_beq
> larch_insn_gen_bne
>
> Add instruction copy function: larch_insn_text_copy
>

Please rewrite the commit message properly.
These functions are generic, so you can drop the `BPF` prefix from subject =
line.

> Co-developed-by: George Guo <guodongtai@kylinos.cn>
> Signed-off-by: George Guo <guodongtai@kylinos.cn>
> Co-developed-by: Youling Tang <tangyouling@kylinos.cn>
> Signed-off-by: Youling Tang <tangyouling@kylinos.cn>
> Signed-off-by: Chenghao Duan <duanchenghao@kylinos.cn>
> ---
>  arch/loongarch/include/asm/inst.h |  3 ++
>  arch/loongarch/kernel/inst.c      | 57 +++++++++++++++++++++++++++++++
>  2 files changed, 60 insertions(+)
>
> diff --git a/arch/loongarch/include/asm/inst.h b/arch/loongarch/include/a=
sm/inst.h
> index 3089785ca..88bb73e46 100644
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
> @@ -511,6 +512,8 @@ u32 larch_insn_gen_lu12iw(enum loongarch_gpr rd, int =
imm);
>  u32 larch_insn_gen_lu32id(enum loongarch_gpr rd, int imm);
>  u32 larch_insn_gen_lu52id(enum loongarch_gpr rd, enum loongarch_gpr rj, =
int imm);
>  u32 larch_insn_gen_jirl(enum loongarch_gpr rd, enum loongarch_gpr rj, in=
t imm);
> +u32 larch_insn_gen_beq(enum loongarch_gpr rd, enum loongarch_gpr rj, int=
 imm);
> +u32 larch_insn_gen_bne(enum loongarch_gpr rd, enum loongarch_gpr rj, int=
 imm);
>
>  static inline bool signed_imm_check(long val, unsigned int bit)
>  {
> diff --git a/arch/loongarch/kernel/inst.c b/arch/loongarch/kernel/inst.c
> index 14d7d700b..7423b0772 100644
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
> @@ -218,6 +219,34 @@ int larch_insn_patch_text(void *addr, u32 insn)
>         return ret;
>  }
>
> +int larch_insn_text_copy(void *dst, void *src, size_t len)
> +{
> +       unsigned long flags;

Initialize flags ?

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

I am not familiar with this mm thing, but looking at other callsites
of copy_to_kernel_nofault(),
it seems like you can do this copy cross page boundaries.

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

Do we need flush_icache_range() here ?

> +       return ret;
> +}
> +
>  u32 larch_insn_gen_nop(void)
>  {
>         return INSN_NOP;
> @@ -336,3 +365,31 @@ u32 larch_insn_gen_jirl(enum loongarch_gpr rd, enum =
loongarch_gpr rj, int imm)
>
>         return insn.word;
>  }
> +
> +u32 larch_insn_gen_beq(enum loongarch_gpr rd, enum loongarch_gpr rj, int=
 imm)
> +{
> +       union loongarch_instruction insn;
> +
> +       if ((imm & 3) || imm < -SZ_128K || imm >=3D SZ_128K) {
> +               pr_warn("The generated beq instruction is out of range.\n=
");
> +               return INSN_BREAK;
> +       }
> +
> +       emit_beq(&insn, rd, rj, imm >> 2);
> +

This does NOT match emit_beq's signature, should be:
    emit_beq(&insn, rj, rd, imm >> 2);

> +       return insn.word;
> +}
> +
> +u32 larch_insn_gen_bne(enum loongarch_gpr rd, enum loongarch_gpr rj, int=
 imm)
> +{
> +       union loongarch_instruction insn;
> +
> +       if ((imm & 3) || imm < -SZ_128K || imm >=3D SZ_128K) {
> +               pr_warn("The generated bne instruction is out of range.\n=
");
> +               return INSN_BREAK;
> +       }
> +
> +       emit_bne(&insn, rj, rd, imm >> 2);
> +
> +       return insn.word;
> +}
> --
> 2.43.0
>
