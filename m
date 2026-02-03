Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D901F583D
	for <loongarch@lists.linux.dev>; Tue,  3 Feb 2026 12:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770122762; cv=none; b=bqD44JnRYSzT96JYtkETISoUZuzQ7WeAl9SL0nCk6uLkOLLX5XVYj1mciBV0yAlIkNHOmJbd1u+ROD3NmJ30WCD/fHVeRfJj2SiUTfnoV7JqRGOs+9oIOisnwFmUzoT+aFnZIgnkr5wTSKY4wChYhX4f9Vf1yUPQ5u/BXuJI/cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770122762; c=relaxed/simple;
	bh=WwolhCM8vOxMy0VOdGzgihygYWS18FoqOOQGQlNeTuE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=abqvhYjmESOCvGXrgUlUM6m8IWWwHHnzS98LxOSR2428f1Xp1/JBmz6kO1haEshAArWpXPsSYAlomfT1gkeZCBzWVDyiQPm5Qx4mDRG1g/zbIXxAMCbZblRPZQ8Ux/qJyVp/+XnvVZtLkiIkxhNO2eQNJUoPiSgKLtfzRcM5/uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.40.57.136])
	by gateway (Coremail) with SMTP id _____8CxLMP97YFp4V0PAA--.49974S3;
	Tue, 03 Feb 2026 20:45:49 +0800 (CST)
Received: from localhost.localdomain (unknown [10.40.57.136])
	by front1 (Coremail) with SMTP id qMiowJDxzsLk7YFp3Bc_AA--.51803S6;
	Tue, 03 Feb 2026 20:45:46 +0800 (CST)
From: Tianyang Zhang <zhangtianyang@loongson.cn>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	corbet@lwn.net,
	alexs@kernel.org,
	si.yanteng@linux.dev,
	tglx@linutronix.de,
	jiaxun.yang@flygoat.com,
	maobibo@loongson.cn
Cc: loongarch@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tianyang Zhang <zhangtianyang@loongson.cn>,
	Liupu Wang <wangliupu@loongson.cn>
Subject: [PATCH v11 4/4] irqchip/irq-loongarch-ir:Add Redirect irqchip support
Date: Tue,  3 Feb 2026 20:45:21 +0800
Message-ID: <20260203124522.2288900-5-zhangtianyang@loongson.cn>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20260203124522.2288900-1-zhangtianyang@loongson.cn>
References: <20260203124522.2288900-1-zhangtianyang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxzsLk7YFp3Bc_AA--.51803S6
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9fXoW3Zw17uw1UGryDWFWfGF1fKrX_yoW8Ar1rGo
	WfJFs3J34rWr18GrW0ka17tFyxZ3y5Gw4Fyw1ruFWDZ3Wqqr4rtrW7GrW3Za42gF10qF17
	JFy0qwn3GFW7trn3l-sFpf9Il3svdjkaLaAFLSUrUUUU8b8apTn2vfkv8UJUUUU8wcxFpf
	9Il3svdxBIdaVrn0xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3
	UjIYCTnIWjp_UUUYu7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI
	8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xG
	Y2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14
	v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6x
	kI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v2
	6rWY6Fy7McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2
	Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Y
	z7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
	8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE
	2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42
	xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY
	1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUneRRtUUUUU==

The main function of the Redirected interrupt controller is to manage
the redirected-interrupt table, which consists of many redirected entries.
When MSI interrupts are requested, the driver creates a corresponding
redirected entry that describes the target CPU/vector number and the
operating mode of the interrupt. The redirected interrupt module has an
independent cache, and during the interrupt routing process, it will
prioritize the redirected entries that hit the cache. The driver
invalidates certain entry caches via a command queue.

Co-developed-by: Liupu Wang <wangliupu@loongson.cn>
Signed-off-by: Liupu Wang <wangliupu@loongson.cn>
Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
---
 drivers/irqchip/Makefile             |   2 +-
 drivers/irqchip/irq-loongarch-avec.c |   6 +-
 drivers/irqchip/irq-loongarch-ir.c   | 522 +++++++++++++++++++++++++++
 3 files changed, 528 insertions(+), 2 deletions(-)
 create mode 100644 drivers/irqchip/irq-loongarch-ir.c

diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 6a229443efe0..2fc15a8e6ada 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -118,7 +118,7 @@ obj-$(CONFIG_LS1X_IRQ)			+= irq-ls1x.o
 obj-$(CONFIG_TI_SCI_INTR_IRQCHIP)	+= irq-ti-sci-intr.o
 obj-$(CONFIG_TI_SCI_INTA_IRQCHIP)	+= irq-ti-sci-inta.o
 obj-$(CONFIG_TI_PRUSS_INTC)		+= irq-pruss-intc.o
-obj-$(CONFIG_IRQ_LOONGARCH_CPU)		+= irq-loongarch-cpu.o irq-loongarch-avec.o
+obj-$(CONFIG_IRQ_LOONGARCH_CPU)		+= irq-loongarch-cpu.o irq-loongarch-avec.o irq-loongarch-ir.o
 obj-$(CONFIG_LOONGSON_LIOINTC)		+= irq-loongson-liointc.o
 obj-$(CONFIG_LOONGSON_EIOINTC)		+= irq-loongson-eiointc.o
 obj-$(CONFIG_LOONGSON_HTPIC)		+= irq-loongson-htpic.o
diff --git a/drivers/irqchip/irq-loongarch-avec.c b/drivers/irqchip/irq-loongarch-avec.c
index 7bdf3f678db4..972203182079 100644
--- a/drivers/irqchip/irq-loongarch-avec.c
+++ b/drivers/irqchip/irq-loongarch-avec.c
@@ -111,7 +111,8 @@ static int avecintc_set_affinity(struct irq_data *data, const struct cpumask *de
 		adata->cpu = cpu;
 		adata->vec = vector;
 		per_cpu_ptr(irq_map, adata->cpu)[adata->vec] = irq_data_to_desc(data);
-		avecintc_sync(adata);
+		if (!cpu_has_redirectint)
+			avecintc_sync(adata);
 	}
 
 	irq_data_update_effective_affinity(data, cpumask_of(cpu));
@@ -403,6 +404,9 @@ static int __init pch_msi_parse_madt(union acpi_subtable_headers *header,
 
 static inline int __init acpi_cascade_irqdomain_init(void)
 {
+	if (cpu_has_redirectint)
+		return redirect_acpi_init(loongarch_avec.domain);
+
 	return acpi_table_parse_madt(ACPI_MADT_TYPE_MSI_PIC, pch_msi_parse_madt, 1);
 }
 
diff --git a/drivers/irqchip/irq-loongarch-ir.c b/drivers/irqchip/irq-loongarch-ir.c
new file mode 100644
index 000000000000..d34ac1c989c9
--- /dev/null
+++ b/drivers/irqchip/irq-loongarch-ir.c
@@ -0,0 +1,522 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2024 Loongson Technologies, Inc.
+ */
+#define pr_fmt(fmt) "redirect: " fmt
+
+#include <linux/cpuhotplug.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/irqchip.h>
+#include <linux/irqchip/irq-msi-lib.h>
+#include <linux/irqdomain.h>
+#include <linux/kernel.h>
+#include <linux/msi.h>
+#include <linux/spinlock.h>
+
+#include <asm/irq.h>
+#include <asm/loongarch.h>
+#include <asm/loongson.h>
+#include <asm/numa.h>
+#include <asm/setup.h>
+#include <larchintrin.h>
+
+#include "irq-loongson.h"
+
+#define LOONGARCH_IOCSR_REDIRECT_CFG           0x15e0
+#define LOONGARCH_IOCSR_REDIRECT_TBR           0x15e8  /* IRT BASE REG*/
+#define LOONGARCH_IOCSR_REDIRECT_CQB           0x15f0  /* IRT CACHE QUEUE BASE */
+#define LOONGARCH_IOCSR_REDIRECT_CQH           0x15f8  /* IRT CACHE QUEUE HEAD, 32bit */
+#define LOONGARCH_IOCSR_REDIRECT_CQT           0x15fc  /* IRT CACHE QUEUE TAIL, 32bit */
+
+#define GPID_ADDR_MASK			GENMASK(47, 6)
+#define GPID_ADDR_SHIFT 		6
+
+#define CQB_SIZE_MASK			0xf
+#define CQB_ADDR_MASK			GENMASK(47, 12)
+
+#define CFG_DISABLE_IDLE		2
+#define INVALID_INDEX			0
+
+#define MAX_IR_ENGINES			16
+
+struct redirect_entry {
+	struct  {
+		u64	valid	: 1,
+			res1	: 5,
+			gpid	: 42,
+			res2	: 8,
+			vector	: 8;
+	}	lo;
+	u64	hi;
+};
+#define IRD_ENTRY_SIZE			sizeof(struct redirect_entry)
+#define IRD_ENTRIES			65536
+#define IRD_TABLE_PAGE_ORDER		get_order(IRD_ENTRIES * IRD_ENTRY_SIZE)
+
+struct redirect_gpid {
+	u64	pir[4];      // Pending interrupt requested
+	u8	en	: 1, // doorbell
+		res0	: 7;
+	u8	irqnum;
+	u16	res1;
+	u32	dst;
+	u32	rsvd[6];
+};
+
+struct irde_inv_cmd {
+	union {
+		u64	cmd_info;
+		struct {
+			u64	res1		: 4,
+				type		: 1,
+				need_notice	: 1,
+				pad		: 2,
+				index		: 16,
+				pad2		: 40;
+		}	index;
+	};
+	u64		notice_addr;
+};
+#define IRD_CMD_SIZE			sizeof(struct irde_inv_cmd)
+#define INVALID_QUEUE_SIZE		4096
+#define INV_QUEUE_PAGE_ORDER		get_order(INVALID_QUEUE_SIZE * IRD_CMD_SIZE)
+
+struct redirect_table {
+	struct redirect_entry	*table;
+	unsigned long		*bitmap;
+	raw_spinlock_t		lock;
+};
+
+struct redirect_queue {
+	struct irde_inv_cmd	*cmd_base;
+	int			head;
+	int			tail;
+	raw_spinlock_t		lock;
+};
+
+struct irde_desc {
+	struct	redirect_table	ird_table;
+	struct	redirect_queue	inv_queue;
+	int			node;
+};
+
+struct redirect_item {
+	int			index;
+	struct irde_desc	*irde;
+	struct redirect_gpid	*gpid;
+};
+
+
+static struct irq_domain *redirect_domain;
+static struct irde_desc irde_descs[MAX_IR_ENGINES];
+static phys_addr_t msi_base_addr;
+static phys_addr_t redirect_reg_base = LOONGSON_REG_BASE;
+
+#define REDIRECT_REG(reg, node) \
+	((void __iomem *)(IO_BASE | redirect_reg_base | (u64)(node) << NODE_ADDRSPACE_SHIFT | (reg)))
+
+static inline void redirect_write_reg64(u32 node, u64 val, u32 reg)
+{
+	writeq(val, REDIRECT_REG(reg, node));
+}
+
+static inline void redirect_write_reg32(u32 node, u32 val, u32 reg)
+{
+	writel(val, REDIRECT_REG(reg, node));
+}
+
+static inline u32 redirect_read_reg32(u32 node, u32 reg)
+{
+	return readl(REDIRECT_REG(reg, node));
+}
+
+static inline struct redirect_entry *item_get_entry(struct redirect_item *item)
+{
+	return item->irde->ird_table.table + item->index;
+}
+
+static inline bool invalid_queue_is_full(int node, u32 *tail)
+{
+	u32 head = redirect_read_reg32(node, LOONGARCH_IOCSR_REDIRECT_CQH);
+
+	*tail = redirect_read_reg32(node, LOONGARCH_IOCSR_REDIRECT_CQT);
+
+	return head == ((*tail + 1) % INVALID_QUEUE_SIZE);
+}
+
+static void invalid_enqueue(struct redirect_item *item, struct irde_inv_cmd *cmd)
+{
+	struct redirect_queue *inv_queue = &item->irde->inv_queue;
+	u32 tail;
+
+	guard(raw_spinlock_irqsave)(&inv_queue->lock);
+
+	while (invalid_queue_is_full(item->irde->node, &tail))
+		cpu_relax();
+
+	memcpy(&inv_queue->cmd_base[tail], cmd, sizeof(*cmd));
+
+	redirect_write_reg32(item->irde->node, (tail + 1) % INVALID_QUEUE_SIZE,
+			     LOONGARCH_IOCSR_REDIRECT_CQT);
+}
+
+static void irde_invalidate_entry(struct redirect_item *item)
+{
+	struct irde_inv_cmd cmd;
+	u64 raddr = 0;
+
+	cmd.cmd_info = 0;
+	cmd.index.type = INVALID_INDEX;
+	cmd.index.need_notice = 1;
+	cmd.index.index = item->index;
+	cmd.notice_addr = (u64)(__pa(&raddr));
+
+	invalid_enqueue(item, &cmd);
+
+	/*
+	 * The CPU needs to wait here for cmd to complete, and it determines this
+	 * by checking whether the invalidation queue has already written a valid value
+	 * to cmd.notice_addr.
+	 */
+	while (!raddr)
+		cpu_relax();
+
+}
+
+static inline struct avecintc_data *irq_data_get_avec_data(struct irq_data *data)
+{
+	return data->parent_data->chip_data;
+}
+
+static int redirect_table_alloc(int node, u32 nr_irqs)
+{
+	struct redirect_table *ird_table = &irde_descs[node].ird_table;
+	int index, order = 0;
+
+	if (nr_irqs > 1) {
+		nr_irqs = __roundup_pow_of_two(nr_irqs);
+		order = ilog2(nr_irqs);
+	}
+
+	guard(raw_spinlock_irqsave)(&ird_table->lock);
+
+	index = bitmap_find_free_region(ird_table->bitmap, IRD_ENTRIES, order);
+	if (index < 0) {
+		pr_err("No redirect entry to use\n");
+		return -EINVAL;
+	}
+
+	return index;
+}
+
+static void redirect_table_free(struct redirect_item *item)
+{
+	struct redirect_table *ird_table = &item->irde->ird_table;
+	struct redirect_entry *entry = item_get_entry(item);
+
+	memset(entry, 0, sizeof(*entry));
+
+	scoped_guard(raw_spinlock_irq, &ird_table->lock)
+		clear_bit(item->index, ird_table->bitmap);
+
+	kfree(item->gpid);
+
+	irde_invalidate_entry(item);
+}
+
+static inline void redirect_domain_prepare_entry(struct redirect_item *item,
+						 struct avecintc_data *adata)
+{
+	struct redirect_entry *entry = item_get_entry(item);
+
+	item->gpid->en = 1;
+	item->gpid->irqnum = adata->vec;
+	item->gpid->dst = adata->cpu;
+
+	entry->lo.valid = 1;
+	entry->lo.gpid = ((u64)item->gpid & GPID_ADDR_MASK) >> GPID_ADDR_SHIFT;
+	entry->lo.vector = 0xff;
+}
+
+static int redirect_set_affinity(struct irq_data *data, const struct cpumask *dest, bool force)
+{
+	struct redirect_item *item = data->chip_data;
+	int ret;
+
+	ret = irq_chip_set_affinity_parent(data, dest, force);
+	if (ret == IRQ_SET_MASK_OK_DONE) {
+		return ret;
+	} else if (ret) {
+		pr_err("IRDE:set_affinity error %d\n", ret);
+		return ret;
+	}
+	struct avecintc_data *adata = irq_data_get_avec_data(data);
+
+	redirect_domain_prepare_entry(item, adata);
+	irde_invalidate_entry(item);
+	avecintc_sync(adata);
+
+	return IRQ_SET_MASK_OK;
+}
+
+static void redirect_compose_msi_msg(struct irq_data *d, struct msi_msg *msg)
+{
+	struct redirect_item *item = irq_data_get_irq_chip_data(d);
+
+	msg->address_lo = (msi_base_addr | 1 << 2);
+	msg->address_hi = 0x0;
+	msg->data = item->index;
+}
+
+static struct irq_chip loongarch_redirect_chip = {
+	.name			= "REDIRECT",
+	.irq_ack		= irq_chip_ack_parent,
+	.irq_mask		= irq_chip_mask_parent,
+	.irq_unmask		= irq_chip_unmask_parent,
+	.irq_set_affinity	= redirect_set_affinity,
+	.irq_compose_msi_msg	= redirect_compose_msi_msg,
+};
+
+static void redirect_free_resources(struct irq_domain *domain, unsigned int virq,
+				    unsigned int nr_irqs)
+{
+	for (int i = 0; i < nr_irqs; i++) {
+		struct irq_data *irq_data = irq_domain_get_irq_data(domain, virq + i);
+
+		if (irq_data && irq_data->chip_data) {
+			struct redirect_item *item = irq_data->chip_data;
+
+			redirect_table_free(item);
+			kfree(item);
+		}
+	}
+}
+
+static int redirect_domain_alloc(struct irq_domain *domain, unsigned int virq,
+				 unsigned int nr_irqs, void *arg)
+{
+	msi_alloc_info_t *info = arg;
+	int ret, i, node, index;
+
+	node = dev_to_node(info->desc->dev);
+
+	ret = irq_domain_alloc_irqs_parent(domain, virq, nr_irqs, arg);
+	if (ret < 0)
+		return ret;
+
+	index = redirect_table_alloc(node, nr_irqs);
+	if (index < 0) {
+		pr_err("Alloc redirect table entry failed\n");
+		return -EINVAL;
+	}
+
+	for (i = 0; i < nr_irqs; i++) {
+		struct irq_data *irq_data = irq_domain_get_irq_data(domain, virq + i);
+		struct redirect_item *item;
+
+		item = kzalloc(sizeof(*item), GFP_KERNEL);
+		if (!item) {
+			pr_err("Alloc redirect descriptor failed\n");
+			goto out_free_resources;
+		}
+		item->irde = &irde_descs[node];
+
+		/*
+		 * Only bits 47:6 of the GPID are passed to the controller,
+		 * 64-byte alignment must be guarantee and make kzalloc can
+		 * align to the respective size.
+		 */
+		static_assert(sizeof(*item->gpid) == 64);
+		item->gpid = kzalloc_node(sizeof(*item->gpid), GFP_KERNEL, node);
+		if (!item->gpid) {
+			pr_err("Alloc redirect GPID failed\n");
+			goto out_free_resources;
+		}
+		item->index = index + i;
+
+		irq_data->chip_data = item;
+		irq_data->chip = &loongarch_redirect_chip;
+
+		redirect_domain_prepare_entry(item, irq_data_get_avec_data(irq_data));
+	}
+	return 0;
+
+out_free_resources:
+	redirect_free_resources(domain, virq, nr_irqs);
+	irq_domain_free_irqs_common(domain, virq, nr_irqs);
+
+	return -ENOMEM;
+}
+
+static void redirect_domain_free(struct irq_domain *domain, unsigned int virq, unsigned int nr_irqs)
+{
+	redirect_free_resources(domain, virq, nr_irqs);
+	return irq_domain_free_irqs_common(domain, virq, nr_irqs);
+}
+
+static const struct irq_domain_ops redirect_domain_ops = {
+	.alloc		= redirect_domain_alloc,
+	.free		= redirect_domain_free,
+	.select		= msi_lib_irq_domain_select,
+};
+
+static int redirect_queue_init(struct irde_desc *irde)
+{
+	struct redirect_queue *inv_queue = &irde->inv_queue;
+	struct folio *folio;
+
+	folio = __folio_alloc_node(GFP_KERNEL | __GFP_ZERO, INV_QUEUE_PAGE_ORDER, irde->node);
+	if (!folio) {
+		pr_err("Node [%d] invalid queue alloc pages failed!\n", irde->node);
+		return -ENOMEM;
+	}
+
+	inv_queue->cmd_base = folio_address(folio);
+	inv_queue->head = 0;
+	inv_queue->tail = 0;
+	raw_spin_lock_init(&inv_queue->lock);
+
+	return 0;
+}
+
+static int redirect_table_init(struct irde_desc *irde)
+{
+	struct redirect_table *ird_table = &irde->ird_table;
+	unsigned long *bitmap;
+	struct folio *folio;
+
+	folio = __folio_alloc_node(GFP_KERNEL | __GFP_ZERO, IRD_TABLE_PAGE_ORDER, irde->node);
+	if (!folio) {
+		pr_err("Node [%d] redirect table alloc pages failed!\n", irde->node);
+		return -ENOMEM;
+	}
+	ird_table->table = folio_address(folio);
+
+	bitmap = bitmap_zalloc(IRD_ENTRIES, GFP_KERNEL);
+	if (!bitmap) {
+		pr_err("Node [%d] redirect table bitmap alloc pages failed!\n", irde->node);
+		folio_put(folio);
+		ird_table->table = NULL;
+		return -ENOMEM;
+	}
+
+	ird_table->bitmap = bitmap;
+
+	raw_spin_lock_init(&ird_table->lock);
+
+	return 0;
+}
+
+static void redirect_irde_cfg(struct irde_desc *irde)
+{
+	redirect_write_reg64(irde->node, CFG_DISABLE_IDLE, LOONGARCH_IOCSR_REDIRECT_CFG);
+	redirect_write_reg64(irde->node, __pa(irde->ird_table.table), LOONGARCH_IOCSR_REDIRECT_TBR);
+	redirect_write_reg32(irde->node, 0, LOONGARCH_IOCSR_REDIRECT_CQH);
+	redirect_write_reg32(irde->node, 0, LOONGARCH_IOCSR_REDIRECT_CQT);
+	redirect_write_reg64(irde->node, ((u64)irde->inv_queue.cmd_base & CQB_ADDR_MASK) |
+			     CQB_SIZE_MASK, LOONGARCH_IOCSR_REDIRECT_CQB);
+}
+
+static void __init redirect_free_irde(struct irde_desc *irde)
+{
+	struct redirect_table *ird_table = &irde_descs->ird_table;
+	struct redirect_queue *inv_queue = &irde_descs->inv_queue;
+
+	if (ird_table->table) {
+		folio_put(virt_to_folio(ird_table->table));
+		ird_table->table = NULL;
+	}
+
+	if (ird_table->bitmap) {
+		bitmap_free(ird_table->bitmap);
+		ird_table->bitmap = NULL;
+	}
+
+	if (inv_queue->cmd_base) {
+		folio_put(virt_to_folio(inv_queue->cmd_base));
+		inv_queue->cmd_base = NULL;
+	}
+}
+
+static int __init redirect_irde_init(int node)
+{
+	struct irde_desc *irde = &irde_descs[node];
+	int ret;
+
+	irde->node = node;
+
+	ret = redirect_table_init(irde);
+	if (ret)
+		return ret;
+
+	ret = redirect_queue_init(irde);
+	if (ret) {
+		redirect_free_irde(irde);
+		return ret;
+	}
+
+	redirect_irde_cfg(irde);
+
+	return 0;
+}
+
+static int __init pch_msi_parse_madt(union acpi_subtable_headers *header, const unsigned long end)
+{
+	struct acpi_madt_msi_pic *pchmsi_entry = (struct acpi_madt_msi_pic *)header;
+
+	msi_base_addr = pchmsi_entry->msg_address - AVEC_MSG_OFFSET;
+
+	return pch_msi_acpi_init_avec(redirect_domain);
+}
+
+static int __init acpi_cascade_irqdomain_init(void)
+{
+	return acpi_table_parse_madt(ACPI_MADT_TYPE_MSI_PIC, pch_msi_parse_madt, 1);
+}
+
+int __init redirect_acpi_init(struct irq_domain *parent)
+{
+	struct fwnode_handle *fwnode;
+	int ret = -EINVAL, node;
+
+	fwnode = irq_domain_alloc_named_fwnode("redirect");
+	if (!fwnode) {
+		pr_err("Unable to alloc redirect domain handle\n");
+		goto fail;
+	}
+
+	redirect_domain = irq_domain_create_hierarchy(parent, 0, IRD_ENTRIES, fwnode,
+						      &redirect_domain_ops, irde_descs);
+	if (!redirect_domain) {
+		pr_err("Unable to alloc redirect domain\n");
+		goto out_free_fwnode;
+	}
+
+	for_each_node_mask(node, node_possible_map) {
+		ret = redirect_irde_init(node);
+		if (ret)
+			goto out_clear_irde;
+	}
+
+	ret = acpi_cascade_irqdomain_init();
+	if (ret < 0) {
+		pr_err("Failed to cascade IRQ domain, ret=%d\n", ret);
+		goto out_clear_irde;
+	}
+
+	pr_info("init succeeded\n");
+	return 0;
+
+out_clear_irde:
+	for_each_node_mask(node, node_possible_map) {
+		redirect_free_irde(&irde_descs[node]);
+	}
+
+	irq_domain_remove(redirect_domain);
+out_free_fwnode:
+	irq_domain_free_fwnode(fwnode);
+fail:
+	return ret;
+}
-- 
2.41.0

