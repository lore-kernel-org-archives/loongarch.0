Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879E117C9
	for <loongarch@lists.linux.dev>; Thu, 20 Apr 2023 08:36:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4094AC433EF
	for <loongarch@lists.linux.dev>; Thu, 20 Apr 2023 08:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681979792;
	bh=sEawzxBfsQuwG5y+dWimYLd+jqvDGsYfpjI5vDaYBwo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rhD901AskVduoiR8jcYbsoilkHhIk1c4/jP/wFnbyvv36qvRwDGSi7OUpBwRC7h6/
	 +AZG6cFijgToJPW3eE8jqG8GPzpxIhXpQjDDECrHmPHNnQzOIC1kvdM4lkzj5cMnWT
	 7MfLN9ICknt0WntJGXs0p6NYJ9oQJGsks0RhPluRmkH937JwBYsPu23MuwfJIB7YpE
	 KlsOTAgnTSnEFlKBxgTV9Z5+3NC9Nw//9GIysdvgVlajJwYiCweruqVMa40U6AZBVf
	 uI/m15v5uIl78su39Mzt/pyHa72rBIh8zSsFIFqRTDZNouBa7iZekaKyMdqVwDtQ7C
	 MNiwMW8KI7j0Q==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-94f7a0818aeso42725066b.2
        for <loongarch@lists.linux.dev>; Thu, 20 Apr 2023 01:36:32 -0700 (PDT)
X-Gm-Message-State: AAQBX9e0fliO6tHY1Y+A3TnS/kW+A/gjoCLBO83jXhtzC/5LTvrlm0Tn
	Gy1LZ3FcjMSfEcnTDGNAtORxZVCFZn2A+aB9yyI=
X-Google-Smtp-Source: AKy350bxtCS4gctVzwoYAwn8RttxXNaUcCxyBObX+0qpOY69mFfp6vG7+mFFoejUTKHevs8vn5LskFXb0d6Zi1C+KGY=
X-Received: by 2002:a05:6402:7c2:b0:508:4954:e30c with SMTP id
 u2-20020a05640207c200b005084954e30cmr1096793edy.11.1681979790467; Thu, 20 Apr
 2023 01:36:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230416173326.3995295-1-kernel@xen0n.name> <e593541e7995cc46359da3dd4eb3a69094e969e2.camel@xry111.site>
 <6ca642a9-62a6-00e5-39ac-f14ef36f6bdb@xen0n.name> <f54abfae989023fcfdabb4e9800a66847c357b85.camel@xry111.site>
In-Reply-To: <f54abfae989023fcfdabb4e9800a66847c357b85.camel@xry111.site>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 20 Apr 2023 16:36:17 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7zTjSsz=e+0r-9Z0KOF-Gxr-chXnVgWo+4eNA1ptWw1g@mail.gmail.com>
Message-ID: <CAAhV-H7zTjSsz=e+0r-9Z0KOF-Gxr-chXnVgWo+4eNA1ptWw1g@mail.gmail.com>
Subject: Re: [PATCH 0/2] LoongArch: Make bounds-checking instructions useful
To: Xi Ruoyao <xry111@xry111.site>
Cc: WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	WANG Xuerui <git@xen0n.name>, Eric Biederman <ebiederm@xmission.com>, 
	Al Viro <viro@zeniv.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, linux-api@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Xuerui,

I hope V2 can be applied cleanly without the patch series "LoongArch:
Better backtraces", thanks.

Huacai

On Mon, Apr 17, 2023 at 5:50=E2=80=AFPM Xi Ruoyao <xry111@xry111.site> wrot=
e:
>
> On Mon, 2023-04-17 at 15:54 +0800, WANG Xuerui wrote:
> > On 2023/4/17 14:47, Xi Ruoyao wrote:
> > > On Mon, 2023-04-17 at 01:33 +0800, WANG Xuerui wrote:
> > > > From: WANG Xuerui <git@xen0n.name>
> > > >
> > > > Hi,
> > > >
> > > > The LoongArch-64 base architecture is capable of performing
> > > > bounds-checking either before memory accesses or alone, with specia=
lized
> > > > instructions generating BCEs (bounds-checking error) in case of fai=
led
> > > > assertions (ISA manual Volume 1, Sections 2.2.6.1 [1] and 2.2.10.3 =
[2]).
> > > > This could be useful for managed runtimes, but the exception is not
> > > > being handled so far, resulting in SIGSYSes in these cases, which i=
s
> > > > incorrect and warrants a fix in itself.
> > > >
> > > > During experimentation, it was discovered that there is already UAP=
I for
> > > > expressing such semantics: SIGSEGV with si_code=3DSEGV_BNDERR. This=
 was
> > > > originally added for Intel MPX, and there is currently no user (!) =
after
> > > > the removal of MPX support a few years ago. Although the semantics =
is
> > > > not a 1:1 match to that of LoongArch, still it is better than
> > > > alternatives such as SIGTRAP or SIGBUS of BUS_OBJERR kind, due to b=
eing
> > > > able to convey both the value that failed assertion and the bound v=
alue.
> > > >
> > > > This patch series implements just this approach: translating BCEs i=
nto
> > > > SIGSEGVs with si_code=3DSEGV_BNDERR, si_value set to the offending =
value,
> > > > and si_lower and si_upper set to resemble a range with both lower a=
nd
> > > > upper bound while in fact there is only one.
> > > >
> > > > The instructions are not currently used anywhere yet in the fledgli=
ng
> > > > LoongArch ecosystem, so it's not very urgent and we could take the =
time
> > > > to figure out the best way forward (should SEGV_BNDERR turn out not
> > > > suitable).
> > >
> > > I don't think these instructions can be used in any systematic way
> > > within a Linux userspace in 2023.  IMO they should not exist in
> > > LoongArch at all because they have all the same disadvantages of Inte=
l
> > > MPX; MPX has been removed by Intel in 2019, and LoongArch is designed
> > > after 2019.
> >
> > Well, the difference is IMO significant enough to make LoongArch
> > bounds-checking more useful, at least for certain use cases. For
> > example, the bounds were a separate register bank in Intel MPX, but in
> > LoongArch they are just values in GPRs. This fits naturally into
> > JIT-ting or other managed runtimes (e.g. Go) whose slice indexing ops
> > already bounds-check with a temporary register per bound anyway, so it'=
s
> > just a matter of this snippet (or something like it)
> >
> > - calculate element address
> > - if address < base: goto fail
> > - load/calculate upper bound
> > - if address >=3D upper bound: goto fail
> > - access memory
> >
> > becoming
> >
> > - calculate element address
> > - asrtgt address, base - 1
> > - load/calculate upper bound
> > - {ld,st}le address, upper bound
> >
> > then in SIGSEGV handler, check PC to associate the signal back with the
> > exact access op;
>
> I remember using the signal handler for "usual" error handling can be a
> very bad idea but I can't remember where I've read about it.  Is there
> any managed environments doing so in practice?
>
> If we redefine new_ldle/new_stle as "if [[likely]] the address is in-
> bound, do the load/store and skip the next instruction; otherwise do
> nothing", we can say:
>
> blt        address, base, 1f
> new_ldle.d rd, address, upperbound
> 1:b        panic_oob_access
> xor        rd, rd, 42 // use rd to do something
>
> This is more versatile, and useful for building a loop as well:
>
> or            a0, r0, r0
> 0:new_ldle.d  t1, t0, t2
> b             1f
> add.d         a0, t1, a0
> add.d         t0, t0, 8
> b             0b
> 1:bl          do_something_with_the_sum
>
> Yes it's "non-RISC", but at least more RISC than the current ldle: if
> you want a trap anyway you can say
>
> blt        address, base, 1f
> new_ldle.d rd, address, upperbound
> 1:break    {a code defined for OOB}
> xor        rd, rd, 42 // use rd
>
> --
> Xi Ruoyao <xry111@xry111.site>
> School of Aerospace Science and Technology, Xidian University
