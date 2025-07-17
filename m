Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE5D2989B4
	for <loongarch@lists.linux.dev>; Thu, 17 Jul 2025 10:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752747190; cv=none; b=Ybgx3c5US/Rp5buofr2JcpaAv6NG1T5dfGz3tmxADcpn3xR7JipqwbSy32vJfZedXdR3jRJqbqWHnn/HDMcA+euiZH7WQQyOebzQ0wb1tARFrcWNIgnFy3KkwutIFNPs7Qknw61daIaH7GMAc0MvmZ+KejPo+du9CzONUUdBvx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752747190; c=relaxed/simple;
	bh=1dHnw1vAQgMpykmsQRAyaeiM+QvQbO8n66y5jsDIxZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MG+j3/Br4yhyefswEZjc0HGECH7V5Szr+kNlz5i6gz96EhvXigqr/zc81PnMuODGFCnCj3CrXxOjRtMXMAnBVJmyL5tfAkxv7q7t0mKts0FWFpzO8LqZ/eEWnq/MAEwn0U12rwSbfpU2tiTcfwecqvrFDasgYdYsLnn4CjOKBz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HWDa86BS; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HWDa86BS"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-41bc2668f85so495902b6e.2
        for <loongarch@lists.linux.dev>; Thu, 17 Jul 2025 03:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752747188; x=1753351988; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5hSPjsM7QKYflgb+oQCXCInkDUTd/I69aUahHfwDbwM=;
        b=HWDa86BSz4IhDg5wOhVfwopeNZEHMxPQTKCjayxbiqeYOLQ8dRHaUZkEVtt+B525fs
         bPxNEbr+ir2kyY5to0/OzNsCw//n5CTslUx7jL6E5anUfAPDfDJ98HbV5h6R0sguFRSU
         M/CC10Kx22EUZTQb0o8SN9M07U+wIUbFYnTgKZ7t2mp8HFnaVNgNpXGXiUSBRarRqmy6
         KKkfhs+ntpdZqxqg+NeSgjsK0AwgFlaLXbdn7ADrBVB2dSmxtcsJUelvgFG0snCruP1Z
         DcbvkOa4GNi4FDaESxEuFxrKnkgof8bU1IV3N2d9hYIos2oLG80QJm3YxzUHo4+x4E2l
         wFKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752747188; x=1753351988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5hSPjsM7QKYflgb+oQCXCInkDUTd/I69aUahHfwDbwM=;
        b=HHt1pww/b0pQ2ml8Y9Uwk82usz381hcQExl5YXdvJySH8H/D/9el6bhQ6XLomwMuwV
         WcpwusiQY7DjHvHWPS0H7QP+UkpvT98El1oYGBkE63QHqFTluyYYdla+0/dGefFuRXcC
         /1BjJWVD3Td4U7XzkSFUJGJMX7hsImaQkTVAhvJkdcYDXn4YiTvCyOVVIIYMITQ3Jskl
         EpKKDMVVwMyufUN9rn3FtP5DEwr7cp51BQzTV7BPvPcRNL6/4NIQVAdOvTWax6FDPbGL
         HE/hHjUI4sq0D8+gmt1JQfWetk+OCczNtiA/+h5PmP7M90qvoERNUcrAGeBUVA+Jtz7+
         LNtw==
X-Forwarded-Encrypted: i=1; AJvYcCXs2Hkh0LLIHLNWOYlVe1SdBC7EmmV52UsyW8mmjV4DJuZj1rcJxzlMSVRYjopAcS3RzSoMIF2yW5w=@lists.linux.dev
X-Gm-Message-State: AOJu0YxqI4xPSDU9248VSgYW8R4BP1ndQkoTteasdurg/9zkz/q1x8IY
	dIvkFEx7iOXGfA4hHoNQhePue+AyZCI909Wa/X2VNJ9jLi8RFHNdN1TRwZUbdW+BMFJqkj/WVqc
	0o0JDZe/JxoodH9cko+jLGmSZK0/o4To=
X-Gm-Gg: ASbGncuxj0aVW8ua72DnHU0ygiIGRaDKJpMhY8O00wkE1HjDlZj3BPjpdYNz3MfoREs
	CXL8d2GufRH37DGAzJtKq67R3OXgFvUZHOaHuZS2DR2dgTA+4nlr5xRpXQWA1eoib11xA+iBvDN
	xqJOUZv2Y1sFTrRkOK+ys+iGV2t5HL/BC8XT1cfY+azbK2vtW8K8Zdh6a2Lx1+6r0x4koxq1ErK
	2abmho=
X-Google-Smtp-Source: AGHT+IFYWO5FGaRZp1uWHyLuZVVuTLhXeJVIxht6qdNIMmZQwYZyDvKova0EF40lnv85bryudIMcS19Up/0D/LP64/4=
X-Received: by 2002:a05:6808:3c4b:b0:41c:b43b:edbc with SMTP id
 5614622812f47-41d04c94f2emr4984872b6e.22.1752747187727; Thu, 17 Jul 2025
 03:13:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250709055029.723243-1-duanchenghao@kylinos.cn>
 <20250709055029.723243-5-duanchenghao@kylinos.cn> <CAEyhmHS__fqHS8Bpg7+4apO7OuXG1sP3miCcAMT+Y3uU0+_xjg@mail.gmail.com>
 <20250717092746.GA993901@chenghao-pc>
In-Reply-To: <20250717092746.GA993901@chenghao-pc>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Thu, 17 Jul 2025 18:12:55 +0800
X-Gm-Features: Ac12FXx6whW96zQ6bIZM8TqDDZxilosr5wnN6L0hS4B3__8umbTdKW2D60gn1IU
Message-ID: <CAEyhmHTpJ0OKbW1QEFV+XMxCC9kL2eSwKMkk7=YyLprjNxc8iA@mail.gmail.com>
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

On Thu, Jul 17, 2025 at 5:27=E2=80=AFPM Chenghao Duan <duanchenghao@kylinos=
.cn> wrote:
>
> On Wed, Jul 16, 2025 at 08:21:59PM +0800, Hengqi Chen wrote:
> > On Wed, Jul 9, 2025 at 1:50=E2=80=AFPM Chenghao Duan <duanchenghao@kyli=
nos.cn> wrote:
> > >
> > > Implement the functions of bpf_arch_text_poke, bpf_arch_text_copy, an=
d
> > > bpf_arch_text_invalidate on the LoongArch architecture.
> > >
> > > On LoongArch, since symbol addresses in the direct mapping
> > > region cannot be reached via relative jump instructions from the page=
d
> > > mapping region, we use the move_imm+jirl instruction pair as absolute
> > > jump instructions. These require 2-5 instructions, so we reserve 5 NO=
P
> > > instructions in the program as placeholders for function jumps.
> > >
> > > Co-developed-by: George Guo <guodongtai@kylinos.cn>
> > > Signed-off-by: George Guo <guodongtai@kylinos.cn>
> > > Signed-off-by: Chenghao Duan <duanchenghao@kylinos.cn>
> > > ---
> > >  arch/loongarch/include/asm/inst.h |  1 +
> > >  arch/loongarch/kernel/inst.c      | 32 +++++++++++
> > >  arch/loongarch/net/bpf_jit.c      | 90 +++++++++++++++++++++++++++++=
++
> > >  3 files changed, 123 insertions(+)
> > >
> > > diff --git a/arch/loongarch/include/asm/inst.h b/arch/loongarch/inclu=
de/asm/inst.h
> > > index 2ae96a35d..88bb73e46 100644
> > > --- a/arch/loongarch/include/asm/inst.h
> > > +++ b/arch/loongarch/include/asm/inst.h
> > > @@ -497,6 +497,7 @@ void arch_simulate_insn(union loongarch_instructi=
on insn, struct pt_regs *regs);
> > >  int larch_insn_read(void *addr, u32 *insnp);
> > >  int larch_insn_write(void *addr, u32 insn);
> > >  int larch_insn_patch_text(void *addr, u32 insn);
> > > +int larch_insn_text_copy(void *dst, void *src, size_t len);
> > >
> > >  u32 larch_insn_gen_nop(void);
> > >  u32 larch_insn_gen_b(unsigned long pc, unsigned long dest);
> > > diff --git a/arch/loongarch/kernel/inst.c b/arch/loongarch/kernel/ins=
t.c
> > > index 674e3b322..8d6594968 100644
> > > --- a/arch/loongarch/kernel/inst.c
> > > +++ b/arch/loongarch/kernel/inst.c
> > > @@ -4,6 +4,7 @@
> > >   */
> > >  #include <linux/sizes.h>
> > >  #include <linux/uaccess.h>
> > > +#include <linux/set_memory.h>
> > >
> > >  #include <asm/cacheflush.h>
> > >  #include <asm/inst.h>
> > > @@ -218,6 +219,37 @@ int larch_insn_patch_text(void *addr, u32 insn)
> > >         return ret;
> > >  }
> > >
> > > +int larch_insn_text_copy(void *dst, void *src, size_t len)
> > > +{
> > > +       unsigned long flags;
> > > +       size_t wlen =3D 0;
> > > +       size_t size;
> > > +       void *ptr;
> > > +       int ret =3D 0;
> > > +
> > > +       set_memory_rw((unsigned long)dst, round_up(len, PAGE_SIZE) / =
PAGE_SIZE);
> > > +       raw_spin_lock_irqsave(&patch_lock, flags);
> > > +       while (wlen < len) {
> > > +               ptr =3D dst + wlen;
> > > +               size =3D min_t(size_t, PAGE_SIZE - offset_in_page(ptr=
),
> > > +                            len - wlen);
> > > +
> > > +               ret =3D copy_to_kernel_nofault(ptr, src + wlen, size)=
;
> > > +               if (ret) {
> > > +                       pr_err("%s: operation failed\n", __func__);
> > > +                       break;
> > > +               }
> > > +               wlen +=3D size;
> > > +       }
> >
> > Again, why do you do copy_to_kernel_nofault() in a loop ?
>
> The while loop processes all sizes. I referred to how ARM64 and
> RISC-V64 handle this using loops as well.

Any pointers ?

>
> > This larch_insn_text_copy() can be part of the first patch like
> > larch_insn_gen_{beq,bne}. WDYT ?
>
> From my perspective, it is acceptable to include both
> larch_insn_text_copy and larch_insn_gen_{beq,bne} in the same patch,
> or place them in the bpf_arch_xxxx patch. larch_insn_text_copy is
> solely used for BPF; the application scope of larch_insn_gen_{beq,bne}
> is not limited to BPF.
>

The implementation of larch_insn_text_copy() seems generic.

> >
> > > +       raw_spin_unlock_irqrestore(&patch_lock, flags);
> > > +       set_memory_rox((unsigned long)dst, round_up(len, PAGE_SIZE) /=
 PAGE_SIZE);
> > > +
> > > +       if (!ret)
> > > +               flush_icache_range((unsigned long)dst, (unsigned long=
)dst + len);
> > > +
> > > +       return ret;
> > > +}
> > > +
> > >  u32 larch_insn_gen_nop(void)
> > >  {
> > >         return INSN_NOP;
> > > diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_ji=
t.c
> > > index 7032f11d3..9cb01f0b0 100644
> > > --- a/arch/loongarch/net/bpf_jit.c
> > > +++ b/arch/loongarch/net/bpf_jit.c
> > > @@ -4,6 +4,7 @@
> > >   *
> > >   * Copyright (C) 2022 Loongson Technology Corporation Limited
> > >   */
> > > +#include <linux/memory.h>
> > >  #include "bpf_jit.h"
> > >
> > >  #define REG_TCC                LOONGARCH_GPR_A6
> > > @@ -1367,3 +1368,92 @@ bool bpf_jit_supports_subprog_tailcalls(void)
> > >  {
> > >         return true;
> > >  }
> > > +
> > > +static int emit_jump_and_link(struct jit_ctx *ctx, u8 rd, u64 ip, u6=
4 target)
> > > +{
> > > +       s64 offset =3D (s64)(target - ip);
> > > +
> > > +       if (offset && (offset >=3D -SZ_128M && offset < SZ_128M)) {
> > > +               emit_insn(ctx, bl, offset >> 2);
> > > +       } else {
> > > +               move_imm(ctx, LOONGARCH_GPR_T1, target, false);
> > > +               emit_insn(ctx, jirl, rd, LOONGARCH_GPR_T1, 0);
> > > +       }
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static int gen_jump_or_nops(void *target, void *ip, u32 *insns, bool=
 is_call)
> > > +{
> > > +       struct jit_ctx ctx;
> > > +
> > > +       ctx.idx =3D 0;
> > > +       ctx.image =3D (union loongarch_instruction *)insns;
> > > +
> > > +       if (!target) {
> > > +               emit_insn((&ctx), nop);
> > > +               emit_insn((&ctx), nop);
> > > +               return 0;
> > > +       }
> > > +
> > > +       return emit_jump_and_link(&ctx, is_call ? LOONGARCH_GPR_T0 : =
LOONGARCH_GPR_ZERO,
> > > +                                 (unsigned long)ip, (unsigned long)t=
arget);
> > > +}
> > > +
> > > +int bpf_arch_text_poke(void *ip, enum bpf_text_poke_type poke_type,
> > > +                      void *old_addr, void *new_addr)
> > > +{
> > > +       u32 old_insns[5] =3D {[0 ... 4] =3D INSN_NOP};
> > > +       u32 new_insns[5] =3D {[0 ... 4] =3D INSN_NOP};
> > > +       bool is_call =3D poke_type =3D=3D BPF_MOD_CALL;
> > > +       int ret;
> > > +
> > > +       if (!is_kernel_text((unsigned long)ip) &&
> > > +               !is_bpf_text_address((unsigned long)ip))
> > > +               return -ENOTSUPP;
> > > +
> > > +       ret =3D gen_jump_or_nops(old_addr, ip, old_insns, is_call);
> > > +       if (ret)
> > > +               return ret;
> > > +
> > > +       if (memcmp(ip, old_insns, 5 * 4))
> > > +               return -EFAULT;
> > > +
> > > +       ret =3D gen_jump_or_nops(new_addr, ip, new_insns, is_call);
> > > +       if (ret)
> > > +               return ret;
> > > +
> > > +       mutex_lock(&text_mutex);
> > > +       if (memcmp(ip, new_insns, 5 * 4))
> > > +               ret =3D larch_insn_text_copy(ip, new_insns, 5 * 4);
> > > +       mutex_unlock(&text_mutex);
> > > +       return ret;
> > > +}
> > > +
> > > +int bpf_arch_text_invalidate(void *dst, size_t len)
> > > +{
> > > +       int i;
> > > +       int ret =3D 0;
> > > +       u32 *inst;
> > > +
> > > +       inst =3D kvmalloc(len, GFP_KERNEL);
> > > +       if (!inst)
> > > +               return -ENOMEM;
> > > +
> > > +       for (i =3D 0; i < (len/sizeof(u32)); i++)
> > > +               inst[i] =3D INSN_BREAK;
> > > +
> > > +       if (larch_insn_text_copy(dst, inst, len))
> > > +               ret =3D -EINVAL;
> > > +
> > > +       kvfree(inst);
> > > +       return ret;
> > > +}
> > > +
> > > +void *bpf_arch_text_copy(void *dst, void *src, size_t len)
> > > +{
> > > +       if (larch_insn_text_copy(dst, src, len))
> > > +               return ERR_PTR(-EINVAL);
> > > +
> > > +       return dst;
> > > +}
> > > --
> > > 2.43.0
> > >
