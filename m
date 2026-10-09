Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FBE53D9541
	for <loongarch@lists.linux.dev>; Fri,  9 Oct 2026 09:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791537602; cv=none; b=Cr5Bw1R8NU19oopMyanivSS1JjEz2G/R2dusU/LFjHzGBITIRPZo+aFYwWNTBnrNAt5o0cpJONJ/zXnZf5IVK67rhcdk8D5pLlzcm1o3gH8b9TIGzMdmbtzzduXr/ilZACDTTOGSf1jnBm5S3u3aErzJ4VxxTcNGBnQ8cMqv/uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791537602; c=relaxed/simple;
	bh=ftF/2sxWw2JztnIDfG2WiKEPbzxUTlg9vL8b8hmKWhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k5PzZgywrnRNIWfyRlJ8Yd1x0KQ/i4ai7hXv6NZUTq8MySe3G/hToBZ/Ggh+o/QoizdKuSVl/86Ha1nlmoaH1IrVwVF3OiaDy2h+HTYFcgsm+kJfDRrKVdtL0z3vf2bJiScijV+XHXhFH8YpdUefaISlgRhoqtyRX2PL2v6Amqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.159])
	by gateway (Coremail) with SMTP id _____8Cxf9O+schqcxUUAA--.58663S3;
	Fri, 09 Oct 2026 17:19:58 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.159])
	by front1 (Coremail) with SMTP id qMiowJDxBc22schqA2cqAA--.61825S4;
	Fri, 09 Oct 2026 17:19:56 +0800 (CST)
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
Subject: [PATCH v2 2/3] dt-bindings: dma: loongson: Add Loongson-2K0300 DMA mux support
Date: Fri,  9 Oct 2026 17:19:33 +0800
Message-ID: <f3f1563c342c53ead5ca625cadc447002c77c22d.1791535540.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:qMiowJDxBc22schqA2cqAA--.61825S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEPCGrIS3YGyQAAsX
X-Coremail-Antispam: 1Uk129KBj93XoWxXw4UGFWUuw1kAw43Zw1kZwc_yoWrJrWfpa
	17CrZagrW0qFyfA395Ja48Gr1rZrZ2yF42qFZrt34UK3s8Cas0vw4akF1YvF47ArW0vFW7
	XF9agrWUWa1UArcCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkSb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28Icx
	kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
	xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42
	IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY
	6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2js
	IEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxUzKZXUUUUU

The DMA mux on Loongson-2K0300 is not a standalone hardware block. It is
implemented as part of the chip configuration registers CHIP_CTRL13/14/15,
which route peripheral DMA requests to the physical channels of the CMC
DMA controller.

Document this as a DMA router. The #dma-cells = <3> specifier contains
the peripheral request ID, the target CMC DMA channel, and channel
configuration flags forwarded to the parent DMA controller.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../dma/loongson,ls2k0300-dmamux.yaml         | 72 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/loongson,ls2k0300-dmamux.yaml

diff --git a/Documentation/devicetree/bindings/dma/loongson,ls2k0300-dmamux.yaml b/Documentation/devicetree/bindings/dma/loongson,ls2k0300-dmamux.yaml
new file mode 100644
index 000000000000..0e6c794e1c90
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
index 172dde21275f..78622b255f88 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15351,6 +15351,7 @@ M:	Binbin Zhou <zhoubinbin@loongson.cn>
 L:	dmaengine@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/dma/loongson,ls2k0300-dma.yaml
+F:	Documentation/devicetree/bindings/dma/loongson,ls2k0300-dmamux.yaml
 F:	Documentation/devicetree/bindings/dma/loongson,ls2x-apbdma.yaml
 F:	drivers/dma/loongson/loongson2-apb-cmc-dma.c
 F:	drivers/dma/loongson/loongson2-apb-dma.c
-- 
2.52.0

