Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF659238166;
	Fri, 30 Jan 2026 08:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769763264; cv=none; b=K3oHOHw3wI0/ucA0OIiSIA5Ee7gzVcaTdaiyqWAz4ahAiiWseez5IFrq5YPYEyzslHPHMUSTfiOMRDuEQAwYVa2kwu84/G7DJ7lLuJ8bzSfXGLkgzygeSpCrAq2aO9d1k+oM3vEFNOf/4cW+RgusPOp85NTjNwa6ilXyEbca4yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769763264; c=relaxed/simple;
	bh=PIzrMghgpnc4Or3bE8tdCYfrgRNiPgPhv0qk0QRKp1s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CDbCkvlXNgGwQxdPnlB1lqpx1oE9WPHZJ6WFlhUwjm+T+7qrHbZ9144YVoKMuM98pUgdggWk9ksavUb2mJ0cEejVEROIm4YCE+ykTU1O63SRaUowOE69hjpxrRJATlNyaRCL7ncCT8gANEKludQuHrnTLqsbeySh3BIWyWtcPoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iZ+cavdG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iZ+cavdG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD99EC4CEF7;
	Fri, 30 Jan 2026 08:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769763264;
	bh=PIzrMghgpnc4Or3bE8tdCYfrgRNiPgPhv0qk0QRKp1s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=iZ+cavdG8u5yBN3BypBpx8sSsf5azFs0q8DBy/W5bffwIrWD6V/bKu8VBFAV5xaTt
	 ZVA3mVpcZDWrWn4YXBhO3LUxmSRHdUV2FaXtSuNVrbq3jk0tLvEsSKH3XJ8zgRVTUw
	 rwD3JgLJYolgqkhAvdur18tBm8r9jWAu0AKukgY+R4FN62v7WiUC5ZAPUUUJMFMUDv
	 SDbXQ3uuTapPHMmMustM0vo5Gj+rmquXt8/pg1sV0tAVoa7uEBeTY2xnYrBRt4SbqI
	 f/4AKc60uyaX71KkbKxR+34Z4KDEVcafQamy7Tw/uZqCWPU1Y1tccBjQ+2Xr8bKTPN
	 ZOFQ6TjTxZDrA==
From: Thomas Gleixner <tglx@kernel.org>
To: Tianyang Zhang <zhangtianyang@loongson.cn>, chenhuacai@kernel.org,
 kernel@xen0n.name, corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev,
 jiaxun.yang@flygoat.com, maobibo@loongson.cn
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tianyang Zhang <zhangtianyang@loongson.cn>,
 Liupu Wang <wangliupu@loongson.cn>
Subject: Re: [PATCH v9 4/4] irqchip/irq-loongarch-ir:Add Redirect irqchip
 support
In-Reply-To: <20260130025941.2140582-5-zhangtianyang@loongson.cn>
References: <20260130025941.2140582-1-zhangtianyang@loongson.cn>
 <20260130025941.2140582-5-zhangtianyang@loongson.cn>
Date: Fri, 30 Jan 2026 09:54:20 +0100
Message-ID: <87zf5vlbur.ffs@tglx>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Jan 30 2026 at 10:59, Tianyang Zhang wrote:
> +// SPDX-License-Identifier: GPL-2.0

GPL-2.0-only please

> +/*
> + * Copyright (C) 2020 Loongson Technologies, Inc.

This was written 6 years ago already?

> + */
> +
> +#include <linux/cpuhotplug.h>
> +#include <linux/init.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/irq.h>
> +#include <linux/irqchip.h>
> +#include <linux/irqchip/irq-msi-lib.h>
> +#include <linux/irqdomain.h>
> +#include <linux/spinlock.h>
> +#include <linux/msi.h>

Includes should be alphabetically ordered.

> +#define REDIRECT_REG(reg, node) \
> +	((void __iomem *)(IO_BASE | redirect_reg_base | (u64)(node) << NODE_ADDRSPACE_SHIFT | (reg)))
> +
> +static inline void redirect_write_reg64(u32 node, u64 val, u32 reg)
> +{
> +	void __iomem *reg_addr = REDIRECT_REG(reg, node);
> +
> +	return writeq(val, reg_addr);

Bogus return and you can simplify this to

      writeq(val, REDIRECT_REG(reg, node));

No?

> +}
> +
> +static inline void redirect_write_reg32(u32 node, u32 val, u32 reg)
> +{
> +	void __iomem *reg_addr = REDIRECT_REG(reg, node);
> +
> +	return writel(val, reg_addr);

Ditto

> +}
> +
> +static inline u32 redirect_read_reg32(u32 node, u32 reg)
> +{
> +	void __iomem *reg_addr = REDIRECT_REG(reg, node);
> +
> +	return readl(reg_addr);

Condense to single line as well

> +static void irde_invalid_entry(struct redirect_item *item)

This should be named irde_invalidate_entry() as that's what the function
is about. irq_invalid_entry() reads more like a function which check for
an invalid entry.

> +{
> +	struct irde_inv_cmd cmd;
> +	u64 raddr = 0;
> +
> +	cmd.cmd_info = 0;
> +	cmd.index.type = INVALID_INDEX;
> +	cmd.index.need_notice = 1;
> +	cmd.index.index = item->index;
> +	cmd.notice_addr = (u64)(__pa(&raddr));
> +
> +	invalid_enqueue(item, &cmd);
> +
> +	/*
> +	 * CPU needs to wait here for cmd to complete, and it determines this

The CPU 

> +	 * by checking whether invalid queue has already written a valid value

whether the invalidation queue

> +	 * to cmd.notice_addr.
> +	 */

> +static int redirect_table_alloc(int node, u32 nr_irqs)
> +{
> +	struct redirect_table *ird_table = &irde_descs[node].ird_table;
> +	unsigned int index, order;
> +
> +	if (nr_irqs > 1) {
> +		nr_irqs = __roundup_pow_of_two(nr_irqs);
> +		order = ilog2(nr_irqs);
> +	}
> +
> +	guard(raw_spinlock_irqsave)(&ird_table->lock);
> +
> +	index = bitmap_find_free_region(ird_table->bitmap,
> +					IRD_ENTRIES, order);

Get rid of this pointless line break. You have 100 characters and the
above even fits into 80 

> +	if (index < 0) {
> +		pr_err("No redirect entry to use\n");
> +		return -ENOMEM;
> +	}

> +static int redirect_domain_alloc(struct irq_domain *domain, unsigned int virq,
> +				 unsigned int nr_irqs, void *arg)
> +{
> +	msi_alloc_info_t *info = arg;
> +	int ret, i, node, index;
> +
> +	node = dev_to_node(info->desc->dev);
> +
> +	ret = irq_domain_alloc_irqs_parent(domain, virq, nr_irqs, arg);
> +	if (ret < 0)
> +		return ret;
> +
> +	index = redirect_table_alloc(node, nr_irqs);
> +	if (index < 0) {
> +		pr_err("Alloc redirect table entry failed\n");
> +		return -ENOMEM;
> +	}
> +
> +	for (i = 0; i < nr_irqs; i++) {
> +		struct irq_data *irq_data = irq_domain_get_irq_data(domain, virq + i);
> +		struct redirect_item *item;
> +
> +		item = kzalloc(sizeof(*item), GFP_KERNEL);
> +		if (!item) {
> +			pr_err("Alloc redirect descriptor failed\n");
> +			goto out_free_resources;
> +		}
> +		item->irde = &irde_descs[node];
> +
> +		/*
> +		 * Only bits 47:6 of the GPID are passed to the controller,
> +		 * 64-byte alignment must be guarantee and make kzalloc can
> +		 * align to the respective size.

-ENOPARSE

> +		 */

> +static const struct irq_domain_ops redirect_domain_ops = {
> +	.alloc		= redirect_domain_alloc,
> +	.free		= redirect_domain_free,
> +	.select		= msi_lib_irq_domain_select,
> +};

> +static void __redirect_irde_fini(struct irde_desc *irde)

This schoolbook _fini() naming is just lame and nondescriptive. Please
use descriptive function names which make it clear what this is about,
e.g. redirect_free_irde() or something like that.

Also this should be __init, no?

> +{
> +	struct redirect_table *ird_table = &irde_descs->ird_table;
> +	struct redirect_queue *inv_queue = &irde_descs->inv_queue;

> +static inline void redirect_irde_fini(int node)
> +{
> +	__redirect_irde_fini(&irde_descs[node]);

This indirection is really pointless. Just move the '&irde_descs[node]' to
the only caller.

> +int __init redirect_acpi_init(struct irq_domain *parent)
> +{
> +	struct fwnode_handle *fwnode;
> +	int ret = -EINVAL, node;
> +
> +	fwnode = irq_domain_alloc_named_fwnode("redirect");
> +	if (!fwnode) {
> +		pr_err("Unable to alloc redirect domain handle\n");
> +		goto fail;
> +	}
> +
> +	redirect_domain = irq_domain_create_hierarchy(parent, 0, IRD_ENTRIES, fwnode,
> +						      &redirect_domain_ops, irde_descs);
> +	if (!redirect_domain) {
> +		pr_err("Unable to alloc redirect domain\n");
> +		goto out_free_fwnode;
> +	}
> +
> +

stray newline

> +	for_each_node_mask(node, node_possible_map) {
> +		ret = redirect_irde_init(node);
> +		if (ret)
> +			goto out_clear_irde;
> +	}
> +
> +	ret = acpi_cascade_irqdomain_init();
> +	if (ret < 0) {
> +		pr_err("Failed to cascade IRQ domain, ret=%d\n", ret);
> +		goto out_clear_irde;
> +	}
> +
> +	pr_info("loongarch irq redirect modules init succeeded\n");

You really want to have:

#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt

at the top of the file, so that all printk()s in this file are properly
prefixed.

Thanks,

        tglx
