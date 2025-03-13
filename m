Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D594263C6A
	for <loongarch@lists.linux.dev>; Thu, 13 Mar 2025 09:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741856848; cv=none; b=HNwQmB6bTMuQNrwUCXptVnI9KEYPzCw32fUitoXDIdvg1zcJ7u/TcdAFTuwifUGVm6OxySnf9ef5s3xKvJ1oGc+E8uBk9/8/2kimeqsh8QsUbnXFPJYsOWEYwXeEsubC1pD/ADhs6lJ5oK60eJQ6D32fIq5KQKPTzMvSGAl8Mdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741856848; c=relaxed/simple;
	bh=8JmJW98ciVKFEtP59T+5FqjzkoZUzYd6jTT9+BV4zyg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rZnDoWJg2uRoAcwiWl/mt1tMMIDJffG5Oi0PbsLBDQ7qkLXxaCdruZwuOrf4zQXtjYO59TgjZgIOpUepLCwe8ogKuj+LIsXCAlpU30C7byUPJ/XdjJNA+YVkAPzpDFecZeD/OdXp5wPVnLs+TT4LidtuuEatsngUTWB/F1CxB5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.40.54.90])
	by gateway (Coremail) with SMTP id _____8CxbWtNoNJnAr6UAA--.56569S3;
	Thu, 13 Mar 2025 17:07:25 +0800 (CST)
Received: from localhost.localdomain (unknown [10.40.54.90])
	by front1 (Coremail) with SMTP id qMiowMBx3MRLoNJnbjpIAA--.3773S2;
	Thu, 13 Mar 2025 17:07:23 +0800 (CST)
From: Qunqin Zhao <zhaoqunqin@loongson.cn>
To: lee@kernel.org,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	peterhuewe@gmx.de,
	jarkko@kernel.org
Cc: linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-crypto@vger.kernel.org,
	jgg@ziepe.ca,
	linux-integrity@vger.kernel.org,
	pmenzel@molgen.mpg.de,
	Qunqin Zhao <zhaoqunqin@loongson.cn>,
	Yinggang Gu <guyinggang@loongson.cn>
Subject: [PATCH v5 5/6] tpm: Add a driver for Loongson TPM device
Date: Thu, 13 Mar 2025 17:07:01 +0800
Message-Id: <20250313090702.21300-1-zhaoqunqin@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBx3MRLoNJnbjpIAA--.3773S2
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxAr4Dtw1xXw1ktFyrXw1kWFX_yoWrKw4UpF
	45Ca4akr45JFWUt39xJF4DuF9xJ34kXFWUKrW7Jas8ur90yas8WFsrtFyUJ3W3ZrWkGrya
	qFZa9rW3WF15AwcCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWrXVW3
	AwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
	xGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVW7JVWDJwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0fhLUUUUUU==

Loongson security engine supports random number generation, hash,
symmetric encryption and asymmetric encryption. Based on these
encryption functions, TPM2 have been implemented in the Loongson
security engine firmware. This driver is responsible for copying data
into the memory visible to the firmware and receiving data from the
firmware.

Co-developed-by: Yinggang Gu <guyinggang@loongson.cn>
Signed-off-by: Yinggang Gu <guyinggang@loongson.cn>
Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>
---
v5: None
v4: Prefix all with tpm_lsse instead of tpm.
    Removed MODULE_AUTHOR fields.

v3: Added reminder about Loongson security engine to git log.

 drivers/char/tpm/Kconfig    |   9 ++++
 drivers/char/tpm/Makefile   |   1 +
 drivers/char/tpm/tpm_lsse.c | 103 ++++++++++++++++++++++++++++++++++++
 3 files changed, 113 insertions(+)
 create mode 100644 drivers/char/tpm/tpm_lsse.c

diff --git a/drivers/char/tpm/Kconfig b/drivers/char/tpm/Kconfig
index 0fc9a510e0..56d0417065 100644
--- a/drivers/char/tpm/Kconfig
+++ b/drivers/char/tpm/Kconfig
@@ -225,5 +225,14 @@ config TCG_FTPM_TEE
 	help
 	  This driver proxies for firmware TPM running in TEE.
 
+config TCG_LSSE
+	tristate "Loongson TPM Interface"
+	depends on MFD_LS6000SE
+	help
+	  If you want to make Loongson TPM support available, say Yes and
+	  it will be accessible from within Linux. To compile this
+	  driver as a module, choose M here; the module will be called
+	  tpm_lsse.
+
 source "drivers/char/tpm/st33zp24/Kconfig"
 endif # TCG_TPM
diff --git a/drivers/char/tpm/Makefile b/drivers/char/tpm/Makefile
index 9bb142c752..bf2280352d 100644
--- a/drivers/char/tpm/Makefile
+++ b/drivers/char/tpm/Makefile
@@ -44,3 +44,4 @@ obj-$(CONFIG_TCG_XEN) += xen-tpmfront.o
 obj-$(CONFIG_TCG_CRB) += tpm_crb.o
 obj-$(CONFIG_TCG_VTPM_PROXY) += tpm_vtpm_proxy.o
 obj-$(CONFIG_TCG_FTPM_TEE) += tpm_ftpm_tee.o
+obj-$(CONFIG_TCG_LSSE) += tpm_lsse.o
diff --git a/drivers/char/tpm/tpm_lsse.c b/drivers/char/tpm/tpm_lsse.c
new file mode 100644
index 0000000000..b476309c97
--- /dev/null
+++ b/drivers/char/tpm/tpm_lsse.c
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2025 Loongson Technology Corporation Limited. */
+
+#include <linux/device.h>
+#include <linux/mfd/ls6000se.h>
+#include <linux/platform_device.h>
+#include <linux/wait.h>
+
+#include "tpm.h"
+
+struct tpm_lsse_msg {
+	u32 cmd;
+	u32 data_off;
+	u32 data_len;
+	u32 info[5];
+};
+
+struct tpm_lsse_dev {
+	struct lsse_ch *se_ch;
+	struct completion tpm_lsse_completion;
+};
+
+static void tpm_lsse_complete(struct lsse_ch *ch)
+{
+	struct tpm_lsse_dev *td = ch->priv;
+
+	complete(&td->tpm_lsse_completion);
+}
+
+static int tpm_lsse_recv(struct tpm_chip *chip, u8 *buf, size_t count)
+{
+	struct tpm_lsse_dev *td = dev_get_drvdata(&chip->dev);
+	struct tpm_lsse_msg *rmsg;
+	int sig;
+
+	sig = wait_for_completion_interruptible(&td->tpm_lsse_completion);
+	if (sig)
+		return sig;
+
+	rmsg = td->se_ch->rmsg;
+	memcpy(buf, td->se_ch->data_buffer, rmsg->data_len);
+
+	return rmsg->data_len;
+}
+
+static int tpm_lsse_send(struct tpm_chip *chip, u8 *buf, size_t count)
+{
+	struct tpm_lsse_dev *td = dev_get_drvdata(&chip->dev);
+	struct tpm_lsse_msg *smsg = td->se_ch->smsg;
+
+	memcpy(td->se_ch->data_buffer, buf, count);
+	smsg->data_len = count;
+
+	return se_send_ch_requeset(td->se_ch);
+}
+
+static const struct tpm_class_ops tpm_lsse_ops = {
+	.flags = TPM_OPS_AUTO_STARTUP,
+	.recv = tpm_lsse_recv,
+	.send = tpm_lsse_send,
+};
+
+static int tpm_lsse_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct tpm_lsse_msg *smsg;
+	struct tpm_lsse_dev *td;
+	struct tpm_chip *chip;
+
+	td = devm_kzalloc(dev, sizeof(struct tpm_lsse_dev), GFP_KERNEL);
+	if (!td)
+		return -ENOMEM;
+
+	init_completion(&td->tpm_lsse_completion);
+	td->se_ch = se_init_ch(dev->parent, SE_CH_TPM, PAGE_SIZE,
+			       2 * sizeof(struct tpm_lsse_msg), td,
+			       tpm_lsse_complete);
+	if (!td->se_ch)
+		return -ENODEV;
+	smsg = td->se_ch->smsg;
+	smsg->cmd = SE_CMD_TPM;
+	smsg->data_off = td->se_ch->off;
+
+	chip = tpmm_chip_alloc(dev, &tpm_lsse_ops);
+	if (IS_ERR(chip))
+		return PTR_ERR(chip);
+	chip->flags = TPM_CHIP_FLAG_TPM2 | TPM_CHIP_FLAG_IRQ;
+	dev_set_drvdata(&chip->dev, td);
+
+	return tpm_chip_register(chip);
+}
+
+static struct platform_driver tpm_lsse_driver = {
+	.probe   = tpm_lsse_probe,
+	.driver  = {
+		.name  = "ls6000se-tpm",
+	},
+};
+module_platform_driver(tpm_lsse_driver);
+
+MODULE_ALIAS("platform:ls6000se-tpm");
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Loongson TPM driver");
-- 
2.43.0

