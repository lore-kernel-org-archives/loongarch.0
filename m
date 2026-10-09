Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 778DC3C3F64
	for <loongarch@lists.linux.dev>; Fri,  9 Oct 2026 09:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791537604; cv=none; b=kxAWPl640x6OKAHKEJ0MiyoM9uUfE7r/hM+cuHgtYVQ7Sz1G5T3b+gmWyVUsmXNWO2hye013KMW7xMKrtyhgPuGKmXJRr0uxY21HO0i9hlryLIO1LLa6ly+33Fp7vk3n6lt1JxIpntpIOtwoIlqIrU3nyMq9j8nome08Y3ikbfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791537604; c=relaxed/simple;
	bh=wjOBq0f0SCjyohwxF3o1V7t9LpHizWWvQ8Vre/ytqz4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dcOwOzSLhEqln2U1BgoH+hRPldnGLrI76/gJVB0Ds4rqgqD9ZyED9SVgB4HFWIMB6FsCqETwz9Gm9iOvBP/cs4fOM/EJ4gp5riRxC5WlAR6PQ1fIf3P0siwWmZTqPnLxIPsuuej2303k2RQ2Hch4AO8qE10zDfAfNoltPj4n7Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.159])
	by gateway (Coremail) with SMTP id _____8DxUNHBschqeBUUAA--.58495S3;
	Fri, 09 Oct 2026 17:20:01 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.159])
	by front1 (Coremail) with SMTP id qMiowJDxBc22schqA2cqAA--.61825S5;
	Fri, 09 Oct 2026 17:19:58 +0800 (CST)
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
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v2 3/3] dmaengine: loongson: Add Loongson-2K0300 APB DMA mux driver
Date: Fri,  9 Oct 2026 17:19:34 +0800
Message-ID: <54a6180b35353d2c03c5a752305636baacd02e9c.1791535540.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1791535540.git.zhoubinbin@loongson.cn>
References: <cover.1791535540.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxBc22schqA2cqAA--.61825S5
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEPCGrIS3YGzAAAsS
X-Coremail-Antispam: 1Uk129KBj9fXoW3ZF4DJF48Xr4xWF45AF43urX_yoW8Wr1DXo
	Z3Zan5uw4xW34xZFyDG345GrW8X3WIqr15Ar4fAw1kKrWvyrn8XasrJFsFv34fJFWjkF4f
	A3ySgF4kAr43Aw15l-sFpf9Il3svdjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8wcxFpf
	9Il3svdxBIdaVrn0xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3
	UjIYCTnIWjp_UUUYe7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI
	8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xG
	Y2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280
	aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20x
	vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
	3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIx
	AIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAI
	cVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E87
	Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU8jZX5UUUUU==

The Loongson-2K0300 DMA mux is not a standalone DMA controller. It is
implemented as a set of routing fields in the chip global configuration
registers CHIP_CTRL13/14/15, which select which physical channel of the
on-chip CMC DMA controller handles each peripheral DMA request.

Add a driver that exposes these routing fields as an OF DMA router. The
router's allocation callback validates the <request> <channel> <flags>
specifier, programs the corresponding CHIP_CTRL register field, and then
rewrites the specifier to <channel> <flags> so that the parent CMC DMA
controller's xlate is used.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 MAINTAINERS                                 |   1 +
 drivers/dma/loongson/Makefile               |   1 +
 drivers/dma/loongson/loongson2-apb-dmamux.c | 398 ++++++++++++++++++++
 3 files changed, 400 insertions(+)
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
index 48c19781e729..271fd38fa8f2 100644
--- a/drivers/dma/loongson/Makefile
+++ b/drivers/dma/loongson/Makefile
@@ -2,3 +2,4 @@
 obj-$(CONFIG_LOONGSON1_APB_DMA) += loongson1-apb-dma.o
 obj-$(CONFIG_LOONGSON2_APB_DMA) += loongson2-apb-dma.o
 obj-$(CONFIG_LOONGSON2_APB_CMC_DMA) += loongson2-apb-cmc-dma.o
+obj-$(CONFIG_LOONGSON2_APB_CMC_DMA) += loongson2-apb-dmamux.o
diff --git a/drivers/dma/loongson/loongson2-apb-dmamux.c b/drivers/dma/loongson/loongson2-apb-dmamux.c
new file mode 100644
index 000000000000..01bd3ce4ca25
--- /dev/null
+++ b/drivers/dma/loongson/loongson2-apb-dmamux.c
@@ -0,0 +1,398 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Loongson2 SoC APB DMA Mux Controller
+ *
+ * Copyright (C) 2026 Loongson Technology Corporation Limited
+ *
+ * Device tree bindings:
+ *
+ *   2K0300:
+ *     dma_mux: dma-mux@16000134 {
+ *             compatible = "loongson,ls2k0300-dmamux";
+ *             reg = <0x0 0x16000134 0x0 0xc>;
+ *             #dma-cells = <3>;
+ *             dma-masters = <&dma>;
+ *             dma-requests = <22>;
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
+/* CHIP_CTRL13 bitfields */
+#define CTRL13_UART0_DMA_MAP		GENMASK(17, 16)
+#define CTRL13_UART1_DMA_MAP		GENMASK(19, 18)
+#define CTRL13_UART2_DMA_MAP		GENMASK(21, 20)
+#define CTRL13_UART3_DMA_MAP		GENMASK(23, 22)
+#define CTRL13_UART4_DMA_MAP		GENMASK(25, 24)
+#define CTRL13_UART5_DMA_MAP		GENMASK(27, 26)
+#define CTRL13_UART6_DMA_MAP		GENMASK(29, 28)
+#define CTRL13_UART7_DMA_MAP		GENMASK(31, 30)
+
+/* CHIP_CTRL14 bitfields */
+#define CTRL14_UART8_DMA_MAP		GENMASK(1, 0)
+#define CTRL14_UART9_DMA_MAP		GENMASK(3, 2)
+#define CTRL14_I2C0_DMA_MAP		GENMASK(5, 4)
+#define CTRL14_I2C1_DMA_MAP		GENMASK(7, 6)
+#define CTRL14_I2C2_DMA_MAP		GENMASK(9, 8)
+#define CTRL14_I2C3_DMA_MAP		GENMASK(11, 10)
+#define CTRL14_SPI2_DMA_MAP		GENMASK(13, 12)
+#define CTRL14_SPI3_DMA_MAP		GENMASK(15, 14)
+#define CTRL14_I2S_DMA_MAP		GENMASK(17, 16)
+#define CTRL14_ADC_DMA_MAP		GENMASK(20, 18)
+#define CTRL14_CAN0_DMA_MAP		GENMASK(23, 21)
+#define CTRL14_CAN1_DMA_MAP		GENMASK(26, 24)
+#define CTRL14_CAN2_DMA_MAP		GENMASK(29, 27)
+#define CTRL14_CAN3_DMA_MAP		GENMASK(31, 30)
+
+/* CHIP_CTRL15 bitfields */
+#define CTRL15_CAN3_DMA_MAP_HI		BIT(0)
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
+ * struct loongson2_dmamux_config - SoC-specific DMA mux configuration
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
+ * struct loongson2_dmamux - DMA mux controller state
+ * @base: I/O-mapped register base
+ * @lock: Protects register read-modify-write sequences
+ * @dma_router: Router structure passed to of_dma_router_register()
+ * @config: SoC-specific configuration
+ */
+struct loongson2_dmamux {
+	void __iomem *base;
+	spinlock_t lock;	/* Protects register read-modify-write sequences */
+	struct dma_router dma_router;
+	const struct loongson2_dmamux_config *config;
+};
+
+/* Loongson-2K0300 mapping table */
+static const struct loongson2_dmamux_map ls2k0300_dmamux_maps[] = {
+	[LS2K0300_DMA_UART0] = { LS2K0300_CHIP_CTRL13, CTRL13_UART0_DMA_MAP, LOONGSON_DMAMUX_PAIR,
+				 0, 0 },
+	[LS2K0300_DMA_UART1] = { LS2K0300_CHIP_CTRL13, CTRL13_UART1_DMA_MAP, LOONGSON_DMAMUX_PAIR,
+				 0, 0 },
+	[LS2K0300_DMA_UART2] = { LS2K0300_CHIP_CTRL13, CTRL13_UART2_DMA_MAP, LOONGSON_DMAMUX_PAIR,
+				 0, 0 },
+	[LS2K0300_DMA_UART3] = { LS2K0300_CHIP_CTRL13, CTRL13_UART3_DMA_MAP, LOONGSON_DMAMUX_PAIR,
+				 0, 0 },
+	[LS2K0300_DMA_UART4] = { LS2K0300_CHIP_CTRL13, CTRL13_UART4_DMA_MAP, LOONGSON_DMAMUX_PAIR,
+				 0, 0 },
+	[LS2K0300_DMA_UART5] = { LS2K0300_CHIP_CTRL13, CTRL13_UART5_DMA_MAP, LOONGSON_DMAMUX_PAIR,
+				 0, 0 },
+	[LS2K0300_DMA_UART6] = { LS2K0300_CHIP_CTRL13, CTRL13_UART6_DMA_MAP, LOONGSON_DMAMUX_PAIR,
+				 0, 0 },
+	[LS2K0300_DMA_UART7] = { LS2K0300_CHIP_CTRL13, CTRL13_UART7_DMA_MAP, LOONGSON_DMAMUX_PAIR,
+				 0, 0 },
+	[LS2K0300_DMA_UART8] = { LS2K0300_CHIP_CTRL14, CTRL14_UART8_DMA_MAP, LOONGSON_DMAMUX_PAIR,
+				 0, 0 },
+	[LS2K0300_DMA_UART9] = { LS2K0300_CHIP_CTRL14, CTRL14_UART9_DMA_MAP, LOONGSON_DMAMUX_PAIR,
+				 0, 0 },
+	[LS2K0300_DMA_I2C0]  = { LS2K0300_CHIP_CTRL14, CTRL14_I2C0_DMA_MAP, LOONGSON_DMAMUX_PAIR,
+				 0, 0 },
+	[LS2K0300_DMA_I2C1]  = { LS2K0300_CHIP_CTRL14, CTRL14_I2C1_DMA_MAP, LOONGSON_DMAMUX_PAIR,
+				 0, 0 },
+	[LS2K0300_DMA_I2C2]  = { LS2K0300_CHIP_CTRL14, CTRL14_I2C2_DMA_MAP, LOONGSON_DMAMUX_PAIR,
+				 0, 0 },
+	[LS2K0300_DMA_I2C3]  = { LS2K0300_CHIP_CTRL14, CTRL14_I2C3_DMA_MAP, LOONGSON_DMAMUX_PAIR,
+				 0, 0 },
+	[LS2K0300_DMA_SPI2]  = { LS2K0300_CHIP_CTRL14, CTRL14_SPI2_DMA_MAP, LOONGSON_DMAMUX_PAIR,
+				 0, 0 },
+	[LS2K0300_DMA_SPI3]  = { LS2K0300_CHIP_CTRL14, CTRL14_SPI3_DMA_MAP, LOONGSON_DMAMUX_PAIR,
+				 0, 0 },
+	[LS2K0300_DMA_I2S]   = { LS2K0300_CHIP_CTRL14, CTRL14_I2S_DMA_MAP, LOONGSON_DMAMUX_PAIR,
+				 0, 0 },
+	[LS2K0300_DMA_ADC]   = { LS2K0300_CHIP_CTRL14, CTRL14_ADC_DMA_MAP, LOONGSON_DMAMUX_SINGLE,
+				 0, 0 },
+	[LS2K0300_DMA_CAN0]  = { LS2K0300_CHIP_CTRL14, CTRL14_CAN0_DMA_MAP, LOONGSON_DMAMUX_SINGLE,
+				 0, 0 },
+	[LS2K0300_DMA_CAN1]  = { LS2K0300_CHIP_CTRL14, CTRL14_CAN1_DMA_MAP, LOONGSON_DMAMUX_SINGLE,
+				 0, 0 },
+	[LS2K0300_DMA_CAN2]  = { LS2K0300_CHIP_CTRL14, CTRL14_CAN2_DMA_MAP, LOONGSON_DMAMUX_SINGLE,
+				 0, 0 },
+	[LS2K0300_DMA_CAN3]  = { LS2K0300_CHIP_CTRL14, CTRL14_CAN3_DMA_MAP, LOONGSON_DMAMUX_SINGLE,
+				 LS2K0300_CHIP_CTRL15, 0 },
+};
+
+static const struct loongson2_dmamux_config ls2k0300_dmamux_config = {
+	.maps			= ls2k0300_dmamux_maps,
+	.num_maps		= ARRAY_SIZE(ls2k0300_dmamux_maps),
+	.max_channel		= LS2K0300_DMA_MAX_CHANNEL,
+	.parent_args_count	= 2,
+};
+
+static inline u32 loongson2_dmamux_read(struct loongson2_dmamux *mux, u32 reg)
+{
+	return readl(mux->base + reg);
+}
+
+static inline void loongson2_dmamux_write(struct loongson2_dmamux *mux, u32 reg, u32 val)
+{
+	writel(val, mux->base + reg);
+}
+
+/**
+ * loongson2_dmamux_set_route() - Program the DMA request route
+ * @mux:     DMA mux controller
+ * @request: Peripheral DMA request ID
+ * @channel: Target physical DMA channel or controller index
+ *
+ * Computes the register value according to the mapping type:
+ *   - PAIR   : channel / 2 selects the pair index
+ *   - SINGLE : channel is written directly
+ *
+ * Return: 0 on success, negative error code otherwise.
+ */
+static int loongson2_dmamux_set_route(struct loongson2_dmamux *mux, u32 request, u32 channel)
+{
+	const struct loongson2_dmamux_map *map;
+	u32 reg_val, route_val, high_val = 0;
+
+	if (request >= mux->config->num_maps)
+		return -EINVAL;
+
+	if (channel > mux->config->max_channel)
+		return -EINVAL;
+
+	map = &mux->config->maps[request];
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
+	guard(spinlock_irqsave)(&mux->lock);
+
+	/* Write the primary register field */
+	reg_val = loongson2_dmamux_read(mux, map->reg);
+	reg_val &= ~map->mask;
+	reg_val |= field_prep(map->mask, route_val);
+	loongson2_dmamux_write(mux, map->reg, reg_val);
+
+	/* Write the extension register field if present */
+	if (map->high_reg) {
+		reg_val = loongson2_dmamux_read(mux, map->high_reg);
+		reg_val &= ~BIT(map->high_shift);
+		reg_val |= high_val << map->high_shift;
+		loongson2_dmamux_write(mux, map->high_reg, reg_val);
+	}
+
+	return 0;
+}
+
+/**
+ * loongson2_dmamux_route_allocate() - DMA router allocation callback
+ * @dma_spec: OF DMA specifier <request> <channel> <flags>
+ * @ofdma:    Router's of_dma structure; ofdma->dma_router points to our
+ *            struct dma_router embedded in struct loongson2_dmamux.
+ *
+ * Return: NULL as route_data (nothing to free), or an ERR_PTR on failure.
+ */
+static void *loongson2_dmamux_route_allocate(struct of_phandle_args *dma_spec,
+					     struct of_dma *ofdma)
+{
+	struct loongson2_dmamux *mux;
+	u32 request, channel, flags;
+	int ret;
+
+	if (!ofdma->dma_router)
+		return ERR_PTR(-EINVAL);
+
+	mux = container_of(ofdma->dma_router, struct loongson2_dmamux, dma_router);
+
+	if (dma_spec->args_count != 3)
+		return ERR_PTR(-EINVAL);
+
+	request = dma_spec->args[0];
+	channel = dma_spec->args[1];
+	flags = dma_spec->args[2];
+
+	if (request >= mux->config->num_maps ||
+	    channel > mux->config->max_channel)
+		return ERR_PTR(-EINVAL);
+
+	/* Program the SoC-specific route register */
+	ret = loongson2_dmamux_set_route(mux, request, channel);
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
+	dma_spec->args_count = mux->config->parent_args_count;
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
+ * @data: Pointer to struct loongson2_dmamux
+ *
+ * Called automatically by the device-managed resource framework both on
+ * probe failure and on driver removal, ensuring the OF DMA router is
+ * always unregistered.
+ */
+static void loongson2_dmamux_unregister_of_dma(void *data)
+{
+	struct loongson2_dmamux *mux = data;
+
+	of_dma_router_free(mux->dma_router.dev->of_node);
+}
+
+static int loongson2_dmamux_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct loongson2_dmamux *mux;
+	u32 dma_requests;
+	int ret;
+
+	mux = devm_kzalloc(dev, sizeof(*mux), GFP_KERNEL);
+	if (!mux)
+		return -ENOMEM;
+
+	mux->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(mux->base))
+		return PTR_ERR(mux->base);
+
+	spin_lock_init(&mux->lock);
+	mux->config = &ls2k0300_dmamux_config;
+
+	ret = of_property_read_u32(dev->of_node, "dma-requests", &dma_requests);
+	if (ret)
+		return dev_err_probe(dev, ret, "missing dma-requests property\n");
+
+	if (dma_requests != mux->config->num_maps)
+		return dev_err_probe(dev, -EINVAL,
+				     "dma-requests=%u mismatches driver num_maps=%u",
+				     dma_requests, mux->config->num_maps);
+
+	mux->dma_router.dev = dev;
+	mux->dma_router.route_free = loongson2_dmamux_route_free;
+
+	platform_set_drvdata(pdev, mux);
+
+	ret = of_dma_router_register(dev->of_node, loongson2_dmamux_route_allocate,
+				     &mux->dma_router);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to register DMA router");
+
+	ret = devm_add_action_or_reset(dev, loongson2_dmamux_unregister_of_dma, mux);
+	if (ret)
+		return ret;
+
+	dev_info(dev,
+		 "Loongson2 DMA Mux Controller registered (max_channel=%u, requests=%u)",
+		 mux->config->max_channel, mux->config->num_maps);
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

