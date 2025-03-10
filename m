Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DABB2F28
	for <loongarch@lists.linux.dev>; Mon, 10 Mar 2025 00:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741567452; cv=none; b=ZohmTsatCQPGV/KI0opYS6GgjYq0AudraRPZFPx/tJ9Ux2iBCUEb+FVKMK2WXjrgZJlsSQo5Z+w8f4xUbfpEipsh5qrL8MobKWI7MMgDjULFlaV9Tf8fJEtSx/CZLdqbpl7HTLwwXeb6P0czZQYcqUByCbmGYTbqY2xFKLMfRbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741567452; c=relaxed/simple;
	bh=tXY/sDLcuj92SaFYz0hFOsAFXofDkFw5jSfwl2CB2dY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Avpb6nQg8tiypAKPBMsOqP2D7bXIzPcadQ1KsHlPsa1osw3FPzko/b5HgaP/u0Vz6K2pdii+7ywrKIJgka1Kyh/lcaV+ADaH1mrT7iS67J0aX5c1LZy9hICJJ3etYcTCxhWa8PKTs4wMW62vm7Sp1vW2o+/rMtuhCS88vYI2s3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BVSocaYZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BVSocaYZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A69AFC4CEF3
	for <loongarch@lists.linux.dev>; Mon, 10 Mar 2025 00:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741567451;
	bh=tXY/sDLcuj92SaFYz0hFOsAFXofDkFw5jSfwl2CB2dY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BVSocaYZc2rAS9DmzOR25Py/nYQDKd36w67O/0f9ylpFUIWrKw00/eEyMdMxUmEnT
	 NCXedm8BdKAPb2DDHW/gVC70TSdEV2tqTRDbyeVdnS0x5i7l3qBINrQb5+yrFjV2nL
	 yJlPfiMabW5EhD/hEm2DYm0W3dPpC5LvZoTr7ApvT8Ju7gY1RegDx5zL1A0z9PwyXG
	 3yRjPZw573XVubRbjFOXqpAoQhLdKtK714p3+ESSV5Xi9sNjr5uTPAsxaHljEkBrNR
	 8s92NP6QLtWXH4QXEwGK53QDFSH2XRVYuup0zGWIcKuguSpfx56dz9btSD3K/PGaKw
	 AQmLlaIjyhUCw==
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39129fc51f8so3057856f8f.0
        for <loongarch@lists.linux.dev>; Sun, 09 Mar 2025 17:44:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVzyHdjCrDhnB+AAv+8kkW3w8Q01VDvlExIQ60yKkCUNtHmx4hjIk3XpMs3koDoN5PUbXi2dHJA7rw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxTZMoUZfT4jKj386vXsOA23dKPAlEf6K9LL/T71cRcTMyxQFZO
	6Z8PnOnP1HOXNRtMC7dKgCwecYNx4J19SwIos9Gj9z+Rim2xohTwxBHpSCZ/f9FVAeZfoRWYwZB
	FixMqaLbVEvnhf2go7n6ADkFOCVI=
X-Google-Smtp-Source: AGHT+IHp0xTG1Ng23HFO+vDoVdsoufkarKG1pMLa2Hgf32UrExuCoU7QvtsFi3JnHOAx4U/X+f6ME+7JOCYs321ZM0M=
X-Received: by 2002:a5d:6d8a:0:b0:391:1218:d5f7 with SMTP id
 ffacd0b85a97d-39132dacbd3mr7997015f8f.40.1741567450112; Sun, 09 Mar 2025
 17:44:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250306185124.3147510-1-rppt@kernel.org> <20250306185124.3147510-3-rppt@kernel.org>
In-Reply-To: <20250306185124.3147510-3-rppt@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 10 Mar 2025 08:43:58 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQBLMt01QjnhX1tCgHs6HJm1hZXQXgVjNkNS5Yt5t4UCQ@mail.gmail.com>
X-Gm-Features: AQ5f1JpCBLojM2w9P1ED3pCe1VmP9TPz-dzItajSIbNDMlmKYLEeMGoNaHpCAZk
Message-ID: <CAJF2gTQBLMt01QjnhX1tCgHs6HJm1hZXQXgVjNkNS5Yt5t4UCQ@mail.gmail.com>
Subject: Re: [PATCH 02/13] csky: move setup_initrd() to setup.c
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Andreas Larsson <andreas@gaisler.com>, Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Johannes Berg <johannes@sipsolutions.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>, 
	Stafford Horne <shorne@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>, 
	Will Deacon <will@kernel.org>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Move setup_initrd from mem_init into memblock_init, that LGTM.

Acked by: Guo Ren (csky) <guoren@kernel.org>

On Fri, Mar 7, 2025 at 2:52=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wrot=
e:
>
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> Memory used by initrd should be reserved as soon as possible before
> there any memblock allocations that might overwrite that memory.
>
> This will also help with pulling out memblock_free_all() to the generic
> code and reducing code duplication in arch::mem_init().
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  arch/csky/kernel/setup.c | 43 ++++++++++++++++++++++++++++++++++++++++
>  arch/csky/mm/init.c      | 43 ----------------------------------------
>  2 files changed, 43 insertions(+), 43 deletions(-)
>
> diff --git a/arch/csky/kernel/setup.c b/arch/csky/kernel/setup.c
> index fe715b707fd0..e0d6ca86ea8c 100644
> --- a/arch/csky/kernel/setup.c
> +++ b/arch/csky/kernel/setup.c
> @@ -12,6 +12,45 @@
>  #include <asm/mmu_context.h>
>  #include <asm/pgalloc.h>
>
> +#ifdef CONFIG_BLK_DEV_INITRD
> +static void __init setup_initrd(void)
> +{
> +       unsigned long size;
> +
> +       if (initrd_start >=3D initrd_end) {
> +               pr_err("initrd not found or empty");
> +               goto disable;
> +       }
> +
> +       if (__pa(initrd_end) > PFN_PHYS(max_low_pfn)) {
> +               pr_err("initrd extends beyond end of memory");
> +               goto disable;
> +       }
> +
> +       size =3D initrd_end - initrd_start;
> +
> +       if (memblock_is_region_reserved(__pa(initrd_start), size)) {
> +               pr_err("INITRD: 0x%08lx+0x%08lx overlaps in-use memory re=
gion",
> +                      __pa(initrd_start), size);
> +               goto disable;
> +       }
> +
> +       memblock_reserve(__pa(initrd_start), size);
> +
> +       pr_info("Initial ramdisk at: 0x%p (%lu bytes)\n",
> +               (void *)(initrd_start), size);
> +
> +       initrd_below_start_ok =3D 1;
> +
> +       return;
> +
> +disable:
> +       initrd_start =3D initrd_end =3D 0;
> +
> +       pr_err(" - disabling initrd\n");
> +}
> +#endif
> +
>  static void __init csky_memblock_init(void)
>  {
>         unsigned long lowmem_size =3D PFN_DOWN(LOWMEM_LIMIT - PHYS_OFFSET=
_OFFSET);
> @@ -40,6 +79,10 @@ static void __init csky_memblock_init(void)
>                 max_low_pfn =3D min_low_pfn + sseg_size;
>         }
>
> +#ifdef CONFIG_BLK_DEV_INITRD
> +       setup_initrd();
> +#endif
> +
>         max_zone_pfn[ZONE_NORMAL] =3D max_low_pfn;
>
>         mmu_init(min_low_pfn, max_low_pfn);
> diff --git a/arch/csky/mm/init.c b/arch/csky/mm/init.c
> index bde7cabd23df..ab51acbc19b2 100644
> --- a/arch/csky/mm/init.c
> +++ b/arch/csky/mm/init.c
> @@ -42,45 +42,6 @@ unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsig=
ned long)]
>                                                 __page_aligned_bss;
>  EXPORT_SYMBOL(empty_zero_page);
>
> -#ifdef CONFIG_BLK_DEV_INITRD
> -static void __init setup_initrd(void)
> -{
> -       unsigned long size;
> -
> -       if (initrd_start >=3D initrd_end) {
> -               pr_err("initrd not found or empty");
> -               goto disable;
> -       }
> -
> -       if (__pa(initrd_end) > PFN_PHYS(max_low_pfn)) {
> -               pr_err("initrd extends beyond end of memory");
> -               goto disable;
> -       }
> -
> -       size =3D initrd_end - initrd_start;
> -
> -       if (memblock_is_region_reserved(__pa(initrd_start), size)) {
> -               pr_err("INITRD: 0x%08lx+0x%08lx overlaps in-use memory re=
gion",
> -                      __pa(initrd_start), size);
> -               goto disable;
> -       }
> -
> -       memblock_reserve(__pa(initrd_start), size);
> -
> -       pr_info("Initial ramdisk at: 0x%p (%lu bytes)\n",
> -               (void *)(initrd_start), size);
> -
> -       initrd_below_start_ok =3D 1;
> -
> -       return;
> -
> -disable:
> -       initrd_start =3D initrd_end =3D 0;
> -
> -       pr_err(" - disabling initrd\n");
> -}
> -#endif
> -
>  void __init mem_init(void)
>  {
>  #ifdef CONFIG_HIGHMEM
> @@ -92,10 +53,6 @@ void __init mem_init(void)
>  #endif
>         high_memory =3D (void *) __va(max_low_pfn << PAGE_SHIFT);
>
> -#ifdef CONFIG_BLK_DEV_INITRD
> -       setup_initrd();
> -#endif
> -
>         memblock_free_all();
>
>  #ifdef CONFIG_HIGHMEM
> --
> 2.47.2
>


--=20
Best Regards
 Guo Ren
