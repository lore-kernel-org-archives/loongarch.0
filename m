Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD327E
	for <loongarch@lists.linux.dev>; Mon,  4 Jul 2022 12:18:35 +0000 (UTC)
Received: from mail-yw1-f175.google.com ([209.85.128.175]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MuUWi-1nGmbr1IIc-00ra2l for <loongarch@lists.linux.dev>; Mon, 04 Jul 2022
 14:18:33 +0200
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-31c8bb90d09so26533507b3.8
        for <loongarch@lists.linux.dev>; Mon, 04 Jul 2022 05:18:33 -0700 (PDT)
X-Gm-Message-State: AJIora+zWsG+wNhdw2tC8hO72q4B2SzLn5tu3g8B//wrBZIv+WBcaR7A
	bVASMBsE796VA1eBkU9r/O8KxlQD5nQUlb0FK68=
X-Google-Smtp-Source: AGRyM1t524xzXaLIHc9+YLKm6ZLrM8h13HdFno4gZgaj1dmGgvuhogt+hY7ItAhxUJF6ZzYWUGTcd5U54H4EPHTirlY=
X-Received: by 2002:a81:7742:0:b0:318:35e9:728b with SMTP id
 s63-20020a817742000000b0031835e9728bmr32899958ywc.209.1656937112121; Mon, 04
 Jul 2022 05:18:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220704112526.2492342-1-chenhuacai@loongson.cn> <20220704112526.2492342-5-chenhuacai@loongson.cn>
In-Reply-To: <20220704112526.2492342-5-chenhuacai@loongson.cn>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 4 Jul 2022 14:18:15 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2XBGtJMB=Z-W56MLREAr3sAYKqDHo3yg=4hJ4T6x+QdQ@mail.gmail.com>
Message-ID: <CAK8P3a2XBGtJMB=Z-W56MLREAr3sAYKqDHo3yg=4hJ4T6x+QdQ@mail.gmail.com>
Subject: Re: [PATCH V4 4/4] LoongArch: Enable ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, loongarch@lists.linux.dev, 
	linux-arch <linux-arch@vger.kernel.org>, Xuefeng Li <lixuefeng@loongson.cn>, 
	Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linux-MM <linux-mm@kvack.org>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Feiyang Chen <chenfeiyang@loongson.cn>, Muchun Song <songmuchun@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:45jlGRVskWY70fu9DpwxYoOccx8yy+IT0NOTcIGbTZFT785HaRu
 19rPA30PnOrD3QJ2ky8ZAvaCqs21F3sQ6V4VqOB5dAYAxGuE/Kql66gLiPV3ozwgjWsWNJW
 Vx7RkV3JYtY1xUmkVShTdMM9RzrHBsplvI1K291/qCymKb+HkdzKfKEJeOvay/Vg7yizk5T
 b6aUdE+JsSwqHz5Ffp9zQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:heCPbE+2zzw=:eZ9Yw35H/JzruPQepev3Fh
 rDiMYAhzrbaewAT9Z3BoOAoZPe+6aatiWlyPn7jbW6xqB/2rzES8xryRgOCrg1HNHQeUO+Tm4
 gy03ZjRx/Bp8dtmFSrovoduEdPLGhP4MYux9Prkr0PnMVRggFuC8RWE/BUiHC+PLPym23J8Vd
 WI4PdC+vmxJB4Br2Zam7+mXAr/IArwDJH5RyKXcvBPXXs40sDabawBKQUpuJev6niSSXsG6yr
 BFv1vmXiYNiCRqvpRlA8z287Ge178wTvIFTWkxed6FP6AzugJ4GdHvYYx/sgOY/nUYL6B2iEy
 g8PGVBCXUJMzUVAj1GZjSqCLy6q53ZaSKHf2NZFdPdfwJSLxbw3FxQkknM19nHNmHznNo1+K3
 VwaXM4as/Rp6AVkAcpW6AGmAftgqgDCIuRBqd/WD3hKGf59OeHEouNcmTPefRGyw6VrtPFUSG
 bY+NwOTb2kiZEmWHTP75kQdalKFg/vetPadQNzHtrlb5GeuYUKpvoBCnw6UZqL30XL89LWllD
 R0Iue+KH4RCzIysVXXPe6CpSEKjX8JKbR3YU3Yev6HEjB1gc0GbVPP9zTSXaEGpbyhkOEqfyA
 ExdUc7gZUdv+ImKaidKxIuVK7yV7Z9rxniX2/loOT5oIQ79WXq8LyT6Rg5+cQUMbTigI9dnAI
 GflleO/dXQnbUcaXK3bISv87EGqWQ3UxJYBhDBZNYnK7qw+3jCWC9vXfDFAS3mUkQxJA3wnBB
 3tVpFgBek+yx2qo1J/b3ELfmdNSbn11+jYyxo8vbqE2b9xi2ygKu7kdusMyiC6sqlUEg86sSC
 5F0cun5QRQsX2CVfeWWg5yWROnsRChC+g/bzbS0YgFBWQIWECE26L1Knii2qUChUoBiJWfcsa
 AQkcG4J9TqLzHw1/nVig==

On Mon, Jul 4, 2022 at 1:25 PM Huacai Chen <chenhuacai@loongson.cn> wrote:
> To avoid the following build error on LoongArch we should include linux/
> static_key.h in page-flags.h.
>
> In file included from ./include/linux/mmzone.h:22,
> from ./include/linux/gfp.h:6,
> from ./include/linux/mm.h:7,
> from arch/loongarch/kernel/asm-offsets.c:9:
> ./include/linux/page-flags.h:208:1: warning: data definition has no
> type or storage class
> 208 | DECLARE_STATIC_KEY_MAYBE(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON,
> | ^~~~~~~~~~~~~~~~~~~~~~~~
> ./include/linux/page-flags.h:208:1: error: type defaults to 'int' in
> declaration of 'DECLARE_STATIC_KEY_MAYBE' [-Werror=implicit-int]
> ./include/linux/page-flags.h:209:26: warning: parameter names (without
> types) in function declaration

I wonder if page_fixed_fake_head() should be moved out of line to avoid
this, it's already nontrivial here, and that would avoid the static key
in a central header.

       Arnd
