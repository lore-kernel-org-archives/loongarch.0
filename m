Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C677F2113
	for <loongarch@lists.linux.dev>; Mon, 18 Dec 2023 01:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.112.176])
	by gateway (Coremail) with SMTP id _____8CxRPDupn9lvuYBAA--.10172S3;
	Mon, 18 Dec 2023 09:57:02 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.112.176])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxkuPopn9limEJAA--.45156S3;
	Mon, 18 Dec 2023 09:56:58 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Vinod Koul <vkoul@kernel.org>,
	dmaengine@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Yingkun Meng <mengyingkun@loongson.cn>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 1/2] dt-bindings: dmaengine: Add Loongson LS2X APB DMA controller
Date: Mon, 18 Dec 2023 09:56:38 +0800
Message-Id: <078307641077edaf46dd986c6d31cea15545a208.1702365725.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <cover.1702365725.git.zhoubinbin@loongson.cn>
References: <cover.1702365725.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxkuPopn9limEJAA--.45156S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxGw18ur1UAF1xCF1rJrWDAwc_yoW5Xr17pF
	nxCwnxKrW0qF17A395JFy0k3WfZ3s3A3ZrWa9rAwn7KrZxX3ZYvw1akr1vvay3Cr4jqFW7
	ZFZa9r4jkayxArcCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkqb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26Fy26r45twAv7VC2z280
	aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20x
	vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
	3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIx
	AIcVC0I7IYx2IY67AKxVW7JVWDJwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF
	0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z2
	80aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8v4EtUUUUU==

Add Loongson LS2X APB DMA controller binding with DT schema
format using json-schema.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../bindings/dma/loongson,ls2x-apbdma.yaml    | 62 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/loongson,ls2x-apbdma.yaml

diff --git a/Documentation/devicetree/bindings/dma/loongson,ls2x-apbdma.yaml b/Documentation/devicetree/bindings/dma/loongson,ls2x-apbdma.yaml
new file mode 100644
index 000000000000..6a1b49a49a64
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/loongson,ls2x-apbdma.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/loongson,ls2x-apbdma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Loongson LS2X APB DMA controller
+
+description:
+  The Loongson LS2X APB DMA controller is used for transferring data
+  between system memory and the peripherals on the APB bus.
+
+maintainers:
+  - Binbin Zhou <zhoubinbin@loongson.cn>
+
+allOf:
+  - $ref: dma-controller.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - const: loongson,ls2k1000-apbdma
+      - items:
+          - const: loongson,ls2k0500-apbdma
+          - const: loongson,ls2k1000-apbdma
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  '#dma-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - '#dma-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/loongson,ls2k-clk.h>
+
+    dma-controller@1fe00c00 {
+        compatible = "loongson,ls2k1000-apbdma";
+        reg = <0x1fe00c00 0x8>;
+        interrupt-parent = <&liointc1>;
+        interrupts = <12 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clk LOONGSON2_APB_CLK>;
+        #dma-cells = <1>;
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 788be9ab5b73..55e1be35f9dc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12504,6 +12504,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/gpio/loongson,ls-gpio.yaml
 F:	drivers/gpio/gpio-loongson-64bit.c
 
+LOONGSON LS2X APB DMA DRIVER
+M:	Binbin Zhou <zhoubinbin@loongson.cn>
+L:	dmaengine@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/dma/loongson,ls2x-apbdma.yaml
+
 LOONGSON LS2X I2C DRIVER
 M:	Binbin Zhou <zhoubinbin@loongson.cn>
 L:	linux-i2c@vger.kernel.org
-- 
2.39.3

