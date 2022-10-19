Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E371FA8
	for <loongarch@lists.linux.dev>; Wed, 19 Oct 2022 02:00:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D20A8C43149
	for <loongarch@lists.linux.dev>; Wed, 19 Oct 2022 02:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666144835;
	bh=TCSW17AvKHdkoRbEkTskjv1Qo5Q/OxvcAE+xqUKV4UM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hz2yl4Id2b3n0774YtVIuKgTYQo3ezL3TMyAdSVbtuHTKfklHhxuGx88xZX1X4RZh
	 3sjMR9qNcG1/LOUCDLVF+Pf0Hx03JfvwFr5y4bGL47TR6vLIKN4u+AOEMgXwrY6FG5
	 rctrVP2SNH0TArAZOGDWD9bHynPTVUNRw45B/GhAwgVpBpQNUkzT2SOs2TYOzfrPl5
	 2X2xfwOFzh9NGzFg1r8s3YbbY9w7GO3JBrVIfi5l2VezlXiwQn5TwlmtXMo6vw0UiV
	 oqEi4jsMU4IcE8qIxpW8I2+wIWe51CdUFAf1T5GTEQPZ1+IFASMdoY15+Y6cytojDQ
	 VcxXQ7/F8OmBg==
Received: by mail-ed1-f42.google.com with SMTP id m15so23089653edb.13
        for <loongarch@lists.linux.dev>; Tue, 18 Oct 2022 19:00:35 -0700 (PDT)
X-Gm-Message-State: ACrzQf2b1wGo8vMN3++LH5wEa+xZXNjvmHbKEfPaF4rn3sAsySdha5Qc
	uIfy+W8FL2QJMszwmszKP8XAQzAuC8tkuozezDk=
X-Google-Smtp-Source: AMsMyM64mo5oO4aZyzU8eaQiDb6rojExVJjHSCuo0K2CqponBGF6WAHNIqRGxtJ/4teFs6yoHZ3KmXPEqi1H/ao5Pe8=
X-Received: by 2002:aa7:df16:0:b0:45b:f51f:ab73 with SMTP id
 c22-20020aa7df16000000b0045bf51fab73mr5144349edy.366.1666144833892; Tue, 18
 Oct 2022 19:00:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221017024027.2389370-1-chenhuacai@loongson.cn>
 <20221017024027.2389370-2-chenhuacai@loongson.cn> <95a0537f-27b2-adc9-d44e-527281326b0d@linaro.org>
In-Reply-To: <95a0537f-27b2-adc9-d44e-527281326b0d@linaro.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 19 Oct 2022 10:00:22 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5x6fskGSObfh=P2JeDEhhFs6c9iQcOAKroeQQv4fu3uA@mail.gmail.com>
Message-ID: <CAAhV-H5x6fskGSObfh=P2JeDEhhFs6c9iQcOAKroeQQv4fu3uA@mail.gmail.com>
Subject: Re: [PATCH V11 1/4] MIPS&LoongArch&NIOS2: Adjust prototypes of p?d_init()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Arnd Bergmann <arnd@arndb.de>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Dinh Nguyen <dinguyen@kernel.org>, loongarch@lists.linux.dev, linux-arch@vger.kernel.org, 
	Xuefeng Li <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Feiyang Chen <chenfeiyang@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Philippe,

On Tue, Oct 18, 2022 at 9:29 PM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> On 17/10/22 04:40, Huacai Chen wrote:
> > From: Feiyang Chen <chenfeiyang@loongson.cn>
> >
> > We are preparing to add sparse vmemmap support to LoongArch. MIPS and
> > LoongArch need to call pgd_init()/pud_init()/pmd_init() when populating
> > page tables, so adjust their prototypes to make generic helpers can cal=
l
> > them.
> >
> > NIOS2 declares pmd_init() but doesn't use, just remove it to avoid buil=
d
> > errors.
> >
> > Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > ---
> >   arch/loongarch/include/asm/pgalloc.h | 13 ++-----------
> >   arch/loongarch/include/asm/pgtable.h |  8 ++++----
> >   arch/loongarch/kernel/numa.c         |  4 ++--
> >   arch/loongarch/mm/pgtable.c          | 23 +++++++++++++----------
> >   arch/mips/include/asm/pgalloc.h      | 10 +++++-----
> >   arch/mips/include/asm/pgtable-64.h   |  8 ++++----
> >   arch/mips/kvm/mmu.c                  |  3 +--
> >   arch/mips/mm/pgtable-32.c            | 10 +++++-----
> >   arch/mips/mm/pgtable-64.c            | 18 ++++++++++--------
> >   arch/mips/mm/pgtable.c               |  2 +-
> >   arch/nios2/include/asm/pgalloc.h     |  5 -----
> >   11 files changed, 47 insertions(+), 57 deletions(-)
>
> > diff --git a/arch/mips/mm/pgtable-32.c b/arch/mips/mm/pgtable-32.c
> > index 61891af25019..88819a21d97e 100644
> > --- a/arch/mips/mm/pgtable-32.c
> > +++ b/arch/mips/mm/pgtable-32.c
> > @@ -13,9 +13,9 @@
> >   #include <asm/pgalloc.h>
> >   #include <asm/tlbflush.h>
> >
> > -void pgd_init(unsigned long page)
> > +void pgd_init(void *addr)
> >   {
> > -     unsigned long *p =3D (unsigned long *) page;
> > +     unsigned long *p =3D (unsigned long *)addr;
> >       int i;
> >
> >       for (i =3D 0; i < USER_PTRS_PER_PGD; i+=3D8) {
> > @@ -61,9 +61,9 @@ void __init pagetable_init(void)
> >   #endif
> >
> >       /* Initialize the entire pgd.  */
> > -     pgd_init((unsigned long)swapper_pg_dir);
> > -     pgd_init((unsigned long)swapper_pg_dir
> > -              + sizeof(pgd_t) * USER_PTRS_PER_PGD);
> > +     pgd_init(swapper_pg_dir);
> > +     pgd_init((void *)((unsigned long)swapper_pg_dir
> > +              + sizeof(pgd_t) * USER_PTRS_PER_PGD));
>
> Pre-existing, but why not use:
>
>          pgd_init(&swapper_pg_dir[USER_PTRS_PER_PGD]);
>
> ?
OK, that seems better, thanks.

Huacai
>
> Otherwise:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>
