Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB93D2FAE
	for <loongarch@lists.linux.dev>; Sun, 12 Feb 2023 17:35:16 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-16df32f2ffdso2164297fac.1
        for <loongarch@lists.linux.dev>; Sun, 12 Feb 2023 09:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AviV4NP8CNDKVbz9j5WTQQVcHZAFX3ps8TmNJsoE4Jc=;
        b=MHIS9yiiSKowWCqVfdLqqCBXCJI87xi4ik1euT9MI5qsuF90euB0z5OyKuHA+cX91w
         YM7Wr6xuS7Jsgd7Y/u17CKVlvOwGsLCmOXhdEeanSjtI1beQ/D1NtEqo8E4P8eQmjrlC
         u7UFMNCSnuCP/T/T+tikXDIsSQMmHH2xGwg65Lv0VkoYlNQzShkSHlh6NsCvKZch8Vej
         m1HG5S97Md/HphSzvy3Z1aOcBibylidfKFslbj4nzbnKfNRe5nxJQMAlztxOYwkeDTKX
         lJ8sbGZbHDOmiA/KDUs9NhF4Uu6i1LxZhJTamcW/BCuJlw1+7dh4aeYpmNhWCcX+M886
         twIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AviV4NP8CNDKVbz9j5WTQQVcHZAFX3ps8TmNJsoE4Jc=;
        b=Iaf0IpSU5Z4g7NVo/++HFpM+hC6BxgWQKFsG6ghJp1l4rR8I9GnA5yLrGwFfn7QZfs
         WjNYJlSK9C/vI7jsQAF86cmka5Xcl5W3shTe2qRXe5u6O0Q6mBSsRiupMeNiI5mHOeHh
         XwOC4pKRnb8urQFRJbd11iGhFTKqrVFUmRoKaL5H6QWFA8j6whcHKdDaVHDt94DaoJoW
         RDGg1EGchKc/54owKrXil75DCNwFB+F2kGH2yrQl04KJItCxyLu2I+jLHvsgfqwkZ+fY
         HBY1bYChdlKN+NgE68dduOiTq8AE0zyUTEbaEm/a4eeTneluzYoh/MLJgT0SfRP7xkCC
         pP4w==
X-Gm-Message-State: AO0yUKVJwGw2FfCAynMVvgPOUYmRwMuQ4Pk6UMCyUCF31fJDQQe3Qr3s
	/GG8G9vh+Pw8EjnYvA9RINw=
X-Google-Smtp-Source: AK7set+HQUfu5iOqDoYfEGRzO6Asv+HJqu3wHpvaAM105ZXPUWPVLHg/VWo/CEfIvczS113vNKvB7Q==
X-Received: by 2002:a05:6871:9d:b0:15f:32b:6e33 with SMTP id u29-20020a056871009d00b0015f032b6e33mr15518149oaa.39.1676223315946;
        Sun, 12 Feb 2023 09:35:15 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i9-20020a4abc09000000b004a3527e8279sm4076452oop.0.2023.02.12.09.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 09:35:15 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 12 Feb 2023 09:35:13 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Brian Cain <bcain@quicinc.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@linux-m68k.org>, Guo Ren <guoren@kernel.org>,
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>, Rich Felker <dalias@libc.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Vineet Gupta <vgupta@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	openrisc@lists.librecores.org, sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v2 2/4] m68k: use asm-generic/memory_model.h for both MMU
 and !MMU
Message-ID: <20230212173513.GA4052259@roeck-us.net>
References: <20230129124235.209895-1-rppt@kernel.org>
 <20230129124235.209895-3-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230129124235.209895-3-rppt@kernel.org>

Hi,

On Sun, Jan 29, 2023 at 02:42:33PM +0200, Mike Rapoport wrote:
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> 
> The MMU variant uses generic definitions of page_to_pfn() and
> pfn_to_page(), but !MMU defines them in include/asm/page_no.h for no
> good reason.
> 
> Include asm-generic/memory_model.h in the common include/asm/page.h and
> drop redundant definitions.
> 
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

This patch results in a boot failure when trying to boot the mcf5208evb qemu
emulation. Reverting it together with "mm, arch: add generic implementation
of pfn_valid() for FLATMEM" fixes the problem. There is no error log - the
emulation hangs silently until aborted.

Guenter

---
bisect log:

# bad: [6ba8a227fd19d19779005fb66ad7562608e1df83] Add linux-next specific files for 20230210
# good: [4ec5183ec48656cec489c49f989c508b68b518e3] Linux 6.2-rc7
git bisect start 'HEAD' 'v6.2-rc7'
# good: [94613f0efc69ed41f9229ef5c294db3ec37145da] Merge branch 'master' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git
git bisect good 94613f0efc69ed41f9229ef5c294db3ec37145da
# good: [19e62c715fe70dae4582c2874ed3e66715d09af6] Merge branch 'rcu/next' of git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git
git bisect good 19e62c715fe70dae4582c2874ed3e66715d09af6
# good: [5d8b7ecef7f4a681b6e5538db59ff26c389c0ab6] Merge branch 'for-next' of https://gitlab.com/peda-linux/mux.git
git bisect good 5d8b7ecef7f4a681b6e5538db59ff26c389c0ab6
# good: [c349bf6ec83903b20fe570c5609b9a864a64e09c] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/krisman/unicode.git
git bisect good c349bf6ec83903b20fe570c5609b9a864a64e09c
# good: [5a06a9f17454df38f35672be522ff5eb9b4277d2] selftest: add testing unsharing and counting ksm zero page
git bisect good 5a06a9f17454df38f35672be522ff5eb9b4277d2
# bad: [f5d115a7b06e5661ed5218ffa9a2644c4ff1c135] Merge branch 'mm-nonmm-unstable' into mm-everything
git bisect bad f5d115a7b06e5661ed5218ffa9a2644c4ff1c135
# bad: [acb018d6ea0c055381fba7dddaef386ee28f8075] mm/vmalloc.c: allow vread() to read out vm_map_ram areas
git bisect bad acb018d6ea0c055381fba7dddaef386ee28f8075
# good: [1a5d9782ac969dc6e61c6786500b5160603188ea] mm/mmap: remove __vma_adjust()
git bisect good 1a5d9782ac969dc6e61c6786500b5160603188ea
# good: [4b32363697de957dcc890b6245bec3f58903639a] arm: include asm-generic/memory_model.h from page.h rather than memory.h
git bisect good 4b32363697de957dcc890b6245bec3f58903639a
# bad: [328cf3fa6682ce6a4de6f8bb8009c833dc33f3c8] mm/migrate: convert isolate_movable_page() to use folios
git bisect bad 328cf3fa6682ce6a4de6f8bb8009c833dc33f3c8
# bad: [b704c765b08cabe82adf76a4d1a74f3688eee410] mm/mempolicy: convert queue_pages_pmd() to queue_folios_pmd()
git bisect bad b704c765b08cabe82adf76a4d1a74f3688eee410
# bad: [e5734c8b0edfd2a053a5c256189586a3b1e9f63d] mm, arch: add generic implementation of pfn_valid() for FLATMEM
git bisect bad e5734c8b0edfd2a053a5c256189586a3b1e9f63d
# bad: [ad8aecea034c591b9754bc5908da9719853aa7fa] mips: drop definition of pfn_valid() for DISCONTIGMEM
git bisect bad ad8aecea034c591b9754bc5908da9719853aa7fa
# bad: [1f6271a0dfdf952c2e3981f424784d48f243a2be] m68k: use asm-generic/memory_model.h for both MMU and !MMU
git bisect bad 1f6271a0dfdf952c2e3981f424784d48f243a2be
# first bad commit: [1f6271a0dfdf952c2e3981f424784d48f243a2be] m68k: use asm-generic/memory_model.h for both MMU and !MMU
