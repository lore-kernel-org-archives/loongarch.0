Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DB1B33DED1
	for <loongarch@lists.linux.dev>; Thu, 30 Jul 2026 06:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785393954; cv=none; b=MneGctX31DZJoddlpmkuoNioP3xOK8e/lIaPpDn2Z9WCuLSUiLcc858yIZ5D3/2JnrDBT0nwX+frHqAuI7icER6RO/3NbwreEIxGQqvyikaOGTggrcymEs4dmNu5gH8OHV7NSJkG+CkUFbecpCJr8MHLZS9nTlh/Tj8MbybrG6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785393954; c=relaxed/simple;
	bh=PdPkFaOhhCBBPlfTPH5dcG1V7OQFmrg3p2bGSZsOK40=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Xw10DG2ERJwtGpihUmlEP09+5DiqttVQS6uo8IAaWJ5fgqFC7UTIYXMQK3CBXW0lpbmyIgVDAoXa4qBY7DSdS1uIKyXiXBZEAZVwvHiwmEMKK8LBNjtzo/9p7UuWFu4O1JtzCfWa/5qrTmrm5Xdctn56fZFqOYSsKEUPLyd1jAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.40.54.123])
	by gateway (Coremail) with SMTP id _____8AxqKAU82pqpMQIAA--.6612S3;
	Thu, 30 Jul 2026 14:45:41 +0800 (CST)
Received: from localhost.localdomain (unknown [10.40.54.123])
	by front1 (Coremail) with SMTP id qMiowJAxSsQU82pq8IUdAA--.41200S2;
	Thu, 30 Jul 2026 14:45:40 +0800 (CST)
From: Qunqin Zhao <zhaoqunqin@loongson.cn>
To: bp@alien8.de
Cc: tony.luck@intel.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Wang Jinwei <wangjinwei@loongson.cn>,
	Yulong Wang <wangyulong@loongson.cn>,
	Dongyan Qian <qiandongyan@loongson.cn>,
	Chao Li <lichao@loongson.cn>,
	Qunqin Zhao <zhaoqunqin@loongson.cn>
Subject: [PATCH 1/3] EDAC/loongson: Encode node and MC info into mc_idx
Date: Thu, 30 Jul 2026 14:30:33 +0800
Message-ID: <20260730063035.230686-1-zhaoqunqin@loongson.cn>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxSsQU82pq8IUdAA--.41200S2
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxGF4ftr18trWUGF1UXr1kZwc_yoWrtr18pF
	47u3Z0qrW5trnxuanYyr1UAF1akFn5Ka9Fq392v3y8Cry2yw1kXFyftFy2yF9xCryrGFyU
	Xas3Kws7ua1DJFcCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1QVy3UUUUU==

From: Wang Jinwei <wangjinwei@loongson.cn>

On Loongson multi-node systems, memory controllers are distributed
across multiple nodes. Encode node and MC information into mc_idx
so that sysfs entries uniquely identify each controller.

The driver gets mc-idx from ACPI _DSD property 'mc-idx' if firmware
provides it. If not, it falls back to edac_device_alloc_index() for
legacy firmware compatibility.

The number of memory controllers per node (mc-per-node) is obtained
from firmware via ACPI _DSD property, with a default of 4 for
backward compatibility. The node and MC IDs are decoded from mc_idx:
     node = mc_idx / mc_per_node
     mc = mc_idx % mc_per_node

For example, with mc-per-node=4:
     mc-idx 0-3   -> node0 mc0-mc3
     mc-idx 4-7   -> node1 mc0-mc3
     ...
     mc-idx 28-31 -> node7 mc0-mc3

The dmesg output looks like this：
Before: (no _DSD mc-idx)
EDAC MC3: 510 CE error on MC#3Channel#0_DIMM#0 (channel:0 slot:0
page:0x0 offset:0x0 grain:8 syndrome:0x0)

After: (_DSD mc-idx)
EDAC MC3: 510 CE error on MC#3Channel#0_DIMM#0 (channel:0 slot:0
page:0x0 offset:0x0 grain:8 syndrome:0x0 - node:0 mc:3)

Cc: Yulong Wang <wangyulong@loongson.cn>
Cc: Dongyan Qian <qiandongyan@loongson.cn>
Cc: Chao Li <lichao@loongson.cn>
Signed-off-by: Wang Jinwei <wangjinwei@loongson.cn>
Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>
---
 drivers/edac/loongson_edac.c | 38 +++++++++++++++++++++++++++++++-----
 1 file changed, 33 insertions(+), 5 deletions(-)

diff --git a/drivers/edac/loongson_edac.c b/drivers/edac/loongson_edac.c
index 38745800ed..f2452e98f5 100644
--- a/drivers/edac/loongson_edac.c
+++ b/drivers/edac/loongson_edac.c
@@ -9,6 +9,7 @@
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include "edac_module.h"
 
 #define ECC_CS_COUNT_REG	0x18
@@ -23,6 +24,8 @@ struct loongson_edac_pvt {
 	 * register state.
 	 */
 	int last_ce_count;
+	int mc_per_node;
+	bool mc_idx_valid;
 };
 
 static int read_ecc(struct mem_ctl_info *mci)
@@ -44,7 +47,8 @@ static int read_ecc(struct mem_ctl_info *mci)
 static void edac_check(struct mem_ctl_info *mci)
 {
 	struct loongson_edac_pvt *pvt = mci->pvt_info;
-	int new, add;
+	char other_detail[64];
+	int new, add, node, mc;
 
 	new = read_ecc(mci);
 	add = new - pvt->last_ce_count;
@@ -52,8 +56,17 @@ static void edac_check(struct mem_ctl_info *mci)
 	if (add <= 0)
 		return;
 
+	if (pvt->mc_idx_valid) {
+		node = mci->mc_idx / pvt->mc_per_node;
+		mc = mci->mc_idx % pvt->mc_per_node;
+		snprintf(other_detail, sizeof(other_detail),
+				"node:%d mc:%d", node, mc);
+	} else {
+		other_detail[0] = '\0';
+	}
+
 	edac_mc_handle_error(HW_EVENT_ERR_CORRECTED, mci, add,
-			     0, 0, 0, 0, 0, -1, "error", "");
+			     0, 0, 0, 0, 0, -1, "error", other_detail);
 }
 
 static void dimm_config_init(struct mem_ctl_info *mci)
@@ -72,20 +85,26 @@ static void dimm_config_init(struct mem_ctl_info *mci)
 	dimm->grain = 8;
 }
 
-static void pvt_init(struct mem_ctl_info *mci, void __iomem *vbase)
+static void pvt_init(struct mem_ctl_info *mci, void __iomem *vbase,
+		bool mc_idx_valid, int mc_per_node)
 {
 	struct loongson_edac_pvt *pvt = mci->pvt_info;
 
 	pvt->ecc_base = vbase;
 	pvt->last_ce_count = read_ecc(mci);
+	pvt->mc_idx_valid = mc_idx_valid;
+	pvt->mc_per_node = mc_per_node;
 }
 
 static int edac_probe(struct platform_device *pdev)
 {
 	struct edac_mc_layer layers[2];
 	struct mem_ctl_info *mci;
+	struct device *dev = &pdev->dev;
 	void __iomem *vbase;
+	u32 mc_per_node;
 	int ret;
+	bool mc_idx_valid;
 
 	vbase = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(vbase))
@@ -102,7 +121,6 @@ static int edac_probe(struct platform_device *pdev)
 	if (mci == NULL)
 		return -ENOMEM;
 
-	mci->mc_idx = edac_device_alloc_index();
 	mci->mtype_cap = MEM_FLAG_RDDR4;
 	mci->edac_ctl_cap = EDAC_FLAG_NONE;
 	mci->edac_cap = EDAC_FLAG_NONE;
@@ -114,7 +132,17 @@ static int edac_probe(struct platform_device *pdev)
 	mci->error_desc.grain = 8;
 	mci->edac_check = edac_check;
 
-	pvt_init(mci, vbase);
+	if (device_property_read_u32(dev, "mc-idx", &mci->mc_idx)) {
+		mci->mc_idx = edac_device_alloc_index();
+		mc_idx_valid = false;
+	} else {
+		mc_idx_valid = true;
+	}
+
+	if (device_property_read_u32(dev, "mc-per-node", &mc_per_node))
+		mc_per_node = 4;
+
+	pvt_init(mci, vbase, mc_idx_valid, mc_per_node);
 	dimm_config_init(mci);
 
 	ret = edac_mc_add_mc(mci);

base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
-- 
2.47.2

