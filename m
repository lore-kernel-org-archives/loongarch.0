Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27137EE
	for <loongarch@lists.linux.dev>; Fri, 15 Sep 2023 03:22:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B89FC433C7
	for <loongarch@lists.linux.dev>; Fri, 15 Sep 2023 03:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694748155;
	bh=WZo85cFKx2yQFlaOIwHXEnceHiEm8QQ7OFUyZqTOQ34=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EhlYIyWuYeFpGAs2CHf/mjTCmlO55knSL4DzD82xvs51JFy+SB5sKf+KbcOK3ztR7
	 1QbVr3v9zKFPFxmUyqmfOs/xS1iUuPtk9UDSL8kz5PWzNxjw/kixmjCTjGnCguH1I+
	 Iz5USwmU8uSvz6HAGSvWeub0seZD5EB1Lk7N7s1JUHOlWNd83XEr/5j1x+Oc2YvFyR
	 P/gwsxVLE0rEdaYbd06CxDvEb8YNt0ZMZEQyWziqX6Mzk8zfJYl5nYo7FwVOG4oTUY
	 TUkhR2qgQQaDqUvMLE3MOHh/E4POve69/XQcn5pu2SxtJcmEbFbcX42rmbaaIqQIa2
	 XljzP6MQnlvqA==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-9a9cd066db5so225646066b.0
        for <loongarch@lists.linux.dev>; Thu, 14 Sep 2023 20:22:35 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw42CuUrgTHNBQxj6sz1r+bprnPhW7F1GR4Qw+dszYU6oJbKBhl
	IlvrtvOFZefkurNirdVQxHt+4LThs2n92WrpQVU=
X-Google-Smtp-Source: AGHT+IHVfvYOY7mljhyyfVJ3nbLlErvhjC/r7hmAZ9cMr4SeNYNxgCugoOdpRJOasofMnqiAsjpXtekANyp7iDtg234=
X-Received: by 2002:a17:906:4ca:b0:994:54ff:10f6 with SMTP id
 g10-20020a17090604ca00b0099454ff10f6mr312832eja.30.1694748153698; Thu, 14 Sep
 2023 20:22:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZQC5jS/Kc/JiBEOa@p100>
In-Reply-To: <ZQC5jS/Kc/JiBEOa@p100>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 15 Sep 2023 11:22:20 +0800
X-Gmail-Original-Message-ID: <CAAhV-H56oqmQhA1PKh3E6z0A04qfRPehQ8ATOiirAU2O+z=fgw@mail.gmail.com>
Message-ID: <CAAhV-H56oqmQhA1PKh3E6z0A04qfRPehQ8ATOiirAU2O+z=fgw@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Fix lockdep static memory detection
To: Helge Deller <deller@gmx.de>
Cc: WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	Guenter Roeck <linux@roeck-us.net>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Helge,

On Wed, Sep 13, 2023 at 3:18=E2=80=AFAM Helge Deller <deller@gmx.de> wrote:
>
> Since commit 0a6b58c5cd0d ("lockdep: fix static memory detection even
> more") the lockdep code uses is_kernel_core_data(), is_kernel_rodata()
> and init_section_contains() to verify if a lock is located inside a
> kernel static data section.
>
> This change triggers a failure on LoongArch, for which the vmlinux.lds.S
> script misses to put the locks (as part of in the .data.rel symbols)
> into the Linux data section.
> This patch fixes the lockdep problem by moving *(.data.rel*) symbols
> into the kernel data section (from _sdata to _edata).
>
> Additionally, move other wrongly assigned symbols too:
> - altinstructions into the _initdata section,
I think altinstructions cannot  be put into _initdata because it will
be used by modules.

Huacai

> - PLT symbols behind the read-only section, and
> - *(.la_abs) into the data section.
>
> Signed-off-by: Helge Deller <deller@gmx.de>
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Fixes: 0a6b58c5cd0d ("lockdep: fix static memory detection even more")
> Cc: stable <stable@kernel.org> # v6.4+
>
> diff --git a/arch/loongarch/kernel/vmlinux.lds.S b/arch/loongarch/kernel/=
vmlinux.lds.S
> index b1686afcf876..bb2ec86f37a8 100644
> --- a/arch/loongarch/kernel/vmlinux.lds.S
> +++ b/arch/loongarch/kernel/vmlinux.lds.S
> @@ -53,33 +53,6 @@ SECTIONS
>         . =3D ALIGN(PECOFF_SEGMENT_ALIGN);
>         _etext =3D .;
>
> -       /*
> -        * struct alt_inst entries. From the header (alternative.h):
> -        * "Alternative instructions for different CPU types or capabilit=
ies"
> -        * Think locking instructions on spinlocks.
> -        */
> -       . =3D ALIGN(4);
> -       .altinstructions : AT(ADDR(.altinstructions) - LOAD_OFFSET) {
> -               __alt_instructions =3D .;
> -               *(.altinstructions)
> -               __alt_instructions_end =3D .;
> -       }
> -
> -#ifdef CONFIG_RELOCATABLE
> -       . =3D ALIGN(8);
> -       .la_abs : AT(ADDR(.la_abs) - LOAD_OFFSET) {
> -               __la_abs_begin =3D .;
> -               *(.la_abs)
> -               __la_abs_end =3D .;
> -       }
> -#endif
> -
> -       .got : ALIGN(16) { *(.got) }
> -       .plt : ALIGN(16) { *(.plt) }
> -       .got.plt : ALIGN(16) { *(.got.plt) }
> -
> -       .data.rel : { *(.data.rel*) }
> -
>         . =3D ALIGN(PECOFF_SEGMENT_ALIGN);
>         __init_begin =3D .;
>         __inittext_begin =3D .;
> @@ -94,6 +67,18 @@ SECTIONS
>
>         __initdata_begin =3D .;
>
> +       /*
> +        * struct alt_inst entries. From the header (alternative.h):
> +        * "Alternative instructions for different CPU types or capabilit=
ies"
> +        * Think locking instructions on spinlocks.
> +        */
> +       . =3D ALIGN(4);
> +       .altinstructions : AT(ADDR(.altinstructions) - LOAD_OFFSET) {
> +               __alt_instructions =3D .;
> +               *(.altinstructions)
> +               __alt_instructions_end =3D .;
> +       }
> +
>         INIT_DATA_SECTION(16)
>         .exit.data : {
>                 EXIT_DATA
> @@ -113,6 +98,11 @@ SECTIONS
>
>         _sdata =3D .;
>         RO_DATA(4096)
> +
> +       .got : ALIGN(16) { *(.got) }
> +       .plt : ALIGN(16) { *(.plt) }
> +       .got.plt : ALIGN(16) { *(.got.plt) }
> +
>         RW_DATA(1 << CONFIG_L1_CACHE_SHIFT, PAGE_SIZE, THREAD_SIZE)
>
>         .rela.dyn : ALIGN(8) {
> @@ -121,6 +111,17 @@ SECTIONS
>                 __rela_dyn_end =3D .;
>         }
>
> +       .data.rel : { *(.data.rel*) }
> +
> +#ifdef CONFIG_RELOCATABLE
> +       . =3D ALIGN(8);
> +       .la_abs : AT(ADDR(.la_abs) - LOAD_OFFSET) {
> +               __la_abs_begin =3D .;
> +               *(.la_abs)
> +               __la_abs_end =3D .;
> +       }
> +#endif
> +
>         .sdata : {
>                 *(.sdata)
>         }
