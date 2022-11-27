Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9EF17D0
	for <loongarch@lists.linux.dev>; Sun, 27 Nov 2022 05:43:22 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id f7so11412438edc.6
        for <loongarch@lists.linux.dev>; Sat, 26 Nov 2022 21:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QZBNnP8FHtYG+tvjYSybxiFeBtiJ83MhkpqU8o7jStU=;
        b=g9f5MoHeohB9VLPYcx+PnsoTTKUXQ7jtHayP+8thG4XYo/Ood14KvawMdYrmMi6Sdn
         XgwQufokf1+IuWUzPTTJRAwwa1x0RIKRqiMbLTDRbbIt6+vZI/b0ztXXMXUwt++dwN2U
         Nvji3Io4N0jLUXyF2P6mlAzl1aV1D0TKjIkbMGz2fsPlOBpthC/cvC7O6WsdI+uQbYri
         +suBgomU0xKgdQQ8888KF6Kqf7SoOW9muXzNbD90V0BGikayezGBM/pTHikfY47t1fYR
         nkotypW/TZCJXVHsXsb4b8k1ZAFbYddCDOQrjaufc9MgNwUqsQHL71poBwzaIUzrjlYp
         bcfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QZBNnP8FHtYG+tvjYSybxiFeBtiJ83MhkpqU8o7jStU=;
        b=fpU4mRlyOpuAO4fzgxvWgFsWhuOEHTgrEwR45RR0HQOx5VF8XsHO5TPl/5o6XXqjYc
         3yKdPUZXAhXXnNH+BlsT43ueccbAdNmOdUD4jyiMiu7SsvM82pTTkS+uXHCLG2EsZZa2
         +2S8wYtTOJtHcORgQSuN5UDq13Y4A285bHcalu/IDmWFZ6YVJDw8HyQeHIq51oTo/Wv7
         XjOa4NZUemEq1AFAx3D+8S9MQEE4+/OFw9gMnMW++VsSfVTDptJP1JRcmJFv6c8/AKhk
         bMImSPueVs9k2Mw38VzslE58dehWY7XRdnJiMdmWjtEW5ah5aMCa6VXcpraRNSnfI3dm
         9TCw==
X-Gm-Message-State: ANoB5pm+A2OeCRiYk0zMoYDXn0w4mEiJLnrZGNEvv7UP0r1GQbtYInRR
	oOIsWkQfmG3CUCTAk9uIXQil7hAzY+p+/KuXurU=
X-Google-Smtp-Source: AA0mqf45PplknXFTYiFz3FlUBn9EzNowRqh6cT67X7zcC5KmhMpgz2cnEbr6lI/yym0HEOHGfZbUqXHRD62N6RxjctE=
X-Received: by 2002:a05:6402:5388:b0:46a:f4b0:2d23 with SMTP id
 ew8-20020a056402538800b0046af4b02d23mr4184088edb.78.1669527800893; Sat, 26
 Nov 2022 21:43:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221020142514.1725514-1-chenhuacai@loongson.cn>
In-Reply-To: <20221020142514.1725514-1-chenhuacai@loongson.cn>
From: Huacai Chen <chenhuacai@gmail.com>
Date: Sun, 27 Nov 2022 13:43:06 +0800
Message-ID: <CAAhV-H6uu5+WUaM0HVn40D=bpH4LmMNdUBJMSGuCMUchhsRa9g@mail.gmail.com>
Subject: Re: [PATCH V2] irqchip/loongarch: Adjust acpi_cascade_irqdomain_init()
 and sub-routines
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"

Hi, Marc,

Just a gentle ping, I found that "irqchip/loongson-htvec: Add ACPI
init support" has been merged, so I think this patch can also be
merged to keep acpi_cascade_irqdomain_init()'s consistency. Thanks.


Huacai

On Thu, Oct 20, 2022 at 10:27 PM Huacai Chen <chenhuacai@loongson.cn> wrote:
>
> 1, Adjust the return of acpi_cascade_irqdomain_init() and check its
>    return value.
> 2, Combine unnecessary short lines to one long line.
>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
> V2: Adjust the return of acpi_cascade_irqdomain_init() and check its
>     return value.
>
>  drivers/irqchip/irq-loongarch-cpu.c    | 30 +++++++++++++++-----------
>  drivers/irqchip/irq-loongson-eiointc.c | 30 +++++++++++++++-----------
>  drivers/irqchip/irq-loongson-pch-pic.c | 15 +++++++------
>  3 files changed, 44 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/irqchip/irq-loongarch-cpu.c b/drivers/irqchip/irq-loongarch-cpu.c
> index 741612ba6a52..fdec3e9cfacf 100644
> --- a/drivers/irqchip/irq-loongarch-cpu.c
> +++ b/drivers/irqchip/irq-loongarch-cpu.c
> @@ -92,18 +92,16 @@ static const struct irq_domain_ops loongarch_cpu_intc_irq_domain_ops = {
>         .xlate = irq_domain_xlate_onecell,
>  };
>
> -static int __init
> -liointc_parse_madt(union acpi_subtable_headers *header,
> -                      const unsigned long end)
> +static int __init liointc_parse_madt(union acpi_subtable_headers *header,
> +                                       const unsigned long end)
>  {
>         struct acpi_madt_lio_pic *liointc_entry = (struct acpi_madt_lio_pic *)header;
>
>         return liointc_acpi_init(irq_domain, liointc_entry);
>  }
>
> -static int __init
> -eiointc_parse_madt(union acpi_subtable_headers *header,
> -                      const unsigned long end)
> +static int __init eiointc_parse_madt(union acpi_subtable_headers *header,
> +                                       const unsigned long end)
>  {
>         struct acpi_madt_eio_pic *eiointc_entry = (struct acpi_madt_eio_pic *)header;
>
> @@ -112,16 +110,24 @@ eiointc_parse_madt(union acpi_subtable_headers *header,
>
>  static int __init acpi_cascade_irqdomain_init(void)
>  {
> -       acpi_table_parse_madt(ACPI_MADT_TYPE_LIO_PIC,
> -                             liointc_parse_madt, 0);
> -       acpi_table_parse_madt(ACPI_MADT_TYPE_EIO_PIC,
> -                             eiointc_parse_madt, 0);
> +       int r;
> +
> +       r = acpi_table_parse_madt(ACPI_MADT_TYPE_LIO_PIC, liointc_parse_madt, 0);
> +       if (r < 0)
> +               return r;
> +
> +       r = acpi_table_parse_madt(ACPI_MADT_TYPE_EIO_PIC, eiointc_parse_madt, 0);
> +       if (r < 0)
> +               return r;
> +
>         return 0;
>  }
>
>  static int __init cpuintc_acpi_init(union acpi_subtable_headers *header,
>                                    const unsigned long end)
>  {
> +       int ret;
> +
>         if (irq_domain)
>                 return 0;
>
> @@ -139,9 +145,9 @@ static int __init cpuintc_acpi_init(union acpi_subtable_headers *header,
>         set_handle_irq(&handle_cpu_irq);
>         acpi_set_irq_model(ACPI_IRQ_MODEL_LPIC, lpic_get_gsi_domain_id);
>         acpi_set_gsi_to_irq_fallback(lpic_gsi_to_irq);
> -       acpi_cascade_irqdomain_init();
> +       ret = acpi_cascade_irqdomain_init();
>
> -       return 0;
> +       return ret;
>  }
>
>  IRQCHIP_ACPI_DECLARE(cpuintc_v1, ACPI_MADT_TYPE_CORE_PIC,
> diff --git a/drivers/irqchip/irq-loongson-eiointc.c b/drivers/irqchip/irq-loongson-eiointc.c
> index 16e9af8d8b1e..62867209736c 100644
> --- a/drivers/irqchip/irq-loongson-eiointc.c
> +++ b/drivers/irqchip/irq-loongson-eiointc.c
> @@ -301,9 +301,8 @@ static struct irq_domain *acpi_get_vec_parent(int node, struct acpi_vector_group
>         return NULL;
>  }
>
> -static int __init
> -pch_pic_parse_madt(union acpi_subtable_headers *header,
> -                      const unsigned long end)
> +static int __init pch_pic_parse_madt(union acpi_subtable_headers *header,
> +                                       const unsigned long end)
>  {
>         struct acpi_madt_bio_pic *pchpic_entry = (struct acpi_madt_bio_pic *)header;
>         unsigned int node = (pchpic_entry->address >> 44) & 0xf;
> @@ -315,9 +314,8 @@ pch_pic_parse_madt(union acpi_subtable_headers *header,
>         return -EINVAL;
>  }
>
> -static int __init
> -pch_msi_parse_madt(union acpi_subtable_headers *header,
> -                      const unsigned long end)
> +static int __init pch_msi_parse_madt(union acpi_subtable_headers *header,
> +                                       const unsigned long end)
>  {
>         struct acpi_madt_msi_pic *pchmsi_entry = (struct acpi_madt_msi_pic *)header;
>         struct irq_domain *parent = acpi_get_vec_parent(eiointc_priv[nr_pics - 1]->node, msi_group);
> @@ -330,17 +328,23 @@ pch_msi_parse_madt(union acpi_subtable_headers *header,
>
>  static int __init acpi_cascade_irqdomain_init(void)
>  {
> -       acpi_table_parse_madt(ACPI_MADT_TYPE_BIO_PIC,
> -                             pch_pic_parse_madt, 0);
> -       acpi_table_parse_madt(ACPI_MADT_TYPE_MSI_PIC,
> -                             pch_msi_parse_madt, 1);
> +       int r;
> +
> +       r = acpi_table_parse_madt(ACPI_MADT_TYPE_BIO_PIC, pch_pic_parse_madt, 0);
> +       if (r < 0)
> +               return r;
> +
> +       r = acpi_table_parse_madt(ACPI_MADT_TYPE_MSI_PIC, pch_msi_parse_madt, 1);
> +       if (r < 0)
> +               return r;
> +
>         return 0;
>  }
>
>  int __init eiointc_acpi_init(struct irq_domain *parent,
>                                      struct acpi_madt_eio_pic *acpi_eiointc)
>  {
> -       int i, parent_irq;
> +       int i, ret, parent_irq;
>         unsigned long node_map;
>         struct eiointc_priv *priv;
>
> @@ -386,9 +390,9 @@ int __init eiointc_acpi_init(struct irq_domain *parent,
>
>         acpi_set_vec_parent(acpi_eiointc->node, priv->eiointc_domain, pch_group);
>         acpi_set_vec_parent(acpi_eiointc->node, priv->eiointc_domain, msi_group);
> -       acpi_cascade_irqdomain_init();
> +       ret = acpi_cascade_irqdomain_init();
>
> -       return 0;
> +       return ret;
>
>  out_free_handle:
>         irq_domain_free_fwnode(priv->domain_handle);
> diff --git a/drivers/irqchip/irq-loongson-pch-pic.c b/drivers/irqchip/irq-loongson-pch-pic.c
> index c01b9c257005..7477bbcf89fb 100644
> --- a/drivers/irqchip/irq-loongson-pch-pic.c
> +++ b/drivers/irqchip/irq-loongson-pch-pic.c
> @@ -325,9 +325,8 @@ int find_pch_pic(u32 gsi)
>         return -1;
>  }
>
> -static int __init
> -pch_lpc_parse_madt(union acpi_subtable_headers *header,
> -                      const unsigned long end)
> +static int __init pch_lpc_parse_madt(union acpi_subtable_headers *header,
> +                                       const unsigned long end)
>  {
>         struct acpi_madt_lpc_pic *pchlpc_entry = (struct acpi_madt_lpc_pic *)header;
>
> @@ -336,8 +335,12 @@ pch_lpc_parse_madt(union acpi_subtable_headers *header,
>
>  static int __init acpi_cascade_irqdomain_init(void)
>  {
> -       acpi_table_parse_madt(ACPI_MADT_TYPE_LPC_PIC,
> -                             pch_lpc_parse_madt, 0);
> +       int r;
> +
> +       r = acpi_table_parse_madt(ACPI_MADT_TYPE_LPC_PIC, pch_lpc_parse_madt, 0);
> +       if (r < 0)
> +               return r;
> +
>         return 0;
>  }
>
> @@ -364,7 +367,7 @@ int __init pch_pic_acpi_init(struct irq_domain *parent,
>         }
>
>         if (acpi_pchpic->id == 0)
> -               acpi_cascade_irqdomain_init();
> +               ret = acpi_cascade_irqdomain_init();
>
>         return ret;
>  }
> --
> 2.31.1
>
