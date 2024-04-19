Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FB2137C32
	for <loongarch@lists.linux.dev>; Fri, 19 Apr 2024 17:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713547993; cv=none; b=ulqaRtBgUtTiBVkeVzcSfEa+BTNkFHDB3yaBxSzkzMOkw2SaLiOjrnwFnlJV4LzCZf3IJAhuJRyOYra1iwUavox4pUxs1OLtOp0U8JJoKvDH/HFUEDUhiFPwePA3WViMFNcsd4vI8cN3Q9EK+U30qDfKg97MiGpPo4e0IzGYLbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713547993; c=relaxed/simple;
	bh=sVegppIF/niXLnTLCcBWzkxa2L1ow1Dt9dF+ATN6lsk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SZJF1ajaSEUuMtCXoSn6Fl8NwvtKwaQ27P7kEnKy9s1Au4+CFG/h5V/DfZ1L/Tysyp76l4+9MKf1KsYN0IHF3xDkqeoX3chV5ScZ2ieWuH2D9u9Rzm49Su1L0g+LHJpdkzZsuh88saBYHwG5PGuOBP7sEmUlK2uKIZ8Ef4gygJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hz5HA12m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hz5HA12m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BAAAC116B1
	for <loongarch@lists.linux.dev>; Fri, 19 Apr 2024 17:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713547992;
	bh=sVegppIF/niXLnTLCcBWzkxa2L1ow1Dt9dF+ATN6lsk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hz5HA12mGjDKfqVeo5OEuWAXF7TDIh13CeKJ5HkGMfIHVK1Eso9dNbU7tD++O5rKF
	 0sUzDpSaXME0yKE/l8cgrQWT0Z2sDz6N+xBa5e2JQHDmU99ok3qp4SzMoIVGoVpEwf
	 FexKUZUXH+JNYzZwL8sv4Ui8jBZVcdQT31/FMgdQ0m5wu28goRuvm3B21LF/otZU2O
	 XoCzXXYsLp/0EakVkhWxF02OBZtpBRVRnjNTzYgCBl9NhL3X5Jwa9LaLOt0hsxr64Z
	 QzmDAxTOkYMWvKL9laT9o+PUmzjOHAVeOdb0I3eJy8krCoZrJBeqor627d4pzQ8XKs
	 l7bBiZSmzj0Uw==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a53f131d9deso267913266b.3
        for <loongarch@lists.linux.dev>; Fri, 19 Apr 2024 10:33:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUbJ9sDLJAMwcw793rz1rsYcXlOeLB3iNOdjnQMEysigBwsgwtAb3PNXW5FaB02xAX6Gs9mCftbd3ppjnqf48xvUE9JsrOBGVvn
X-Gm-Message-State: AOJu0Yz3LwMjgB0/TgR+z0qBdN6GgTzIshFOTqA0yI1v45IGJ+55N61I
	qA9gdBQ6X2TgTGVJZC/a+roX4Mj97EtR00HPFqPKWdwyDE9q+uvIC8QwaqGOgJkgK2nRNMnIQiA
	/6+O8vnv8OWV8ZL6VuyOn7mxLJnc=
X-Google-Smtp-Source: AGHT+IFQL0ZIY0ZfQ4j9vl7SSSW0Y7vt5IE5s4aAkthQ3+dt0vC//uVhsYgqRpBdUKo6ap4ecg5hjMNFhNToQ1hMBQU=
X-Received: by 2002:ac2:5a1e:0:b0:519:296e:2c80 with SMTP id
 q30-20020ac25a1e000000b00519296e2c80mr1475078lfn.15.1713547970497; Fri, 19
 Apr 2024 10:32:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240415075241.GF40213@noisy.programming.kicks-ass.net>
 <Zh1lnIdgFeM1o8S5@FVFF77S0Q05N.cambridge.arm.com> <Zh4nJp8rv1qRBs8m@kernel.org>
 <CAPhsuW6Pbg2k_Gu4dsBx+H8H5XCHvNdtEZJBPiG_eT0qqr9D1w@mail.gmail.com>
 <ZiE91CJcNw7gBj9g@kernel.org> <CAPhsuW4au6v8k8Ab7Ff6Yj64rGvZ7wkz=Xrgh8ZZtLyscpChqQ@mail.gmail.com>
 <ZiFd567L4Zzm2okO@kernel.org> <CAPhsuW5SL4_=ZXdHZV8o0KS+5Vf25UMvEKhRgFQLioFtf2pgoQ@mail.gmail.com>
 <ZiIVVBgaDN4RsroT@kernel.org> <CAPhsuW7WoU+a46FhqqH8f-3=ehxeD4wSgKDWegMin1pT49OSWw@mail.gmail.com>
 <ZiKjmaDgz_56ovbv@kernel.org>
In-Reply-To: <ZiKjmaDgz_56ovbv@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 19 Apr 2024 10:32:39 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7Nj1Sa_9xQtTgHz9AmX39zdh2x2COqA-qmkfpfX9hNWw@mail.gmail.com>
Message-ID: <CAPhsuW7Nj1Sa_9xQtTgHz9AmX39zdh2x2COqA-qmkfpfX9hNWw@mail.gmail.com>
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

On Fri, Apr 19, 2024 at 10:03=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wr=
ote:
[...]
> > >
> > > [1] https://lore.kernel.org/all/20240411160526.2093408-1-rppt@kernel.=
org
> >
> > For the ROX to work, we need different users (module text, kprobe, etc.=
) to have
> > the same execmem_range. From [1]:
> >
> > static void *execmem_cache_alloc(struct execmem_range *range, size_t si=
ze)
> > {
> > ...
> >        p =3D __execmem_cache_alloc(size);
> >        if (p)
> >                return p;
> >       err =3D execmem_cache_populate(range, size);
> > ...
> > }
> >
> > We are calling __execmem_cache_alloc() without range. For this to work,
> > we can only call execmem_cache_alloc() with one execmem_range.
>
> Actually, on x86 this will "just work" because everything shares the same
> address space :)
>
> The 2M pages in the cache will be in the modules space, so
> __execmem_cache_alloc() will always return memory from that address space=
.
>
> For other architectures this indeed needs to be fixed with passing the
> range to __execmem_cache_alloc() and limiting search in the cache for tha=
t
> range.

I think we at least need the "map to" concept (initially proposed by Thomas=
)
to get this work. For example, EXECMEM_BPF and EXECMEM_KPROBE
maps to EXECMEM_MODULE_TEXT, so that all these actually share
the same range.

Does this make sense?

Song
