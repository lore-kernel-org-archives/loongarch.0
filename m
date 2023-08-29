Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0417EC
	for <loongarch@lists.linux.dev>; Tue, 29 Aug 2023 02:48:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FE73C433C8
	for <loongarch@lists.linux.dev>; Tue, 29 Aug 2023 02:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693277295;
	bh=kNuP4q9TRC1SaABSZZRRHLtlhB0mc1MoyTWoZBWmyQU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pCuCxmht4EhFGksNGGZLh3pHryQ0Be3ZScjHEFNgWQH64BB6riAmCUdmp7ZxD+riw
	 Qc+IRAe9hwBACTURLWeU37Ur97ytoCP7jqOJWmlCBoYgoLM1H6JjGRFpOIPhsI0w3U
	 Yek/cgfM/dADKdPr1un/hpntGxX2T6zE+Cf3NIy1x5SODXl8LLj3LXIwpDauoC8XQk
	 eOvZYmUZRF1hJ18A1bfS8N/K+aCUXdoMZJ6cYw0LilYQoxioDebvjX4TwzYvPG0H7b
	 KUO5GxK9Rw9tUHkZEkolBnfWM0SCR3rsW2ZQ20E5yQqTsS3v1+npM1RkMcSVwW5X0t
	 hk/BEBAemkTfA==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-99bdcade7fbso496780866b.1
        for <loongarch@lists.linux.dev>; Mon, 28 Aug 2023 19:48:15 -0700 (PDT)
X-Gm-Message-State: AOJu0YwkQcrrcLuJ39QqbDYrXj0Tw4vjj4mCcVLji9DyV+j0o+cQbPef
	QdYRxND+JZZZM7us6NJBzVK+CbDmyzWd0n2x9t4=
X-Google-Smtp-Source: AGHT+IHSIGhz8Ibm6jzz+Z/s2SgXQDEmDO0di1zNl8UUcmmRvYPPwFxLEiIE1Nayz4XSe0SpJKddfY0Qrn9mueX7ulM=
X-Received: by 2002:a17:907:724b:b0:9a4:511c:fbe4 with SMTP id
 ds11-20020a170907724b00b009a4511cfbe4mr9182331ejc.51.1693277293776; Mon, 28
 Aug 2023 19:48:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230828152540.1194317-1-chenhuacai@loongson.cn> <08503cb1-102e-9101-51a1-47b7cf7cb0be@xen0n.name>
In-Reply-To: <08503cb1-102e-9101-51a1-47b7cf7cb0be@xen0n.name>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 29 Aug 2023 10:48:02 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7daCxvxSLfLq7+saOrrKjqA-NR-3krpf=bzbYzOM1p5A@mail.gmail.com>
Message-ID: <CAAhV-H7daCxvxSLfLq7+saOrrKjqA-NR-3krpf=bzbYzOM1p5A@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Remove shm_align_mask and use SHMLBA instead
To: WANG Xuerui <kernel@xen0n.name>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Arnd Bergmann <arnd@arndb.de>, loongarch@lists.linux.dev, 
	linux-arch@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>, 
	Guo Ren <guoren@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn, 
	Jiantao Shan <shanjiantao@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Xuerui,

On Tue, Aug 29, 2023 at 1:05=E2=80=AFAM WANG Xuerui <kernel@xen0n.name> wro=
te:
>
> On 8/28/23 23:25, Huacai Chen wrote:
> > Both shm_align_mask and SHMLBA want to avoid cache alias. But they are
> > inconsistent: shm_align_mask is (PAGE_SIZE - 1) while SHMLBA is SZ_64K,
> > but PAGE_SIZE is not always equal to SZ_64K.
> >
> > This may cause problems when shmat() twice. Fix this problem by removin=
g
> > shm_align_mask and using SHMLBA (SHMLBA - 1, strctly) instead.
> "strictly SHMLBA - 1"?
> >
> > Reported-by: Jiantao Shan <shanjiantao@loongson.cn>
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > ---
> >   arch/loongarch/mm/cache.c      |  1 -
> >   arch/loongarch/mm/mmap.c       | 12 ++++--------
> >   3 files changed, 8 insertions(+), 9 deletions(-)
> >
> > diff --git a/arch/loongarch/mm/cache.c b/arch/loongarch/mm/cache.c
> > index 72685a48eaf0..6be04d36ca07 100644
> > --- a/arch/loongarch/mm/cache.c
> > +++ b/arch/loongarch/mm/cache.c
> > @@ -156,7 +156,6 @@ void cpu_cache_init(void)
> >
> >       current_cpu_data.cache_leaves_present =3D leaf;
> >       current_cpu_data.options |=3D LOONGARCH_CPU_PREFETCH;
> > -     shm_align_mask =3D PAGE_SIZE - 1;
> >   }
> >
> >   static const pgprot_t protection_map[16] =3D {
> > diff --git a/arch/loongarch/mm/mmap.c b/arch/loongarch/mm/mmap.c
> > index fbe1a4856fc4..c99c8015651a 100644
> > --- a/arch/loongarch/mm/mmap.c
> > +++ b/arch/loongarch/mm/mmap.c
> > @@ -8,12 +8,8 @@
> >   #include <linux/mm.h>
> >   #include <linux/mman.h>
> >
> > -unsigned long shm_align_mask =3D PAGE_SIZE - 1;        /* Sane caches =
*/
> > -EXPORT_SYMBOL(shm_align_mask);
>
> By removing this altogether, a lot of code duplication is introduced it
> seems. Better make this a private #define so use sites remain nicely
> symbolic:
>
> "#define SHM_ALIGN_MASK (SHMLBA - 1)"
OK, thanks.

Huacai
>
> > -
> > -#define COLOUR_ALIGN(addr, pgoff)                            \
> > -     ((((addr) + shm_align_mask) & ~shm_align_mask) +        \
> > -      (((pgoff) << PAGE_SHIFT) & shm_align_mask))
> > +#define COLOUR_ALIGN(addr, pgoff)                    \
> > +     ((((addr) + (SHMLBA - 1)) & ~(SHMLBA - 1)) + (((pgoff) << PAGE_SH=
IFT) & (SHMLBA - 1)))
> >
> >   enum mmap_allocation_direction {UP, DOWN};
> >
> > @@ -40,7 +36,7 @@ static unsigned long arch_get_unmapped_area_common(st=
ruct file *filp,
> >                * cache aliasing constraints.
> >                */
> >               if ((flags & MAP_SHARED) &&
> > -                 ((addr - (pgoff << PAGE_SHIFT)) & shm_align_mask))
> > +                 ((addr - (pgoff << PAGE_SHIFT)) & (SHMLBA - 1)))
> >                       return -EINVAL;
> >               return addr;
> >       }
> > @@ -63,7 +59,7 @@ static unsigned long arch_get_unmapped_area_common(st=
ruct file *filp,
> >       }
> >
> >       info.length =3D len;
> > -     info.align_mask =3D do_color_align ? (PAGE_MASK & shm_align_mask)=
 : 0;
> > +     info.align_mask =3D do_color_align ? (PAGE_MASK & (SHMLBA - 1)) :=
 0;
> >       info.align_offset =3D pgoff << PAGE_SHIFT;
> >
> >       if (dir =3D=3D DOWN) {
>
> --
> WANG "xen0n" Xuerui
>
> Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/
>
>
