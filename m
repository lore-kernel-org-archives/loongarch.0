Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEC2298CAB
	for <loongarch@lists.linux.dev>; Wed, 19 Nov 2025 14:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763563425; cv=none; b=uVmgwYnH/d1AgpwMWM+dV+2HxGcuUenONPn8sXiGb246Z/q4h10IiilYu8d5JyHj2sTm/EwwyZpAA2DLf9+d9gA1gSSb8cG4AmEqAfX2aCo/QtjJ3Pv7gcrvIZB4qRd2lTTlzh/cEz3zwW0P9JWPyzji2gqtrMrMm32DqqnpB6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763563425; c=relaxed/simple;
	bh=2z064nicPkbhvbFdk3DNaYzeBT79ucpWGtEQFNcD5MA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KnFmve6i296p4Q3MuLAK8sf+JarLl6gg///8EP4ycQEfnviyUWAT9iZ/qmnps6t92pJ3B+TtMoPHUMB5fMlehX6OQulXFpVVtKwKG+0pwgVjB7UD5JKvjXf7fjF3CtaipJ+TQdWbXCTLleSIz0EKpfJv+PxAbquFYY3MxZQc0Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kPHExZkm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kPHExZkm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D389C4FDE1
	for <loongarch@lists.linux.dev>; Wed, 19 Nov 2025 14:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763563421;
	bh=2z064nicPkbhvbFdk3DNaYzeBT79ucpWGtEQFNcD5MA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kPHExZkmprcEn8Rik7i0UQa234oy2IA0XFvjlZuXD43PTcXOnSdG4HSrgRg957BZe
	 RK2kSCshtvoeqGPRW5frwVHm+U3HJ0IMVu9VkSiHi8czXek+AdW8iNY5SFRSlCyqtk
	 ABkYad9YDEz/Gsyo+00ikRy+Jzn2XVfttaYH5Z21tLAYF/ZCbCz6M5SYz+H95Zt6RV
	 RSWR335wJIX01ool4gqpUEYAupO0kavYmBNM57ft3eshJedwpXWGQFdjKzfvmkBLl/
	 8+igb62+LbIFTQhJdmqVeB/r9qTCdQAUy1MbuMO/wL/OpPYm4oOze1bL2RDxE+ZotS
	 g3Lv7Zh7nd6uw==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-64080ccf749so9680838a12.2
        for <loongarch@lists.linux.dev>; Wed, 19 Nov 2025 06:43:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX3tbC27VoAhCL+JTiEZsaRDbKALr63e9c5zh7uGWaXQc5QJJUpOeP+0+F2o/f+G90IUKPJ2k8Xs9s=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzh4SL+Td03bIu2b1E1iSThldkoj7s9uAHaCRotrPvI0ou+Yzhk
	eK0B0zLMwYNjU3H3CjfNy5ypmDxbYcMZohs25vCFj5CwmOthwEi/OrqLBAeBvxw8qme0JC4InG3
	lp+NmJYeHNTx8ekzmbMu09fNWdY/CtnQ=
X-Google-Smtp-Source: AGHT+IGRRbE/yMt+CJhBJTjAeoFPwPJ7dbuG54h0FPb6G8ICb8kkGh3gMrGA7KjvSvQ3F+5qslNF7zZ9Tnjwa4bLlUM=
X-Received: by 2002:a17:907:3c82:b0:b73:16fc:d469 with SMTP id
 a640c23a62f3a-b736793dcdcmr2085515866b.51.1763563415202; Wed, 19 Nov 2025
 06:43:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251118112728.571869-1-chenhuacai@loongson.cn>
 <20251118112728.571869-5-chenhuacai@loongson.cn> <aRyoLBjD_8Hz91DV@pie>
 <CAAhV-H5uoDjBRYpK_e7Z+vrcqLAbLXhEbEQP_aJ9f3aTdA+-eQ@mail.gmail.com>
 <04b04b74-ef13-4dd0-a35a-d629acb617cb@app.fastmail.com> <CAAhV-H6aM+nsK39iTDw1Fec25C7+D2UTh92X6FPf3gDouuyejQ@mail.gmail.com>
 <aR3UGUlqGFvo5aX5@pie>
In-Reply-To: <aR3UGUlqGFvo5aX5@pie>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 19 Nov 2025 22:43:21 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7OFnEjen0B6JbBvjrcgNDnOsXqKV1wp7KaRxKjkRYfrg@mail.gmail.com>
X-Gm-Features: AWmQ_bkYanL2Vm4yxrUlXAat1BQPYrTDWEB8jFTLIria9RLYEuQHx6SD870O10I
Message-ID: <CAAhV-H7OFnEjen0B6JbBvjrcgNDnOsXqKV1wp7KaRxKjkRYfrg@mail.gmail.com>
Subject: Re: [PATCH V2 04/14] LoongArch: Adjust boot & setup for 32BIT/64BIT
To: Yao Zi <ziyao@disroot.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Arnd Bergmann <arnd@arndb.de>, f@disroot.org, loongarch@lists.linux.dev, 
	linux-arch@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>, 
	Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 10:29=E2=80=AFPM Yao Zi <ziyao@disroot.org> wrote:
>
> On Wed, Nov 19, 2025 at 03:51:01PM +0800, Huacai Chen wrote:
> > On Wed, Nov 19, 2025 at 2:03=E2=80=AFPM Jiaxun Yang <jiaxun.yang@flygoa=
t.com> wrote:
> > >
> > >
> > >
> > > On Wed, 19 Nov 2025, at 12:28 PM, Huacai Chen wrote:
> > > [...]
> > > >> Per the schema for LoongArch CPUs (loongarch/cpus.yaml), "clocks"
> > > >> property is also described as mandantory, thus I don't think such
> > > >> fallback makes sense.
> > > > Yes, "clocks" is mandatory in theory, but sometimes is missing in
> > > > practice, at least in QEMU. On the other hand, if "clocks" really
> > > > always exist, then the error checking in fdt_cpu_clk_init() can als=
o
> > > > be removed. So the fallback makes sense.
> > >
> > > IMHO this should be fixed on QEMU side, but I recall QEMU do have clo=
ck
> > > supplied in generic fdt?
> > It is difficult to fix, you can have a try. :)
> > If without fallback, cpuinfo shows 0MHz now.
>
> A fake "200MHz" output sounds much worse than obviously wrong "0MHz":
> the latter informs the user something bad happened here, while a
> mysterious "200MHz" output only makes it more confusing since no one has
> specified so in the failing case.
All CPU freq in QEMU TCG is fake, even if it is provided by DTS. But
if someone fixes QEMU, I'm happy to remove this part.

>
> > >
> > > >
> > > > Why pick 200MHz? That is because we assume the constant timer is
> > > > 100MHz (which is true for all real machines), 200MHz is the minimal
> > > > multiple of 100MHz, it is more reasonable than 0MHz.
> > >
> > > Maybe better panic here :-)
> > No, this is not a fatal error, we don't need to treat everything as
> > fatal. As you know, many "BUG_ON" have been replaced with "WARN_ON" in
> > kernel.
>
> But it is an error and shouldn't be ignored. I agree that panic is too
> serious for this, but at least a warning should be issued.
Yes, it is better to add a warning.


Huacai
>
> > Huacai
>
> Regards,
> Yao Zi
>
>
> > >
> > > Thanks
> > > --
> > > - Jiaxun
> > >
>
