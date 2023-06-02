Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C90F15B2
	for <loongarch@lists.linux.dev>; Fri,  2 Jun 2023 04:11:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D545AC4339C
	for <loongarch@lists.linux.dev>; Fri,  2 Jun 2023 04:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685679076;
	bh=3KKLfYltpP6AwUyqbOu8VcjvJJYpCcqO2cG0S3xy7yY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SlgfWgAV56JNVTapto/Na8Mc+XcKejx1vSpANP4iPldr0tkLvxf4I2sw++NHqWQA0
	 1RcAIcaWGhlQ7doPh7cKjFTf2JSn3t8l0guMOIMzFDBTca19+EskTkljcnU52ufIFS
	 DOuRIRo4hLOkQNkK9T75avolm+MAHsdtTXhvJShIndPniFwFg0AhhhNu9M2YVKzkRp
	 oiiTLdcGEAz7JrwpBmposMoJRoNwqIGj9JAr02SH3GeP9+ayfYS2LgKvcAGJACl/fD
	 TBp1sGWWiM18mp01d1He2EhbgqpUspTUzSI8Wbbfi00EWzR62kpXkQ09pZVZB4n2XR
	 MyAGZK7XLYXPQ==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5147a478c38so2365057a12.0
        for <loongarch@lists.linux.dev>; Thu, 01 Jun 2023 21:11:16 -0700 (PDT)
X-Gm-Message-State: AC+VfDw1PhQpuB/nxPR7u8+cuvA1Ag9Pv1w38JcvgnqsP3qK0ldmttOb
	ETLlL8fsPSfCpfhFMiVKN/u6x4Gv3n5v55/x//o=
X-Google-Smtp-Source: ACHHUZ7wzUjaEOG8TGfvCZPI1uTO6uVQKWRMfgbYjNvATi5pmMOSmaY7k+ICTvTurUJBNlapQ4gKt607Nzt+ytsCSJ4=
X-Received: by 2002:a17:907:94cb:b0:96f:f451:187f with SMTP id
 dn11-20020a17090794cb00b0096ff451187fmr8505251ejc.7.1685679075072; Thu, 01
 Jun 2023 21:11:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230602030732.1047696-1-maobibo@loongson.cn>
In-Reply-To: <20230602030732.1047696-1-maobibo@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 2 Jun 2023 12:11:02 +0800
X-Gmail-Original-Message-ID: <CAAhV-H58dR4JWtCdqCR553H1-pbppKyi114BMhsrV74Zb_c58Q@mail.gmail.com>
Message-ID: <CAAhV-H58dR4JWtCdqCR553H1-pbppKyi114BMhsrV74Zb_c58Q@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Align pci memory base address with page size
To: Bibo Mao <maobibo@loongson.cn>, Bjorn Helgaas <helgaas@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>, Jianmin Lv <lvjianmin@loongson.cn>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+cc Bjorn

Hi, Bibo,

On Fri, Jun 2, 2023 at 11:07=E2=80=AFAM Bibo Mao <maobibo@loongson.cn> wrot=
e:
>
> LoongArch linux kernel uses 16K page size by default, some pci devices ha=
ve
> only 4K memory size, it is normal in general architectures. However memor=
y
> space of different pci devices will share one physical page address space=
.
> This is not safe for mmu protection, also UIO and VFIO requires base
> address of pci memory space page aligned.
>
> This patch adds check with function pcibios_align_resource, and set base
> address of resource page aligned.
>
> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
> ---
>  arch/loongarch/pci/pci.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/arch/loongarch/pci/pci.c b/arch/loongarch/pci/pci.c
> index 2726639150bc..1380f3672ba2 100644
> --- a/arch/loongarch/pci/pci.c
> +++ b/arch/loongarch/pci/pci.c
> @@ -83,6 +83,29 @@ int pcibios_alloc_irq(struct pci_dev *dev)
>         return acpi_pci_irq_enable(dev);
>  }
>
> +/*
> + * memory space size of some pci cards is 4K, it is separated with
> + * different pages for generic architectures, so that mmu protection can
> + * work with different pci cards. However page size for LoongArch system
> + * is 16K, memory space of different pci cards may share the same page
> + * on LoongArch, it is not safe here.
> + * Also uio drivers and vfio drivers sugguests that base address of memo=
ry
> + * space should page aligned. This function aligns base address with pag=
e size
> + */
> +resource_size_t pcibios_align_resource(void *data, const struct resource=
 *res,
> +               resource_size_t size, resource_size_t align)
> +{
> +       resource_size_t start =3D res->start;
> +
> +       if (res->flags & IORESOURCE_MEM) {
> +               if (align & (PAGE_SIZE - 1)) {
> +                       align =3D PAGE_SIZE;
> +                       start =3D ALIGN(start, align);
I don't know whether this patch is really needed, but the logic here
has some problems.

For example, if PAGE_SIZE=3D16KB, align=3D18KB, what should we do? Align
to 16KB or align to 32KB? IMO it should align to 32KB, but in your
patch it will align to 16KB.

Huacai
> +               }
> +       }
> +       return start;
> +}
> +
>  static void pci_fixup_vgadev(struct pci_dev *pdev)
>  {
>         struct pci_dev *devp =3D NULL;
> --
> 2.27.0
>
