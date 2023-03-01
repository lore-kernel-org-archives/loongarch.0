Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE4210EE
	for <loongarch@lists.linux.dev>; Wed,  1 Mar 2023 09:30:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77418C4339B
	for <loongarch@lists.linux.dev>; Wed,  1 Mar 2023 09:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677663027;
	bh=dHDrAbhiFfIkimlSzwEGwokvtLe8YoCQK1nhcFxqDD8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UYDi/e2yyVhan1vcohc2hSsaLpoqFdaclPUtpncNYYsPxzflGwMmRSEGV2SPEYyBM
	 Ew7hSZ4HYUq/T3UDsJhs5MJx+VUk1Cxtx3gaLS3ta1yCGQXneVx4A+MYJPFWRF98sL
	 t/JTCL4fKEEpMf7xLV4Elz+UsdHlXRgmhmbmRlRFHEP6vj6L1XCLtIloNWIP4nCro+
	 QFk9RIZ2FIgfhvba9ZJlo8d9HsSwb+UVL6jgJJ+MO7wrD78mJIgCkNTDPrbHlGnUGg
	 lURUqlIQgP80ZBK/WbfoX7aahmWH5vOQvc68lVZaUEaS3Y40guWUuwQmfUWj4lG8i5
	 RqsvaOM0As/SA==
Received: by mail-ed1-f43.google.com with SMTP id o15so48690788edr.13
        for <loongarch@lists.linux.dev>; Wed, 01 Mar 2023 01:30:27 -0800 (PST)
X-Gm-Message-State: AO0yUKXOUlRJQuiYQ+q00jCodvXwe9fwv25QP5TNMn4NJ1n69ePhqeYu
	Uu8rb1q8K7x884vEfZYnARYgvqBo2jGwAFkanJM=
X-Google-Smtp-Source: AK7set+UDgLS0XyHzs6BuguZjxDrFvG7aGb9HhwrWrsyYsObQH9BFugsp3hv5+dOF0vnGi+l2aVptNo7FfwJvJTCRhM=
X-Received: by 2002:a17:906:1582:b0:8b1:7de9:b39b with SMTP id
 k2-20020a170906158200b008b17de9b39bmr2938780ejd.1.1677663025657; Wed, 01 Mar
 2023 01:30:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230301085545.2373646-1-chenhuacai@loongson.cn> <aba37b65-6fc4-721e-ebc5-df52533e4791@loongson.cn>
In-Reply-To: <aba37b65-6fc4-721e-ebc5-df52533e4791@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 1 Mar 2023 17:30:14 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6xAKQ94T5=+iVASwi8F=7+G_ptSGVVBOw4L1fCR+EQOw@mail.gmail.com>
Message-ID: <CAAhV-H6xAKQ94T5=+iVASwi8F=7+G_ptSGVVBOw4L1fCR+EQOw@mail.gmail.com>
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

On Wed, Mar 1, 2023 at 5:21=E2=80=AFPM Youling Tang <tangyouling@loongson.c=
n> wrote:
>
> Hi, Huacai
>
> On 03/01/2023 04:55 PM, Huacai Chen wrote:
> > Since Linux-6.3, LoongArch supports PIE kernel now, so let's reintroduc=
e
> > efi_relocate_kernel() to relocate the core kernel.
>
> If we strongly rely on the PIE feature after the modification, we need
> to modify it as follows,
There is no strong rely, efi_relocate_kernel() can also handle the
non-PIE kernel.

Huacai
>
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -137,6 +137,7 @@ config LOONGARCH
>          select PCI_MSI_ARCH_FALLBACKS
>          select PCI_QUIRKS
>          select PERF_USE_VMALLOC
> +       select RELOCATABLE
>          select RTC_LIB
>          select SMP
>          select SPARSE_IRQ
>
> or:
>
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -360,6 +360,7 @@ config EFI_STUB
>          default y
>          depends on EFI
>          select EFI_GENERIC_STUB
> +       select RELOCATABLE
>          help
>
> Youling.
>
> >
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > ---
> >  drivers/firmware/efi/libstub/loongarch-stub.c | 24 ++++++-------------
> >  1 file changed, 7 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/firmware/efi/libstub/loongarch-stub.c b/drivers/fi=
rmware/efi/libstub/loongarch-stub.c
> > index eee7ed43cdfb..72c71ae201f0 100644
> > --- a/drivers/firmware/efi/libstub/loongarch-stub.c
> > +++ b/drivers/firmware/efi/libstub/loongarch-stub.c
> > @@ -21,26 +21,16 @@ efi_status_t handle_kernel_image(unsigned long *ima=
ge_addr,
> >                                efi_loaded_image_t *image,
> >                                efi_handle_t image_handle)
> >  {
> > -     int nr_pages =3D round_up(kernel_asize, EFI_ALLOC_ALIGN) / EFI_PA=
GE_SIZE;
> > -     efi_physical_addr_t kernel_addr =3D EFI_KIMG_PREFERRED_ADDRESS;
> >       efi_status_t status;
> > +     unsigned long kernel_addr =3D 0;
> >
> > -     /*
> > -      * Allocate space for the kernel image at the preferred offset. T=
his is
> > -      * the only location in memory from where we can execute the imag=
e, so
> > -      * no point in falling back to another allocation.
> > -      */
> > -     status =3D efi_bs_call(allocate_pages, EFI_ALLOCATE_ADDRESS,
> > -                          EFI_LOADER_DATA, nr_pages, &kernel_addr);
> > -     if (status !=3D EFI_SUCCESS)
> > -             return status;
> > -
> > -     *image_addr =3D EFI_KIMG_PREFERRED_ADDRESS;
> > -     *image_size =3D kernel_asize;
> > +     kernel_addr =3D (unsigned long)&kernel_offset - kernel_offset;
> > +
> > +     status =3D efi_relocate_kernel(&kernel_addr, kernel_fsize, kernel=
_asize,
> > +                  EFI_KIMG_PREFERRED_ADDRESS, efi_get_kimg_min_align()=
, 0x0);
> >
> > -     memcpy((void *)EFI_KIMG_PREFERRED_ADDRESS,
> > -            (void *)&kernel_offset - kernel_offset,
> > -            kernel_fsize);
> > +     *image_addr =3D kernel_addr;
> > +     *image_size =3D kernel_asize;
> >
> >       return status;
> >  }
> >
>
