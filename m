Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07A22F6922
	for <loongarch@lists.linux.dev>; Mon, 16 Feb 2026 10:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771236575; cv=none; b=YlbyF8PmbdDavmr6FaR0Ra1uKsgShnbIltcoA1Cvy+314tQXUY+8FuJxkJbISFFvn/1ys/VHird5OPKlcn+ahnPnrSaL2iZTo0pKTuSZYUNfrjPf+R43dZV2ST9wbVZEbEBJGWuarNIwa/+ytH13sWxiJQk0V2ltcMbMh1jHruc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771236575; c=relaxed/simple;
	bh=qBExBGT1EG48SF428uTWG1DV7WLLwl2Q0J8FpvAshs4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pr4vZtLmCbnpucXR5wycc9mQbOcQ6T0s8p1yLAKYRDglZt1QcnM6IpBfnzwq4YPe5FFeJ0TXNHztdthYF9JX0AteAsfyaF6YdiiVrGBtb2smAn5keCipvh69lh5zmb2ROc0ZG2qXMrGQgmxXQ2AcidHQSqDoQ2zSX6QBCwjLzjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oMICYFBm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oMICYFBm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E94CC4AF09
	for <loongarch@lists.linux.dev>; Mon, 16 Feb 2026 10:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771236575;
	bh=qBExBGT1EG48SF428uTWG1DV7WLLwl2Q0J8FpvAshs4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oMICYFBmvOvGW9EEZh28ZlpdeiHg5cDFiGV7o8537fTO8Ki4rnTGxBUAqL2UFFh/q
	 nCBindk6ZxoR3TKzyI/vkUAgAmlZYYYQRDaqxXBBOUS5gfWgZST85NIkY/R2/LIOt8
	 dg5R6tvWDNHdu98C1HaZVWhuMpnVH5hRk1hh8aCLUzprUviXh9FV7zlbXFzzmI05gE
	 FyZQt6wIOV95jZNXFw+ggJg268OSdzCoFMewFlV8OkkSsRaKbvPF8vptqqncAOtJ4G
	 MLH2vjZEcoRMCN524yDP4HAUbR3Qh2oPRSCbgWdc1+SSzcjZEit6TQAgjazUuYk3vj
	 57pbFkr4mKvEg==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-65b9608a9adso5156737a12.3
        for <loongarch@lists.linux.dev>; Mon, 16 Feb 2026 02:09:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXtu0owtzJ7zhhKJ+f5Yg2X0jm7u5/75Lk4XQMcRTW4wcnqhZfUbOyYN24H9s/pL2gmjgKiQHo0oqs=@lists.linux.dev
X-Gm-Message-State: AOJu0YxMc9NI1jG5U+A3IPXrY7nn6RznVRrN0qBtCjAC6Q2UZRm9fn6k
	8rws5wyDOgf3+dtyYKoGcJ3wT4GWiKAhOc/HWqiTXtILvTf6EGeX2m2gbXhsu2zv9G0IDefwxKE
	czXg1HuHWxPd1zW31oREgiC8zq8j4qZQ=
X-Received: by 2002:a05:6402:520d:b0:65a:390a:205d with SMTP id
 4fb4d7f45d1cf-65bc7a70774mr3297588a12.24.1771236574077; Mon, 16 Feb 2026
 02:09:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260215140953.1224579-1-chenhuacai@loongson.cn> <2026021631-sabbath-wrangle-3496@gregkh>
In-Reply-To: <2026021631-sabbath-wrangle-3496@gregkh>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 16 Feb 2026 18:09:31 +0800
X-Gmail-Original-Message-ID: <CAAhV-H42+WuWpKqFc6MMv8cZ_U8Ve15qtb4DkOd9Yj6Z4ZFE_w@mail.gmail.com>
X-Gm-Features: AaiRm51YipyZEoWSnk97F2pgSJm5zm7gXCz2pXNmDpBDeQkfx3eZt7kf_J8eAXA
Message-ID: <CAAhV-H42+WuWpKqFc6MMv8cZ_U8Ve15qtb4DkOd9Yj6Z4ZFE_w@mail.gmail.com>
Subject: Re: [PATCH for 6.6 & 6.12] LoongArch: Rework KASAN initialization for
 PTW-enabled systems
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Sasha Levin <sashal@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, Tiezhu Yang <yangtiezhu@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Greg,

On Mon, Feb 16, 2026 at 5:52=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sun, Feb 15, 2026 at 10:09:53PM +0800, Huacai Chen wrote:
> > From: Tiezhu Yang <yangtiezhu@loongson.cn>
> >
> > commit 5ec5ac4ca27e4daa234540ac32f9fc5219377d53 upstream.
> >
> > "kasan_early_stage =3D false" indicates that kasan is fully initialized=
,
> > so it should be put at end of kasan_init().
> >
> > Otherwise bringing up the primary CPU failed when CONFIG_KASAN is set
> > on PTW-enabled systems, here are the call chains:
> >
> >     kernel_entry()
> >       start_kernel()
> >         setup_arch()
> >           kasan_init()
> >             kasan_early_stage =3D false
> >
> > The reason is PTW-enabled systems have speculative accesses which means
> > memory accesses to the shadow memory after kasan_init() may be executed
> > by hardware before. However, accessing shadow memory is safe only after
> > kasan fully initialized because kasan_init() uses a temporary PGD table
> > until we have populated all levels of shadow page tables and writen the
> > PGD register. Moving "kasan_early_stage =3D false" later can defer the
> > occasion of kasan_arch_is_ready(), so as to avoid speculative accesses
> > on shadow pages.
> >
> > After moving "kasan_early_stage =3D false" to the end, kasan_init() can=
 no
> > longer call kasan_mem_to_shadow() for shadow address conversion because
> > it will always return kasan_early_shadow_page. On the other hand, we
> > should keep the current logic of kasan_mem_to_shadow() for both the ear=
ly
> > and final stage because there may be instrumentation before kasan_init(=
).
> >
> > To solve this, we factor out a new mem_to_shadow() function from curren=
t
> > kasan_mem_to_shadow() for the shadow address conversion in kasan_init()=
.
>
> The subject line AND the commit text here do not match the upstream
> commit AND the diff is different and you did not explain what changed or
> why :(
The subject line is exactly the same as the upstream commit (no difference)=
.

The changes in the commit message is because the text of the patch has
changed (this is why the upstream commit cannot be applied), and I
think the commit message should exactly reflect the text.

Huacai

>
> So as-is, I can't take this, sorry.
>
> thanks,
>
> greg k-h
