Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64C4C8F5B
	for <loongarch@lists.linux.dev>; Mon, 26 Aug 2024 02:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724640434; cv=none; b=kaF1LN4jC4z3AtVjW53a2YQ6B+Fv8sYoB46nd7L+i72cuW25clyPSj2Ukd3NAGKH3mmdTkQdnFNdU1Y2i1iiNJOVE6zV3CDjEsBhtmFLRWUixOupJeQKjPNY2tDCKYjgTVwK3YrlJ2+i+ofPXIlvgrAUiW2ibmJBHzsIfSG/9AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724640434; c=relaxed/simple;
	bh=ZsxxPaAL19teG19fNhATIXuviD8uVvWOYXCbhkHX08c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pqStaSduPZ1/4y2S45ISc+e9wK+CGuXBQRz+zOLGyWcwJpD8t7a4kcHIarUvD79RL3a3VoX21Veu2mxgKKsADUNJTtcBWGvMGorLlVD3XQ58c4wy7uhMQ7YhPJ/pI24WuLhGLLtwvPtuEyWktAezuGssP+nSI9YNiSbZPveyWiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.4.132])
	by gateway (Coremail) with SMTP id _____8Cxd+mu7Mtm2vofAA--.64493S3;
	Mon, 26 Aug 2024 10:47:10 +0800 (CST)
Received: from haword-linux.loongson.cn (unknown [10.20.4.132])
	by front1 (Coremail) with SMTP id qMiowMCxC2er7MtmDH4iAA--.51899S3;
	Mon, 26 Aug 2024 10:47:08 +0800 (CST)
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
Subject: [PATCH v3 1/3] dt-bindings: serial: Add Loongson UART controller
Date: Mon, 26 Aug 2024 10:47:03 +0800
Message-ID: <20240826024705.55474-2-zhenghaowei@loongson.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826024705.55474-1-zhenghaowei@loongson.cn>
References: <20240826024705.55474-1-zhenghaowei@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCxC2er7MtmDH4iAA--.51899S3
X-CM-SenderInfo: x2kh0w5kdr4v3l6o00pqjv00gofq/1tbiAQEBBGbLHfYEKwABst
X-Coremail-Antispam: 1Uk129KBj93XoWxAF1UZF1ftF13ArW7Xw4kKrX_yoW5GFy8pF
	sxCa9rGr40gF17ua98XFy8Ga1rZr95AanrXF47Jw17Kas8Kas0vr15KF1jqw47Cr1UXryU
	uFy0gF42ga48urcCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkKb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lw4CEc2x0rVAKj4
	xxMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_
	Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x
	0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8
	JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIx
	AIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8-_-PUUUUU=
	=

From: Haowei Zheng <zhenghaowei@loongson.cn>

Add Loongson UART controller binding with DT schema format using
json-schema.

Signed-off-by: Haowei Zheng <zhenghaowei@loongson.cn>
---
 .../bindings/serial/loongson,uart.yaml        | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serial/loongson,uart.yaml

Changes in V2:

- Correct the schema formatting errors.

- file name changed from 'loongson-uart.yaml' to 'loongson,ls7a-uart.yaml'

- Replace 'loongson,loongson-uart' with 'loongson,ls7a-uart'.

Changes in V3:

- Change the filename from 'loongson,ls7a-uart.yaml' to 'loongson,uart.yaml'.

- Drop newly defined features: fractional-division, rts-invert, dtr-invert,
  cts-invert and dsr-invert.

- Add three specific SoC: 'loongson,ls7a-uart', 'loongson,ls3a5000-uart' and 
  'loongson,ls2k2000-uart'.

- Drop 'LOONGSON UART DRIVER' description in MAINTAINERS.

diff --git a/Documentation/devicetree/bindings/serial/loongson,uart.yaml b/Documentation/devicetree/bindings/serial/loongson,uart.yaml
new file mode 100644
index 000000000000..19a65dd5be9f
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/loongson,uart.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/loongson,uart.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Loongson UART
+
+maintainers:
+  - Haowei Zheng <zhenghaowei@loongson.cn>
+
+allOf:
+  - $ref: serial.yaml
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - loongson,ls7a-uart
+          - loongson,ls3a5000-uart
+          - loongson,ls2k2000-uart
+      - items:
+          - enum:
+              - loongson,ls2k1000-uart
+              - loongson,ls2k0500-uart
+          - const: loongson,ls7a-uart
+      - items:
+          - enum:
+              - loongson,ls2k1500-uart
+          - const: loongson,ls2k2000-uart
+      - items:
+          - enum:
+              - loongson,ls3a6000-uart
+          - const: loongson,ls3a5000-uart
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clock-frequency: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clock-frequency
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/loongson,ls2k-clk.h>
+
+    serial@1fe20000 {
+        compatible = "loongson,ls2k1000-uart", "loongson,ls7a-uart";
+        reg = <0x1fe20000 0x10>;
+        clock-frequency = <125000000>;
+        interrupt-parent = <&liointc0>;
+        interrupts = <0x0 IRQ_TYPE_LEVEL_HIGH>;
+    };
-- 
2.43.0

