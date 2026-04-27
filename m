Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3973E315E
	for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 15:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777303861; cv=pass; b=t5+MY6dS5kM6gnttX6tQ92prXDXs1fxzybXXU70oJbbS/l+jXsQFeS7wcv7dJY76s3GZcrfk+WrZIz1Prg5OAEuvL1XfHtlc537jVpyWiD2thlqoVdplxYa51BZy58os206Vr2J07a/IwcgNksUkR+Rrc/U84SUFaLiTHO51vqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777303861; c=relaxed/simple;
	bh=4HiY4AYN/EGxobzB/5kTY8j2JpTsW2nMz6JrZtmNerw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZhiJrHCQTS6HPBKQoYi+SuSOLgdBHPF5iPoIHPwGIJUOlHfuFwlHAwyr1H0SFdRNSRWwyOLy+VRNsHu55STIgNZDFh+8B4SiUJWQp53mkXGao1BybENBsHiWZM616OBWrtqhbSMFXYFeSGuy/52B/cmYtfyj3SMGB4RfZ20+zuQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b=s5G9mrQU; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b="s5G9mrQU"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-6501d242e2fso9434082d50.3
        for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 08:31:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777303859; cv=none;
        d=google.com; s=arc-20240605;
        b=jGVtvGV8Msl7QWTqrUMznnAVni7JkbUGD+kNhvVWpFt9w6oOdPHftEROiGoSt4W4/v
         zLydvhK0gI+AZQskvi1u3Y2dUhYLDd8q9lx9WzFJKz+rMw3hPKQf9N3qY7WTuRp2xenw
         Xcy1XQaSVixsY25e3FSxwTv+Bn8CtG5ND8rzmFspwxbB9bEdEGVw5Wk6tXTHh+r09wbv
         SwsYx1KitkNOONnVnmyFkQBGqxA8V6LuZU29Vvn/DmsKfeREuVYzbvQ4iGwo9Vs4q2Ts
         hdvpeCU102TckhN/OOzpdWbxAHFe35N7jQXnt0p/9r86a4btPdQnF4fdmVDChB3AxaXJ
         mQLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tt+/kkN9TN5tQPCLUwGv3Fxj5QDbNx41eb7po+8Opjg=;
        fh=3qNergcUBpY4x7UgI79DYfjT2ccR+V8L9DUPtwEuf0Q=;
        b=T4W2celaersHRWdglpVgTP36fnBvDzFT//A9iddWHblsv+oh7mK+HgthUK4/LTGbvu
         lgo1TTuP+AM1iD/HeCcawzrzVAfD26t7yu22b1XecXz5gxD0VA3jQFMO3gv3AUMiBhXX
         /SSWB8RmUbthUrjLjOZKjQjLyaF2iQ1ITyFWvLGc1wObkDofnCbhd7T36iWs+NhdDjMo
         DHOrgz41UuagZ6ZIeY9qPy5DsflnHiehAWwepRvThZgE5D304fuvf/Rd7KNkXQp8p5eE
         inHRYKeovLJqYhCzohKnxlAI/0Jc08MKucapiRH4y08s0DnHZ1SgGhE1WEc1Vj3IIeA8
         hypw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20251104.gappssmtp.com; s=20251104; t=1777303859; x=1777908659; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tt+/kkN9TN5tQPCLUwGv3Fxj5QDbNx41eb7po+8Opjg=;
        b=s5G9mrQU19B9GaelAIudNwY2eZLwVmOkRd2TbmDXcodPgeAktTc0E5Z8TGW3cfBHME
         HXezYw9Wpuqxvzr7vrB54u7sC8lRiZd1JGtpx5KU1MMl/bsRh+gGDokSQ84qTy/QiSsP
         ZoSTtmNAO2FA0P3wRgVrw74kOangm0yqeWlIjMosszwwji5WdNL+yyopiHIVvyIYmy/e
         gXkUxluEscZtFY9S0z1L16XAtC5GljpNc8NAXX1TW6gIoZieUnx0ZB6P7uqUTGaYV666
         qCJtqFLCwocPirvXm+MUbAFSJWVdNGDqEW9Df75XJ3HJTfbTHTop1Eoz/G6jUugENu0r
         zNCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777303859; x=1777908659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tt+/kkN9TN5tQPCLUwGv3Fxj5QDbNx41eb7po+8Opjg=;
        b=W6UBaA72GmZQueWrcj0ZudHuq6btuQ1KtkSgkJR4ybhoFKFintKdK3q2A2tNk6bAIM
         +8wZ+Nfk8VJli3gfcy8ZjuHmu1qjF3KzBc+xdzNNxC0kRbVbeikyO1Jk0vdKZmCxmji4
         2qJ/fgh/njBJC9pAzzBHRJqJmy+y6jSnZW7+2owJ+9/fNwbVuWKbX9xnoHFH5OyQ1QEu
         pHV0BGDn82oh+4GwnaSE2SxXH9Ol8UxqOYXQONoconZ5fFeFghNR1+dGgp7Mlk8dYjCj
         EQLNddB6bqxhSk5xzFc1/tKX0AmsQkFSQYkyztV4+158D0m2gpmNloxQKpxWNNCMiWJT
         j3uw==
X-Forwarded-Encrypted: i=1; AFNElJ9bXjMjOPWBrdinZjdoXOxx5becqH6zIA2a9wEoj2L2mwWYyUyAL/SaLIui4wOYyTjd/wbSyXcYu9o=@lists.linux.dev
X-Gm-Message-State: AOJu0YxbFGJDzULuaFzAwd7sZLGoZHLHZNo4jDeRDXxa5BxIurIRKOYZ
	tifFdNPVUH2t/xhuItCPqK2qQ3hiPGKpd0ZDWu/3sqREIe9fzdUBtYv15CmSb1U2tulDsmb4LBh
	2wW26uZdkSiZUgijkriR/LWrGaUZeFxYrBokEDB/FLw==
X-Gm-Gg: AeBDieu1r4MIXcdvzOaV7nyLIAJ279gNmu+r8Tl6sULaIY1X/Pe11dWbK8Y2xfp/86I
	ho3UcL/8O6paPhtJxtNds9WItSeMX71nkBB1sxyMctekj9L7sEVYX4iE7JE6CuZvG62TK/h+3HP
	/05vgdu9MMLoU3/GP2tPBMYssGIY6fbXaixzh1ueiZCM8C+pVsNDrer5/rewwm02/jx8WGPJ9TL
	6nqhJKfc3R9pZsreMUJ3aN4Rc1kmpuulWkzrCbUnvqKTgydYIH1lZutRSZmaGx0+91Fot3lFGtz
	oIT9t7Wc5JIZwEQu4Uo+yJJY4CKBY+6idtsTdKp60uWr7j8+c58=
X-Received: by 2002:a53:ac9b:0:b0:654:c28:551 with SMTP id 956f58d0204a3-6540c282024mr35236448d50.32.1777303859167;
 Mon, 27 Apr 2026 08:30:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260427104721.47724-1-r@hev.cc> <20260427104721.47724-4-r@hev.cc>
 <CAAhV-H7+B6=Uf1ZDy9SLvWkR-ggTi3k9kFU8+B+JefWqPu4Uvw@mail.gmail.com>
In-Reply-To: <CAAhV-H7+B6=Uf1ZDy9SLvWkR-ggTi3k9kFU8+B+JefWqPu4Uvw@mail.gmail.com>
From: hev <r@hev.cc>
Date: Mon, 27 Apr 2026 23:30:47 +0800
X-Gm-Features: AVHnY4Jsizl5p24DvdxTsPYaW0zh8JaFfxWIPucZNRq4lEI0h18QkC9uiGKG4ls
Message-ID: <CAHirt9j-PMwKaLUYqR9qCOemBXCw3PfpuB5Ff1EbZozLn8tFqw@mail.gmail.com>
Subject: Re: [PATCH 3/3] LoongArch: Skip relocation-time KASLR if it has
 already been applied
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, loongarch@lists.linux.dev, 
	linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Huacai,

On Mon, Apr 27, 2026 at 9:29=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> Hi, Rui,
>
> On Mon, Apr 27, 2026 at 6:47=E2=80=AFPM WANG Rui <r@hev.cc> wrote:
> >
> > When the kernel is relocated during early boot, a randomized load
> > address may already have been selected and applied. In this case,
> > performing KASLR again in relocate.c is unnecessary.
> >
> > Signed-off-by: WANG Rui <r@hev.cc>
> > ---
> >  arch/loongarch/kernel/relocate.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/arch/loongarch/kernel/relocate.c b/arch/loongarch/kernel/r=
elocate.c
> > index 16f6a9b39659..c36604a81d08 100644
> > --- a/arch/loongarch/kernel/relocate.c
> > +++ b/arch/loongarch/kernel/relocate.c
> > @@ -139,6 +139,10 @@ static inline __init bool kaslr_disabled(void)
> >         char *str;
> >         const char *builtin_cmdline =3D CONFIG_CMDLINE;
> >
> > +       /* KASLR is performed during early boot. */
> > +       if (kaslr_offset())
> > +               return true;
> Maybe the "kexec_file" case is also handled by this?

Yeah, it looks like kexec_file doesn't load the kernel image to
VMLINUX_LOAD_ADDRESS, so it will disable KASLR here. This aligns with
our expectation of disabling KASLR for this case.

Thanks,
Rui


>
> Huacai
>
> > +
> >         str =3D strstr(builtin_cmdline, "nokaslr");
> >         if (str =3D=3D builtin_cmdline || (str > builtin_cmdline && *(s=
tr - 1) =3D=3D ' ')) {
> >                 pr_info(KASLR_DISABLED_MESSAGE, "\'nokaslr\'", "built-i=
n");
> > --
> > 2.54.0
> >
