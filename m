Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62617173
	for <loongarch@lists.linux.dev>; Mon, 21 Jul 2025 01:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753061941; cv=none; b=aabXzB+2QSYYksL9sGOdJNs6WITUNpUM6VGbD2DIqiiBOpjQ/4CjnMI5oles059+eqjwQ7+YDpC1wbLlRhXogL2FWIgVuui3AHuBilkivIVVYFky0Pd3XxLV5tDuEwKG9Xzr5MrTY9YrJZYVnpQ70/sRRIc3wiIoza28tB9Kx7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753061941; c=relaxed/simple;
	bh=PO4MwsGmW9qPk9qjtrdQ41wKEw14fK2NLOmzYqtm4Kw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xo3UX7jYG8cl57sVDJLDL6Alsp6zYwz59SHaODuJaHKZRxxNUaJeeSS0y/8SHqo1t1ytbZlg86GZkTCRDCN+WaauAxTNoDHV/NJmTLk0pygaQ39AxtQhohScey3TQ7e6CahdKPOIeN0e5QsPcf2W0qE5J1E598Ai0jaOqUFn0J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q7IRNrMj; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q7IRNrMj"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-41cd87eff4dso2333628b6e.2
        for <loongarch@lists.linux.dev>; Sun, 20 Jul 2025 18:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753061938; x=1753666738; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+VvhFlhsZQMCnpfYYt4dMxY8vbQNulzPjC3pPcEi758=;
        b=Q7IRNrMjKj3JxPkSBVWWnq+Avw0HU5H+IiZxA/Dspt9nZsRRZhz3fSR6YDKB1L/Pnl
         KyXgIpIjSe3s67pqlYIPEg0NWnLPsmQT0I4zkSWu905pltwLbJT8aK86fVe5PAZDlUG/
         lLFakRa5BDsAFL/RAiNPCc3OpfY2IWPGdkPLEE7ebev8ao8kUMIfz8sR8//5Sk2/0uh6
         nreKfli3+dJpkX/+86nywaMIT2etaYS6ueJ17Ur61j2kGD4ee8JGzfLnqjQ4/Pq3pJUi
         JlRIPtexMqrFrROWEWEA2M7WBT3F4wW05oVSMhEgKIzE4y94zABsgzLdwFkhrnti8vDN
         OJEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753061938; x=1753666738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+VvhFlhsZQMCnpfYYt4dMxY8vbQNulzPjC3pPcEi758=;
        b=K3BWWldl3zQhq4TGrYGsZyeQffNiCAaKV5Wgbtu/Dzm4aGAfAajFj9vAWipdcZTcrj
         OzVSebqRDW3PABYNWrnPkzLlX6rq2DKGtt/QtdirtiPZ/SXl/9ZjnyxNm5V1mhXpMB0U
         OJY+EuYpwcjeEGacpYmXVyefXIs/BGtIMMOcp7UxKtBrOzoaZDnYtA0JXSWvAutYDKRo
         wrr2EGdtFdmdXcpQqfCEhN8HN6xGfOw1wOSbEgHIg9plc7sq+Jy9z9birAyXWwYe06yq
         e3/5a+zhZULiENjZup0T1HvraWnRC0DoJhpaPRqA2KgCvy4pHLShFWtlGNvvOy4mGvxa
         wR/w==
X-Forwarded-Encrypted: i=1; AJvYcCWegQucZy+OJTWd8SNsvIM4GpNRbFAxaljScOkdjNUXVwifq031v4IHleqd4wt7fOWZ/AQ9YWPytJc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyiXWzyJOtQptyb+czvzJ/7NCnAJZu8MwmxOtHMDrzugBWcp2Cb
	I5tB+BAav/HnGeACNnovRiCKT/KgxQhXf3yLrZqchko3mXKwnDFtONYv2MX2zDFNAqyPvp6KMLf
	Qn33U459CgJKA07L+a+GD9J/dRaLd300=
X-Gm-Gg: ASbGncsRD47gi44dCNRkHt1esG4kw6zLmvQT0FI2aegxGCkFJyOJtYmAQDVHFxSgQce
	Zi32nOGF2ju48dwpAe0hJH05bKFTy7XnvV0Opj4L6HD5NTUshlMByWyxh2PMqaGP1r3AVPHOEZE
	F8z4/xqwuIfOdyvvS9cxOwwVphlQJAMFPoHYzIlEnl+iwcvea2RrK9veHQduGLmplnAD0sQmKDJ
	xeayW4=
X-Google-Smtp-Source: AGHT+IFGpEW1mdQOV07ps+z7zGHj/SHi0zMpi1/Owyf6XyhxVieE95N5nioKlkCZb5ZNc1b+Clyf7hTMNXm8rXNutzI=
X-Received: by 2002:a05:6808:4f54:b0:41b:51c4:3db0 with SMTP id
 5614622812f47-41cee274b50mr15015805b6e.1.1753061938265; Sun, 20 Jul 2025
 18:38:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250709055029.723243-1-duanchenghao@kylinos.cn>
 <20250709055029.723243-5-duanchenghao@kylinos.cn> <CAEyhmHS__fqHS8Bpg7+4apO7OuXG1sP3miCcAMT+Y3uU0+_xjg@mail.gmail.com>
 <20250717092746.GA993901@chenghao-pc> <CAEyhmHTpJ0OKbW1QEFV+XMxCC9kL2eSwKMkk7=YyLprjNxc8iA@mail.gmail.com>
 <20250718021658.GA203872@chenghao-pc>
In-Reply-To: <20250718021658.GA203872@chenghao-pc>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Mon, 21 Jul 2025 09:38:47 +0800
X-Gm-Features: Ac12FXzElR97SWvvE_bw_O8oDY9xd9oLIQXI1mxXQHZXvgj_GlG9MSrK1vSrj_k
Message-ID: <CAEyhmHRL0FFwSqyir9DcKm24_k1idX02CtwFStwBL-Fxc2ukMQ@mail.gmail.com>
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

On Fri, Jul 18, 2025 at 10:17=E2=80=AFAM Chenghao Duan <duanchenghao@kylino=
s.cn> wrote:
>
> On Thu, Jul 17, 2025 at 06:12:55PM +0800, Hengqi Chen wrote:
> > On Thu, Jul 17, 2025 at 5:27=E2=80=AFPM Chenghao Duan <duanchenghao@kyl=
inos.cn> wrote:
> > >
> > > On Wed, Jul 16, 2025 at 08:21:59PM +0800, Hengqi Chen wrote:
> > > > On Wed, Jul 9, 2025 at 1:50=E2=80=AFPM Chenghao Duan <duanchenghao@=
kylinos.cn> wrote:
> > > > >
> > > > > Implement the functions of bpf_arch_text_poke, bpf_arch_text_copy=
, and
> > > > > bpf_arch_text_invalidate on the LoongArch architecture.
> > > > >
> > > > > On LoongArch, since symbol addresses in the direct mapping
> > > > > region cannot be reached via relative jump instructions from the =
paged
> > > > > mapping region, we use the move_imm+jirl instruction pair as abso=
lute
> > > > > jump instructions. These require 2-5 instructions, so we reserve =
5 NOP
> > > > > instructions in the program as placeholders for function jumps.
> > > > >
> > > > > Co-developed-by: George Guo <guodongtai@kylinos.cn>
> > > > > Signed-off-by: George Guo <guodongtai@kylinos.cn>
> > > > > Signed-off-by: Chenghao Duan <duanchenghao@kylinos.cn>
> > > > > ---
> > > > >  arch/loongarch/include/asm/inst.h |  1 +
> > > > >  arch/loongarch/kernel/inst.c      | 32 +++++++++++
> > > > >  arch/loongarch/net/bpf_jit.c      | 90 +++++++++++++++++++++++++=
++++++
> > > > >  3 files changed, 123 insertions(+)
> > > > >
> > > > > diff --git a/arch/loongarch/include/asm/inst.h b/arch/loongarch/i=
nclude/asm/inst.h
> > > > > index 2ae96a35d..88bb73e46 100644
> > > > > --- a/arch/loongarch/include/asm/inst.h
> > > > > +++ b/arch/loongarch/include/asm/inst.h
> > > > > @@ -497,6 +497,7 @@ void arch_simulate_insn(union loongarch_instr=
uction insn, struct pt_regs *regs);
> > > > >  int larch_insn_read(void *addr, u32 *insnp);
> > > > >  int larch_insn_write(void *addr, u32 insn);
> > > > >  int larch_insn_patch_text(void *addr, u32 insn);
> > > > > +int larch_insn_text_copy(void *dst, void *src, size_t len);
> > > > >
> > > > >  u32 larch_insn_gen_nop(void);
> > > > >  u32 larch_insn_gen_b(unsigned long pc, unsigned long dest);
> > > > > diff --git a/arch/loongarch/kernel/inst.c b/arch/loongarch/kernel=
/inst.c
> > > > > index 674e3b322..8d6594968 100644
> > > > > --- a/arch/loongarch/kernel/inst.c
> > > > > +++ b/arch/loongarch/kernel/inst.c
> > > > > @@ -4,6 +4,7 @@
> > > > >   */
> > > > >  #include <linux/sizes.h>
> > > > >  #include <linux/uaccess.h>
> > > > > +#include <linux/set_memory.h>
> > > > >
> > > > >  #include <asm/cacheflush.h>
> > > > >  #include <asm/inst.h>
> > > > > @@ -218,6 +219,37 @@ int larch_insn_patch_text(void *addr, u32 in=
sn)
> > > > >         return ret;
> > > > >  }
> > > > >
> > > > > +int larch_insn_text_copy(void *dst, void *src, size_t len)
> > > > > +{
> > > > > +       unsigned long flags;
> > > > > +       size_t wlen =3D 0;
> > > > > +       size_t size;
> > > > > +       void *ptr;
> > > > > +       int ret =3D 0;
> > > > > +
> > > > > +       set_memory_rw((unsigned long)dst, round_up(len, PAGE_SIZE=
) / PAGE_SIZE);
> > > > > +       raw_spin_lock_irqsave(&patch_lock, flags);
> > > > > +       while (wlen < len) {
> > > > > +               ptr =3D dst + wlen;
> > > > > +               size =3D min_t(size_t, PAGE_SIZE - offset_in_page=
(ptr),
> > > > > +                            len - wlen);
> > > > > +
> > > > > +               ret =3D copy_to_kernel_nofault(ptr, src + wlen, s=
ize);
> > > > > +               if (ret) {
> > > > > +                       pr_err("%s: operation failed\n", __func__=
);
> > > > > +                       break;
> > > > > +               }
> > > > > +               wlen +=3D size;
> > > > > +       }
> > > >
> > > > Again, why do you do copy_to_kernel_nofault() in a loop ?
> > >
> > > The while loop processes all sizes. I referred to how ARM64 and
> > > RISC-V64 handle this using loops as well.
> >
> > Any pointers ?
>
> I didn't understand what you meant.
>

It's your responsibility to explain why we need a loop here, not mine.
I checked every callsite of copy_to_kernel_nofault(), no one uses a loop.

> >
> > >
> > > > This larch_insn_text_copy() can be part of the first patch like
> > > > larch_insn_gen_{beq,bne}. WDYT ?
> > >
> > > From my perspective, it is acceptable to include both
> > > larch_insn_text_copy and larch_insn_gen_{beq,bne} in the same patch,
> > > or place them in the bpf_arch_xxxx patch. larch_insn_text_copy is
> > > solely used for BPF; the application scope of larch_insn_gen_{beq,bne=
}
> > > is not limited to BPF.
> > >
> >
> > The implementation of larch_insn_text_copy() seems generic.
>
> The use of larch_insn_text_copy() requires page_size alignment.
> Currently, only the size of the trampoline is page-aligned.
>

Then clearly document it.

> >
> > > >
> > > > > +       raw_spin_unlock_irqrestore(&patch_lock, flags);
> > > > > +       set_memory_rox((unsigned long)dst, round_up(len, PAGE_SIZ=
E) / PAGE_SIZE);
> > > > > +
> > > > > +       if (!ret)
> > > > > +               flush_icache_range((unsigned long)dst, (unsigned =
long)dst + len);
> > > > > +
> > > > > +       return ret;
> > > > > +}
> > > > > +
> > > > >  u32 larch_insn_gen_nop(void)
> > > > >  {
> > > > >         return INSN_NOP;
> > > > > diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bp=
f_jit.c
> > > > > index 7032f11d3..9cb01f0b0 100644
> > > > > --- a/arch/loongarch/net/bpf_jit.c
> > > > > +++ b/arch/loongarch/net/bpf_jit.c
> > > > > @@ -4,6 +4,7 @@
> > > > >   *
> > > > >   * Copyright (C) 2022 Loongson Technology Corporation Limited
> > > > >   */
> > > > > +#include <linux/memory.h>
> > > > >  #include "bpf_jit.h"
> > > > >
> > > > >  #define REG_TCC                LOONGARCH_GPR_A6
> > > > > @@ -1367,3 +1368,92 @@ bool bpf_jit_supports_subprog_tailcalls(vo=
id)
> > > > >  {
> > > > >         return true;
> > > > >  }
> > > > > +
> > > > > +static int emit_jump_and_link(struct jit_ctx *ctx, u8 rd, u64 ip=
, u64 target)
> > > > > +{
> > > > > +       s64 offset =3D (s64)(target - ip);
> > > > > +
> > > > > +       if (offset && (offset >=3D -SZ_128M && offset < SZ_128M))=
 {
> > > > > +               emit_insn(ctx, bl, offset >> 2);
> > > > > +       } else {
> > > > > +               move_imm(ctx, LOONGARCH_GPR_T1, target, false);
> > > > > +               emit_insn(ctx, jirl, rd, LOONGARCH_GPR_T1, 0);
> > > > > +       }
> > > > > +
> > > > > +       return 0;
> > > > > +}
> > > > > +
> > > > > +static int gen_jump_or_nops(void *target, void *ip, u32 *insns, =
bool is_call)
> > > > > +{
> > > > > +       struct jit_ctx ctx;
> > > > > +
> > > > > +       ctx.idx =3D 0;
> > > > > +       ctx.image =3D (union loongarch_instruction *)insns;
> > > > > +
> > > > > +       if (!target) {
> > > > > +               emit_insn((&ctx), nop);
> > > > > +               emit_insn((&ctx), nop);
> > > > > +               return 0;
> > > > > +       }
> > > > > +
> > > > > +       return emit_jump_and_link(&ctx, is_call ? LOONGARCH_GPR_T=
0 : LOONGARCH_GPR_ZERO,
> > > > > +                                 (unsigned long)ip, (unsigned lo=
ng)target);
> > > > > +}
> > > > > +
> > > > > +int bpf_arch_text_poke(void *ip, enum bpf_text_poke_type poke_ty=
pe,
> > > > > +                      void *old_addr, void *new_addr)
> > > > > +{
> > > > > +       u32 old_insns[5] =3D {[0 ... 4] =3D INSN_NOP};
> > > > > +       u32 new_insns[5] =3D {[0 ... 4] =3D INSN_NOP};
> > > > > +       bool is_call =3D poke_type =3D=3D BPF_MOD_CALL;
> > > > > +       int ret;
> > > > > +
> > > > > +       if (!is_kernel_text((unsigned long)ip) &&
> > > > > +               !is_bpf_text_address((unsigned long)ip))
> > > > > +               return -ENOTSUPP;
> > > > > +
> > > > > +       ret =3D gen_jump_or_nops(old_addr, ip, old_insns, is_call=
);
> > > > > +       if (ret)
> > > > > +               return ret;
> > > > > +
> > > > > +       if (memcmp(ip, old_insns, 5 * 4))
> > > > > +               return -EFAULT;
> > > > > +
> > > > > +       ret =3D gen_jump_or_nops(new_addr, ip, new_insns, is_call=
);
> > > > > +       if (ret)
> > > > > +               return ret;
> > > > > +
> > > > > +       mutex_lock(&text_mutex);
> > > > > +       if (memcmp(ip, new_insns, 5 * 4))
> > > > > +               ret =3D larch_insn_text_copy(ip, new_insns, 5 * 4=
);
> > > > > +       mutex_unlock(&text_mutex);
> > > > > +       return ret;
> > > > > +}
> > > > > +
> > > > > +int bpf_arch_text_invalidate(void *dst, size_t len)
> > > > > +{
> > > > > +       int i;
> > > > > +       int ret =3D 0;
> > > > > +       u32 *inst;
> > > > > +
> > > > > +       inst =3D kvmalloc(len, GFP_KERNEL);
> > > > > +       if (!inst)
> > > > > +               return -ENOMEM;
> > > > > +
> > > > > +       for (i =3D 0; i < (len/sizeof(u32)); i++)
> > > > > +               inst[i] =3D INSN_BREAK;
> > > > > +
> > > > > +       if (larch_insn_text_copy(dst, inst, len))
> > > > > +               ret =3D -EINVAL;
> > > > > +
> > > > > +       kvfree(inst);
> > > > > +       return ret;
> > > > > +}
> > > > > +
> > > > > +void *bpf_arch_text_copy(void *dst, void *src, size_t len)
> > > > > +{
> > > > > +       if (larch_insn_text_copy(dst, src, len))
> > > > > +               return ERR_PTR(-EINVAL);
> > > > > +
> > > > > +       return dst;
> > > > > +}
> > > > > --
> > > > > 2.43.0
> > > > >
