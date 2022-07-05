Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37AF2917
	for <loongarch@lists.linux.dev>; Tue,  5 Jul 2022 08:06:12 +0000 (UTC)
Received: from mail-yw1-f181.google.com ([209.85.128.181]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MY60J-1o79hv1OCz-00YQqk for <loongarch@lists.linux.dev>; Tue, 05 Jul 2022
 10:06:10 +0200
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-31bf3656517so100508387b3.12
        for <loongarch@lists.linux.dev>; Tue, 05 Jul 2022 01:06:10 -0700 (PDT)
X-Gm-Message-State: AJIora87Dl6ke3sDGtD8OdRLxx2p0cetc3CzJKmM/NV236R+bxp7LfJP
	uVNE2o+jV5s07MvbSi/rr77XlG5/eRm+prcvhAA=
X-Google-Smtp-Source: AGRyM1siFTQxWWzBOhd/CS5tY6dinBjb/3v8JI3nSeDseCJdiuCqCTqoFZco5yyHdSdSX4iHxr4392vEVjGUym3EjqY=
X-Received: by 2002:a81:1e4d:0:b0:31c:86f1:95b1 with SMTP id
 e74-20020a811e4d000000b0031c86f195b1mr14599301ywe.42.1657008369140; Tue, 05
 Jul 2022 01:06:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220704112526.2492342-1-chenhuacai@loongson.cn>
 <20220704112526.2492342-5-chenhuacai@loongson.cn> <CAK8P3a2XBGtJMB=Z-W56MLREAr3sAYKqDHo3yg=4hJ4T6x+QdQ@mail.gmail.com>
 <CAAhV-H5djQOzRsW-JaRPzaAnh64WgHiGvHxc1UdAUV43tirukg@mail.gmail.com> <CAMZfGtXLxPO3jmkKpF7n9Scb=542yrf1taWHZGdPwK-tZsJXgQ@mail.gmail.com>
In-Reply-To: <CAMZfGtXLxPO3jmkKpF7n9Scb=542yrf1taWHZGdPwK-tZsJXgQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 5 Jul 2022 10:05:52 +0200
X-Gmail-Original-Message-ID: <CAK8P3a14VTkTjRNTWsGmwLDuVm=QPL17_VZ8QkcCYnyQzBjXHA@mail.gmail.com>
Message-ID: <CAK8P3a14VTkTjRNTWsGmwLDuVm=QPL17_VZ8QkcCYnyQzBjXHA@mail.gmail.com>
Subject: Re: [PATCH V4 4/4] LoongArch: Enable ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
To: Muchun Song <songmuchun@bytedance.com>
Cc: Huacai Chen <chenhuacai@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Huacai Chen <chenhuacai@loongson.cn>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, loongarch@lists.linux.dev, 
	linux-arch <linux-arch@vger.kernel.org>, Xuefeng Li <lixuefeng@loongson.cn>, 
	Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linux-MM <linux-mm@kvack.org>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Feiyang Chen <chenfeiyang@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:faPlPGWLphNSE9sigs6ANto5227HUia7lTblIPDiJVmeDMQVWGM
 sJ+vzO6h14dmrmlMEtVWvpgvGzzMXvn7iMdV/seVq13D5PhgHHBC0awG/WLeGyGYlr3uAOM
 qAI5W3Xm8+uhPN1sdZE5fBPGssngOh49z1dPZefq2lShW5EVjotyJcqgHjJRiW1VC8RyLkR
 j+QCfIdxSQ9Dk6OA5TjlQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gypqW7Ay2mM=:tN3lm1GQx6wDTRTN/KfdTU
 HBZwE+cUY1y0RfL2dn4ludmoWd42lbHfjxzXO3mgOBGj0vaCdjRyZmMvBlHfJ53j+BvJW/Xw3
 +Rwa3g98DuJtqCAnZfmGAmpJgjOvWmM5qdKaZEKX4KvQ2fTRSHABec7hqB12GqnJZZTwxUu7/
 ghaMig1jQ5a6sLCKpTnKJLm/79FFatUI3z4uHs+iK8vA95hXogUNrKB0r2Z9UBrxPXCBXVuvG
 6qdcImpTTKKpsTdBk0zHNc+YX1VivUgAQibv3f+/kgHsz4ChOe3PUNhOh69oI68/7EvCo8Nfp
 U34cXC7ksNn6I4W4YqiTxP1MeGYxXZaAwDdCAMkHBO7VS+I8P8Dy/7s33CKsel7Feu2iTZWBW
 1jfE+lh47XYAwFF4fgG8eJRHiBwVjMEvGfqpmAP6m2g+dX6U/ZZU2NVBz7G1/hvUx0Q6V/Ycb
 V3SfKC8AKbGb0/k4vnG7pPEqEofTuk6bdjf3bSvMyINb04/M6aCrCqvvVx0vTZ+wqyKu5iBAH
 vh287SOris5Uhl0uVRCgMKQSHl+qHC07myR8vG4VScYXfOshSe+3msv0vc0dhXXsXVWwkzOAM
 TtK8ouad2pNgs6eWYmSvOV1giE8B7Tw9fijZW2c3i8uMB81mPTIQVfB6Yjs9ZDJzYCXA+dUvo
 f1wJlRg//tqtHwgMnICEzLS1TIXKMTzXArLge3fmhnWUokN/v+WCLOysEYLkwJGfQBVpmHXtF
 PGUrOm7tDGsxVPMdBBIshyGOOyrU7iJi4kUk0Q==

On Tue, Jul 5, 2022 at 9:51 AM Muchun Song <songmuchun@bytedance.com> wrote:
>
> On Tue, Jul 5, 2022 at 2:22 PM Huacai Chen <chenhuacai@kernel.org> wrote:
> >
> > Hi, Arnd,
> >
> > On Mon, Jul 4, 2022 at 8:18 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > >
> > > On Mon, Jul 4, 2022 at 1:25 PM Huacai Chen <chenhuacai@loongson.cn> wrote:
> > > > To avoid the following build error on LoongArch we should include linux/
> > > > static_key.h in page-flags.h.
> > > >
> > > > In file included from ./include/linux/mmzone.h:22,
> > > > from ./include/linux/gfp.h:6,
> > > > from ./include/linux/mm.h:7,
> > > > from arch/loongarch/kernel/asm-offsets.c:9:
> > > > ./include/linux/page-flags.h:208:1: warning: data definition has no
> > > > type or storage class
> > > > 208 | DECLARE_STATIC_KEY_MAYBE(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON,
> > > > | ^~~~~~~~~~~~~~~~~~~~~~~~
> > > > ./include/linux/page-flags.h:208:1: error: type defaults to 'int' in
> > > > declaration of 'DECLARE_STATIC_KEY_MAYBE' [-Werror=implicit-int]
> > > > ./include/linux/page-flags.h:209:26: warning: parameter names (without
> > > > types) in function declaration
> > >
> > > I wonder if page_fixed_fake_head() should be moved out of line to avoid
> > > this, it's already nontrivial here, and that would avoid the static key
> > > in a central header.
> > I have some consideration here. I think both inline function and
> > static key are instruments to make things faster, in other words,
> > page_fixed_fake_head() is a performance critical function. If so, it
> > is not suitable to move it out of line.
>
> +1
>
> The static key is an optimization when HVO is disabled.

How about splitting up linux/page_flags.h so the static_key header is
only included
in those places that use one of the inline functions that depend on it?

       Arnd
