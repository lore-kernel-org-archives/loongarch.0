Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3FD7B
	for <loongarch@lists.linux.dev>; Sun, 19 Jun 2022 16:11:18 +0000 (UTC)
Received: from mail-yw1-f169.google.com ([209.85.128.169]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MGQax-1nv25p2wYf-00Gt2r for <loongarch@lists.linux.dev>; Sun, 19 Jun 2022
 18:11:16 +0200
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-317a66d62dfso19199187b3.7
        for <loongarch@lists.linux.dev>; Sun, 19 Jun 2022 09:11:16 -0700 (PDT)
X-Gm-Message-State: AJIora+Grl4lagwpV7C6pKFJMh+8Xac/G1KuV12oXonyKvw8VEGS7yqt
	5BmJLIPQSVObB0vSXJcUJvD1lTbaVp84mnfRXPY=
X-Google-Smtp-Source: AGRyM1u4m0E0KW7QvAX/N1AC5hXX0JLkb34rDkvU+flRUeRRk5cxd86INV5u8OCLHfM5t/pAQqDh5AjCDd2lLsBoOKI=
X-Received: by 2002:a0d:ca0f:0:b0:317:a2cc:aa2 with SMTP id
 m15-20020a0dca0f000000b00317a2cc0aa2mr7333201ywd.347.1655655075482; Sun, 19
 Jun 2022 09:11:15 -0700 (PDT)
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
 <CAJF2gTQL+ysc+juQfNVxz1QtXgrLAYe=CyA9L_c3fzd4F8aFxQ@mail.gmail.com>
 <CAK8P3a3wRqLAvywX2zbD0kdt19m2pKazqA2Y6_sNL1L=_4N3vQ@mail.gmail.com> <CAJF2gTQG0SBninPg7MsCFP=60p8u5KT+HaLNBzgjxM_fTMr+Dg@mail.gmail.com>
In-Reply-To: <CAJF2gTQG0SBninPg7MsCFP=60p8u5KT+HaLNBzgjxM_fTMr+Dg@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sun, 19 Jun 2022 18:10:58 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1LgmZDssQoCciZ0YRy3UHWV3yK99UHTCdvahCFBG+u+Q@mail.gmail.com>
Message-ID: <CAK8P3a1LgmZDssQoCciZ0YRy3UHWV3yK99UHTCdvahCFBG+u+Q@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Add qspinlock support
To: Guo Ren <guoren@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-arch <linux-arch@vger.kernel.org>, Xuefeng Li <lixuefeng@loongson.cn>, 
	Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, Ingo Molnar <mingo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:tA/ejWp1Qb53BX9c0Dk9rHUN2dToUDGTeqZLpgFld9bBgtx+Q5b
 GJe1WI7cDgAodYi+S2Y2YZQtBHTxEYEick984mLXhD6IkksOnECSq2UIc2F8m0uKMBep5kX
 Tc2LsABv9Hu7SK6baB9xKc5FdEO1oirTfyqvqObLLJ/Iicpc9R/iZdnXiUrOiXEIj2aF4rK
 y5JeBkglgoDwIy5EqmuCw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:2EixL4Qur3E=:djwkA1JIPi7fCZXvfByEbJ
 BNvdiOyPqbW8jBpw/vUKC7gwwq8QjrW087AyJFqxpAvdJO0h4euZZ8eEQpBxl5Of5BAUcvo/+
 ZJU5AQw1pGM8gOym2naOCjG1FRHcOxMAGHxDSyIlUnopYtuNg8bnhmMRn0nPjjsJnDjzblgRk
 qOpi4bjrEdIb2xmwfGQEzR5OTwq2JuK1UAVLY2A3GSt94psk4HE4hNOUdlBKPJpWH8F/NZxEM
 kwLlGiNGaIdAjcAqUTMtqPkTzwQnCF8q08516JMyRTIIU5Zfc1HmTGURGxFTfmgxB+sd4zSmm
 Dehe/KZ8hpJgTq10QtTFEsr6OcTUC8iHpp2i0s5qkmpe74ahjjvCwbAcfCt0CYZSOLGpJXn4W
 E9KCoqDUczzNYPfUfeu+J1rgPMubROCrSgI56ZU7D+q9OinRdn7zNevD+1dIFsCQOzIquyEVL
 XhRcnxhb+Bvv3ftUn2pQuc3z78gU7pt8GTOO9PSITeMkPuVDHKFkIkAtlp3yurbkY2kEHFI9g
 1eVeFmmbfzdYesDOi4mQAShqhhVbBPEymjEpysl1Pez+K28ysXxQqgIt5r1Vr0aM4GdDUkEfa
 VwydpcxnqnjkcFI8CFJ1sK6tjrNh97dUmC8zjTii7YK9RXep52w15uv0gtrppVxPTI/wVkkrI
 u8xlb+IhrZdhXc/ZykAwxkFiJyjFJAy5sTYOdQc2+ytXqd8cCgSM6i3sMs/RwYpitmE6RneGj
 Lmw+vqIRHimHNHgdZHEjycfxzXLtCnDBlZ4wTz79KmNEP8iiqIUP6D0AELi3kLhR5VTFNbUx2
 xj1PHqY1b5eDov3+v+Y+ZZQj+Xo4qRk8B1Ml6jaeWTAe6JWijQufab87UJIcvLiq2BnznHG9w
 ZEoYcOPqXUYKBhFZv8WQ==

On Sun, Jun 19, 2022 at 5:48 PM Guo Ren <guoren@kernel.org> wrote:
>
> On Sat, Jun 18, 2022 at 1:40 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Sat, Jun 18, 2022 at 1:19 AM Guo Ren <guoren@kernel.org> wrote:
> > >
> > > > static inline u32 arch_xchg32(u32 *ptr, u32 x) {...}
> > > > static inline u64 arch_xchg64(u64 *ptr, u64 x) {...}
> > > >
> > > > #ifdef CONFIG_64BIT
> > > > #define xchg(ptr, x) (sizeof(*ptr) == 8) ? \
> > > >             arch_xchg64((u64*)ptr, (uintptr_t)x)  \
> > > >             arch_xchg32((u32*)ptr, x)
> > > > #else
> > > > #define xchg(ptr, x) arch_xchg32((u32*)ptr, (uintptr_t)x)
> > > > #endif
> > >
> > > The above primitive implies only long & int type args are permitted, right?
> >
> > The idea is to allow any scalar or pointer type, but not structures or
> > unions. If we need to deal with those as well, the macro could be extended
> > accordingly, but I would prefer to limit it as much as possible.
> >
> > There is already cmpxchg64(), which is used for types that are fixed to
> > 64 bit integers even on 32-bit architectures, but it is rarely used except
> > to implement the atomic64_t helpers.
> A lot of 32bit arches couldn't provide cmpxchg64 (like arm's ldrexd/strexd).

Most 32-bit architectures also lack SMP support, so they can fall back to
the generic version from include/asm-generic/cmpxchg-local.h

> Another question: Do you know why arm32 didn't implement
> HAVE_CMPXCHG_DOUBLE with ldrexd/strexd?

I think it's just fairly obscure, the slub code appears to be the only
code that would use it.

> >
> > 80% of the uses of cmpxchg() and xchg() deal with word-sized
> > quantities like 'unsigned long', or 'void *', but the others are almost
> > all fixed 32-bit quantities. We could change those to use cmpxchg32()
> > directly and simplify the cmpxchg() function further to only deal
> > with word-sized arguments, but I would not do that in the first step.
> Don't forget cmpxchg_double for this cleanup, when do you want to
> restart the work?

I have no specific plans at the moment. If you or someone else likes
to look into it, I can dig out my old patch though.

The cmpxchg_double() call seems to already fit in, since it is an
inline function and does not expect arbitrary argument types.

       Arnd
