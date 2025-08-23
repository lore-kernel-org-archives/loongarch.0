Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74572188715
	for <loongarch@lists.linux.dev>; Sat, 23 Aug 2025 04:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755922239; cv=none; b=NGWX9PO2gA1sEjYQp11U4hNhetJkiexjSAYaz95/LuxSnC0f41bo1/DYBhRGlyWGG09yJwInhSnfTC7mvDVo4H9Vwgwv8RGgabUc1emswmHsSc3IhHsnJDiaHIz+7s9611jSmk/6g+FmTLLfe8T7tR1WxYGpR2J3MDKzGqH02X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755922239; c=relaxed/simple;
	bh=CQTeMpjBQEB7jad+Hl73ZOU8QhKJMH6ebsMrPqIGjug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kpvyd8ReXYNWvtAudEeh0FvyOPm6af3vVB5YoTMTs5s4H8/JSwvpbSLJ8y4+Qsb+a/4YZnxNats6Ia+oqp80siYKMU57+joh5/LfkSbXMSLN/DiGZ20n6AQDY7IGzh/VtTm3U0TGkeQl+7dGwWUbgwpkYkK0Sljv7fcY4Oo7wR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WEaLyxOH; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WEaLyxOH"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-afcb7a3ee3cso402489566b.2
        for <loongarch@lists.linux.dev>; Fri, 22 Aug 2025 21:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755922236; x=1756527036; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ypumJxO03YajLjZKwy8Tkl56v3hjokXusjP9nMqhO7w=;
        b=WEaLyxOHO9MaxTNckC0bBTwj0RNjxPLGUFYXXHjZDTxy6CYuPvObNs8bjuZXNQ5kFx
         17ef+FnoEeORiV10xxsQAWyYjBHlEA3Qva0KZ82cfLBmHiJwpAyA1F6CnuvLXrpemGP/
         FqW9fP3PW1HZHwMioqnPZI/AQJGo4zMpdQnj9xYaTNwljOMsLpdJz4EWU+MvvTrsQa9M
         31BulwgE5T4vMpyrfyVyJzm2m+/37NsvgMJB7YdWiXYG+gseJwEMlfCSMP+xAHsRhVWs
         Iq64xyYkKJjAtzJgsi+iyG3Py07plDDB1mX8xHEzq3XNwcit2Td2jf6ndOAqW1KheF5V
         F3jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755922236; x=1756527036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ypumJxO03YajLjZKwy8Tkl56v3hjokXusjP9nMqhO7w=;
        b=rh1FMhagKIjLe73dOcRGNCkUESg2xrDEIMGf3Tn7Paf3w0ir0RcT3l8/OdrNYV9JzC
         FQYaUA0+i4QrscNtSdvnU7Q/TmFmUq3y1AjT7t0IfFSHXEuiASOSCGAanghqecyiFuuh
         lr5tA5C4GrEy2xHebiHLiuYdf7HkgCUCduq0s0zk3dNMCCDOieKV2TRWNw2R0Wn4wq7S
         qyiGZUNqfsLio4UJ1DOma38CFDRCqP8xfFqAxlnCiWgzUN5c3Rl44R3h6JttPy/AlOA/
         9F8HJPY18LDMGRQPizTiNuRlFNG3bKJloQMGoRs7IgihN3doZ2OrkJcOM1YDAVa7dUY2
         Z80w==
X-Forwarded-Encrypted: i=1; AJvYcCUI82pbJUZdbLfHwPyvr0sZsRvxwbi8IGSmBLtNSoGqYSk1IK+EJhggovI90s8mfBdqbLkgy6CNXR0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwlPsrl3cD9UAf/s+vQYpVe8IBPlXFaAiFhUoutdIEDksNtP0vW
	y4RQ5VPwMNFHZwLep6IAhmSwU7+U1vL7nYrXm3Icsfqzk1EFewprm99hBg0hI84xztJLCF11TMZ
	cE6gn21+DKrY++aNewK2QiH6TBpBwJOo=
X-Gm-Gg: ASbGncuSsF8TKRNKXnE88RDDnhSjtp5CefNn/iBOWRi440Gokx/lBUiBkC3hP/HMRIZ
	rRdrYFPWKj+N6K0kKvKBxt82z9vIOVk8uJXAgf/eohSBPjCYKOCXcwFEVkAWjv/dKNXv3aJJRNy
	cQEp1Mpl5WYT3HJJYre0ZuBOm6EK0yRGDNJ987EJUEmsEEBH9sY2mUqonZngXjK6vetM9JFZtxM
	TvqkksQCRiZMzJnxyJO1ucI0QNenlbcd6XzSGPprlBevVLw+C+Xye+u5oWq1EoWFYNYlW13GmZ/
	89EhHcF2ZjLw+WdS8Z9iq9rx2k/Tgt89j7QuOKy6Q29UxL4E+3ICuGU=
X-Google-Smtp-Source: AGHT+IE9HWKIFeL/eoieWGHthnR2mM+6lMen7eM7ViDX/Yt9x4J4JbxkX+waMQi8V3Vn117kbACUlSqpqH++Fl+y+yA=
X-Received: by 2002:a17:906:c145:b0:afd:eb4f:d5ce with SMTP id
 a640c23a62f3a-afe29743499mr476219566b.62.1755922235554; Fri, 22 Aug 2025
 21:10:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250819111953.3197428-1-chenhuacai@loongson.cn> <CAEf4BzajrMOkdOX5fn=bzWVTLbObPM9=_4Nh9rm5oc_4377Pfw@mail.gmail.com>
In-Reply-To: <CAEf4BzajrMOkdOX5fn=bzWVTLbObPM9=_4Nh9rm5oc_4377Pfw@mail.gmail.com>
From: Huacai Chen <chenhuacai@gmail.com>
Date: Sat, 23 Aug 2025 12:10:23 +0800
X-Gm-Features: Ac12FXxdZ6yZh946ZPsRKRRir3wQhq1Dl1brKhL3lj_EOIJp0wAHwBeoD_l_qrs
Message-ID: <CAAhV-H4DG0Uhq8RpEhusPMkqssLZsU6E4ATp5yH8w3R-KXA+qQ@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: BPF: Fix uninitialized symbol 'retval_off'
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, bpf@vger.kernel.org, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Hengqi Chen <hengqi.chen@gmail.com>, 
	George Guo <guodongtai@kylinos.cn>, Chenghao Duan <duanchenghao@kylinos.cn>, 
	loongarch@lists.linux.dev, kernel test robot <lkp@intel.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Andrii,

On Sat, Aug 23, 2025 at 2:43=E2=80=AFAM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Tue, Aug 19, 2025 at 4:21=E2=80=AFAM Huacai Chen <chenhuacai@loongson.=
cn> wrote:
> >
> > In __arch_prepare_bpf_trampoline(), retval_off is meaningful only when
> > save_ret is not 0, so the current logic is correct. But it may cause a
> > build warning:
> >
> > arch/loongarch/net/bpf_jit.c:1547 __arch_prepare_bpf_trampoline() error=
: uninitialized symbol 'retval_off'.
> >
> > So initialize retval_off unconditionally to fix it.
> >
> > Fixes: f9b6b41f0cf3 ("LoongArch: BPF: Add basic bpf trampoline support"=
)
> > Closes: https://lore.kernel.org/r/202508191020.PBBh07cK-lkp@intel.com/
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > ---
> >  arch/loongarch/net/bpf_jit.c | 9 ++++-----
> >  1 file changed, 4 insertions(+), 5 deletions(-)
> >
>
> Is this something that should go through loongarch-specific tree?
This one, and other LoongArch specific BPF patches will go through
loongarch tree, thanks.

Huacai

>
> > diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.=
c
> > index abfdb6bb5c38..a73f6ea4ed4a 100644
> > --- a/arch/loongarch/net/bpf_jit.c
> > +++ b/arch/loongarch/net/bpf_jit.c
> > @@ -1504,11 +1504,10 @@ static int __arch_prepare_bpf_trampoline(struct=
 jit_ctx *ctx, struct bpf_tramp_i
> >         stack_size +=3D 16;
> >
> >         save_ret =3D flags & (BPF_TRAMP_F_CALL_ORIG | BPF_TRAMP_F_RET_F=
ENTRY_RET);
> > -       if (save_ret) {
> > -               /* Save BPF R0 and A0 */
> > -               stack_size +=3D 16;
> > -               retval_off =3D stack_size;
> > -       }
> > +       if (save_ret)
> > +               stack_size +=3D 16; /* Save BPF R0 and A0 */
> > +
> > +       retval_off =3D stack_size;
> >
> >         /* Room of trampoline frame to store args */
> >         nargs =3D m->nr_args;
> > --
> > 2.47.3
> >
> >
