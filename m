Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BE7250BF1
	for <loongarch@lists.linux.dev>; Fri, 21 Feb 2025 17:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740159936; cv=none; b=XX96DB05eBbspPxW2BHo9lf+fQcLMeikdNus4nsHWgmnHM4N6XXZtMWIkAjQbDfofkWcVWrkGkuKa1RHWV8mngRRXzr1XyZa1OFuJREBNeKrDlXCV1VYUbz08fxM9SCbclEkh76bBcgFKSsXXte2F1EgEim8t93JJb5ie9eDPuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740159936; c=relaxed/simple;
	bh=4+8PbmaauA94usuoBxYYzJADa474EnhaILlzpd6EDs4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pt97MsFn09sp5HCZpFguVmsIzIUpPiNe7885tXYjgljyTN2lmEyhV04Hw0PBht/46llwPUMyPek8K70VptSHYMpGIo7xbVuL4+KG144FqTKPVu/AOk53XUKdA3cRJK0jQIm5m/MNGmRWcuPUVmi7L5GFBFSfM7G71MKVrT4EtHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=maskray.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=maskray.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5209ea469e9so2254612e0c.0
        for <loongarch@lists.linux.dev>; Fri, 21 Feb 2025 09:45:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740159934; x=1740764734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dVlYG/IbFu9Q/R+V4VeWK18IBK9fWtgJYvhhNDBjzKM=;
        b=f1Ugk7O3k/MpyUVK2MxHrREguJhAsqgI1Kf4BynPO0vEfajlq3Jlpnxv3psit+p9vR
         2D1l4zk/wTukRyZDbEqxSlGitWPQYXU/8t0gOUNI04m4riSN8A1qr3+g4knL3Xx+vywp
         sKEkxGm4M5n64Hfvu+BF4O2s+ixMftMQwdi/jFXVKWMUYk+6BzK+fkCXduBkiQUacCht
         0TBbLQRFFzQK9YtRQEZn1oIl3w5hSt/0c01oz1bk2FnFZZsiSItS7wZNchmY8MbEbllA
         A5G8cm24HkCTHY6NT0ybTMR4lTKGOXv/LI7cCfqh8PRKH21VS9t3rFvazMWWC24lWyIC
         r7CQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXaaFCBo7KujQKtqhgEUQwuqDITqZAKy2FpXhECeXGT6PKDvdc7V0+MlP/ft+XT7w0Wu3XnD8tRDQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyP/IRH+MPEhxRp/8yM1/Tl+QaLy/Z3dzBVt1wehIvlp9FAZSSd
	iCPBd7SrKEfpyXqzsSW6tJjVlyAygVTQMT9d9k5DBlwbbIS3gIe8YLkfh+GI
X-Gm-Gg: ASbGncsyc2djB88zPNA++CVGPFT6OQjq7NUjQIReTjvOBLXSwCBq+zrxsRnI5Kg161j
	gricJALvdf39/pbmqN4+Y9un7tLODQq+iPQl0J4coEKhvoFZn7l3m7oo74EXgV3IHVsA6NJk64J
	0zIK/GhVZB/l5ZgfTn4iJYKHfx7kb0tLoX+HbIubZzQhvejIcZIImMAD70ZlbS6bk7A8o0Ik0NK
	MfCupMETEa9j2o1mdWkWASOKYG6Rwe3SVA3jHD6BgitTgfHJ+HOGZAEtxeBxi9e08gkraGfioMI
	JF8xEFar3dvfR1p+HCGa5FCwXJaqOGOIlclTZIncUXiLLCOz82UF/I9mbg==
X-Google-Smtp-Source: AGHT+IGUFkLOzBJFxHsxev3u4/lNGewT6HTdGTCEtyY8ymTUMTK+VBDOLUEaNZGZ2hCt+wyk5y456A==
X-Received: by 2002:a05:6122:3c94:b0:520:4806:a422 with SMTP id 71dfb90a1353d-521eec6f7eemr2260818e0c.3.1740159933583;
        Fri, 21 Feb 2025 09:45:33 -0800 (PST)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5208829e912sm3740217e0c.24.2025.02.21.09.45.32
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 09:45:33 -0800 (PST)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-52098b01902so1381188e0c.0
        for <loongarch@lists.linux.dev>; Fri, 21 Feb 2025 09:45:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUzTUzOUzlkhYTQ7RsVeom0hIQY6krq1L58wX5N+Xc2C+WR3fPWF1c31bgCSUiyPx7bYkElP3LZEdo=@lists.linux.dev
X-Received: by 2002:a05:6122:608b:b0:520:4d63:72da with SMTP id
 71dfb90a1353d-521eeced620mr2485638e0c.6.1740159932550; Fri, 21 Feb 2025
 09:45:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250221092523.85632-1-xry111@xry111.site> <CAAhV-H5_bKtO2mAFmfcZvD0pn9RhTA+UPjv7K574uPKxZbxX=g@mail.gmail.com>
 <f0c15994e7a79f6cd0c82930c0dfebb50458c941.camel@xry111.site> <CAAhV-H4rDXDnzJwUE6PXMyuNGTs1NwUzQDP5eAPMmaHpqftP-Q@mail.gmail.com>
In-Reply-To: <CAAhV-H4rDXDnzJwUE6PXMyuNGTs1NwUzQDP5eAPMmaHpqftP-Q@mail.gmail.com>
From: Fangrui Song <i@maskray.me>
Date: Fri, 21 Feb 2025 09:45:40 -0800
X-Gmail-Original-Message-ID: <CAN30aBEhnR1OJycVs+F43ocJ6Vyh=Et2r+wo5cWwrtV4x-+zcg@mail.gmail.com>
X-Gm-Features: AWEUYZkb8iSWdt-9kgykuTb5jDnwB320XaxMTtxedEnbug7aRKVRXx4OPfkuauw
Message-ID: <CAN30aBEhnR1OJycVs+F43ocJ6Vyh=Et2r+wo5cWwrtV4x-+zcg@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: vDSO: Remove --hash-style=sysv
To: Xi Ruoyao <xry111@xry111.site>
Cc: Huacai Chen <chenhuacai@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, WANG Xuerui <kernel@xen0n.name>, 
	Masahiro Yamada <masahiroy@kernel.org>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2025 at 2:26=E2=80=AFAM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> On Fri, Feb 21, 2025 at 6:23=E2=80=AFPM Xi Ruoyao <xry111@xry111.site> wr=
ote:
> >
> > On Fri, 2025-02-21 at 17:47 +0800, Huacai Chen wrote:
> > > Hi, Ruoyao,
> > >
> > > On Fri, Feb 21, 2025 at 5:25=E2=80=AFPM Xi Ruoyao <xry111@xry111.site=
> wrote:
> > > >
> > > > glibc added support for .gnu.hash in 2006 and .hash has been obsole=
ted
> > > > far before the first LoongArch CPU was taped.  Using
> > > > --hash-style=3Dsysv might imply unaddressed issues and confuse read=
ers.
> > > >
> > > > In the past we really had an unaddressed issue: the vdso selftests =
did
> > > > not know how to process .gnu.hash.  But it has been addressed by co=
mmit
> > > > e0746bde6f82 ("selftests/vDSO: support DT_GNU_HASH") now.
> > > >
> > > > Just drop the option and rely on the linker default, which is likel=
y
> > > > "both" (AOSC) or "gnu" (Arch, Debian, Gentoo, LFS) on all LoongArch
> > > > distros.
> > > What about changing to "--hash-style=3Dboth" as most architectures do=
?
> >
> > IMO we are more close to ARM64 for the aspect that there are no libc
> > (glibc or musl) releases lacking GNU hash support, so I prefer the ARM6=
4
> > way.
> >
> > Maybe this should be changed for some of other architectures (RISC-V an=
d
> > C-SKY?) as well because I guess the only reason they used "both" was
> > "hey, without this the self tests don't work on Debian" but this is
> > resolved now.  Adding a few recipients and Cc for discussion.
> OK, maybe we can change it for RISC-V/C-SKY and see what they will.
>
> Huacai
>
> >
> > --
> > Xi Ruoyao <xry111@xry111.site>
> > School of Aerospace Science and Technology, Xidian University

Agreed that as selftests has been fixed, --hash-style=3Dsysv can be
removed from more arches.
arch/arm64/kernel/vdso/Makefile has already removed the option.

(
I probably should add more information to
https://maskray.me/blog/2022-08-21-glibc-and-dt-gnu-hash :)
)
