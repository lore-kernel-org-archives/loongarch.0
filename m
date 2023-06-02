Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE0E10E5
	for <loongarch@lists.linux.dev>; Fri,  2 Jun 2023 06:55:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A7EAC4339B
	for <loongarch@lists.linux.dev>; Fri,  2 Jun 2023 06:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685688938;
	bh=gz5JtQHEbmj8JNuwGJ+CWBjjHWX++XnPdh1YLHQbeAw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ab4HwLsXEDeByjzHuTmcOkwiyyPXawac2JA2lrtQDJoUuQorY+Ly9nI0FHxL6sDyU
	 BkROVgzp4fqfD4Z4my/FK6hH3VvbhIEHMQy5SvN5yydpcYJjJQFw3q24M4BFGyc6Ng
	 2Zm7yxEwuOUJAzeNXJ5IJR1T/sFcgltmEh5UyKhXNuR+56q6RCO84mPx9aZhEw5BD8
	 IHNjRkaZWSHwCTCy3MWCs1vY+LNM9odlYFGz2Y2zUkhXWfHddm9Mcz9dnB56u4A7jW
	 ftf4IEAsfxJCNL9/woPd9xh2oruy8+5CZy5rOoDffx7ttX8I7tObS8Zk05ujefT2RR
	 UNC3J9sBM8rsQ==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5147e441c33so3792277a12.0
        for <loongarch@lists.linux.dev>; Thu, 01 Jun 2023 23:55:37 -0700 (PDT)
X-Gm-Message-State: AC+VfDxygRoFGkqyDKZ4J4ILEefx6hJzQtkGUsQdLOxWvTR0HpxJs1kr
	UXOLV8V41kZSxGzp7rSLIFZ23TTbRaTpWIpMeng=
X-Google-Smtp-Source: ACHHUZ5ZmWVxeDEnl92BnChhmM0USTYEs3cNNm5xY/M+KLGyAI0BTwto/F392XWyAsmDY9jYnJkpXNJ8th7N6GNQb00=
X-Received: by 2002:aa7:ce07:0:b0:50b:c456:a72a with SMTP id
 d7-20020aa7ce07000000b0050bc456a72amr1611001edv.19.1685688936227; Thu, 01 Jun
 2023 23:55:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230602030732.1047696-1-maobibo@loongson.cn> <CAAhV-H58dR4JWtCdqCR553H1-pbppKyi114BMhsrV74Zb_c58Q@mail.gmail.com>
 <17a2ba54-2b85-9cc9-2a43-16eb20d6ce84@loongson.cn>
In-Reply-To: <17a2ba54-2b85-9cc9-2a43-16eb20d6ce84@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 2 Jun 2023 14:55:23 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4VHoNQdpDdpcPfDXJxnpoWUtDqmJMhb_r4DS4JtnxvhQ@mail.gmail.com>
Message-ID: <CAAhV-H4VHoNQdpDdpcPfDXJxnpoWUtDqmJMhb_r4DS4JtnxvhQ@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Align pci memory base address with page size
To: "bibo, mao" <maobibo@loongson.cn>
Cc: loongson-kernel@lists.loongnix.cn, Bjorn Helgaas <helgaas@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Jianmin Lv <lvjianmin@loongson.cn>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 2, 2023 at 2:48=E2=80=AFPM bibo, mao <maobibo@loongson.cn> wrot=
e:
>
>
>
> =E5=9C=A8 2023/6/2 12:11, Huacai Chen =E5=86=99=E9=81=93:
> > +cc Bjorn
> >
> > Hi, Bibo,
> >
> > On Fri, Jun 2, 2023 at 11:07=E2=80=AFAM Bibo Mao <maobibo@loongson.cn> =
wrote:
> >>
> >> LoongArch linux kernel uses 16K page size by default, some pci devices=
 have
> >> only 4K memory size, it is normal in general architectures. However me=
mory
> >> space of different pci devices will share one physical page address sp=
ace.
> >> This is not safe for mmu protection, also UIO and VFIO requires base
> >> address of pci memory space page aligned.
> >>
> >> This patch adds check with function pcibios_align_resource, and set ba=
se
> >> address of resource page aligned.
> >>
> >> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
> >> ---
> >>  arch/loongarch/pci/pci.c | 23 +++++++++++++++++++++++
> >>  1 file changed, 23 insertions(+)
> >>
> >> diff --git a/arch/loongarch/pci/pci.c b/arch/loongarch/pci/pci.c
> >> index 2726639150bc..1380f3672ba2 100644
> >> --- a/arch/loongarch/pci/pci.c
> >> +++ b/arch/loongarch/pci/pci.c
> >> @@ -83,6 +83,29 @@ int pcibios_alloc_irq(struct pci_dev *dev)
> >>         return acpi_pci_irq_enable(dev);
> >>  }
> >>
> >> +/*
> >> + * memory space size of some pci cards is 4K, it is separated with
> >> + * different pages for generic architectures, so that mmu protection =
can
> >> + * work with different pci cards. However page size for LoongArch sys=
tem
> >> + * is 16K, memory space of different pci cards may share the same pag=
e
> >> + * on LoongArch, it is not safe here.
> >> + * Also uio drivers and vfio drivers sugguests that base address of m=
emory
> >> + * space should page aligned. This function aligns base address with =
page size
> >> + */
> >> +resource_size_t pcibios_align_resource(void *data, const struct resou=
rce *res,
> >> +               resource_size_t size, resource_size_t align)
> >> +{
> >> +       resource_size_t start =3D res->start;
> >> +
> >> +       if (res->flags & IORESOURCE_MEM) {
> >> +               if (align & (PAGE_SIZE - 1)) {
> >> +                       align =3D PAGE_SIZE;
> >> +                       start =3D ALIGN(start, align);
> > I don't know whether this patch is really needed, but the logic here
> > has some problems.
> >
> > For example, if PAGE_SIZE=3D16KB, align=3D18KB, what should we do? Alig=
n
> > to 16KB or align to 32KB? IMO it should align to 32KB, but in your
> > patch it will align to 16KB.
> In general pci device is aligned by size, and its value is a power of 2 i=
n value.
> I do not see such devices with 18K alignment requirements.
If so, you can simply ignore "align" and use  start =3D ALIGN(start, PAGE_S=
IZE);

>
> By pci local bus spec, there are such lines:
>
> "Devices are free to consume more address space than required, but decodi=
ng down
> to a 4 KB space for memory is suggested for devices that need less than t=
hat amount. For
> instance, a device that has 64 bytes of registers to be mapped into Memor=
y Space may
> consume up to 4 KB of address space in order to minimize the number of bi=
ts in the address
> decoder."
>
> I cannot  think whether it is necessary simply from judging whether other
> architectures have similar code. If so, LoongArch system just  always fol=
lows others.
> It is actually one problem since LoongArch uses 16K page size.
As I know, both MIPS and ARM64 can use non-4K pages, but when I grep
pcibios_align_resource in the arch directory, none of them do
PAGE_SIZE alignment.

Huacai

>
> Regards
> Bibo, Mao
> >
> > Huacai
> >> +               }
> >> +       }
> >> +       return start;
> >> +}
> >> +
> >>  static void pci_fixup_vgadev(struct pci_dev *pdev)
> >>  {
> >>         struct pci_dev *devp =3D NULL;
> >> --
> >> 2.27.0
> >>
> > _______________________________________________
> > Loongson-kernel mailing list -- loongson-kernel@lists.loongnix.cn
> > To unsubscribe send an email to loongson-kernel-leave@lists.loongnix.cn
>
>
