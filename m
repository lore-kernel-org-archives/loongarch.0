Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67E41DF75D
	for <loongarch@lists.linux.dev>; Fri, 18 Jul 2025 23:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752880102; cv=none; b=bgkVHL9qguyhovLVwcMLTfpx+NzBPvGo2QznIdoNYqsE2OCXH7j8Kx3bg3lHCujbhK56CB1eUSWgn1bGa3TTEyQyq6k8xI//avrtMWJogApS0sHpdSZQ7zS/b4MSiBLlm3Iy9aRtDdf/46tpGlP6PX052J16FVPos/lY+Jo4vRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752880102; c=relaxed/simple;
	bh=v5sa0Ubz/eBPiv6tbC6mxL8Iy5Y5ms6q627orkUvUbw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uHKSCqR7nKDi1A+r9cnAKP5mb7zpAoJIk87nE5myNdTawHrwsMSJBoIx6hvPfgiDIJb13CLaLhCh5g8DrUb9cAe0EwtbE8oyczWzb1fOO5eyh+lzjjsofIiZUyGTd2E0zkLl+fTIq7Cl5LU8zDSl8YnXAk8huZa69PN9D01weFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kr2flvjX; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kr2flvjX"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4ab82eb3417so26292931cf.2
        for <loongarch@lists.linux.dev>; Fri, 18 Jul 2025 16:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752880098; x=1753484898; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jstStqtvURlnoxN/0ZFbfDdKJbR90Q6tsef1Qb95mxM=;
        b=Kr2flvjXwkF3zIOvXEoqe6v9FN81qebSKw0gvAi7YsTWQ0FhTE6tLLnhHTNLGiOz3j
         4XiPJxswA5ki2chAvgsjlIbakhBXl1WIYI47mzaE9RGEytYd/v/urxqsM/S8smzt7ulr
         eTHSeeOeZgwm+krSJccXNGWsx+TCSuoYXIFfNL3kvHdJJ6wzvyB2sxsFLIjGwa3/LUyf
         8HF4oGAlP2PWpTSqur0sff2GVkySlmR8b0a1nJYuSFhpqzaBIR8nCgNGVfV6QB2tGZu6
         aQjhJBidRa1T1XKoynyCAs4SpMCTSWBl4d5OwxuHACc/SHRMVSM1nXDCAQxOhcbNirKP
         XFWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752880098; x=1753484898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jstStqtvURlnoxN/0ZFbfDdKJbR90Q6tsef1Qb95mxM=;
        b=WUJzhmAbyPLTyWXPBvwOO7a8ZzbA1Z5G0eJSB1Zjmn9AMv83+Kr/tp9jizbED34qjK
         NkEbabPlIHGuNGemFr0LyyI4wi9d+zMPNz6sck7nt4sX+AvrUmuoKa/lB7c1wZNgZdwn
         tV3g2UrkBwvYNFEDPWhjjHmCIs7xCqcE2aUPW747zRQomVmQi5qftFiHk5YaSnbXEDC3
         QvOd+iLJS157Uc7ZtrWS6CaqYi5LInkyz1YITsdjX3cuY76BQdfu9cYiHECfwexJNVED
         v2bTO2jjObXjJ0YQE39cMvOyfi1u77b5ef4zQRTOVbM3BhG2Ux6O6DWkfurZECjBF2sM
         Phbw==
X-Forwarded-Encrypted: i=1; AJvYcCWeT94Khtv18LJ18+q3J8745df4hacyC3+Gghr+v44OzVyzyALagaVVOiThZBIffe6AP754f2apy1U=@lists.linux.dev
X-Gm-Message-State: AOJu0YwoFw7VSgqnrwHHNqO+eTeTcPftOTfj8iIoblEwVHtFj0xjr8Cy
	Xmm+ZJk3CC3SBdqRbYRqIiV2Nay+Q1pNVNeikXuas17NqdT1MsFQHewlgPauntPeIt5fP9gUvY3
	Wz4F1+5CaN4efnDVFk/jERT1oaulcvR0=
X-Gm-Gg: ASbGncvJQIvIA2hCQwKw+xoJpZtRY2Yknu+WaFPZESb8OQnhvC7C+ZBCfg+EyvR72EQ
	s3rUnFnNvcNegw18P4btC/qXXxYCMv//Kog5x/7xODW/FG3/tGTce7plxP+qcMeODH9ZOSZ1CFr
	MAwMJ0Gn6kWSqMhorGCxtraNBTgWUctzLQRvthUls/CiKRL+5RdzVtEbZHNB7gxqx1Y/dSzzLAZ
	HVsv48=
X-Google-Smtp-Source: AGHT+IHNsdarn7CSt/1PDcBt4FjTRfdMRkg0YpLbzcnrT1IQ9EUuVSE/2ul4tT8H3hUHdSayi+66AwiOoQvq1WzfGSc=
X-Received: by 2002:ac8:5e06:0:b0:4a9:8685:1e92 with SMTP id
 d75a77b69052e-4ab90b1b83bmr184050101cf.34.1752880098347; Fri, 18 Jul 2025
 16:08:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250709055029.723243-1-duanchenghao@kylinos.cn> <20250709055029.723243-5-duanchenghao@kylinos.cn>
In-Reply-To: <20250709055029.723243-5-duanchenghao@kylinos.cn>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Fri, 18 Jul 2025 16:08:07 -0700
X-Gm-Features: Ac12FXybRUorkpV3SfDpaT4CFeXjeDJvvj97Iw6LEOQcx-4Zmjk9cnMrrzSYvn8
Message-ID: <CAK3+h2zTfS0M7K5Mao=yQ72RLgM6R1aJTukiJMRcXhbTpc0Ezg@mail.gmail.com>
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

Hi Chenghao,

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

When I compare your Loongarch implementation to riscv commit 596f2e6f9
("riscv, bpf: Add bpf_arch_text_poke support for RV64"), I noticed
riscv commit has below change to bpf_jit_build_prologue(), that I
think is for adding 4 NOPs for bpf2bpf (bpf freplace bpf) use case.
but your implementation does not have a similar change to loongarch
build_prologue.

 @@ -1293,6 +1373,10 @@ void bpf_jit_build_prologue(struct rv_jit_context *=
ctx)

        store_offset =3D stack_adjust - 8;

+       /* reserve 4 nop insns */
+       for (i =3D 0; i < 4; i++)
+               emit(rv_nop(), ctx);
+

later  riscv commit 25ad10658d ("riscv, bpf: Adapt bpf trampoline to
optimized riscv ftrace framework") made further changes to
bpf_jit_build_prologue() with below.

@@ -1691,8 +1702,8 @@ void bpf_jit_build_prologue(struct rv_jit_context *ct=
x)

        store_offset =3D stack_adjust - 8;

-       /* reserve 4 nop insns */
-       for (i =3D 0; i < 4; i++)
+       /* nops reserved for auipc+jalr pair */
+       for (i =3D 0; i < RV_FENTRY_NINSNS; i++)
                emit(rv_nop(), ctx);

I assume Loongarch has not adopted the ftrace framework, so Loongarch
build_prologue() should reserve 5 NOPs too? and that would resolve the
xdp-tool use case  and selftest fexit_bpf2bpf issue?

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
