Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71CF194C96
	for <loongarch@lists.linux.dev>; Thu, 18 Apr 2024 21:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713474116; cv=none; b=a0IzK+N+IaiC+J7gbvX0F5S5U7q1UwOBmsnVC3qOY2ubkKkSrKp12XHNKjF4G+c33+L/43HmAzLLsbWTd2ZNT18McVJ+ecX5Y0WjKyXltK+EvGAxT6H71z358DphJxnnWdPzZBiE49KOEZclEtekL8kxBo439EqDHz0+DOGSAMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713474116; c=relaxed/simple;
	bh=Q9xFEu3Y5LoeO0EqCkhUGHL0dsvPtZI4/AmKYvf5MnY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NswIbUAWwtOTDHLtoPxpvUFQiyFpkXqfAB/I1+Ite6UkCPfDYhkhvjJ5tjx6FbWIGsCq7d1W2i3bJlESsjtXs8r9huNQa9gYKf5u8Tc0VyOCkuR2facov90igWsy4pK3wBH8MMPG4l7gFv6QjYYA3vTEftR0SnJ8RE4p4bTRTUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LKsu6wgw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LKsu6wgw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E9B0C116B1
	for <loongarch@lists.linux.dev>; Thu, 18 Apr 2024 21:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713474116;
	bh=Q9xFEu3Y5LoeO0EqCkhUGHL0dsvPtZI4/AmKYvf5MnY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LKsu6wgwztewDd1Kf4NCYPGtYXsdZ+ofFTa2d1MI2zHPuKQq+mmWhhJ/cfOoO74/D
	 CmcZP1gphR1rk0/C2WrZMmDohWk9TLfoE/BVlmPcx4Ya9rM6Nh6AU0ABzg9gD2wvws
	 H60UGmuK3KY+NjPIGsNka51Re3XwprsD1pbbtq74ctVkAghiYQUsQoRN8cLIcXPPsL
	 rXx3eFrMppxOnjZtTYcB0+vT04YNLcaQFvbo1fn264bSOiuX8e1yptQTDfZHVYZ58/
	 0oeaQEoE1JgibuYG0nL+yludx9odg4AlyJea9d8FGku7Y1tGZRmj1BnxpJESiJFknk
	 jlSY0S/C8n1Cg==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5193363d255so1681038e87.3
        for <loongarch@lists.linux.dev>; Thu, 18 Apr 2024 14:01:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXw5NjFOzjCGB5ifm8zBVaLpKFfBTTslpbwmGEiRVG9wX2XGwuC45KQTar8Yqkl5SecawC3ykACl6Q11HZ+JXZEo9nLo5E9cQh1
X-Gm-Message-State: AOJu0Yzn7D5n2scI1vvrZV12qRDBmyf+3/er67AbxSlmub8DHy6NTBDn
	UldlJrmUqxIb2Y9VazL8zaIqjWO68VesbUVv+B4NbiCyo9aK2xAuKNjTl57AcSre/1KFXjLqbZs
	I8phWejjiDQ1chohZd56rCTbFzl8=
X-Google-Smtp-Source: AGHT+IHNxy9sJsnZs3KQVfU0+czeg8tBpsYhbjwNsSaDNt4tlgSyRo9Mz2ssjEN7kjA5vVRJEg5DihQkgyMA2Jl/jC4=
X-Received: by 2002:a05:6512:1251:b0:516:cec0:1fc0 with SMTP id
 fb17-20020a056512125100b00516cec01fc0mr104453lfb.63.1713474094462; Thu, 18
 Apr 2024 14:01:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240411160051.2093261-1-rppt@kernel.org> <20240411160051.2093261-6-rppt@kernel.org>
 <20240415075241.GF40213@noisy.programming.kicks-ass.net> <Zh1lnIdgFeM1o8S5@FVFF77S0Q05N.cambridge.arm.com>
 <Zh4nJp8rv1qRBs8m@kernel.org> <CAPhsuW6Pbg2k_Gu4dsBx+H8H5XCHvNdtEZJBPiG_eT0qqr9D1w@mail.gmail.com>
 <ZiE91CJcNw7gBj9g@kernel.org> <CAPhsuW4au6v8k8Ab7Ff6Yj64rGvZ7wkz=Xrgh8ZZtLyscpChqQ@mail.gmail.com>
 <ZiFd567L4Zzm2okO@kernel.org>
In-Reply-To: <ZiFd567L4Zzm2okO@kernel.org>
From: Song Liu <song@kernel.org>
Date: Thu, 18 Apr 2024 14:01:22 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5SL4_=ZXdHZV8o0KS+5Vf25UMvEKhRgFQLioFtf2pgoQ@mail.gmail.com>
Message-ID: <CAPhsuW5SL4_=ZXdHZV8o0KS+5Vf25UMvEKhRgFQLioFtf2pgoQ@mail.gmail.com>
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

On Thu, Apr 18, 2024 at 10:54=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wr=
ote:
>
> On Thu, Apr 18, 2024 at 09:13:27AM -0700, Song Liu wrote:
> > On Thu, Apr 18, 2024 at 8:37=E2=80=AFAM Mike Rapoport <rppt@kernel.org>=
 wrote:
> > > > >
> > > > > I'm looking at execmem_types more as definition of the consumers,=
 maybe I
> > > > > should have named the enum execmem_consumer at the first place.
> > > >
> > > > I think looking at execmem_type from consumers' point of view adds
> > > > unnecessary complexity. IIUC, for most (if not all) archs, ftrace, =
kprobe,
> > > > and bpf (and maybe also module text) all have the same requirements=
.
> > > > Did I miss something?
> > >
> > > It's enough to have one architecture with different constrains for kp=
robes
> > > and bpf to warrant a type for each.
> >
> > AFAICT, some of these constraints can be changed without too much work.
>
> But why?
> I honestly don't understand what are you trying to optimize here. A few
> lines of initialization in execmem_info?

IIUC, having separate EXECMEM_BPF and EXECMEM_KPROBE makes it
harder for bpf and kprobe to share the same ROX page. In many use cases,
a 2MiB page (assuming x86_64) is enough for all BPF, kprobe, ftrace, and
module text. It is not efficient if we have to allocate separate pages for =
each
of these use cases. If this is not a problem, the current approach works.

Thanks,
Song
