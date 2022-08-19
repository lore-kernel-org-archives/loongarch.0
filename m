Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB8717EE
	for <loongarch@lists.linux.dev>; Fri, 19 Aug 2022 08:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA96FC433D7
	for <loongarch@lists.linux.dev>; Fri, 19 Aug 2022 08:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660898410;
	bh=pbPOH8lcJsczbtzTQ81SaxpugXuzQ8vfVpiBgdOWZos=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pfMxvGTPU3pVuiuDYLLA5c5ZmV/YXIGkwKZ9Ys18RSjydBMQuyfcOLtXjrE4unJLq
	 qE6xKMBlPSil3Qbi3X7f9kuYCMKPxEAlqEt6PufFhEl9JysdYzK6bWd/XXc3myVXkI
	 qnCPkAOJomDteQMMFVRZaOkX/GMUXyAUHbkxNPuSjHDkU9uym8KE+Ce85RawFFBxec
	 7w/2v/cBhUUC8saEsIwZXTUOpCqT7GWOJEz7x8+ZLGMuVGjB0RmPeZRnVlS7OMoRRo
	 8BaymNtzSmuFj/W/ai+JfvYMEXCkgRCrR+XU4qd6Vap3KzxlAqMGSnRNlUBVUsfkap
	 G5Ygth0XHctcw==
Received: by mail-vs1-f52.google.com with SMTP id o123so3829359vsc.3
        for <loongarch@lists.linux.dev>; Fri, 19 Aug 2022 01:40:10 -0700 (PDT)
X-Gm-Message-State: ACgBeo3IQX0KrpD7srWpQD8XsWLqio+sR4MonYSKhlOlrdAlqr/x8t1S
	Yq3meJ+Hbei4fwyEdMk7Y8xX5mflCvZPV3bmB0E=
X-Google-Smtp-Source: AA6agR6rQK+fyBXvNJhcWl+WEfRCdo2v3o22mYmBhfqQ5UR5TbIn9ARpfFOQv7GnOVZtfy5tvmtzWfHjEnZqtj4WVbk=
X-Received: by 2002:a67:d483:0:b0:38f:4981:c4f3 with SMTP id
 g3-20020a67d483000000b0038f4981c4f3mr2113563vsj.59.1660898409777; Fri, 19 Aug
 2022 01:40:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220819072239.60378-1-liyupeng@zbhlos.com>
In-Reply-To: <20220819072239.60378-1-liyupeng@zbhlos.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 19 Aug 2022 16:39:57 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4m+Wzc-E=owWo34hYBa8fHKQG_uBAw4y4mCFUXEfge0g@mail.gmail.com>
Message-ID: <CAAhV-H4m+Wzc-E=owWo34hYBa8fHKQG_uBAw4y4mCFUXEfge0g@mail.gmail.com>
Subject: Re: [PATCH 1/2] irqchip: Fixed LoongArch CPU interrupt types defined.
To: Yupeng Li <liyupeng@zbhlos.com>
Cc: WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
	loongarch@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>, 
	Caicai <caizp2008@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Yupeng,

This errors can be fixed once this patch be merged:
https://lore.kernel.org/lkml/20220808085319.3350111-1-chenhuacai@loongson.c=
n/

Huacai

On Fri, Aug 19, 2022 at 3:23 PM Yupeng Li <liyupeng@zbhlos.com> wrote:
>
> When CONFIG_LOONGSON_LIOINTC,CONFIG_LOONGSON_EIOINTC,
> CONFIG_LOONGSON_PCH_LPC,CONFIG_LOONGSON_PCH_PIC was disabled,
> build kernel with errors like:
>
> MODPOST vmlinux.symvers
> MODINFO modules.builtin.modinfo
> GEN     modules.builtin
> LD      .tmp_vmlinux.kallsyms1
> loongarch64-linux-gnu-ld: drivers/irqchip/irq-loongarch-cpu.o: in functio=
n `lpic_get_gsi_domain_id':
> irq-loongarch-cpu.c:(.text+0x8): undefined reference to `pch_lpc_handle'
> loongarch64-linux-gnu-ld: irq-loongarch-cpu.c:(.text+0xc): undefined refe=
rence to `pch_lpc_handle'
> loongarch64-linux-gnu-ld: irq-loongarch-cpu.c:(.text+0xc): undefined refe=
rence to `pch_lpc_handle'
> make: *** [Makefile:1171=EF=BC=9Avmlinux] =E9=94=99=E8=AF=AF 1
>
> Reviewed-by: Caicai <caizp2008@163.com>
> Signed-off-by: Yupeng Li <liyupeng@zbhlos.com>
> ---
>  drivers/irqchip/irq-loongarch-cpu.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/irqchip/irq-loongarch-cpu.c b/drivers/irqchip/irq-lo=
ongarch-cpu.c
> index 327f3ab62c03..d296f704cbb6 100644
> --- a/drivers/irqchip/irq-loongarch-cpu.c
> +++ b/drivers/irqchip/irq-loongarch-cpu.c
> @@ -27,24 +27,30 @@ static u32 lpic_gsi_to_irq(u32 gsi)
>
>  static struct fwnode_handle *lpic_get_gsi_domain_id(u32 gsi)
>  {
> +#ifdef CONFIG_LOONGSON_PCH_PIC
>         int id;
> +#endif
>         struct fwnode_handle *domain_handle =3D NULL;
>
>         switch (gsi) {
>         case GSI_MIN_CPU_IRQ ... GSI_MAX_CPU_IRQ:
> +#ifdef CONFIG_LOONGSON_LIOINTC
>                 if (liointc_handle)
>                         domain_handle =3D liointc_handle;
> +#endif
>                 break;
> -
>         case GSI_MIN_LPC_IRQ ... GSI_MAX_LPC_IRQ:
> +#ifdef CONFIG_LOONGSON_PCH_LPC
>                 if (pch_lpc_handle)
>                         domain_handle =3D pch_lpc_handle;
> +#endif
>                 break;
> -
>         case GSI_MIN_PCH_IRQ ... GSI_MAX_PCH_IRQ:
> +#ifdef CONFIG_LOONGSON_PCH_PIC
>                 id =3D find_pch_pic(gsi);
>                 if (id >=3D 0 && pch_pic_handle[id])
>                         domain_handle =3D pch_pic_handle[id];
> +#endif
>                 break;
>         }
>
> @@ -92,6 +98,7 @@ static const struct irq_domain_ops loongarch_cpu_intc_i=
rq_domain_ops =3D {
>         .xlate =3D irq_domain_xlate_onecell,
>  };
>
> +#ifdef CONFIG_LOONGSON_LIOINTC
>  static int __init
>  liointc_parse_madt(union acpi_subtable_headers *header,
>                        const unsigned long end)
> @@ -100,7 +107,8 @@ liointc_parse_madt(union acpi_subtable_headers *heade=
r,
>
>         return liointc_acpi_init(irq_domain, liointc_entry);
>  }
> -
> +#endif
> +#ifdef CONFIG_LOONGSON_EIOINTC
>  static int __init
>  eiointc_parse_madt(union acpi_subtable_headers *header,
>                        const unsigned long end)
> @@ -109,13 +117,17 @@ eiointc_parse_madt(union acpi_subtable_headers *hea=
der,
>
>         return eiointc_acpi_init(irq_domain, eiointc_entry);
>  }
> -
> +#endif
>  static int __init acpi_cascade_irqdomain_init(void)
>  {
> +#ifdef CONFIG_LOONGSON_LIOINTC
>         acpi_table_parse_madt(ACPI_MADT_TYPE_LIO_PIC,
>                               liointc_parse_madt, 0);
> +#endif
> +#ifdef CONFIG_LOONGSON_EIOINTC
>         acpi_table_parse_madt(ACPI_MADT_TYPE_EIO_PIC,
>                               eiointc_parse_madt, 0);
> +#endif
>         return 0;
>  }
>
> --
> 2.34.1
>
