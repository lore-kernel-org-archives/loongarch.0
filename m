Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEF9915B7
	for <loongarch@lists.linux.dev>; Thu, 30 May 2024 05:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717047148; cv=none; b=Ru4WMUXfQLd5ibv9yo7fxUCEuJrJqLdymx9uzMt1qZau6Ljby2JzcHtdOXay8EySIYAOIYhfQSYHqTvOK+dV/eFovVs51xEzFmEshGmbN9Bb4miT/o/svkPpgpJeTwFm6386hlKC32y1pueZbzUxaSWm+Xn2JwUT9c9+xa4wTDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717047148; c=relaxed/simple;
	bh=KnUZHp13dS77ruhiqaUUV7kRUy1j62cNhux/gUno07M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VRNlZ1b3/ha9dtqsS0DzGn7OrjgJUz+H3JvpSuHNPqtqlF7fn6Ke1Q9kz8JFPWz1DP29hRyqyhlXsKSXrJj8Ekd/QNRR/r7F0inM9WTDnk1unNl1UfdRd7PS75TSdKpXIkD3d3w6iUSUtAXHKXFmfhr0n5gq/6G+Pj6+LnnCJxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [209.85.222.182])
	by gateway (Coremail) with SMTP id _____8BxLutfD1hmXH8BAA--.6375S3;
	Thu, 30 May 2024 13:32:16 +0800 (CST)
Received: from mail-qk1-f182.google.com (unknown [209.85.222.182])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxmsZcD1hmhOENAA--.36203S3;
	Thu, 30 May 2024 13:32:14 +0800 (CST)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-794c3ae6db2so41222885a.0
        for <loongarch@lists.linux.dev>; Wed, 29 May 2024 22:32:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWCfbVT0Z2QRiCX9EEoFbE68QWD4ZUTfm4PkfJnzrxnUGRs5jMyt/DQ+THppiRhhmvvkYv9+ukfAkrV6i14Xi+6WgSm2pav9Cru
X-Gm-Message-State: AOJu0Yyt0+TEwgnnN4KD8WjjgDevMFnhqln0DcdgjAyM/qUcBauPcvOG
	XJE15+MnAulyc5QwkwqAiLNiKcqpEqz/9UI43kiam3JGwcAtqlib9u8VVLZAFEj87l6YW3DLuow
	AQRwSR9grXA9V8a+OecYJWbjIPzP2sqOtJ5VDLw==
X-Google-Smtp-Source: AGHT+IHZ8axvx4jJzWGomNL8c+GbmDiaO9PRsPYzYWjOKV+NeSRwIAALP8RQjhFwT0nvL1TaFn2o7uc4LyxEFlKjn9M=
X-Received: by 2002:a25:6986:0:b0:df4:b01b:3d21 with SMTP id
 3f1490d57ef6-dfa5a7db705mr1302353276.49.1717045325049; Wed, 29 May 2024
 22:02:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240522-loongarch-booting-fixes-v3-0-25e77a8fc86e@flygoat.com> <20240522-loongarch-booting-fixes-v3-3-25e77a8fc86e@flygoat.com>
In-Reply-To: <20240522-loongarch-booting-fixes-v3-3-25e77a8fc86e@flygoat.com>
From: WANG Rui <wangrui@loongson.cn>
Date: Thu, 30 May 2024 13:01:54 +0800
X-Gmail-Original-Message-ID: <CAHirt9hbzVxcKzwnSF_5jpwma+kr-WJHBQjc47ojB95Ph9SnqA@mail.gmail.com>
Message-ID: <CAHirt9hbzVxcKzwnSF_5jpwma+kr-WJHBQjc47ojB95Ph9SnqA@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] LoongArch: Fix entry point in image header
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Huacai Chen <chenhuacai@kernel.org>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:AQAAf8BxmsZcD1hmhOENAA--.36203S3
X-CM-SenderInfo: pzdqw2txl6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxZF1UWF15KF45Gr45GrykJFc_yoW5CryDpa
	1UAF4DAr48Cr4DJas7Jw45uFyUXwnrW34agasrGFyrCFsFvr18Xr109rZruFyvqw4xK3yS
	qFn0gF12v3WDJ3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUyEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1CPfJUUUUU==

On Thu, May 23, 2024 at 6:03=E2=80=AFAM Jiaxun Yang <jiaxun.yang@flygoat.co=
m> wrote:
>
> Currently kernel entry in head.S is in DMW address range,
> firmware is instructed to jump to this address after loading
> the image.
>
> However kernel should not make any assumption on firmware's
> DMW setting, thus the entry point should be a physical address
> falls into direct translation region.
>
> Fix by converting entry address to physical and amend entry
> calculation logic in libstub accordingly.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> v2: Fix efistub
> v3: Move calculation to linker script
> ---
>  arch/loongarch/kernel/head.S             | 2 +-
>  arch/loongarch/kernel/vmlinux.lds.S      | 2 ++
>  drivers/firmware/efi/libstub/loongarch.c | 2 +-
>  3 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/arch/loongarch/kernel/head.S b/arch/loongarch/kernel/head.S
> index c4f7de2e2805..2cdc1ea808d9 100644
> --- a/arch/loongarch/kernel/head.S
> +++ b/arch/loongarch/kernel/head.S
> @@ -22,7 +22,7 @@
>  _head:
>         .word   MZ_MAGIC                /* "MZ", MS-DOS header */
>         .org    0x8
> -       .dword  kernel_entry            /* Kernel entry point */
> +       .dword  _kernel_entry_phys      /* Kernel entry point (physical a=
ddress) */
>         .dword  _kernel_asize           /* Kernel image effective size */
>         .quad   PHYS_LINK_KADDR         /* Kernel image load offset from =
start of RAM */
>         .org    0x38                    /* 0x20 ~ 0x37 reserved */
> diff --git a/arch/loongarch/kernel/vmlinux.lds.S b/arch/loongarch/kernel/=
vmlinux.lds.S
> index e8e97dbf9ca4..c6f89e51257a 100644
> --- a/arch/loongarch/kernel/vmlinux.lds.S
> +++ b/arch/loongarch/kernel/vmlinux.lds.S
> @@ -6,6 +6,7 @@
>
>  #define PAGE_SIZE _PAGE_SIZE
>  #define RO_EXCEPTION_TABLE_ALIGN       4
> +#define TO_PHYS_MASK                   0x000fffffffffffff /* 48-bit */
>
>  /*
>   * Put .bss..swapper_pg_dir as the first thing in .bss. This will
> @@ -142,6 +143,7 @@ SECTIONS
>
>  #ifdef CONFIG_EFI_STUB
>         /* header symbols */
> +       _kernel_entry_phys =3D kernel_entry & TO_PHYS_MASK;

 -       _kernel_entry_phys =3D kernel_entry & TO_PHYS_MASK;
 +       _kernel_entry_phys =3D ABSOLUTE(kernel_entry & TO_PHYS_MASK);

>         _kernel_asize =3D _end - _text;
>         _kernel_fsize =3D _edata - _text;
>         _kernel_vsize =3D _end - __initdata_begin;
> diff --git a/drivers/firmware/efi/libstub/loongarch.c b/drivers/firmware/=
efi/libstub/loongarch.c
> index 684c9354637c..60c145121393 100644
> --- a/drivers/firmware/efi/libstub/loongarch.c
> +++ b/drivers/firmware/efi/libstub/loongarch.c
> @@ -41,7 +41,7 @@ static efi_status_t exit_boot_func(struct efi_boot_memm=
ap *map, void *priv)
>  unsigned long __weak kernel_entry_address(unsigned long kernel_addr,
>                 efi_loaded_image_t *image)
>  {
> -       return *(unsigned long *)(kernel_addr + 8) - VMLINUX_LOAD_ADDRESS=
 + kernel_addr;
> +       return *(unsigned long *)(kernel_addr + 8) - TO_PHYS(VMLINUX_LOAD=
_ADDRESS) + kernel_addr;
>  }
>
>  efi_status_t efi_boot_kernel(void *handle, efi_loaded_image_t *image,
>
> --
> 2.43.0
>
>

- Rui

