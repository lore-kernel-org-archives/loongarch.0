Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BF3143723
	for <loongarch@lists.linux.dev>; Thu,  8 Aug 2024 08:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723104209; cv=none; b=BWrngz09lJ+bKuQcDPXZdy8cmfl+fw6CQWL2BWJh8swYv7RWGwwP4EaLtCVtYCzsg8/CF2J6NKvXghOmObwOn/Z3xqb0EeeM5HE0LGjAjH8mLDoEy4g6qRwtbc6P9hk+C2tMm7ROVkf0htZri7lpTp5X6vsJJIiUlux5ZKiiCTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723104209; c=relaxed/simple;
	bh=5XIOBDmdcE1xfi6LAPUxjIUtOcBxQgathFGyanyABbg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m/riSfhIU0GUMzqRCL7a2Ss8CXh9qVfl17IINzo781dHpW9EepB0eRp9oPzOXaQQG1HQWVMnBO5ddjuiazflPJ0WovzMT/ilgjFvyNU3glAmV/xa95M2GXgJz0NY57I9jeS0RWOUpO2oj0ZCRNfbwyNRZowGqPqfBU2hQyWQVfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GgZ/f68l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GgZ/f68l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98B68C4AF16
	for <loongarch@lists.linux.dev>; Thu,  8 Aug 2024 08:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723104208;
	bh=5XIOBDmdcE1xfi6LAPUxjIUtOcBxQgathFGyanyABbg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GgZ/f68lJ/wZt5nsjJ2FmN7osJSDJgnDXZNK5+qBUk+HQPaiMTKvJ9oeVokp+v1FD
	 Pu6s2kY4by2jKzBwQVWlRJMdaoySjX5E0QEA9QjNlEKsDKEhOZ5ye10Kjfk1ZaOCB/
	 /V0Rq+po1U2rGFHjjRvJCkpRvg0lXwQrTHPfbtho20RbDZL1MbTKO4tMbFdqWQHhO7
	 LMbE7OIRoDd/nHRSaGzextCWe328gAjIwCu2UfUQUSmnI5ZwCy8ucd5noe9xm1vFDH
	 VEP0iEhqRjVSls/4TmTed9GrI3Kwvt3oMI71IXtZfbf4JP/yORkZLZpyebdSCLPFf2
	 f1Kqpjfwrt9Jg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52efdf02d13so1208416e87.2
        for <loongarch@lists.linux.dev>; Thu, 08 Aug 2024 01:03:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUlT4eVmJG0ekoBG1vq2NziD+ZijefkeZQDbPcnoEaqQTRhKtYmyLpGoTiznZUQ32oo6uwlt4kQnC0vKxiAbnHldv6UmVvWfQbi
X-Gm-Message-State: AOJu0YytvZYgwc/y/MPJ6sgXjimt+jGxVZhWVCXaDoUvvE3B4jxvGj3U
	6VHo6q687FzSe/w+Oyqpp7sglLHcdNuY66bFUn1ppyCF1k022jtSvBYw6cb5Yc7EaYUSQXIn9em
	lXpc1QEFVJ19J5AFyegq5+aohFR4=
X-Google-Smtp-Source: AGHT+IGUcyROuCVRvFawk0tNkyq3zXVcrypZ/E0fTJF+LE3Z7riNXq3gQCNs3MGE4OjTaREQLn9aFU8R3EPyh+dDwpM=
X-Received: by 2002:a05:6512:318d:b0:52e:d0f8:2d43 with SMTP id
 2adb3069b0e04-530e58207d0mr801724e87.17.1723104206774; Thu, 08 Aug 2024
 01:03:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240806115557.4750-1-zhangtianyang@loongson.cn>
 <87le180z8b.ffs@tglx> <bc5d4e7a-ba81-f8f7-3629-2c80897d8ffc@loongson.cn>
In-Reply-To: <bc5d4e7a-ba81-f8f7-3629-2c80897d8ffc@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 8 Aug 2024 16:03:14 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7EHRSFsJCY3F2NdwjGcEO-TnSF4S3iQnYXh-N8c2-b4g@mail.gmail.com>
Message-ID: <CAAhV-H7EHRSFsJCY3F2NdwjGcEO-TnSF4S3iQnYXh-N8c2-b4g@mail.gmail.com>
Subject: Re: [PATCH V8 2/2] irqchip/loongarch-avec: Add AVEC irqchip support
To: Tianyang Zhang <zhangtianyang@loongson.cn>
Cc: Thomas Gleixner <tglx@linutronix.de>, corbet@lwn.net, alexs@kernel.org, kernel@xen0n.name, 
	jiaxun.yang@flygoat.com, gaoliang@loongson.cn, wangliupu@loongson.cn, 
	lvjianmin@loongson.cn, yijun@loongson.cn, mhocko@suse.com, 
	akpm@linux-foundation.org, dianders@chromium.org, maobibo@loongson.cn, 
	xry111@xry111.site, zhaotianrui@loongson.cn, nathan@kernel.org, 
	yangtiezhu@loongson.cn, zhoubinbin@loongson.cn, loongarch@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Huacai Chen <chenhuacai@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Tianyang,

On Thu, Aug 8, 2024 at 2:52=E2=80=AFPM Tianyang Zhang <zhangtianyang@loongs=
on.cn> wrote:
>
> Hi, Thomas
>
> Thank you for your feedback.
>
> =E5=9C=A8 2024/8/8 =E4=B8=8A=E5=8D=886:01, Thomas Gleixner =E5=86=99=E9=
=81=93:
>
> >> +    guard(raw_spinlock_irqsave)(&loongarch_avec.lock);
> >> +
> >> +    for (i =3D 0; i < nr_irqs; i++) {
> >> +            d =3D irq_domain_get_irq_data(domain, virq + i);
> >> +            if (d) {
> >> +                    clear_free_vector(d);
> >> +                    irq_domain_reset_irq_data(d);
> >> +
> > Stray newline, but the more important question is what kfree()'s 'd'?
> >
> > AFAICT, nothing. So that's a memory leak, no?
> With my understand , 'd' as 'struct irq_data' can be free at public
> irqdomain process, and really miss a kfree targeting 'struct chip_data'
> >
> >> +static int __init avecintc_init(struct irq_domain *parent)
> >> +{
> >> +    parent_irq =3D irq_create_mapping(parent, INT_AVEC);
> >> +    if (!parent_irq) {
> >> +            pr_err("Failed to mapping hwirq\n");
> >> +            ret =3D -EINVAL;
> >> +            goto out_remove_domain;
> >> +    }
> >> +    irq_set_chained_handler_and_data(parent_irq, avecintc_irq_dispatc=
h, NULL);
> >> +
> >> +    ret =3D irq_matrix_init();
> >> +    if (ret < 0) {
> >> +            pr_err("Failed to init irq matrix\n");
> >> +            goto out_remove_domain;
> > Which still leaves the disfunct chained handler installed and the
> > mapping intact.
>
> There is indeed a problem here, but we have not found a similar approach
> for reference.
>
> Is it reasonable to replace here with handle_bad_irq in case of failure?
> or is there any other more suitable way. We hope you can give us some
> suggestions, thank you very much
Maybe we can move irq_set_chained_handler_and_data(parent_irq,
avecintc_irq_dispatch, NULL) after the checking of irq_matrix_init().

Huacai

>
> >> +#endif
> >> +    value =3D iocsr_read64(LOONGARCH_IOCSR_MISC_FUNC);
> >> +    value |=3D IOCSR_MISC_FUNC_AVEC_EN;
> >> +    iocsr_write64(value, LOONGARCH_IOCSR_MISC_FUNC);
> >> +
> >> +    return ret;
> >> +
> >> +out_remove_domain:
> >> +    irq_domain_remove(loongarch_avec.domain);
> >> +out_free_handle:
> >> +    irq_domain_free_fwnode(loongarch_avec.fwnode);
> >> +out:
> >> +    return ret;
> >> +}
> >> +
> >> +static int __init pch_msi_parse_madt(union acpi_subtable_headers *hea=
der,
> >> +                                 const unsigned long end)
> >> +{
> >> +    struct acpi_madt_msi_pic *pchmsi_entry =3D (struct acpi_madt_msi_=
pic *)header;
> >> +
> >> +    msi_base_addr =3D pchmsi_entry->msg_address - AVEC_MSG_OFFSET;
> > What validates that msi_base_addr has none of the lower 16 bits set, as
> > they are required to be zero to make MSI message composing work, right?
>
> This operation originates from some hardware designs.
>
> In 3C6000, either eiointc or avecintc can be the parent controller for
> MSI interrupts and these two controllers have different MSI msg address.
>
> In our platform design scheme, we fix avec-msg-address to the address of
> (eiointc-msg-address - 0x100000). Therefore, here we need to subtract
> AVEC_MSG_OFFSET from the msg_address obtained by MCFG
>
> The main purpose of the design that users of 3C6000 can freely choose
> the version of the Linux kernel that supports loongarch (regardless of
> whether AVEC is supported or not) without having to change the firmware
>
>
> Thanks again
>
> Tianyang
>
