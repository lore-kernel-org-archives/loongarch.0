Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DECFB32BF41
	for <loongarch@lists.linux.dev>; Fri, 10 Jul 2026 12:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783686411; cv=none; b=KHDdM2TDu0A4xVHiPMurIL0IbjJtBt2mMyOt2e6rk5JS7+FsDEqng/T3nnPEdkfRvLukBpffZA09OCFjht+lxZSiGGpyTjC7jBlivpTZ+u1MliJqhlYk65eQeCVikhXITe/8d7R+Bv+yDTLloT8XXAh1UDRVTWSVTlZRsb9cANQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783686411; c=relaxed/simple;
	bh=vO7obeDkAagEurhcRfxppqOSjSVdaNA2g5/PXGH8Qmk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lI+mMzF+A7SFg0We/tTCjZcL05d7pD1CcA4xeSii0HCieVSxp4A9G+yJUQEUXzELA2EKlY06xbtHjJfjK5U0VH3wVg9JjhasW4HH3Qa3ex6/QLwFPf1Pk3fRmr86XfAglmHs5OxkU1uzf+lafPFZ7DunHWw9lPGq1cqJUT9HnBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.155])
	by gateway (Coremail) with SMTP id _____8CxKfAE5VBqQkQCAA--.9538S3;
	Fri, 10 Jul 2026 20:26:45 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.155])
	by front1 (Coremail) with SMTP id qMiowJDxDcft5FBqH0wIAA--.26113S2;
	Fri, 10 Jul 2026 20:26:41 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: Xuerui Wang <kernel@xen0n.name>,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH for 6.6] LoongArch: Add PIO for early access before ACPI PCI root register
Date: Fri, 10 Jul 2026 20:26:13 +0800
Message-ID: <20260710122613.1596480-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxDcft5FBqH0wIAA--.26113S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxWr1Dtr13CFy3Cw4kWFWDKFX_yoWrGFWkpr
	9Fkrn5GrWrWFn7Grn8Jwn8uF45G3WkC3y2qa129a4SvF4jgryUZrWkZFyDuF15tan8KrW0
	gF95t3WagF4UAagCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	XVWUAwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x
	0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E74
	80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0
	I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04
	k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7Cj
	xVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1CzuJUUUUU==

commit 6061e65f95713b01f4313cda6637dfe3aa5412b4 upstream.

For ACPI system we suppose the ISA/LPC PIO range is registered together
with PCI root bridge. But the fact is there may be some early access to
the ISA/LPC PIO range before ACPI PCI root register (most of them are
due to abnormal BIOS). Unconditionally register the ISA/LPC PIO range
usually causes ACPI PCI root register fail because of the address range
confliction. So we add a pair of helpers: acpi_add_early_pio() to add
PIO for early access, and acpi_remove_early_pio() to remove PIO before
PCI root register. Since acpi_remove_early_pio() may be called multiple
times, we add an acpi_pio flag to ensure PIO be removed only once.

Cc: <stable@vger.kernel.org>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/include/asm/acpi.h |  2 ++
 arch/loongarch/kernel/acpi.c      | 28 ++++++++++++++++++++++++++++
 arch/loongarch/kernel/setup.c     |  2 ++
 arch/loongarch/pci/acpi.c         |  2 ++
 4 files changed, 34 insertions(+)

diff --git a/arch/loongarch/include/asm/acpi.h b/arch/loongarch/include/asm/acpi.h
index 7376840fa9f7..32999f281d5b 100644
--- a/arch/loongarch/include/asm/acpi.h
+++ b/arch/loongarch/include/asm/acpi.h
@@ -38,6 +38,8 @@ static inline bool acpi_has_cpu_in_madt(void)
 extern struct list_head acpi_wakeup_device_list;
 extern struct acpi_madt_core_pic acpi_core_pic[MAX_CORE_PIC];
 
+extern void acpi_add_early_pio(void);
+extern void acpi_remove_early_pio(void);
 extern int __init parse_acpi_topology(void);
 
 static inline u32 get_acpi_id_for_cpu(unsigned int cpu)
diff --git a/arch/loongarch/kernel/acpi.c b/arch/loongarch/kernel/acpi.c
index fba4bb93e1bd..ccd5d42f5b88 100644
--- a/arch/loongarch/kernel/acpi.c
+++ b/arch/loongarch/kernel/acpi.c
@@ -15,6 +15,7 @@
 #include <linux/memblock.h>
 #include <linux/of_fdt.h>
 #include <linux/serial_core.h>
+#include <linux/vmalloc.h>
 #include <asm/io.h>
 #include <asm/numa.h>
 #include <asm/loongson.h>
@@ -58,6 +59,33 @@ void __iomem *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
 		return ioremap_cache(phys, size);
 }
 
+#define PIO_BASE (unsigned long)PCI_IOBASE
+#define PIO_SIZE ALIGN(ISA_IOSIZE, PAGE_SIZE)
+
+static bool acpi_pio;
+
+/* Add PIO for early access */
+void acpi_add_early_pio(void)
+{
+	if (!acpi_disabled) {
+		acpi_pio = true;
+		ioremap_page_range(PIO_BASE, PIO_BASE + PIO_SIZE,
+				LOONGSON_LIO_BASE, pgprot_device(PAGE_KERNEL));
+	}
+}
+
+/* Remove PIO for PCI register */
+void acpi_remove_early_pio(void)
+{
+	if (!acpi_pio)
+		return;
+
+	if (!acpi_disabled) {
+		acpi_pio = false;
+		vunmap_range(PIO_BASE, PIO_BASE + PIO_SIZE);
+	}
+}
+
 #ifdef CONFIG_SMP
 static int set_processor_mask(u32 id, u32 pass)
 {
diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
index a16665c0c1ae..5e441ed23c12 100644
--- a/arch/loongarch/kernel/setup.c
+++ b/arch/loongarch/kernel/setup.c
@@ -538,6 +538,8 @@ static __init int arch_reserve_pio_range(void)
 {
 	struct device_node *np;
 
+	acpi_add_early_pio();
+
 	for_each_node_by_name(np, "isa") {
 		struct of_range range;
 		struct of_range_parser parser;
diff --git a/arch/loongarch/pci/acpi.c b/arch/loongarch/pci/acpi.c
index a6d869e103c1..1a28fe847d47 100644
--- a/arch/loongarch/pci/acpi.c
+++ b/arch/loongarch/pci/acpi.c
@@ -65,6 +65,8 @@ static int acpi_prepare_root_resources(struct acpi_pci_root_info *ci)
 	struct resource_entry *entry, *tmp;
 	struct acpi_device *device = ci->bridge;
 
+	acpi_remove_early_pio();
+
 	status = acpi_pci_probe_root_resources(ci);
 	if (status > 0) {
 		acpi_evaluate_integer(device->handle, "PCIH", NULL, &pci_h);
-- 
2.52.0

