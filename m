Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F551ACEDA
	for <loongarch@lists.linux.dev>; Sun, 12 Oct 2025 03:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760240069; cv=none; b=jBfc5ihGUJ8IALXa4h6VFmM3lZ0tfMZAQjgOJzY6My0Oym2iPHvm7egySIVUdUu34erptxKJCbs0mADkL0IvFkm8V+6flAJa/pwZM3isbaYC3ln9is4+S3TLZAQXcYhkN9P5w3nvfxpxWCpYneN/5GEEBc/XJZKN241rwS3nahk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760240069; c=relaxed/simple;
	bh=5eVN5BDwP1MbZI+tBe7x2FM0cPTcm1yN963eHxducrk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cgC2T82HHHSz2DaSLydpJfLkhLIQRF21835/8V2pbXHBty1dFmD98+HBxSHcINosiJxJIPFhHvywEm4LLJcVmVbkAfJ/r/qNorBsSVwCAmk9BEonpmQdU/PyN5sV2eo58QjzhDIKE9QQVwraCxgJyz29HkuQiBTGGDnTZtVcI/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GcO9MfBk; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GcO9MfBk"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7a4a993dea6so1105328a34.1
        for <loongarch@lists.linux.dev>; Sat, 11 Oct 2025 20:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760240067; x=1760844867; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E/g79Ugc5NGg828MfRu+U8pP/SS8/Yyv8+5+D5GK6L8=;
        b=GcO9MfBkfEq7KU83CWD1VEW5kwLY4/hk78uqWQkV0Ym1mSjzCNUIz13QlZPFzilgh4
         fOp5IQYxp0qL2YZHavqkdHVIA/bG5skTX8+EkK9F/38aOiycy1uFdO6zLV4JHCTgE/05
         uzkTaY1+F+0WRsn6DqjRoCJuY+1+z01wPnth1Isp3SvQLVJYKfRlpbaB/fgbpMBkym1M
         mvYZR3jnN+B24huFkJ2hNyluNCtkNuCa+E7nLFq+Kf2UndPZIZskr3OGV6ElvSOdwUgI
         kmaPeYmAW+CxkHGXiqtdfCdWy0tDvuAK/aumjxk2gY7EI0Js6IZgeWsq2D72/OX3MceL
         znjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760240067; x=1760844867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E/g79Ugc5NGg828MfRu+U8pP/SS8/Yyv8+5+D5GK6L8=;
        b=gOBKftS8H++q8KbIXu+oFxNHSztr4vY0nzWOYfkzKLdQa5n/7qvwmHGG+icGvJsURe
         ewCDB5fI3e4YSJ7eAy0d+yJqJ1QGwSDkQXuD0sOwKFu3702htpBE1xX6O1ShlrdcrW1N
         n5QqwvW9KqZetj0d4srEYGCpOv1vQd8yJHfU+0ojJ8+cbsn7twoYfC4e/rCsBXZzb4hD
         qRtEey+kJSMXp4uTs+a8N54VEJe1N2f86OUHfh2NsWaTd46JAbQ4+bVql1av95UNUt8l
         toBtZ0sw6nNdGo+y1/Fap+CP6ZJ9emflny9Efoue19ZaVaUGubXJ0Ns4/Fh2WxeNnC7o
         9qfw==
X-Forwarded-Encrypted: i=1; AJvYcCW2/HtxL+TPeq5r+ZcMsCuAsGx2m0XDaovS5zOCz0dq+6hKZ9Bd802OoBkflaewiHn/lgC/Taj07Ac=@lists.linux.dev
X-Gm-Message-State: AOJu0YyZMKPjTmsKG3vH6NINQXypUBamMspssLwtqETRllqWb9C0qtD0
	kP2rgF/ro9bLMaVN8QH6vg35WCsEIobwBEjI36Cp0yoTDli7kmnsHjhG5anen+in+AmPCDKGgYY
	jDYjyAKgLgciTh3KW+0FV9qtNGlZV5fc=
X-Gm-Gg: ASbGncuC8dd5ZXuezaLBXMoc5/juyPmQIk5SZoc+NHq2eM33yCKnCpo81tfXEVsB22i
	BP1cA96kBNPlk80QRsbzgbMYqbuDNyzt3PgKO4PZrqSlYt95Nw8tOeT01tJpVLumtwbTUDu63Wp
	ut/SE0y3btSN68fyyN8bPYVi1GqGAYYGvOKi3iJz6owFI1bJaSKOsRMFzFFPnL+tUZYsUf7Oggp
	TJAnpKjHZzhPFHtHJ+zUl8Qog==
X-Google-Smtp-Source: AGHT+IHs32sY3Q82KfBU4AhqKgdnps+6J1JXcdpPhtFXl8+jJOvzm48mumg4+TzCgU/Iuo5DbSdS9Wbcw68pQX+3f5E=
X-Received: by 2002:a05:6871:5809:b0:341:88c3:cab6 with SMTP id
 586e51a60fabf-3c0f81e9c32mr7081521fac.26.1760240066963; Sat, 11 Oct 2025
 20:34:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251006053323.193581-1-hengqi.chen@gmail.com>
 <20251006053323.193581-4-hengqi.chen@gmail.com> <5dceffaa-1a86-b4f7-c7c0-07e08d43dcd7@loongson.cn>
In-Reply-To: <5dceffaa-1a86-b4f7-c7c0-07e08d43dcd7@loongson.cn>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Sun, 12 Oct 2025 11:34:16 +0800
X-Gm-Features: AS18NWDWwG7GkbbegzkiqaPtk5RIIVjuTwp9ySjwcKMyWLlOxth_IoBJEY60fbM
Message-ID: <CAEyhmHR6XEh3C8WpAKny9xJyN8Q4kw=ey=-eJxpFsaVHARx_rQ@mail.gmail.com>
Subject: Re: [PATCH 3/7] LoongArch: BPF: Sign extend kfunc call arguments
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: chenhuacai@kernel.org, vincent.mc.li@gmail.com, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 9, 2025 at 10:09=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> On 2025/10/6 =E4=B8=8B=E5=8D=881:33, Hengqi Chen wrote:
> > The kfunc calls are native calls so they should follow
> > LoongArch calling conventions. Sign extend its arguments
> > properly to avoid kernel panic.
> >
> > Fixes: 5dc615520c4d ("LoongArch: Add BPF JIT support")
> > Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
> > ---
> >   arch/loongarch/net/bpf_jit.c | 16 ++++++++++++++++
> >   1 file changed, 16 insertions(+)
> >
> > diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.=
c
> > index 579957b4d40a..83e623ce2908 100644
> > --- a/arch/loongarch/net/bpf_jit.c
> > +++ b/arch/loongarch/net/bpf_jit.c
> > @@ -983,6 +983,22 @@ static int build_insn(const struct bpf_insn *insn,=
 struct jit_ctx *ctx, bool ext
> >                       emit_insn(ctx, ldd, REG_TCC, LOONGARCH_GPR_SP, tc=
c_ptr_off);
> >               }
> >
> > +             if (insn->src_reg =3D=3D BPF_PSEUDO_KFUNC_CALL) {
> > +                     const struct btf_func_model *fm;
> > +                     int idx;
> > +
> > +                     fm =3D bpf_jit_find_kfunc_model(ctx->prog, insn);
> > +                     if (!fm)
> > +                             return -EINVAL;
> > +
> > +                     for (idx =3D 0; idx < fm->nr_args; idx++) {
> > +                             u8 reg =3D regmap[BPF_REG_1 + idx];
> > +
> > +                             sign_extend(ctx, reg, reg, fm->arg_size[i=
dx],
> > +                                         fm->arg_flags[idx] & BTF_FMOD=
EL_SIGNED_ARG);
> > +                     }
> > +             }
> > +
> >               move_addr(ctx, t1, func_addr);
> >               emit_insn(ctx, jirl, LOONGARCH_GPR_RA, t1, 0);
>
> Without this patch, there are some failed test cases?
> With this patch, the failed test cases can pass?
>
> If so, please add the related test cases in the commit
> message, then we can test this single patch with the
> corresponding test cases and the git log can show what
> problem this patch solves clearly.
>
> Please add the related test cases in the commit message
> for the patch #4 - #7 too.
>

Will detail the test instructions in cover letter, it's complex in
some way.

> Thanks,
> Tiezhu
>
