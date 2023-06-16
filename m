Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23A6101F6
	for <loongarch@lists.linux.dev>; Fri, 16 Jun 2023 18:54:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB9B2C433C8
	for <loongarch@lists.linux.dev>; Fri, 16 Jun 2023 18:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686941668;
	bh=Yn4AaKJNeoRa5k6Rpqw8rOaWUpFfj0b/8Nallv5Pzds=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tS3T25328Ry4+bbStkvhqPOaQYKIgyWIRo+rJbSxueMCFSnGczWWYpZj6AnwATq4n
	 xj6H74uVWpIE2jzKuflG684dTPu714WcZws3vhZrdJSGSsXmwqLuiYFbbCz7Md1MN1
	 cPvjq2fbsd7O7eNOz08mHmt6k0loqX+vhg+JdoimEQYiyq++ZI8UiL0HmM4cvswD95
	 LBLeHNVJH3+9vajp2qodzsh1yfB35phvSF3NCNaHE8sJtAECiCU0cgxBrqEJIXGY9X
	 vo/iK259EGArExgE4QCDLhnPZw/MWndc2aOnnuLQTIQ2YQjF1xqwCefV0BQVQd9Bb8
	 +PMLqFW3veMmw==
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-30fc26affa9so784345f8f.0
        for <loongarch@lists.linux.dev>; Fri, 16 Jun 2023 11:54:28 -0700 (PDT)
X-Gm-Message-State: AC+VfDw6/fEv76KcaJyK5WtcAuAf5h4rPr83wpvgGTaTjIoKVPP4Co3K
	hNwVhbc28cTj7ZIELc5tpuhxigl3s9klrFX6/qs=
X-Google-Smtp-Source: ACHHUZ6uZ3NRfESc1LLdM7pG5QakOfq/c/daJr3jT6A/NUchGYkSu86UqZO3PB3EltPOLvcz17COALW9nYWOKlX1r+w=
X-Received: by 2002:a19:7b05:0:b0:4f6:d9e:7c3b with SMTP id
 w5-20020a197b05000000b004f60d9e7c3bmr2147967lfc.44.1686941646932; Fri, 16 Jun
 2023 11:54:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230616085038.4121892-1-rppt@kernel.org> <20230616085038.4121892-5-rppt@kernel.org>
In-Reply-To: <20230616085038.4121892-5-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 16 Jun 2023 11:53:54 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7xE8sz8Nh2AdNb62k=8kgEPxaBCw3w50EfXraxmKca-A@mail.gmail.com>
Message-ID: <CAPhsuW7xE8sz8Nh2AdNb62k=8kgEPxaBCw3w50EfXraxmKca-A@mail.gmail.com>
Subject: Re: [PATCH v2 04/12] mm/execmem, arch: convert remaining overrides of
 module_alloc to execmem
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

On Fri, Jun 16, 2023 at 1:51=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
[...]
> diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
> index 5af4975caeb5..c3d999f3a3dd 100644
> --- a/arch/arm64/kernel/module.c
> +++ b/arch/arm64/kernel/module.c
> @@ -17,56 +17,50 @@
>  #include <linux/moduleloader.h>
>  #include <linux/scs.h>
>  #include <linux/vmalloc.h>
> +#include <linux/execmem.h>
>  #include <asm/alternative.h>
>  #include <asm/insn.h>
>  #include <asm/scs.h>
>  #include <asm/sections.h>
>
> -void *module_alloc(unsigned long size)
> +static struct execmem_params execmem_params =3D {
> +       .modules =3D {
> +               .flags =3D EXECMEM_KASAN_SHADOW,
> +               .text =3D {
> +                       .alignment =3D MODULE_ALIGN,
> +               },
> +       },
> +};
> +
> +struct execmem_params __init *execmem_arch_params(void)
>  {
>         u64 module_alloc_end =3D module_alloc_base + MODULES_VSIZE;
> -       gfp_t gfp_mask =3D GFP_KERNEL;
> -       void *p;
> -
> -       /* Silence the initial allocation */
> -       if (IS_ENABLED(CONFIG_ARM64_MODULE_PLTS))
> -               gfp_mask |=3D __GFP_NOWARN;
>
> -       if (IS_ENABLED(CONFIG_KASAN_GENERIC) ||
> -           IS_ENABLED(CONFIG_KASAN_SW_TAGS))
> -               /* don't exceed the static module region - see below */
> -               module_alloc_end =3D MODULES_END;
> +       execmem_params.modules.text.pgprot =3D PAGE_KERNEL;
> +       execmem_params.modules.text.start =3D module_alloc_base;

I think I mentioned this earlier. For arm64 with CONFIG_RANDOMIZE_BASE,
module_alloc_base is not yet set when execmem_arch_params() is
called. So we will need some extra logic for this.

Thanks,
Song


> +       execmem_params.modules.text.end =3D module_alloc_end;
>
> -       p =3D __vmalloc_node_range(size, MODULE_ALIGN, module_alloc_base,
> -                               module_alloc_end, gfp_mask, PAGE_KERNEL, =
VM_DEFER_KMEMLEAK,
> -                               NUMA_NO_NODE, __builtin_return_address(0)=
);
> -
> -       if (!p && IS_ENABLED(CONFIG_ARM64_MODULE_PLTS) &&
> +       /*
> +        * KASAN without KASAN_VMALLOC can only deal with module
> +        * allocations being served from the reserved module region,
> +        * since the remainder of the vmalloc region is already
> +        * backed by zero shadow pages, and punching holes into it
> +        * is non-trivial. Since the module region is not randomized
> +        * when KASAN is enabled without KASAN_VMALLOC, it is even
> +        * less likely that the module region gets exhausted, so we
> +        * can simply omit this fallback in that case.
> +        */
> +       if (IS_ENABLED(CONFIG_ARM64_MODULE_PLTS) &&
>             (IS_ENABLED(CONFIG_KASAN_VMALLOC) ||
>              (!IS_ENABLED(CONFIG_KASAN_GENERIC) &&
> -             !IS_ENABLED(CONFIG_KASAN_SW_TAGS))))
> -               /*
> -                * KASAN without KASAN_VMALLOC can only deal with module
> -                * allocations being served from the reserved module regi=
on,
> -                * since the remainder of the vmalloc region is already
> -                * backed by zero shadow pages, and punching holes into i=
t
> -                * is non-trivial. Since the module region is not randomi=
zed
> -                * when KASAN is enabled without KASAN_VMALLOC, it is eve=
n
> -                * less likely that the module region gets exhausted, so =
we
> -                * can simply omit this fallback in that case.
> -                */
> -               p =3D __vmalloc_node_range(size, MODULE_ALIGN, module_all=
oc_base,
> -                               module_alloc_base + SZ_2G, GFP_KERNEL,
> -                               PAGE_KERNEL, 0, NUMA_NO_NODE,
> -                               __builtin_return_address(0));
> -
> -       if (p && (kasan_alloc_module_shadow(p, size, gfp_mask) < 0)) {
> -               vfree(p);
> -               return NULL;
> +             !IS_ENABLED(CONFIG_KASAN_SW_TAGS)))) {
> +               unsigned long end =3D module_alloc_base + SZ_2G;
> +
> +               execmem_params.modules.text.fallback_start =3D module_all=
oc_base;
> +               execmem_params.modules.text.fallback_end =3D end;
>         }
>
> -       /* Memory is intended to be executable, reset the pointer tag. */
> -       return kasan_reset_tag(p);
> +       return &execmem_params;
>  }
>
>  enum aarch64_reloc_op {
