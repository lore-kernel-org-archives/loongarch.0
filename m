Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E3B328B71
	for <loongarch@lists.linux.dev>; Wed, 19 Nov 2025 07:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763538666; cv=none; b=OxSzCrtyN/5/G2P1dhgekIaCBz6U85FypJ74i+/FafUpD5Ry+JdTiM2YzPSAAN26iWmfQZdYa0GZoEqoEyeALjhuxvuYK7SppewDQnir3PWBTH/0QyTQUeNgRLrK7gCluyjuD984QwsDpRLJ3J5PzrSXmRxpbUVQwgYP1ISBZjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763538666; c=relaxed/simple;
	bh=AIYAqmAbGjH/cKlRsqKK2HzmYq4EY/exLMH80H6lBns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WFmeOQS70JCVt6mXZqpnaBXMXo5Jg5D/PxsYWMMYl01EMQco5n/mFJiGXI097fb2hpi6+Lmm7akLzBklT4L2hfnrRKmi6ZY1uUNtLOfIxXIbWlA3lvWQNAv728JKFyKV//tRTuuMMfKJscS13u+CRNlF4yQMqTHEx3T7L1eC04A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tmhHKPlR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tmhHKPlR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31D6FC2BC86
	for <loongarch@lists.linux.dev>; Wed, 19 Nov 2025 07:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763538664;
	bh=AIYAqmAbGjH/cKlRsqKK2HzmYq4EY/exLMH80H6lBns=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tmhHKPlR+O9bWZ4imrv+CsrY03VcuAIUEWuddL5j8TtRzp/PxvXlriSnIj0K3Lggc
	 m+QBNYo7KJWbrS5GtO/2mGpqMMz0y8mXq8vVRrQ7oRccUCCysepBRlxNPf66qW9pxN
	 NxrNbULsb1wFSxc/hNemcDxPdyAgW2De37wmo2bSGSPpWbJWeZG7ja1F0MsjrdPmnE
	 0JzREvwh299gfGaYdPq3iol9CoLnqugI0mXbw/ByZyjykD/fmvwtGz7WHOee3F3obu
	 hHjWEX+U/lYLt3fouuAhkjUUSzBJT48fsIaMap1zXjm6uuNJOBNVw4nMY6lWgWYa7C
	 RNSfUJwSbov0A==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-64166a57f3bso9897318a12.1
        for <loongarch@lists.linux.dev>; Tue, 18 Nov 2025 23:51:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXz1cO5GceS/tL4vwUe0ZV+zo7ogktLg6Mry9UbdDlpKWMVIOUCgRVNnnLksIPXreWRd0eGEnLoOh0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwqcHqQH7tB2Dp80PVZypMT5ovoBSn63a3jGZthZXcAYp9BU9OA
	Kzz4OG10k1ebGxB+seZlx72S97AvrU0MLjMjMYw7z8AtybGF1BZ2WPfJfKyAA12/8vloJhlIMOL
	6hZ8UBKRMMOH3Hf97o+xse6nSBP4uZdc=
X-Google-Smtp-Source: AGHT+IHj0NbLKrDvqfxZamDidI0HGtwjF8TD5aehZ5tbu/BDIYakSDitOdrnPb+8E/FflHMOEcBOqD37e/SNyGIfGvY=
X-Received: by 2002:a17:906:fd8a:b0:b73:8639:cd96 with SMTP id
 a640c23a62f3a-b738639d1b4mr1572590166b.24.1763538659984; Tue, 18 Nov 2025
 23:50:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251118112728.571869-1-chenhuacai@loongson.cn>
 <20251118112728.571869-5-chenhuacai@loongson.cn> <aRyoLBjD_8Hz91DV@pie>
 <CAAhV-H5uoDjBRYpK_e7Z+vrcqLAbLXhEbEQP_aJ9f3aTdA+-eQ@mail.gmail.com> <04b04b74-ef13-4dd0-a35a-d629acb617cb@app.fastmail.com>
In-Reply-To: <04b04b74-ef13-4dd0-a35a-d629acb617cb@app.fastmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 19 Nov 2025 15:51:01 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6aM+nsK39iTDw1Fec25C7+D2UTh92X6FPf3gDouuyejQ@mail.gmail.com>
X-Gm-Features: AWmQ_bmHjlasw2gFPJKi8Gs0tpjJw05fzIHIMgusc4BZFnRD2eUXHNqhyRXAths
Message-ID: <CAAhV-H6aM+nsK39iTDw1Fec25C7+D2UTh92X6FPf3gDouuyejQ@mail.gmail.com>
Subject: Re: [PATCH V2 04/14] LoongArch: Adjust boot & setup for 32BIT/64BIT
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Yao Zi <ziyao@disroot.org>, Huacai Chen <chenhuacai@loongson.cn>, 
	Arnd Bergmann <arnd@arndb.de>, f@disroot.org, loongarch@lists.linux.dev, 
	linux-arch@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>, 
	Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 2:03=E2=80=AFPM Jiaxun Yang <jiaxun.yang@flygoat.co=
m> wrote:
>
>
>
> On Wed, 19 Nov 2025, at 12:28 PM, Huacai Chen wrote:
> [...]
> >> Per the schema for LoongArch CPUs (loongarch/cpus.yaml), "clocks"
> >> property is also described as mandantory, thus I don't think such
> >> fallback makes sense.
> > Yes, "clocks" is mandatory in theory, but sometimes is missing in
> > practice, at least in QEMU. On the other hand, if "clocks" really
> > always exist, then the error checking in fdt_cpu_clk_init() can also
> > be removed. So the fallback makes sense.
>
> IMHO this should be fixed on QEMU side, but I recall QEMU do have clock
> supplied in generic fdt?
It is difficult to fix, you can have a try. :)
If without fallback, cpuinfo shows 0MHz now.

>
> >
> > Why pick 200MHz? That is because we assume the constant timer is
> > 100MHz (which is true for all real machines), 200MHz is the minimal
> > multiple of 100MHz, it is more reasonable than 0MHz.
>
> Maybe better panic here :-)
No, this is not a fatal error, we don't need to treat everything as
fatal. As you know, many "BUG_ON" have been replaced with "WARN_ON" in
kernel.

Huacai

>
> Thanks
> --
> - Jiaxun
>
