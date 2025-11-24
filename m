Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2721ACEAF
	for <loongarch@lists.linux.dev>; Mon, 24 Nov 2025 08:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763971303; cv=none; b=FflO5qDitS0Jk0eWh42DWLC1wdZ1GBElWc++/5nDJU1QaVrR8jUsEJwPNTClqENbmVssFLEYtou9XWZ6PL0kU5Gfs7KTDIfQAjIBHg3hkrnrUWbVZdV9izLJFJ/rFZOdey9L0ocWWibQj6qt9XhkhOKYkidH/6kM2+ThgRLwaNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763971303; c=relaxed/simple;
	bh=sF5tZQ4IheBLcB/yUcgV/zqglS5O7o7hgX/6kOgN6+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pv3Qm3sHNGjGaOxHy5dWsmv2utVMCp1Fgeld0OsAblAUVFWKRRIErx0YV+6j+5vYc/ej9AIRgOjhmuVwiStxjU+WPcVOCP/Y/pxhEGcPECvrtov4C1qM4mAdvWGXIMdRW8gxwVLOBcqitXWIaOtEQvBte0gOrTKHzjJsq9sbg9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V419blxe; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V419blxe"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-3ec46e3c65bso3079017fac.0
        for <loongarch@lists.linux.dev>; Mon, 24 Nov 2025 00:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763971301; x=1764576101; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1d8OFf2oDF6ebyhqRQuhoDHeGn0RIXuN7h8GTQkcRuU=;
        b=V419blxeE/L1k/loeuumsSeKjJwcTIKfOASj5oZnONap/vqpYFsc0nUMtJEj3MJc51
         GfubeyU71HKHM/dehenojmtHZ+ScXIiDWmBXz20u4m/DGP6RyiRE78CCd5OVvGpaPtds
         tL/geOKoiU3pzbUw1NjlNPRkbPqDXrJZmq2GeYDvio80vTLubG2N1CdK4088LUBdQFuS
         pMI06Y+X8d0KxjhXx9dEXDToOLUrmM/jWJHn4TiAwo3IGBugTC/khh2yLnJfj1kWx5mM
         ylsuC8+0Sgw8vkTJQaxu4Sxiag/LnNkC+xk5Fxao/U5fBEPvfdVdzhr0YQZEkEoabfCg
         HpxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763971301; x=1764576101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1d8OFf2oDF6ebyhqRQuhoDHeGn0RIXuN7h8GTQkcRuU=;
        b=pyzQZlxFqn8IhAcDJI16DT2l3Qj9xcMgwX1RZhd5g1qxnE+rczqIC967ew2vdg73L1
         ypoysK3LgpxxPhpwgUmUQI4XJIP7Mg1QFvJWWZIdxT72/051aJ2nYU8k5xR1/i4zaVCs
         o66Rn1NGMBuH8RTmSAF+gXqgiihRfBRf4OsPGMCVZD0y9GgyUa9vb9t6ASnyusKLOdKp
         ZlLL7CEgTslTE5WKNUVZiY56Ux+3f5ax9z9iYFKPIyJHV9Mmo4mi7+5bc+nPE8hfSUbd
         6yqiBv8GkR360bed3n+t55OR0GDteg+WF4pQNz0PfAYoqX84MBJnHyhWqr+rg36rGlzk
         W2Gg==
X-Forwarded-Encrypted: i=1; AJvYcCXf6iHsJeS+/9jhTcWnA5nFB3oUIZpWduKlYsl5/8bxkfPGJxyppsZwMsEpCfSZwfB/5dbMot6qc1M=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1ECMiI8NO8cr/RwucbExtmr0x0XXeiqYstmPKNma6kL8bOYss
	ZKRVYfKpGFt0oahb+5TUkMAPB6UzTQI08RpNtz9y0NanA5GX4ONsPuAgifIKpG6WbrzxA4cmEl0
	pEzOszrrVhX5nBOACn27f17rq2rFgw8c=
X-Gm-Gg: ASbGncsDLkV3c8Rtuaxvh8r1RpQFXkP5+QQHBP9QSRbbHwXPpFjHrbOjikO1vfHaFkf
	rUVkvstuwyxKJvKyxt2Yuuzrz+cuvLu0RFVKOhGb/rW97F2N4z6kwpB+tYloH61bM6zclb7FIC9
	KYbtZZK7aD7MRN0v0UJFR6ZwMMAcyKkrftXBXsotiFP4nVM2IkPsZm1u6Velvxeo61cacVsl/LM
	exvxmAf9tTW7qJunCyM8OI7meZzvWbwT5glC/AF1qdwBOMxvWWsjASgmlYPbqqOxypTcPo=
X-Google-Smtp-Source: AGHT+IHYuZbPKc9AjaL1RXrzGCuLByCEGC1pfDDS7A2gugY1Ws1qCzeDFrLdhqWx22TCvcRz/4HI+FSdPdzX9tz3jc0=
X-Received: by 2002:a05:6808:4fec:b0:450:d693:4d1b with SMTP id
 5614622812f47-45115a32f6bmr5044117b6e.26.1763971301105; Mon, 24 Nov 2025
 00:01:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251124055642.1591-1-hengqi.chen@gmail.com> <20251124055642.1591-2-hengqi.chen@gmail.com>
 <CAAhV-H5YOknLF-bAtCiZnsVq=56nOetom7iv52LRnuU6Djh6aA@mail.gmail.com>
In-Reply-To: <CAAhV-H5YOknLF-bAtCiZnsVq=56nOetom7iv52LRnuU6Djh6aA@mail.gmail.com>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Mon, 24 Nov 2025 16:01:29 +0800
X-Gm-Features: AWmQ_bmMBtdurHdp1XCPl_8ww0cOnk3-u_YvyEazOhaJisSoQJ8ENnRJlS9KeF8
Message-ID: <CAEyhmHTFbmZvLdr2SXSc7EpTQbc5fMGfaKzBcKZwP5tH+2sf5Q@mail.gmail.com>
Subject: Re: [PATCH 1/5] LoongArch: BPF: Sign extend kfunc call arguments
To: Huacai Chen <chenhuacai@kernel.org>
Cc: yangtiezhu@loongson.cn, vincent.mc.li@gmail.com, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 2:32=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> Hi, Hengqi,
>
> On Mon, Nov 24, 2025 at 1:56=E2=80=AFPM Hengqi Chen <hengqi.chen@gmail.co=
m> wrote:
> >
> > The kfunc calls are native calls so they should follow LoongArch
> > calling conventions. Sign extend its arguments properly to avoid
> > kernel panic. This is done by adding a new emit_abi_ext() helper.
> > The emit_abi_ext() helper performs extension in place meaning a
> > value already store in target register (This is different from
> > the existing sign_extend() helper and thus we can't reuse it).
> >
> > Fixes: 5dc615520c4d ("LoongArch: Add BPF JIT support")
> > Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
> > ---
> >  arch/loongarch/net/bpf_jit.c | 16 ++++++++++++++++
> >  arch/loongarch/net/bpf_jit.h | 26 ++++++++++++++++++++++++++
> >  2 files changed, 42 insertions(+)
> >
> > diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.=
c
> > index f97dc9936401..c67631303841 100644
> > --- a/arch/loongarch/net/bpf_jit.c
> > +++ b/arch/loongarch/net/bpf_jit.c
> > @@ -950,6 +950,22 @@ static int build_insn(const struct bpf_insn *insn,=
 struct jit_ctx *ctx, bool ext
> >                         emit_insn(ctx, ldd, REG_TCC, LOONGARCH_GPR_SP, =
tcc_ptr_off);
> >                 }
> >
> > +               if (insn->src_reg =3D=3D BPF_PSEUDO_KFUNC_CALL) {
> > +                       const struct btf_func_model *m;
> > +                       int i;
> > +
> > +                       m =3D bpf_jit_find_kfunc_model(ctx->prog, insn)=
;
> > +                       if (!m)
> > +                               return -EINVAL;
> > +
> > +                       for (i =3D 0; i < m->nr_args; i++) {
> > +                               u8 reg =3D regmap[BPF_REG_1 + i];
> > +                               bool sign =3D m->arg_flags[i] & BTF_FMO=
DEL_SIGNED_ARG;
> > +
> > +                               emit_abi_ext(ctx, reg, m->arg_size[i], =
sign);
> > +                       }
> > +               }
> > +
> >                 move_addr(ctx, t1, func_addr);
> >                 emit_insn(ctx, jirl, LOONGARCH_GPR_RA, t1, 0);
> >
> > diff --git a/arch/loongarch/net/bpf_jit.h b/arch/loongarch/net/bpf_jit.=
h
> > index 5697158fd164..ed0193659cf9 100644
> > --- a/arch/loongarch/net/bpf_jit.h
> > +++ b/arch/loongarch/net/bpf_jit.h
> > @@ -88,6 +88,32 @@ static inline void emit_sext_32(struct jit_ctx *ctx,=
 enum loongarch_gpr reg, boo
> >         emit_insn(ctx, addiw, reg, reg, 0);
> >  }
> >
> > +/* Emit proper extension according to ABI requirements.
> > + * Note that this requires a value of size `size` already resides in r=
egister `reg`.
> > + */
> > +static inline void emit_abi_ext(struct jit_ctx *ctx, int reg, u8 size,=
 bool sign)
> > +{
> > +       /* The ABI requires unsigned char/short to be zero-extended, le=
ave it intact */
> > +       if (!sign && (size =3D=3D 1 || size =3D=3D 2))
> > +               return;
> > +
> > +       switch (size) {
> > +       case 1:
> > +               emit_insn(ctx, extwb, reg, reg);
> > +               break;
> > +       case 2:
> > +               emit_insn(ctx, extwh, reg, reg);
> > +               break;
> > +       case 4:
> > +               emit_insn(ctx, addiw, reg, reg, 0);
> > +               break;
> > +       case 8:
> > +               break;
> > +       default:
> > +               pr_warn("bpf_jit: invalid size %d for extension\n", siz=
e);
> > +       }
> > +}
> Looks very similar to sign_extend(), can we reuse something?
>

As decribed in the commit message, both helpers have strong implications:
  - emit_abi_ext() requires values already store in dst reg
  - sign_extend() assumes values not in dst reg and have to move value
    to dst reg even extension is not required

Adding a new helper here is because:
  - requested by Tiezhu in last cycle
  - emit_abi_ext() has better naming (I think)
  - ease the backport process

Even if we are going to reuse the code, I would suggest
replacing the existing sign_extend() with emit_abi_ext().
Note that reuse will require one extra instruction for
struct_ops return value.

> Huacai
>
> > +
> >  static inline void move_addr(struct jit_ctx *ctx, enum loongarch_gpr r=
d, u64 addr)
> >  {
> >         u64 imm_11_0, imm_31_12, imm_51_32, imm_63_52;
> > --
> > 2.43.5
> >
