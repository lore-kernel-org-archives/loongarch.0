Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DEE1C38
	for <loongarch@lists.linux.dev>; Mon, 15 Aug 2022 15:53:51 +0000 (UTC)
Received: from mail-lj1-f176.google.com ([209.85.208.176]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mc02Z-1nnArS0rqZ-00dVTy for <loongarch@lists.linux.dev>; Mon, 15 Aug 2022
 17:53:49 +0200
Received: by mail-lj1-f176.google.com with SMTP id l10so8016774lje.7
        for <loongarch@lists.linux.dev>; Mon, 15 Aug 2022 08:53:49 -0700 (PDT)
X-Gm-Message-State: ACgBeo3wVykjgvneDhyJep2jPt541LXwCfLsaD2fS//wy65aK3JAWjeI
	HUgBVIpRzr3tGlIA+Dz5LjrfuYtjBbnJuZv2ij4=
X-Google-Smtp-Source: AA6agR4kQH9OPkAoSzw4z/FBPTVCt5TcLJ18r0latd6JdISl5KaD+R3rrNlWHfqDqar+qTRK7WgfYWLgQGqiKgJkzhc=
X-Received: by 2002:a17:907:7609:b0:730:d70a:1efc with SMTP id
 jx9-20020a170907760900b00730d70a1efcmr10863122ejc.766.1660578818066; Mon, 15
 Aug 2022 08:53:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220815143959.1511278-1-zi.yan@sent.com>
In-Reply-To: <20220815143959.1511278-1-zi.yan@sent.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 15 Aug 2022 17:53:22 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0TcnXHVsxBkpqLi63XC62Jkg3HChtK4RgB6-giYb+hnw@mail.gmail.com>
Message-ID: <CAK8P3a0TcnXHVsxBkpqLi63XC62Jkg3HChtK4RgB6-giYb+hnw@mail.gmail.com>
Subject: Re: [PATCH] arch: mm: rename FORCE_MAX_ZONEORDER to ARCH_FORCE_MAX_ORDER
To: Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, David Hildenbrand <david@redhat.com>, 
	Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Mike Kravetz <mike.kravetz@oracle.com>, 
	John Hubbard <jhubbard@nvidia.com>, Yang Shi <shy828301@gmail.com>, 
	David Rientjes <rientjes@google.com>, James Houghton <jthoughton@google.com>, 
	Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org, 
	Mike Rapoport <rppt@linux.ibm.com>, Vineet Gupta <vgupta@synopsys.com>, 
	Shawn Guo <shawnguo@kernel.org>, Taichi Sugaya <sugaya.taichi@socionext.com>, 
	Neil Armstrong <narmstrong@baylibre.com>, Qin Jian <qinjian@cqplus1.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Dinh Nguyen <dinguyen@kernel.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	"David S. Miller" <davem@davemloft.net>, Chris Zankel <chris@zankel.net>, Arnd Bergmann <arnd@arndb.de>, 
	Ley Foon Tan <ley.foon.tan@intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	NXP Linux Team <linux-imx@nxp.com>, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-oxnas@groups.io, 
	linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-xtensa@linux-xtensa.org
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:MJ4KS1Fn6h56IY5s3qPcF0eIvUqSfMISEX7c9lo7QBGUnoLY9Wm
 IKYrAOtalR45wsvjm4WP9A93bvpQsmD/cOplqAgRlKqjZUQ69cHvTtSDTpe1bUSae/jZRTl
 n3WBLm4cekG3r3VtFM8SjbJsTVxokW1HBj4EBrh65Zi6a7zeUhQZejG1uOk3SuN9KmVI5KR
 Hz0BDCjQw1pq0H0z114aw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Itpo7bOYQ0g=:SmDXGCXyHl6NXHEEEWcASb
 BR7oM7xiZ4oGcAjP4Uh0RRL58rtRhV3+oAWyKB1RNM2wvUhAQowN6duRKgcw8E6No+PapZpaO
 BCTnM8m3+l/qmlSc4PHeJTqtaZd06n6hVZkQ/PFe+PbfuLfiPY6pSjnyNHwDnc10UJwqfcecz
 p1Ef1KJo72UEDIUzJypZmsc9hRomtJwRVcr4LHd2VNKipTky13nkWOYDvo0Bfu7dqt91GUPKf
 Y03zr6iHZDctqXRLmt1Znazq8gpdQspAi+GUBxUhYJtMho+foYa257RXnb4P59T2XElaHkfMs
 yFudUBe5BOAHCsupCSN6Fd36hxB6OuhTuLgL5+LXlpiEPFpcVhe60oar+Yd2GvQwUHThmCJZC
 Q2Aw1XHayOGdowKfOt1d8/Rcwc2FEJUC9WMdd11uRU4v/MtPawTbyO2u1kkNubf206pK8CJSe
 +Cz+tZ1QTSemw78ve5BlyYoun9lQ9EdZGt4wui35eRgkgX0S0ugJvGEOJ/sqjKtqAnFpScX3f
 yRM/sBSnclDDrrQX0t8SCjFsiqHzqmD1As4am3V5SVzB6RPWI4803UzWH4bGRr4DQnW2s5I8N
 dbYlBq/PKbGyaHoxpNNBpZlMURYbrEvb5Drf8Ja9ekIf1OZdn5R9+6Q4MYQh6MfAtv43GAGXd
 QqbOKDeJomGB6NG3DAKLuakbeo98ZC0d9v8P+MsgFX/9BiFQl2+OZDynLFKoWlYvAkykUrrGM
 3CDojnksMU4F0JgTd+ouoR7gq3Kl1nEKVocVsIlHt7wJWC90gme6HUZo8yQ0Ne4FYzg8ypbRb
 FaXOb9fdXMA3lt1U6nXKNQdyLJa2ooO6tYVrQTu2K6kuDWBIcspn3MwQFNDf8YzaT2FSZjEN6
 bFvcCQ9TPBFCwKyD0fzfV2GXBXHvQFJKOUMROLNa0=

On Mon, Aug 15, 2022 at 4:39 PM Zi Yan <zi.yan@sent.com> wrote:
>
> ---
>  arch/arc/Kconfig                             | 2 +-
>  arch/arm/Kconfig                             | 2 +-
>  arch/arm/configs/imx_v6_v7_defconfig         | 2 +-
>  arch/arm/configs/milbeaut_m10v_defconfig     | 2 +-
>  arch/arm/configs/oxnas_v6_defconfig          | 2 +-
>  arch/arm/configs/pxa_defconfig               | 2 +-
>  arch/arm/configs/sama7_defconfig             | 2 +-
>  arch/arm/configs/sp7021_defconfig            | 2 +-
>  arch/arm64/Kconfig                           | 2 +-
>  arch/csky/Kconfig                            | 2 +-
>  arch/ia64/Kconfig                            | 2 +-
>  arch/ia64/include/asm/sparsemem.h            | 6 +++---
>  arch/loongarch/Kconfig                       | 2 +-
>  arch/m68k/Kconfig.cpu                        | 2 +-
>  arch/mips/Kconfig                            | 2 +-
>  arch/nios2/Kconfig                           | 2 +-
>  arch/powerpc/Kconfig                         | 2 +-
>  arch/powerpc/configs/85xx/ge_imp3a_defconfig | 2 +-
>  arch/powerpc/configs/fsl-emb-nonhw.config    | 2 +-
>  arch/sh/configs/ecovec24_defconfig           | 2 +-
>  arch/sh/mm/Kconfig                           | 2 +-
>  arch/sparc/Kconfig                           | 2 +-
>  arch/xtensa/Kconfig                          | 2 +-
>  include/linux/mmzone.h                       | 4 ++--

Acked-by: Arnd Bergmann <arnd@arndb.de>
