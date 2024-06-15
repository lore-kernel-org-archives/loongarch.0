Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690BB1C280
	for <loongarch@lists.linux.dev>; Sat, 15 Jun 2024 08:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718441546; cv=none; b=kZCEXiaPqmg6m6x+rh4dIOCsUj98+7uD7mSXc8ujH/O0zZlkMDelbPAvjtXpUzbM5GdWgt2BEHHeHvaVph+vBnMJYnslcGCM7zruxkHPHIHbctypPtDAGd+698m4uS54tULcFlAABAHHIO4CEzAT2QnkEEPogP/NbjT1vgVzB60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718441546; c=relaxed/simple;
	bh=lYNgS4EOKxJx9qsKYp8TMD8ZnON5/nuFd2Lwtc4Bs38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GU15e6KRHYL/ut1T0Jhk+Txy5xHQUVZmaFAG7MVGm6/6o6S/TUi+hS3AZvgk0zM9R5egi0qF5SZLUFJ1sym0d8f49+omqQAZsMPkTTx9nkjv6VqaS90cX3qsjGUH5mjCFg6IqECwm443A6MTU7uh53aifcmPRTbpVfLbmE/vOWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qAmLIzKz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qAmLIzKz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 002C3C4AF48
	for <loongarch@lists.linux.dev>; Sat, 15 Jun 2024 08:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718441546;
	bh=lYNgS4EOKxJx9qsKYp8TMD8ZnON5/nuFd2Lwtc4Bs38=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qAmLIzKzJVbf0sdi86jgm+dNNTD1eTKXPIWEBjgx3R/pzB7q0n35s1yBc0q3b0HtH
	 wzwIJeVR9mOjb5AFo/qfMTKR+Iv+6YC5bDBGgEY4lzN8cWJHdmpIjUrNSq69XMw7RN
	 z+jllrT/RZSXuDiUEpEmGYOI4Ldn0QmDuPRs0UXJ8b4FO9XHag0z59fHNcXdOnQFbo
	 ARt8YqMcDat/K//v7+9IQswihvnfgwCHsWltYp29Nwe+Vi7je+suJPKAq9fbL85Gpr
	 +qlqEyTggL3rROEyISThqyK85lVFDpHxvV9Dm3plDoG2/rAjFIuTcS3eigmfzoa0HB
	 sRJBXYDVyLDNw==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-57cbc2a2496so2703494a12.0
        for <loongarch@lists.linux.dev>; Sat, 15 Jun 2024 01:52:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX9JnXdy+SfpTihzcVBhGR6a2wQ0s8+xmizNt4X9dJYOIvoSDuDUzDz8ubMcrYeJLKql3kZx077dIXjy3KRNXXgBd2LZTDAYgDD
X-Gm-Message-State: AOJu0YzruaqYJ82WM+FU/ht9aN+LSb9x0VdML5oUr2L6eqffxGPb/xED
	HMGCvPpIapAToEUlYAhTq7J9OSJU0rH3FLmnqrj2kOXxcdQRMPjVAqJfaclgmK3gGyQJYIu8+Kl
	TJQwZjJ+m+3++LrZuH8Cvv20TDME=
X-Google-Smtp-Source: AGHT+IFyPBQJTylosSuf5+MVqWLqEy0/yJ8gB4g4PxtoBOX/oelfetnVysEN8hXKg3y38a5M6OArZggzJ1FoS45HttI=
X-Received: by 2002:a17:906:756:b0:a6f:1df1:1ef2 with SMTP id
 a640c23a62f3a-a6f60dc517fmr376288066b.47.1718441544432; Sat, 15 Jun 2024
 01:52:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240511100157.2334539-1-chenhuacai@loongson.cn>
 <f92e23be-3f3f-4bc6-8711-3bcf6beb7fa2@app.fastmail.com> <CAAhV-H5kn2xPLqgop0iOyg-tc5kAYcuNo3cd+f3yCdkN=cJDug@mail.gmail.com>
 <fcdeb993-37d6-42e0-8737-3be41413f03d@app.fastmail.com> <CAAhV-H4s_utEOtFDwjPTqxnMWTVjWhmS7bEVRX+t8HK5QDA8Vg@mail.gmail.com>
 <a21a0878-021e-4990-a59d-b10f204a018b@app.fastmail.com>
In-Reply-To: <a21a0878-021e-4990-a59d-b10f204a018b@app.fastmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 15 Jun 2024 16:52:13 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7OR5tkbjj-BPLStneXFr=1DUaFvvh8+a5Bk_jhCAP25Q@mail.gmail.com>
Message-ID: <CAAhV-H7OR5tkbjj-BPLStneXFr=1DUaFvvh8+a5Bk_jhCAP25Q@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Define __ARCH_WANT_NEW_STAT in unistd.h
To: Arnd Bergmann <arnd@arndb.de>
Cc: Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev, 
	Linux-Arch <linux-arch@vger.kernel.org>, Xuefeng Li <lixuefeng@loongson.cn>, 
	guoren <guoren@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org, 
	loongson-kernel@lists.loongnix.cn, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Arnd,

On Sun, May 12, 2024 at 3:53=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Sun, May 12, 2024, at 05:11, Huacai Chen wrote:
> > On Sat, May 11, 2024 at 11:39=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> =
wrote:
> >> On Sat, May 11, 2024, at 16:28, Huacai Chen wrote:
> >> > On Sat, May 11, 2024 at 8:17=E2=80=AFPM Arnd Bergmann <arnd@arndb.de=
> wrote:
> >> CONFIG_COMPAT_32BIT_TIME is equally affected here. On riscv32
> >> this is the only allowed configuration, while on others (arm32
> >> or x86-32 userland) you can turn off COMPAT_32BIT_TIME on
> >> both 32-bit kernel and on 64-bit kernels with compat mode.
> > I don't know too much detail, but I think riscv32 can do something
> > similar to arm32 and x86-32, or we can wait for Xuerui to improve
> > seccomp. But there is no much time for loongarch because the Debian
> > loong64 port is coming soon.
>
> What I meant is that the other architectures only work by
> accident if COMPAT_32BIT_TIME is enabled and statx() gets
> blocked, but then they truncate the timestamps to the tim32
> range, which is not acceptable behavior. Actually mips64 is
> in the same situation because it also only supports 32-bit
> timestamps in newstatat(), despite being a 64-bit
> architecture with a 64-bit time_t in all other syscalls.
We can only wait for the seccomp side to be fixed now? Or we can get
this patch upstream for LoongArch64 at the moment, and wait for
seccomp to fix RISCV32 (and LoongArch32) in future?

Huacai

>
>       Arnd
>
