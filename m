Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDE82DF133
	for <loongarch@lists.linux.dev>; Mon, 24 Nov 2025 06:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763965975; cv=none; b=ejGOqwTTaj/E3B7Dzaxq5UqXmtQmQHvnH6OqNdKhevqWYI3h4xkQIIR5qlhFpyyE/kYUHuFg463vcioYgAeAG3fGsDsHS9VIXza5j1PkZnhKFIObobIXWrRRmVnAUhueSFfQI2YODyCdMlOVKUqJUgc6NAMkzRSeVniCL6wNVzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763965975; c=relaxed/simple;
	bh=1OF21eK7pMcnIljAHSMHML+l+iQMr2my+nCcfb46MZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ery6ibx8LqcicaPJE3pgsb1JA0AUyDbKJ7qt/h7BoTTKU4Rh4PPHAVU6ItwgMCLZmIXZHEgsjM3yPKzmJ4o5/DBk3MiBML+gQdHUHdiSQJc01be/5O2AoDJDRdU+WrGVQpqg5kZyWAa4tDto9iUHnrS6xpRSRK23MiFE9wqiCWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F4wVs1QO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F4wVs1QO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B71CFC19423
	for <loongarch@lists.linux.dev>; Mon, 24 Nov 2025 06:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763965974;
	bh=1OF21eK7pMcnIljAHSMHML+l+iQMr2my+nCcfb46MZQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=F4wVs1QOGhX2Dt9lSKHoomHxF/7TpMLYQ4wf7dnXJSI6jyvVrPG35nOq74zhQ9SIH
	 +Wjc9FTfHq8XlklSU2RaF73UI/at6AGqbChTsFGx9Zo/zIYEIrLsZn9tLCryrIF//+
	 0stvwlVaH9hz73t/gfOkF0893Pe3dR5LGQ5jXTAiHTQlsUkpTXBklmkiv99C+PvevZ
	 douP+JxEWjFOAnQaPcCiexglakva54fqt3T4d3JiOuBYlVkchZ2vpzKrcjkVfA7JfI
	 yBdIoieHOgR3IhZMCdd+JRo5EpUSSaMjP/SmTBy/tisDlRV90UEXW336Bl7bUTaY2k
	 BgO7/v4htmFig==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b737cd03d46so537803966b.0
        for <loongarch@lists.linux.dev>; Sun, 23 Nov 2025 22:32:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWa/xQ1mvmDlxZh1VMoR29huxsuNXAENQJcuRty8dciwplSHccKTTEUjNNfiZom2O7P+Tc9vQxxqDw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxRCNvXvCtu/E20tuU/zMi/KoQt8MsWSKuhiZlxy/4haEV/yz5R
	mBn7BMmpgOg7lfcH6y+lEi8TTYb8caq5rOKMiPmVBGFU3o7cIRWFu1LFCKMfavaMc/jvJaJFmly
	hf1ktrEVD5fCYwuOOTMB2X4353f7LacE=
X-Google-Smtp-Source: AGHT+IGcTQgXw80MDWpvB48VIGTFCe3K1cYjb5Jsukvc0XIePkkFucwBFoL9GIss8+Mnax9eknUm4JxemN/cXoU2/uQ=
X-Received: by 2002:a17:906:4bda:b0:b76:74b6:da75 with SMTP id
 a640c23a62f3a-b7674b6dafamr725385466b.38.1763965973095; Sun, 23 Nov 2025
 22:32:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251124055642.1591-1-hengqi.chen@gmail.com> <20251124055642.1591-2-hengqi.chen@gmail.com>
In-Reply-To: <20251124055642.1591-2-hengqi.chen@gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 24 Nov 2025 14:32:56 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5YOknLF-bAtCiZnsVq=56nOetom7iv52LRnuU6Djh6aA@mail.gmail.com>
X-Gm-Features: AWmQ_blyxVWAeJuhbRjtnLF9tH9M-WlyNSqstzLnp42rqW-UMeV0JmTkKBrxH3Y
Message-ID: <CAAhV-H5YOknLF-bAtCiZnsVq=56nOetom7iv52LRnuU6Djh6aA@mail.gmail.com>
Subject: Re: [PATCH 1/5] LoongArch: BPF: Sign extend kfunc call arguments
To: Hengqi Chen <hengqi.chen@gmail.com>
Cc: yangtiezhu@loongson.cn, vincent.mc.li@gmail.com, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Hengqi,

On Mon, Nov 24, 2025 at 1:56=E2=80=AFPM Hengqi Chen <hengqi.chen@gmail.com>=
 wrote:
>
> The kfunc calls are native calls so they should follow LoongArch
> calling conventions. Sign extend its arguments properly to avoid
> kernel panic. This is done by adding a new emit_abi_ext() helper.
> The emit_abi_ext() helper performs extension in place meaning a
> value already store in target register (This is different from
> the existing sign_extend() helper and thus we can't reuse it).
>
> Fixes: 5dc615520c4d ("LoongArch: Add BPF JIT support")
> Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
> ---
>  arch/loongarch/net/bpf_jit.c | 16 ++++++++++++++++
>  arch/loongarch/net/bpf_jit.h | 26 ++++++++++++++++++++++++++
>  2 files changed, 42 insertions(+)
>
> diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
> index f97dc9936401..c67631303841 100644
> --- a/arch/loongarch/net/bpf_jit.c
> +++ b/arch/loongarch/net/bpf_jit.c
> @@ -950,6 +950,22 @@ static int build_insn(const struct bpf_insn *insn, s=
truct jit_ctx *ctx, bool ext
>                         emit_insn(ctx, ldd, REG_TCC, LOONGARCH_GPR_SP, tc=
c_ptr_off);
>                 }
>
> +               if (insn->src_reg =3D=3D BPF_PSEUDO_KFUNC_CALL) {
> +                       const struct btf_func_model *m;
> +                       int i;
> +
> +                       m =3D bpf_jit_find_kfunc_model(ctx->prog, insn);
> +                       if (!m)
> +                               return -EINVAL;
> +
> +                       for (i =3D 0; i < m->nr_args; i++) {
> +                               u8 reg =3D regmap[BPF_REG_1 + i];
> +                               bool sign =3D m->arg_flags[i] & BTF_FMODE=
L_SIGNED_ARG;
> +
> +                               emit_abi_ext(ctx, reg, m->arg_size[i], si=
gn);
> +                       }
> +               }
> +
>                 move_addr(ctx, t1, func_addr);
>                 emit_insn(ctx, jirl, LOONGARCH_GPR_RA, t1, 0);
>
> diff --git a/arch/loongarch/net/bpf_jit.h b/arch/loongarch/net/bpf_jit.h
> index 5697158fd164..ed0193659cf9 100644
> --- a/arch/loongarch/net/bpf_jit.h
> +++ b/arch/loongarch/net/bpf_jit.h
> @@ -88,6 +88,32 @@ static inline void emit_sext_32(struct jit_ctx *ctx, e=
num loongarch_gpr reg, boo
>         emit_insn(ctx, addiw, reg, reg, 0);
>  }
>
> +/* Emit proper extension according to ABI requirements.
> + * Note that this requires a value of size `size` already resides in reg=
ister `reg`.
> + */
> +static inline void emit_abi_ext(struct jit_ctx *ctx, int reg, u8 size, b=
ool sign)
> +{
> +       /* The ABI requires unsigned char/short to be zero-extended, leav=
e it intact */
> +       if (!sign && (size =3D=3D 1 || size =3D=3D 2))
> +               return;
> +
> +       switch (size) {
> +       case 1:
> +               emit_insn(ctx, extwb, reg, reg);
> +               break;
> +       case 2:
> +               emit_insn(ctx, extwh, reg, reg);
> +               break;
> +       case 4:
> +               emit_insn(ctx, addiw, reg, reg, 0);
> +               break;
> +       case 8:
> +               break;
> +       default:
> +               pr_warn("bpf_jit: invalid size %d for extension\n", size)=
;
> +       }
> +}
Looks very similar to sign_extend(), can we reuse something?

Huacai

> +
>  static inline void move_addr(struct jit_ctx *ctx, enum loongarch_gpr rd,=
 u64 addr)
>  {
>         u64 imm_11_0, imm_31_12, imm_51_32, imm_63_52;
> --
> 2.43.5
>
