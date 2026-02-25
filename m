Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DC1C2DAFCB
	for <loongarch@lists.linux.dev>; Wed, 25 Feb 2026 07:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772005287; cv=none; b=UiKN7FWMvwRJzDj2pWVi5FE06k9jPH/AihjehRhnw16ZYTUnMDZlQCD5vRGfrRkjzHfZBuX/lznHmwIh7FDSihM7czPi8cJ13OopArwzX0uAv9x42ujub2/z/re11nOrxNC+zQ5H15+gn0Aw0imFhZJR+iNfkngjzH858Qnss7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772005287; c=relaxed/simple;
	bh=EutGQUaMDIzHuWT1tx8LPFOvQZ2f7qftHu1DzmloBGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G+1FM0vQtJZwn5YAudm3rVxjHTjkw6SaOwoEIKeh9fmTB2laoIb/4XDU6QpXkH1y9Q7CaD1YgUsOXJpj52Ulo0zSflbBHtcGJDYotVWWvbxduxIvldpcknlFaU82mmPCQUHyqufpa6ZdO8LqOoKLQtu+lVwYJ9kGOxwHFrYsb6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.227])
	by gateway (Coremail) with SMTP id _____8DxccChp55pIf4UAA--.5163S3;
	Wed, 25 Feb 2026 15:41:21 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.227])
	by front1 (Coremail) with SMTP id qMiowJBxSeCep55pI8RKAA--.10141S3;
	Wed, 25 Feb 2026 15:41:19 +0800 (CST)
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
Subject: [PATCH v3 5/6] dt-bindings: dmaengine: Add Loongson Multi-Channel DMA controller
Date: Wed, 25 Feb 2026 15:41:10 +0800
Message-ID: <37c29c43b8acb406a3d20c4575da7d4f1163d812.1771989596.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:qMiowJBxSeCep55pI8RKAA--.10141S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEJCGmejz8BlwAAsQ
X-Coremail-Antispam: 1Uk129KBj93XoWxWFWDZryrJFyrKrWfAF4xGrX_yoWrJr1DpF
	ZxCr9agr40qF13Aan5tF18Cr1fX3s7A3W7WFZFyw18Kr98G3WYvw4akryqvay7CrWIqFW7
	ZFZa9rWUWa4xAwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkqb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWrXVW3AwAv7VC2z280
	aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28Icx
	kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
	xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42
	IY6xIIjxv20xvE14v26F1j6w1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF
	0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87
	Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU0HUDJUUUUU==

The Loongson-2K0300/Loongson-2K3000 have built-in multi-channel DMA
controllers, which are similar except for some of the register offsets
and number of channels.

Obviously, this is quite different from the APB DMA controller used in
the Loongson-2K0500/Loongson-2K1000, such as the latter being a
single-channel DMA controller.

To avoid cluttering a single dt-binding file, add a new yaml file.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../bindings/dma/loongson,ls2k0300-dma.yaml   | 81 +++++++++++++++++++
 MAINTAINERS                                   |  3 +-
 2 files changed, 83 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/dma/loongson,ls2k0300-dma.yaml

diff --git a/Documentation/devicetree/bindings/dma/loongson,ls2k0300-dma.yaml b/Documentation/devicetree/bindings/dma/loongson,ls2k0300-dma.yaml
new file mode 100644
index 000000000000..c3151d806b55
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/loongson,ls2k0300-dma.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/loongson,ls2k0300-dma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Looongson-2 Multi-Channel DMA controller
+
+description:
+  The Loongson-2 Multi-Channel DMA controller is used for transferring data
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
+    enum:
+      - loongson,ls2k0300-dma
+      - loongson,ls2k3000-dma
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description:
+      Should contain all of the per-channel DMA interrupts in ascending order
+      with respect to the DMA channel index.
+    minItems: 4
+    maxItems: 8
+
+  clocks:
+    maxItems: 1
+
+  '#dma-cells':
+    const: 2
+    description: |
+      DMA request from clients consists of 2 cells:
+        1. Channel index
+        2. Transfer request factor number, If no transfer factor, use 0.
+           The number is SoC-specific, and this should be specified with
+           relation to the device to use the DMA controller.
+
+  dma-channels:
+    enum: [4, 8]
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - '#dma-cells'
+  - dma-channels
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/loongson,ls2k-clk.h>
+
+    dma-controller@1612c000 {
+        compatible = "loongson,ls2k0300-dma";
+        reg = <0x1612c000 0xff>;
+        interrupt-parent = <&liointc0>;
+        interrupts = <23 IRQ_TYPE_LEVEL_HIGH>,
+                     <24 IRQ_TYPE_LEVEL_HIGH>,
+                     <25 IRQ_TYPE_LEVEL_HIGH>,
+                     <26 IRQ_TYPE_LEVEL_HIGH>,
+                     <27 IRQ_TYPE_LEVEL_HIGH>,
+                     <28 IRQ_TYPE_LEVEL_HIGH>,
+                     <29 IRQ_TYPE_LEVEL_HIGH>,
+                     <30 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clk LS2K0300_CLK_APB_GATE>;
+        #dma-cells = <2>;
+        dma-channels = <8>;
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index e8cd1e2dac13..aea29c28d865 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14948,10 +14948,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/gpio/loongson,ls-gpio.yaml
 F:	drivers/gpio/gpio-loongson-64bit.c
 
-LOONGSON-2 APB DMA DRIVER
+LOONGSON-2 DMA DRIVER
 M:	Binbin Zhou <zhoubinbin@loongson.cn>
 L:	dmaengine@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/dma/loongson,ls2k0300-dma.yaml
 F:	Documentation/devicetree/bindings/dma/loongson,ls2x-apbdma.yaml
 F:	drivers/dma/loongson/loongson2-apb-dma.c
 
-- 
2.52.0

