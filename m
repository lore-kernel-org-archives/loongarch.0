Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792989201;
	b=e9IlV6IBNo29YEPC9+qlZEgl/GzwzVQbKtgptakfJit/RzBOwTpTsrS8Nml2Xla8iIYB
	 cTBXUvujljpchD/A5oWqYwIYHRJzp/oscrjxVt/naDRzVL6vTTRV0EbS2Cr2rIiV/d8zy
	 hrIMF04y9ngTz6Uo2TaAoxgBdFqauYiXbFjrRsC/UbRttJkbQK62CGlLCQTL5ExBqtSh/
	 HVyyWR5NXrt8kxMrzHGUtfMZDSIeO3Mw/H50HKjOMPK+Yxo28gDD1qBlw/dLERPWcD+rN
	 24dEdt7hYjdKYErsPm00syIUMLs4n773sVOe1VzR7G5dXQjGbLeEHshy70gJKuxpArA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792989201;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=tNqsvXgqRWXzP/izZ2kYfFH0p1gIT5FKPDmcvcDX+iw=;
	b=LjK5jYzuE/eWUszeSnTFyVJk96q2NTroYAJLYcGLt4CLKxfdlzaEFC60Epk8bDX4urC8
	 EdzHP4Tkl6m3cAkRP9cA47CR9Mk02PuTiwiMYGp9mYauCOBDYDu6DjoLE1EDGDB7fs9Fd
	 cmth1Wg7M/lWIGYDOmnBBK4LIhmVNp4ZKKKXGoZlZzHdv8LT/H4LgmxGZ3sM7qFCYEX8Q
	 aio50oB0p+99g7u78ytqbh2tdbLwO6xfAwAJ3zdc34bXHdnJ/rDRY3ZOlsKOAekmLf60M
	 WFyMrmIEFBOtC+A3IgZlAubG9IiCOO4ghLJnGzf+cfzW/yEM9e4Iee8hnDm9QhVZYyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AD4E606A31B
	for <loongarch@lists.linux.dev>; Mon, 26 Oct 2026 04:33:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AD4E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.17])
	by gateway (Coremail) with SMTP id _____8AxS_AN2N5q0F0ZAA--.8297S3;
	Mon, 26 Oct 2026 12:33:17 +0800 (CST)
Received: from kernelserver (unknown [223.64.69.17])
	by front1 (Coremail) with SMTP id qMiowJAx1cwI2N5q6jgwAA--.7070S3;
	Mon, 26 Oct 2026 12:33:16 +0800 (CST)
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
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/2] dt-bindings: dma: Document DMA mux support for Loongson-2K0300
Date: Mon, 26 Oct 2026 12:33:05 +0800
Message-ID: <c4ae9695aa266bf714a53b5f46218645fc64347a.1792986696.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:qMiowJAx1cwI2N5q6jgwAA--.7070S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEMCGrexPwvDAAAso
X-Coremail-Antispam: 1Uk129KBj93XoWxKry3uw15Jr1kGr43Cr17Jwc_yoW7tr43pa
	sIkFZakFy0yFyfCa95KFy8Kr15XrZayFy7Xay7XrnrC3yDJ34Yvr43Ka1YvFW7Gr4IvrW7
	XryvgrW2gasrZrcCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
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

The DMA mux on Loongson-2K0300 is not a standalone hardware block. It is
implemented as part of the chip configuration registers CHIP_CTRL13/14/15,
which route peripheral DMA requests to the physical channels of the CMC
DMA controller.

Document this as a DMA router. The #dma-cells = <3> specifier contains
the peripheral request ID, the target CMC DMA channel, and channel
configuration flags forwarded to the parent DMA controller.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../dma/loongson,ls2k0300-dmamux.yaml         | 72 +++++++++++++++++++
 MAINTAINERS                                   |  2 +
 .../dt-bindings/dma/loongson,ls2k-dmamux.h    | 53 ++++++++++++++
 3 files changed, 127 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/loongson,ls2k0300-dmamux.yaml
 create mode 100644 include/dt-bindings/dma/loongson,ls2k-dmamux.h

diff --git a/Documentation/devicetree/bindings/dma/loongson,ls2k0300-dmamux.yaml b/Documentation/devicetree/bindings/dma/loongson,ls2k0300-dmamux.yaml
new file mode 100644
index 000000000000..df607d9ff599
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/loongson,ls2k0300-dmamux.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/loongson,ls2k0300-dmamux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Loongson-2 APB DMA MUX (DMA request router)
+
+maintainers:
+  - Binbin Zhou <zhoubinbin@loongson.cn>
+
+allOf:
+  - $ref: /schemas/dma/dma-router.yaml#
+
+properties:
+  compatible:
+    const: loongson,ls2k0300-dmamux
+
+  reg:
+    maxItems: 1
+
+  '#dma-cells':
+    const: 3
+    description: |
+      Each cell represents the following:
+      1. Peripheral request ID: This describes the corresponding bit field
+         for that peripheral in the configuration register; see (
+         include/dt-bindings/dma/loongson,ls2k-dmamux.h) for details.
+      2. Physical DMA channel (0-7): This not only represents the DMA
+         channel used by the peripheral but is also converted into a value for
+         the corresponding bit field in the configuration register, indicating
+         the legitimacy of that peripheral using that channel.
+         Specifically:
+         - I2S/SPI/UART/I2C: Require adjacent channels in pairs; valid
+            values are 0/1, 2/3, 4/5, 6/7;
+         - SM3/SM4/DES/AES: Single channel; valid values are limited to 0/1;
+         - CAN/ADC: Single channel; valid values range from 0 to 7.
+      3. DMA Channel Configuration: A 32-bit mask used to specify
+         device-specific DMA channel configurations.
+         - Bit 6: Peripheral Address Increment Mode
+            0x0: Disabled
+            0x1: Enabled
+         - Bit 7: Memory Address Increment Mode
+            0x0: Disabled
+            0x1: Enabled
+         - Bits 12-13: Priority
+            0x0: Low
+            0x1: Medium
+            0x2: High
+            0x3: Very High
+
+  dma-requests:
+    const: 22
+
+required:
+  - compatible
+  - reg
+  - dma-requests
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/dma/loongson,ls2k-dmamux.h>
+    dma-router@16000134 {
+        compatible = "loongson,ls2k0300-dmamux";
+        reg = <0x16000134 0xc>;
+        #dma-cells = <3>;
+        dma-masters = <&dma>;
+        dma-requests = <22>;
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 42f5165019ee..78622b255f88 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15351,9 +15351,11 @@ M:	Binbin Zhou <zhoubinbin@loongson.cn>
 L:	dmaengine@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/dma/loongson,ls2k0300-dma.yaml
+F:	Documentation/devicetree/bindings/dma/loongson,ls2k0300-dmamux.yaml
 F:	Documentation/devicetree/bindings/dma/loongson,ls2x-apbdma.yaml
 F:	drivers/dma/loongson/loongson2-apb-cmc-dma.c
 F:	drivers/dma/loongson/loongson2-apb-dma.c
+F:	include/dt-bindings/dma/loongson,ls2k-dmamux.h
 
 LOONGSON LS2X I2C DRIVER
 M:	Binbin Zhou <zhoubinbin@loongson.cn>
diff --git a/include/dt-bindings/dma/loongson,ls2k-dmamux.h b/include/dt-bindings/dma/loongson,ls2k-dmamux.h
new file mode 100644
index 000000000000..1e2907ab069d
--- /dev/null
+++ b/include/dt-bindings/dma/loongson,ls2k-dmamux.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Loongson-2 SoC DMA Mux dt-bindings
+ *
+ * DMA specifier format:
+ *   dmas = <&dma_mux <request> <channel> <flags>>;
+ *
+ * The <channel> cell selects a physical CMC DMA channel (0-7)
+ * For peripherals using channel pairs (UART, I2C, SPI2/3, I2S),
+ * the channel number selects the pair: 0/1 -> pair 0, 2/3 -> pair 1,
+ * 4/5 -> pair 2, 6/7 -> pair 3.
+ *
+ * Copyright (C) 2026 Loongson Technology Corporation Limited
+ */
+
+#ifndef _DT_BINDINGS_DMA_LOONGSON_LS2K_DMAMUX_H
+#define _DT_BINDINGS_DMA_LOONGSON_LS2K_DMAMUX_H
+
+/* UART controllers */
+#define LS2K0300_DMA_UART0		0
+#define LS2K0300_DMA_UART1		1
+#define LS2K0300_DMA_UART2		2
+#define LS2K0300_DMA_UART3		3
+#define LS2K0300_DMA_UART4		4
+#define LS2K0300_DMA_UART5		5
+#define LS2K0300_DMA_UART6		6
+#define LS2K0300_DMA_UART7		7
+#define LS2K0300_DMA_UART8		8
+#define LS2K0300_DMA_UART9		9
+
+/* I2C controllers */
+#define LS2K0300_DMA_I2C0		10
+#define LS2K0300_DMA_I2C1		11
+#define LS2K0300_DMA_I2C2		12
+#define LS2K0300_DMA_I2C3		13
+
+/* SPI controllers (IO mode) */
+#define LS2K0300_DMA_SPI2		14
+#define LS2K0300_DMA_SPI3		15
+
+/* I2S controller */
+#define LS2K0300_DMA_I2S		16
+
+/* ADC controller */
+#define LS2K0300_DMA_ADC		17
+
+/* CAN-FD controllers */
+#define LS2K0300_DMA_CAN0		18
+#define LS2K0300_DMA_CAN1		19
+#define LS2K0300_DMA_CAN2		20
+#define LS2K0300_DMA_CAN3		21
+
+#endif /* _DT_BINDINGS_DMA_LOONGSON_LS2K_DMAMUX_H */
-- 
2.52.0

