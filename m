Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBF38F47
	for <loongarch@lists.linux.dev>; Wed,  7 Jun 2023 09:18:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB9DAC433A1
	for <loongarch@lists.linux.dev>; Wed,  7 Jun 2023 09:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686129529;
	bh=qrIG9avQ1YP8r3Y0SPd9NQVzpmprfhjnUb/fAC5rtKI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZZYPOv0zkI9dlgNWOtXAy6h/EzUz7nNtRYznUNGcGRqjzyvwPR/wWLnoi6it5wiWq
	 ze3hvg9WD7G17q1B+Ewgzs2LhhMtfin3n2A/ndYaJIl+MkYwPYtAWRar/rPj8EYlS9
	 6xgqw8tsLlyodUjJoBRogiE56FC1WwC/RuSGXqpCTl8EH0ebAp0imn1giZ+CgoeP2U
	 sd+AAnSmX5iSElATyhzk7WPiAacQNmt9AuknH/rUofywaImw+gjba/ji/XJ73rJbMz
	 VojVJLBXP0Avg5WJGaI5V92wBLeiG+kqoIiI6C3NPMqoycR2/Fw442vKPU1wc8e5pM
	 eK45ITOO/WaAQ==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-9745c5fed21so904950366b.3
        for <loongarch@lists.linux.dev>; Wed, 07 Jun 2023 02:18:48 -0700 (PDT)
X-Gm-Message-State: AC+VfDzJOAnVKHDRGF0gN9unCKRBRLRQEwpv8LFWtYh98LQ4dW5+jpTm
	U+8lq2Uec04DFx7Y7qQgmXnXDuvGGo9mzw62qcM=
X-Google-Smtp-Source: ACHHUZ5B2teGHL+1KBWSUcHAwX+ns15jkTjFBYHGCOVfepwdBPFBRs5caHewXdOZD+9qvUNYFXYCUXwwXQvzb2fsS3M=
X-Received: by 2002:a17:906:9b96:b0:973:c999:d639 with SMTP id
 dd22-20020a1709069b9600b00973c999d639mr6010472ejc.8.1686129526916; Wed, 07
 Jun 2023 02:18:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1685968410-5412-1-git-send-email-yangtiezhu@loongson.cn> <1685968410-5412-3-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1685968410-5412-3-git-send-email-yangtiezhu@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 7 Jun 2023 17:18:35 +0800
X-Gmail-Original-Message-ID: <CAAhV-H76kp+hoNUpN7znf9K6bmawShNkCVu2r=mFtAcq2xcVnQ@mail.gmail.com>
Message-ID: <CAAhV-H76kp+hoNUpN7znf9K6bmawShNkCVu2r=mFtAcq2xcVnQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] LoongArch: Add support to clone a time namespace
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Christian Brauner <brauner@kernel.org>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Queued for loongarch-next, thanks.

Huacai

On Mon, Jun 5, 2023 at 8:33=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn>=
 wrote:
>
> We can see that "Time namespaces are not supported" on LoongArch:
>
> (1) clone3 test
>   # cd tools/testing/selftests/clone3 && make && ./clone3
>   ...
>   # Time namespaces are not supported
>   ok 18 # SKIP Skipping clone3() with CLONE_NEWTIME
>   # Totals: pass:17 fail:0 xfail:0 xpass:0 skip:1 error:0
>
> (2) timens test
>   # cd tools/testing/selftests/timens && make && ./timens
>   ...
>   1..0 # SKIP Time namespaces are not supported
>
> The current kernel does not support CONFIG_TIME_NS which depends
> on GENERIC_VDSO_TIME_NS, select GENERIC_VDSO_TIME_NS to enable
> CONFIG_TIME_NS to build kernel/time/namespace.c.
>
> Additionally, it needs to define some arch dependent functions
> such as __arch_get_timens_vdso_data(), arch_get_vdso_data() and
> vdso_join_timens().
>
> At the same time, modify the layout of vvar to use a page size
> for generic vdso data, expand a page size for timens vdso data
> and assign LOONGARCH_VDSO_DATA_SIZE (maybe over a page size if
> expand in the future) for loongarch vdso data, at last add the
> callback function vvar_fault() and modify stack_top().
>
> With this patch under CONFIG_TIME_NS:
>
> (1) clone3 test
>   # cd tools/testing/selftests/clone3 && make && ./clone3
>   ...
>   ok 18 [739] Result (0) matches expectation (0)
>   # Totals: pass:18 fail:0 xfail:0 xpass:0 skip:0 error:0
>
> (2) timens test
>   # cd tools/testing/selftests/timens && make && ./timens
>   ...
>   # Totals: pass:10 fail:0 xfail:0 xpass:0 skip:0 error:0
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/loongarch/Kconfig                         |  1 +
>  arch/loongarch/include/asm/page.h              |  1 +
>  arch/loongarch/include/asm/vdso/gettimeofday.h | 10 ++-
>  arch/loongarch/include/asm/vdso/vdso.h         | 32 +++++++--
>  arch/loongarch/kernel/process.c                |  2 +-
>  arch/loongarch/kernel/vdso.c                   | 98 ++++++++++++++++++++=
+-----
>  arch/loongarch/vdso/vgetcpu.c                  |  3 +-
>  7 files changed, 123 insertions(+), 24 deletions(-)
>
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index d38b066..93b167f 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -80,6 +80,7 @@ config LOONGARCH
>         select GENERIC_SCHED_CLOCK
>         select GENERIC_SMP_IDLE_THREAD
>         select GENERIC_TIME_VSYSCALL
> +       select GENERIC_VDSO_TIME_NS
>         select GPIOLIB
>         select HAS_IOPORT
>         select HAVE_ARCH_AUDITSYSCALL
> diff --git a/arch/loongarch/include/asm/page.h b/arch/loongarch/include/a=
sm/page.h
> index fb5338b..26e8dcc 100644
> --- a/arch/loongarch/include/asm/page.h
> +++ b/arch/loongarch/include/asm/page.h
> @@ -81,6 +81,7 @@ typedef struct { unsigned long pgprot; } pgprot_t;
>  #define __va(x)                ((void *)((unsigned long)(x) + PAGE_OFFSE=
T - PHYS_OFFSET))
>
>  #define pfn_to_kaddr(pfn)      __va((pfn) << PAGE_SHIFT)
> +#define sym_to_pfn(x)          __phys_to_pfn(__pa_symbol(x))
>
>  #define virt_to_pfn(kaddr)     PFN_DOWN(PHYSADDR(kaddr))
>  #define virt_to_page(kaddr)    pfn_to_page(virt_to_pfn(kaddr))
> diff --git a/arch/loongarch/include/asm/vdso/gettimeofday.h b/arch/loonga=
rch/include/asm/vdso/gettimeofday.h
> index 7b2cd37..3c3043b 100644
> --- a/arch/loongarch/include/asm/vdso/gettimeofday.h
> +++ b/arch/loongarch/include/asm/vdso/gettimeofday.h
> @@ -91,9 +91,17 @@ static inline bool loongarch_vdso_hres_capable(void)
>
>  static __always_inline const struct vdso_data *__arch_get_vdso_data(void=
)
>  {
> -       return get_vdso_data();
> +       return (const struct vdso_data *)get_vdso_data();
>  }
>
> +#ifdef CONFIG_TIME_NS
> +static __always_inline
> +const struct vdso_data *__arch_get_timens_vdso_data(const struct vdso_da=
ta *vd)
> +{
> +       return (const struct vdso_data *)(get_vdso_data() +
> +               VVAR_TIMENS_PAGE_OFFSET * PAGE_SIZE);
> +}
> +#endif
>  #endif /* !__ASSEMBLY__ */
>
>  #endif /* __ASM_VDSO_GETTIMEOFDAY_H */
> diff --git a/arch/loongarch/include/asm/vdso/vdso.h b/arch/loongarch/incl=
ude/asm/vdso/vdso.h
> index 3b55d32..7e9bceb 100644
> --- a/arch/loongarch/include/asm/vdso/vdso.h
> +++ b/arch/loongarch/include/asm/vdso/vdso.h
> @@ -16,10 +16,33 @@ struct vdso_pcpu_data {
>
>  struct loongarch_vdso_data {
>         struct vdso_pcpu_data pdata[NR_CPUS];
> -       struct vdso_data data[CS_BASES]; /* Arch-independent data */
>  };
>
> -#define VDSO_DATA_SIZE PAGE_ALIGN(sizeof(struct loongarch_vdso_data))
> +/*
> + * The layout of vvar:
> + *
> + *                      high
> + * +---------------------+--------------------------+
> + * | loongarch vdso data | LOONGARCH_VDSO_DATA_SIZE |
> + * +---------------------+--------------------------+
> + * | timens vdso data    | PAGE_SIZE                |
> + * +---------------------+--------------------------+
> + * | generic vdso data   | PAGE_SIZE                |
> + * +---------------------+--------------------------+
> + *                      low
> + */
> +#define LOONGARCH_VDSO_DATA_SIZE PAGE_ALIGN(sizeof(struct loongarch_vdso=
_data))
> +#define LOONGARCH_VDSO_DATA_PAGES (LOONGARCH_VDSO_DATA_SIZE >> PAGE_SHIF=
T)
> +
> +enum vvar_pages {
> +       VVAR_GENERIC_PAGE_OFFSET,
> +       VVAR_TIMENS_PAGE_OFFSET,
> +       VVAR_LOONGARCH_PAGES_START,
> +       VVAR_LOONGARCH_PAGES_END =3D VVAR_LOONGARCH_PAGES_START + LOONGAR=
CH_VDSO_DATA_PAGES - 1,
> +       VVAR_NR_PAGES,
> +};
> +
> +#define VVAR_SIZE (VVAR_NR_PAGES << PAGE_SHIFT)
>
>  static inline unsigned long get_vdso_base(void)
>  {
> @@ -34,10 +57,9 @@ static inline unsigned long get_vdso_base(void)
>         return addr;
>  }
>
> -static inline const struct vdso_data *get_vdso_data(void)
> +static inline unsigned long get_vdso_data(void)
>  {
> -       return (const struct vdso_data *)(get_vdso_base()
> -                       - VDSO_DATA_SIZE + SMP_CACHE_BYTES * NR_CPUS);
> +       return get_vdso_base() - VVAR_SIZE;
>  }
>
>  #endif /* __ASSEMBLY__ */
> diff --git a/arch/loongarch/kernel/process.c b/arch/loongarch/kernel/proc=
ess.c
> index b71e17c..9535a06 100644
> --- a/arch/loongarch/kernel/process.c
> +++ b/arch/loongarch/kernel/process.c
> @@ -285,7 +285,7 @@ unsigned long stack_top(void)
>
>         /* Space for the VDSO & data page */
>         top -=3D PAGE_ALIGN(current->thread.vdso->size);
> -       top -=3D PAGE_SIZE;
> +       top -=3D VVAR_SIZE;
>
>         /* Space to randomize the VDSO base */
>         if (current->flags & PF_RANDOMIZE)
> diff --git a/arch/loongarch/kernel/vdso.c b/arch/loongarch/kernel/vdso.c
> index eaebd2e..cb75863 100644
> --- a/arch/loongarch/kernel/vdso.c
> +++ b/arch/loongarch/kernel/vdso.c
> @@ -14,6 +14,7 @@
>  #include <linux/random.h>
>  #include <linux/sched.h>
>  #include <linux/slab.h>
> +#include <linux/time_namespace.h>
>  #include <linux/timekeeper_internal.h>
>
>  #include <asm/page.h>
> @@ -26,12 +27,17 @@ extern char vdso_start[], vdso_end[];
>
>  /* Kernel-provided data used by the VDSO. */
>  static union {
> -       u8 page[VDSO_DATA_SIZE];
> +       u8 page[PAGE_SIZE];
> +       struct vdso_data data[CS_BASES];
> +} generic_vdso_data __page_aligned_data;
> +
> +static union {
> +       u8 page[LOONGARCH_VDSO_DATA_SIZE];
>         struct loongarch_vdso_data vdata;
>  } loongarch_vdso_data __page_aligned_data;
>
>  static struct page *vdso_pages[] =3D { NULL };
> -struct vdso_data *vdso_data =3D loongarch_vdso_data.vdata.data;
> +struct vdso_data *vdso_data =3D generic_vdso_data.data;
>  struct vdso_pcpu_data *vdso_pdata =3D loongarch_vdso_data.vdata.pdata;
>
>  static int vdso_mremap(const struct vm_special_mapping *sm, struct vm_ar=
ea_struct *new_vma)
> @@ -41,6 +47,43 @@ static int vdso_mremap(const struct vm_special_mapping=
 *sm, struct vm_area_struc
>         return 0;
>  }
>
> +static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
> +                            struct vm_area_struct *vma, struct vm_fault =
*vmf)
> +{
> +       struct page *timens_page =3D find_timens_vvar_page(vma);
> +       unsigned long pfn;
> +
> +       switch (vmf->pgoff) {
> +       case VVAR_GENERIC_PAGE_OFFSET:
> +               if (timens_page)
> +                       pfn =3D page_to_pfn(timens_page);
> +               else
> +                       pfn =3D sym_to_pfn(vdso_data);
> +               break;
> +#ifdef CONFIG_TIME_NS
> +       case VVAR_TIMENS_PAGE_OFFSET:
> +               /*
> +                * If a task belongs to a time namespace then a namespace=
 specific
> +                * VVAR is mapped with the VVAR_GENERIC_PAGE_OFFSET and t=
he real
> +                * VVAR page is mapped with the VVAR_TIMENS_PAGE_OFFSET o=
ffset.
> +                * See also the comment near timens_setup_vdso_data().
> +                */
> +               if (!timens_page)
> +                       return VM_FAULT_SIGBUS;
> +               pfn =3D sym_to_pfn(vdso_data);
> +               break;
> +#endif /* CONFIG_TIME_NS */
> +       case VVAR_LOONGARCH_PAGES_START ... VVAR_LOONGARCH_PAGES_END:
> +               pfn =3D sym_to_pfn(&loongarch_vdso_data) +
> +                     vmf->pgoff - VVAR_LOONGARCH_PAGES_START;
> +               break;
> +       default:
> +               return VM_FAULT_SIGBUS;
> +       }
> +
> +       return vmf_insert_pfn(vma, vmf->address, pfn);
> +}
> +
>  struct loongarch_vdso_info vdso_info =3D {
>         .vdso =3D vdso_start,
>         .size =3D PAGE_SIZE,
> @@ -51,6 +94,7 @@ struct loongarch_vdso_info vdso_info =3D {
>         },
>         .data_mapping =3D {
>                 .name =3D "[vvar]",
> +               .fault =3D vvar_fault,
>         },
>         .offset_sigreturn =3D vdso_offset_sigreturn,
>  };
> @@ -73,6 +117,37 @@ static int __init init_vdso(void)
>  }
>  subsys_initcall(init_vdso);
>
> +#ifdef CONFIG_TIME_NS
> +struct vdso_data *arch_get_vdso_data(void *vvar_page)
> +{
> +       return (struct vdso_data *)(vvar_page);
> +}
> +
> +/*
> + * The vvar mapping contains data for a specific time namespace, so when=
 a
> + * task changes namespace we must unmap its vvar data for the old namesp=
ace.
> + * Subsequent faults will map in data for the new namespace.
> + *
> + * For more details see timens_setup_vdso_data().
> + */
> +int vdso_join_timens(struct task_struct *task, struct time_namespace *ns=
)
> +{
> +       struct mm_struct *mm =3D task->mm;
> +       struct vm_area_struct *vma;
> +
> +       VMA_ITERATOR(vmi, mm, 0);
> +
> +       mmap_read_lock(mm);
> +       for_each_vma(vmi, vma) {
> +               if (vma_is_special_mapping(vma, &vdso_info.data_mapping))
> +                       zap_vma_pages(vma);
> +       }
> +       mmap_read_unlock(mm);
> +
> +       return 0;
> +}
> +#endif
> +
>  static unsigned long vdso_base(void)
>  {
>         unsigned long base =3D STACK_TOP;
> @@ -88,7 +163,7 @@ static unsigned long vdso_base(void)
>  int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_inte=
rp)
>  {
>         int ret;
> -       unsigned long vvar_size, size, data_addr, vdso_addr;
> +       unsigned long size, data_addr, vdso_addr;
>         struct mm_struct *mm =3D current->mm;
>         struct vm_area_struct *vma;
>         struct loongarch_vdso_info *info =3D current->thread.vdso;
> @@ -100,32 +175,23 @@ int arch_setup_additional_pages(struct linux_binprm=
 *bprm, int uses_interp)
>          * Determine total area size. This includes the VDSO data itself
>          * and the data pages.
>          */
> -       vvar_size =3D VDSO_DATA_SIZE;
> -       size =3D vvar_size + info->size;
> +       size =3D VVAR_SIZE + info->size;
>
>         data_addr =3D get_unmapped_area(NULL, vdso_base(), size, 0, 0);
>         if (IS_ERR_VALUE(data_addr)) {
>                 ret =3D data_addr;
>                 goto out;
>         }
> -       vdso_addr =3D data_addr + VDSO_DATA_SIZE;
>
> -       vma =3D _install_special_mapping(mm, data_addr, vvar_size,
> -                                      VM_READ | VM_MAYREAD,
> +       vma =3D _install_special_mapping(mm, data_addr, VVAR_SIZE,
> +                                      VM_READ | VM_MAYREAD | VM_PFNMAP,
>                                        &info->data_mapping);
>         if (IS_ERR(vma)) {
>                 ret =3D PTR_ERR(vma);
>                 goto out;
>         }
>
> -       /* Map VDSO data page. */
> -       ret =3D remap_pfn_range(vma, data_addr,
> -                             virt_to_phys(&loongarch_vdso_data) >> PAGE_=
SHIFT,
> -                             vvar_size, PAGE_READONLY);
> -       if (ret)
> -               goto out;
> -
> -       /* Map VDSO code page. */
> +       vdso_addr =3D data_addr + VVAR_SIZE;
>         vma =3D _install_special_mapping(mm, vdso_addr, info->size,
>                                        VM_READ | VM_EXEC | VM_MAYREAD | V=
M_MAYWRITE | VM_MAYEXEC,
>                                        &info->code_mapping);
> diff --git a/arch/loongarch/vdso/vgetcpu.c b/arch/loongarch/vdso/vgetcpu.=
c
> index e02e775..e7884f88 100644
> --- a/arch/loongarch/vdso/vgetcpu.c
> +++ b/arch/loongarch/vdso/vgetcpu.c
> @@ -21,7 +21,8 @@ static __always_inline int read_cpu_id(void)
>
>  static __always_inline const struct vdso_pcpu_data *get_pcpu_data(void)
>  {
> -       return (struct vdso_pcpu_data *)(get_vdso_base() - VDSO_DATA_SIZE=
);
> +       return (struct vdso_pcpu_data *)(get_vdso_data() +
> +               VVAR_LOONGARCH_PAGES_START * PAGE_SIZE);
>  }
>
>  extern
> --
> 2.1.0
>
