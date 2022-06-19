Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433247B
	for <loongarch@lists.linux.dev>; Sun, 19 Jun 2022 15:48:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1A9FC341C6
	for <loongarch@lists.linux.dev>; Sun, 19 Jun 2022 15:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655653715;
	bh=rl7XmNGRsfIK0mLmKVN8EHtLLorUOOxWkObhiqyX5Jo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=O1vy0l5cVlWQIa/aQlkCmd3pu7t61WD84gyc990Ub9ISJGcLWdPl6ISiNCYKDKUSF
	 SNkdu0PW/LO7Bk4wVB3Q8BrnH1TN6YcQnU0GBp6yTjyKmp1A6/Mv8sJXt04RfAJjT+
	 TYkddwadBDfjmvvCTPVClTOxisr+UxV2z7mN8I2CLZYCg2ZJGoPcknLcyYKy3U+bpw
	 EVfZvrYXLbT6D10yTVP/k0dQl/acAi2KPe/thvCe2psWQOJKkuM95xLOB1/P7dR9Ky
	 3TmUcGBCU4/rT0E8lWc+NPSzqfnD/u7FU26Ss0pikJV6hJ4/qcPB3FO8ymgRDYuqOk
	 Vs4Mgq4UlryXA==
Received: by mail-vk1-f171.google.com with SMTP id x6so4136708vkn.2
        for <loongarch@lists.linux.dev>; Sun, 19 Jun 2022 08:48:35 -0700 (PDT)
X-Gm-Message-State: AJIora/Els8qlDf8+2qArn+ZfRoe7a32iQ2L6kol7GJkFdBrULzMuiUX
	YCGfvMEJROVfXpMdWIS9hSMWmQmKueQx3IE1fo8=
X-Google-Smtp-Source: AGRyM1uZwsY5+FMzxmdY6xIXfATdOVeX4b27EJJrhLYC5ZoU57GaiCIcXGDfJqMtVbEv5fdg8VbsBQTY+l7avNwPM50=
X-Received: by 2002:a05:6122:239:b0:36c:1187:a347 with SMTP id
 e25-20020a056122023900b0036c1187a347mr517430vko.28.1655653714775; Sun, 19 Jun
 2022 08:48:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220617145705.581985-1-chenhuacai@loongson.cn>
 <CAK8P3a2nD_Zxv5X_LB7AbO=kxHQyk3vz09fQZ-TTX4PL0b3g1g@mail.gmail.com>
 <CAJF2gTT_etFg7-N4f=A4LMOYvd3+H505e0xt8NyxK4uPtkuEXg@mail.gmail.com>
 <CAK8P3a078r6zkZYYeV7Qg3AEOvFxgG+eRN9bFE_3DNwHq=_1ZA@mail.gmail.com>
 <CAJF2gTQL+ysc+juQfNVxz1QtXgrLAYe=CyA9L_c3fzd4F8aFxQ@mail.gmail.com> <CAK8P3a3wRqLAvywX2zbD0kdt19m2pKazqA2Y6_sNL1L=_4N3vQ@mail.gmail.com>
In-Reply-To: <CAK8P3a3wRqLAvywX2zbD0kdt19m2pKazqA2Y6_sNL1L=_4N3vQ@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 19 Jun 2022 23:48:23 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQG0SBninPg7MsCFP=60p8u5KT+HaLNBzgjxM_fTMr+Dg@mail.gmail.com>
Message-ID: <CAJF2gTQG0SBninPg7MsCFP=60p8u5KT+HaLNBzgjxM_fTMr+Dg@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Add qspinlock support
To: Arnd Bergmann <arnd@arndb.de>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, linux-arch <linux-arch@vger.kernel.org>, 
	Xuefeng Li <lixuefeng@loongson.cn>, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Will Deacon <will@kernel.org>, Ingo Molnar <mingo@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, Jun 18, 2022 at 1:40 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Sat, Jun 18, 2022 at 1:19 AM Guo Ren <guoren@kernel.org> wrote:
> >
> > > static inline u32 arch_xchg32(u32 *ptr, u32 x) {...}
> > > static inline u64 arch_xchg64(u64 *ptr, u64 x) {...}
> > >
> > > #ifdef CONFIG_64BIT
> > > #define xchg(ptr, x) (sizeof(*ptr) == 8) ? \
> > >             arch_xchg64((u64*)ptr, (uintptr_t)x)  \
> > >             arch_xchg32((u32*)ptr, x)
> > > #else
> > > #define xchg(ptr, x) arch_xchg32((u32*)ptr, (uintptr_t)x)
> > > #endif
> >
> > The above primitive implies only long & int type args are permitted, right?
>
> The idea is to allow any scalar or pointer type, but not structures or
> unions. If we need to deal with those as well, the macro could be extended
> accordingly, but I would prefer to limit it as much as possible.
>
> There is already cmpxchg64(), which is used for types that are fixed to
> 64 bit integers even on 32-bit architectures, but it is rarely used except
> to implement the atomic64_t helpers.
A lot of 32bit arches couldn't provide cmpxchg64 (like arm's ldrexd/strexd).

Another question: Do you know why arm32 didn't implement
HAVE_CMPXCHG_DOUBLE with ldrexd/strexd?

>
> 80% of the uses of cmpxchg() and xchg() deal with word-sized
> quantities like 'unsigned long', or 'void *', but the others are almost
> all fixed 32-bit quantities. We could change those to use cmpxchg32()
> directly and simplify the cmpxchg() function further to only deal
> with word-sized arguments, but I would not do that in the first step.
Don't forget cmpxchg_double for this cleanup, when do you want to
restart the work?

>
>         Arnd



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
