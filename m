Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 905952E228D
	for <loongarch@lists.linux.dev>; Thu, 11 Dec 2025 09:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765445011; cv=none; b=N1ar+S+Bp6C/R3vDS2aQMJ84Fdqgv/EbH0Gv7uM5/KLV6pqfk1QVGZZloNIJtgV7z/dogv4GSobdehLURwMAWnQ0wMeQn2bD5F+ia2cBc2gI+PGBvftjEKbWNMxc8vmkQSHWcIofxExdvhoklSR4XXek2R9j11o8byJwxLWIQuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765445011; c=relaxed/simple;
	bh=G4k3aM+ayQ73n3EQqSoTPqM1h/Rw5Z9+Ql8PwqHE+PU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M0eXStLe2Joa7R6wpNT2y5stQc+0Dc+VBnMca/0fcJSRkZxuKBFDheYnhabFSaL6v0VjOmdFebWfljFBxivtgvCCCMzR2nXC79Hf5390yFrLANvFQm+ivneTKXLiZQ2YUlLamPStPmyUDW2BJhYwvcJ3kHn1+p3ffvQ7FHVRoAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.40.57.136])
	by gateway (Coremail) with SMTP id _____8BxG9KKjTppF0stAA--.29969S3;
	Thu, 11 Dec 2025 17:23:22 +0800 (CST)
Received: from localhost.localdomain (unknown [10.40.57.136])
	by front1 (Coremail) with SMTP id qMiowJAxVOSGjTppshtIAQ--.2104S2;
	Thu, 11 Dec 2025 17:23:18 +0800 (CST)
From: Tianyang Zhang <zhangtianyang@loongson.cn>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	corbet@lwn.net,
	alexs@kernel.org,
	si.yanteng@linux.dev,
	tglx@linutronix.de,
	jiaxun.yang@flygoat.com,
	peterz@infradead.org,
	wangliupu@loongson.cn,
	lvjianmin@loongson.cn,
	maobibo@loongson.cn,
	siyanteng@cqsoftware.com.cn,
	gaosong@loongson.cn,
	yangtiezhu@loongson.cn
Cc: loongarch@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tianyang Zhang <zhangtianyang@loongson.cn>
Subject: [PATCH v8 5/5] irqchip/irq-loongarch-ir:Add Redirect irqchip support
Date: Thu, 11 Dec 2025 17:23:17 +0800
Message-ID: <20251211092317.5210-1-zhangtianyang@loongson.cn>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxVOSGjTppshtIAQ--.2104S2
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9fXoW3Zw17uw15Jr4DXF1fAF1DJwc_yoW8Ww1DAo
	WfJrs3G34rWr18GrW0ka17tFyxZ345Gw4Fyw1fuFZrZ3Wqqr4rtrW7GrW3Za42gF1FqF17
	JFy0qw1fGFWxtrn3l-sFpf9Il3svdjkaLaAFLSUrUUUU2b8apTn2vfkv8UJUUUU8wcxFpf
	9Il3svdxBIdaVrn0xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3
	UjIYCTnIWjp_UUUYN7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI
	8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xG
	Y2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14
	v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26r4UJVWxJr1ln4kS14v26r4a6rW5M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6x
	kI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v2
	6Fy26r45twAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0x
	vY0x0EwIxGrwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE
	7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I
	0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAI
	cVC0I7IYx2IY67AKxVW7JVWDJwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0x
	vE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280
	aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU5FNt7UUUUU==

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
 drivers/irqchip/irq-loongarch-ir.c   | 528 +++++++++++++++++++++++++++
 3 files changed, 534 insertions(+), 2 deletions(-)
 create mode 100644 drivers/irqchip/irq-loongarch-ir.c

diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 93e3ced023bb..a0be18891890 100644
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
index ac8c423e411e..de7b6059c1b6 100644
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
@@ -402,6 +403,9 @@ static int __init pch_msi_parse_madt(union acpi_subtable_headers *header,
 
 static inline int __init acpi_cascade_irqdomain_init(void)
 {
+	if (cpu_has_redirectint)
+		return redirect_acpi_init(loongarch_avec.domain);
+
 	return acpi_table_parse_madt(ACPI_MADT_TYPE_MSI_PIC, pch_msi_parse_madt, 1);
 }
 
diff --git a/drivers/irqchip/irq-loongarch-ir.c b/drivers/irqchip/irq-loongarch-ir.c
new file mode 100644
index 000000000000..adde8b5148aa
--- /dev/null
+++ b/drivers/irqchip/irq-loongarch-ir.c
@@ -0,0 +1,528 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020 Loongson Technologies, Inc.
+ */
+
+#include <linux/cpuhotplug.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/irq.h>
+#include <linux/irqchip.h>
+#include <linux/irqchip/irq-msi-lib.h>
+#include <linux/irqdomain.h>
+#include <linux/spinlock.h>
+#include <linux/msi.h>
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
+	void __iomem *reg_addr = REDIRECT_REG(reg, node);
+
+	return writeq(val, reg_addr);
+}
+
+static inline void redirect_write_reg32(u32 node, u32 val, u32 reg)
+{
+	void __iomem *reg_addr = REDIRECT_REG(reg, node);
+
+	return writel(val, reg_addr);
+}
+
+static inline u32 redirect_read_reg32(u32 node, u32 reg)
+{
+	void __iomem *reg_addr = REDIRECT_REG(reg, node);
+
+	return readl(reg_addr);
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
+static void irde_invalid_entry(struct redirect_item *item)
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
+	 * CPU needs to wait here for cmd to complete, and it determines this
+	 * by checking whether invalid queue has already written a valid value
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
+	unsigned int index, order;
+
+	if (nr_irqs > 1) {
+		nr_irqs = __roundup_pow_of_two(nr_irqs);
+		order = ilog2(nr_irqs);
+	}
+
+	guard(raw_spinlock_irqsave)(&ird_table->lock);
+
+	index = bitmap_find_free_region(ird_table->bitmap,
+					IRD_ENTRIES, order);
+	if (index < 0) {
+		pr_err("No redirect entry to use\n");
+		return -ENOMEM;
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
+	irde_invalid_entry(item);
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
+	irde_invalid_entry(item);
+	avecintc_sync(adata);
+
+	return IRQ_SET_MASK_OK;
+}
+
+static void redirect_compose_msi_msg(struct irq_data *d, struct msi_msg *msg)
+{
+	struct redirect_item *item = irq_data_get_irq_chip_data(d);
+
+	msg->address_lo = (msi_base_addr | 1 << 2) ;
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
+		return -ENOMEM;
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
+	int node = irde->node;
+
+	folio = __folio_alloc_node(GFP_KERNEL | __GFP_ZERO, IRD_TABLE_PAGE_ORDER, node);
+	if (!folio) {
+		pr_err("Node [%d] redirect table alloc pages failed!\n", node);
+		return -ENOMEM;
+	}
+	ird_table->table = folio_address(folio);
+
+	bitmap = bitmap_zalloc(IRD_ENTRIES, GFP_KERNEL);
+	if (!bitmap) {
+		pr_err("Node [%d] redirect table bitmap alloc pages failed!\n", node);
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
+static void __redirect_irde_fini(struct irde_desc *irde)
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
+static inline void redirect_irde_fini(int node)
+{
+	__redirect_irde_fini(&irde_descs[node]);
+}
+
+static int redirect_irde_init(int node)
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
+		__redirect_irde_fini(irde);
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
+	pr_info("loongarch irq redirect modules init succeeded\n");
+	return 0;
+
+out_clear_irde:
+	for_each_node_mask(node, node_possible_map)
+		redirect_irde_fini(node);
+
+	irq_domain_remove(redirect_domain);
+out_free_fwnode:
+	irq_domain_free_fwnode(fwnode);
+fail:
+	return ret;
+}
-- 
2.41.0

