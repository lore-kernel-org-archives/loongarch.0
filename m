Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C941FBC
	for <loongarch@lists.linux.dev>; Tue, 16 Aug 2022 06:46:50 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id t11-20020a05683014cb00b0063734a2a786so6862356otq.11
        for <loongarch@lists.linux.dev>; Mon, 15 Aug 2022 23:46:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=mQKxHhlVCpHcdp8dQEIScJFQsrh06tzn535mwalxKj0=;
        b=moMY+5m5NcRrf9IwSkp/Dn4Ye9kKSz4LyC+AY/lpVPDuQyW3hY++Xfe9x2dpZ90dQj
         CGCJiE9m9mYSWvHVRva/e+FZRkCFvBzHw1/ikZi3yaLPf5+OnQ8t11bi+nF9jr1OYqVS
         rta6oWoPGjgJ8TDo4s0Ynf3d9MDlC9aBp+4NinqGyxSyrHUdgwb6O6SlIyEG3LgwaG+A
         rtaZNC/GVWjgDCOkXSeo/ri01Kq4Hc+PIGnT1PQPralH5u3lEeBMyYZedSGcKvX3Tzgv
         rLAk4AbdwhOwu65wmYLy9rk1+Zhkx7i5TVQZk6fjrFLYBglSWEOej9isJJbmyX/LJ49x
         58Aw==
X-Gm-Message-State: ACgBeo1NzXtaoNU7nCP7YbAU/nomRswH0pY7P38ArlPrP8k3xDwvTnLB
	pJF3p5wPScgj/plOsZucKkJ2R1R9+j42SQ==
X-Google-Smtp-Source: AA6agR4vdOLRDgMAJUcioGuBzTBfi7366iIgeJ1wtbeqp/3j3gwtmURfVQ3qlVkLPPvrqmq5O39dsQ==
X-Received: by 2002:a05:6830:2b12:b0:638:9266:56c3 with SMTP id l18-20020a0568302b1200b00638926656c3mr4936212otv.51.1660632409178;
        Mon, 15 Aug 2022 23:46:49 -0700 (PDT)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com. [209.85.210.42])
        by smtp.gmail.com with ESMTPSA id cz19-20020a056870649300b00118927e0dacsm1848744oab.4.2022.08.15.23.46.42
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Aug 2022 23:46:45 -0700 (PDT)
Received: by mail-ot1-f42.google.com with SMTP id o15-20020a9d718f000000b00638c1348012so1855498otj.2
        for <loongarch@lists.linux.dev>; Mon, 15 Aug 2022 23:46:42 -0700 (PDT)
X-Received: by 2002:a05:6902:100a:b0:676:ed53:25b0 with SMTP id
 w10-20020a056902100a00b00676ed5325b0mr13356288ybt.365.1660632391068; Mon, 15
 Aug 2022 23:46:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220815143959.1511278-1-zi.yan@sent.com>
In-Reply-To: <20220815143959.1511278-1-zi.yan@sent.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 Aug 2022 08:46:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWohdUZxi3A=H1wqY4rYrLD-ME6mmhWb6Z-udovd=1BhQ@mail.gmail.com>
Message-ID: <CAMuHMdWohdUZxi3A=H1wqY4rYrLD-ME6mmhWb6Z-udovd=1BhQ@mail.gmail.com>
Subject: Re: [PATCH] arch: mm: rename FORCE_MAX_ZONEORDER to ARCH_FORCE_MAX_ORDER
To: Zi Yan <ziy@nvidia.com>
Cc: Linux MM <linux-mm@kvack.org>, David Hildenbrand <david@redhat.com>, 
	Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Mike Kravetz <mike.kravetz@oracle.com>, 
	John Hubbard <jhubbard@nvidia.com>, Yang Shi <shy828301@gmail.com>, 
	David Rientjes <rientjes@google.com>, James Houghton <jthoughton@google.com>, 
	Mike Rapoport <rppt@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Mike Rapoport <rppt@linux.ibm.com>, Vineet Gupta <vgupta@synopsys.com>, 
	Shawn Guo <shawnguo@kernel.org>, Taichi Sugaya <sugaya.taichi@socionext.com>, 
	Neil Armstrong <narmstrong@baylibre.com>, Qin Jian <qinjian@cqplus1.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, "David S. Miller" <davem@davemloft.net>, 
	Chris Zankel <chris@zankel.net>, Arnd Bergmann <arnd@arndb.de>, Ley Foon Tan <ley.foon.tan@intel.com>, 
	Andrew Morton <akpm@linux-foundation.org>, NXP Linux Team <linux-imx@nxp.com>, 
	arcml <linux-snps-arc@lists.infradead.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-oxnas@groups.io, 
	linux-csky@vger.kernel.org, 
	"linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, loongarch@lists.linux.dev, 
	linux-m68k <linux-m68k@lists.linux-m68k.org>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	Linux-sh list <linux-sh@vger.kernel.org>, sparclinux <sparclinux@vger.kernel.org>, 
	"open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 15, 2022 at 4:40 PM Zi Yan <zi.yan@sent.com> wrote:
> From: Zi Yan <ziy@nvidia.com>
>
> This Kconfig option is used by individual arch to set its desired
> MAX_ORDER. Rename it to reflect its actual use.
>
> Acked-by: Mike Rapoport <rppt@linux.ibm.com>
> Signed-off-by: Zi Yan <ziy@nvidia.com>

>  arch/m68k/Kconfig.cpu                        | 2 +-

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
