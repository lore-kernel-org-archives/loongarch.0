Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FC6B37B017
	for <loongarch@lists.linux.dev>; Wed, 13 May 2026 01:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778635793; cv=none; b=jpBadOPupf8N2Th10DrRHmellQvm5NIWGPLYYo/EmpocXYWxSMYr23Ib0JQmWGGNf3Aaxs1PZdHvfxxwP1RDxtsgBbSheIxWGbbYnt5ChZew+vNX9GhefnrktH8fVULheICkODfVxsZ9XLj8U3dSZ0uGjqjjjH/7QT9MtOY1fcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778635793; c=relaxed/simple;
	bh=VdFvWL+j/KvnUnLOPvg2otCvRtNpGgOtb1u9sIJSSbY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L9WgaSTaBcxvq7rJie4BaV0IEnYMbPkgQ6/7zFTCIkEGlhrW2Zx10nXjUeMp2A9Ic5SV9wAR7mH8z+GglXT5FeFZoEh0XskKe+3H1qpLbq4VZ/UyKID1XyZNJW9XI7RjgOUc8HvAt3Re/9dI2nGM9sauUi/RhGSkKEX4jjjZRpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.40.57.136])
	by gateway (Coremail) with SMTP id _____8DxEvAA1ANqMlgJAA--.28591S3;
	Wed, 13 May 2026 09:29:36 +0800 (CST)
Received: from localhost.cn (unknown [10.40.57.136])
	by front1 (Coremail) with SMTP id qMiowJCxOMHJ0wNqr7eAAA--.34539S6;
	Wed, 13 May 2026 09:29:33 +0800 (CST)
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
Subject: [PATCH v12 4/4] irqchip/loongarch-ir: Add IR (interrupt redirection) irqchip support
Date: Wed, 13 May 2026 09:28:35 +0800
Message-ID: <20260513012839.2856463-5-zhangtianyang@loongson.cn>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20260513012839.2856463-1-zhangtianyang@loongson.cn>
References: <20260513012839.2856463-1-zhangtianyang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxOMHJ0wNqr7eAAA--.34539S6
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9fXoW3Zw15CFWftF1UKF13AF4UKFX_yoW8Aw17Xo
	WfJFs3C34rWF18GFWFka17tFyxZa98Gw4Fyw1ruFsrZ3Wvqr4rtrW7GrW3ZFy2gF10qF17
	AFy0qwn3GF47trn3l-sFpf9Il3svdjkaLaAFLSUrUUUU8b8apTn2vfkv8UJUUUU8wcxFpf
	9Il3svdxBIdaVrn0xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3
	UjIYCTnIWjp_UUUYA7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI
	8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xG
	Y2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14
	v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr0_Gr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWr
	XVW3AwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUneRRtUUUUU==

The main function of the redirect interrupt controller is to manage
the redirected-interrupt table, which consists of many redirected entries.

When MSI interrupts are requested, the driver creates a corresponding
redirected entry that describes the target CPU/vector number and the
operating mode of the interrupt. The redirected interrupt module has an
independent cache, and during the interrupt routing process, it will
prioritize the redirected entries that hit the cache. The irqchip driver
can invalidate certain entry caches via a command queue.

Co-developed-by: Liupu Wang <wangliupu@loongson.cn>
Signed-off-by: Liupu Wang <wangliupu@loongson.cn>
Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
---
 drivers/irqchip/Makefile             |   2 +-
 drivers/irqchip/irq-loongarch-avec.c |   6 +-
 drivers/irqchip/irq-loongarch-ir.c   | 537 +++++++++++++++++++++++++++
 drivers/irqchip/irq-loongson.h       |   2 +
 4 files changed, 545 insertions(+), 2 deletions(-)
 create mode 100644 drivers/irqchip/irq-loongarch-ir.c

diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 26aa3b6ec99f..37e87445d384 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -119,7 +119,7 @@ obj-$(CONFIG_LS1X_IRQ)			+= irq-ls1x.o
 obj-$(CONFIG_TI_SCI_INTR_IRQCHIP)	+= irq-ti-sci-intr.o
 obj-$(CONFIG_TI_SCI_INTA_IRQCHIP)	+= irq-ti-sci-inta.o
 obj-$(CONFIG_TI_PRUSS_INTC)		+= irq-pruss-intc.o
-obj-$(CONFIG_IRQ_LOONGARCH_CPU)		+= irq-loongarch-cpu.o irq-loongarch-avec.o
+obj-$(CONFIG_IRQ_LOONGARCH_CPU)		+= irq-loongarch-cpu.o irq-loongarch-avec.o irq-loongarch-ir.o
 obj-$(CONFIG_LOONGSON_LIOINTC)		+= irq-loongson-liointc.o
 obj-$(CONFIG_LOONGSON_EIOINTC)		+= irq-loongson-eiointc.o
 obj-$(CONFIG_LOONGSON_HTPIC)		+= irq-loongson-htpic.o
diff --git a/drivers/irqchip/irq-loongarch-avec.c b/drivers/irqchip/irq-loongarch-avec.c
index 4896ff7637c4..53d7d23af9bb 100644
--- a/drivers/irqchip/irq-loongarch-avec.c
+++ b/drivers/irqchip/irq-loongarch-avec.c
@@ -113,7 +113,8 @@ static int avecintc_set_affinity(struct irq_data *data, const struct cpumask *de
 		adata->cpu = cpu;
 		adata->vec = vector;
 		per_cpu_ptr(irq_map, adata->cpu)[adata->vec] = irq_data_to_desc(data);
-		avecintc_sync(adata);
+		if (!cpu_has_redirectint)
+			avecintc_sync(adata);
 	}
 
 	irq_data_update_effective_affinity(data, cpumask_of(cpu));
@@ -405,6 +406,9 @@ static int __init pch_msi_parse_madt(union acpi_subtable_headers *header,
 
 static inline int __init acpi_cascade_irqdomain_init(void)
 {
+	if (cpu_has_redirectint)
+		return redirect_acpi_init(loongarch_avec.domain);
+
 	return acpi_table_parse_madt(ACPI_MADT_TYPE_MSI_PIC, pch_msi_parse_madt, 1);
 }
 
diff --git a/drivers/irqchip/irq-loongarch-ir.c b/drivers/irqchip/irq-loongarch-ir.c
new file mode 100644
index 000000000000..0c1ea98aef7c
--- /dev/null
+++ b/drivers/irqchip/irq-loongarch-ir.c
@@ -0,0 +1,537 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2024-2026 Loongson Technologies, Inc.
+ */
+#define pr_fmt(fmt) "redirect: " fmt
+
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/io-64-nonatomic-lo-hi.h>
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
+
+#include "irq-loongson.h"
+
+#define LOONGARCH_IOCSR_REDIRECT_CFG	0x15e0
+#define LOONGARCH_IOCSR_REDIRECT_TBR	0x15e8  /* IRT BASE REG */
+#define LOONGARCH_IOCSR_REDIRECT_CQB	0x15f0  /* IRT CACHE QUEUE BASE */
+#define LOONGARCH_IOCSR_REDIRECT_CQH	0x15f8  /* IRT CACHE QUEUE HEAD, 32bit */
+#define LOONGARCH_IOCSR_REDIRECT_CQT	0x15fc  /* IRT CACHE QUEUE TAIL, 32bit */
+
+#define CQB_ADDR_MASK			GENMASK_U64(47, 12)
+#define CQB_SIZE_MASK			0xf
+
+#define GPID_ADDR_MASK			GENMASK_U64(47, 6)
+#define GPID_ADDR_SHIFT 		6
+
+#define INVALID_INDEX			0
+#define CFG_DISABLE_IDLE		2
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
+
+#define IRD_ENTRY_SIZE			sizeof(struct redirect_entry)
+#define IRD_ENTRIES			SZ_64K
+#define IRD_TABLE_PAGE_ORDER		get_order(IRD_ENTRIES * IRD_ENTRY_SIZE)
+
+struct redirect_cmd {
+	union {
+		u64	cmd_info;
+		struct {
+			u64	res1		: 4,
+				type		: 1,
+				need_notice	: 1,
+				pad1		: 2,
+				index		: 16,
+				pad2		: 40;
+		}	index;
+	};
+	u64		notice_addr;
+};
+
+#define IRD_CMD_SIZE			sizeof(struct redirect_cmd)
+#define INV_QUEUE_SIZE			SZ_4K
+#define INV_QUEUE_PAGE_ORDER		get_order(INV_QUEUE_SIZE * IRD_CMD_SIZE)
+
+struct redirect_gpid {
+	u64	pir[4];      /* Pending interrupt requested */
+	u8	en	: 1, /* Doorbell */
+		res1	: 7;
+	u8	irqnum;
+	u16	res2;
+	u32	dstcpu;
+	u32	rsvd[6];
+};
+
+struct redirect_table {
+	struct redirect_entry	*table;
+	unsigned long		*bitmap;
+	raw_spinlock_t		lock;
+};
+
+struct redirect_queue {
+	struct redirect_cmd	*cmd_base;
+	int			head;
+	int			tail;
+	raw_spinlock_t		lock;
+};
+
+struct redirect_desc {
+	struct	redirect_table	ird_table;
+	struct	redirect_queue	inv_queue;
+	int			node;
+};
+
+struct redirect_item {
+	int			index;
+	struct redirect_desc	*irde;
+	struct redirect_gpid	*gpid;
+};
+
+static struct irq_domain *redirect_domain;
+static struct redirect_desc redirect_descs[MAX_IR_ENGINES];
+
+static phys_addr_t msi_base_addr;
+static phys_addr_t redirect_reg_base = LOONGSON_REG_BASE;
+
+#ifdef CONFIG_32BIT
+
+#define REDIRECT_REG(reg, node) \
+	((void __iomem *)(IO_BASE | redirect_reg_base | (reg)))
+
+#else
+
+#define REDIRECT_REG(reg, node) \
+	((void __iomem *)(IO_BASE | redirect_reg_base | (u64)(node) << NODE_ADDRSPACE_SHIFT | (reg)))
+
+#endif
+
+static inline u32 redirect_read_reg32(u32 node, u32 reg)
+{
+	return readl(REDIRECT_REG(reg, node));
+}
+
+static inline void redirect_write_reg32(u32 node, u32 val, u32 reg)
+{
+	writel(val, REDIRECT_REG(reg, node));
+}
+
+static inline void redirect_write_reg64(u32 node, u64 val, u32 reg)
+{
+	writeq(val, REDIRECT_REG(reg, node));
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
+	return head == ((*tail + 1) % INV_QUEUE_SIZE);
+}
+
+static void invalid_enqueue(struct redirect_item *item, struct redirect_cmd *cmd)
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
+	redirect_write_reg32(item->irde->node, (tail + 1) % INV_QUEUE_SIZE, LOONGARCH_IOCSR_REDIRECT_CQT);
+}
+
+static void irde_invalidate_entry(struct redirect_item *item)
+{
+	struct redirect_cmd cmd;
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
+}
+
+static inline struct avecintc_data *irq_data_get_avec_data(struct irq_data *data)
+{
+	return data->parent_data->chip_data;
+}
+
+static int redirect_table_alloc(int node, u32 nr_irqs)
+{
+	struct redirect_table *ird_table = &redirect_descs[node].ird_table;
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
+	item->gpid->dstcpu = adata->cpu;
+	item->gpid->irqnum = adata->vec;
+
+	entry->lo.valid = 1;
+	entry->lo.vector = 0xff;
+	entry->lo.gpid = ((unsigned long)item->gpid & GPID_ADDR_MASK) >> GPID_ADDR_SHIFT;
+}
+
+static void redirect_free_resources(struct irq_domain *domain,
+				    unsigned int virq, unsigned int nr_irqs)
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
+#ifdef CONFIG_SMP
+static int redirect_set_affinity(struct irq_data *data, const struct cpumask *dest, bool force)
+{
+	struct avecintc_data *adata = irq_data_get_avec_data(data);
+	struct redirect_item *item = data->chip_data;
+	int ret;
+
+	ret = irq_chip_set_affinity_parent(data, dest, force);
+	switch (ret) {
+	case IRQ_SET_MASK_OK:
+		break;
+	case IRQ_SET_MASK_OK_DONE:
+		return ret;
+	default:
+		pr_err("IRDE: set_affinity error %d\n", ret);
+		return ret;
+	}
+
+	redirect_domain_prepare_entry(item, adata);
+	irde_invalidate_entry(item);
+	avecintc_sync(adata);
+
+	return IRQ_SET_MASK_OK;
+}
+#endif
+
+static void redirect_compose_msi_msg(struct irq_data *d, struct msi_msg *msg)
+{
+	struct redirect_item *item = irq_data_get_irq_chip_data(d);
+
+	msg->address_hi = 0x0;
+	msg->address_lo = (msi_base_addr | 1 << 2);
+	msg->data = item->index;
+}
+
+static struct irq_chip loongarch_redirect_chip = {
+	.name			= "REDIRECT",
+	.irq_ack		= irq_chip_ack_parent,
+	.irq_mask		= irq_chip_mask_parent,
+	.irq_unmask		= irq_chip_unmask_parent,
+#ifdef CONFIG_SMP
+	.irq_set_affinity	= redirect_set_affinity,
+#endif
+	.irq_compose_msi_msg	= redirect_compose_msi_msg,
+};
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
+		item->irde = &redirect_descs[node];
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
+
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
+static int redirect_table_init(struct redirect_desc *irde)
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
+	ird_table->bitmap = bitmap;
+
+	raw_spin_lock_init(&ird_table->lock);
+
+	return 0;
+}
+
+static int redirect_queue_init(struct redirect_desc *irde)
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
+static void redirect_irde_cfg(struct redirect_desc *irde)
+{
+	redirect_write_reg64(irde->node, CFG_DISABLE_IDLE, LOONGARCH_IOCSR_REDIRECT_CFG);
+	redirect_write_reg64(irde->node, __pa(irde->ird_table.table), LOONGARCH_IOCSR_REDIRECT_TBR);
+	redirect_write_reg32(irde->node, 0, LOONGARCH_IOCSR_REDIRECT_CQH);
+	redirect_write_reg32(irde->node, 0, LOONGARCH_IOCSR_REDIRECT_CQT);
+	redirect_write_reg64(irde->node, ((unsigned long)irde->inv_queue.cmd_base & CQB_ADDR_MASK) |
+			     CQB_SIZE_MASK, LOONGARCH_IOCSR_REDIRECT_CQB);
+}
+
+static void __init redirect_irde_free(struct redirect_desc *irde)
+{
+	struct redirect_table *ird_table = &redirect_descs->ird_table;
+	struct redirect_queue *inv_queue = &redirect_descs->inv_queue;
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
+	struct redirect_desc *irde = &redirect_descs[node];
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
+		redirect_irde_free(irde);
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
+						      &redirect_domain_ops, redirect_descs);
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
+
+	return 0;
+
+out_clear_irde:
+	for_each_node_mask(node, node_possible_map) {
+		redirect_irde_free(&redirect_descs[node]);
+	}
+	irq_domain_remove(redirect_domain);
+out_free_fwnode:
+	irq_domain_free_fwnode(fwnode);
+fail:
+	return ret;
+}
diff --git a/drivers/irqchip/irq-loongson.h b/drivers/irqchip/irq-loongson.h
index f0b6767f39b3..dd37cd7f453d 100644
--- a/drivers/irqchip/irq-loongson.h
+++ b/drivers/irqchip/irq-loongson.h
@@ -25,6 +25,8 @@ int eiointc_acpi_init(struct irq_domain *parent,
 					struct acpi_madt_eio_pic *acpi_eiointc);
 int avecintc_acpi_init(struct irq_domain *parent);
 
+int redirect_acpi_init(struct irq_domain *parent);
+
 int htvec_acpi_init(struct irq_domain *parent,
 					struct acpi_madt_ht_pic *acpi_htvec);
 int pch_lpc_acpi_init(struct irq_domain *parent,
-- 
2.20.1

