Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FB919CC20
	for <loongarch@lists.linux.dev>; Fri, 21 Feb 2025 10:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740133581; cv=none; b=qjff1Tg+7KpfR16i/zGuSkNdcpuAzr/7JVakJvTvOzkNOLxtAjV5SLDJG9pkZDG8krkRVAWlzbDws61161YmAvAhaf3amyZqAkzN0yNwuNKxnDQuQQ2hxb5UJ5C0j23PwZhC2DmhnEj8nkkdrMAX2musVoL3pBJvHI5mURQiVGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740133581; c=relaxed/simple;
	bh=/8/8sr5tXAM5If0IVypRSEE4sz+/sFVU6d/4Ly9Ee8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V+q4AQba7x6ffL1/UyvFQfNwcS/k+MWhsTDsSTX2CWWWh7+AozsDqq7JovGxXIvL7nzoq7hSba6DJZ7lcuWyRU1kAcEipYHcTfNAZhf90HFvLGC5O6QFiuioWTzVrc9Z+l5PihKUkTMVAyqDhgvqO5iNTT8KkB3m5CDoAtOEAdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H+JgtNYo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H+JgtNYo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1E76C4CEEC
	for <loongarch@lists.linux.dev>; Fri, 21 Feb 2025 10:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740133581;
	bh=/8/8sr5tXAM5If0IVypRSEE4sz+/sFVU6d/4Ly9Ee8w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=H+JgtNYoWHVjM+iWk64roHGe0gKGyF+xov4+2VQEOaCRTNHNoVFzbisLfw0tcUSKH
	 ZD3MKPxFZYsCjsCDksXDchv0WVNjDKIPXAgp7u0k4VzQibbbq79ZJzHzC7jhptg1YQ
	 eHNNR4vpRZ5PvpjOJ+Kz2zBKCtWLxfaRqgvn6hJqlmUqVPXYrbzWY7uA5VIlScUX/f
	 aV+FqjhhmBsxoKK3SzX4GFycuNkhgn/Yu+lsw5KdWwVBHET6QwvI+dII9vGZ5wfEji
	 a6wfFMInEHJZOMrah9TV23qnbyVEf4sIl5Wic037qoQ49KiPZ4axtenEesvRUhXYsN
	 wFEYoi0QVvdhA==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e08064b4ddso2718779a12.1
        for <loongarch@lists.linux.dev>; Fri, 21 Feb 2025 02:26:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUol/9ZbcI1YVF64CF0NNzEjhazhKNf4wKhgOLXiu48JBSpTjxjfcHfg7mz02ebsrotArY8MM7/PxI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyeI9K3LNlHP3COnlxv2k3NPtiIDr4/8GziuTEvH/Ct0qatTX1/
	fOEdy8rflT5KrQh1vOzXs9X1p5qny3FkMMoRkOYNZMsA+oL1Z/U5m3IKy4l6Ibi68DCdz2Pp6sD
	diijGM1x46sDjr91bU1CXl/h37Jc=
X-Google-Smtp-Source: AGHT+IF+dx1y8jdurtmAxgFLSYpG20X3+0Wp7NOu9CNU4jC2DPzEUAFWpRZ/vYkn9p1RrniyY9Wnwf42URprP3GZyU0=
X-Received: by 2002:a17:906:318b:b0:abb:b322:2b37 with SMTP id
 a640c23a62f3a-abc0d9888eemr172218566b.7.1740133579401; Fri, 21 Feb 2025
 02:26:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250221092523.85632-1-xry111@xry111.site> <CAAhV-H5_bKtO2mAFmfcZvD0pn9RhTA+UPjv7K574uPKxZbxX=g@mail.gmail.com>
 <f0c15994e7a79f6cd0c82930c0dfebb50458c941.camel@xry111.site>
In-Reply-To: <f0c15994e7a79f6cd0c82930c0dfebb50458c941.camel@xry111.site>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 21 Feb 2025 18:26:11 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4rDXDnzJwUE6PXMyuNGTs1NwUzQDP5eAPMmaHpqftP-Q@mail.gmail.com>
X-Gm-Features: AWEUYZkKtsq-lGYG5QXtYRBdszSLZp8SfNp0lQCGpiQmL0851ruHkeCLcoUwyFg
Message-ID: <CAAhV-H4rDXDnzJwUE6PXMyuNGTs1NwUzQDP5eAPMmaHpqftP-Q@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: vDSO: Remove --hash-style=sysv
To: Xi Ruoyao <xry111@xry111.site>
Cc: Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Fangrui Song <i@maskray.me>, 
	WANG Xuerui <kernel@xen0n.name>, Masahiro Yamada <masahiroy@kernel.org>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, "Jason A. Donenfeld" <Jason@zx2c4.com>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2025 at 6:23=E2=80=AFPM Xi Ruoyao <xry111@xry111.site> wrot=
e:
>
> On Fri, 2025-02-21 at 17:47 +0800, Huacai Chen wrote:
> > Hi, Ruoyao,
> >
> > On Fri, Feb 21, 2025 at 5:25=E2=80=AFPM Xi Ruoyao <xry111@xry111.site> =
wrote:
> > >
> > > glibc added support for .gnu.hash in 2006 and .hash has been obsolete=
d
> > > far before the first LoongArch CPU was taped.  Using
> > > --hash-style=3Dsysv might imply unaddressed issues and confuse reader=
s.
> > >
> > > In the past we really had an unaddressed issue: the vdso selftests di=
d
> > > not know how to process .gnu.hash.  But it has been addressed by comm=
it
> > > e0746bde6f82 ("selftests/vDSO: support DT_GNU_HASH") now.
> > >
> > > Just drop the option and rely on the linker default, which is likely
> > > "both" (AOSC) or "gnu" (Arch, Debian, Gentoo, LFS) on all LoongArch
> > > distros.
> > What about changing to "--hash-style=3Dboth" as most architectures do?
>
> IMO we are more close to ARM64 for the aspect that there are no libc
> (glibc or musl) releases lacking GNU hash support, so I prefer the ARM64
> way.
>
> Maybe this should be changed for some of other architectures (RISC-V and
> C-SKY?) as well because I guess the only reason they used "both" was
> "hey, without this the self tests don't work on Debian" but this is
> resolved now.  Adding a few recipients and Cc for discussion.
OK, maybe we can change it for RISC-V/C-SKY and see what they will.

Huacai

>
> --
> Xi Ruoyao <xry111@xry111.site>
> School of Aerospace Science and Technology, Xidian University
