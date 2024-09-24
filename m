Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FFC017993
	for <loongarch@lists.linux.dev>; Tue, 24 Sep 2024 06:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727160170; cv=none; b=U7HyuymbGOz7N8mLXvXGUjcqo8yzPBlJrziJI2ixpVADcJpTY2raTmSlQ4oBwQ27A3bX0u2pEEdtGvzyma3NwXOLqfarWHUpOfbazAdXidP46xV6/x24C8caKzTAqprFn/AwrqkmCqGHfoev9JfpfHZia4hZmx8sBzaKyFg0sXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727160170; c=relaxed/simple;
	bh=YiKB0+kmKkPkM/eKl60e9aZ8La81M8RYf4zBkii6KMs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dPpkKp5kLCuMwmLcH15Gt/PtOHUAML9Zv4rqznf58WgwmDaohytnBprMiKr59sx4sVbhv5eP6/1Zm5zAia8MHhp/lCtPADVmZrXEkGaP090yDn11RIE7EPulW6YACEjZBJ42TpOUc0+FE0/5To4e0sGI7bmk4diuRSjwVsHMisg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.38])
	by gateway (Coremail) with SMTP id _____8DxWOllX_JmVMINAA--.30728S3;
	Tue, 24 Sep 2024 14:42:45 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.38])
	by front1 (Coremail) with SMTP id qMiowMBxHeRjX_JmzqANAA--.12048S2;
	Tue, 24 Sep 2024 14:42:44 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Vinod Koul <vkoul@kernel.org>,
	dmaengine@vger.kernel.org
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH] dmaengine: loongson2-apb: Rename the prefix ls2x to loongson2
Date: Tue, 24 Sep 2024 14:42:41 +0800
Message-ID: <20240924064241.2414629-1-zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxHeRjX_JmzqANAA--.12048S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW3Jry3uF1fGr4xGF1UXF4xuFX_yoW7WFW8pa
	1fZw4xGryUtF43Ar98JFyq9Fy3Zas7Jr9rWa17Aw1j9rZ7Zw1UZw1DtF92vw4DA397XFWI
	vF93urWUCF43GwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jUsqXUUUUU=

Since commit e06c43231214 ("dmaengine: Loongson1: Add Loongson-1 APB DMA
driver"), the Loongson-1 dma controller was added.

Unfortunately their naming has not been standardized, as CPUs belonging
to the same Loongson family, we expect to standardize the naming for
ease of understanding.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 MAINTAINERS                                   |  4 +--
 arch/loongarch/configs/loongson3_defconfig    |  2 +-
 drivers/dma/Kconfig                           | 28 +++++++++----------
 drivers/dma/Makefile                          |  2 +-
 .../{ls2x-apb-dma.c => loongson2-apb-dma.c}   |  4 +--
 5 files changed, 20 insertions(+), 20 deletions(-)
 rename drivers/dma/{ls2x-apb-dma.c => loongson2-apb-dma.c} (99%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 231a15296569..19886480c20b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13184,12 +13184,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/gpio/loongson,ls-gpio.yaml
 F:	drivers/gpio/gpio-loongson-64bit.c
 
-LOONGSON LS2X APB DMA DRIVER
+LOONGSON-2 APB DMA DRIVER
 M:	Binbin Zhou <zhoubinbin@loongson.cn>
 L:	dmaengine@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/dma/loongson,ls2x-apbdma.yaml
-F:	drivers/dma/ls2x-apb-dma.c
+F:	drivers/dma/loongson2-apb-dma.c
 
 LOONGSON LS2X I2C DRIVER
 M:	Binbin Zhou <zhoubinbin@loongson.cn>
diff --git a/arch/loongarch/configs/loongson3_defconfig b/arch/loongarch/configs/loongson3_defconfig
index b4252c357c8e..4d37494dce98 100644
--- a/arch/loongarch/configs/loongson3_defconfig
+++ b/arch/loongarch/configs/loongson3_defconfig
@@ -776,7 +776,7 @@ CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_EFI=y
 CONFIG_RTC_DRV_LOONGSON=y
 CONFIG_DMADEVICES=y
-CONFIG_LS2X_APB_DMA=y
+CONFIG_LOONGSON2_APB_DMA=y
 CONFIG_UDMABUF=y
 CONFIG_DMABUF_HEAPS=y
 CONFIG_DMABUF_HEAPS_SYSTEM=y
diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index d9ec1e69e428..e994d6e0779e 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -378,6 +378,20 @@ config LOONGSON1_APB_DMA
 	  This selects support for the APB DMA controller in Loongson1 SoCs,
 	  which is required by Loongson1 NAND and audio support.
 
+config LOONGSON2_APB_DMA
+	tristate "Loongson2 APB DMA support"
+	depends on LOONGARCH || COMPILE_TEST
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
 config LPC18XX_DMAMUX
 	bool "NXP LPC18xx/43xx DMA MUX for PL080"
 	depends on ARCH_LPC18XX || COMPILE_TEST
@@ -396,20 +410,6 @@ config LPC32XX_DMAMUX
 	  Support for PL080 multiplexed DMA request lines on
 	  LPC32XX platrofm.
 
-config LS2X_APB_DMA
-	tristate "Loongson LS2X APB DMA support"
-	depends on LOONGARCH || COMPILE_TEST
-	select DMA_ENGINE
-	select DMA_VIRTUAL_CHANNELS
-	help
-	  Support for the Loongson LS2X APB DMA controller driver. The
-	  DMA controller is having single DMA channel which can be
-	  configured for different peripherals like audio, nand, sdio
-	  etc which is in APB bus.
-
-	  This DMA controller transfers data from memory to peripheral fifo.
-	  It does not support memory to memory data transfer.
-
 config MCF_EDMA
 	tristate "Freescale eDMA engine support, ColdFire mcf5441x SoCs"
 	depends on M5441x || (COMPILE_TEST && FSL_EDMA=n)
diff --git a/drivers/dma/Makefile b/drivers/dma/Makefile
index ad6a03c052ec..5b2a52f4f2ee 100644
--- a/drivers/dma/Makefile
+++ b/drivers/dma/Makefile
@@ -50,9 +50,9 @@ obj-$(CONFIG_INTEL_IOATDMA) += ioat/
 obj-y += idxd/
 obj-$(CONFIG_K3_DMA) += k3dma.o
 obj-$(CONFIG_LOONGSON1_APB_DMA) += loongson1-apb-dma.o
+obj-$(CONFIG_LOONGSON2_APB_DMA) += loongson2-apb-dma.o
 obj-$(CONFIG_LPC18XX_DMAMUX) += lpc18xx-dmamux.o
 obj-$(CONFIG_LPC32XX_DMAMUX) += lpc32xx-dmamux.o
-obj-$(CONFIG_LS2X_APB_DMA) += ls2x-apb-dma.o
 obj-$(CONFIG_MILBEAUT_HDMAC) += milbeaut-hdmac.o
 obj-$(CONFIG_MILBEAUT_XDMAC) += milbeaut-xdmac.o
 obj-$(CONFIG_MMP_PDMA) += mmp_pdma.o
diff --git a/drivers/dma/ls2x-apb-dma.c b/drivers/dma/loongson2-apb-dma.c
similarity index 99%
rename from drivers/dma/ls2x-apb-dma.c
rename to drivers/dma/loongson2-apb-dma.c
index 9652e8666722..3ac65c6a2640 100644
--- a/drivers/dma/ls2x-apb-dma.c
+++ b/drivers/dma/loongson2-apb-dma.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Driver for the Loongson LS2X APB DMA Controller
+ * Driver for the Loongson-2 APB DMA Controller
  *
  * Copyright (C) 2017-2023 Loongson Corporation
  */
@@ -700,6 +700,6 @@ static struct platform_driver ls2x_dmac_driver = {
 };
 module_platform_driver(ls2x_dmac_driver);
 
-MODULE_DESCRIPTION("Loongson LS2X APB DMA Controller driver");
+MODULE_DESCRIPTION("Loongson-2 APB DMA Controller driver");
 MODULE_AUTHOR("Loongson Technology Corporation Limited");
 MODULE_LICENSE("GPL");

base-commit: e0bee4bcdc3238ebcae6e5960544b9e3d0a62abf
-- 
2.43.5

