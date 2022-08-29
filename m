Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0EF53A4
	for <loongarch@lists.linux.dev>; Mon, 29 Aug 2022 15:07:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A59BC43140
	for <loongarch@lists.linux.dev>; Mon, 29 Aug 2022 15:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661785635;
	bh=I4PRhuO4Dx8YD9+YdrZ8EP0Cq4NO9S+/yC8tdR4+uHA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Tu/E5/D/EXEbam1fA/lejWD6EkruRMXsfEvhKcvlVScA1k5wLT36yUf3vxSFFn5kc
	 60KTZVglVh0/TD4kGRhvoPsQNskf7d0rgENOMts6vQL9MvwzAWDW2yhfhNXW8CzEZw
	 Pxw+HvH/FwMwCMNez4bA+03uKoLxyNRqXdP0FmG7gBecmjz8AzyAZ6OnhUOo8w+I5y
	 pl1kdCgWz04ybowiS00pKfgb8mm+2tlb1ut33AfWRPg0bYRp7LBHdPzT4U14lEf9aL
	 E4BqaQlO5kbjuW3zTeNtpfPDdoEXks3UbhK/uWTVL8FqZXdj6FbjzF8u8Z8tH1vLMV
	 dTcCzCYmJI1OA==
Received: by mail-vk1-f175.google.com with SMTP id g185so3875373vkb.13
        for <loongarch@lists.linux.dev>; Mon, 29 Aug 2022 08:07:15 -0700 (PDT)
X-Gm-Message-State: ACgBeo3fKiGy5dhx2uxdz/i12OwilUdMOJ3UUTkEMs67CtB+7ZMtCkix
	7DtXu/FNEDtKCBQSDgJISr8Kx8qRwZPSHVcu5SM=
X-Google-Smtp-Source: AA6agR7fh4G4J1JE520SBej7rcxzWIHuaLbymnR2C0cxZ3aFAOS1gZF6KQ+3bGNC0jLEA2AwSIQpzjeFDZDdGJvjMjY=
X-Received: by 2002:a1f:9b90:0:b0:374:f09c:876f with SMTP id
 d138-20020a1f9b90000000b00374f09c876fmr3440362vke.12.1661785634050; Mon, 29
 Aug 2022 08:07:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220829133146.15236-1-xry111@xry111.site> <20220829133146.15236-4-xry111@xry111.site>
 <5f9d3aa5fad957dae2f14e483b3b79dbcf9e794d.camel@xry111.site>
In-Reply-To: <5f9d3aa5fad957dae2f14e483b3b79dbcf9e794d.camel@xry111.site>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 29 Aug 2022 23:06:58 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7mkYCNx0dR_3fXKA0u85Pnub8T+WJ=7sS_JS9v6JfOxA@mail.gmail.com>
Message-ID: <CAAhV-H7mkYCNx0dR_3fXKA0u85Pnub8T+WJ=7sS_JS9v6JfOxA@mail.gmail.com>
Subject: Re: [PATCH v6 3/6] LoongArch: Use model("extreme") attribute for
 per-CPU variables in module if CONFIG_AS_HAS_EXPLICIT_RELOCS
To: Xi Ruoyao <xry111@xry111.site>
Cc: loongarch@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Youling Tang <tangyouling@loongson.cn>, 
	Jinyang He <hejinyang@loongson.cn>
Content-Type: text/plain; charset="UTF-8"

Hi, Ruoyao,

On Mon, Aug 29, 2022 at 11:02 PM Xi Ruoyao <xry111@xry111.site> wrote:
>
> On Mon, 2022-08-29 at 21:31 +0800, Xi Ruoyao wrote:
> > diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
> > index 1563747c4fa8..593818a61741 100644
> > --- a/arch/loongarch/Makefile
> > +++ b/arch/loongarch/Makefile
> > @@ -53,6 +53,9 @@ LDFLAGS_vmlinux                       += -G0 -static -n -nostdlib
> >  # combination of a "new" assembler and "old" compiler is not supported.  Either
> >  # upgrade the compiler or downgrade the assembler.
> >  ifdef CONFIG_AS_HAS_EXPLICIT_RELOCS
> > +ifeq ($(shell echo '__has_attribute(model)' | $(CC) -E -P - 2> /dev/null), 0)
> > +$(error "C compiler must support model attribute if using explicit relocs")
> > +endif
>
> Self review:
>
> I'm wondering if we really need this thing...  There won't be a GCC
> version released with explicit relocation but without model attribute
> (GCC 13 starts to support them both).
>
> But without a check, if someone uses an early GCC 13 snapshot and
> ignores the -Wattributes warning, the system will suddenly blow up
> loading a module with per-CPU variable defined.
>
> Maybe "-Werror=attributes" is better, but is it OK to add a -Werror=
> option for entire Linux tree?
I think we can remove it entirely, and then this patch seems can be
squashed into patch 2.

Huacai
>
> >  cflags-y                       += -mexplicit-relocs
> >  else
> >  cflags-y                       += $(call cc-option,-mno-explicit-relocs)
>
> --
> Xi Ruoyao <xry111@xry111.site>
> School of Aerospace Science and Technology, Xidian University
>
