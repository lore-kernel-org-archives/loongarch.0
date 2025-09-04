Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEF81A239D
	for <loongarch@lists.linux.dev>; Thu,  4 Sep 2025 01:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756950968; cv=none; b=gRwW1xPtNwzSVhLZ3F33WxoubIHtmXayGdj6nY0l3iupWdKWqT9aaRxoZifE6dRbGyVJQ96iDDMzrp7wmk+qDpuGZB/Qcw7uM+P7MdDWpROgDHWWmqU0K04x7uT9W/WVNrD7G45lGL2LNiyjpCSLHfMUeDJDW4HFU0QGzB+wgOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756950968; c=relaxed/simple;
	bh=ljELCZ3EEuD72BQeb9rp/6Kd4VYAUpMiq0p9928L3jQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ozytyulpy2SR7mvn5DlqrsftV8vQWi6P3GTU0Lm1lcW/cikz3CXYmh0NWPRer7a2FRuyw0tk0uY0M3Jsgt8IIAEiQWjXHeV1k3jykRdpk/IW4e1hQWMkF1Y2+WTg5HSzcEjQROHIiELERjOZkj3wPLAXHA/iU1L9mVG1o8Y6w4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fIJWcjds; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fIJWcjds"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-314f332e064so220631fac.2
        for <loongarch@lists.linux.dev>; Wed, 03 Sep 2025 18:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756950966; x=1757555766; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vl5wa7S4775+BI6Ww5C2U24DXhwcJOmu5ZWRFqiYorA=;
        b=fIJWcjdsv3FfseuWF8e0PDUSRvi3ZK4yvN05QWiWpMEMnRXUa0TAd8tgAEgvvA4fHW
         Tb14IUeDbwXvogUHLAYNMSsFXLTTYDOtRx1ZSTlKIY7+9SqnF3/AiEnHHQN1eZx/9Xvn
         9TqT0FQJM/b9zioqGr2ZhkQwMIplGPq9Ivv7ZBdMHnSCfpI9dXaXn1o+9lt/obes7pO2
         5rkTCPgSMixk4r+1wZdANIZdx7qjVy/+WWCDSE6Wgio8aKilUQM1zPvhyGxCegHM7vAr
         985YIiT6YbxYNHtZXCMKTb6yTXL9YOMh+nlTJ5PeKA7QZwQyF3iRiVKD4Pg+n1iiZRJM
         sCdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756950966; x=1757555766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vl5wa7S4775+BI6Ww5C2U24DXhwcJOmu5ZWRFqiYorA=;
        b=mJMlXGqBQYgBx17iW1wRdVU3CSPwPYaMLBUM8PUCmIwU3n+Jne52btWPAtHIgKJWAi
         NOlR3wzGoaJvSJZw+CqyTIozTCbF8iW4rwtqSd0CMboNPcg2iJ46acrRD9ftWtYUmJu6
         j3C8MwGUp0lSBmMSr7JjhGgnTurGLwk2KID90BILkundZTpmkPHFcXTFaO7MXhH5iq06
         pmVBQzEkvi8GUMCSOlcbsGlDiNypFs4CPtS8jaEE+yZFMpxFcwZXJfyqQt6oxfG0btlE
         JGd8GY2XhNjbkuW2avstbhqKtW17gurcIWAwi7ORIxrvSXIEdYnvUoStmKOMiuZa6AOI
         WpwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAKo0kqIOuRDwY+LSrlmfbPVvjB5RMpKizUQUMlepF0dM0Kx5vqjWxVFgXNgY53ck4pGT3NbbonGE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwIRfsneeKI+RzPMRcGWB0CTYo40HflnP7/iKR6xWOVlnvDX4Xu
	LwtXOwBze1UEvLlAKAWCR1MGqwBeA82ro+J9RRmib9Fu4n9akmhgbju/Q0XGIg84E6eA1+peDcK
	ulHwWQfZRCLmOv8JC/TRIgpnl7MG9SZk=
X-Gm-Gg: ASbGnct7TdvNzw75wKdy1oBndH4dQCmeulPiH2Tk63aVnWOVxc5JMF5u+H2b77bnyZx
	Y7wwcfNlVv08bPw95bRJofby7t8SfRQFHMbiduHW+8SoacC7OKSQFNGjzZp4EpavSaPIEsHlh23
	Joxe7K6WpgWOHDBu2nhHRtDXPP9O/U12FQHmoAtVZSJ2oh+K4uHtJpTETC4QcDhu7YsUgIVlJqr
	fMZWQ8=
X-Google-Smtp-Source: AGHT+IGos+nk0g/lQcrsyfKTlcAtBLk/ikuaZedRHSZrcnPOcXKoiRVg/i57Aqv9IIkqYI5tUZMA676fxWb4NqcG+Gg=
X-Received: by 2002:a05:6871:4e49:b0:315:2fcc:327f with SMTP id
 586e51a60fabf-319633463acmr8274318fac.31.1756950965883; Wed, 03 Sep 2025
 18:56:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250903070113.42215-1-hengqi.chen@gmail.com> <20250903070113.42215-6-hengqi.chen@gmail.com>
 <CAAhV-H5PkWkhnBWEynxJki3rbN6rh_HW1hmVUY+ixY0Gx+ot+w@mail.gmail.com>
In-Reply-To: <CAAhV-H5PkWkhnBWEynxJki3rbN6rh_HW1hmVUY+ixY0Gx+ot+w@mail.gmail.com>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Thu, 4 Sep 2025 09:55:54 +0800
X-Gm-Features: Ac12FXwAJXTGUvQfoxWFnhx5LkhtAjav7g_EZqKjMBMtoowQERfPsuqTZbDGVZY
Message-ID: <CAEyhmHTsnLmQy2ShLKwnsrPforzVCA0rGFs0RPQYFOkXgErcmg@mail.gmail.com>
Subject: Re: [PATCH v4 5/8] LoongArch: BPF: Don't assume trampoline size is
 page aligned
To: Huacai Chen <chenhuacai@kernel.org>
Cc: yangtiezhu@loongson.cn, vincent.mc.li@gmail.com, hejinyang@loongson.cn, 
	loongarch@lists.linux.dev, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 10:56=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> Hi, Hengqi,
>
> On Wed, Sep 3, 2025 at 8:06=E2=80=AFPM Hengqi Chen <hengqi.chen@gmail.com=
> wrote:
> >
> > Currently, arch_alloc_bpf_trampoline() use bpf_prog_pack_alloc()
> > which will pack multiple trampolines into a huge page. So no need
> > to assume the trampoline size is page aligned.
> We do the alignment because larch_insn_text_copy() changes page attrs.
> If there is other data and BPF trampoline is in the same page,
> changing page attrs may cause errors.
>

Doesn't stop_machine() prevent this side effect?

> Huacai
>
> >
> > Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
> > ---
> >  arch/loongarch/net/bpf_jit.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.=
c
> > index 35b13d91a979..43628b5e1553 100644
> > --- a/arch/loongarch/net/bpf_jit.c
> > +++ b/arch/loongarch/net/bpf_jit.c
> > @@ -1747,8 +1747,7 @@ int arch_bpf_trampoline_size(const struct btf_fun=
c_model *m, u32 flags,
> >
> >         ret =3D __arch_prepare_bpf_trampoline(&ctx, &im, m, tlinks, fun=
c_addr, flags);
> >
> > -       /* Page align */
> > -       return ret < 0 ? ret : round_up(ret * LOONGARCH_INSN_SIZE, PAGE=
_SIZE);
> > +       return ret < 0 ? ret : ret * LOONGARCH_INSN_SIZE;
> >  }
> >
> >  struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
> > --
> > 2.43.5
> >
