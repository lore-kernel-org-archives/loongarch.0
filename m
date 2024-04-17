Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9907086647
	for <loongarch@lists.linux.dev>; Wed, 17 Apr 2024 23:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713396803; cv=none; b=J/Sa6gDrpUh8OO2dtKgrrQv0fMHXCCJ88NDdz4k/xiSPzkTpdIyTWiE1ku/BMIHcxa+I5wQClT9Gay3cVZQ6QyXZIjlwiPSOkxXGJrrbjhQ3S6hhWDglRE1i1WUe+qiKWlo287xwE4WBnnFDn1mx914cWuCR6dSXWMVBjvT4nmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713396803; c=relaxed/simple;
	bh=UVEJ59zmDjoboUO24xHkWUbtsfOaV4nMW96i+du0QWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mhfz/6e6WHvOWkwl1AKsJeeJ0wkuSaiZ3tY+PzNStNinMf7svaM/WOCsAefWCwmDI0Fk1aXPE1cmlILyOzXIFCOfiRb1aTVRD425Cqz55EFkKRNoHb4JffUNeAeFn1Xns8/pPI9zJJfcBdRpUtvP1xLIEMr9aaY9mExOZVCTf58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ctJEl6Ox; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ctJEl6Ox"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19BDEC116B1
	for <loongarch@lists.linux.dev>; Wed, 17 Apr 2024 23:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713396803;
	bh=UVEJ59zmDjoboUO24xHkWUbtsfOaV4nMW96i+du0QWo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ctJEl6OxbGN0Xa/zKZdRG4cmrNUa++7Za0jkJ76ZtS4yvfvZKwVdaTK6WvFe8qq4C
	 3ubstYMLecmqUf7Ha1ZgPPuqdQCxKklwq+lyjmMnjegcfFrb3zYZZ8krQoi+g2yTe3
	 1vkOF62ScCXzORqJTdBDsldzwZZCh3zMfKFWBWNgiEhQia++pLQr+3c9KsBx6W/8us
	 IgbFDf2xdbJbGhNFpf1JmYC0vs8MUefllz7TMoEY7laoJOdYwDEFsi99WbLhKzvKWl
	 5yYEVDRugTnRDaLu4cR88b/98Fy3f0gn/lzUqzLNogkEZMT9UHZdN790vLRHsHK2EP
	 N1ddMLXRw9eYw==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-56e1baf0380so303074a12.3
        for <loongarch@lists.linux.dev>; Wed, 17 Apr 2024 16:33:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUepr19UMVkb0gibORCq/LL/bg70YWHIoGL+lv9mgy7p+24xeMKVbSWms/7y+HFv3uuObgLGh1vE7+RkmS2mnZ1+Ypjr3l7P3GC
X-Gm-Message-State: AOJu0YyEqM0p7nmlKOmAV79LlJskoUYa0U2ZFBm/46tYQSjDNea49RdB
	a1v1bp6k0DmgOmCu1IQhRJRWah5leSe9BqewJ5vhMB9b6t01kFmMHWg5g32RdHVymLzUoiGCfsq
	8FPNQJi/w7dPZfY00qzCdOYxVycU=
X-Google-Smtp-Source: AGHT+IEHuhOgcI3i5xgKWDt/RXWKyZ/pV78ei3ikSzZKT8X4nbojHe59GGn0FqOU5qFFQVvC8y10X+N0SPB8sxHbE0Q=
X-Received: by 2002:a05:6512:3184:b0:519:b95:22b5 with SMTP id
 i4-20020a056512318400b005190b9522b5mr446945lfe.51.1713396780753; Wed, 17 Apr
 2024 16:33:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240411160051.2093261-1-rppt@kernel.org> <20240411160051.2093261-6-rppt@kernel.org>
 <20240415075241.GF40213@noisy.programming.kicks-ass.net> <Zh1lnIdgFeM1o8S5@FVFF77S0Q05N.cambridge.arm.com>
 <Zh4nJp8rv1qRBs8m@kernel.org>
In-Reply-To: <Zh4nJp8rv1qRBs8m@kernel.org>
From: Song Liu <song@kernel.org>
Date: Wed, 17 Apr 2024 16:32:49 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6Pbg2k_Gu4dsBx+H8H5XCHvNdtEZJBPiG_eT0qqr9D1w@mail.gmail.com>
Message-ID: <CAPhsuW6Pbg2k_Gu4dsBx+H8H5XCHvNdtEZJBPiG_eT0qqr9D1w@mail.gmail.com>
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

On Tue, Apr 16, 2024 at 12:23=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wr=
ote:
>
> On Mon, Apr 15, 2024 at 06:36:39PM +0100, Mark Rutland wrote:
> > On Mon, Apr 15, 2024 at 09:52:41AM +0200, Peter Zijlstra wrote:
> > > On Thu, Apr 11, 2024 at 07:00:41PM +0300, Mike Rapoport wrote:
> > > > +/**
> > > > + * enum execmem_type - types of executable memory ranges
> > > > + *
> > > > + * There are several subsystems that allocate executable memory.
> > > > + * Architectures define different restrictions on placement,
> > > > + * permissions, alignment and other parameters for memory that can=
 be used
> > > > + * by these subsystems.
> > > > + * Types in this enum identify subsystems that allocate executable=
 memory
> > > > + * and let architectures define parameters for ranges suitable for
> > > > + * allocations by each subsystem.
> > > > + *
> > > > + * @EXECMEM_DEFAULT: default parameters that would be used for typ=
es that
> > > > + * are not explcitly defined.
> > > > + * @EXECMEM_MODULE_TEXT: parameters for module text sections
> > > > + * @EXECMEM_KPROBES: parameters for kprobes
> > > > + * @EXECMEM_FTRACE: parameters for ftrace
> > > > + * @EXECMEM_BPF: parameters for BPF
> > > > + * @EXECMEM_TYPE_MAX:
> > > > + */
> > > > +enum execmem_type {
> > > > + EXECMEM_DEFAULT,
> > > > + EXECMEM_MODULE_TEXT =3D EXECMEM_DEFAULT,
> > > > + EXECMEM_KPROBES,
> > > > + EXECMEM_FTRACE,
> > > > + EXECMEM_BPF,
> > > > + EXECMEM_TYPE_MAX,
> > > > +};
> > >
> > > Can we please get a break-down of how all these types are actually
> > > different from one another?
> > >
> > > I'm thinking some platforms have a tiny immediate space (arm64 comes =
to
> > > mind) and has less strict placement constraints for some of them?
> >
> > Yeah, and really I'd *much* rather deal with that in arch code, as I ha=
ve said
> > several times.
> >
> > For arm64 we have two bsaic restrictions:
> >
> > 1) Direct branches can go +/-128M
> >    We can expand this range by having direct branches go to PLTs, at a
> >    performance cost.
> >
> > 2) PREL32 relocations can go +/-2G
> >    We cannot expand this further.
> >
> > * We don't need to allocate memory for ftrace. We do not use trampoline=
s.
> >
> > * Kprobes XOL areas don't care about either of those; we don't place an=
y
> >   PC-relative instructions in those. Maybe we want to in future.
> >
> > * Modules care about both; we'd *prefer* to place them within +/-128M o=
f all
> >   other kernel/module code, but if there's no space we can use PLTs and=
 expand
> >   that to +/-2G. Since modules can refreence other modules, that ends u=
p
> >   actually being halved, and modules have to fit within some 2G window =
that
> >   also covers the kernel.

Is +/- 2G enough for all realistic use cases? If so, I guess we don't
really need
EXECMEM_ANYWHERE below?

> >
> > * I'm not sure about BPF's requirements; it seems happy doing the same =
as
> >   modules.
>
> BPF are happy with vmalloc().
>
> > So if we *must* use a common execmem allocator, what we'd reall want is=
 our own
> > types, e.g.
> >
> >       EXECMEM_ANYWHERE
> >       EXECMEM_NOPLT
> >       EXECMEM_PREL32
> >
> > ... and then we use those in arch code to implement module_alloc() and =
friends.
>
> I'm looking at execmem_types more as definition of the consumers, maybe I
> should have named the enum execmem_consumer at the first place.

I think looking at execmem_type from consumers' point of view adds
unnecessary complexity. IIUC, for most (if not all) archs, ftrace, kprobe,
and bpf (and maybe also module text) all have the same requirements.
Did I miss something?

IOW, we have

enum execmem_type {
        EXECMEM_DEFAULT,
        EXECMEM_TEXT,
        EXECMEM_KPROBES =3D EXECMEM_TEXT,
        EXECMEM_FTRACE =3D EXECMEM_TEXT,
        EXECMEM_BPF =3D EXECMEM_TEXT,      /* we may end up without
_KPROBE, _FTRACE, _BPF */
        EXECMEM_DATA,  /* rw */
        EXECMEM_RO_DATA,
        EXECMEM_RO_AFTER_INIT,
        EXECMEM_TYPE_MAX,
};

Does this make sense?

Thanks,
Song
