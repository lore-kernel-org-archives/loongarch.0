Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FF123A1
	for <loongarch@lists.linux.dev>; Wed,  1 Mar 2023 12:07:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6935C433EF
	for <loongarch@lists.linux.dev>; Wed,  1 Mar 2023 12:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677672436;
	bh=a4HXikBAfsTGDGyY1EqABSnmg24eMbvSd2S3rx8Tm3o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UaY6uS1wPAYOsBK3lNe4z2VXMS84JZvZFQ0chYytFc1ZVN5Wu7QSM1iievSW/kItd
	 L4ijqo6cBk9WKGNH4MEguF6tJwCfZclquRzRpdCvMIOiqs1cEf4HmsGb9JJelG75Fr
	 N6RTEZWPUzZH2yAozXkR2A5N3p2ZyoF7tu1e4LjcnyUl0Ai8cvTZHFL38ngubL5/bt
	 ma2ds5OnKpyQGVtDmpgu10Dw+63ZZ5EFzRspebZLWRiYxKi4pHYEx4Jg0PbgJaL9k7
	 r6g5WUijf/AfKBqQ/XizfBLPJhSSjD7qzvlUzik94lSfjI7gWsnrIGoruKpOnsDl+d
	 kiSHIkb57/1Zw==
Received: by mail-ed1-f47.google.com with SMTP id cq23so52942755edb.1
        for <loongarch@lists.linux.dev>; Wed, 01 Mar 2023 04:07:16 -0800 (PST)
X-Gm-Message-State: AO0yUKUPuoOwAfbSk3j+sR36TtplMjpemEln8wG+J1AGWTb8Sv/KscyZ
	WW4NLSEFfRfidLUQq5CFaAkhXvXGWAzgZ5uL/Ak=
X-Google-Smtp-Source: AK7set+ZPFIRI5EJZyj6BlqoXxNozNx266bdzbtmag0+xgRl1DE36MIgV7uSxWvYQpCEJzBy1trQnMbYscC4Ba5Vz+M=
X-Received: by 2002:a17:906:4f99:b0:8b0:e909:9136 with SMTP id
 o25-20020a1709064f9900b008b0e9099136mr3012557eju.1.1677672435185; Wed, 01 Mar
 2023 04:07:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230301085545.2373646-1-chenhuacai@loongson.cn>
 <aba37b65-6fc4-721e-ebc5-df52533e4791@loongson.cn> <CAAhV-H6xAKQ94T5=+iVASwi8F=7+G_ptSGVVBOw4L1fCR+EQOw@mail.gmail.com>
 <dfd6a1cb-25be-cc11-4134-b2e92e353c00@loongson.cn>
In-Reply-To: <dfd6a1cb-25be-cc11-4134-b2e92e353c00@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 1 Mar 2023 20:06:57 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4q2+s2fV6DqSK8H0cByvJsd78GBB_Vw9gxHMfBu2Scug@mail.gmail.com>
Message-ID: <CAAhV-H4q2+s2fV6DqSK8H0cByvJsd78GBB_Vw9gxHMfBu2Scug@mail.gmail.com>
Subject: Re: [PATCH] efi/loongarch: Reintroduce efi_relocate_kernel() to
 relocate kernel
To: Youling Tang <tangyouling@loongson.cn>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Ard Biesheuvel <ardb@kernel.org>, linux-efi@vger.kernel.org, 
	loongarch@lists.linux.dev, Xuefeng Li <lixuefeng@loongson.cn>, 
	Xuerui Wang <kernel@xen0n.name>, linux-kernel@vger.kernel.org, 
	loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Youling,

On Wed, Mar 1, 2023 at 6:08=E2=80=AFPM Youling Tang <tangyouling@loongson.c=
n> wrote:
>
> Hi, Huacai
>
> On 03/01/2023 05:30 PM, Huacai Chen wrote:
> > Hi, Youling,
> >
> > On Wed, Mar 1, 2023 at 5:21=E2=80=AFPM Youling Tang <tangyouling@loongs=
on.cn> wrote:
> >>
> >> Hi, Huacai
> >>
> >> On 03/01/2023 04:55 PM, Huacai Chen wrote:
> >>> Since Linux-6.3, LoongArch supports PIE kernel now, so let's reintrod=
uce
> >>> efi_relocate_kernel() to relocate the core kernel.
> >>
> >> If we strongly rely on the PIE feature after the modification, we need
> >> to modify it as follows,
> > There is no strong rely, efi_relocate_kernel() can also handle the
> > non-PIE kernel.
>
> IMHO, if EFI_KIMG_PREFERRED_ADDRESS is no longer defined as
> `PHYSADDR(VMLINUX_LOAD_ADDRESS)` (physical link address), we need to
> relocate through the RELOCATABLE function, so it is recommended to
> select RELOCATABLE if EFI_STUB is enabled
We can select RELOCATABLE when we modify EFI_KIMG_PREFERRED_ADDRESS.
Before that I prefer to give a chance to build a non-PIE kernel.

Huacai
>
> Youling.
> >
> > Huacai
> >>
> >> --- a/arch/loongarch/Kconfig
> >> +++ b/arch/loongarch/Kconfig
> >> @@ -137,6 +137,7 @@ config LOONGARCH
> >>          select PCI_MSI_ARCH_FALLBACKS
> >>          select PCI_QUIRKS
> >>          select PERF_USE_VMALLOC
> >> +       select RELOCATABLE
> >>          select RTC_LIB
> >>          select SMP
> >>          select SPARSE_IRQ
> >>
> >> or:
> >>
> >> --- a/arch/loongarch/Kconfig
> >> +++ b/arch/loongarch/Kconfig
> >> @@ -360,6 +360,7 @@ config EFI_STUB
> >>          default y
> >>          depends on EFI
> >>          select EFI_GENERIC_STUB
> >> +       select RELOCATABLE
> >>          help
> >>
> >> Youling.
> >>
> >>>
> >>> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> >>> ---
> >>>  drivers/firmware/efi/libstub/loongarch-stub.c | 24 ++++++-----------=
--
> >>>  1 file changed, 7 insertions(+), 17 deletions(-)
> >>>
> >>> diff --git a/drivers/firmware/efi/libstub/loongarch-stub.c b/drivers/=
firmware/efi/libstub/loongarch-stub.c
> >>> index eee7ed43cdfb..72c71ae201f0 100644
> >>> --- a/drivers/firmware/efi/libstub/loongarch-stub.c
> >>> +++ b/drivers/firmware/efi/libstub/loongarch-stub.c
> >>> @@ -21,26 +21,16 @@ efi_status_t handle_kernel_image(unsigned long *i=
mage_addr,
> >>>                                efi_loaded_image_t *image,
> >>>                                efi_handle_t image_handle)
> >>>  {
> >>> -     int nr_pages =3D round_up(kernel_asize, EFI_ALLOC_ALIGN) / EFI_=
PAGE_SIZE;
> >>> -     efi_physical_addr_t kernel_addr =3D EFI_KIMG_PREFERRED_ADDRESS;
> >>>       efi_status_t status;
> >>> +     unsigned long kernel_addr =3D 0;
> >>>
> >>> -     /*
> >>> -      * Allocate space for the kernel image at the preferred offset.=
 This is
> >>> -      * the only location in memory from where we can execute the im=
age, so
> >>> -      * no point in falling back to another allocation.
> >>> -      */
> >>> -     status =3D efi_bs_call(allocate_pages, EFI_ALLOCATE_ADDRESS,
> >>> -                          EFI_LOADER_DATA, nr_pages, &kernel_addr);
> >>> -     if (status !=3D EFI_SUCCESS)
> >>> -             return status;
> >>> -
> >>> -     *image_addr =3D EFI_KIMG_PREFERRED_ADDRESS;
> >>> -     *image_size =3D kernel_asize;
> >>> +     kernel_addr =3D (unsigned long)&kernel_offset - kernel_offset;
> >>> +
> >>> +     status =3D efi_relocate_kernel(&kernel_addr, kernel_fsize, kern=
el_asize,
> >>> +                  EFI_KIMG_PREFERRED_ADDRESS, efi_get_kimg_min_align=
(), 0x0);
> >>>
> >>> -     memcpy((void *)EFI_KIMG_PREFERRED_ADDRESS,
> >>> -            (void *)&kernel_offset - kernel_offset,
> >>> -            kernel_fsize);
> >>> +     *image_addr =3D kernel_addr;
> >>> +     *image_size =3D kernel_asize;
> >>>
> >>>       return status;
> >>>  }
> >>>
> >>
>
>
