Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FBFD15853B
	for <loongarch@lists.linux.dev>; Mon,  2 Feb 2026 01:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769994157; cv=none; b=GK6Kenq0RxlhasqLMrue2YnasbreN5ekXeesA+Ok9QbwWUbEHxQIvIjHJjKDfqzTgsWeEb4N5V3S2HUDl7HmcZScHM23u2BrFwy0/+N7mIaIEes2fswfHoBNZwHMuIs6jAk7mpFr0cmBQ4Wj5DbmkRB5oh8Ib5VJSdmXkHTj8oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769994157; c=relaxed/simple;
	bh=Taq3aQvAkG7RXdPkBdMx05dT1kxY4R6YCuxa0d8RgP0=;
	h=From:Subject:To:Cc:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=eSyyipSmys3LbXcRISlXGrkxlVNMH9sU0yvgkn0aopC9I3a82AIXX25DzMASJdUTFtgNz/5BGyMwXkEnTujnJhb8b5H/M8jtXME5nlgFVzgGMVawhPFxi7sl2YFhmulL94Ss4hHkZoQjJ7RZ3fAymmh+ddvP9pWqEdIMd43yQtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.24])
	by gateway (Coremail) with SMTP id _____8CxKMKf939p0M4OAA--.48496S3;
	Mon, 02 Feb 2026 09:02:23 +0800 (CST)
Received: from [10.20.42.24] (unknown [10.20.42.24])
	by front1 (Coremail) with SMTP id qMiowJDxzsKc939pAqs9AA--.49068S3;
	Mon, 02 Feb 2026 09:02:22 +0800 (CST)
From: Tianyang Zhang <zhangtianyang@loongson.cn>
Subject: Re: [PATCH v9 4/4] irqchip/irq-loongarch-ir:Add Redirect irqchip
 support
To: zhangtianyang@loongson.cn
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260130025941.2140582-1-zhangtianyang@loongson.cn>
 <20260130025941.2140582-5-zhangtianyang@loongson.cn> <87zf5vlbur.ffs@tglx>
Message-ID: <f4ca291a-97bc-62b0-31b6-58549d5cea7b@loongson.cn>
Date: Mon, 2 Feb 2026 09:00:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <87zf5vlbur.ffs@tglx>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxzsKc939pAqs9AA--.49068S3
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW3Ar17Cr1rWFy8Zw1xGw4xXwc_yoW7KF47pF
	W8Kan7tF4fJr4UCrn29F4UZF9IqryFgr42v3yY9F17Awn0vrn7KF4rWrya9Fn5CrW5AF4j
	vF4UX3s7uF1DJagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8czVUUU
	UUU==

Hi, Thomas

在 2026/1/30 下午4:54, Thomas Gleixner 写道:
> On Fri, Jan 30 2026 at 10:59, Tianyang Zhang wrote:
>> +// SPDX-License-Identifier: GPL-2.0
> GPL-2.0-only please
Ok, I got it
>
>> +/*
>> + * Copyright (C) 2020 Loongson Technologies, Inc.
> This was written 6 years ago already?
This was copied from other files, and I will rework it, thanks
>
>> + */
>> +
>> +#include <linux/cpuhotplug.h>
>> +#include <linux/init.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/kernel.h>
>> +#include <linux/irq.h>
>> +#include <linux/irqchip.h>
>> +#include <linux/irqchip/irq-msi-lib.h>
>> +#include <linux/irqdomain.h>
>> +#include <linux/spinlock.h>
>> +#include <linux/msi.h>
> Includes should be alphabetically ordered.
Ok, I got it
>
>> +#define REDIRECT_REG(reg, node) \
>> +	((void __iomem *)(IO_BASE | redirect_reg_base | (u64)(node) << NODE_ADDRSPACE_SHIFT | (reg)))
>> +
>> +static inline void redirect_write_reg64(u32 node, u64 val, u32 reg)
>> +{
>> +	void __iomem *reg_addr = REDIRECT_REG(reg, node);
>> +
>> +	return writeq(val, reg_addr);
> Bogus return and you can simplify this to
>
>        writeq(val, REDIRECT_REG(reg, node));
>
> No?
Ok, this is more reasonable.
>
>> +}
>> +
>> +static inline u32 redirect_read_reg32(u32 node, u32 reg)
>> +{
>> +	void __iomem *reg_addr = REDIRECT_REG(reg, node);
>> +
>> +	return readl(reg_addr);
> Condense to single line as well
Ok, I got it
>
>> +static void irde_invalid_entry(struct redirect_item *item)
> This should be named irde_invalidate_entry() as that's what the function
> is about. irq_invalid_entry() reads more like a function which check for
> an invalid entry.
Ok, I got it
>
>> +{
>> +	struct irde_inv_cmd cmd;
>> +	u64 raddr = 0;
>> +
>> +	cmd.cmd_info = 0;
>> +	cmd.index.type = INVALID_INDEX;
>> +	cmd.index.need_notice = 1;
>> +	cmd.index.index = item->index;
>> +	cmd.notice_addr = (u64)(__pa(&raddr));
>> +
>> +	invalid_enqueue(item, &cmd);
>> +
>> +	/*
>> +	 * CPU needs to wait here for cmd to complete, and it determines this
> The CPU
Ok, I got it, thanks
>
>> +	 * by checking whether invalid queue has already written a valid value
> whether the invalidation queue
Ok, I got it, thanks
>
>> +static int redirect_table_alloc(int node, u32 nr_irqs)
>> +{
>> +	struct redirect_table *ird_table = &irde_descs[node].ird_table;
>> +	unsigned int index, order;
>> +
>> +	if (nr_irqs > 1) {
>> +		nr_irqs = __roundup_pow_of_two(nr_irqs);
>> +		order = ilog2(nr_irqs);
>> +	}
>> +
>> +	guard(raw_spinlock_irqsave)(&ird_table->lock);
>> +
>> +	index = bitmap_find_free_region(ird_table->bitmap,
>> +					IRD_ENTRIES, order);
> Get rid of this pointless line break. You have 100 characters and the
> above even fits into 80
Ok, I got it
>
>> +	if (index < 0) {
>> +		pr_err("No redirect entry to use\n");
>> +		return -ENOMEM;
>> +	}
>> +static int redirect_domain_alloc(struct irq_domain *domain, unsigned int virq,
>> +				 unsigned int nr_irqs, void *arg)
>> +{
>> +	msi_alloc_info_t *info = arg;
>> +	int ret, i, node, index;
>> +
>> +	node = dev_to_node(info->desc->dev);
>> +
>> +	ret = irq_domain_alloc_irqs_parent(domain, virq, nr_irqs, arg);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	index = redirect_table_alloc(node, nr_irqs);
>> +	if (index < 0) {
>> +		pr_err("Alloc redirect table entry failed\n");
>> +		return -ENOMEM;
>> +	}
>> +
>> +	for (i = 0; i < nr_irqs; i++) {
>> +		struct irq_data *irq_data = irq_domain_get_irq_data(domain, virq + i);
>> +		struct redirect_item *item;
>> +
>> +		item = kzalloc(sizeof(*item), GFP_KERNEL);
>> +		if (!item) {
>> +			pr_err("Alloc redirect descriptor failed\n");
>> +			goto out_free_resources;
>> +		}
>> +		item->irde = &irde_descs[node];
>> +
>> +		/*
>> +		 * Only bits 47:6 of the GPID are passed to the controller,
>> +		 * 64-byte alignment must be guarantee and make kzalloc can
>> +		 * align to the respective size.
> -ENOPARSE
Ok ,I got it
>> +		 */
>> +static const struct irq_domain_ops redirect_domain_ops = {
>> +	.alloc		= redirect_domain_alloc,
>> +	.free		= redirect_domain_free,
>> +	.select		= msi_lib_irq_domain_select,
>> +};
>> +static void __redirect_irde_fini(struct irde_desc *irde)
> This schoolbook _fini() naming is just lame and nondescriptive. Please
> use descriptive function names which make it clear what this is about,
> e.g. redirect_free_irde() or something like that.
>
> Also this should be __init, no?
Yes , This code style is indeed not very appropriate, I will adjust the 
function name
>
>> +{
>> +	struct redirect_table *ird_table = &irde_descs->ird_table;
>> +	struct redirect_queue *inv_queue = &irde_descs->inv_queue;
>> +static inline void redirect_irde_fini(int node)
>> +{
>> +	__redirect_irde_fini(&irde_descs[node]);
> This indirection is really pointless. Just move the '&irde_descs[node]' to
> the only caller.
Ok, I got it
>
>> +int __init redirect_acpi_init(struct irq_domain *parent)
>> +{
>> +	struct fwnode_handle *fwnode;
>> +	int ret = -EINVAL, node;
>> +
>> +	fwnode = irq_domain_alloc_named_fwnode("redirect");
>> +	if (!fwnode) {
>> +		pr_err("Unable to alloc redirect domain handle\n");
>> +		goto fail;
>> +	}
>> +
>> +	redirect_domain = irq_domain_create_hierarchy(parent, 0, IRD_ENTRIES, fwnode,
>> +						      &redirect_domain_ops, irde_descs);
>> +	if (!redirect_domain) {
>> +		pr_err("Unable to alloc redirect domain\n");
>> +		goto out_free_fwnode;
>> +	}
>> +
>> +
> stray newline
Ok, I got it
>
>> +	for_each_node_mask(node, node_possible_map) {
>> +		ret = redirect_irde_init(node);
>> +		if (ret)
>> +			goto out_clear_irde;
>> +	}
>> +
>> +	ret = acpi_cascade_irqdomain_init();
>> +	if (ret < 0) {
>> +		pr_err("Failed to cascade IRQ domain, ret=%d\n", ret);
>> +		goto out_clear_irde;
>> +	}
>> +
>> +	pr_info("loongarch irq redirect modules init succeeded\n");
> You really want to have:
>
> #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>
> at the top of the file, so that all printk()s in this file are properly
> prefixed.
Ok, I got it, thanks
>
> Thanks,
>
>          tglx

Tiyang

