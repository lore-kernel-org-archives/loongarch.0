Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC4A310A19
	for <loongarch@lists.linux.dev>; Sun,  4 Aug 2024 06:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722753524; cv=none; b=OM0SqQJmUSIOhet/B2ckWpcYckV81luukasvDMGzuwYYTm775+M6r6b9bYvbc5NTtKZZMS37vV57hLwhAGrkRe9wKXp437vj4lSxop6XOZ8TwXp3VOXp6V5CCRaZ8/JTE7vIEX1AFyZ8vDQHXrzlgev+1Xin1a23KBjEO4SaiXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722753524; c=relaxed/simple;
	bh=6/biVdQxmNV2Z4pMXqnQLPXxcyTYMPKEddbFRh/rT8I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fG0a4vp2MOHGCO34491ZOXM4ni3e2NdzxywjwSjmxY8xDtzO9TVGGBHxjjQABHBFHr7uIp0W6MKxy5dKezXkAIBda/Gm4Aq4lGFG8mmnjzAgcsL4AcJjnMeXyWTcyV1MqXY1+I9QEhZQ2xXedgFYIb0eycalw1Z7q9OEkj6uzs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.4.132])
	by gateway (Coremail) with SMTP id _____8Dxi+rwIa9m4GsHAA--.25813S3;
	Sun, 04 Aug 2024 14:38:40 +0800 (CST)
Received: from haword-linux.loongson.cn (unknown [10.20.4.132])
	by front1 (Coremail) with SMTP id qMiowMAxYeHuIa9mVqcCAA--.14675S2;
	Sun, 04 Aug 2024 14:38:38 +0800 (CST)
From: zhenghaowei@loongson.cn
To: zhenghaowei@loongson.cn,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	p.zabel@pengutronix.de
Cc: linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: [PATCH v2 1/3] dt-bindings: serial: Add Loongson UART controller
Date: Sun,  4 Aug 2024 14:38:32 +0800
Message-ID: <20240804063834.70022-1-zhenghaowei@loongson.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMAxYeHuIa9mVqcCAA--.14675S2
X-CM-SenderInfo: x2kh0w5kdr4v3l6o00pqjv00gofq/1tbiAgETBGauHZgENQAAso
X-Coremail-Antispam: 1Uk129KBj93XoWxArWkuFy3tr4kZw4Dur1kCrX_yoW5ZFWfpa
	15CwnxCr10gF47uws5Ga48AF15Z3s5AFnF9FsrJw1UKas8K3ZYqw4akF1Yvw17uFyUZFW2
	qFyFkr4jka1UZrXCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkKb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AK
	xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lw4CEc2x0rVAKj4
	xxMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_
	Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x
	0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8
	JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIx
	AIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8dcTPUUUUU=
	=

From: Haowei Zheng <zhenghaowei@loongson.cn>

Add Loongson UART controller binding with DT schema format using
json-schema.

Signed-off-by: Haowei Zheng <zhenghaowei@loongson.cn>
---
 .../bindings/serial/loongson,ls7a-uart.yaml   | 74 +++++++++++++++++++
 MAINTAINERS                                   |  7 ++
 2 files changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serial/loongson,ls7a-uart.yaml

diff --git a/Documentation/devicetree/bindings/serial/loongson,ls7a-uart.yaml b/Documentation/devicetree/bindings/serial/loongson,ls7a-uart.yaml
new file mode 100644
index 000000000000..22d9cca5569e
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/loongson,ls7a-uart.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/loongson,ls7a-uart.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Loongson UART
+
+maintainers:
+  - Haowei Zheng <zhenghaowei@loongson.cn>
+
+properties:
+  compatible:
+    const: loongson,ls7a-uart
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
+  fractional-division:
+    description: Enables fractional-N division. Currently,
+      only LS2K1500 and LS2K2000 support this feature.
+
+  rts-invert:
+    description: Inverts the RTS value in the MCR register.
+      This should be used on Loongson-3 series CPUs, Loongson-2K
+      series CPUs, and Loongson LS7A bridge chips.
+
+  dtr-invert:
+    description: Inverts the DTR value in the MCR register.
+      This should be used on Loongson-3 series CPUs, Loongson-2K
+      series CPUs, and Loongson LS7A bridge chips.
+
+  cts-invert:
+    description: Inverts the CTS value in the MSR register.
+      This should be used on Loongson-2K0500, Loongson-2K1000,
+      and Loongson LS7A bridge chips.
+
+  dsr-invert:
+    description: Inverts the DSR value in the MSR register.
+      This should be used on Loongson-2K0500, Loongson-2K1000,
+      and Loongson LS7A bridge chips.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+allOf:
+  - $ref: serial.yaml
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/loongson,ls2k-clk.h>
+
+    serial@1fe001e0 {
+        compatible = "loongson,ls7a-uart";
+        reg = <0x0 0x1fe001e0 0x0 0x10>;
+        clock-frequency = <100000000>;
+        interrupt-parent = <&liointc>;
+        interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
+        fractional-division;
+        rts-invert;
+        dtr-invert;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 8766f3e5e87e..a6306327dba5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13189,6 +13189,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml
 F:	drivers/i2c/busses/i2c-ls2x.c
 
+LOONGSON UART DRIVER
+M:	Haowei Zheng <zhenghaowei@loongson.cn>
+L:	linux-serial@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/serial/loongson,ls7a-uart.yaml
+F:	drivers/tty/serial/8250/8250_loongson.c
+
 LOONGSON-2 SOC SERIES CLOCK DRIVER
 M:	Yinbo Zhu <zhuyinbo@loongson.cn>
 L:	linux-clk@vger.kernel.org
-- 
2.43.0

