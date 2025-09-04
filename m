Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629C919D081
	for <loongarch@lists.linux.dev>; Thu,  4 Sep 2025 01:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756950846; cv=none; b=jwbE+IF8jmSwHQtO+CfkOR22R7+OJhOJZNA51XmDzOYU0zsdvHZrJCemmcIrT1RVPN1QKu5+z3QaXnhkOQaUO6piWYYgbjQ92k5qDlr5Ja39UP8YrNew3IF1upZFOQhhGaE1XFN16DGbliefVJhm/D5G3Na8rFaq8uSr31xBrMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756950846; c=relaxed/simple;
	bh=Tj+11z4XCYJES/vD906UZbJqGNzTbui6Hf+3y2b205I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AXDAzuoRxbrNgvEXvO7Rm/J5hEO5OUS9HehDQieoV1q1jJCSAd7FmaO0dLT86t5Ozwmd+E1D1BicxQzQBGPoq/w7fsFJRjBBTSf0Hw0BBBRkB10mHjhgU80U2YdXAa97K6t16glIIaz/rQZ4g1xGu02qDZOdpe8L5IIkkzNXsJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LDzxVgYo; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LDzxVgYo"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-30ccea8a199so545055fac.2
        for <loongarch@lists.linux.dev>; Wed, 03 Sep 2025 18:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756950843; x=1757555643; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OIhwvpOs6iAfsYGD/+KTssMhMFixOoTwar6NTWwhAMI=;
        b=LDzxVgYotffKyLMGxp+7PHG7HlRVncVLNhSRxs1rtuQwJMk2uuuw0XIfRAurFkOahy
         tKEowIKpssBCF2wdFVhikn9OU0S/z7zb81X5Jw3Rrb3twBu8/amwzeHrxCswLwUoeNP6
         Mp2Pgsh/Iqsk/pVbsH1lhQYCsAcfRgokw6mfQCLgmuQBIfdg1hV8sD2pn5cSQIErSfIX
         8AYXh5KUKe8wkIwJWN9ZavNJs3e4f/mYOuF2acGvohRzOvI+lwg948dCksct6XfErPfr
         XKwKuSwZgoteqtvc4jokF7tcR84ao5GgTCfK7w62o48P/BUR4wBmoCZ5Ge4c7AfwVeUi
         tBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756950843; x=1757555643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OIhwvpOs6iAfsYGD/+KTssMhMFixOoTwar6NTWwhAMI=;
        b=OWNSOpKFG9wrQLripDKT9LxzFxVZdwb/XZHRWizbyGeSJOfzccJFLlLI6xVS7kmRha
         N3OYIneb8GV6eJEvvM9c7odq7iyyD26aeVO0mbMLHa5xGmBB2YJhOFyBF8iedQTBe9+D
         x5of5f1P7lgRnJGOGlT+8ZL7V6UX+BwQ6kVN/ie6MAN/tP9PoApjX1P3g9iT9UB/xRJ0
         aRsq8OVhJWWCXcaOV3mIUEtyzG69vqc4BrSKEWzZCXR6vNIe0TQX9Lzs0G3bPJSrsENq
         mMeWcpGAfkVr3EB3SLtDhHCxlKJXvjB9pdbbdXk0TE+ZjnAZnBi73OZ92CtKc6qf/JdH
         6GWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwiEy4+R0QUABjyBna3zl3uTwTOuNi/ARyHiaj5DIh/9O+RFMW5u+jvbT9hsFYo149SeWR//Oxb7o=@lists.linux.dev
X-Gm-Message-State: AOJu0YweH3YMevCOXX3BtZMJHZitt2HU9pxmlTU+0EWLEc4vlaQir8EI
	VQiZ5urr9Ehto0izYNBrrA1BLMdRv/DOCHGO7DiBX8Oik6Vl7QrnyIJ4KminIlCb1IUJ8B/PDes
	m3jv1wSB9zaTKZ5BJ/YKNetiGFLt8u6c=
X-Gm-Gg: ASbGncvoksMM/W5DDd8H8d1go4GhT3VoLYsxEH/ZOfwOpifQU7hEuFIZVzuIO3aWSNE
	0+1JwTN61E8sDWF/D2f2MTC/fP5AagDoBl1j0Setuij8VRgps1Wqel7Z36jWk57a0JsTF2+sND6
	CIrVyVDwpZj+cHf/lJeMPdqGGGhJmvdiXlb522MXpmgqpiXre7czG7AjmUtHvfFZdXp+KDwzL75
	XjaJU8=
X-Google-Smtp-Source: AGHT+IHQiI1nk38c3yMkgnN8We4qjWiln1DzH1T28R8vIJcMDb6jIJDCFkPNPGlzbOc1VkWs9+jyOEm9vnqB0pzVA+Q=
X-Received: by 2002:a05:6871:9e22:b0:319:cad9:c6e5 with SMTP id
 586e51a60fabf-319cad9d164mr3175893fac.25.1756950843558; Wed, 03 Sep 2025
 18:54:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250903070113.42215-1-hengqi.chen@gmail.com> <20250903070113.42215-5-hengqi.chen@gmail.com>
 <CAAhV-H4ZCM7uRB_oe__pJB_a1ei4+SPnVfT6c0JXvk4-HJg=bg@mail.gmail.com>
In-Reply-To: <CAAhV-H4ZCM7uRB_oe__pJB_a1ei4+SPnVfT6c0JXvk4-HJg=bg@mail.gmail.com>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Thu, 4 Sep 2025 09:53:52 +0800
X-Gm-Features: Ac12FXwZBwciCgn7fjX2RHc82mL3VfYF6oDWKN86u4UsOIQ1xj_0IXf9kYwJz84
Message-ID: <CAEyhmHTwEjsJp+roXOFLTEkDbVcKUU8PC=ba2JfvLZ29B2ZffA@mail.gmail.com>
Subject: Re: [PATCH v4 4/8] LoongArch: BPF: No text_poke() for kernel text
To: Huacai Chen <chenhuacai@kernel.org>
Cc: yangtiezhu@loongson.cn, vincent.mc.li@gmail.com, hejinyang@loongson.cn, 
	loongarch@lists.linux.dev, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 10:52=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> Hi, Hengqi,
>
> On Wed, Sep 3, 2025 at 8:06=E2=80=AFPM Hengqi Chen <hengqi.chen@gmail.com=
> wrote:
> >
> > The current implementation of bpf_arch_text_poke() requires 5 nops
> > at patch site which is not applicable for kernel/module functions.
> > With CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=3Dy, this can be done
> > by ftrace instead.
> Does this mean BPF trampoline can only work with FTRACE enabled?
>

IIUC, with CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=3Dn, we could still trac=
e
BPF progs with BPF trampoline.

> Huacai
>
> >
> > See the following commit for details:
> >   * commit b91e014f078e ("bpf: Make BPF trampoline use register_ftrace_=
direct() API")
> >   * commit 9cdc3b6a299c ("LoongArch: ftrace: Add direct call support")
> >
> > Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
> > ---
> >  arch/loongarch/net/bpf_jit.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.=
c
> > index 7b7e449b9ea9..35b13d91a979 100644
> > --- a/arch/loongarch/net/bpf_jit.c
> > +++ b/arch/loongarch/net/bpf_jit.c
> > @@ -1294,8 +1294,11 @@ int bpf_arch_text_poke(void *ip, enum bpf_text_p=
oke_type poke_type,
> >         u32 old_insns[LOONGARCH_LONG_JUMP_NINSNS] =3D {[0 ... 4] =3D IN=
SN_NOP};
> >         u32 new_insns[LOONGARCH_LONG_JUMP_NINSNS] =3D {[0 ... 4] =3D IN=
SN_NOP};
> >
> > -       if (!is_kernel_text((unsigned long)ip) &&
> > -               !is_bpf_text_address((unsigned long)ip))
> > +       if (!is_bpf_text_address((unsigned long)ip))
> > +               /* Only poking bpf text is supported. Since kernel func=
tion
> > +                * entry is set up by ftrace, we reply on ftrace to pok=
e kernel
> > +                * functions.
> > +                */
> >                 return -ENOTSUPP;
> >
> >         ret =3D emit_jump_or_nops(old_addr, ip, old_insns, is_call);
> > --
> > 2.43.5
> >
