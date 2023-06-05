Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE33117F4
	for <loongarch@lists.linux.dev>; Mon,  5 Jun 2023 03:58:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 432E9C4339C
	for <loongarch@lists.linux.dev>; Mon,  5 Jun 2023 03:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685937504;
	bh=Lozl+B9c9ZtOgU9jlGHLMSW0ijTaUHs8B+vJDZaxmP0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mgErmNctkUMj3Cg5fufF5WtfEHwtkGjsoSQf/8rbdjspHdQIHDDPJQHQgGOItjHpg
	 elJD8LbmhcJDo/sQ0FTE267hTCcyb6uM2z3tEFrhOIWFfJyTC099VWljAOwmxI8zx4
	 8SElgRpma4jSIuXrX3LwXFTtqnUzTBzaXxoKIzC1/rNkvvl6ehN+sL6hU1JwxeqaO6
	 NJYAUFQz5Z95djQor7BeNs+CikjXG92aMc8fE1WUrM66l5t+gPiGSn+oKs3F25rAUj
	 l4wDa3jUXSHgtTLyijLRrR5awkrjlyx9/66jpmBFYvDoynwxIX+QQnZj6rVVDlRd+J
	 RnkhWX1ANKVIw==
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-514ab6cb529so11440522a12.1
        for <loongarch@lists.linux.dev>; Sun, 04 Jun 2023 20:58:24 -0700 (PDT)
X-Gm-Message-State: AC+VfDyHjR0jJVo271nzspErpcaDlFDUix2bCxZTMpv+gGLOdSkEWFp0
	N7POVHv6ZoIYvRwPughKXd/ixSt5TE47LlsqrRg=
X-Google-Smtp-Source: ACHHUZ6uzVN8ZGQlBo5csuBzT7qJ3sVK7iqjj3ky0+eHZij/P+I6xMbn/J0KyxfD9kmwLT9TeQvP2RVjDJKQEOHKUaU=
X-Received: by 2002:aa7:c252:0:b0:514:a302:c334 with SMTP id
 y18-20020aa7c252000000b00514a302c334mr9117220edo.14.1685937502492; Sun, 04
 Jun 2023 20:58:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230605034423.1528206-1-maobibo@loongson.cn>
In-Reply-To: <20230605034423.1528206-1-maobibo@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 5 Jun 2023 11:58:10 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6O+_EnmDU6kE-19PP+8tD3wwbzzuakE_vHZGCtjZWDbg@mail.gmail.com>
Message-ID: <CAAhV-H6O+_EnmDU6kE-19PP+8tD3wwbzzuakE_vHZGCtjZWDbg@mail.gmail.com>
Subject: Re: [PATCH v2] PCI: Align pci memory space base address with page size
To: Bibo Mao <maobibo@loongson.cn>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, helgaas@kernel.org, 
	linux-pci@vger.kernel.org, Jianmin Lv <lvjianmin@loongson.cn>, 
	WANG Xuerui <kernel@xen0n.name>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Bibo,

Three suggestions:
1, split to two patches.
2, the "(align < PAGE_SIZE)" condition can be removed.
3, you can unify the comments between ARM64 and LoongArch.

Huacai

On Mon, Jun 5, 2023 at 11:44=E2=80=AFAM Bibo Mao <maobibo@loongson.cn> wrot=
e:
>
> Some PCI devices has only 4K memory space size, it is normal in general
> machines and aligned with page size. However some architectures which
> support different page size, default page size on LoongArch is 16K, and
> ARM64 supports page size varying from 4K to 64K. On machines where larger
> page size is use, memory space region of two different pci devices may be
> in one page. It is not safe with mmu protection, also VFIO pci device
> driver requires base address of pci memory space page aligned, so that it
> can be memory mapped to qemu user space when it is pass-through to vm.
>
> It consumes more pci memory resource with page size alignment requirement=
,
> on 64 bit system it should not be a problem. And UEFI bios set pci memory
> base address with 4K fixed-size aligned, the safer solution is to align
> with larger size on UEFI BIOS stage on these architectures, linux kernel
> can reuse resource from UEFI bios. For new devices such hotplug pci
> devices and sriov devices, pci resource is assigned in Linux kernel side.
>
> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
> ---
>  arch/arm64/kernel/pci.c  | 13 +++++++++++++
>  arch/loongarch/pci/pci.c | 18 ++++++++++++++++++
>  2 files changed, 31 insertions(+)
>
> diff --git a/arch/arm64/kernel/pci.c b/arch/arm64/kernel/pci.c
> index 2276689b5411..e2f7b176b156 100644
> --- a/arch/arm64/kernel/pci.c
> +++ b/arch/arm64/kernel/pci.c
> @@ -232,4 +232,17 @@ void pcibios_remove_bus(struct pci_bus *bus)
>         acpi_pci_remove_bus(bus);
>  }
>
> +resource_size_t pcibios_align_resource(void *data, const struct resource=
 *res,
> +                               resource_size_t size, resource_size_t ali=
gn)
> +{
> +       resource_size_t start =3D res->start;
> +
> +       /*
> +        * align base address of pci memory resource with page size
> +        */
> +       if ((res->flags & IORESOURCE_MEM) && (align < PAGE_SIZE))
> +               start =3D ALIGN(start, PAGE_SIZE);
> +
> +       return start;
> +}
>  #endif
> diff --git a/arch/loongarch/pci/pci.c b/arch/loongarch/pci/pci.c
> index 2726639150bc..943a48e60fb1 100644
> --- a/arch/loongarch/pci/pci.c
> +++ b/arch/loongarch/pci/pci.c
> @@ -83,6 +83,24 @@ int pcibios_alloc_irq(struct pci_dev *dev)
>         return acpi_pci_irq_enable(dev);
>  }
>
> +/*
> + * memory space size of some pci cards is 4K, it is separated with
> + * different pages for generic architectures, so that mmu protection can
> + * work with different pci cards. However page size for LoongArch system
> + * is 16K, memory space of different pci cards may share the same page
> + * on LoongArch, it is not safe here.
> + */
> +resource_size_t pcibios_align_resource(void *data, const struct resource=
 *res,
> +                               resource_size_t size, resource_size_t ali=
gn)
> +{
> +       resource_size_t start =3D res->start;
> +
> +       if ((res->flags & IORESOURCE_MEM) && (align < PAGE_SIZE))
> +               start =3D ALIGN(start, PAGE_SIZE);
> +
> +       return start;
> +}
> +
>  static void pci_fixup_vgadev(struct pci_dev *pdev)
>  {
>         struct pci_dev *devp =3D NULL;
> --
> 2.27.0
>
