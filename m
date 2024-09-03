Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBFD11CDA10
	for <loongarch@lists.linux.dev>; Tue,  3 Sep 2024 01:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725328430; cv=none; b=BENFqKGs8IFQMYo3lz0ng8ykuMbneLxDsoxdsKVG8KEHqY6rVFgezDsDwE4onvs05eBnaYdvHRo3zCvfEEPfiycB8EjdugCX2ZMD6ltkxseJY8bUKEQHZIeLl2zgtXi84V1aXl+l+1AiYBbmj14yGg2rQVyF5klA5vAy4WKJ7n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725328430; c=relaxed/simple;
	bh=j1vKi5WDknpNMuwP5yhIaIBPCUaQcfO8SYDwDttVxpo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bAw5UCAjzuAemZySg1ZMRjG/2xpmiqGrF19tRdQbEQOi6AFKcmHiASQe8uK+LvY3Kmd5afW1hJtIl8cRlKDr9ytGXIUX2GEwqUFdd+RcvAyIV3i2xCP51mYpX1UYJKEgPpUPlL5icPDcOmXHxKr+ld5+Wo06/C4olhv39Y6SORU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.40.54.90])
	by gateway (Coremail) with SMTP id _____8Cx+ekkbNZmpb4oAA--.13695S3;
	Tue, 03 Sep 2024 09:53:40 +0800 (CST)
Received: from localhost.localdomain (unknown [10.40.54.90])
	by front2 (Coremail) with SMTP id qciowMDxvscdbNZmRXYEAA--.13550S4;
	Tue, 03 Sep 2024 09:53:39 +0800 (CST)
From: Zhao Qunqin <zhaoqunqin@loongson.cn>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	chenhuacai@kernel.org
Cc: linux-edac@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@xen0n.name,
	bp@alien8.de,
	tony.luck@intel.com,
	james.morse@arm.com,
	mchehab@kernel.org,
	rric@kernel.org,
	loongarch@lists.linux.dev,
	Zhao Qunqin <zhaoqunqin@loongson.cn>
Subject: [PATCH v2 2/2] Loongarch: EDAC driver for loongson memory controller
Date: Tue,  3 Sep 2024 09:53:54 +0800
Message-Id: <20240903015354.9443-3-zhaoqunqin@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20240903015354.9443-1-zhaoqunqin@loongson.cn>
References: <20240903015354.9443-1-zhaoqunqin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qciowMDxvscdbNZmRXYEAA--.13550S4
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW3Gr1UtF1DAr1UCw1fAF13trc_yoWxtr1Dpr
	13Aa4fGr4rtr15uws3ArWDZF15Awsavayav3y3C3yYkryDAryDu3s5tFy2yF1DCryDJrW3
	Xa4rKa17CF4DG3XCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_
	WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
	xGrwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jz-eOUUUUU=

Report single bit errors (CE) only.

Signed-off-by: Zhao Qunqin <zhaoqunqin@loongson.cn>
---
 MAINTAINERS                  |   1 +
 arch/loongarch/Kconfig       |   1 +
 drivers/edac/Kconfig         |   8 ++
 drivers/edac/Makefile        |   1 +
 drivers/edac/ls3a5000_edac.c | 187 +++++++++++++++++++++++++++++++++++
 5 files changed, 198 insertions(+)
 create mode 100644 drivers/edac/ls3a5000_edac.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 6cc8cfc8f..b43f82279 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13242,6 +13242,7 @@ M:	Zhao Qunqin <zhaoqunqin@loongson.cn>
 L:	linux-edac@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/edac/loongson,ls3a5000-mc-edac.yaml
+F:	drivers/edac/ls3a5000_edac.c
 
 LSILOGIC MPT FUSION DRIVERS (FC/SAS/SPI)
 M:	Sathya Prakash <sathya.prakash@broadcom.com>
diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 70f169210..348030c24 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -182,6 +182,7 @@ config LOONGARCH
 	select PCI_QUIRKS
 	select PERF_USE_VMALLOC
 	select RTC_LIB
+	select EDAC_SUPPORT
 	select SPARSE_IRQ
 	select SYSCTL_ARCH_UNALIGN_ALLOW
 	select SYSCTL_ARCH_UNALIGN_NO_WARN
diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
index 16c8de505..2d10256f0 100644
--- a/drivers/edac/Kconfig
+++ b/drivers/edac/Kconfig
@@ -573,5 +573,13 @@ config EDAC_VERSAL
 	  Support injecting both correctable and uncorrectable errors
 	  for debugging purposes.
 
+config EDAC_LS3A5000
+	tristate "Ls3a5000 Memory Controller"
+	depends on LOONGARCH || COMPILE_TEST
+	help
+	  Support for error detection and correction on the ls3a5000 memory
+	  controller. This driver report single bit errors (CE) only.
+	  Ls3c5000l, ls3c5000, ls3d5000, ls3a6000 and ls3c6000 are compatible
+	  with ls3a5000.
 
 endif # EDAC
diff --git a/drivers/edac/Makefile b/drivers/edac/Makefile
index 4edfb83ff..0974e3fa6 100644
--- a/drivers/edac/Makefile
+++ b/drivers/edac/Makefile
@@ -89,3 +89,4 @@ obj-$(CONFIG_EDAC_DMC520)		+= dmc520_edac.o
 obj-$(CONFIG_EDAC_NPCM)			+= npcm_edac.o
 obj-$(CONFIG_EDAC_ZYNQMP)		+= zynqmp_edac.o
 obj-$(CONFIG_EDAC_VERSAL)		+= versal_edac.o
+obj-$(CONFIG_EDAC_LS3A5000)		+= ls3a5000_edac.o
diff --git a/drivers/edac/ls3a5000_edac.c b/drivers/edac/ls3a5000_edac.c
new file mode 100644
index 000000000..c68fd7c5f
--- /dev/null
+++ b/drivers/edac/ls3a5000_edac.c
@@ -0,0 +1,187 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024 Loongson Technology Corporation Limited.
+ */
+
+#include <linux/edac.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/platform_device.h>
+
+#include "edac_module.h"
+
+enum ecc_index {
+	ECC_SET = 0,
+	ECC_RESERVED,
+	ECC_COUNT,
+	ECC_CS_COUNT,
+	ECC_CODE,
+	ECC_ADDR,
+	ECC_DATA0,
+	ECC_DATA1,
+	ECC_DATA2,
+	ECC_DATA3,
+};
+
+struct loongson_edac_pvt {
+	u64 *ecc_base;
+	int last_ce_count;
+};
+
+static void loongson_update_ce_count(struct mem_ctl_info *mci,
+					int chan,
+					int new)
+{
+	int add;
+	struct loongson_edac_pvt *pvt = mci->pvt_info;
+
+	add = new - pvt->last_ce_count;
+
+	/* Store the new value */
+	pvt->last_ce_count = new;
+
+	/* device resume or any other exceptions*/
+	if (add < 0)
+		return;
+
+	/*updated the edac core */
+	if (add != 0) {
+		edac_mc_handle_error(HW_EVENT_ERR_CORRECTED, mci, add,
+					0, 0, 0,
+					chan, 0, -1, "error", "");
+		edac_mc_printk(mci, KERN_INFO, "add: %d", add);
+	}
+}
+
+static int loongson_read_ecc(struct mem_ctl_info *mci)
+{
+	u64 ecc;
+	int cs = 0;
+	struct loongson_edac_pvt *pvt = mci->pvt_info;
+
+	if (!pvt->ecc_base)
+		return pvt->last_ce_count;
+
+	ecc = pvt->ecc_base[ECC_CS_COUNT];
+	cs += ecc & 0xff;		// cs0
+	cs += (ecc >> 8) & 0xff;	// cs1
+	cs += (ecc >> 16) & 0xff;	// cs2
+	cs += (ecc >> 24) & 0xff;	// cs3
+
+	return cs;
+}
+
+static void loongson_edac_check(struct mem_ctl_info *mci)
+{
+	loongson_update_ce_count(mci, 0, loongson_read_ecc(mci));
+}
+
+static int get_dimm_config(struct mem_ctl_info *mci)
+{
+	u32 size, npages;
+	struct dimm_info *dimm;
+
+	/* size not used */
+	size = -1;
+	npages = MiB_TO_PAGES(size);
+
+	dimm = edac_get_dimm(mci, 0, 0, 0);
+	dimm->nr_pages = npages;
+	snprintf(dimm->label, sizeof(dimm->label),
+			"MC#%uChannel#%u_DIMM#%u",
+			mci->mc_idx, 0, 0);
+	dimm->grain = 8;
+
+	return 0;
+}
+
+static void loongson_pvt_init(struct mem_ctl_info *mci, u64 *vbase)
+{
+	struct loongson_edac_pvt *pvt = mci->pvt_info;
+
+	pvt->ecc_base = vbase;
+	pvt->last_ce_count = loongson_read_ecc(mci);
+}
+
+static int loongson_edac_probe(struct platform_device *pdev)
+{
+	struct resource *rs;
+	struct mem_ctl_info *mci;
+	struct edac_mc_layer layers[2];
+	struct loongson_edac_pvt *pvt;
+	u64 *vbase = NULL;
+
+	rs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	/* not return if can not find resource or resource start equals NULL */
+	if (rs && rs->start) {
+		vbase = devm_ioremap_resource(&pdev->dev, rs);
+		if (IS_ERR(vbase))
+			return PTR_ERR(vbase);
+	}
+
+	/* allocate a new MC control structure */
+	layers[0].type = EDAC_MC_LAYER_CHANNEL;
+	layers[0].size = 1;
+	layers[0].is_virt_csrow = false;
+	layers[1].type = EDAC_MC_LAYER_SLOT;
+	layers[1].size = 1;
+	layers[1].is_virt_csrow = true;
+	mci = edac_mc_alloc(0, ARRAY_SIZE(layers), layers, sizeof(*pvt));
+	if (mci == NULL)
+		return -ENOMEM;
+
+	edac_dbg(0, "MC: mci = %p\n", mci);
+
+	mci->mc_idx = edac_device_alloc_index();
+	mci->mtype_cap = MEM_FLAG_RDDR4;
+	mci->edac_ctl_cap = EDAC_FLAG_NONE;
+	mci->edac_cap = EDAC_FLAG_NONE;
+	mci->mod_name = "loongson_edac.c";
+	mci->ctl_name = "loongson_edac_ctl";
+	mci->dev_name = "loongson_edac_dev";
+	mci->ctl_page_to_phys = NULL;
+	mci->pdev = &pdev->dev;
+	mci->error_desc.grain = 8;
+	/* Set the function pointer to an actual operation function */
+	mci->edac_check = loongson_edac_check;
+
+	loongson_pvt_init(mci, vbase);
+	get_dimm_config(mci);
+
+	if (edac_mc_add_mc(mci)) {
+		edac_dbg(0, "MC: failed edac_mc_add_mc()\n");
+		edac_mc_free(mci);
+	}
+	edac_op_state = EDAC_OPSTATE_POLL;
+
+	return 0;
+}
+
+static void loongson_edac_remove(struct platform_device *pdev)
+{
+	struct mem_ctl_info *mci = edac_mc_del_mc(&pdev->dev);
+
+	if (mci)
+		edac_mc_free(mci);
+}
+
+static const struct of_device_id loongson_edac_of_match[] = {
+	{ .compatible = "loongson,ls3a5000-mc-edac", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, loongson_edac_of_match);
+
+static struct platform_driver loongson_edac_driver = {
+	.probe		= loongson_edac_probe,
+	.remove		= loongson_edac_remove,
+	.driver		= {
+		.name	= "ls-mc-edac",
+		.of_match_table = loongson_edac_of_match,
+	},
+};
+
+module_platform_driver(loongson_edac_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Zhao Qunqin <zhaoqunqin@loongson.cn>\n");
+MODULE_DESCRIPTION("EDAC driver for loongson memory controller");
-- 
2.43.0

