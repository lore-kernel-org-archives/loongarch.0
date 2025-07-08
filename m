Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C03C1EA84
	for <loongarch@lists.linux.dev>; Tue,  8 Jul 2025 12:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751978293; cv=none; b=cAvSBh1g/PnNNvIT23Qw6Qpf9nfmm1jWBGX3d2VOxe8HJwdvFgPXwmGjoY2XN333jNMVycjTGcbdRh/oOegKUUc4ZybOJLi9Zug255UnJrPQwFefNiRHwexmVXFWG2s72Qpm/GOodlTwE5CdkABP7FXsYXEdm6i2Gm29ZcsGe/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751978293; c=relaxed/simple;
	bh=AhfLrfRSsw07jfs1UMghYWvNtaARBvBzBANLf+ADqbg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ibFIkUmvOyPgELTT6KMIaKklO99NN1txJpkPn2G4DWDJwWsGXDbcsgKqSXqN1pTVjntpZun7XgLiMeHBvjFLRZTUcC3zU4bCqZ1SNjKpxuGYKFhpHEncYT8a8tOU33PPyE9+yYa+bXsx6HwXw1HeJ2nRhoabUQkk0jnDSPbwKRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D3LAL1r2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D3LAL1r2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD0BBC4CEF7
	for <loongarch@lists.linux.dev>; Tue,  8 Jul 2025 12:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751978292;
	bh=AhfLrfRSsw07jfs1UMghYWvNtaARBvBzBANLf+ADqbg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=D3LAL1r2IQNaXOtgQ5ed2uKeMQ40nsP5HBvdSPk7sEJ6FOmYUnDR+cuU5x/qbiWxc
	 0fenAV2MrRxIo2JZIhEWbqRWJuykYXxkK1Gy0loz6m/6KSeuczbj89xQoihXuErFnw
	 MuMF5I8Bsz9DWXXoVhadIjjCfx4nprfWoNOLZpn+vG+HIM2niR/nMru+ZRFqtdTjSc
	 zFR3d3ZpIp0Q909FMk6XWUz2hLB9kJJYiA8ZyRgjpykT5eOfGBZWLElIKqjP7OBpbu
	 7j00LMhcqN1L5sCwSDfA9IcuH0tt+LQa8fBfJwcP6WhayNPmmx0UjaBCOAySVE5MCy
	 X3Dsq43lol3fg==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-60702d77c60so8517916a12.3
        for <loongarch@lists.linux.dev>; Tue, 08 Jul 2025 05:38:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWCcLbCSciba7r7XgZc+mwFBsQNo8CLScswhvwFydqUME1m/xmG0gepzTGIKJWs00mt01xlTOPXELI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwVwvSK/ADA0Td+igLUse+au2mT26obKxvvruGigNARviCZDyX1
	yAARd06xnNG3ptArnbvCJcuIWlHZn4aaeM3dwwWnxYw+1yJ72taHAuExPXgXsw9X2HuM6Q5CQ4K
	u4qNWVVtMNrPSEfe4x+Ddj5/pX85lqPE=
X-Google-Smtp-Source: AGHT+IEg6DcN7sOADspPkyLt/BiUHO7yYnlLZqsqf6OEBfWwWugUQ+XFSABwG9zYT/xF2Gu5Hjwrn4svYRMYNOnf6uQ=
X-Received: by 2002:a05:6402:5245:b0:604:a19a:d84b with SMTP id
 4fb4d7f45d1cf-6104adc0e26mr2323268a12.5.1751978291201; Tue, 08 Jul 2025
 05:38:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250705125710.59994-1-ziyao@disroot.org> <2ad0ae43-0331-4860-8f39-34ebfe02cae8@app.fastmail.com>
In-Reply-To: <2ad0ae43-0331-4860-8f39-34ebfe02cae8@app.fastmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 8 Jul 2025 20:37:56 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6QFUSRQsLRsR7HvB658qefcv64QyGUsTu_5p5hiW5KwQ@mail.gmail.com>
X-Gm-Features: Ac12FXxtbqaf65AsS2ykC9MhpbszG-NX-Sr0H-qx1cFY-FHrF-BqyI2DUxDeD_E
Message-ID: <CAAhV-H6QFUSRQsLRsR7HvB658qefcv64QyGUsTu_5p5hiW5KwQ@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Avoid in-place string operation on FDT content
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Yao Zi <ziyao@disroot.org>, Xuerui Wang <kernel@xen0n.name>, 
	Miaoqian Lin <linmq006@gmail.com>, Hongliang Wang <wanghongliang@loongson.cn>, 
	Binbin Zhou <zhoubinbin@loongson.cn>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Mingcong Bai <jeffbai@aosc.io>, 
	Kexy Biscuit <kexybiscuit@aosc.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Sat, Jul 5, 2025 at 10:06=E2=80=AFPM Jiaxun Yang <jiaxun.yang@flygoat.co=
m> wrote:
>
>
>
> =E5=9C=A82025=E5=B9=B47=E6=9C=885=E6=97=A5=E5=91=A8=E5=85=AD =E4=B8=8B=E5=
=8D=881:57=EF=BC=8CYao Zi=E5=86=99=E9=81=93=EF=BC=9A
> > In init_cpu_fullname, a constant pointer to model property is retrieved=
.
> > It's later modified by the strsep function, which is illegal and
> > corrupts kernel's FDT copy. This is shown by dmesg,
> >
> >       OF: fdt: not creating '/sys/firmware/fdt': CRC check failed
> >
> > Create a mutable copy of the model property and do in-place operations
> > on it instead. loongson_sysconf.cpuname lives across the kernel
> > lifetime, thus manually releasing isn't necessary.
> >
> > Also move of_node_put() for the root node after the usage of its
> > property, since of_node_put() decreases the reference counter thus usag=
e
> > after the call is unsafe.
> >
> > Fixes: 44a01f1f726a ("LoongArch: Parsing CPU-related information from D=
TS")
>
> Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>
> > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > ---
> >  arch/loongarch/kernel/env.c | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/loongarch/kernel/env.c b/arch/loongarch/kernel/env.c
> > index 27144de5c5fe..fba141472ab9 100644
> > --- a/arch/loongarch/kernel/env.c
> > +++ b/arch/loongarch/kernel/env.c
> > @@ -40,15 +40,18 @@ void __init init_environ(void)
> >  static int __init init_cpu_fullname(void)
> >  {
> >       struct device_node *root;
> > +     const char *model;
> >       int cpu, ret;
> > -     char *model;
> > +     char *tmp;
> >
> >       /* Parsing cpuname from DTS model property */
> >       root =3D of_find_node_by_path("/");
> > -     ret =3D of_property_read_string(root, "model", (const char **)&mo=
del);
> > +     ret =3D of_property_read_string(root, "model", &model);
> > +     if (ret =3D=3D 0) {
> > +             tmp =3D kstrdup(model, GFP_KERNEL);
> > +             loongson_sysconf.cpuname =3D strsep(&tmp, " ");
> > +     }
> >       of_node_put(root);
> > -     if (ret =3D=3D 0)
> > -             loongson_sysconf.cpuname =3D strsep(&model, " ");
> >
> >       if (loongson_sysconf.cpuname && !strncmp(loongson_sysconf.cpuname=
,
> > "Loongson", 8)) {
> >               for (cpu =3D 0; cpu < NR_CPUS; cpu++)
> > --
> > 2.49.0
>
> --
> - Jiaxun
