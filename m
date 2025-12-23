Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F0521322F
	for <loongarch@lists.linux.dev>; Tue, 23 Dec 2025 02:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766456608; cv=none; b=IpFSW358Gdujc3bhULp4mgCf5BwQ8b1O4/nhYo9rby8AsVmpJPrgTp6+I95ctCPaM4NaUzLEzgxeep4bttNNuHsYqSeO9/DGDk+eFbUXOqsB5cd6bxv4rpYvzJW1kImi9J2Z/xe6pvtIdDDPBGW+DtIwOd804Ljg+I2Y1LE7/ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766456608; c=relaxed/simple;
	bh=pBzySd4Ox634GIKJpFixdpWuyO/RI9myMWRFhRp2X/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ERn0HeYnQcWT2pDYX207cZityNa42Qm4peGqr1h8dqIQzaytplgJC8nukItQL66JcQk+UswptlZPmvRp++REDSWSEfevyllW0Yjhgr3CMc0gcLYDI0HUthOAIc/QlIKNi6AcLLhjvRksBb84H7bLmJLWLBvYR/EmpeW9h4rIr1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T69PdBjj; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T69PdBjj"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7cae2330765so3475198a34.0
        for <loongarch@lists.linux.dev>; Mon, 22 Dec 2025 18:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766456603; x=1767061403; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iLeu/y61Z0yAvO3yDOpGOWyvHRNl3Gfwdr22wfFgq/s=;
        b=T69PdBjj6UwRRfkSjJ5KAvC5oIFd+eTtQHIALsiyA0dJ1bdFG977hVvgit17jaPOOF
         GXJ4ufKJQtTF81ETliJOONRVKDZnoIcab8zlmDLY4oW0SQ2/FuDpoRLRyBD6HplFpJqq
         cwcdYOoRhJHgVLOP652nldNXHZ9RUzsLPba+Innm+6d/d/aVGTA7g7EdX+ehx5HF3Pr7
         89E+2pFM/1PZBvAz+s+kcGKycqalqUCnBlocYQDLt1sbB0RQ+xdeL6HYHVCiMWeSTqqm
         58GM+9Rq5qQi2zX0j9+ZnEVzZwvRpXUluVcFAKmu/ym1rdW3uhnmzNig8Ia/9eKBofIq
         kAfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766456603; x=1767061403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iLeu/y61Z0yAvO3yDOpGOWyvHRNl3Gfwdr22wfFgq/s=;
        b=jtG42UVqmFKoCp38xDaXveqW8+GTUD8PR1Oo7svH/x5xD8MmKRAWfczMxfphetXguZ
         98W70pUVgP9S90G0WHnFiwYRPi0VGXqCoziZCcpf3rXPTBCX8sWTeh6lzykooDd/cyDr
         2pF+dMHaZga3GAp4nkuRPQ2pRsfTRjfXZU04kIIu3eF4mEAGzdnmf3v7r1Ct7dRKW4Ru
         jYw8rG2krr2j9T/V0zYF8v5nxHAedtQi0Sr4shvwRm9E7Y+JiYhsEzAPNt7InLH94cUp
         3QQrfs8rBESB1YdQ6G2KXuZxqsIEbzxtIszk7aWjK+GkPEt3LfnNv0KVK6PFZOTyYEBc
         k6pg==
X-Forwarded-Encrypted: i=1; AJvYcCW89lGxpqsNr/PPwFkzaKMv//2McoP0rG7/ByYoqdBavdN40dLz02s4yeAMaAasz8hdw2ScrY3wx94=@lists.linux.dev
X-Gm-Message-State: AOJu0YxiVgmmBDlPt/RnE656Hf8Zf8YxYM/I01JfzeLywRjzVZM+IYOX
	IdC7hAPTl8tVg++oXQS351KLhMUnXtByQG5MVd7bruOb6SqmXumvSm8eF6cQ+VNgxyW0GSNYQQg
	BptgGlJVA9ywPwLKYpp0WTKQE/aTP2Zg=
X-Gm-Gg: AY/fxX7M+o1JFESsm/1X/BQmJAFZKBNBi2ziVOec5ilYBEIKhW94tuna5T/BkQFNKux
	NTHmxAQuMz1fBCZow8MTGNJEwUm5CRpOxxzMwCtQqcQfb8zGqY1RpVZmjlc/ag6ePIK1FtJ/3VV
	1zKSaKmuRFtHV8rzLaI9WJ41UDYPocSrWyfW3bHRPXJHt3MRfdQJsg4UM0JCE1cGeKb9S/LGC2Q
	zymD0CEUwWpBig6CjQ1GNZbDddFcqCmGEovsImxWUht14d3qYCx85dA+V5xIBmbnbEK0gA=
X-Google-Smtp-Source: AGHT+IFYQ6TY1JvCD6/8ugUJPzSmdfqJx5SrIx00DO6YDE/XWcIW+afoGh0b2CfnLL+rZrcCv5sxoixO7SufMxtT7Zg=
X-Received: by 2002:a4a:a60a:0:b0:659:9a49:8ef3 with SMTP id
 006d021491bc7-65d0e3dbf8fmr4021479eaf.39.1766456603527; Mon, 22 Dec 2025
 18:23:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251217061435.802204-1-duanchenghao@kylinos.cn>
 <20251217061435.802204-7-duanchenghao@kylinos.cn> <CAEyhmHRbacxpfTkPJq4MerBupH0bJkFfx8xGUvHMvGOzDDJUow@mail.gmail.com>
 <20251222015010.GA119291@chenghao-pc>
In-Reply-To: <20251222015010.GA119291@chenghao-pc>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Tue, 23 Dec 2025 10:23:12 +0800
X-Gm-Features: AQt7F2r1vCQijeU9b5DREgugKrd94kf6gaE7wPwDz-Jur_-FY6Ndtz9WhSQy1Mc
Message-ID: <CAEyhmHRkW67wiz_JX0i+sf2Y5LoYnpmTSt_Dh+asU8EEVTdk=w@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] LoongArch: BPF: Enhance the bpf_arch_text_poke() function
To: Chenghao Duan <duanchenghao@kylinos.cn>
Cc: yangtiezhu@loongson.cn, rostedt@goodmis.org, mhiramat@kernel.org, 
	mark.rutland@arm.com, chenhuacai@kernel.org, kernel@xen0n.name, 
	zhangtianyang@loongson.cn, masahiroy@kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, bpf@vger.kernel.org, youling.tang@linux.dev, 
	jianghaoran@kylinos.cn, vincent.mc.li@gmail.com, 
	linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 22, 2025 at 9:50=E2=80=AFAM Chenghao Duan <duanchenghao@kylinos=
.cn> wrote:
>
> On Sat, Dec 20, 2025 at 10:07:25PM +0800, Hengqi Chen wrote:
> > On Wed, Dec 17, 2025 at 2:15=E2=80=AFPM Chenghao Duan <duanchenghao@kyl=
inos.cn> wrote:
> > >
> > > Enhance the bpf_arch_text_poke() function to enable accurate location
> > > of BPF program entry points.
> > >
> > > When modifying the entry point of a BPF program, skip the move t0, ra
> > > instruction to ensure the correct logic and copy of the jump address.
> > >
> > > Signed-off-by: Chenghao Duan <duanchenghao@kylinos.cn>
> > > ---
> > >  arch/loongarch/net/bpf_jit.c | 15 ++++++++++++++-
> > >  1 file changed, 14 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_ji=
t.c
> > > index 3dbabacc8856..0c16a1b18e8f 100644
> > > --- a/arch/loongarch/net/bpf_jit.c
> > > +++ b/arch/loongarch/net/bpf_jit.c
> > > @@ -1290,6 +1290,10 @@ int bpf_arch_text_poke(void *ip, enum bpf_text=
_poke_type old_t,
> > >                        void *new_addr)
> >
> > The signature of bpf_arch_text_poke() was changed in v6.19 ([1]), pleas=
e rebase.
> >
> >   [1]: https://github.com/torvalds/linux/commit/ae4a3160d19cd16b874737e=
bc1798c7bc2fe3c9e
>
> Thank you for your review and for pointing out the API change in v6.19.
>
> I believe my patch series already accounts for this. It was developed on
> top of commit ae4a3160d19c ("bpf: specify the old and new poke_type for b=
pf_arch_text_poke"),
> so all modifications to bpf_arch_text_poke() call sites within my
> patches should already be using the updated signature.

Fine, it seems like the LoongArch tree is not up-to-date.

>
> Please let me know if you find any inconsistencies or if further
> adjustments are needed.
>
> Best regards,
> Chenghao
>
> >
> > >  {
> > >         int ret;
> > > +       unsigned long size =3D 0;
> > > +       unsigned long offset =3D 0;
> > > +       char namebuf[KSYM_NAME_LEN];
> > > +       void *image =3D NULL;
> > >         bool is_call;
> > >         u32 old_insns[LOONGARCH_LONG_JUMP_NINSNS] =3D {[0 ... 4] =3D =
INSN_NOP};
> > >         u32 new_insns[LOONGARCH_LONG_JUMP_NINSNS] =3D {[0 ... 4] =3D =
INSN_NOP};
> > > @@ -1297,9 +1301,18 @@ int bpf_arch_text_poke(void *ip, enum bpf_text=
_poke_type old_t,
> > >         /* Only poking bpf text is supported. Since kernel function e=
ntry
> > >          * is set up by ftrace, we rely on ftrace to poke kernel func=
tions.
> > >          */
> > > -       if (!is_bpf_text_address((unsigned long)ip))
> > > +       if (!__bpf_address_lookup((unsigned long)ip, &size, &offset, =
namebuf))
> > >                 return -ENOTSUPP;
> > >
> > > +       image =3D ip - offset;
> > > +       /* zero offset means we're poking bpf prog entry */
> > > +       if (offset =3D=3D 0)
> > > +               /* skip to the nop instruction in bpf prog entry:
> > > +                * move t0, ra
> > > +                * nop
> > > +                */
> > > +               ip =3D image + LOONGARCH_INSN_SIZE;
> > > +
> > >         is_call =3D old_t =3D=3D BPF_MOD_CALL;
> > >         ret =3D emit_jump_or_nops(old_addr, ip, old_insns, is_call);
> > >         if (ret)
> > > --
> > > 2.25.1
> > >
