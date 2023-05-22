Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E88EA8
	for <loongarch@lists.linux.dev>; Mon, 22 May 2023 03:57:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B576C433D2
	for <loongarch@lists.linux.dev>; Mon, 22 May 2023 03:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684727876;
	bh=rmRsLwPsY8RdReaDx5A3thngyWW5JfPxc0wxcRIITw8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=M2NIkDoWDZxfYoZLhOgrHrQ+kYCv/OorBmL2Mw3KQE4O4GKnD+DBJJeWamvqB+Ez7
	 S1kqTf44WbCWO5i+UTA16glKmbpAh8PWVlY3bUWsz6EsKBO6WuPdPpNWJjW9JKmYty
	 e8GgTxSkqO85806NXvvg1W1Bc2oBs4zy1B7NSgD7Cefd/AiucZrVqfAxGaIzKOf8KK
	 X634XqQ4uOlP6dWC9zQNWMNV7u+lUsgKTJlCp2gclp8tk2RAkeGbsFZEB+NlutHlZx
	 PVssCLwgUP76VsakoDs/DiQKvnkQcAMRwb/aF4q39bK6inuxOZ7l6bCg/RHcvfO4VW
	 VpM3VgXAdRNeQ==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-96fe2a1db26so109065366b.0
        for <loongarch@lists.linux.dev>; Sun, 21 May 2023 20:57:56 -0700 (PDT)
X-Gm-Message-State: AC+VfDyoJC5bYdJOl25eHxrHVZq9ZGesA2I3TACQiM/5Rb4vPLgnHPNp
	pBj/TKMToeN883HzBIWZcfuMewk6uPOAFtDrQoY=
X-Google-Smtp-Source: ACHHUZ4S60W5ag6R7p1iJeHzR3EniCrGlXawObFojtylFBe306KK/Vt1m05noVtbw8m1x8ydOGAdlbSIiOJ8hb7I2tM=
X-Received: by 2002:a17:907:3fa6:b0:96f:912d:7922 with SMTP id
 hr38-20020a1709073fa600b0096f912d7922mr7465575ejc.53.1684727874464; Sun, 21
 May 2023 20:57:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1684292580-2455-1-git-send-email-yangtiezhu@loongson.cn>
 <CAAhV-H6wtsFX+EUqzgseNmEW7FJk4b7b_PmcxKBiYu0qdHGwJQ@mail.gmail.com> <23ed6b8b-be53-bde0-717a-9eded1ad3780@loongson.cn>
In-Reply-To: <23ed6b8b-be53-bde0-717a-9eded1ad3780@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 22 May 2023 11:57:42 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5r7SPQ9Aqmk7NnXcXFnCcp9ArOMdJ+wG0u_=UGie4_Gw@mail.gmail.com>
Message-ID: <CAAhV-H5r7SPQ9Aqmk7NnXcXFnCcp9ArOMdJ+wG0u_=UGie4_Gw@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Add support to clone a time namespace
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: WANG Xuerui <kernel@xen0n.name>, Christian Brauner <brauner@kernel.org>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Tiezhu,

On Sat, May 20, 2023 at 6:35=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
>
>
> On 05/18/2023 10:25 AM, Huacai Chen wrote:
> > Hi, Tiezhu,
> >
> > The layout of vdso data (loongarch_vdso_data):
> >
> >        struct vdso_pcpu_data pdata[NR_CPUS];
> >        struct vdso_data data[CS_BASES];
> >
> > VDSO_DATA_SIZE is the page aligned size of loongarch_vdso_data, and in
> > memory, vdso code is above vdso data.
> >
> > Then, get_vdso_base() returns the start of vdso code, and
> > get_vdso_data() returns the start of vdso data.
> >
> > In your patch, __arch_get_timens_vdso_data() returns get_vdso_data() +
> > PAGE_SIZE, but you don't increase the size of loongarch_vdso_data. The
> > result is it returns an address in vdso code.
> >
> > Now, do you know what the problem is? Or still insist that "I have test=
ed"?
>
> Please review the following changes based on the current patch,
> modify the layout of vvar to expand a page size for timens_data,
> and also map it to zero pfn before creating time namespace, then
> the last thing is to add the callback function vvar_fault().
>
> $ git diff
> diff --git a/arch/loongarch/include/asm/page.h
> b/arch/loongarch/include/asm/page.h
> index fb5338b..26e8dcc 100644
> --- a/arch/loongarch/include/asm/page.h
> +++ b/arch/loongarch/include/asm/page.h
> @@ -81,6 +81,7 @@ typedef struct { unsigned long pgprot; } pgprot_t;
>   #define __va(x)                ((void *)((unsigned long)(x) +
> PAGE_OFFSET - PHYS_OFFSET))
>
>   #define pfn_to_kaddr(pfn)      __va((pfn) << PAGE_SHIFT)
> +#define sym_to_pfn(x)          __phys_to_pfn(__pa_symbol(x))
>
>   #define virt_to_pfn(kaddr)     PFN_DOWN(PHYSADDR(kaddr))
>   #define virt_to_page(kaddr)    pfn_to_page(virt_to_pfn(kaddr))
> diff --git a/arch/loongarch/kernel/vdso.c b/arch/loongarch/kernel/vdso.c
> index cf62103..3e89aca 100644
> --- a/arch/loongarch/kernel/vdso.c
> +++ b/arch/loongarch/kernel/vdso.c
> @@ -23,7 +23,27 @@
>   #include <vdso/vsyscall.h>
>   #include <generated/vdso-offsets.h>
>
> +/*
> + * The layout of vvar:
> + *
> + *                 high
> + * +----------------+----------------+
> + * | timens_data    | PAGE_SIZE      |
> + * +----------------+----------------+
> + * | vdso_data      |                |
> + * | vdso_pcpu_data | VDSO_DATA_SIZE |
> + * +----------------+----------------+
> + *                 low
> + */
> +#define VVAR_SIZE (VDSO_DATA_SIZE + PAGE_SIZE)
> +
> +enum vvar_pages {
> +       VVAR_DATA_PAGE_OFFSET,
> +       VVAR_TIMENS_PAGE_OFFSET,
> +};
You suppose that vdso_data+vdso_pcpu_data can fit in one page, but
this isn't always the case.

> +
>   extern char vdso_start[], vdso_end[];
> +extern unsigned long zero_pfn;
>
>   /* Kernel-provided data used by the VDSO. */
>   static union {
> @@ -42,6 +62,40 @@ static int vdso_mremap(const struct
> vm_special_mapping *sm, struct vm_area_struc
>          return 0;
>   }
>
> +static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
> +                            struct vm_area_struct *vma, struct vm_fault
> *vmf)
> +{
> +       struct page *timens_page =3D find_timens_vvar_page(vma);
> +       unsigned long pfn;
> +
> +       switch (vmf->pgoff) {
> +       case VVAR_DATA_PAGE_OFFSET:
> +               if (timens_page)
> +                       pfn =3D page_to_pfn(timens_page);
> +               else
> +                       pfn =3D sym_to_pfn(vdso_data);
> +               break;
> +#ifdef CONFIG_TIME_NS
> +       case VVAR_TIMENS_PAGE_OFFSET:
> +               /*
> +                * If a task belongs to a time namespace then a namespace
> +                * specific VVAR is mapped with the
> VVAR_DATA_PAGE_OFFSET and
> +                * the real VVAR page is mapped with the
> VVAR_TIMENS_PAGE_OFFSET
> +                * offset.
> +                * See also the comment near timens_setup_vdso_data().
> +                */
> +               if (!timens_page)
> +                       return VM_FAULT_SIGBUS;
> +               pfn =3D sym_to_pfn(vdso_data);
> +               break;
> +#endif /* CONFIG_TIME_NS */
> +       default:
> +               return VM_FAULT_SIGBUS;
> +       }
> +
> +       return vmf_insert_pfn(vma, vmf->address, pfn);
> +}
> +
>   struct loongarch_vdso_info vdso_info =3D {
>          .vdso =3D vdso_start,
>          .size =3D PAGE_SIZE,
> @@ -52,6 +106,7 @@ struct loongarch_vdso_info vdso_info =3D {
>          },
>          .data_mapping =3D {
>                  .name =3D "[vvar]",
> +               .fault =3D vvar_fault,
I prefer pre-allocate than page-fault if possible.

Huacai
>          },
>          .offset_sigreturn =3D vdso_offset_sigreturn,
>   };
> @@ -120,7 +175,7 @@ static unsigned long vdso_base(void)
>   int arch_setup_additional_pages(struct linux_binprm *bprm, int
> uses_interp)
>   {
>          int ret;
> -       unsigned long vvar_size, size, data_addr, vdso_addr;
> +       unsigned long size, data_addr, vdso_addr;
>          struct mm_struct *mm =3D current->mm;
>          struct vm_area_struct *vma;
>          struct loongarch_vdso_info *info =3D current->thread.vdso;
> @@ -132,17 +187,16 @@ int arch_setup_additional_pages(struct
> linux_binprm *bprm, int uses_interp)
>           * Determine total area size. This includes the VDSO data itself
>           * and the data pages.
>           */
> -       vvar_size =3D VDSO_DATA_SIZE;
> -       size =3D vvar_size + info->size;
> +       size =3D VVAR_SIZE + info->size;
>
>          data_addr =3D get_unmapped_area(NULL, vdso_base(), size, 0, 0);
>          if (IS_ERR_VALUE(data_addr)) {
>                  ret =3D data_addr;
>                  goto out;
>          }
> -       vdso_addr =3D data_addr + VDSO_DATA_SIZE;
> +       vdso_addr =3D data_addr + VVAR_SIZE;
>
> -       vma =3D _install_special_mapping(mm, data_addr, vvar_size,
> +       vma =3D _install_special_mapping(mm, data_addr, VVAR_SIZE,
>                                         VM_READ | VM_MAYREAD,
>                                         &info->data_mapping);
>          if (IS_ERR(vma)) {
> @@ -153,7 +207,12 @@ int arch_setup_additional_pages(struct linux_binprm
> *bprm, int uses_interp)
>          /* Map VDSO data page. */
>          ret =3D remap_pfn_range(vma, data_addr,
>                                virt_to_phys(&loongarch_vdso_data) >>
> PAGE_SHIFT,
> -                             vvar_size, PAGE_READONLY);
> +                             VDSO_DATA_SIZE, PAGE_READONLY);
> +       if (ret)
> +               goto out;
> +
> +       ret =3D remap_pfn_range(vma, data_addr + VDSO_DATA_SIZE, zero_pfn=
,
> +                             PAGE_SIZE, PAGE_READONLY);
>          if (ret)
>                  goto out;
>
> If you have any more comments, please let me know, thank you.
> I will send v2 after waiting for some more feedbacks.
>
> Thanks,
> Tiezhu
>
