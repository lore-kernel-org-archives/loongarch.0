Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1239036C
	for <loongarch@lists.linux.dev>; Sun, 25 Jun 2023 08:51:32 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-56ffd7d7fedso23246747b3.2
        for <loongarch@lists.linux.dev>; Sun, 25 Jun 2023 01:51:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687683092; x=1690275092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/Aydrd9oAz9wF8VtbGA6a+XUUai3n6kkWsRZbAgo9o=;
        b=GDNu9ffuvVgHbXVStOeH6qydOAmOFb8sHm5kReMq78ffMLcp9Fx1rxs+nh7aEZUcCQ
         OFiZfGidK2caAGT997jF9iY374LhI4SKqth3P23IA0WwZgCIBRCxISAcL088FWcNlWE5
         Df7yLqinkrLjGI4BkbS7Wo4vMwl9Y/5RTVfLwHi5GNHr8OF2J+0LcnW+86UQ0Ng6VMp5
         k2O7lHbLkBJQO/yCCegFMRfkoCB5lvTr4qtYBUqvA5+QIkjkb8q0e/cgCLyg8l+C0y14
         Aeq2ZoEq5CVyKZq/1jRMAR6pfZu+r9Aww0btncSeIjteeFtoyNTyNN4E8prSYaRZNG3v
         VPzw==
X-Gm-Message-State: AC+VfDwhfG1Bo2uJ/b9rra+15xIdzRJEhr/VaF+U11wLflqe/gMqOjv/
	AEJJhX6WUe6vXdZXpWbow+hAL0BCFRoE3Q==
X-Google-Smtp-Source: ACHHUZ491aeVYgQwUip4O6LF3prk//ehtY9928qksaAvY4YUkZJIBUTg34wELyqEJFbhzz9L6wUw8A==
X-Received: by 2002:a25:e60e:0:b0:c1c:9285:64c3 with SMTP id d14-20020a25e60e000000b00c1c928564c3mr1136857ybh.61.1687683091686;
        Sun, 25 Jun 2023 01:51:31 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id f135-20020a25cf8d000000b00b923b2935d9sm667658ybg.20.2023.06.25.01.51.30
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jun 2023 01:51:31 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-c13280dfb09so1211109276.2
        for <loongarch@lists.linux.dev>; Sun, 25 Jun 2023 01:51:30 -0700 (PDT)
X-Received: by 2002:a25:cc02:0:b0:c13:f86d:3324 with SMTP id
 l2-20020a25cc02000000b00c13f86d3324mr3724376ybf.14.1687683090555; Sun, 25 Jun
 2023 01:51:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230622205745.79707-1-vishal.moola@gmail.com> <20230622205745.79707-25-vishal.moola@gmail.com>
In-Reply-To: <20230622205745.79707-25-vishal.moola@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 25 Jun 2023 10:51:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU2ZM1oJ7=Br6nezLpxjDQo_07N3T-adOupDm0Jntp=Qg@mail.gmail.com>
Message-ID: <CAMuHMdU2ZM1oJ7=Br6nezLpxjDQo_07N3T-adOupDm0Jntp=Qg@mail.gmail.com>
Subject: Re: [PATCH v5 24/33] m68k: Convert various functions to use ptdescs
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org, 
	Hugh Dickins <hughd@google.com>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vishal,

On Thu, Jun 22, 2023 at 10:58=E2=80=AFPM Vishal Moola (Oracle)
<vishal.moola@gmail.com> wrote:
> As part of the conversions to replace pgtable constructor/destructors wit=
h
> ptdesc equivalents, convert various page table functions to use ptdescs.
>
> Some of the functions use the *get*page*() helper functions. Convert
> these to use pagetable_alloc() and ptdesc_address() instead to help
> standardize page tables further.
>
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Thanks for your patch!

> --- a/arch/m68k/include/asm/mcf_pgalloc.h
> +++ b/arch/m68k/include/asm/mcf_pgalloc.h

>  static inline pgd_t *pgd_alloc(struct mm_struct *mm)
>  {
>         pgd_t *new_pgd;
> +       struct ptdesc *ptdesc =3D pagetable_alloc((GFP_DMA | GFP_NOWARN) =
&

0-day already told you for v3 that GFP_NOWARN does not exist.
Please try cross-compiling your changes:
https://mirrors.edge.kernel.org/pub/tools/crosstool/

> +                       ~__GFP_HIGHMEM, 0);
>
> -       new_pgd =3D (pgd_t *)__get_free_page(GFP_DMA | __GFP_NOWARN);
> -       if (!new_pgd)
> +       if (!ptdesc)
>                 return NULL;
> +       new_pgd =3D ptdesc_address(ptdesc);
> +
>         memcpy(new_pgd, swapper_pg_dir, PTRS_PER_PGD * sizeof(pgd_t));
>         memset(new_pgd, 0, PAGE_OFFSET >> PGDIR_SHIFT);
>         return new_pgd;

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
