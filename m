Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BB1A5C
	for <loongarch@lists.linux.dev>; Sun, 12 Feb 2023 04:48:40 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id jg8so24715845ejc.6
        for <loongarch@lists.linux.dev>; Sat, 11 Feb 2023 20:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LstY/FNwY38eZnkgHmBb8qMyEMi+3HIYCx7mpO5fNdw=;
        b=KBoj0BTmORLrQ4S5flWIPMgY3gtin8RLP7GA0PFKNlYMjVYRePhwaNAQ4r26YuSDtL
         uM5mXITGII75aOqw34CPhQ4Nmtwb1H6fZuPMFMyWbmiHUy5PRZvumu22smnkzIxSb250
         UnXRzCu/Y0FQSc/JHteuMGCa58E2j0EtS73qFupPRacs7gm79u10J/DGBTkJG0LwqksZ
         3BxjjiqdInJzPQiwup0sDadNclyXW/ofdZduuPnAR696aKgQOj811T5Z7izVCZzfco0M
         Y1UeY4ho7FM0Y3KDJUIheqo0f4E7NHNXHES/Qll5D6Y+uJOk0eUHA2PhnDrv8Qa+GX2h
         1FHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LstY/FNwY38eZnkgHmBb8qMyEMi+3HIYCx7mpO5fNdw=;
        b=mbUmBWL79F0LJepSuGuuHURcZEBSXdWiJma6YoDpmFFH+DBzo723bBPoTh3f1UF+p0
         4ge9CRuJkXE3xjRAGO0NnNi4BOGGlrTL0GZDFIsle+yFoO7Dwpy3caKc7pvI2TLlCQ38
         VI+7swiIY683exKysIihwbj+6coIcKZlrzVbhnnxcFMclp4igUrQ+bC8VetwobNkpBwQ
         aUXViJwtyvwZHq1xQXgb2A8zzkZXU9wK4TYnE+9DfEyQldZ1dzoDI7YPBmR6nRBtaEiI
         PgLlTKeW6JlPE0qGZ0ogXZbJbqMOXKH59iE/XVCllI5PXfbg/2MSQI+UIzgFeA8NvAyn
         ZNnw==
X-Gm-Message-State: AO0yUKWtxwTVNN7F1neUP5/DLnCxsvn3e9BZBLC68Pe36Bnk+TdTk57K
	mZC1K/yLvd+evSL8K/mBy67AR/sOsx+kOz/YEj8=
X-Google-Smtp-Source: AK7set/TI9DMhTPOLfacLmASytV4UR6bLaYXY/53EuOB2pq4CRysomi35WFLaPjTMZN1mJ0Awb2tKCFjxpdJRFSu9Xw=
X-Received: by 2002:a17:907:a06e:b0:8ad:cdc3:b2c8 with SMTP id
 ia14-20020a170907a06e00b008adcdc3b2c8mr2854349ejc.2.1676177319028; Sat, 11
 Feb 2023 20:48:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230211024156.3530526-1-zhoubinbin@loongson.cn> <CAAhV-H5JOD4WRyN2rZq9qZAja2--Vg5gdVWYU9Ue0OfioRLJPQ@mail.gmail.com>
In-Reply-To: <CAAhV-H5JOD4WRyN2rZq9qZAja2--Vg5gdVWYU9Ue0OfioRLJPQ@mail.gmail.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Sun, 12 Feb 2023 12:48:26 +0800
Message-ID: <CAMpQs4+wVszOM6RuOZD3q8N2yNpbmgsD0_8p_mDJpGnLjit0BA@mail.gmail.com>
Subject: Re: [PATCH] irqchip/loongson-eiointc: Add DT init support
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Jianmin Lv <lvjianmin@loongson.cn>, 
	Huacai Chen <chenhuacai@loongson.cn>, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, loongarch@lists.linux.dev, 
	loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 12, 2023 at 9:53 AM Huacai Chen <chenhuacai@kernel.org> wrote:
>
> Hi, Binbin,
>
> On Sat, Feb 11, 2023 at 10:41 AM Binbin Zhou <zhoubinbin@loongson.cn> wrote:
> >
> > Add DT support for EIOINTC irqchip, which is needed for the Loongson-2K
> > series, e.g. Loongson-2K500 soc.
> Use SOC instead of soc.
>
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  drivers/irqchip/irq-loongson-eiointc.c | 119 ++++++++++++++++++-------
> >  1 file changed, 85 insertions(+), 34 deletions(-)
> >
> > diff --git a/drivers/irqchip/irq-loongson-eiointc.c b/drivers/irqchip/irq-loongson-eiointc.c
> > index d15fd38c1756..d5e1ee6aada6 100644
> > --- a/drivers/irqchip/irq-loongson-eiointc.c
> > +++ b/drivers/irqchip/irq-loongson-eiointc.c
> > @@ -39,6 +39,7 @@ static int nr_pics;
> >
> >  struct eiointc_priv {
> >         u32                     node;
> > +       u32                     vec_count;
> >         nodemask_t              node_map;
> >         cpumask_t               cpuspan_map;
> >         struct fwnode_handle    *domain_handle;
> > @@ -156,18 +157,19 @@ static int eiointc_router_init(unsigned int cpu)
> >         if ((cpu_logical_map(cpu) % CORES_PER_EIO_NODE) == 0) {
> >                 eiointc_enable();
> >
> > -               for (i = 0; i < VEC_COUNT / 32; i++) {
> > +               for (i = 0; i < eiointc_priv[0]->vec_count / 32; i++) {
> > +                       pr_info("");
> Why print an empty string?
>
Sorry, I forgot to remove the debug message.
I will fix it.

Thanks.
Binbin

> Others look good to me.
>
> Huacai
> >                         data = (((1 << (i * 2 + 1)) << 16) | (1 << (i * 2)));
> >                         iocsr_write32(data, EIOINTC_REG_NODEMAP + i * 4);
> >                 }
> >
> > -               for (i = 0; i < VEC_COUNT / 32 / 4; i++) {
> > +               for (i = 0; i < eiointc_priv[0]->vec_count / 32 / 4; i++) {
> >                         bit = BIT(1 + index); /* Route to IP[1 + index] */
> >                         data = bit | (bit << 8) | (bit << 16) | (bit << 24);
> >                         iocsr_write32(data, EIOINTC_REG_IPMAP + i * 4);
> >                 }
> >
> > -               for (i = 0; i < VEC_COUNT / 4; i++) {
> > +               for (i = 0; i < eiointc_priv[0]->vec_count / 4; i++) {
> >                         /* Route to Node-0 Core-0 */
> >                         if (index == 0)
> >                                 bit = BIT(cpu_logical_map(0));
> > @@ -178,7 +180,7 @@ static int eiointc_router_init(unsigned int cpu)
> >                         iocsr_write32(data, EIOINTC_REG_ROUTE + i * 4);
> >                 }
> >
> > -               for (i = 0; i < VEC_COUNT / 32; i++) {
> > +               for (i = 0; i < eiointc_priv[0]->vec_count / 32; i++) {
> >                         data = 0xffffffff;
> >                         iocsr_write32(data, EIOINTC_REG_ENABLE + i * 4);
> >                         iocsr_write32(data, EIOINTC_REG_BOUNCE + i * 4);
> > @@ -198,7 +200,7 @@ static void eiointc_irq_dispatch(struct irq_desc *desc)
> >
> >         chained_irq_enter(chip, desc);
> >
> > -       for (i = 0; i < VEC_REG_COUNT; i++) {
> > +       for (i = 0; i < eiointc_priv[0]->vec_count / VEC_COUNT_PER_REG; i++) {
> >                 pending = iocsr_read64(EIOINTC_REG_ISR + (i << 3));
> >                 iocsr_write64(pending, EIOINTC_REG_ISR + (i << 3));
> >                 while (pending) {
> > @@ -316,7 +318,7 @@ static void eiointc_resume(void)
> >         eiointc_router_init(0);
> >
> >         for (i = 0; i < nr_pics; i++) {
> > -               for (j = 0; j < VEC_COUNT; j++) {
> > +               for (j = 0; j < eiointc_priv[i]->vec_count; j++) {
> >                         desc = irq_resolve_mapping(eiointc_priv[i]->eiointc_domain, j);
> >                         if (desc && desc->handle_irq && desc->handle_irq != handle_bad_irq) {
> >                                 raw_spin_lock(&desc->lock);
> > @@ -373,11 +375,44 @@ static int __init acpi_cascade_irqdomain_init(void)
> >         return 0;
> >  }
> >
> > +static int __init eiointc_init(struct eiointc_priv *priv, int parent_irq,
> > +                              u64 node_map)
> > +{
> > +       int i;
> > +
> > +       node_map = node_map ? node_map : -1ULL;
> > +       for_each_possible_cpu(i) {
> > +               if (node_map & (1ULL << (cpu_to_eio_node(i)))) {
> > +                       node_set(cpu_to_eio_node(i), priv->node_map);
> > +                       cpumask_or(&priv->cpuspan_map, &priv->cpuspan_map,
> > +                                  cpumask_of(i));
> > +               }
> > +       }
> > +
> > +       priv->eiointc_domain = irq_domain_create_linear(priv->domain_handle,
> > +                                                       priv->vec_count,
> > +                                                       &eiointc_domain_ops,
> > +                                                       priv);
> > +       if (!priv->eiointc_domain) {
> > +               pr_err("loongson-extioi: cannot add IRQ domain\n");
> > +               return -ENOMEM;
> > +       }
> > +
> > +       eiointc_priv[nr_pics++] = priv;
> > +       eiointc_router_init(0);
> > +       irq_set_chained_handler_and_data(parent_irq, eiointc_irq_dispatch, priv);
> > +       register_syscore_ops(&eiointc_syscore_ops);
> > +       cpuhp_setup_state_nocalls(CPUHP_AP_IRQ_LOONGARCH_STARTING,
> > +                                 "irqchip/loongarch/intc:starting",
> > +                                 eiointc_router_init, NULL);
> > +
> > +       return 0;
> > +}
> > +
> >  int __init eiointc_acpi_init(struct irq_domain *parent,
> >                                      struct acpi_madt_eio_pic *acpi_eiointc)
> >  {
> > -       int i, ret, parent_irq;
> > -       unsigned long node_map;
> > +       int parent_irq, ret;
> >         struct eiointc_priv *priv;
> >
> >         priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> > @@ -391,39 +426,20 @@ int __init eiointc_acpi_init(struct irq_domain *parent,
> >                 goto out_free_priv;
> >         }
> >
> > +       priv->vec_count = VEC_COUNT;
> >         priv->node = acpi_eiointc->node;
> > -       node_map = acpi_eiointc->node_map ? : -1ULL;
> > -
> > -       for_each_possible_cpu(i) {
> > -               if (node_map & (1ULL << cpu_to_eio_node(i))) {
> > -                       node_set(cpu_to_eio_node(i), priv->node_map);
> > -                       cpumask_or(&priv->cpuspan_map, &priv->cpuspan_map, cpumask_of(i));
> > -               }
> > -       }
> > -
> > -       /* Setup IRQ domain */
> > -       priv->eiointc_domain = irq_domain_create_linear(priv->domain_handle, VEC_COUNT,
> > -                                       &eiointc_domain_ops, priv);
> > -       if (!priv->eiointc_domain) {
> > -               pr_err("loongson-eiointc: cannot add IRQ domain\n");
> > -               goto out_free_handle;
> > -       }
> > -
> > -       eiointc_priv[nr_pics++] = priv;
> > -
> > -       eiointc_router_init(0);
> > -
> >         parent_irq = irq_create_mapping(parent, acpi_eiointc->cascade);
> > -       irq_set_chained_handler_and_data(parent_irq, eiointc_irq_dispatch, priv);
> >
> > -       register_syscore_ops(&eiointc_syscore_ops);
> > -       cpuhp_setup_state_nocalls(CPUHP_AP_IRQ_LOONGARCH_STARTING,
> > -                                 "irqchip/loongarch/intc:starting",
> > -                                 eiointc_router_init, NULL);
> > +       ret = eiointc_init(priv, parent_irq, acpi_eiointc->node_map);
> > +       if (ret < 0)
> > +               goto out_free_handle;
> >
> >         acpi_set_vec_parent(acpi_eiointc->node, priv->eiointc_domain, pch_group);
> >         acpi_set_vec_parent(acpi_eiointc->node, priv->eiointc_domain, msi_group);
> > +
> >         ret = acpi_cascade_irqdomain_init();
> > +       if (ret < 0)
> > +               goto out_free_handle;
> >
> >         return ret;
> >
> > @@ -435,3 +451,39 @@ int __init eiointc_acpi_init(struct irq_domain *parent,
> >
> >         return -ENOMEM;
> >  }
> > +
> > +static int __init eiointc_of_init(struct device_node *of_node,
> > +                                 struct device_node *parent)
> > +{
> > +       int parent_irq, ret;
> > +       struct eiointc_priv *priv;
> > +
> > +       priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> > +       if (!priv)
> > +               return -ENOMEM;
> > +
> > +       parent_irq = of_irq_get_byname(of_node, "cascade");
> > +       if (parent_irq <= 0) {
> > +               ret = -ENODEV;
> > +               goto out_free_priv;
> > +       }
> > +
> > +       ret = of_property_read_u32(of_node, "vec_count", &priv->vec_count);
> > +       if (ret < 0)
> > +               goto out_free_priv;
> > +
> > +       priv->node = 0;
> > +       priv->domain_handle = of_node_to_fwnode(of_node);
> > +
> > +       ret = eiointc_init(priv, parent_irq, 0);
> > +       if (ret < 0)
> > +               goto out_free_priv;
> > +
> > +       return 0;
> > +
> > +out_free_priv:
> > +       kfree(priv);
> > +       return ret;
> > +}
> > +
> > +IRQCHIP_DECLARE(loongson_eiointc, "loongson,eiointc", eiointc_of_init);
> > --
> > 2.39.0
> >
> >
>
