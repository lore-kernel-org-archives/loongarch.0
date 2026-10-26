Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792989201;
	b=GepjVFVhq9/9p+jLaxG+4X1/EGBu6xLXzs6DZJ/kvgp3I4aqRhsutGJZmIgJZ8i0jUZz
	 BzO6EPQjIWOzCMOcLxCEGASlxFNg9bxxWbV9Qr7IdY5x/iNuE92ONwCehtC7t4ywxgfCw
	 KuDlrHxYCXvmX0yQQNLCBL1TtbImwvm3dZ/gxgYsTs5ZzDL3vrBr3uKasMQPhomv/y5H5
	 HEX6/BC2chU5hyc/GVzLDICM4sf6FBeRDn0WkJ6v3T+OeYPqh1cugNJBHg+Im66N1ktEi
	 bHOkiQZUXcHm+tYq7RtiMuzeEdVbC9cggZm1NW04Lc5//aRUHipgsmtFQfmPlXE0/cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792989201;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=IjJCyu2/K1I/1exEpcgjLABGIUKlble4v+WjR9BuO/M=;
	b=E6J5MszYQ5w+/yi1IfXCqP894CAJZg5cn23d76hjiX7nEGepPkJcQ3Qpc0V6uz+5KSQs
	 8t8Zr3gTV7DV2LnT3MAFfZDDKwg8YYix1i2w3n/xAEU5q5vJhx5/j//dGWp9/wyNLnplm
	 Z4mYlUWDKe2r27oE9AcCl4F7Xx0zjiX0w7/xSAfJmjbRXW0SHgqq5uhVH2YiCGQTQkhSE
	 vUYnt4vBKQnEjASxaI9V+DoxfVVu8llzIjEUyTMQxw1OyW909JgG7unHZu+BzXZ5Nj9T4
	 Po39mUtV278Wy+LExkuDjjFkVA4saJ3URIrFNXQFMJVPXi+vn12qUXyvulIA+suiJGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66205606A321
	for <loongarch@lists.linux.dev>; Mon, 26 Oct 2026 04:33:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66205606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.17])
	by gateway (Coremail) with SMTP id _____8CxutEO2N5q010ZAA--.8298S3;
	Mon, 26 Oct 2026 12:33:18 +0800 (CST)
Received: from kernelserver (unknown [223.64.69.17])
	by front1 (Coremail) with SMTP id qMiowJAx1cwI2N5q6jgwAA--.7070S4;
	Mon, 26 Oct 2026 12:33:18 +0800 (CST)
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
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v3 2/2] dmaengine: loongson: Add Loongson-2K0300 APB DMA mux driver
Date: Mon, 26 Oct 2026 12:33:06 +0800
Message-ID: <7be5854a22934f729366324ef6bf11bd3c8f796d.1792986696.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1792986696.git.zhoubinbin@loongson.cn>
References: <cover.1792986696.git.zhoubinbin@loongson.cn>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAx1cwI2N5q6jgwAA--.7070S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEMCGrexPwvDQAAsp
X-Coremail-Antispam: 1Uk129KBj9fXoW3ZF4DJF48Xr4xWF45AF43urX_yoW8WF1DXo
	ZxZan5Wa1xG3yxZFWDGw1UJrW8Xas2qF15AryfAw18KrWvkr15XasrGF47ta4rJF48AF1r
	Z3yagF4kArWay345l-sFpf9Il3svdjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8wcxFpf
	9Il3svdxBIdaVrn0xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3
	UjIYCTnIWjp_UUUY07kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI
	8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xG
	Y2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14
	v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWrXVW3AwAv7VC2z280
	aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28Icx
	kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
	xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42
	IY6xIIjxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAI
	cVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2js
	IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jT-e5UUUUU=

The Loongson-2K0300 DMA mux is not a standalone DMA controller. It is
implemented as a set of routing fields in the chip global configuration
registers CHIP_CTRL13/14/15, which select which physical channel of the
on-chip CMC DMA controller handles each peripheral DMA request.

Add a driver that exposes these routing fields as an OF DMA router. The
router's allocation callback validates the <request> <channel> <flags>
specifier, programs the corresponding CHIP_CTRL register field, and then
rewrites the specifier to <channel> <flags> so that the parent CMC DMA
controller's xlate is used.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 MAINTAINERS                                 |   1 +
 drivers/dma/loongson/Makefile               |   2 +-
 drivers/dma/loongson/loongson2-apb-dmamux.c | 404 ++++++++++++++++++++
 3 files changed, 406 insertions(+), 1 deletion(-)
 create mode 100644 drivers/dma/loongson/loongson2-apb-dmamux.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 78622b255f88..0b0c6ea41c64 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15355,6 +15355,7 @@ F:	Documentation/devicetree/bindings/dma/loongson,ls2k0300-dmamux.yaml
 F:	Documentation/devicetree/bindings/dma/loongson,ls2x-apbdma.yaml
 F:	drivers/dma/loongson/loongson2-apb-cmc-dma.c
 F:	drivers/dma/loongson/loongson2-apb-dma.c
+F:	drivers/dma/loongson/loongson2-apb-dmamux.c
 F:	include/dt-bindings/dma/loongson,ls2k-dmamux.h
 
 LOONGSON LS2X I2C DRIVER
diff --git a/drivers/dma/loongson/Makefile b/drivers/dma/loongson/Makefile
index 48c19781e729..3e2aafb7e331 100644
--- a/drivers/dma/loongson/Makefile
+++ b/drivers/dma/loongson/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_LOONGSON1_APB_DMA) += loongson1-apb-dma.o
 obj-$(CONFIG_LOONGSON2_APB_DMA) += loongson2-apb-dma.o
-obj-$(CONFIG_LOONGSON2_APB_CMC_DMA) += loongson2-apb-cmc-dma.o
+obj-$(CONFIG_LOONGSON2_APB_CMC_DMA) += loongson2-apb-cmc-dma.o loongson2-apb-dmamux.o
diff --git a/drivers/dma/loongson/loongson2-apb-dmamux.c b/drivers/dma/loongson/loongson2-apb-dmamux.c
new file mode 100644
index 000000000000..072b72e9aa93
--- /dev/null
+++ b/drivers/dma/loongson/loongson2-apb-dmamux.c
@@ -0,0 +1,404 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Loongson2 SoC APB DMA Mux Controller
+ *
+ * Copyright (C) 2026 Loongson Technology Corporation Limited
+ *
+ * Device tree bindings:
+ *
+ *   2K0300:
+ *     dma-mux@16000134 {
+ *         compatible = "loongson,ls2k0300-dmamux";
+ *         reg = <0x0 0x16000134 0x0 0xc>;
+ *         #dma-cells = <3>;
+ *         dma-masters = <&dma>;
+ *         dma-requests = <22>;
+ *     };
+ *
+ * DMA specifier: <request> <channel> <flags>
+ *   - request: peripheral request ID (LS2K0300_DMA_*)
+ *   - channel: target physical DMA channel
+ *   - flags:   channel configuration flags forwarded to the parent DMA
+ *              controller
+ */
+
+#include <linux/bitfield.h>
+#include <linux/cleanup.h>
+#include <linux/device.h>
+#include <linux/dmaengine.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_dma.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+
+#include <dt-bindings/dma/loongson,ls2k-dmamux.h>
+
+/* Loongson-2K0300 registers definitions */
+#define LS2K0300_CHIP_CTRL13		0x00
+#define LS2K0300_CHIP_CTRL14		0x04
+#define LS2K0300_CHIP_CTRL15		0x08
+
+/* LS2K0300_CHIP_CTRL13 bitfields */
+#define LS2K0300_UART0_DMA_MAP		GENMASK(17, 16)
+#define LS2K0300_UART1_DMA_MAP		GENMASK(19, 18)
+#define LS2K0300_UART2_DMA_MAP		GENMASK(21, 20)
+#define LS2K0300_UART3_DMA_MAP		GENMASK(23, 22)
+#define LS2K0300_UART4_DMA_MAP		GENMASK(25, 24)
+#define LS2K0300_UART5_DMA_MAP		GENMASK(27, 26)
+#define LS2K0300_UART6_DMA_MAP		GENMASK(29, 28)
+#define LS2K0300_UART7_DMA_MAP		GENMASK(31, 30)
+
+/* LS2K0300_CHIP_CTRL14 bitfields */
+#define LS2K0300_UART8_DMA_MAP		GENMASK(1, 0)
+#define LS2K0300_UART9_DMA_MAP		GENMASK(3, 2)
+#define LS2K0300_I2C0_DMA_MAP		GENMASK(5, 4)
+#define LS2K0300_I2C1_DMA_MAP		GENMASK(7, 6)
+#define LS2K0300_I2C2_DMA_MAP		GENMASK(9, 8)
+#define LS2K0300_I2C3_DMA_MAP		GENMASK(11, 10)
+#define LS2K0300_SPI2_DMA_MAP		GENMASK(13, 12)
+#define LS2K0300_SPI3_DMA_MAP		GENMASK(15, 14)
+#define LS2K0300_I2S_DMA_MAP		GENMASK(17, 16)
+#define LS2K0300_ADC_DMA_MAP		GENMASK(20, 18)
+#define LS2K0300_CAN0_DMA_MAP		GENMASK(23, 21)
+#define LS2K0300_CAN1_DMA_MAP		GENMASK(26, 24)
+#define LS2K0300_CAN2_DMA_MAP		GENMASK(29, 27)
+#define LS2K0300_CAN3_DMA_MAP		GENMASK(31, 30)
+
+/* LS2K0300_CHIP_CTRL15 bitfields */
+#define LS2K0300_CAN3_DMA_MAP_HI	BIT(0)
+
+#define LS2K0300_DMA_MAX_CHANNEL	7
+
+/**
+ * enum loongson2_dmamux_type - Type of the mapping field
+ * @LOONGSON_DMAMUX_PAIR: 2-bit field, value selects a channel pair
+ *                        (0/1, 2/3, 4/5, 6/7).
+ * @LOONGSON_DMAMUX_SINGLE: 3-bit field, value selects a single channel
+ *                          or controller index directly.
+ */
+enum loongson2_dmamux_type {
+	LOONGSON_DMAMUX_PAIR,
+	LOONGSON_DMAMUX_SINGLE,
+};
+
+/**
+ * struct loongson2_dmamux_map - DMA request to register bitfield mapping
+ * @reg: Register offset from the controller base
+ * @mask: Bitfield mask within the register
+ * @type: Mapping type (pair or single)
+ * @high_reg: Optional extension register offset (0 if unused)
+ * @high_shift: Bit position in the extension register
+ */
+struct loongson2_dmamux_map {
+	u32 reg;
+	u32 mask;
+	enum loongson2_dmamux_type type;
+	u32 high_reg;
+	u8 high_shift;
+};
+
+/**
+ * struct loongson2_dmamux_config - SoC-specific DMA priv configuration
+ * @maps: Pointer to the request mapping table
+ * @num_maps: Number of entries in @maps
+ * @max_channel: Highest valid channel/controller index
+ * @parent_args_count: Number of cells to write to dma_spec->args[]
+ *                     when forwarding to the parent xlate.
+ */
+struct loongson2_dmamux_config {
+	const struct loongson2_dmamux_map *maps;
+	u32 num_maps;
+	u32 max_channel;
+	u32 parent_args_count;
+};
+
+/**
+ * struct loongson2_dmamux_priv - Loongson2 DMA priv controller private data
+ * @base: I/O-mapped register base
+ * @config: SoC-specific configuration
+ * @dma_router: Router structure passed to of_dma_router_register()
+ * @lock: Protects register read-modify-write sequences
+ */
+struct loongson2_dmamux_priv {
+	void __iomem *base;
+	const struct loongson2_dmamux_config *config;
+	struct dma_router dma_router;
+	spinlock_t lock;	/* Protects register read-modify-write sequences */
+};
+
+/* Loongson-2K0300 mapping table */
+static const struct loongson2_dmamux_map ls2k0300_dmamux_maps[] = {
+	[LS2K0300_DMA_UART0] = { LS2K0300_CHIP_CTRL13, LS2K0300_UART0_DMA_MAP,
+				 LOONGSON_DMAMUX_PAIR, 0, 0 },
+	[LS2K0300_DMA_UART1] = { LS2K0300_CHIP_CTRL13, LS2K0300_UART1_DMA_MAP,
+				 LOONGSON_DMAMUX_PAIR, 0, 0 },
+	[LS2K0300_DMA_UART2] = { LS2K0300_CHIP_CTRL13, LS2K0300_UART2_DMA_MAP,
+				 LOONGSON_DMAMUX_PAIR, 0, 0 },
+	[LS2K0300_DMA_UART3] = { LS2K0300_CHIP_CTRL13, LS2K0300_UART3_DMA_MAP,
+				 LOONGSON_DMAMUX_PAIR, 0, 0 },
+	[LS2K0300_DMA_UART4] = { LS2K0300_CHIP_CTRL13, LS2K0300_UART4_DMA_MAP,
+				 LOONGSON_DMAMUX_PAIR, 0, 0 },
+	[LS2K0300_DMA_UART5] = { LS2K0300_CHIP_CTRL13, LS2K0300_UART5_DMA_MAP,
+				 LOONGSON_DMAMUX_PAIR, 0, 0 },
+	[LS2K0300_DMA_UART6] = { LS2K0300_CHIP_CTRL13, LS2K0300_UART6_DMA_MAP,
+				 LOONGSON_DMAMUX_PAIR, 0, 0 },
+	[LS2K0300_DMA_UART7] = { LS2K0300_CHIP_CTRL13, LS2K0300_UART7_DMA_MAP,
+				 LOONGSON_DMAMUX_PAIR, 0, 0 },
+	[LS2K0300_DMA_UART8] = { LS2K0300_CHIP_CTRL14, LS2K0300_UART8_DMA_MAP,
+				 LOONGSON_DMAMUX_PAIR, 0, 0 },
+	[LS2K0300_DMA_UART9] = { LS2K0300_CHIP_CTRL14, LS2K0300_UART9_DMA_MAP,
+				 LOONGSON_DMAMUX_PAIR, 0, 0 },
+	[LS2K0300_DMA_I2C0]  = { LS2K0300_CHIP_CTRL14, LS2K0300_I2C0_DMA_MAP,
+				 LOONGSON_DMAMUX_PAIR, 0, 0 },
+	[LS2K0300_DMA_I2C1]  = { LS2K0300_CHIP_CTRL14, LS2K0300_I2C1_DMA_MAP,
+				 LOONGSON_DMAMUX_PAIR, 0, 0 },
+	[LS2K0300_DMA_I2C2]  = { LS2K0300_CHIP_CTRL14, LS2K0300_I2C2_DMA_MAP,
+				 LOONGSON_DMAMUX_PAIR, 0, 0 },
+	[LS2K0300_DMA_I2C3]  = { LS2K0300_CHIP_CTRL14, LS2K0300_I2C3_DMA_MAP,
+				 LOONGSON_DMAMUX_PAIR, 0, 0 },
+	[LS2K0300_DMA_SPI2]  = { LS2K0300_CHIP_CTRL14, LS2K0300_SPI2_DMA_MAP,
+				 LOONGSON_DMAMUX_PAIR, 0, 0 },
+	[LS2K0300_DMA_SPI3]  = { LS2K0300_CHIP_CTRL14, LS2K0300_SPI3_DMA_MAP,
+				 LOONGSON_DMAMUX_PAIR, 0, 0 },
+	[LS2K0300_DMA_I2S]   = { LS2K0300_CHIP_CTRL14, LS2K0300_I2S_DMA_MAP,
+				 LOONGSON_DMAMUX_PAIR, 0, 0 },
+	[LS2K0300_DMA_ADC]   = { LS2K0300_CHIP_CTRL14, LS2K0300_ADC_DMA_MAP,
+				 LOONGSON_DMAMUX_SINGLE, 0, 0 },
+	[LS2K0300_DMA_CAN0]  = { LS2K0300_CHIP_CTRL14, LS2K0300_CAN0_DMA_MAP,
+				 LOONGSON_DMAMUX_SINGLE, 0, 0 },
+	[LS2K0300_DMA_CAN1]  = { LS2K0300_CHIP_CTRL14, LS2K0300_CAN1_DMA_MAP,
+				 LOONGSON_DMAMUX_SINGLE, 0, 0 },
+	[LS2K0300_DMA_CAN2]  = { LS2K0300_CHIP_CTRL14, LS2K0300_CAN2_DMA_MAP,
+				 LOONGSON_DMAMUX_SINGLE, 0, 0 },
+	[LS2K0300_DMA_CAN3]  = { LS2K0300_CHIP_CTRL14, LS2K0300_CAN3_DMA_MAP,
+				 LOONGSON_DMAMUX_SINGLE, LS2K0300_CHIP_CTRL15, 0 },
+};
+
+static const struct loongson2_dmamux_config ls2k0300_dmamux_config = {
+	.maps			= ls2k0300_dmamux_maps,
+	.num_maps		= ARRAY_SIZE(ls2k0300_dmamux_maps),
+	.max_channel		= LS2K0300_DMA_MAX_CHANNEL,
+	.parent_args_count	= 2,
+};
+
+static inline u32 loongson2_dmamux_read(struct loongson2_dmamux_priv *priv, u32 reg)
+{
+	return readl(priv->base + reg);
+}
+
+static inline void loongson2_dmamux_write(struct loongson2_dmamux_priv *priv, u32 reg, u32 val)
+{
+	writel(val, priv->base + reg);
+}
+
+static void loongson2_dmamux_assign_bits(struct loongson2_dmamux_priv *priv, u32 reg,
+					 u32 mask, u32 val)
+{
+	u32 reg_val;
+
+	reg_val = loongson2_dmamux_read(priv, reg);
+	reg_val &= ~mask;
+	reg_val |= val & mask;
+	loongson2_dmamux_write(priv, reg, reg_val);
+}
+
+/**
+ * loongson2_dmamux_set_route() - Program the DMA request route
+ * @priv:     DMA priv controller
+ * @request: Peripheral DMA request ID
+ * @channel: Target physical DMA channel or controller index
+ *
+ * Computes the register value according to the mapping type:
+ *   - PAIR   : channel / 2 selects the pair index
+ *   - SINGLE : channel is written directly
+ *
+ * Return: 0 on success, negative error code otherwise.
+ */
+static int loongson2_dmamux_set_route(struct loongson2_dmamux_priv *priv, u32 request, u32 channel)
+{
+	const struct loongson2_dmamux_map *map;
+	u32 route_val, high_val = 0;
+
+	if (request >= priv->config->num_maps)
+		return -EINVAL;
+
+	if (channel > priv->config->max_channel)
+		return -EINVAL;
+
+	map = &priv->config->maps[request];
+
+	switch (map->type) {
+	case LOONGSON_DMAMUX_PAIR:
+		route_val = channel / 2;
+		break;
+	case LOONGSON_DMAMUX_SINGLE:
+		route_val = channel;
+		if (map->high_reg)
+			high_val = (channel >> 2) & 0x1;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	guard(spinlock_irqsave)(&priv->lock);
+
+	/* Primary register field */
+	loongson2_dmamux_assign_bits(priv, map->reg, map->mask,
+				     field_prep(map->mask, route_val));
+
+	/* Extension register bit if present */
+	if (map->high_reg)
+		loongson2_dmamux_assign_bits(priv, map->high_reg,
+					     BIT(map->high_shift),
+					     high_val ? BIT(map->high_shift) : 0);
+
+	return 0;
+}
+
+/**
+ * loongson2_dmamux_route_allocate() - DMA router allocation callback
+ * @dma_spec: OF DMA specifier <request> <channel> <flags>
+ * @ofdma:    Router's of_dma structure; ofdma->dma_router points to our
+ *            struct dma_router embedded in struct loongson2_dmamux_priv.
+ *
+ * Return: NULL as route_data (nothing to free), or an ERR_PTR on failure.
+ */
+static void *loongson2_dmamux_route_allocate(struct of_phandle_args *dma_spec,
+					     struct of_dma *ofdma)
+{
+	struct loongson2_dmamux_priv *priv;
+	u32 request, channel, flags;
+	int ret;
+
+	if (!ofdma->dma_router)
+		return ERR_PTR(-EINVAL);
+
+	priv = container_of(ofdma->dma_router, struct loongson2_dmamux_priv, dma_router);
+
+	if (dma_spec->args_count != 3)
+		return ERR_PTR(-EINVAL);
+
+	request = dma_spec->args[0];
+	channel = dma_spec->args[1];
+	flags = dma_spec->args[2];
+
+	if (request >= priv->config->num_maps ||
+	    channel > priv->config->max_channel)
+		return ERR_PTR(-EINVAL);
+
+	/* Program the SoC-specific route register */
+	ret = loongson2_dmamux_set_route(priv, request, channel);
+	if (ret)
+		return ERR_PTR(ret);
+
+	/* The of_node_put() will be done in of_dma_router_xlate function */
+	dma_spec->np = of_parse_phandle(ofdma->of_node, "dma-masters", 0);
+	if (!dma_spec->np)
+		return ERR_PTR(-ENODEV);
+
+	dma_spec->args[0] = channel;
+	dma_spec->args[1] = flags;
+	dma_spec->args_count = priv->config->parent_args_count;
+
+	return NULL;
+}
+
+/**
+ * loongson2_dmamux_route_free() - DMA router free callback
+ * @dev: Back pointer to the router's device
+ * @route_data: Router-specific data returned by route_allocate
+ *
+ * The driver does not allocate any per-route resources, so this callback
+ * is intentionally empty. It must still be provided because the OF DMA
+ * core calls it unconditionally on some error paths (e.g. -EPROBE_DEFER)
+ * without checking for a NULL pointer.
+ */
+static void loongson2_dmamux_route_free(struct device *dev, void *route_data)
+{
+}
+
+/**
+ * loongson2_dmamux_unregister_of_dma() - devm action to unregister the router
+ * @data: Pointer to struct loongson2_dmamux_priv
+ *
+ * Called automatically by the device-managed resource framework both on
+ * probe failure and on driver removal, ensuring the OF DMA router is
+ * always unregistered.
+ */
+static void loongson2_dmamux_unregister_of_dma(void *data)
+{
+	struct loongson2_dmamux_priv *priv = data;
+
+	of_dma_router_free(priv->dma_router.dev->of_node);
+}
+
+static int loongson2_dmamux_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct loongson2_dmamux_priv *priv;
+	u32 dma_requests;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	spin_lock_init(&priv->lock);
+	priv->config = &ls2k0300_dmamux_config;
+
+	ret = of_property_read_u32(dev->of_node, "dma-requests", &dma_requests);
+	if (ret)
+		return dev_err_probe(dev, ret, "missing dma-requests property");
+
+	if (dma_requests != priv->config->num_maps)
+		return dev_err_probe(dev, -EINVAL,
+				     "dma-requests=%u mismatches driver num_maps=%u",
+				     dma_requests, priv->config->num_maps);
+
+	priv->dma_router.dev = dev;
+	priv->dma_router.route_free = loongson2_dmamux_route_free;
+
+	platform_set_drvdata(pdev, priv);
+
+	ret = devm_add_action_or_reset(dev, loongson2_dmamux_unregister_of_dma, priv);
+	if (ret)
+		return ret;
+
+	ret = of_dma_router_register(dev->of_node, loongson2_dmamux_route_allocate,
+				     &priv->dma_router);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register DMA router");
+
+	dev_info(dev,
+		 "Loongson2 DMA Mux Controller registered (max_channel=%u, requests=%u)",
+		 priv->config->max_channel, priv->config->num_maps);
+
+	return 0;
+}
+
+static const struct of_device_id loongson2_dmamux_of_match[] = {
+	{ .compatible = "loongson,ls2k0300-dmamux" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, loongson2_dmamux_of_match);
+
+static struct platform_driver loongson2_dmamux_driver = {
+	.driver = {
+		.name = "loongson2-dmamux",
+		.of_match_table = loongson2_dmamux_of_match,
+	},
+	.probe = loongson2_dmamux_probe,
+};
+module_platform_driver(loongson2_dmamux_driver);
+
+MODULE_DESCRIPTION("Loongson2 SoC DMA Mux Controller driver");
+MODULE_AUTHOR("Loongson Technology Corporation Limited");
+MODULE_LICENSE("GPL");
-- 
2.52.0

