Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88851307AE7
	for <loongarch@lists.linux.dev>; Mon, 17 Nov 2025 03:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763349486; cv=none; b=WNMshjQKcit8G31nUpmA+oRfRx+fTwIVKOVzIYTaWRl2/zf4W9ysEgMXTWZAsgDCpc4YbnEKT3EgjLqD6MbF/zuwFdioEtEdTtDriVVVQJcZU444xzH+SX+HWpaweiViI5Mx34DYwIuQHnzIng3bm/RG3/SCmT2d66X5yOFFVyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763349486; c=relaxed/simple;
	bh=0+SMdzYvmlmg3xY3GMkHutTbXLu4ixCy7bGekq2fOlA=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=VzITn2SA3U8VUr0syywhFVO5+YyVtD9beogUbm758E/ip8bNf+7LleI4gzNbbcu+zOhbtABrX0LAQWY8J9MlxJBFEerLKJOZeiV3ytdSfIndb/hP6uJ0vPV6PkesXwANwkb3QvVyu+gwYJFJpVuStnEPP48MydM1VzetOfxcyio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.24])
	by gateway (Coremail) with SMTP id _____8Bx39PfkxppsEIkAA--.7737S3;
	Mon, 17 Nov 2025 11:17:51 +0800 (CST)
Received: from [10.20.42.24] (unknown [10.20.42.24])
	by front1 (Coremail) with SMTP id qMiowJCxdOTVkxppN541AQ--.20678S3;
	Mon, 17 Nov 2025 11:17:45 +0800 (CST)
Subject: Re: [PATCH v6 2/2] irqchip/irq-loongarch-ir:Add Redirect irqchip
 support
To: Thomas Gleixner <tglx@linutronix.de>, chenhuacai@kernel.org,
 kernel@xen0n.name, akpm@linux-foundation.org, willy@infradead.org,
 david@redhat.com, linmag7@gmail.com, thuth@redhat.com, maobibo@loongson.cn,
 apopple@nvidia.com
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 Liupu Wang <wangliupu@loongson.cn>
References: <20251113034923.9699-1-zhangtianyang@loongson.cn>
 <20251113034923.9699-3-zhangtianyang@loongson.cn> <87ecq2cafq.ffs@tglx>
From: Tianyang Zhang <zhangtianyang@loongson.cn>
Message-ID: <2da824f7-f2bb-3cf8-7012-963f034837f3@loongson.cn>
Date: Mon, 17 Nov 2025 11:15:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <87ecq2cafq.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowJCxdOTVkxppN541AQ--.20678S3
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9fXoW3uF47uw4ruFy7ZrWUGFWUZFc_yoW8JFy5Xo
	WfGr4fJw4fWr18GrWjk3yxtFy3Z345Cw4kAayrWrsrAF1jqFWUC3y7G3y5Zay7WF18WF4D
	Ja4xJ3s8JFWjqFnxl-sFpf9Il3svdjkaLaAFLSUrUUUU8b8apTn2vfkv8UJUUUU8wcxFpf
	9Il3svdxBIdaVrn0xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3
	UjIYCTnIWjp_UUUYX7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI
	8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xG
	Y2AK021l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14
	v26r1j6r4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	AVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j5xhLUUUUU=

Hi, Thomas

在 2025/11/13 下午9:46, Thomas Gleixner 写道:
> On Thu, Nov 13 2025 at 11:49, Tianyang Zhang wrote:
>>   arch/loongarch/include/asm/cpu-features.h |   1 +
>>   arch/loongarch/include/asm/cpu.h          |   2 +
>>   arch/loongarch/include/asm/loongarch.h    |   6 +
>>   arch/loongarch/kernel/cpu-probe.c         |   2 +
> Can you please split the architecture parts out into a separate patch?
Ok, I will split the patch
>
>>   drivers/irqchip/Makefile                  |   2 +-
>>   drivers/irqchip/irq-loongarch-avec.c      |  20 +-
>>   drivers/irqchip/irq-loongarch-ir.c        | 527 ++++++++++++++++++++++
>>   drivers/irqchip/irq-loongson.h            |  19 +
>>   8 files changed, 565 insertions(+), 14 deletions(-)
>>   create mode 100644 drivers/irqchip/irq-loongarch-ir.c
>> diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
>> index 93e3ced023bb..a0be18891890 100644
>> --- a/drivers/irqchip/Makefile
>> +++ b/drivers/irqchip/Makefile
>> @@ -118,7 +118,7 @@ obj-$(CONFIG_LS1X_IRQ)			+= irq-ls1x.o
>>   obj-$(CONFIG_TI_SCI_INTR_IRQCHIP)	+= irq-ti-sci-intr.o
>>   obj-$(CONFIG_TI_SCI_INTA_IRQCHIP)	+= irq-ti-sci-inta.o
>>   obj-$(CONFIG_TI_PRUSS_INTC)		+= irq-pruss-intc.o
>> -obj-$(CONFIG_IRQ_LOONGARCH_CPU)		+= irq-loongarch-cpu.o irq-loongarch-avec.o
>> +obj-$(CONFIG_IRQ_LOONGARCH_CPU)		+= irq-loongarch-cpu.o irq-loongarch-avec.o irq-loongarch-ir.o
>>   obj-$(CONFIG_LOONGSON_LIOINTC)		+= irq-loongson-liointc.o
>>   obj-$(CONFIG_LOONGSON_EIOINTC)		+= irq-loongson-eiointc.o
>>   obj-$(CONFIG_LOONGSON_HTPIC)		+= irq-loongson-htpic.o
>> diff --git a/drivers/irqchip/irq-loongarch-avec.c b/drivers/irqchip/irq-loongarch-avec.c
>> index bf52dc8345f5..de7b6059c1b6 100644
>> --- a/drivers/irqchip/irq-loongarch-avec.c
>> +++ b/drivers/irqchip/irq-loongarch-avec.c
>> @@ -24,7 +24,6 @@
>>   #define VECTORS_PER_REG		64
>>   #define IRR_VECTOR_MASK		0xffUL
>>   #define IRR_INVALID_MASK	0x80000000UL
>> -#define AVEC_MSG_OFFSET		0x100000
>>   
>>   #ifdef CONFIG_SMP
>>   struct pending_list {
>> @@ -47,15 +46,6 @@ struct avecintc_chip {
>>   
>>   static struct avecintc_chip loongarch_avec;
>>   
>> -struct avecintc_data {
>> -	struct list_head	entry;
>> -	unsigned int		cpu;
>> -	unsigned int		vec;
>> -	unsigned int		prev_cpu;
>> -	unsigned int		prev_vec;
>> -	unsigned int		moving;
>> -};
>> -
> ...
>> -static void avecintc_sync(struct avecintc_data *adata)
>> +void avecintc_sync(struct avecintc_data *adata)
> Moving the struct to the header and exposing this function should be a
> separate patch as well.
Ok, I got it
>
>
>>   {
>>   	struct pending_list *plist;
>>   
>> @@ -109,7 +99,7 @@ static int avecintc_set_affinity(struct irq_data *data, const struct cpumask *de
>>   			return -EBUSY;
>>   
>>   		if (cpu_online(adata->cpu) && cpumask_test_cpu(adata->cpu, dest))
>> -			return 0;
>> +			return IRQ_SET_MASK_OK_DONE;
> Changing that return value wants to be a separate patch with an
> explanation why this is done and why it's functionaly equivalent.
Ok, I got it
>
>> +#define IRD_ENTRY_SIZE			16
> Shouldn't that be sizeof(struct redirect_entry) or if you want to keep
> it this way then you want a compile time assert that ensures that
> sizeof(struct redirect_entry) == IRD_ENTRY_SIZE.
Ok, I got it
>> +#define REDIRECT_REG(reg, node) \
>> +	((void __iomem *)(IO_BASE | redirect_reg_base | (u64)(node) << NODE_ADDRSPACE_SHIFT | (reg)))
>> +
> This only works when @node is guaranteed to be a real node number and
> not NUMA_NO_NODE.
Indeed, the node's value is sourced from irde->node in the following 
process.

static void redirect_irde_cfg(struct irde_desc *irde)
{
         redirect_write_reg64(irde->node, CFG_DISABLE_IDLE, 
LOONGARCH_IOCSR_REDIRECT_CFG);
         redirect_write_reg64(irde->node, __pa(irde->ird_table.table), 
LOONGARCH_IOCSR_REDIRECT_TBR);
         redirect_write_reg32(irde->node, 0, LOONGARCH_IOCSR_REDIRECT_CQH);
         redirect_write_reg32(irde->node, 0, LOONGARCH_IOCSR_REDIRECT_CQT);
         redirect_write_reg64(irde->node, ((u64)irde->inv_queue.cmd_base 
& CQB_ADDR_MASK) |
                              CQB_SIZE_MASK, LOONGARCH_IOCSR_REDIRECT_CQB);
}
Once the irde->node is initialized, it remains unchanged permanently, 
which should ensure its correctness.

int __init redirect_acpi_init(struct irq_domain *parent)

{
...
         for_each_node_mask(node, node_possible_map)
                 ret = redirect_irde_init(node);

}

>
>> +static inline void redirect_write_reg64(u32 node, u64 val, u32 reg)
>> +{
>> +	void __iomem *reg_addr = REDIRECT_REG(reg, node);
>> +
>> +	return writeq(val, reg_addr);
>> +}
>> +
>> +static inline void redirect_write_reg32(int node, u32 val, u32 reg)
> Can you make your mind up and use a consistent data type for @node?
Ok, I got it
>
>> +static void irde_invalid_entry_node(struct redirect_item *item)
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
>> +	while (!raddr)
> Please add a comment what this @raddr magic does.
Ok, I will do that
>
>> +		cpu_relax();
>> +
>> +}
>> +
>> +static inline struct avecintc_data *irq_data_get_avec_data(struct irq_data *data)
>> +{
>> +	return data->parent_data->chip_data;
>> +}
>> +
>> +static int redirect_table_alloc(struct redirect_item *item)
>> +{
>> +	struct redirect_table *ird_table = &item->irde->ird_table;
>> +	int index;
>> +
>> +	guard(raw_spinlock_irqsave)(&ird_table->lock);
>> +
>> +	index = find_first_zero_bit(ird_table->bitmap, IRD_ENTRIES);
>> +	if (index > IRD_ENTRIES) {
> Off by one. Valid index is 0 ... (IRD_ENTRIES - 1)
Ok , I got it ,  it is an illegal critical condition. Thank you.
>
>> +static void redirect_table_free(struct redirect_item *item)
>> +{
>> +	struct redirect_table *ird_table = &item->irde->ird_table;
>> +	struct redirect_entry *entry = item_get_entry(item);
>> +
>> +	memset(entry, 0, sizeof(*entry));
>> +
>> +	scoped_guard(raw_spinlock_irq, &ird_table->lock)
>> +		bitmap_release_region(ird_table->bitmap, item->index, 0);
> That's silly. bitmap_release_region(..., order = 0) is equivalent to
> clear_bit(...) no?

Am I correct in understanding that there is a semantic conflict between 
bitmap_release_region

and behavior order-0, making  bitmap_release_region unsuitable for use 
in this context? Or should

we simply pursue the most concise style?

>
>> +	kfree(item->gpid);
> Is it correct to free this _before_ invalidating the entry?

Currently, gpid only utilizes the following components, and all of them 
are handled correctly.

Therefore, the use of kfree should be appropriate.

static inline void redirect_domain_prepare_entry(struct redirect_item *item,
                                                  struct avecintc_data 
*adata)
{
....
         item->gpid->en = 1; //doorbell
         item->gpid->irqnum = adata->vec; //parent domain data
         item->gpid->dst = adata->cpu; // parent domain data
...
}


>
>> +	irde_invalid_entry_node(item);
>> +}
>> +
>> +static inline void redirect_domain_prepare_entry(struct redirect_item *item,
>> +						 struct avecintc_data *adata)
>> +{
>> +	struct redirect_entry *entry = item_get_entry(item);
>> +
>> +	item->gpid->en = 1;
>> +	item->gpid->irqnum = adata->vec;
>> +	item->gpid->dst = adata->cpu;
>> +
>> +	entry->lo.valid = 1;
>> +	entry->lo.gpid = ((u64)item->gpid & GPID_ADDR_MASK) >> GPID_ADDR_SHIFT;
>> +	entry->lo.vector = 0xff;
>> +}
>> +
>> +static int redirect_set_affinity(struct irq_data *data, const struct cpumask *dest, bool force)
>> +{
>> +	struct redirect_item *item = data->chip_data;
>> +	int ret;
>> +
>> +	ret = irq_chip_set_affinity_parent(data, dest, force);
>> +	if (ret == IRQ_SET_MASK_OK_DONE) {
>> +		return ret;
>> +	} else if (ret) {
>> +		pr_err("IRDE:set_affinity error %d\n", ret);
>> +		return ret;
>> +	} else {
>> +		struct avecintc_data *adata = irq_data_get_avec_data(data);
>> +
>> +		redirect_domain_prepare_entry(item, adata);
>> +		irde_invalid_entry_node(item);
> Can you name that function irde_invalidate_entry() please? That's
> actually telling what it does. irde_invalid_entry_node() is confusing at
> best.
OK, I got it
>> +		avecintc_sync(adata);
>> +	}
>> +
>> +	return IRQ_SET_MASK_OK;
>> +}
>> +static int redirect_domain_alloc(struct irq_domain *domain, unsigned int virq,
>> +				 unsigned int nr_irqs, void *arg)
>> +{
>> +	msi_alloc_info_t *info = arg;
>> +	int ret, i, node;
>> +
>> +	node = dev_to_node(info->desc->dev);
>> +
>> +	ret = irq_domain_alloc_irqs_parent(domain, virq, nr_irqs, arg);
>> +	if (ret < 0)
>> +		return ret;
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
>> +		ret = redirect_table_alloc(item);
>> +		if (ret) {
>> +			pr_err("Alloc redirect table entry failed\n");
>> +			goto out_free_resources;
>> +		}
>> +		/*
>> +		 * Only bits 47:6 of the GPID are passed to the controller,
>> +		 * 64-byte alignment must be guaranteed.
>> +		 */
>> +		BUILD_BUG_ON(sizeof(*item->gpid) != 64);
> s/BUILD_BUG_ON()/static_assert()/
>
> Also sizeof() does help to guarantee alignment. It only tells you the size.
Ok , I got it
>
>> +		item->gpid = kzalloc_node(sizeof(*item->gpid), GFP_KERNEL, node);
>> +		if (!item->gpid) {
>> +			pr_err("Alloc redirect GPID failed\n");
>> +			goto out_free_resources;
>> +		}
>> +
>> +		irq_data->chip_data = item;
>> +		irq_data->chip = &loongarch_redirect_chip;
>> +
>> +		redirect_domain_prepare_entry(item, irq_data_get_avec_data(irq_data));
>> +	}
>> +	return 0;
>> +
>> +out_free_resources:
>> +	redirect_free_resources(domain, virq, nr_irqs);
>> +	irq_domain_free_irqs_common(domain, virq, nr_irqs);
>> +
>> +	return -ENOMEM;
>> +}
>> +static int redirect_table_init(struct irde_desc *irde)
>> +{
>> +	struct redirect_table *ird_table = &irde->ird_table;
>> +	struct folio *folio;
>> +	unsigned long *bitmap;
>> +	int node = irde->node;
> https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#variable-declarations
Ok , I got it
>
>> +
>> +	folio = __folio_alloc_node(GFP_KERNEL | __GFP_ZERO, IRD_TABLE_PAGE_ORDER, node);
>> +	if (!folio) {
>> +		pr_err("Node [%d] redirect table alloc pages failed!\n", node);
>> +		goto fail;
> No point in making this a goto. Just return -ENOMEM.
Ok , I got it
>> +	ret = redirect_queue_init(irde);
>> +	if (ret)
>> +		goto fail_clear;
> Just get rid of the goto and handle the failure here.
Ok, I got it
>
>> +	redirect_irde_cfg(irde);
>> +
>> +	return 0;
>> +
>> +fail_clear:
>> +	__redirect_irde_fini(irde);
>> +fail:
>> +	return ret;
>> +}
>> +#ifdef CONFIG_ACPI
>> static int __init pch_msi_parse_madt(union acpi_subtable_headers *header, const unsigned long end)
> So if ACPI is disabled, the code in this file is dead code. Why do you
> build it at all if ACPI is off?
OK, I will consider adding the correct dependency relationships. Thanks
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
>> +	for_each_node_mask(node, node_possible_map) {
>> +		ret = redirect_irde_init(node);
>> +		if (ret)
>> +			goto out_clear_irde;
>> +	}
>> +
>> +	ret = acpi_cascade_irqdomain_init();
>> +	if (ret < 0)
>> +		pr_err("Failed to cascade IRQ domain, ret=%d\n", ret);
>> +
>> +	pr_info("loongarch irq redirect modules init succeeded\n");
> If acpi_cascade_irqdomain_init() fails, then this prints first an error
> and then claims that it succeeded and returns success. That doesn't make
> any sense.

Sorry,it is an obvious mistake.

Thank you for pointing it out—I will review and ensure the 
implementation is accurate.

> Thanks,
>
>          tglx

Thank you

Tianyang

