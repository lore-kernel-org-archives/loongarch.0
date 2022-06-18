Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAA37B
	for <loongarch@lists.linux.dev>; Sat, 18 Jun 2022 05:45:55 +0000 (UTC)
Received: from mail-yb1-f182.google.com ([209.85.219.182]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MMGVE-1oJPos3jF8-00JNbk for <loongarch@lists.linux.dev>; Sat, 18 Jun 2022
 07:40:41 +0200
Received: by mail-yb1-f182.google.com with SMTP id n144so6408926ybf.12
        for <loongarch@lists.linux.dev>; Fri, 17 Jun 2022 22:40:40 -0700 (PDT)
X-Gm-Message-State: AJIora++uIqi7b965lC1/9LUgrzJMzqhk1t6I0fxHtwyhRMm3vGdD0Gk
	atWbbgA+KChUh+9swQCK5FMEvWKg5oBp5zGRYsU=
X-Google-Smtp-Source: AGRyM1t6SuU2p8CM6C89gQYl5t8jbEr9F5Jj8jI2u7HI/USqBMY8kYrPxqa/RhT6tgDcAjE06ztkhWtj0hgZTr60hD8=
X-Received: by 2002:a25:26d0:0:b0:668:bc38:2de2 with SMTP id
 m199-20020a2526d0000000b00668bc382de2mr5908198ybm.480.1655530839702; Fri, 17
 Jun 2022 22:40:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220617145705.581985-1-chenhuacai@loongson.cn>
 <CAK8P3a2nD_Zxv5X_LB7AbO=kxHQyk3vz09fQZ-TTX4PL0b3g1g@mail.gmail.com>
 <CAJF2gTT_etFg7-N4f=A4LMOYvd3+H505e0xt8NyxK4uPtkuEXg@mail.gmail.com>
 <CAK8P3a078r6zkZYYeV7Qg3AEOvFxgG+eRN9bFE_3DNwHq=_1ZA@mail.gmail.com> <CAJF2gTQL+ysc+juQfNVxz1QtXgrLAYe=CyA9L_c3fzd4F8aFxQ@mail.gmail.com>
In-Reply-To: <CAJF2gTQL+ysc+juQfNVxz1QtXgrLAYe=CyA9L_c3fzd4F8aFxQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 18 Jun 2022 07:40:22 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3wRqLAvywX2zbD0kdt19m2pKazqA2Y6_sNL1L=_4N3vQ@mail.gmail.com>
Message-ID: <CAK8P3a3wRqLAvywX2zbD0kdt19m2pKazqA2Y6_sNL1L=_4N3vQ@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Add qspinlock support
To: Guo Ren <guoren@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-arch <linux-arch@vger.kernel.org>, Xuefeng Li <lixuefeng@loongson.cn>, 
	Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, Ingo Molnar <mingo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:bthpPu1SMOpx+HAbfruMpMIcNgfWdU1GdPckqe2Lx1v15753asO
 XF2IUiHywAtsKUnyBgLpahPvKIvSsoAIn+DA5kS69jD9QcVHmWV40yX2Tu8bcGOvcLb+OEX
 wgmab17NJsTTxFHt3RPsAcZpMCNm2KHkDtVvwkwMi7GHKYHJdS2zgMnwQ5awBkKzvdc4FUl
 Ne6ggyjOF2GMB+cWTICsA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:RfIFW/BS8YU=:YrcVLjOilXZlv5zyvabFdT
 H2Scj5Do8z+yBmRsQaV73yShDa3QqepmEu4mbCr5ezKk7FFZimMl/7ueLFjyVKhHQ+aXvUg8D
 R277zIdCcUa0mS69aBU8UVUpsiiJaGhBNsvnG9TPPK7OuyY+6wQN0cCC6kdS3PAUDCfl5IAph
 XrX5hgZ8U7AA9BW2OHPGIm+Cj5srNojfWtpDKjbwIoqfyigDYc5x+uTdvlEsA24E+MPBx8xvn
 6KngEvbN6c0wduz//vSgEpHFxGqCPEgZPAfBZBTiH2utVGQs464AdVcBmNtZkhsP06s6lANZH
 /Vo4sOQyMZaLLd1shq+pmFSE0Lqz409xAaH6XEBk5/XLXuMHqia48+l4oco8DKxMhZb2g16rp
 zFOvinuVdlcRffz8bCb15aJlcgrc1WeI5Do2N/Ou2sTNbfoOWqw6C/EabDJ7HVMKXbsynhENt
 a7lUiVGUbNF9n+uq8hwM7tZuuE+CxOSgOEf/iNzHTCYAUEb9ARRX2cWimXIkkedCt9r6o9V46
 dmTZilGupAnucdt6kHXWF49LwZ5SYPESHlTTtohrwSAB53yOqOrnx6xQ1qZr4ixi4ifXG3Ptt
 uQRax2n66w0paFk8581IJCaaoCvEKK2tfQgv6uJ+B23GCNhhBzyRh4aqIT6+zvNWfmYguX/Uq
 AkGfnFWioWQbDZYIS+C7TQsu2+0lJ8QIPCU8QKof2A6BzJDOjoSVtwqYQDYgfCsGISfrECYrJ
 VzSgK9znJFE/w2RG7+MPFEflZpdIeMAKgrE2ARenIy+r2aNWI31NgW/KSqWAoIVmWEz/PLe7H
 MOyvm/QmTQRfu30aA1yaq8mNcrOo08VF45M9guu+gVLtzVkblovids6SbFFnlDutP7qe8CwJI
 hGvSvoMMWxRQ76/A68Pw==

On Sat, Jun 18, 2022 at 1:19 AM Guo Ren <guoren@kernel.org> wrote:
>
> > static inline u32 arch_xchg32(u32 *ptr, u32 x) {...}
> > static inline u64 arch_xchg64(u64 *ptr, u64 x) {...}
> >
> > #ifdef CONFIG_64BIT
> > #define xchg(ptr, x) (sizeof(*ptr) == 8) ? \
> >             arch_xchg64((u64*)ptr, (uintptr_t)x)  \
> >             arch_xchg32((u32*)ptr, x)
> > #else
> > #define xchg(ptr, x) arch_xchg32((u32*)ptr, (uintptr_t)x)
> > #endif
>
> The above primitive implies only long & int type args are permitted, right?

The idea is to allow any scalar or pointer type, but not structures or
unions. If we need to deal with those as well, the macro could be extended
accordingly, but I would prefer to limit it as much as possible.

There is already cmpxchg64(), which is used for types that are fixed to
64 bit integers even on 32-bit architectures, but it is rarely used except
to implement the atomic64_t helpers.

80% of the uses of cmpxchg() and xchg() deal with word-sized
quantities like 'unsigned long', or 'void *', but the others are almost
all fixed 32-bit quantities. We could change those to use cmpxchg32()
directly and simplify the cmpxchg() function further to only deal
with word-sized arguments, but I would not do that in the first step.

        Arnd
