Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDC012FFF81
	for <loongarch@lists.linux.dev>; Wed, 25 Feb 2026 07:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772005273; cv=none; b=uWDe2O/f6ucaIAyk60Ln7NItnPoAiITP+j+2Um/WXsLViBqM3COnI8mXLPJekbRrp8Y+p493BkLb6ua0sU+o1BcEvU7kpySgOrzgQ2QfCUXHPAGpAnsM59snBNI4JLrP43gN5LBZCXYzm/d/aUMnJaiX9oaLI2N2BfE3hsrOD7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772005273; c=relaxed/simple;
	bh=WjQequLv0lmUVpGowGi2C4StTbPuTSudAfWwqribssE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ELz7wcPVAUtrciZRM9zqfdbxWTSrvBKUdKmWlJe8WRJtWCcE+D0XvKlYTKK9qmxMLOlom6UmrD6vd0eL4PIyo05TcC4KM2fVd92Wckg0CmPaSwo+FnSIjutYh6IOo8Xhadoql1WzHt7pifKw5L1qqdBobGBdGwK8rMbR2FqdGvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.227])
	by gateway (Coremail) with SMTP id _____8BxXcOOp55p4f0UAA--.64349S3;
	Wed, 25 Feb 2026 15:41:02 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.227])
	by front1 (Coremail) with SMTP id qMiowJCxGOCIp55pFMRKAA--.9627S3;
	Wed, 25 Feb 2026 15:40:58 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	Keguang Zhang <keguang.zhang@gmail.com>,
	linux-mips@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v3 1/6] dmaengine: loongson: New directory for Loongson DMA controllers drivers
Date: Wed, 25 Feb 2026 15:40:39 +0800
Message-ID: <44578a06151437a1889b51566d72dc7356e03506.1771989596.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1771989595.git.zhoubinbin@loongson.cn>
References: <cover.1771989595.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxGOCIp55pFMRKAA--.9627S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEJCGmejz8BjQAAsK
X-Coremail-Antispam: 1Uk129KBj93XoWxtryUAw1kuryDKw4xAry3WrX_yoWxAr47pF
	s3A3yfurW8tF47A3s5XFyUKry5Aas3Jr9ruay7Z34DurZ7Aa4UZw1kJFyvqr47AryDJFW2
	qa48GrWUCF47GwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY
	6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aV
	CY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8QJ57UUUUU==

Gather the Loongson DMA controllers under drivers/dma/loongson/

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 MAINTAINERS                                   |  3 +-
 drivers/dma/Kconfig                           | 25 ++---------------
 drivers/dma/Makefile                          |  3 +-
 drivers/dma/loongson/Kconfig                  | 28 +++++++++++++++++++
 drivers/dma/loongson/Makefile                 |  3 ++
 .../dma/{ => loongson}/loongson1-apb-dma.c    |  4 +--
 .../dma/{ => loongson}/loongson2-apb-dma.c    |  4 +--
 7 files changed, 40 insertions(+), 30 deletions(-)
 create mode 100644 drivers/dma/loongson/Kconfig
 create mode 100644 drivers/dma/loongson/Makefile
 rename drivers/dma/{ => loongson}/loongson1-apb-dma.c (99%)
 rename drivers/dma/{ => loongson}/loongson2-apb-dma.c (99%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 55af015174a5..e8cd1e2dac13 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14953,7 +14953,7 @@ M:	Binbin Zhou <zhoubinbin@loongson.cn>
 L:	dmaengine@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/dma/loongson,ls2x-apbdma.yaml
-F:	drivers/dma/loongson2-apb-dma.c
+F:	drivers/dma/loongson/loongson2-apb-dma.c
 
 LOONGSON LS2X I2C DRIVER
 M:	Binbin Zhou <zhoubinbin@loongson.cn>
@@ -17721,6 +17721,7 @@ F:	arch/mips/boot/dts/loongson/loongson1*
 F:	arch/mips/configs/loongson1_defconfig
 F:	arch/mips/loongson32/
 F:	drivers/*/*loongson1*
+F:	drivers/dma/loongson/loongson1-apb-dma.c
 F:	drivers/mtd/nand/raw/loongson-nand-controller.c
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
 F:	sound/soc/loongson/loongson1_ac97.c
diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index 66cda7cc9f7a..1b84c5b11654 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -376,29 +376,6 @@ config K3_DMA
 	  Support the DMA engine for Hisilicon K3 platform
 	  devices.
 
-config LOONGSON1_APB_DMA
-	tristate "Loongson1 APB DMA support"
-	depends on MACH_LOONGSON32 || COMPILE_TEST
-	select DMA_ENGINE
-	select DMA_VIRTUAL_CHANNELS
-	help
-	  This selects support for the APB DMA controller in Loongson1 SoCs,
-	  which is required by Loongson1 NAND and audio support.
-
-config LOONGSON2_APB_DMA
-	tristate "Loongson2 APB DMA support"
-	depends on LOONGARCH || COMPILE_TEST
-	select DMA_ENGINE
-	select DMA_VIRTUAL_CHANNELS
-	help
-	  Support for the Loongson2 APB DMA controller driver. The
-	  DMA controller is having single DMA channel which can be
-	  configured for different peripherals like audio, nand, sdio
-	  etc which is in APB bus.
-
-	  This DMA controller transfers data from memory to peripheral fifo.
-	  It does not support memory to memory data transfer.
-
 config LPC18XX_DMAMUX
 	bool "NXP LPC18xx/43xx DMA MUX for PL080"
 	depends on ARCH_LPC18XX || COMPILE_TEST
@@ -774,6 +751,8 @@ source "drivers/dma/fsl-dpaa2-qdma/Kconfig"
 
 source "drivers/dma/lgm/Kconfig"
 
+source "drivers/dma/loongson/Kconfig"
+
 source "drivers/dma/stm32/Kconfig"
 
 # clients
diff --git a/drivers/dma/Makefile b/drivers/dma/Makefile
index a54d7688392b..963b10494ee5 100644
--- a/drivers/dma/Makefile
+++ b/drivers/dma/Makefile
@@ -49,8 +49,6 @@ obj-$(CONFIG_INTEL_IDMA64) += idma64.o
 obj-$(CONFIG_INTEL_IOATDMA) += ioat/
 obj-y += idxd/
 obj-$(CONFIG_K3_DMA) += k3dma.o
-obj-$(CONFIG_LOONGSON1_APB_DMA) += loongson1-apb-dma.o
-obj-$(CONFIG_LOONGSON2_APB_DMA) += loongson2-apb-dma.o
 obj-$(CONFIG_LPC18XX_DMAMUX) += lpc18xx-dmamux.o
 obj-$(CONFIG_LPC32XX_DMAMUX) += lpc32xx-dmamux.o
 obj-$(CONFIG_MILBEAUT_HDMAC) += milbeaut-hdmac.o
@@ -87,6 +85,7 @@ obj-$(CONFIG_FSL_DPAA2_QDMA) += fsl-dpaa2-qdma/
 obj-$(CONFIG_INTEL_LDMA) += lgm/
 
 obj-y += amd/
+obj-y += loongson/
 obj-y += mediatek/
 obj-y += qcom/
 obj-y += stm32/
diff --git a/drivers/dma/loongson/Kconfig b/drivers/dma/loongson/Kconfig
new file mode 100644
index 000000000000..9dbdaef5a59f
--- /dev/null
+++ b/drivers/dma/loongson/Kconfig
@@ -0,0 +1,28 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Loongson DMA controllers drivers
+#
+if MACH_LOONGSON32 || MACH_LOONGSON64 || COMPILE_TEST
+
+config LOONGSON1_APB_DMA
+	tristate "Loongson1 APB DMA support"
+	select DMA_ENGINE
+	select DMA_VIRTUAL_CHANNELS
+	help
+	  This selects support for the APB DMA controller in Loongson1 SoCs,
+	  which is required by Loongson1 NAND and audio support.
+
+config LOONGSON2_APB_DMA
+	tristate "Loongson2 APB DMA support"
+	select DMA_ENGINE
+	select DMA_VIRTUAL_CHANNELS
+	help
+	  Support for the Loongson2 APB DMA controller driver. The
+	  DMA controller is having single DMA channel which can be
+	  configured for different peripherals like audio, nand, sdio
+	  etc which is in APB bus.
+
+	  This DMA controller transfers data from memory to peripheral fifo.
+	  It does not support memory to memory data transfer.
+
+endif
diff --git a/drivers/dma/loongson/Makefile b/drivers/dma/loongson/Makefile
new file mode 100644
index 000000000000..6cdd08065e92
--- /dev/null
+++ b/drivers/dma/loongson/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_LOONGSON1_APB_DMA) += loongson1-apb-dma.o
+obj-$(CONFIG_LOONGSON2_APB_DMA) += loongson2-apb-dma.o
diff --git a/drivers/dma/loongson1-apb-dma.c b/drivers/dma/loongson/loongson1-apb-dma.c
similarity index 99%
rename from drivers/dma/loongson1-apb-dma.c
rename to drivers/dma/loongson/loongson1-apb-dma.c
index 2e347aba9af8..89786cbd20ab 100644
--- a/drivers/dma/loongson1-apb-dma.c
+++ b/drivers/dma/loongson/loongson1-apb-dma.c
@@ -16,8 +16,8 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
-#include "dmaengine.h"
-#include "virt-dma.h"
+#include "../dmaengine.h"
+#include "../virt-dma.h"
 
 /* Loongson-1 DMA Control Register */
 #define LS1X_DMA_CTRL		0x0
diff --git a/drivers/dma/loongson2-apb-dma.c b/drivers/dma/loongson/loongson2-apb-dma.c
similarity index 99%
rename from drivers/dma/loongson2-apb-dma.c
rename to drivers/dma/loongson/loongson2-apb-dma.c
index b981475e6779..fc7d9f4a96ec 100644
--- a/drivers/dma/loongson2-apb-dma.c
+++ b/drivers/dma/loongson/loongson2-apb-dma.c
@@ -17,8 +17,8 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
-#include "dmaengine.h"
-#include "virt-dma.h"
+#include "../dmaengine.h"
+#include "../virt-dma.h"
 
 /* Global Configuration Register */
 #define LDMA_ORDER_ERG		0x0
-- 
2.52.0

