Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5A935B13C
	for <loongarch@lists.linux.dev>; Thu, 13 Nov 2025 16:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763051080; cv=none; b=Uc0izTvTSHo7tYHWVhn+VI6AjorB230eyoqjjU/vC7GmQt23pjgOjjYXDaAsIoB5TKxqsn+8OIJXpZx6nia0Sk60362JmElhF97zmeIrRNPEvmX3PnzLEEwvx9ioFjGMgHnCxzaSQSQ6+kh3kkDwMezxe2inX4wxJuvVqvMbVJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763051080; c=relaxed/simple;
	bh=NXrY+ya6H9gGNunhw0dML8FCZaW/2ekmhsFvw65jgI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fvsNBEF3wdqHe+Acobabm8lKAS05dAhvy+FKV11STsVg5crW5tv517ogIllBTeSEcXBkGWveUOOeflITHC447ouaiUD54i+Uuv1YilGWdceyw6jYZYpm3dAyJqDJpCzdBELfa9VjyjMQ+wGp+R2hEGkXK4fIZqB/U6AqEbRJSEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eJyiqRtv; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eJyiqRtv"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4ed9c19248bso9156131cf.1
        for <loongarch@lists.linux.dev>; Thu, 13 Nov 2025 08:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763051077; x=1763655877; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IJlNsC13hZMbvuzsO18iDqnwYfO6+x6SXebzZ1yRpMU=;
        b=eJyiqRtvpLI4VerA6ZcCJ23ac+HFg5jRBQOS6yzOgOT7w3lOPnNnqHMSmWhGcSeQf5
         frMbnT8TO4UhstwlvzQI/Hfjpbjdkgb0/4bwxLyO+rO0MZYOy50YWap9xNGWpq1n94n7
         GtTVti4xNIRB+QmzUh8WBJ3Dk8+UONkdAuo1XuMcW6eMIignGl6L7WJCToOalCa4pDpk
         grCleXWY1MMEMek3XDW56CiRjryJ2ISnevXzwVwJREf5wJzeoSj4OeiMR5WfADObguOr
         zmMFZS21qGZrCviea4MxigJ5yAfwwRDcoE+D0BvqAu9vyuQTu+H7pi5vQvESDVhMk/xJ
         9f/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763051077; x=1763655877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IJlNsC13hZMbvuzsO18iDqnwYfO6+x6SXebzZ1yRpMU=;
        b=CrT7ipyViMRAdKr/1Hh6xPgHIJui2VOA48vsS3Yw/LxLNOoNr0HE+GjOD8M4uZD5BQ
         QkyE5/pGAFgnOa+SiQAuaV621RzMo47xIugfZDztUZXY7mVd8XDFMxod+3I1ckRTSrjp
         46Kz3K3RVp+PdiEFiNG08KvBlEu2cuj9WH1oF8OQ4yGeKbS55niiOHpUCxqOSySENRT/
         UAqd5P78LLik+6TpQPdahiaGzsap2X5J1obbcjiEau3q1/2MzkuY8NwGQxwxVV4qsJfW
         bfHFQY6LKdbkHAj7eypuERMPKRF/Vxqt5HpHhMh0m5fnHcgGHeLfIL1DvijFEA0ywTj8
         1h2A==
X-Forwarded-Encrypted: i=1; AJvYcCXV2Sa/lyi4161/UCjl1M+2gF05bmaaSzdE/uHB3lLMMR5nVTZUbfy06b4wsQbrZz1p1U7HRRSyLKg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzSXUat6ZbQ63L4agc4AstJE+pL0+evE/HjR8Vf61xfJwB2V/0I
	TdTuYP7kS6VqScaRfViMCEAI6pA3yU+Pw/iZOIGf1H9UsHdDOkqgPgFa8z3FBS+TNoeOSAvW3V/
	lQm/imF3RPumyDS2Yof6zJCpmvaCHW1A=
X-Gm-Gg: ASbGnct5O7I2F5O6JluMz+JSgHYN3rsCPniArYFdj8CgHPUmVBK6mg4FeP+dQqd4unK
	oePKl2AXGBBaFDmdR6wihaadAGXLm+N0SfxTr5uIa5AmOp5Mekj7RYXBUysLnQ9kiZMeZtW0YER
	THG9nP3Iiom6kpJa43h25jt9qyhYcXE12AiL2y98c6lw/u+D285dQ1QaGvggBmoy70QieQvq59f
	IMUtQZoE1sMfOUnjPQaK9fbV6Tmw2fQUkXXJS3pN836/GnhOXPd1m/ua0wE
X-Google-Smtp-Source: AGHT+IGu9HwcxU3uEHsrPeX8m5Coic0zjCHjYD5RoHXPADKbXKcIMPSgR/oTaDV7hcYlkZfcfOksw4hMUr8pFVDrvVU=
X-Received: by 2002:ac8:5916:0:b0:4ed:cbc2:67b7 with SMTP id
 d75a77b69052e-4edf20e9fa2mr2937721cf.42.1763051077108; Thu, 13 Nov 2025
 08:24:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251110175330.73200-1-vincent.mc.li@gmail.com> <CAEyhmHQ+0TQUukapz6opSCQzN8QwD_hMsXOGAYsaDZcdq-8KkA@mail.gmail.com>
In-Reply-To: <CAEyhmHQ+0TQUukapz6opSCQzN8QwD_hMsXOGAYsaDZcdq-8KkA@mail.gmail.com>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Thu, 13 Nov 2025 08:24:26 -0800
X-Gm-Features: AWmQ_bkNs5xNEAIy06T3DY_qOIC0lOBEOmZAvKDJb5BKk-32rQSAFDubsEHvjmQ
Message-ID: <CAK3+h2z_j_sVg8B+KefVa-DokAigXA44WaO8MuNzv3wr=kHHNA@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: BPF: Disable bpf trampoline kernel module
 function trace
To: Hengqi Chen <hengqi.chen@gmail.com>
Cc: Chenghao Duan <duanchenghao@kylinos.cn>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 2:56=E2=80=AFAM Hengqi Chen <hengqi.chen@gmail.com>=
 wrote:
>
> On Tue, Nov 11, 2025 at 1:53=E2=80=AFAM Vincent Li <vincent.mc.li@gmail.c=
om> wrote:
> >
> > The current LoongArch BPF trampoline implementation is incompatible
> > with tracing functions in kernel modules. This causes several severe
> > and user-visible problems:
> >
> > * Kernel lockups when a BPF program is attached to a module function [0=
].
> > * The `bpf_selftests/module_attach` test fails consistently.
> > * Critical kernel modules like WireGuard experience traffic disruption
> >   when their functions are traced with fentry [1].
> >
> > Given the severity and the potential for other unknown side-effects,
> > it is safest to disable the feature entirely for now. This patch
> > prevents the BPF subsystem from allowing trampoline attachments to
> > module functions on LoongArch.
> >
> > This is a temporary mitigation until the core issues in the trampoline
> > code for module handling can be identified and fixed.
> >
> > [root@fedora bpf]# ./test_progs -a module_attach -v
> > bpf_testmod.ko is already unloaded.
> > Loading bpf_testmod.ko...
> > Successfully loaded bpf_testmod.ko.
> > test_module_attach:PASS:skel_open 0 nsec
> > test_module_attach:PASS:set_attach_target 0 nsec
> > test_module_attach:PASS:set_attach_target_explicit 0 nsec
> > test_module_attach:PASS:skel_load 0 nsec
> > libbpf: prog 'handle_fentry': failed to attach: -ENOTSUPP
> > libbpf: prog 'handle_fentry': failed to auto-attach: -ENOTSUPP
> > test_module_attach:FAIL:skel_attach skeleton attach failed: -524
> > Summary: 0/0 PASSED, 0 SKIPPED, 1 FAILED
> > Successfully unloaded bpf_testmod.ko.
> >
> > [0]: https://lore.kernel.org/loongarch/CAK3+h2wDmpC-hP4u4pJY8T-yfKyk4yR=
zpu2LMO+C13FMT58oqQ@mail.gmail.com/
> > [1]: https://lore.kernel.org/loongarch/CAK3+h2wYcpc+OwdLDUBvg2rF9rvvyc5=
amfHT-KcFaK93uoELPg@mail.gmail.com/
> >
> > Signed-off-by: Vincent Li <vincent.mc.li@gmail.com>
> > ---
> >  arch/loongarch/net/bpf_jit.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
>
> You should add a Fixes tag.
>

 I will add the Fixes tag.

> > diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.=
c
> > index cbe53d0b7fb0..ace89ca95f9b 100644
> > --- a/arch/loongarch/net/bpf_jit.c
> > +++ b/arch/loongarch/net/bpf_jit.c
> > @@ -1624,6 +1624,9 @@ static int __arch_prepare_bpf_trampoline(struct j=
it_ctx *ctx, struct bpf_tramp_i
> >         /* Direct jump skips 5 NOP instructions */
> >         else if (is_bpf_text_address((unsigned long)orig_call))
> >                 orig_call +=3D LOONGARCH_BPF_FENTRY_NBYTES;
> > +       /* BPF selftests module_attach failed, disable module trace */
>
> We disable it not just because BPF selftests failed, actually it
> causes severe issues.
> So this comment should be reworded.
>
ok, make sense

> I am also wondering why we didn't skip nops for kernel module
> functions in the first place.
>
> > +       else if (is_module_text_address((unsigned long)orig_call))
> > +               return -ENOTSUPP;
> >
>
> I am OK with this approach since we can't fix it in time.
> Except the comments above:
>
> Acked-by: Hengqi Chen <hengqi.chen@gmail.com>

Thanks!

>
> >         if (flags & BPF_TRAMP_F_CALL_ORIG) {
> >                 move_addr(ctx, LOONGARCH_GPR_A0, (const u64)im);
> > --
> > 2.38.1
> >
