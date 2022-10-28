Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59EA01C37
	for <loongarch@lists.linux.dev>; Fri, 28 Oct 2022 07:32:30 +0000 (UTC)
Received: from loongson.cn (unknown [10.180.13.64])
	by gateway (Coremail) with SMTP id _____8CxKdiNhVtjegsDAA--.9751S3;
	Fri, 28 Oct 2022 15:32:29 +0800 (CST)
Received: from localhost.localdomain (unknown [10.180.13.64])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Dxd1eHhVtj6j0GAA--.3727S3;
	Fri, 28 Oct 2022 15:32:27 +0800 (CST)
From: Yinbo Zhu <zhuyinbo@loongson.cn>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Jianmin Lv <lvjianmin@loongson.cn>,
	Yun Liu <liuyun@loongson.cn>,
	Yang Li <yang.lee@linux.alibaba.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	loongarch@lists.linux.dev,
	Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 2/2] dt-bindings: hpet: add loongson-2 hpet
Date: Fri, 28 Oct 2022 15:32:22 +0800
Message-Id: <20221028073222.21609-2-zhuyinbo@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221028073222.21609-1-zhuyinbo@loongson.cn>
References: <20221028073222.21609-1-zhuyinbo@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Dxd1eHhVtj6j0GAA--.3727S3
X-CM-SenderInfo: 52kx5xhqerqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7uF15Xw17WF1kKrW5tF1DZFb_yoW8KFWrpa
	n7Cas3JrW0kF17Zws5KFy0k3WrZ3s5AFy7WF47J3WUCryDX3W5X3W3Ka4DZwsxCFW8Xay7
	ZFWfCr45Ka1Uur7anT9S1TB71UUUUj7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bS8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64
	kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28E
	F7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE
	52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I
	80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE
	7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x
	0EwIxGrwCF04k20xvE74AGY7Cv6cx26rWl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xF
	xVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWw
	C2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_
	Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJV
	WUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1U
	YxBIdaVFxhVjvjDU0xZFpf9x07UR89_UUUUU=

Add the Loongson-2 High Precision Event Timer (HPET) binding
with DT schema format using json-schema.

Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Change in v5:
		1. Replace string loongson2/Loongson2 with Loongson-2/loongson-2.
		2. Add the patch review information.

 .../bindings/timer/loongson,ls2k-hpet.yaml    | 50 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/loongson,ls2k-hpet.yaml

diff --git a/Documentation/devicetree/bindings/timer/loongson,ls2k-hpet.yaml b/Documentation/devicetree/bindings/timer/loongson,ls2k-hpet.yaml
new file mode 100644
index 000000000000..30685c8fbead
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/loongson,ls2k-hpet.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/loongson,ls2k-hpet.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Loongson-2 High Precision Event Timer (HPET)
+
+maintainers:
+  - Yinbo Zhu <zhuyinbo@loongson.cn>
+
+properties:
+  compatible:
+    const: loongson,ls2k-hpet
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: SoC apb clock
+
+  clock-names:
+    items:
+      - const: apb
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/loongson,ls2k-clk.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    timer@1fe24000 {
+        compatible = "loongson,ls2k-hpet";
+        reg = <0x1fe24000 0x15f>;
+        clocks = <&clk LOONGSON2_APB_CLK>;
+        clock-names = "apb";
+        interrupt-parent = <&liointc0>;
+        interrupts = <21 IRQ_TYPE_LEVEL_LOW>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 21c455d7a99a..e677c77136a2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11919,6 +11919,7 @@ LOONGSON-2 SOC SERIES HPET DRIVER
 M:	Yinbo Zhu <zhuyinbo@loongson.cn>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/timer/loongson,ls2k-hpet.yaml
 F:	drivers/clocksource/loongson2_hpet.c
 
 LSILOGIC MPT FUSION DRIVERS (FC/SAS/SPI)
-- 
2.31.1

