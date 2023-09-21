Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDCA168B3
	for <loongarch@lists.linux.dev>; Thu, 21 Sep 2023 22:52:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 234E7C433C8
	for <loongarch@lists.linux.dev>; Thu, 21 Sep 2023 22:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695336776;
	bh=N+rCKzD4RnGgPH16U+ccWdzVA4uu9GwvbHIaEOV8lLA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=J6OGCteIWrX9+v7wS6j4dSH7x+8h0nArAfmziqOvi4loGhtAqdlM4w9ZLU7iT6CUi
	 ZPT7G3NtDbesii5Drc4BssCV2gptq7r+I02/ow0sQKtEQfiRPL1OcE8c52D43zQe2b
	 2CYkYPtCOYkodd2+C/Gk/ZmcJtGXMxBurLCdSD3gLEi0Q1MUOINyEqjMYRgeeUQHaq
	 akb1i6F4g3/16UpG5P982vTHEvVIMIalVbpPGVqhO/DyAef0LgiL8RlYLAHeMcurKY
	 ztkfQ71FCzUGIs0c2v3ZouuOdFu3tQnK5PUGOZ93DYvwzEt3qvMuxUHke9GDgaT9ri
	 JKLtApOpPIexw==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-522bd411679so1794425a12.0
        for <loongarch@lists.linux.dev>; Thu, 21 Sep 2023 15:52:56 -0700 (PDT)
X-Gm-Message-State: AOJu0YxUPtm37d7dFBLihOpwEfrWhL6TdZMg6U+1mYCQFRszvZ9dOyeV
	7d0kQ9lhFgApTinl3IHHjmZw5zLkoKxEXrGPjQQ=
X-Google-Smtp-Source: AGHT+IHrJYRcXcnBl5OYoAS68DJ303ssKI8aEm5234o+h+Cle34G5bJm6ZjjrxLZlbKjfe5M7kikSCFf7m0lncLYrfA=
X-Received: by 2002:a05:6512:ac7:b0:500:b3e3:6fa6 with SMTP id
 n7-20020a0565120ac700b00500b3e36fa6mr7384141lfu.68.1695336753899; Thu, 21 Sep
 2023 15:52:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230918072955.2507221-1-rppt@kernel.org> <20230918072955.2507221-7-rppt@kernel.org>
In-Reply-To: <20230918072955.2507221-7-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Thu, 21 Sep 2023 15:52:21 -0700
X-Gmail-Original-Message-ID: <CAPhsuW73NMvdpmyrhGouQSAHEL9wRw_A+8dZ-5R4BU=UHH83cw@mail.gmail.com>
Message-ID: <CAPhsuW73NMvdpmyrhGouQSAHEL9wRw_A+8dZ-5R4BU=UHH83cw@mail.gmail.com>
Subject: Re: [PATCH v3 06/13] mm/execmem: introduce execmem_data_alloc()
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Luis Chamberlain <mcgrof@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nadav Amit <nadav.amit@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Puranjay Mohan <puranjay12@gmail.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Russell King <linux@armlinux.org.uk>, 
	Steven Rostedt <rostedt@goodmis.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-mm@kvack.org, linux-modules@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 18, 2023 at 12:31=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wr=
ote:
>
[...]
> diff --git a/include/linux/execmem.h b/include/linux/execmem.h
> index 519bdfdca595..09d45ac786e9 100644
> --- a/include/linux/execmem.h
> +++ b/include/linux/execmem.h
> @@ -29,6 +29,7 @@
>   * @EXECMEM_KPROBES: parameters for kprobes
>   * @EXECMEM_FTRACE: parameters for ftrace
>   * @EXECMEM_BPF: parameters for BPF
> + * @EXECMEM_MODULE_DATA: parameters for module data sections
>   * @EXECMEM_TYPE_MAX:
>   */
>  enum execmem_type {
> @@ -37,6 +38,7 @@ enum execmem_type {
>         EXECMEM_KPROBES,
>         EXECMEM_FTRACE,

In longer term, I think we can improve the JITed code and merge
kprobe/ftrace/bpf. to use the same ranges. Also, do we need special
setting for FTRACE? If not, let's just remove it.

>         EXECMEM_BPF,
> +       EXECMEM_MODULE_DATA,
>         EXECMEM_TYPE_MAX,
>  };

Overall, it is great that kprobe/ftrace/bpf no longer depend on modules.

OTOH, I think we should merge execmem_type and existing mod_mem_type.
Otherwise, we still need to handle page permissions in multiple places.
What is our plan for that?

Thanks,
Song


>
> @@ -107,6 +109,23 @@ struct execmem_params *execmem_arch_params(void);
>   */
>  void *execmem_text_alloc(enum execmem_type type, size_t size);
>
> +/**
> + * execmem_data_alloc - allocate memory for data coupled to code
> + * @type: type of the allocation
> + * @size: how many bytes of memory are required
> + *
> + * Allocates memory that will contain data coupled with executable code,
> + * like data sections in kernel modules.
> + *
> + * The memory will have protections defined by architecture.
> + *
> + * The allocated memory will reside in an area that does not impose
> + * restrictions on the addressing modes.
> + *
> + * Return: a pointer to the allocated memory or %NULL
> + */
> +void *execmem_data_alloc(enum execmem_type type, size_t size);
> +
>  /**
>   * execmem_free - free executable memory
>   * @ptr: pointer to the memory that should be freed
> diff --git a/kernel/module/main.c b/kernel/module/main.c
> index c4146bfcd0a7..2ae83a6abf66 100644
> --- a/kernel/module/main.c
> +++ b/kernel/module/main.c
> @@ -1188,25 +1188,16 @@ void __weak module_arch_freeing_init(struct modul=
e *mod)
>  {
>  }
>
> -static bool mod_mem_use_vmalloc(enum mod_mem_type type)
> -{
> -       return IS_ENABLED(CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC) &&
> -               mod_mem_type_is_core_data(type);
> -}
> -
>  static void *module_memory_alloc(unsigned int size, enum mod_mem_type ty=
pe)
>  {
> -       if (mod_mem_use_vmalloc(type))
> -               return vzalloc(size);
> +       if (mod_mem_type_is_data(type))
> +               return execmem_data_alloc(EXECMEM_MODULE_DATA, size);
>         return execmem_text_alloc(EXECMEM_MODULE_TEXT, size);
>  }
>
>  static void module_memory_free(void *ptr, enum mod_mem_type type)
>  {
> -       if (mod_mem_use_vmalloc(type))
> -               vfree(ptr);
> -       else
> -               execmem_free(ptr);
> +       execmem_free(ptr);
>  }
>
>  static void free_mod_mem(struct module *mod)
> diff --git a/mm/execmem.c b/mm/execmem.c
> index abcbd07e05ac..aeff85261360 100644
> --- a/mm/execmem.c
> +++ b/mm/execmem.c
> @@ -53,11 +53,23 @@ static void *execmem_alloc(size_t size, struct execme=
m_range *range)
>         return kasan_reset_tag(p);
>  }
>
> +static inline bool execmem_range_is_data(enum execmem_type type)
> +{
> +       return type =3D=3D EXECMEM_MODULE_DATA;
> +}
> +
>  void *execmem_text_alloc(enum execmem_type type, size_t size)
>  {
>         return execmem_alloc(size, &execmem_params.ranges[type]);
>  }
>
> +void *execmem_data_alloc(enum execmem_type type, size_t size)
> +{
> +       WARN_ON_ONCE(!execmem_range_is_data(type));
> +
> +       return execmem_alloc(size, &execmem_params.ranges[type]);
> +}
> +
>  void execmem_free(void *ptr)
>  {
>         /*
> @@ -93,7 +105,10 @@ static void execmem_init_missing(struct execmem_param=
s *p)
>                 struct execmem_range *r =3D &p->ranges[i];
>
>                 if (!r->start) {
> -                       r->pgprot =3D default_range->pgprot;
> +                       if (execmem_range_is_data(i))
> +                               r->pgprot =3D PAGE_KERNEL;
> +                       else
> +                               r->pgprot =3D default_range->pgprot;
>                         r->alignment =3D default_range->alignment;
>                         r->start =3D default_range->start;
>                         r->end =3D default_range->end;
> --
> 2.39.2
>
