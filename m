Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 767271DD525
	for <loongarch@lists.linux.dev>; Mon, 13 Apr 2026 08:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776067577; cv=none; b=gI7pyWTxVgrdbwNyNXgj0qYP944YgNujHqsUbAQy0WHImBwrqRMjyJcZHHTKS4w4+5JR5u7jJhU6wxlP7DgLNAhzsqqyiirDl1xCPzmaOlX9mSFASLppb7jX0yjOQc4BEAfwH/X/+IICwYz5kpVqXNeyExi8/SyMnayqdFHwpQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776067577; c=relaxed/simple;
	bh=ntJPW3F9wCH+bnd+CBHM4WQZ6U/QVcZiqScx2Aax40s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l+fNWFN5WoRjKPUkmqrLPwxrxXfWqjt3MbzOtF/IDDEppIZ6dCRhFW+Jfx4qxMK6Mt9FQuKh2d1KXW8Jo4ccxHQ6tUNfkJmpcv1ZhX4qanxXmO9zP/NEgPtlt999+DeoDxxM3ps0A1XE+p86wTMWuj7vokqSmC6u1ZeiW47gMdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [209.85.128.181])
	by gateway (Coremail) with SMTP id _____8CxX+rzo9xplBMAAA--.64S3;
	Mon, 13 Apr 2026 16:06:12 +0800 (CST)
Received: from mail-yw1-f181.google.com (unknown [209.85.128.181])
	by front1 (Coremail) with SMTP id qMiowJCxmuDxo9xpgvlrAA--.48229S2;
	Mon, 13 Apr 2026 16:06:10 +0800 (CST)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-797ab169454so47322747b3.3
        for <loongarch@lists.linux.dev>; Mon, 13 Apr 2026 01:06:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/R7S8l6INKeYUdYvxaUMYKQYgjS0jzeu7Cfp9WE174LJzpUydcgSBigLt8kxy7f7dKD1i0aT5jnpg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/BdxC6P49xQbjIOe0ByVg7Fqgr4dngp4UCraphTSYdF+BI+SJ
	3KHoOZUeiPKQITH9IrnyIzGU0jSLtPt4fVwbsy0H1pd+ShzI/e0j+Z3v4FlWyRP0ValERElp2VZ
	BzHU0OaSwdRXCiCHLL10OLABl3MVHc3PDf3HHzJpG+Q==
X-Received: by 2002:a53:d007:0:b0:651:c047:f094 with SMTP id
 956f58d0204a3-651c047f43amr3893314d50.31.1776067568854; Mon, 13 Apr 2026
 01:06:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260413040506.26640-4-yangtiezhu@loongson.cn> <8822e0eb47985fc0bcb8bc6c9b0fcdfb55566144517d90a8e77f2690c44ee8df@mail.kernel.org>
In-Reply-To: <8822e0eb47985fc0bcb8bc6c9b0fcdfb55566144517d90a8e77f2690c44ee8df@mail.kernel.org>
From: WANG Rui <wangrui@loongson.cn>
Date: Mon, 13 Apr 2026 16:05:57 +0800
X-Gmail-Original-Message-ID: <CAHirt9gy=HETVpi6bOrUOw65N0wuVVSMG-0usMSAQKm7G4OQww@mail.gmail.com>
X-Gm-Features: AQROBzDo6XriASiqA6WQWtAVhetXPEwhLVNnHT93SmV1NrOhpV5lBoAQTMbGKwU
Message-ID: <CAHirt9gy=HETVpi6bOrUOw65N0wuVVSMG-0usMSAQKm7G4OQww@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] LoongArch: BPF: Support 8 and 16 bit
 read-modify-write instructions
To: bot+bpf-ci@kernel.org
Cc: yangtiezhu@loongson.cn, chenhuacai@kernel.org, hengqi.chen@gmail.com, 
	loongarch@lists.linux.dev, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ast@kernel.org, andrii@kernel.org, daniel@iogearbox.net, 
	martin.lau@kernel.org, eddyz87@gmail.com, yonghong.song@linux.dev, 
	clm@meta.com, ihor.solodrai@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:qMiowJCxmuDxo9xpgvlrAA--.48229S2
X-CM-SenderInfo: pzdqw2txl6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxWr18Zw18GrWUXr1fGFykJFc_yoWrXF4kpr
	y8Wrs5Cr4kJFyqv3s7Ja17JrWUKr4ay3W7Wr1UXrWYyayYvF98JF10kF17XFW5urZYyFWa
	vF4q9w12va1UtagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x
	0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU1CPfJUUUUU==

On Mon, Apr 13, 2026 at 12:49=E2=80=AFPM <bot+bpf-ci@kernel.org> wrote:
>
> > diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.=
c
> > index fefda4050a20..c9a32f124f5e 100644
> > --- a/arch/loongarch/net/bpf_jit.c
> > +++ b/arch/loongarch/net/bpf_jit.c
>
> [ ... ]
>
> > @@ -388,11 +408,32 @@ static int emit_atomic_rmw(const struct bpf_insn =
*insn, struct jit_ctx *ctx)
> >       /* src =3D atomic_fetch_<op>(dst + off, src) */
> >       case BPF_ADD | BPF_FETCH:
> > +             switch (BPF_SIZE(insn->code)) {
> > +             case BPF_B:
> > +                     if (cpu_has_lam_bh) {
> > +                             emit_insn(ctx, amaddb, src, t1, t3);
> > +                             emit_zext_32(ctx, src, true);
>
> Is emit_zext_32() sufficient for zero-extending an 8-bit value here?
>
> emit_zext_32() uses lu32id to clear bits [63:32], but for a byte-width
> atomic fetch the returned value needs bits [63:8] zeroed. If amadd.b
> follows the LoongArch convention of sign-extending sub-word results
> (as amadd.w does for 32-bit values), then a byte value like 0x80 would
> produce 0x00000000ffffff80 after emit_zext_32() instead of the expected
> 0x0000000000000080.
>
> Elsewhere in this file, 16-bit zero-extension already uses bstrpickd:
>
>     emit_insn(ctx, bstrpickd, dst, dst, 15, 0);
>
> Should the BPF_B and BPF_H cases here use bstrpickd with the
> appropriate bit range (7,0 for bytes and 15,0 for halfwords) instead
> of emit_zext_32()?

I don't think truncating byte and sub-word results to only the low 8
or 16 bits is the right model here. The current behavior intentionally
keeps the low 32 bits of the computed value in the register, because
all uses explicitly extend from 32 bits to 64 bits when feeding
instructions that require 64-bit operands. The same reasoning should
apply to byte and sub-word types as well.

For example:

Def:
int8 a =3D amadd.b
int8 b =3D amadd.b

Use:
t1 =3D sext32 a
t2 =3D sext32 b
blt t1, t2   // a < b

Take a =3D -1 and b =3D 0. In the 64-bit registers:

If we keep the low 32 bits:
a: 0x0000_0000_ffff_ffff
b: 0x0000_0000_0000_0000

then:
t1: 0xffff_ffff_ffff_ffff
t2: 0x0000_0000_0000_0000

So a < b evaluates to true, as expected.

But if we only keep the low 8 bits:
a: 0x0000_0000_0000_00ff
b: 0x0000_0000_0000_0000

then:
t1: 0x0000_0000_0000_00ff
t2: 0x0000_0000_0000_0000

Now a < b becomes false, which is clearly not the intended result.

In other words, narrowing the result to 8 or 16 bits here would break
the existing 32-bit canonicalization rule for sub-word values.

More generally, the "always explicitly extend" pattern doesn't map
particularly well to the LoongArch ISA. In the long run, it would be
preferable if we could eliminate these explicit extensions altogether
rather than relying on them as part of the semantic model.

Thanks,
Rui


>
> > +             case BPF_H:
> > +                     if (cpu_has_lam_bh) {
> > +                             emit_insn(ctx, amaddh, src, t1, t3);
> > +                             emit_zext_32(ctx, src, true);
>
> Same concern for the halfword case -- emit_zext_32() would leave
> bits [31:16] with sign-extended values if amadd.h sign-extends.
>
> [ ... ]
>
> > @@ -421,11 +462,32 @@ static int emit_atomic_rmw(const struct bpf_insn =
*insn, struct jit_ctx *ctx)
> >       /* src =3D atomic_xchg(dst + off, src); */
> >       case BPF_XCHG:
> > +             switch (BPF_SIZE(insn->code)) {
> > +             case BPF_B:
> > +                     if (cpu_has_lam_bh) {
> > +                             emit_insn(ctx, amswapb, src, t1, t3);
> > +                             emit_zext_32(ctx, src, true);
>
> Same question applies to the exchange path -- amswap.b and amswap.h
> return the old value and would need proper sub-word zero-extension
> rather than the 32-bit emit_zext_32().
>
> > +             case BPF_H:
> > +                     if (cpu_has_lam_bh) {
> > +                             emit_insn(ctx, amswaph, src, t1, t3);
> > +                             emit_zext_32(ctx, src, true);
>
> Same here for amswap.h.
>
>
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a =
bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/READM=
E.md
>
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/243253=
84786

