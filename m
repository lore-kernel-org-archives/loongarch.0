Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0A83D6CAA
	for <loongarch@lists.linux.dev>; Mon,  8 Jun 2026 17:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780939111; cv=none; b=O8AyYApL4JwBotDwYj6hNjPRpmQ/B2ibmT/pE/oneaIVcn547Pnxgux7+TndOJF63ZyIqVV+jkmH5EYBuwWUFh6xDOSdM0/VCvttLG8JfJq4nXH6UTcNtQ85I2mCa3aT9nnMgvrNZVLniHvP7bIH+6eh5ZRlCb9jf6i7eg5Pzrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780939111; c=relaxed/simple;
	bh=XswRMnJy2WcPmkojhTaDjWE6sZSauClfbcBvgsDRxTs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dTP1LcbMsY+Us4Qj7o3Z+UyL2DfKRjwls9q3OEnrkTEcxGCsplT0JUDhsoyLWuUV8DtSTYTw+o8FBQ540vGsQwutoYufy1b+HDZR0VHWadWeWmc0yrS9OxdwjJEWqIDPJ/OzbjG2soL76pATV4txtiZrL45MZcJfLBqO5veq0zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HLTgCh3y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HLTgCh3y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECB051F008A3
	for <loongarch@lists.linux.dev>; Mon,  8 Jun 2026 17:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780939109;
	bh=XrNOOi+PlaQWmV4dMJih5PA704/YUREYdhWD77leDwk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=HLTgCh3yhadZl289IczKuXkCE36Qy7xWQugFEKxferkvMdoUi39a5EfSBSYYG/5L0
	 rqmvn5BwRvfJ9gcRUO5dOU1cZ4cFHPByO4XdvDaRbU/lNu8DMN8sN8+G0x/eZncMxx
	 qcE4hqpnHAr8kL5B0t3GqUjTCcFPi9NvxxvU7uCAef3rxLRq1UEJd0RNxehBZTsnHS
	 Wiw3c+X2tgQqIAGFGeVL5c1gdbjX6ajj+NEO8jI0cR1DrhbE0zK6zvviO7SPBG2X8j
	 gZO2GWNBfvSSrQ9K9S1l8DYU0BvHH+jT+igpACkxJd5M83AhLapkQEBY+e7F3Wq21T
	 EcjeVVSjGa/Pw==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39666aac20cso33625251fa.1
        for <loongarch@lists.linux.dev>; Mon, 08 Jun 2026 10:18:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+qLfVr6yVu97MPO09leV/tLW7DbZ9N4iKWif38orGPhuWLze1sjZK8TmXsmzXRjkIHCC2f4K6KzSg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzeDAmZjwutUcic3cYrn+y4bX9sqadZw5wKEykIsRBsCwyzGQ3v
	TtFCrkXLgDq0p9cShOPep1z/g5/BId4xdIf9t5velAn3FVu+v44FOdPnm2+RMpDp8lUXEzdyu1t
	S3QH3/N6E0HlfwlMiT0I0fVHPv8t19gA=
X-Received: by 2002:a05:6512:33c3:b0:5aa:6e5d:adf5 with SMTP id
 2adb3069b0e04-5aa87beb34fmr4601211e87.19.1780939107273; Mon, 08 Jun 2026
 10:18:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-0-23ffa16b6ebb@kernel.org>
 <20260603-gic-v5-acpi-iwb-probe-deferral-v2-6-23ffa16b6ebb@kernel.org>
In-Reply-To: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-6-23ffa16b6ebb@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 8 Jun 2026 19:18:15 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0ibZKfzJwGyUb92-K1N9C_ab0QujpAKCrvMdyygquS1Vw@mail.gmail.com>
X-Gm-Features: AVVi8CcTa11c5Xl8V7_VF2hxe7iSgWJNbGaXh3nHX-6VT5F-TvPgOxONicEOC_k
Message-ID: <CAJZ5v0ibZKfzJwGyUb92-K1N9C_ab0QujpAKCrvMdyygquS1Vw@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] irqchip/gic-v5: Enable GICv5 IWB ACPI probe
 ordering detection
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Sunil V L <sunilvl@ventanamicro.com>, Marc Zyngier <maz@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Hanjun Guo <guohanjun@huawei.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2026 at 10:21=E2=80=AFAM Lorenzo Pieralisi <lpieralisi@kerne=
l.org> wrote:
>
> Register an ACPI hook in the ACPI interrupt management code for GICv5 to
> retrieve the ACPI interrupt controller handle (if any) of the controller
> handling a specific GSI, by updating the acpi_set_irq_model() call with
> the gic_v5_get_gsi_handle() function pointer parameter.
>
> gicv5_get_gsi_handle() allows ACPI core to detect the ACPI handle
> of the controller that manages a specific GSI interrupt.
>
> Update the IWB driver to clear device dependencies in ACPI core once the
> IWB driver has probed.
>
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Thomas Gleixner <tglx@kernel.org>
> Cc: Marc Zyngier <maz@kernel.org>
> ---
>  drivers/irqchip/irq-gic-v5-iwb.c |  5 +++++
>  drivers/irqchip/irq-gic-v5.c     | 13 +++++++++++--
>  2 files changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/irqchip/irq-gic-v5-iwb.c b/drivers/irqchip/irq-gic-v=
5-iwb.c
> index 9103feb70ce8..a02cb9537b15 100644
> --- a/drivers/irqchip/irq-gic-v5-iwb.c
> +++ b/drivers/irqchip/irq-gic-v5-iwb.c
> @@ -269,6 +269,11 @@ static int gicv5_iwb_device_probe(struct platform_de=
vice *pdev)
>         if (IS_ERR(iwb_node))
>                 return PTR_ERR(iwb_node);
>
> +#ifdef CONFIG_ACPI
> +       if (has_acpi_companion(&pdev->dev))
> +               acpi_dev_clear_dependencies(ACPI_COMPANION(&pdev->dev));
> +#endif

I would rather add a wrapper for this, along with an empty stub for
the !CONFIG_ACPI case.

> +
>         return 0;
>  }
>
> diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
> index 03cc2830b260..26cfaea1af41 100644
> --- a/drivers/irqchip/irq-gic-v5.c
> +++ b/drivers/irqchip/irq-gic-v5.c
> @@ -1217,11 +1217,19 @@ static struct fwnode_handle *gsi_domain_handle;
>  static struct fwnode_handle *gic_v5_get_gsi_domain_id(u32 gsi)
>  {
>         if (FIELD_GET(GICV5_GSI_IC_TYPE, gsi) =3D=3D GICV5_GSI_IWB_TYPE)
> -               return iort_iwb_handle(FIELD_GET(GICV5_GSI_IWB_FRAME_ID, =
gsi));
> +               return iort_iwb_handle_fwnode(FIELD_GET(GICV5_GSI_IWB_FRA=
ME_ID, gsi));

Why is this change needed?

>
>         return gsi_domain_handle;
>  }
>
> +static acpi_handle gic_v5_get_gsi_handle(u32 gsi)
> +{
> +       if (FIELD_GET(GICV5_GSI_IC_TYPE, gsi) =3D=3D GICV5_GSI_IWB_TYPE)
> +               return iort_iwb_handle(FIELD_GET(GICV5_GSI_IWB_FRAME_ID, =
gsi));
> +
> +       return NULL;
> +}
> +
>  static int __init gic_acpi_init(union acpi_subtable_headers *header, con=
st unsigned long end)
>  {
>         struct acpi_madt_gicv5_irs *irs =3D (struct acpi_madt_gicv5_irs *=
)header;
> @@ -1242,7 +1250,8 @@ static int __init gic_acpi_init(union acpi_subtable=
_headers *header, const unsig
>         if (ret)
>                 goto out_irs;
>
> -       acpi_set_irq_model(ACPI_IRQ_MODEL_GIC_V5, gic_v5_get_gsi_domain_i=
d, NULL);
> +       acpi_set_irq_model(ACPI_IRQ_MODEL_GIC_V5, gic_v5_get_gsi_domain_i=
d,
> +                          gic_v5_get_gsi_handle);
>
>         return 0;
>
>
> --
