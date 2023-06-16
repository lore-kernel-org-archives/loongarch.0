Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C7E1F160
	for <loongarch@lists.linux.dev>; Fri, 16 Jun 2023 20:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FDA1C433C0
	for <loongarch@lists.linux.dev>; Fri, 16 Jun 2023 20:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686946219;
	bh=WUwJ/CcnS7KQMIGc+n1lO6t7DBapdJHs3PtzN2L5DOs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tvFwKK05+1xn/zFlZ8hIAg1/8j1KoC6TrI2q6Y8JxzXsD1mJiAKl2YLRJVdXynja0
	 QvpJMzIs3ZEWbrsSxsITbvxIQNpdqgf4BGNabeJS/FxGxNUy8oGOW2SfqdN2jG+wBO
	 i6aj93uZasUkX7O7xG3MtVYRprkOD9kcB7dakAkePMeaWY/dQkCfDJ93Eurms6o8Ky
	 McM8MpK6U9f/raFjOqe/d5ku9LEQLXsdZNoEoIHkapvZHVVTku7zEiUZni2ATIkdJ/
	 +6fGiD3smTUkEh0uGUd1Bji29f1hb7noDinK67WShNZ7uSlPuhXNZHNPegFlSu/4Ps
	 yJtjFWLM6h66A==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5183101690cso4615853a12.0
        for <loongarch@lists.linux.dev>; Fri, 16 Jun 2023 13:10:19 -0700 (PDT)
X-Gm-Message-State: AC+VfDxnGHKCo6T9paqx6aGL/1aB0TY0pP796kJcEZLvsRaPZNFv9vAQ
	yOgYPKOOINRQjmK5P0HzC0qOHM0NXnqAHaTwwCI=
X-Google-Smtp-Source: ACHHUZ7ituqSYIn1SCVORmrSh+1n8O6ydQ9eZHh9b53aIx4zqNf09sKQF/S2prJ95SKqvJfHTGetd9Upy9eJLOlNi04=
X-Received: by 2002:a05:6512:3052:b0:4f7:47bb:2ce0 with SMTP id
 b18-20020a056512305200b004f747bb2ce0mr3066562lfb.4.1686946197316; Fri, 16 Jun
 2023 13:09:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230616085038.4121892-1-rppt@kernel.org> <20230616085038.4121892-10-rppt@kernel.org>
In-Reply-To: <20230616085038.4121892-10-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 16 Jun 2023 13:09:45 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6TmwsBmP4NQroE5OEFsaHh+S9zweXa4Fs_ZeJURguqAg@mail.gmail.com>
Message-ID: <CAPhsuW6TmwsBmP4NQroE5OEFsaHh+S9zweXa4Fs_ZeJURguqAg@mail.gmail.com>
Subject: Re: [PATCH v2 09/12] powerpc: extend execmem_params for kprobes allocations
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
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

On Fri, Jun 16, 2023 at 1:52=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
>
> powerpc overrides kprobes::alloc_insn_page() to remove writable
> permissions when STRICT_MODULE_RWX is on.
>
> Add definition of jit area to execmem_params to allow using the generic
> kprobes::alloc_insn_page() with the desired permissions.
>
> As powerpc uses breakpoint instructions to inject kprobes, it does not
> need to constrain kprobe allocations to the modules area and can use the
> entire vmalloc address space.
>
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>

Acked-by: Song Liu <song@kernel.org>


> ---
>  arch/powerpc/kernel/kprobes.c | 14 --------------
>  arch/powerpc/kernel/module.c  | 13 +++++++++++++
>  2 files changed, 13 insertions(+), 14 deletions(-)
>
> diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.=
c
> index 5db8df5e3657..14c5ddec3056 100644
> --- a/arch/powerpc/kernel/kprobes.c
> +++ b/arch/powerpc/kernel/kprobes.c
> @@ -126,20 +126,6 @@ kprobe_opcode_t *arch_adjust_kprobe_addr(unsigned lo=
ng addr, unsigned long offse
>         return (kprobe_opcode_t *)(addr + offset);
>  }
>
> -void *alloc_insn_page(void)
> -{
> -       void *page;
> -
> -       page =3D jit_text_alloc(PAGE_SIZE);
> -       if (!page)
> -               return NULL;
> -
> -       if (strict_module_rwx_enabled())
> -               set_memory_rox((unsigned long)page, 1);
> -
> -       return page;
> -}
> -
>  int arch_prepare_kprobe(struct kprobe *p)
>  {
>         int ret =3D 0;
> diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.c
> index 4c6c15bf3947..8e5b379d6da1 100644
> --- a/arch/powerpc/kernel/module.c
> +++ b/arch/powerpc/kernel/module.c
> @@ -96,6 +96,11 @@ static struct execmem_params execmem_params =3D {
>                         .alignment =3D 1,
>                 },
>         },
> +       .jit =3D {
> +               .text =3D {
> +                       .alignment =3D 1,
> +               },
> +       },
>  };
>
>
> @@ -131,5 +136,13 @@ struct execmem_params __init *execmem_arch_params(vo=
id)
>
>         execmem_params.modules.text.pgprot =3D prot;
>
> +       execmem_params.jit.text.start =3D VMALLOC_START;
> +       execmem_params.jit.text.end =3D VMALLOC_END;
> +
> +       if (strict_module_rwx_enabled())
> +               execmem_params.jit.text.pgprot =3D PAGE_KERNEL_ROX;
> +       else
> +               execmem_params.jit.text.pgprot =3D PAGE_KERNEL_EXEC;
> +
>         return &execmem_params;
>  }
> --
> 2.35.1
>
