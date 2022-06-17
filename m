Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B1B20E1
	for <loongarch@lists.linux.dev>; Fri, 17 Jun 2022 18:59:48 +0000 (UTC)
Received: from mail-yw1-f179.google.com ([209.85.128.179]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1My3In-1nmOk93Iyd-00zTPh for <loongarch@lists.linux.dev>; Fri, 17 Jun 2022
 20:59:47 +0200
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-317741c86fdso49119057b3.2
        for <loongarch@lists.linux.dev>; Fri, 17 Jun 2022 11:59:46 -0700 (PDT)
X-Gm-Message-State: AJIora/qlLDTmPqYiVygElMAPb8AlW5bBphpl8h08WRZI2ehpEgYWsut
	iohPWWlViS59K4ggMS0JGnuthLuZhe4sdIloPpg=
X-Google-Smtp-Source: AGRyM1vBPK/AD8SxjZFRQRRzL2gKhd7+cq/c1LJKDIezk+H78fL/tN1swRFZPDHzyTcwCRiLhJ5AWKcgK4l/v22YAgw=
X-Received: by 2002:a81:c08:0:b0:317:8131:2b21 with SMTP id
 8-20020a810c08000000b0031781312b21mr5024318ywm.249.1655492385569; Fri, 17 Jun
 2022 11:59:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220617145705.581985-1-chenhuacai@loongson.cn>
 <CAK8P3a2nD_Zxv5X_LB7AbO=kxHQyk3vz09fQZ-TTX4PL0b3g1g@mail.gmail.com> <CAJF2gTT_etFg7-N4f=A4LMOYvd3+H505e0xt8NyxK4uPtkuEXg@mail.gmail.com>
In-Reply-To: <CAJF2gTT_etFg7-N4f=A4LMOYvd3+H505e0xt8NyxK4uPtkuEXg@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 17 Jun 2022 20:59:28 +0200
X-Gmail-Original-Message-ID: <CAK8P3a078r6zkZYYeV7Qg3AEOvFxgG+eRN9bFE_3DNwHq=_1ZA@mail.gmail.com>
Message-ID: <CAK8P3a078r6zkZYYeV7Qg3AEOvFxgG+eRN9bFE_3DNwHq=_1ZA@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Add qspinlock support
To: Guo Ren <guoren@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-arch <linux-arch@vger.kernel.org>, Xuefeng Li <lixuefeng@loongson.cn>, 
	Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, Ingo Molnar <mingo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:6/ELBu4K9miG5TwIwQs5C7wkG68CK65SuC5lZ6CPYK+ExLfb7pr
 ni/KkSNwPw+MCkg+B1NNkLu57eW4LnF0qGeekVuvKmJNSpamGrUkKBsyzUxAkDOYDfSi4VO
 xOzYysJjj+SeANCFQ1fmLp+om3hgygBTCVIgPDtjiCw4PI8B6dOe78LA4bY82lqoOC4F1+l
 qDp+qKcwPImkspl5We4EQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:z6Dd5WsUZog=:4j8AhdJPFLNjL0QbCuLdEj
 RtVgiYQgoeA6P5oduaKCLlQBtpuV7ncLUIPx9ZfHyWKvWdyDpwjHX/wvrdLaE1eQ2k+xXb4b2
 69gYJtTWUVfSv9/ymW7QpYAl6fsyk5GvRafvZ03mUIkYiIpGjVYKgItdvJqi9PgoE0Y8ZUc/o
 UgdIAN1QZleVYtLimvf2IcQuoETwfY+ug6pxdVLn+xBxJlH3JTgQseB/XvhEXCNBDKjp0/SFL
 IsXX2Rr6eiL083udDm0fgmR8UZwPrMNqKfntjlWsxgWb0IetqBrkrNQkJLvgcB+5O82xwzbY9
 /LMp+Yy6etEpiBtWoS57a859yeXirLySI9NSU9o3aUnD/4VQYmT9nEjTW8pDtXpZkge6rg/cd
 cSaNO1/TQKrcHERdKvrMSZOF74weZApIJt9FLWa6W2Qk9h7BhqeLB9/MbRok3IjfKw1x8tse7
 y7SR7/97tXEWT0nHAiVWWXgvOt6d16Y4coJtfV7pIExCbLcDOoMoY7ksI+2JTjgLoh7IGVIsT
 H3jadM1ymhZblGrD+zOu5RnyBkKDshLZEkkzLh8IQ6xZCj46xpGQr+OYubuhmud200wQUZgjE
 3Q7iFR0shZbHY4DFj0dJexG6v25pHAbrkXEQBGskClHI9M3lriRjYM79jY8VOlw6L2bSVrK5P
 kpFjW7q+uI1xYJagx0po7snl+Pi+4vXrgEeUXHXtascnmWROS9w9gre4xiyanmT0E9hoXoHm3
 FI5aLebcLuOBAOmKqx1FQXoxpdwtG8kHCdDeBAlynOabUX8HUhoOO0QX/Yj1+A1Vwd4GhSK1e
 YAYESGgFOPf26dIx1Bs72o4de+6+1bhXxShXT+e9qdUzzFUoZVUzNb3NXGEDN4ZNhK8GPhG20
 XHI7Wwzo7glvvrVJhqCQ==

On Fri, Jun 17, 2022 at 7:45 PM Guo Ren <guoren@kernel.org> wrote:
> On Sat, Jun 18, 2022 at 12:11 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > >+
> >
> > Do you actually need the size 1 as well?
> >
> > Generally speaking, I would like to rework the xchg()/cmpxchg() logic
> > to only cover the 32-bit and word-sized (possibly 64-bit) case, while
> > having separate optional 8-bit and 16-bit functions. I had a patch for
> Why not prevent 8-bit and 16-bit xchg()/cmpxchg() directly? eg: move
> qspinlock xchg_tail to per arch_xchg_tail.
> That means Linux doesn't provide a mixed-size atomic operation primitive.
>
> What does your "separate optional 8-bit and 16-bit functions" mean here?

What I have in mind is something like

static inline  u8 arch_xchg8(u8 *ptr, u8 x) {...}
static inline u16 arch_xchg16(u16 *ptr, u16 x) {...}
static inline u32 arch_xchg32(u32 *ptr, u32 x) {...}
static inline u64 arch_xchg64(u64 *ptr, u64 x) {...}

#ifdef CONFIG_64BIT
#define xchg(ptr, x) (sizeof(*ptr) == 8) ? \
            arch_xchg64((u64*)ptr, (uintptr_t)x)  \
            arch_xchg32((u32*)ptr, x)
#else
#define xchg(ptr, x) arch_xchg32((u32*)ptr, (uintptr_t)x)
#endif

This means most of the helpers can actually be normal
inline functions, and only 64-bit architectures need the special
case of dealing with non-u32-sized pointers and 'long' values.

         Arnd
