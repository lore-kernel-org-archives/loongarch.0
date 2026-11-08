Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794126415;
	b=tr5A+WJs0ATFlMTcQjZxr9zXNhgcccEnG6Utsvm5uWQ8nT6AswZeNXbr6VGZhXOzSXXy
	 vBi6u2AHs5CoRZ8OKN1rqd/Osi4EgmTjSNXfxesOnyOT6RFrm0dQKT3UufoprRiU6BZQM
	 pidNNmaNbRvKjr7mOfoPGvDnpDnCGzM3abH9LRhwTl2ULagzVxqhP0cSMgRMcc/uP+5Gn
	 krnWUOo3T6t8W9paPHTXTigryGUXySiYdWp0c5eXYMuJhbGH8ki42PuFZG4o18U+lW9NH
	 +0uUkauZFuE8LCsgIAO6/FMOX83ON5U4Wobkva8C71kH/5lvq1B7xSghDPUUIQhuXuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794126415;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=p4OcSAvcvQKsjkU4ru+MvGNBWR2vHDxkyHmPg+JgZAI=;
	b=xtu1cpyPfPz6jqTpzzL13yuSeMEebAX0H5X4zzEzVDvWW/NzOPauCKWr9CI5U8i1OFSP
	 U4TsYJmo4yGsjiEpUUY4vwSzS0IGTQRBbbZrThHjbecw2yJjOaIJ3307mG3tPfAMgsOHf
	 +Vy+7K9p6V93/+IyYCIB3VpVMLQeOW+1v88hUkOnqS1R3BAwvPNItDADr5XgzrUa4k0yi
	 4V+VSZIOAGccRAAR35jqBFkB9+2pYM9nJT08Zjbd5Jv0bTtFZSLuXo61MMHt9Syg2wPy+
	 5y9TKQQtO3Yzo+Cu6j/IoDeIFnC9iutWjjmHNvNe39X+2vIeir39daU0dozKciPFdAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oq7mXUay;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94EB8606A320
	for <loongarch@lists.linux.dev>; Sun,  8 Nov 2026 08:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oq7mXUay
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28B301F008A7
	for <loongarch@lists.linux.dev>; Sun,  8 Nov 2026 08:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794126415;
	bh=p4OcSAvcvQKsjkU4ru+MvGNBWR2vHDxkyHmPg+JgZAI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Oq7mXUayhQTDePVUjrfThAEG1V7e8Y9jHk7AEkIGpjTfkJ74OuNKPp2JUR7gO6tjO
	 gK8sjs0oIZYhKDO6UAQr8qwL/YVbv56dLKzgtpDd7Ua8fA1u/US0Lt6Z7nqH5rpA4e
	 /IbdbI//jYesPChnrmZ3wF53SnhaOo9IpQJRu/gjg2BgoiNbccUOk2BlPXeSHLr2bJ
	 W+AKvkmtSnFlVXENHlF79lpkVV5/tb9l3kXutdiZPrBwEESDq5a9oN/zvlNORF7AkL
	 cVdyb9kv+rjJRYxLzhIkLE1kUTtu2vZibPxBIDsg25TnlJwIVxiE8uI0sMGN6rYzyO
	 hqnXX48hdsztA==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so249439a12.3
        for <loongarch@lists.linux.dev>; Sun, 08 Nov 2026 00:26:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFNu+AxOpWSCsKwAAw/gpg3XeiPM0++7rLakfd8/Giy+WsycaVdCZ0D5VJs9321xq1t0lJ5iJ3h6W0=@lists.linux.dev
X-Gm-Message-State: APuU4Z82XT9OWvaTXsGjdJNSa5hAqqBbkbdPBDmXyEuDg7f1fSr59uwO
	3RoVF6mFi4fs/wM5TltkVogBpuO5J+OdCJpqn1yK4OJrHp33UWjbumxACjl7y6NEytXm42k5lqc
	IFwSBI4pSxylYFQsL02lquhCL8M7zWEg=
X-Received: by 2002:a05:6402:1ecc:b0:6b7:1c:eaf2 with SMTP id
 4fb4d7f45d1cf-6b7224041dfmr591123a12.7.1794126413758; Sun, 08 Nov 2026
 00:26:53 -0800 (PST)
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261029172956.20791-1-dongtai.guo@linux.dev> <20261029172956.20791-6-dongtai.guo@linux.dev>
 <aux9Hm0QFJLUDPWv@kernel.org> <CAAhV-H7Dsnz03iXChzE6nYM2cs+D6fdDFiWrDxX5jM13kYL6HA@mail.gmail.com>
 <auypq8_7T-vml5_B@kernel.org> <CAAhV-H6aO_QNEzV-r6+FbNa=9EUQgv1vH0ET-ETXAH5x6oQGjA@mail.gmail.com>
 <avAvdiYY7SJ_Gfwt@kernel.org>
In-Reply-To: <avAvdiYY7SJ_Gfwt@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 8 Nov 2026 16:26:41 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5q2SiDJC+ZSA4F7kw2vO=Y+c5J-aNg=PNMoh_CZ7qWdg@mail.gmail.com>
X-Gm-Features: AclHuK9UKAm9d_ZAky8YF1Z-Jn3w5G8u3fB621EiI1G-bSq5xcRQq5mtls0NIdA
Message-ID: <CAAhV-H5q2SiDJC+ZSA4F7kw2vO=Y+c5J-aNg=PNMoh_CZ7qWdg@mail.gmail.com>
Subject: Re: [PATCH v6 5/8] LoongArch: Allow memblock arrays to resize
To: Mike Rapoport <rppt@kernel.org>
Cc: George Guo <dongtai.guo@linux.dev>, pasha.tatashin@soleen.com, pratyush@kernel.org, 
	ardb@kernel.org, shuah@kernel.org, ilias.apalodimas@linaro.org, 
	akpm@linux-foundation.org, baoquan.he@linux.dev, ruirui.yang@linux.dev, 
	guodongtai@kylinos.cn, kernel@xen0n.name, graf@amazon.com, 
	liukexin@kylinos.cn, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kexec@lists.infradead.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-efi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 4:14=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wrot=
e:
>
> On Fri, Nov 06, 2026 at 10:35:01PM +0800, Huacai Chen wrote:
> > On Fri, Nov 6, 2026 at 12:07=E2=80=AFAM Mike Rapoport <rppt@kernel.org>=
 wrote:
> > >
> > > On Thu, Nov 05, 2026 at 11:07:01PM +0800, Huacai Chen wrote:
> > > > Hi, Mike,
> > > >
> > > > On Thu, Nov 5, 2026 at 8:57=E2=80=AFPM Mike Rapoport <rppt@kernel.o=
rg> wrote:
> > > > >
> > > > > On Fri, Oct 30, 2026 at 02:29:52AM +0900, George Guo wrote:
> > > > > > From: George Guo <guodongtai@kylinos.cn>
> > > > > >
> > > > > > LoongArch never calls memblock_allow_resize(), so the reserved =
region
> > > > > > array cannot grow beyond INIT_MEMBLOCK_RESERVED_REGIONS entries
> > > > > > (INIT_MEMBLOCK_REGIONS + NR_CPUS).
> > > > >
> > > > > This might be something to fix independent of KHO.
> > > > >
> > > > > Huacai,
> > > > >
> > > > > What's the reason LoongArch never enables memblock resizing and w=
hy it
> > > > > defines INIT_MEMBLOCK_RESERVED_REGIONS to include NR_CPUS?
> > > > At first we didn't define INIT_MEMBLOCK_RESERVED_REGIONS, then we g=
ot
> > > > boot failures on a 128-cores machine, so define it, and the value i=
s
> > > > similar to arm64.
> > >
> > > AFAIR, arm64 had to reserve some per cpu data before they could enabl=
e
> > > memblock resizing, so they had to make it static.
> > LoongArch is similar, so below 64-cores machine has no problem.
> >
> > >
> > > > The reason LoongArch never enables memblock resizing is because the=
 mm
> > > > code is derived from MIPS, and MIPS never enables it.
> > >
> > > If that's the only reason, you might want to revisit that :)
> > Yes, it seems we need memblock_allow_resize(), but maybe it is better
> > to bring back paging_init()? Most other archs call
> > memblock_allow_resize() in paging_init().
>
> paging_init() is a historical relict that hugely misnamed everywhere :)
>
> I think platform_init() should be fine.
If paging_init() is unnecessary, then arch_mem_init() is better than
platform_init(), at least the name is better.

Huacai

>
> As far as I can tell, by the time platform_init() calls init_numa_memory(=
),
> all memory reservations that must happen before any memblock allocations
> are done.
>
> > Huacai
>
> --
> Sincerely yours,
> Mike.
