Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C2A25B1D2
	for <loongarch@lists.linux.dev>; Mon, 24 Nov 2025 08:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763971520; cv=none; b=kAWFy4tpb8vHlX+x66Mf1F/Mhly298a195LKglAxTbw4w/KA0anusH6W2o8C8hVYFoMB85pBrKN9KdexsxqHBpU+iCBjhcRB+ZLyKjxq6diP3Xy1SKbbfutyGCbNCvU9tZy6IrETpzZmwKtOz7f7pGYWqILH39xdGcUENtOE+2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763971520; c=relaxed/simple;
	bh=x578kJ8gmslp7q5dEBq8pO4U7q7/5luR08zqPs5F1oY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PjdQAkNPXfAqJxAOcD0mxEYlSUDtO2SonjNsDAqL+gFjX0EfArkFzdZkFgNA4V4MOIyx+ZhxbXVH4kYMPKVgK9k0HL7HXsG5WnRgXe3zHgRXBe/DW32/y0Ha/dySteNk90AOde08ufPfNJesblckBlk1mBoZBoi/gcoOzsfX81k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rLGci3eU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rLGci3eU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7CF5C4AF0B
	for <loongarch@lists.linux.dev>; Mon, 24 Nov 2025 08:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763971519;
	bh=x578kJ8gmslp7q5dEBq8pO4U7q7/5luR08zqPs5F1oY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rLGci3eUaQzlI85Vfwu3Wy3uGz+0z75+x7OT8Pi3k4/6hgJ3urVe95rU7HExJ2TaW
	 PkEaC42llZxvw3OtI8CzLTnwA+nlI3Gkaj5VlauJVJShKS5GAuwQHPKM05t98LGq7/
	 kezIgW6P47KnucEHQidT6GR7XJT4vFYkMiucKzQS8oEhgvLT17JMbKP58waZXS6oFS
	 +TNvOMoABsLDiPlClNaReuYaO/G0kh2kizxlmcuxYEvWltZSLsk+dvE+ZvKcUCHivO
	 9QsRjemMCbZbx3s2w2yMHn+GqNniuN7jPVtjZA+aA95lrJIuBWCnEWHBdUoEhA5F+a
	 uepUEbtz2YKNQ==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b72bf7e703fso660161866b.2
        for <loongarch@lists.linux.dev>; Mon, 24 Nov 2025 00:05:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUOTzwdhRGo0S9HhflFdY/bIC383Cs4Ta9wLoVY8CXb8r8YooOfhDz5K7JQxAIuhpIENVH8dGxY67g=@lists.linux.dev
X-Gm-Message-State: AOJu0YypJetDkWJ6DVdF1Ui7V1VbNN5GPZ4oRrsTX417fH2maBCwh6WQ
	KCav975kZ8/nDhSZuQSM4tefruqe0Sd6H8laepWqm/NLjiscIYdF7Lkn1nXK3K6OMLIr5POk6g/
	Qs9MuB4KY1ICtdtq881L1jK802TK+6/k=
X-Google-Smtp-Source: AGHT+IHU2jUqbE+TduT6rA+RqYz8WgKxJ126vxYUcuU2uMMfHBleKu5+0yf8oFO2zbyNner7Jdn4+VIPupufFBTIN+w=
X-Received: by 2002:a17:907:d94:b0:b6d:9bab:a7ba with SMTP id
 a640c23a62f3a-b7671a7ad6emr1164474266b.42.1763971518391; Mon, 24 Nov 2025
 00:05:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251124055642.1591-1-hengqi.chen@gmail.com> <20251124055642.1591-2-hengqi.chen@gmail.com>
 <CAAhV-H5YOknLF-bAtCiZnsVq=56nOetom7iv52LRnuU6Djh6aA@mail.gmail.com> <CAEyhmHTFbmZvLdr2SXSc7EpTQbc5fMGfaKzBcKZwP5tH+2sf5Q@mail.gmail.com>
In-Reply-To: <CAEyhmHTFbmZvLdr2SXSc7EpTQbc5fMGfaKzBcKZwP5tH+2sf5Q@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 24 Nov 2025 16:05:22 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4aCHaRJTP89reU9kx6p3caSBGJzbjBjXazntvT+2JePw@mail.gmail.com>
X-Gm-Features: AWmQ_bk1DWZ960axZX1v_S6BnTjsm3P32bvbVxiAcphzJvwKSRJoBaqO7OY1K_8
Message-ID: <CAAhV-H4aCHaRJTP89reU9kx6p3caSBGJzbjBjXazntvT+2JePw@mail.gmail.com>
Subject: Re: [PATCH 1/5] LoongArch: BPF: Sign extend kfunc call arguments
To: Hengqi Chen <hengqi.chen@gmail.com>
Cc: yangtiezhu@loongson.cn, vincent.mc.li@gmail.com, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 4:01=E2=80=AFPM Hengqi Chen <hengqi.chen@gmail.com>=
 wrote:
>
> On Mon, Nov 24, 2025 at 2:32=E2=80=AFPM Huacai Chen <chenhuacai@kernel.or=
g> wrote:
> >
> > Hi, Hengqi,
> >
> > On Mon, Nov 24, 2025 at 1:56=E2=80=AFPM Hengqi Chen <hengqi.chen@gmail.=
com> wrote:
> > >
> > > The kfunc calls are native calls so they should follow LoongArch
> > > calling conventions. Sign extend its arguments properly to avoid
> > > kernel panic. This is done by adding a new emit_abi_ext() helper.
> > > The emit_abi_ext() helper performs extension in place meaning a
> > > value already store in target register (This is different from
> > > the existing sign_extend() helper and thus we can't reuse it).
> > >
> > > Fixes: 5dc615520c4d ("LoongArch: Add BPF JIT support")
> > > Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
> > > ---
> > >  arch/loongarch/net/bpf_jit.c | 16 ++++++++++++++++
> > >  arch/loongarch/net/bpf_jit.h | 26 ++++++++++++++++++++++++++
> > >  2 files changed, 42 insertions(+)
> > >
> > > diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_ji=
t.c
> > > index f97dc9936401..c67631303841 100644
> > > --- a/arch/loongarch/net/bpf_jit.c
> > > +++ b/arch/loongarch/net/bpf_jit.c
> > > @@ -950,6 +950,22 @@ static int build_insn(const struct bpf_insn *ins=
n, struct jit_ctx *ctx, bool ext
> > >                         emit_insn(ctx, ldd, REG_TCC, LOONGARCH_GPR_SP=
, tcc_ptr_off);
> > >                 }
> > >
> > > +               if (insn->src_reg =3D=3D BPF_PSEUDO_KFUNC_CALL) {
> > > +                       const struct btf_func_model *m;
> > > +                       int i;
> > > +
> > > +                       m =3D bpf_jit_find_kfunc_model(ctx->prog, ins=
n);
> > > +                       if (!m)
> > > +                               return -EINVAL;
> > > +
> > > +                       for (i =3D 0; i < m->nr_args; i++) {
> > > +                               u8 reg =3D regmap[BPF_REG_1 + i];
> > > +                               bool sign =3D m->arg_flags[i] & BTF_F=
MODEL_SIGNED_ARG;
> > > +
> > > +                               emit_abi_ext(ctx, reg, m->arg_size[i]=
, sign);
> > > +                       }
> > > +               }
> > > +
> > >                 move_addr(ctx, t1, func_addr);
> > >                 emit_insn(ctx, jirl, LOONGARCH_GPR_RA, t1, 0);
> > >
> > > diff --git a/arch/loongarch/net/bpf_jit.h b/arch/loongarch/net/bpf_ji=
t.h
> > > index 5697158fd164..ed0193659cf9 100644
> > > --- a/arch/loongarch/net/bpf_jit.h
> > > +++ b/arch/loongarch/net/bpf_jit.h
> > > @@ -88,6 +88,32 @@ static inline void emit_sext_32(struct jit_ctx *ct=
x, enum loongarch_gpr reg, boo
> > >         emit_insn(ctx, addiw, reg, reg, 0);
> > >  }
> > >
> > > +/* Emit proper extension according to ABI requirements.
> > > + * Note that this requires a value of size `size` already resides in=
 register `reg`.
> > > + */
> > > +static inline void emit_abi_ext(struct jit_ctx *ctx, int reg, u8 siz=
e, bool sign)
> > > +{
> > > +       /* The ABI requires unsigned char/short to be zero-extended, =
leave it intact */
> > > +       if (!sign && (size =3D=3D 1 || size =3D=3D 2))
> > > +               return;
> > > +
> > > +       switch (size) {
> > > +       case 1:
> > > +               emit_insn(ctx, extwb, reg, reg);
> > > +               break;
> > > +       case 2:
> > > +               emit_insn(ctx, extwh, reg, reg);
> > > +               break;
> > > +       case 4:
> > > +               emit_insn(ctx, addiw, reg, reg, 0);
> > > +               break;
> > > +       case 8:
> > > +               break;
> > > +       default:
> > > +               pr_warn("bpf_jit: invalid size %d for extension\n", s=
ize);
> > > +       }
> > > +}
> > Looks very similar to sign_extend(), can we reuse something?
> >
>
> As decribed in the commit message, both helpers have strong implications:
>   - emit_abi_ext() requires values already store in dst reg
>   - sign_extend() assumes values not in dst reg and have to move value
>     to dst reg even extension is not required
>
> Adding a new helper here is because:
>   - requested by Tiezhu in last cycle
>   - emit_abi_ext() has better naming (I think)
Emm, but I think this name is strage, though I don't know what is better.

Huacai

>   - ease the backport process
>
> Even if we are going to reuse the code, I would suggest
> replacing the existing sign_extend() with emit_abi_ext().
> Note that reuse will require one extra instruction for
> struct_ops return value.
>
> > Huacai
> >
> > > +
> > >  static inline void move_addr(struct jit_ctx *ctx, enum loongarch_gpr=
 rd, u64 addr)
> > >  {
> > >         u64 imm_11_0, imm_31_12, imm_51_32, imm_63_52;
> > > --
> > > 2.43.5
> > >
