Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918DC1F1317
	for <loongarch@lists.linux.dev>; Thu,  4 Sep 2025 02:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756952148; cv=none; b=rgeHq7LJrwvpt2kU0NZoAuv0FPobnI6ATgt3Icqe/blZc5caQzFKvZ0Q8E7Iu1oWh0+gEPBzCsIhiRhfYwihAG6dXcJ3CrD+wXSsfeuE9U0LtQxsQl+fMlek7zQC4UuPJVxx76XVweXgnjkriQD83bErOyZ8TcoMDOD1kBXYCBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756952148; c=relaxed/simple;
	bh=adQUEIpHGSU8ngz9n7GPUbhR3RymfVVmRewCTLbKn58=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mlfv6k7T9XH2hE8hQRBUlgEsWpIPZNOSjekldETY040WcnSOB6uqH6aO1gP2zyDOeekVlbOVafS0K+v9OPlxe0JLEssehtQs7XYv0ZRgjxKNzU+Wa5hvQ0sJrW0j0mETOcYpzU7Sb2ZYcGwfWKEAgpBdxRmOiCgFdLMv/lUVZu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X3T1EvPm; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X3T1EvPm"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-3197f12d771so418698fac.1
        for <loongarch@lists.linux.dev>; Wed, 03 Sep 2025 19:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756952145; x=1757556945; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jba2kiGemSH/yx3egBxRv8Ene54qx45+squLUKxWkFs=;
        b=X3T1EvPmUrTLM/UUztJlzqgGyI3Dqug/jnuMHYjwPF/BA/qvHSktG7g+kTUD6PRwG5
         9EyxcyuCo6g7fTUM9pHwnfdD/F8ksrXJTTx9JgJ884oW4/kdnTX1S2cfI635vutOSJaq
         KlxsBPWuB0Y6JM/QekWv+Zigo0dlMNMWxZot8h0NxEL4mLSHyzOB0vMhyugCQ7BP2YpN
         AbZc2CyuQyvpPetnYhhgAWAvxgKWGS7R262NkqkMnq4SnDTQ/norxvLEFObGudkaZK8e
         MlWKcLZg2dojRg833O1jb+FO0MuKi1js1FYrYobe5PTawjIKd+CXAxAGK4IwKJyySogu
         2A9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756952145; x=1757556945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jba2kiGemSH/yx3egBxRv8Ene54qx45+squLUKxWkFs=;
        b=VJnRkcqMaDGgThTotd1avOVyssZX/2Z0IK5VNT/8ZqCnselAK4vS3cvJ03ir2iup0w
         pBviM3v7Y1g7r66qd+BGE/8F7/Q10ZkjGmm+aP6hunO/ktmK2UzLt4JBZgX7BpBrnlGr
         s0ClN47+aTuxlKh2VtNoKb0n/lOFb2Un+C+gyTXxcdCYBTtRBhX8hh93ivDmB9F0E82i
         QVrqwt+sA7uM6ioNUqT1GbLTmRka6M9DCcw5f4hwbBxrFdPhCmPajv5RkPNNmrSBUEOg
         w43+/kYyqoZU3vJo4Uq00L51AREhueiVepgEQc6rsLfoeVUWbjVUpbsqqsZcVL/+vu8L
         AeoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUl1BTNEWBNFM0KvxaoLkJcqc3H+KSZueZgAl1INe6ow+sNTMRiEZ6fVFfAYqVZitSbRlf/Gs9fz8w=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0E0NLGN1nZiOOSjVWJNeVL0h86hoQUDdxu+nsuslPw8TqnU6Q
	auTjbOYG2VO604PkVdGTMqJ3Ggjo4WPP8WRA9UojQBOr91iO3432A2+cIe/rL7BL4KUCiTxrz49
	MkScOmzteDJeZb0XhC9uA+D4SvDYzQK0=
X-Gm-Gg: ASbGncvWGBgZHMS7UrGmp1/lHfubt3mQbxnmkBTnR9mPUaXrXR6aVBUFBaHCBxUqYkf
	8BjIS8V5Ie3xcbe3UEd8bdiyzjDZ4/F/4SkV/CFykH/M6cKA2UumpgJBrEkR1O+Buz3knBRfIbQ
	U4KMrr+sRgKw+9SmGaahhFvMyVcdiwA4QG+d2+mrAh09OAILm+FTr77q6TLyeOULaO61LqYKK2G
	ue8kxE=
X-Google-Smtp-Source: AGHT+IFiOjuDDHJ/V9VaY2k+xNHtfPpSfreBuZc9LVq7c/tom529gENp+aHxqiF3Rh/DrKqvwguHzGSnyovRvsEsx78=
X-Received: by 2002:a05:6870:1494:b0:315:bc87:82ff with SMTP id
 586e51a60fabf-319630fb159mr7548855fac.13.1756952145527; Wed, 03 Sep 2025
 19:15:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250831234328.22440-1-hengqi.chen@gmail.com> <20250831234328.22440-3-hengqi.chen@gmail.com>
 <ee579b48-e6d1-22ba-c1b9-f6088c269664@loongson.cn> <CAAhV-H5nG4RaOY+n327+4kdhhOLyNOOaoNcRiuRKSUcO7=nAvg@mail.gmail.com>
 <CAEyhmHTDr8sejaaBUbyAK1Op2HKEzSjp8Rkg9TaU207r-QfQnQ@mail.gmail.com> <CAAhV-H7Eb4VTbe5ZCEB0S7tObs4xdbN8jJLa0PurjYd3bjguiA@mail.gmail.com>
In-Reply-To: <CAAhV-H7Eb4VTbe5ZCEB0S7tObs4xdbN8jJLa0PurjYd3bjguiA@mail.gmail.com>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Thu, 4 Sep 2025 10:15:34 +0800
X-Gm-Features: Ac12FXzJuwH2ryJ26EJL-oZxIagarI7QaeasT7-gLOKrsakVslQ5vN-7D9omcWQ
Message-ID: <CAEyhmHTCtjU31hwZ9OhAj1E5eFv9+efPppdD1LTFYy1XgmxU6Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] LoongArch: BPF: Sign extend struct ops return
 values properly
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, vincent.mc.li@gmail.com, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 4, 2025 at 10:04=E2=80=AFAM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> On Thu, Sep 4, 2025 at 9:57=E2=80=AFAM Hengqi Chen <hengqi.chen@gmail.com=
> wrote:
> >
> > On Mon, Sep 1, 2025 at 12:11=E2=80=AFPM Huacai Chen <chenhuacai@kernel.=
org> wrote:
> > >
> > > On Mon, Sep 1, 2025 at 11:08=E2=80=AFAM Tiezhu Yang <yangtiezhu@loong=
son.cn> wrote:
> > > >
> > > > On 2025/9/1 =E4=B8=8A=E5=8D=887:43, Hengqi Chen wrote:
> > > > > The ns_bpf_qdisc selftest triggers a kernel panic:
> > > >
> > > > ...
> > > >
> > > > > So let's sign extend struct ops return values according to
> > > > > the return value spec in function model.
> > > >
> > > > ...
> > > >
> > > > >   static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, s=
truct bpf_tramp_image *im,
> > > > >                                        const struct btf_func_mode=
l *m, struct bpf_tramp_links *tlinks,
> > > > >                                        void *func_addr, u32 flags=
)
> > > > > @@ -1654,6 +1677,8 @@ static int __arch_prepare_bpf_trampoline(st=
ruct jit_ctx *ctx, struct bpf_tramp_i
> > > > >       if (save_ret) {
> > > > >               emit_insn(ctx, ldd, LOONGARCH_GPR_A0, LOONGARCH_GPR=
_FP, -retval_off);
> > > >
> > > > If is_struct_ops is true, this operation is not necessary, because
> > > > LOONGARCH_GPR_A0 will be overwrote in the later code ...
> > > > >               emit_insn(ctx, ldd, regmap[BPF_REG_0], LOONGARCH_GP=
R_FP, -(retval_off - 8));
> > > > > +             if (is_struct_ops)
> > > > > +                     sign_extend(ctx, LOONGARCH_GPR_A0, regmap[B=
PF_REG_0], m->ret_size);
> > > >
> > > > ... in here, so it is better to write the code like this:
> > > >
> > > > if (is_struct_ops) {
> > > > ...
> > > > } else {
> > > > ...
> > > > }
> > > >
> > > > Maybe Huacai can adjust the code when applying.
> > > No hurry, I will wait your series (and there is another patch from
> > > Jiang Haoran, too), then apply together.
> > >
> >
> > Do you mean https://lore.kernel.org/loongarch/20250815082931.875216-1-j=
ianghaoran@kylinos.cn/
> > ?
> Yes, is it replaced by your or  Tiezhu's patch?
>

The code is not sane (It tries to guess return values of random bpf
progs), so the patch should not go in.

> Huacai
>
> >
> > > Huacai
> > >
> > > >
> > > > Thanks,
> > > > Tiezhu
> > > >
