Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0BBC3385A6
	for <loongarch@lists.linux.dev>; Tue,  3 Feb 2026 12:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770121847; cv=none; b=L+HMLciFmiz04JVbs6qXTtIk5TS4AYACatO4jfr/SNHTauzSs/xqDqUBEnuT+AE+YIq9s/VACTmNBey4aqbcCc/YMWhcBCzCm752sug1MZBbUlUKXw4v1bnTNkZrcycPjMQAn3uWCK8bEkU3HVQqspSfOtH3xQ6SgJ1Jifir2to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770121847; c=relaxed/simple;
	bh=ysUcfXcLzSnqtQqRKM1sl+X9iubyo+jK2tc3b2dQ6Os=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EjowPR1uJKlV+YwLUKy58FS2qHpbs1Vihm7N1n17ZfYDykvvInR9kmU48dAUwoSqNywiJK0W/Q3AMYnKvi+Dnao9ybD/hOxqzAV4JuY/fOGkY6x/8Bhm5CIu1FifsfTqstKN5IiwMpwVQkDKD/4r5+H4HtZe2y5/4iLmDrJ7VHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.42])
	by gateway (Coremail) with SMTP id _____8DxecJw6oFpJV0PAA--.49332S3;
	Tue, 03 Feb 2026 20:30:40 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.42])
	by front1 (Coremail) with SMTP id qMiowJBxKMFl6oFp7RY_AA--.38493S4;
	Tue, 03 Feb 2026 20:30:37 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	dmaengine@vger.kernel.org
Cc: Xiaochuang Mao <maoxiaochuan@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 2/3] dt-bindings: dmaengine: Add Loongson Multi-Channel DMA controller
Date: Tue,  3 Feb 2026 20:30:11 +0800
Message-ID: <7d6bb6ddc9b2d7c760fa0dcef30123f700e47f77.1770119693.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770119693.git.zhoubinbin@loongson.cn>
References: <cover.1770119693.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxKMFl6oFp7RY_AA--.38493S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEHCGmBjjoIDQAAsW
X-Coremail-Antispam: 1Uk129KBj93XoWxWFWDZryrJFyrKrWfAF4xGrX_yoW5tw4kpF
	sxCr9agr40qF13Aan5JF18Cr1rX3s7A3W7WFZrtw17Kr98G3WYvw13Kryqqay7GrW7XFW7
	ZFZ29rWUWa4xAwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcHUqUUUUU

The Loongson-2K0300/Loongson-2K3000 have built-in multi-channel DMA
controllers, which are similar except for some of the register offsets
and number of channels.

Obviously, this is quite different from the APB DMA controller used in
the Loongson-2K0500/Loongson-2K1000, such as the latter being a
single-channel DMA controller.

To avoid cluttering a single dt-binding file, add a new yaml file.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../bindings/dma/loongson,ls2k0300-dma.yaml   | 78 +++++++++++++++++++
 MAINTAINERS                                   |  3 +-
 2 files changed, 80 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/dma/loongson,ls2k0300-dma.yaml

diff --git a/Documentation/devicetree/bindings/dma/loongson,ls2k0300-dma.yaml b/Documentation/devicetree/bindings/dma/loongson,ls2k0300-dma.yaml
new file mode 100644
index 000000000000..d5316885ca85
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/loongson,ls2k0300-dma.yaml
@@ -0,0 +1,78 @@
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
+additionalProperties: false
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
index 66807104af63..16fe66bebac1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14771,10 +14771,11 @@ S:	Maintained
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
2.47.3

