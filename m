Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F403F10E9
	for <loongarch@lists.linux.dev>; Tue, 19 Jul 2022 02:25:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C668C385A5
	for <loongarch@lists.linux.dev>; Tue, 19 Jul 2022 02:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658197515;
	bh=aI9ncPSXA3G53kXq/YMko+2HDyZfj7ntxxBrDiT0Nno=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Hn8XCKwHct9aaA89WpZ+sMfnB2YCPoWm553kjo3uLxx4bI9hrKBDWhnmJEO2YJ5c2
	 lLi2202A+Z50JYmlSyO8VHW9XPBOc8FlI3rcY/Moo6vU38pR7vUe03sPsbcq/4ymWi
	 iyM157w4gkyNqyXT/IYDMbOoD9Iwh5a1Av6S5ksuDLmT+JUmwTzBf2KxHxp28Po6/a
	 VrIn0HZ8j9E7wvfu4wAxnGUSe3SHsYdYpYD6MMIQhORwHnBZFGEkBlV0/z4y+XkBLX
	 owd8ibE6akyjcv1AJP1tahyAm71M+WVra7Wg+jdMNT7c0NLUexDlf1Pa2xI/eInBOk
	 xUJVptSIcXvkQ==
Received: by mail-vs1-f46.google.com with SMTP id 185so2514879vsi.2
        for <loongarch@lists.linux.dev>; Mon, 18 Jul 2022 19:25:15 -0700 (PDT)
X-Gm-Message-State: AJIora9YICxF6uS91ch/EicgJLtA4np22I/6Gzg/Ah+7OqSkDkXRhzH8
	NGWRxEO32+FmGolmCYuNh91LqSj4M+/yuJCfpbU=
X-Google-Smtp-Source: AGRyM1tsgsYpAKl8MNki1e2BrydFDJ+tIHElZy+8QdDKHXWRH6PdAiHQMT50PmKMPcmpqnYXFfEHo5jEqW1RPS/tdRk=
X-Received: by 2002:a67:ec05:0:b0:357:7a48:cba8 with SMTP id
 d5-20020a67ec05000000b003577a48cba8mr11439234vso.78.1658197514595; Mon, 18
 Jul 2022 19:25:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1658153621-40445-1-git-send-email-lvjianmin@loongson.cn> <1658153621-40445-15-git-send-email-lvjianmin@loongson.cn>
In-Reply-To: <1658153621-40445-15-git-send-email-lvjianmin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 19 Jul 2022 10:25:02 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6sdaVDDifrmD8G-d7zpxC8k3WA_K5w3yp3URsjLTbyfA@mail.gmail.com>
Message-ID: <CAAhV-H6sdaVDDifrmD8G-d7zpxC8k3WA_K5w3yp3URsjLTbyfA@mail.gmail.com>
Subject: Re: [PATCH V16 14/14] irqchip / ACPI: Introduce ACPI_IRQ_MODEL_LPIC
 for LoongArch
To: Jianmin Lv <lvjianmin@loongson.cn>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, loongarch@lists.linux.dev, 
	Hanjun Guo <guohanjun@huawei.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@loongson.cn>
Content-Type: text/plain; charset="UTF-8"

Hi, Jianmin,

On Mon, Jul 18, 2022 at 10:21 PM Jianmin Lv <lvjianmin@loongson.cn> wrote:
>
> For LoongArch, ACPI_IRQ_MODEL_LPIC is introduced, and then the
> callback acpi_get_gsi_domain_id and acpi_gsi_to_irq_fallback are
> implemented.
>
> The acpi_get_gsi_domain_id callback returns related fwnode handle
> of irqdomain for different GSI range.
>
> The acpi_gsi_to_irq_fallback will create new mapping for gsi when
> the mapping of it is not found.
>
> Signed-off-by: Jianmin Lv <lvjianmin@loongson.cn>
> ---
>  drivers/acpi/bus.c                  |  3 +++
>  drivers/irqchip/irq-loongarch-cpu.c | 38 +++++++++++++++++++++++++++++++++++++
>  include/linux/acpi.h                |  1 +
>  3 files changed, 42 insertions(+)
>
> diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
> index 86fa61a..63fbf00 100644
> --- a/drivers/acpi/bus.c
> +++ b/drivers/acpi/bus.c
> @@ -1145,6 +1145,9 @@ static int __init acpi_bus_init_irq(void)
>         case ACPI_IRQ_MODEL_PLATFORM:
>                 message = "platform specific model";
>                 break;
> +       case ACPI_IRQ_MODEL_LPIC:
> +               message = "LPIC";
> +               break;
>         default:
>                 pr_info("Unknown interrupt routing model\n");
>                 return -ENODEV;
> diff --git a/drivers/irqchip/irq-loongarch-cpu.c b/drivers/irqchip/irq-loongarch-cpu.c
> index b4db430..a5e0bf0 100644
> --- a/drivers/irqchip/irq-loongarch-cpu.c
> +++ b/drivers/irqchip/irq-loongarch-cpu.c
> @@ -16,6 +16,42 @@
>  static struct irq_domain *irq_domain;
>  struct fwnode_handle *cpuintc_handle;
>
> +static u32 lpic_gsi_to_irq(u32 gsi)
> +{
> +       /* Only pch irqdomain transferring is required for LoongArch. */
> +       if (gsi >= GSI_MIN_PCH_IRQ && gsi <= GSI_MAX_PCH_IRQ)
> +               return acpi_register_gsi(NULL, gsi, ACPI_LEVEL_SENSITIVE, ACPI_ACTIVE_HIGH);
> +
> +       return 0;
> +}
> +
> +static struct fwnode_handle *lpic_get_gsi_domain_id(u32 gsi)
> +{
> +       int id;
> +       struct fwnode_handle *domain_handle = NULL;
> +
> +       switch (gsi) {
> +       case GSI_MIN_CPU_IRQ ... GSI_MAX_CPU_IRQ:
> +               if (liointc_handle)
> +                       domain_handle = liointc_handle;
> +               break;
> +
> +       case GSI_MIN_LPC_IRQ ... GSI_MAX_LPC_IRQ:
> +               if (pch_lpc_handle)
> +                       domain_handle = pch_lpc_handle;
> +               break;
> +
> +       case GSI_MIN_PCH_IRQ ... GSI_MAX_PCH_IRQ:
> +               id = find_pch_pic(gsi);
> +               if (id >= 0 && pch_pic_handle[id])
> +                       domain_handle = pch_pic_handle[id];
> +
Remove this blank line, please.

Huacai
> +               break;
> +       }
> +
> +       return domain_handle;
> +}
> +
>  static void mask_loongarch_irq(struct irq_data *d)
>  {
>         clear_csr_ecfg(ECFGF(d->hwirq));
> @@ -102,6 +138,8 @@ static int __init cpuintc_acpi_init_v1(union acpi_subtable_headers *header,
>                 panic("Failed to add irqdomain for LoongArch CPU");
>
>         set_handle_irq(&handle_cpu_irq);
> +       acpi_set_irq_model(ACPI_IRQ_MODEL_LPIC, lpic_get_gsi_domain_id);
> +       acpi_set_gsi_to_irq_fallback(lpic_gsi_to_irq);
>         acpi_cascade_irqdomain_init();
>
>         return 0;
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index e2b60d5..76520f3 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -105,6 +105,7 @@ enum acpi_irq_model_id {
>         ACPI_IRQ_MODEL_IOSAPIC,
>         ACPI_IRQ_MODEL_PLATFORM,
>         ACPI_IRQ_MODEL_GIC,
> +       ACPI_IRQ_MODEL_LPIC,
>         ACPI_IRQ_MODEL_COUNT
>  };
>
> --
> 1.8.3.1
>
>
