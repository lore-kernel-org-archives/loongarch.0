Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7302F4322
	for <loongarch@lists.linux.dev>; Thu, 12 Jun 2025 12:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749731572; cv=none; b=i0IAZMLVG/8rCaarFM8cSfM8m9H7mnQcWuVP+nHivAAyp0WOZ1c0otxJqKHlwjdZqpbUVpTfhmegguvjVYXNqFE9daFL7ZaCQwj9BSztHTnAqYtDSB+cunaBNYA6pRW/imNqGmCcD+Bw3Zf239h4Loh2wXjcG6NERF2KW0lVozw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749731572; c=relaxed/simple;
	bh=itbBKmiB/eRktu8WBvdJ+kWWBn0x1Ka/FQmExd/xG4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HruEBC4NTfikcq15H8UxtxzpVIkwjkhKphWnKzd9dJZzQnhxJq/SkMOih71tGehzxcBBK/znFuz8PEjM8GCV0TdzXAUKs0NYTEwCT+Dz03VIo29u8ZUx+wbN28cXEH2jeTw7R/d6Ma2wNgbY38DoohhayQtOCCF2/kndqLIm3l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ewd1w1R8; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ewd1w1R8"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-40a55314d06so214786b6e.1
        for <loongarch@lists.linux.dev>; Thu, 12 Jun 2025 05:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749731570; x=1750336370; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F9R7HMfjVP5hLYp8NKZr2yd6p344TnKr8oqoOf0S4a4=;
        b=ewd1w1R8Hw4Nrt8Y+iemtrnjjah0IE51Ld+yvNPuLm9BS+OLt9464XurlE2T4iXyF3
         yuBXE2DZSQM3Hrf5qsSbO/9Yld9cx1lqviD2ZcKbnp5gE+2ZH7YQB7fNSBqF/SZIfPbT
         mHdg4Cbrjp7ZySu6LkEUinVnQ/ewkMYP9bV/0ugTOc0CbKZvVsT5d9YU+pSpwx/SYhTQ
         R8uaARpJQzbeGFHlTqXVQtQSDS5iAP+by0apLNyg4qblVVUwcJiFRdZn+N6Ekde7JaDP
         NnxY2yPGVbb/RnwdDnFlARuyrrqekXXguC1eZatuhvYas85TAT4CsfQCeB6C4Rct7+4n
         /wXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749731570; x=1750336370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F9R7HMfjVP5hLYp8NKZr2yd6p344TnKr8oqoOf0S4a4=;
        b=FS/ThuG7yr5PBGPh7LimT4lxrNsKkd8l8Gi1sYj81c2cXs4vJHpNHiNWj95xNGTDkH
         6Gg5Tu+FHhaRehrjmKcLCT5tHuNkjigtojiWaqaKCnc+J91gBYPL+EISIBGMXUOIfNwq
         xX9LdFcALEwxReWQH3uCZwOxzxUy512L8AkAwMjVL+ePWOZTO8j9zFMklDndX1DggyOv
         3SjCmQl6WDXkMN8q//mjxxlpR3xDzzBU/FXb3HN0EM73v/MRRbICJJ5yyow1O9MNBMgL
         LMb3wUKqGYef0Aym6O2/FSIFx+jLR4ig//iAVJnTgnFm+yiLH+yAsI7Io3vHm5Z8mqaY
         +iOA==
X-Gm-Message-State: AOJu0YxIP7eJjcs9+W1RZx5tiaQfP3NrPVIxHxx26QDx1wFbghU95d04
	W3Coe3yEV0wGHrf7c+oZlbIAiSdh97C2NDlsBIGngMCWGYSJNPl5XogqObE2SBxf0m564YvjHqr
	HTvOK/8KrQMVjn+dPSaZu9WI+FrYtQGA=
X-Gm-Gg: ASbGncupj8fnkxrGIBmmibo54sQWEs+rW/bYitMKUk/fmgnv88ksVFb4jMeDNSgKGx9
	8jLAU1IXBV1WZJiakUb9sNOrR79e2gbpo8UrPoWreSsf38rjfQLFU3n9QCnMwvnWKGSuZijBDCp
	wv8/8ELNE5OUpBXZb4Po28Sen1FQWDt/Dzv+reolaLdUg=
X-Google-Smtp-Source: AGHT+IHuv2ZpMuCRDSAveCE4jogtHLyxPHM0rUIbzPy4eM1sexAaaYGtCyJMZDjU6N4B0lgUpVXG6VH99nFQdzPnGbY=
X-Received: by 2002:a05:6808:1a1e:b0:408:f016:f985 with SMTP id
 5614622812f47-40a66122091mr2072828b6e.17.1749731570159; Thu, 12 Jun 2025
 05:32:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250611035952.111182-3-duanchenghao@kylinos.cn>
 <20250611053625.352091-1-duanchenghao@kylinos.cn> <20250611053625.352091-3-duanchenghao@kylinos.cn>
In-Reply-To: <20250611053625.352091-3-duanchenghao@kylinos.cn>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Thu, 12 Jun 2025 20:32:38 +0800
X-Gm-Features: AX0GCFsyBjL1gdBLcBH_aPsGgs0omG8-ReQGZ7QXkuzQDU3gMwdsaT8Ij6pxv70
Message-ID: <CAEyhmHQby6kGBRP8wQvKeL3fb1J_kpByBtYEWDY-3eOzRbhf0Q@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] LoongArch: BPF: The operation commands needed to
 add a trampoline
To: Chenghao Duan <duanchenghao@kylinos.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	George Guo <guodongtai@kylinos.cn>, Youling Tang <tangyouling@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 1:37=E2=80=AFPM Chenghao Duan <duanchenghao@kylinos=
.cn> wrote:
>
> Add instrctions:
> emit_NOP
> emit_BREAK
>
> Add branch jump function:
> larch_insn_gen_beq
> larch_insn_gen_bne
>
> Add instruction copy function: larch_insn_text_copy
> The implementation of larch_insn_text_copy uses the fixmap
> FIX_TEXT_POKE0.
>
> Signed-off-by: George Guo <guodongtai@kylinos.cn>
> Signed-off-by: Youling Tang <tangyouling@kylinos.cn>
> Signed-off-by: Chenghao Duan <duanchenghao@kylinos.cn>
> ---
>  arch/loongarch/include/asm/inst.h | 19 +++++++
>  arch/loongarch/kernel/inst.c      | 85 +++++++++++++++++++++++++++++++
>  2 files changed, 104 insertions(+)
>
> diff --git a/arch/loongarch/include/asm/inst.h b/arch/loongarch/include/a=
sm/inst.h
> index 3089785ca..dd6e07781 100644
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
> @@ -778,6 +781,22 @@ static inline void emit_##NAME(union loongarch_instr=
uction *insn,  \
>
>  DEF_EMIT_REG3SA2_FORMAT(alsld, alsld_op)
>
> +#define DEF_EMIT_NOP(NAME)                                             \
> +static inline void emit_##NAME(union loongarch_instruction *insn)      \
> +{                                                                      \
> +       insn->word =3D INSN_NOP;                                         =
 \
> +}
> +
> +DEF_EMIT_NOP(NOP)
> +

We have the following helpers in bpf_jit.h already:
  * emit_nop
  * emit_cond_jmp
  * emit_uncond_jmp

These can be used directly.

> +#define DEF_EMIT_BREAK(NAME)                                           \
> +static inline void emit_##NAME(union loongarch_instruction *insn)      \
> +{                                                                      \
> +       insn->word =3D INSN_BREAK;                                       =
 \
> +}
> +
> +DEF_EMIT_BREAK(BREAK)
> +
>  struct pt_regs;
>
>  void emulate_load_store_insn(struct pt_regs *regs, void __user *addr, un=
signed int *pc);
> diff --git a/arch/loongarch/kernel/inst.c b/arch/loongarch/kernel/inst.c
> index 14d7d700b..a47dc3575 100644
> --- a/arch/loongarch/kernel/inst.c
> +++ b/arch/loongarch/kernel/inst.c
> @@ -10,6 +10,33 @@
>
>  static DEFINE_RAW_SPINLOCK(patch_lock);
>
> +static bool is_image_text(unsigned long addr)
> +{
> +       return core_kernel_text(addr);
> +}
> +
> +static void  *patch_map(void *addr, int fixmap)

                    ^ extra space here

> +{
> +       unsigned long uintaddr =3D (uintptr_t)addr;
> +       bool image =3D is_image_text(uintaddr);
> +       struct page *page;
> +       phys_addr_t phys;
> +
> +       if (image)
> +               phys =3D __pa_symbol(addr);
> +       else {
> +               page =3D vmalloc_to_page(addr);
> +       phys =3D page_to_phys(page) + offset_in_page(addr);

weird indentation, please fix.

> +       }
> +
> +       return (void *)set_fixmap_offset(fixmap, phys);
> +}
> +
> +static void patch_unmap(int fixmap)
> +{
> +       clear_fixmap(fixmap);
> +}
> +
>  void simu_pc(struct pt_regs *regs, union loongarch_instruction insn)
>  {
>         unsigned long pc =3D regs->csr_era;
> @@ -218,6 +245,36 @@ int larch_insn_patch_text(void *addr, u32 insn)
>         return ret;
>  }
>
> +int larch_insn_text_copy(void *dst, void *src, size_t len)
> +{
> +       unsigned long flags;
> +       size_t wlen =3D 0;
> +       size_t size;
> +       void *waddr;
> +       void *ptr;
> +       int ret =3D 0;
> +
> +       raw_spin_lock_irqsave(&patch_lock, flags);
> +       while (wlen < len) {
> +               ptr =3D dst + wlen;
> +               size =3D min_t(size_t, PAGE_SIZE - offset_in_page(ptr),
> +                            len - wlen);
> +
> +               waddr =3D patch_map(ptr, FIX_TEXT_POKE0);
> +               ret =3D copy_to_kernel_nofault(waddr, src + wlen, size);
> +               patch_unmap(FIX_TEXT_POKE0);
> +
> +               if (ret) {
> +                       pr_err("%s: operation failed\n", __func__);
> +                       break;
> +               }
> +               wlen +=3D size;
> +       }
> +       raw_spin_unlock_irqrestore(&patch_lock, flags);
> +
> +       return ret;
> +}
> +
>  u32 larch_insn_gen_nop(void)
>  {
>         return INSN_NOP;
> @@ -336,3 +393,31 @@ u32 larch_insn_gen_jirl(enum loongarch_gpr rd, enum =
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
> 2.25.1
>
>
