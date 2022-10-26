Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 270DCED0
	for <loongarch@lists.linux.dev>; Wed, 26 Oct 2022 03:58:02 +0000 (UTC)
Received: from loongson.cn (unknown [10.180.13.64])
	by gateway (Coremail) with SMTP id _____8CxKdhJsFhjnYcCAA--.8003S3;
	Wed, 26 Oct 2022 11:58:01 +0800 (CST)
Received: from localhost.localdomain (unknown [10.180.13.64])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxXuBCsFhjESQFAA--.19175S3;
	Wed, 26 Oct 2022 11:58:00 +0800 (CST)
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
Subject: [PATCH v4 2/2] dt-bindings: hpet: add loongson2 hpet
Date: Wed, 26 Oct 2022 11:57:52 +0800
Message-Id: <20221026035752.32681-2-zhuyinbo@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221026035752.32681-1-zhuyinbo@loongson.cn>
References: <20221026035752.32681-1-zhuyinbo@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxXuBCsFhjESQFAA--.19175S3
X-CM-SenderInfo: 52kx5xhqerqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7uF15Xw15uFy5Ar4DKr1rJFb_yoW8Kw13pa
	n7CF1rJr40gF13Z39xtFy0k3WrZ34kAFy7WF17A3W7KF98X3WrX3W2ka4DZa13CFW8Way7
	ZFWSkr4UKayUur7anT9S1TB71UUUUj7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bfkFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64
	kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28E
	F7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAaw2AFwI0_JF0_Jw1le2I262IYc4CY
	6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrV
	C2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE
	7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x
	0EwIxGrwCF04k20xvE74AGY7Cv6cx26rWl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xF
	xVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWw
	C2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_
	Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJV
	WUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIY
	CTnIWIevJa73UjIFyTuYvjxUc9mRUUUUU

Add the loongson2 High Precision Event Timer (HPET) binding
with DT schema format using json-schema.

Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
---
Change in v4: 
                1. Fixup the clock-names that replace apb-clk with apb.
                2. This patch need rely on clock patch, which patchwork  
                   link was "https://patchwork.kernel.org/project/linux-clk/list/?series=688892".

 .../bindings/timer/loongson,ls2k-hpet.yaml    | 50 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/loongson,ls2k-hpet.yaml

diff --git a/Documentation/devicetree/bindings/timer/loongson,ls2k-hpet.yaml b/Documentation/devicetree/bindings/timer/loongson,ls2k-hpet.yaml
new file mode 100644
index 000000000000..9682d86e3339
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/loongson,ls2k-hpet.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/loongson,ls2k-hpet.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Loongson2 High Precision Event Timer (HPET)
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
index db29c1dc2d89..8cc541ce89b8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11919,6 +11919,7 @@ LOONGSON2 SOC SERIES HPET DRIVER
 M:	Yinbo Zhu <zhuyinbo@loongson.cn>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/timer/loongson,ls2k-hpet.yaml
 F:	drivers/clocksource/loongson2_hpet.c
 
 LSILOGIC MPT FUSION DRIVERS (FC/SAS/SPI)
-- 
2.31.1

