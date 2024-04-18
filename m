Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFDE16C68F
	for <loongarch@lists.linux.dev>; Thu, 18 Apr 2024 16:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713456841; cv=none; b=HA3tvnLr+Zrbli3uqO35FQyhWBA77cqzoF4hRfb+ckmQmFR8hZNTEEf5ZELFiUaF3RGkeJbWT/J1eWKui0XXh+xEZinV6yHOUsbMBuibpY+yfJ/lHk9AibGdBOuuh13hV+qeghZWhiwembj2Ey147yDK0iJv60/T1IZZCqVuIec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713456841; c=relaxed/simple;
	bh=q/TFlw8SQh+Cko4nU/ng2SJ+spicGdHxGtHPBf/Abnk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eloNRvJs6ihC3oMbBcbEw7ett2WcZPnl2JdtJwx1oQzakZxI6vNdmqu/597EpdzbdiPCyeqZa2lcNocd5aFiRg6QaQNrt54EiS2AabO9NnXPo5MIpL+9WfeJcXZP3b9/77cBRbbKicLTwaaiFqiakvrYCOJKEUV6I4k+LC1Aj5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QKWF8JTq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QKWF8JTq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BF2CC113CC
	for <loongarch@lists.linux.dev>; Thu, 18 Apr 2024 16:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713456841;
	bh=q/TFlw8SQh+Cko4nU/ng2SJ+spicGdHxGtHPBf/Abnk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QKWF8JTqm58INLwGllp0FpCdKA+4HVthmQGojPwlLwz/CzvDupBln2tDa0JxxVT3h
	 9I7DpSmJ8lOrojowdqSiCh2qcPLKXHcJWahr/LsRKoimlCRLEGzrENrG3o9kFH+usO
	 i5Uoall6+ng5DIWhZcIBvHqNjg1V9YxU/O3gqnfaquqVpvjeUa1Ln7x3DimeC08fFd
	 hg+ro7zsoce8fMGXC9TZUX4AVwsN42ulovUJae+4eeUwyJYlzcMgZJLHMlMif6hKb8
	 XAy19kJzQAz55LYLEJJVfb5Ee/I081i7hdGhY0gcdzrCOy2SjjHFiLjMG16M8+ZMXw
	 edLWR6CS/8U/g==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d88a869ce6so13960831fa.3
        for <loongarch@lists.linux.dev>; Thu, 18 Apr 2024 09:14:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWv5S2F7rV5yZNAGmreDcEsuG1wAjtuCldaLkHx45bClQL7LCGyfoK8kkBxsWTVtJViaw9Ak2Z77tNjUVMByNn40Ixw6UZqflrE
X-Gm-Message-State: AOJu0Yyut2r8uHvfSWiRIKJfgWFqbxE5XWFQjHM/dF9GEpJlpq50U93M
	ZcuYEThxvwh6fFgDFRollQmvQbDbZYKzzEVXP+Y/v/26ybC44nmGp46wcp7/8mOCenDt6W3t0vc
	z0eev6bCVqBFi/U2uCykLNGpbdfg=
X-Google-Smtp-Source: AGHT+IHLiDWbpJNv5cpg7tSucX1RJbILlT9QE6EE0zaOt0RsDuLJ8JfO9fqfVmmivnqe0091gRHYHRJJ+tsSYBR5kLA=
X-Received: by 2002:ac2:5fad:0:b0:519:569b:361b with SMTP id
 s13-20020ac25fad000000b00519569b361bmr1973077lfe.63.1713456819439; Thu, 18
 Apr 2024 09:13:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240411160051.2093261-1-rppt@kernel.org> <20240411160051.2093261-6-rppt@kernel.org>
 <20240415075241.GF40213@noisy.programming.kicks-ass.net> <Zh1lnIdgFeM1o8S5@FVFF77S0Q05N.cambridge.arm.com>
 <Zh4nJp8rv1qRBs8m@kernel.org> <CAPhsuW6Pbg2k_Gu4dsBx+H8H5XCHvNdtEZJBPiG_eT0qqr9D1w@mail.gmail.com>
 <ZiE91CJcNw7gBj9g@kernel.org>
In-Reply-To: <ZiE91CJcNw7gBj9g@kernel.org>
From: Song Liu <song@kernel.org>
Date: Thu, 18 Apr 2024 09:13:27 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4au6v8k8Ab7Ff6Yj64rGvZ7wkz=Xrgh8ZZtLyscpChqQ@mail.gmail.com>
Message-ID: <CAPhsuW4au6v8k8Ab7Ff6Yj64rGvZ7wkz=Xrgh8ZZtLyscpChqQ@mail.gmail.com>
Subject: Re: [PATCH v4 05/15] mm: introduce execmem_alloc() and execmem_free()
To: Mike Rapoport <rppt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Bjorn Topel <bjorn@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, 
	Donald Dutile <ddutile@redhat.com>, Eric Chanudet <echanude@redhat.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Luis Chamberlain <mcgrof@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nadav Amit <nadav.amit@gmail.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Puranjay Mohan <puranjay12@gmail.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Russell King <linux@armlinux.org.uk>, 
	Steven Rostedt <rostedt@goodmis.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, bpf@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, linux-modules@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2024 at 8:37=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
[...]
> >
> > Is +/- 2G enough for all realistic use cases? If so, I guess we don't
> > really need
> > EXECMEM_ANYWHERE below?
> >
> > > >
> > > > * I'm not sure about BPF's requirements; it seems happy doing the s=
ame as
> > > >   modules.
> > >
> > > BPF are happy with vmalloc().
> > >
> > > > So if we *must* use a common execmem allocator, what we'd reall wan=
t is our own
> > > > types, e.g.
> > > >
> > > >       EXECMEM_ANYWHERE
> > > >       EXECMEM_NOPLT
> > > >       EXECMEM_PREL32
> > > >
> > > > ... and then we use those in arch code to implement module_alloc() =
and friends.
> > >
> > > I'm looking at execmem_types more as definition of the consumers, may=
be I
> > > should have named the enum execmem_consumer at the first place.
> >
> > I think looking at execmem_type from consumers' point of view adds
> > unnecessary complexity. IIUC, for most (if not all) archs, ftrace, kpro=
be,
> > and bpf (and maybe also module text) all have the same requirements.
> > Did I miss something?
>
> It's enough to have one architecture with different constrains for kprobe=
s
> and bpf to warrant a type for each.
>

AFAICT, some of these constraints can be changed without too much work.

> Where do you see unnecessary complexity?
>
> > IOW, we have
> >
> > enum execmem_type {
> >         EXECMEM_DEFAULT,
> >         EXECMEM_TEXT,
> >         EXECMEM_KPROBES =3D EXECMEM_TEXT,
> >         EXECMEM_FTRACE =3D EXECMEM_TEXT,
> >         EXECMEM_BPF =3D EXECMEM_TEXT,      /* we may end up without
> > _KPROBE, _FTRACE, _BPF */
> >         EXECMEM_DATA,  /* rw */
> >         EXECMEM_RO_DATA,
> >         EXECMEM_RO_AFTER_INIT,
> >         EXECMEM_TYPE_MAX,
> > };
> >
> > Does this make sense?
>
> How do you suggest to deal with e.g. riscv that has separate address spac=
es
> for modules, kprobes and bpf?

IIUC, modules and bpf use the same address space on riscv, while kprobes us=
e
vmalloc address. I haven't tried this yet, but I think we can let
kprobes use the
same space as modules and bpf, which is:

ffffffff00000000 |  -4     GB | ffffffff7fffffff |    2 GB | modules, BPF

Did I get this right?

Thanks,
Song
