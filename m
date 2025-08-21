Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C6B1FF61E
	for <loongarch@lists.linux.dev>; Thu, 21 Aug 2025 01:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755739298; cv=none; b=UISvJ4//gF+o+pv+7ot4LMLmsG+4id08zfO5WYNydGQlHVkzvHifYilo1l6vLczO7SOxTTHOdoPzgER9HTraLEmtC9H8g4KXtitsET4Bk4ArId7YNMty1WB53tPAzBju0ifuWsS51DAD8Mvc1KfG9NqumRSa6Mwi4QHTrasOq9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755739298; c=relaxed/simple;
	bh=8kNKgRZzXVRCrGmGZF4xSCWdkTEchJVyRhBl18+3IUU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nSUM/wn9Mzxq2vREyUtIDqQMMwK20J4y6puq1O1BKZoe5rHRK31Zux2RvQa+1DTGolt5hFpwDstEMhNlr4oX2Xa71rNjHop4ne1v1HmiQK6CCW508DXEKYnt5qn4u2YOY6K3MPOAaWiwzISEk7KYi1m8VWHZtd2gJtFaXY3dH5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IeL1LyZo; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IeL1LyZo"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-435de8160dbso176399b6e.3
        for <loongarch@lists.linux.dev>; Wed, 20 Aug 2025 18:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755739296; x=1756344096; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QbSzbdY3kHTaOmK1pPvMC+SmbvGcvig5ysbbwipvqs8=;
        b=IeL1LyZok5BIkcZIAc0sU52kh/amdq11Yc2kj9GN8jbvbzSSEVhRmblkbJ+fELLar+
         KxS1Oj2W0fSpe8/pZ6T0dC61iNvuAwbNDpuIhS+wrSkruhV3UgkxPTOi4F5iWQqlD0DO
         l5KH83zsej6gJUhe5A3IGJoQAPNcxHP02Vur3GvSwg1O9nwBWN1i/RBG4/jK/fhe1zSf
         u6VbUH9W++4N1vHf+DRK0eSQzSMjnpobWhufumnppDsTY8Oe4O3i35SG1Kd/CGwc1VXW
         w3gCqbh5TukqozN+dFBY9LhGERxoqrQ85BPQXTAia9O32mcpdF5ZosGTdDyi+ju9AlIt
         FcWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755739296; x=1756344096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QbSzbdY3kHTaOmK1pPvMC+SmbvGcvig5ysbbwipvqs8=;
        b=i0pBY1Xt3PxSDzHg5ba7GqcE6VHnYNXqdXs5PVQNIoYz9tIh1GRsD5d8AH9xdrvH+U
         ioDAArY5xdomb1PcGZZd3uh2NM080SZv8ACpZP0WbW1Kefl3rQnpSKxVVM04CG2ipWEl
         H4X2aqlu1Fd8DUHdgJpVuNDvCjiCR3Z8bZD7XP2d2vSAXvb8WVPD5Z0VYY53gJst3E1R
         3eyGkCanbBuUC/Se07t1Z2QAW/osVclyZ9ihRU/eb2Si10LKHO1NKdcYrUGyhrWnpeDx
         PKnhE+wGFOomSBG7wX5QQUGAZ2MdDZ3wdR5juKbSnHZH3OK1aGF5Ut87ryL/R/rKNqXq
         ikOg==
X-Forwarded-Encrypted: i=1; AJvYcCWqaGLyRTeEBLHIvt1bMZ3VaTsNMiYLnBUwMWaOCts+e3B7mxVOqDWx2oxbhssPhbjacd6w5hVMPY0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyetlf7AVea5juPrDvel4XKDu57iGkflAn5o2pw20zFh+sa7wiC
	ewcSeT3v3m3sooDorHXHfxDZJXB58r33mAEBUn5Vw7iiLtJnkJEWkgYlDZlabdyndB8ZM52AQQE
	+77cmLYLFzf1zxAW7j5dHRrX4jbE1B3o=
X-Gm-Gg: ASbGncs1wKmpkOyidAYJjSNc8Ver5j3u4Fl8BTY854EYobAGshq9ch0C+aYWd5mtjoJ
	/7FX5qscJsxdrjlZXGT76KuRP+Hzm0c5eKS90VHSxlpSWnzKsMLXePOR6pXGfTiXc+FfHVRYWH/
	2pyCZEoDYTQZ+GfCfZmoKErFg2NENaL2xlg4Ts30PawvgWG/40hFWtA1sp1eWy93jIBsINmTOlj
	5S4FQ==
X-Google-Smtp-Source: AGHT+IGPdk1Um7OyVh9GcThP/ox/UyRFOB3NcTp3LXTomORTnPG0fbhENbKRoMtDPq0FDVVcR3h54vgTDOafGAGRFvw=
X-Received: by 2002:a05:6808:179d:b0:437:761b:dd0 with SMTP id
 5614622812f47-4377d802f3fmr196751b6e.47.1755739295741; Wed, 20 Aug 2025
 18:21:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250820103956.394955-1-hengqi.chen@gmail.com> <0cf37a7c-2e14-58f2-1a1e-9311b2e65d4a@loongson.cn>
In-Reply-To: <0cf37a7c-2e14-58f2-1a1e-9311b2e65d4a@loongson.cn>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Thu, 21 Aug 2025 09:21:24 +0800
X-Gm-Features: Ac12FXxSSqb94RTO7WN1zCcydpJt3k4giY5F3rzM_IA743satsIiNLNsW-aWXVc
Message-ID: <CAEyhmHTZC66cKazOf=fJ6WxSU1R=rpcd86uPwqOvpEBZ=97ULQ@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: BPF: Sign extend struct ops return values properly
To: Jinyang He <hejinyang@loongson.cn>
Cc: chenhuacai@kernel.org, yangtiezhu@loongson.cn, jianghaoran@kylinos.cn, 
	ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	vincent.mc.li@gmail.com, bpf@vger.kernel.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 8:49=E2=80=AFAM Jinyang He <hejinyang@loongson.cn> =
wrote:
>
> On 2025-08-20 18:39, Hengqi Chen wrote:
>
> > The ns_bpf_qdisc selftest triggers a kernel panic:
> >
> [...]
> >
> > +/*
> > + * Sign-extend the register if necessary
> > + */
> > +static int sign_extend(struct jit_ctx *ctx, int r, u8 size)
> > +{
> > +     switch (size) {
> > +     case 1:
> > +             emit_insn(ctx, sllid, r, r, 56);
> > +             emit_insn(ctx, sraid, r, r, 56);
> > +             return 0;
> > +     case 2:
> > +             emit_insn(ctx, sllid, r, r, 48);
> > +             emit_insn(ctx, sraid, r, r, 48);
> > +             return 0;
> Hi, Hengqi,
>
> For sign-extend char or short, we can use `ext.w.b` or `ext.w.h`.
>

Great. Will do.

>
> > +     case 4:
> > +             emit_insn(ctx, addiw, r, r, 0);
> > +             return 0;
> > +     case 8:
> > +             return 0;
> > +     default:
> > +             return -1;
> > +     }
> > +}
> > +
> >   static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, struct =
bpf_tramp_image *im,
> >                                        const struct btf_func_model *m, =
struct bpf_tramp_links *tlinks,
> >                                        void *func_addr, u32 flags)
> > @@ -1602,8 +1628,8 @@ static int __arch_prepare_bpf_trampoline(struct j=
it_ctx *ctx, struct bpf_tramp_i
> >       }
> >
> >       for (i =3D 0; i < fentry->nr_links; i++) {
> > -             ret =3D invoke_bpf_prog(ctx, fentry->links[i], args_off, =
retval_off,
> > -                                   run_ctx_off, flags & BPF_TRAMP_F_RE=
T_FENTRY_RET);
> > +             ret =3D invoke_bpf_prog(ctx, fentry->links[i], m, args_of=
f, retval_off,
> > +                           run_ctx_off, flags & BPF_TRAMP_F_RET_FENTRY=
_RET);
> >               if (ret)
> >                       return ret;
> >       }
> > @@ -1612,7 +1638,7 @@ static int __arch_prepare_bpf_trampoline(struct j=
it_ctx *ctx, struct bpf_tramp_i
> >               if (!branches)
> >                       return -ENOMEM;
> >
> > -             invoke_bpf_mod_ret(ctx, fmod_ret, args_off, retval_off, r=
un_ctx_off, branches);
> > +             invoke_bpf_mod_ret(ctx, fmod_ret, m, args_off, retval_off=
, run_ctx_off, branches);
> >       }
> >
> >       if (flags & BPF_TRAMP_F_CALL_ORIG) {
> > @@ -1638,7 +1664,8 @@ static int __arch_prepare_bpf_trampoline(struct j=
it_ctx *ctx, struct bpf_tramp_i
> >       }
> >
> >       for (i =3D 0; i < fexit->nr_links; i++) {
> > -             ret =3D invoke_bpf_prog(ctx, fexit->links[i], args_off, r=
etval_off, run_ctx_off, false);
> > +             ret =3D invoke_bpf_prog(ctx, fexit->links[i], m, args_off=
,
> > +                                   retval_off, run_ctx_off, false);
> >               if (ret)
> >                       goto out;
> >       }
> > @@ -1657,6 +1684,12 @@ static int __arch_prepare_bpf_trampoline(struct =
jit_ctx *ctx, struct bpf_tramp_i
> >       if (save_ret) {
> >               emit_insn(ctx, ldd, LOONGARCH_GPR_A0, LOONGARCH_GPR_FP, -=
retval_off);
> >               emit_insn(ctx, ldd, regmap[BPF_REG_0], LOONGARCH_GPR_FP, =
-(retval_off - 8));
> > +             if (is_struct_ops) {
> > +                     move_reg(ctx, LOONGARCH_GPR_A0, regmap[BPF_REG_0]=
);
> > +                     ret =3D sign_extend(ctx, LOONGARCH_GPR_A0, m->ret=
_size);
> > +                     if (ret)
> > +                             goto out;
> > +             }
> >       }
> >
> >       emit_insn(ctx, ldd, LOONGARCH_GPR_S1, LOONGARCH_GPR_FP, -sreg_off=
);
>
