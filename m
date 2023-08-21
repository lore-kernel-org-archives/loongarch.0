Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D59D65694
	for <loongarch@lists.linux.dev>; Mon, 21 Aug 2023 12:49:39 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.109.102])
	by gateway (Coremail) with SMTP id _____8CxNvFdXeNkPZcaAA--.54311S3;
	Mon, 21 Aug 2023 20:49:33 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.102])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Bx3yNWXeNkqYJfAA--.61781S3;
	Mon, 21 Aug 2023 20:49:28 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Hongliang Wang <wanghongliang@loongson.cn>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v3 1/7] dt-bindings: loongarch: Add CPU bindings for LoongArch
Date: Mon, 21 Aug 2023 20:49:17 +0800
Message-Id: <47d5ef30a513a7185a6ea94d8e6f6d9e393eba92.1692618548.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <cover.1692618548.git.zhoubinbin@loongson.cn>
References: <cover.1692618548.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Bx3yNWXeNkqYJfAA--.61781S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7WF4ftF48ZFW5KrWxJr4xAFc_yoW8AFy7p3
	ZrCFn8Gr1F9F12qwsIqa4kGF1Fyws7Ca47XFW7KryUKasxWasYvw1akFn8Z3W7A348Ca4I
	vFWrCw1UKF1UAFcCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	tVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0epB3UUUUU==

Add the available CPUs in LoongArch binding with DT schema format using
json-schema.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../devicetree/bindings/loongarch/cpus.yaml   | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/loongarch/cpus.yaml

diff --git a/Documentation/devicetree/bindings/loongarch/cpus.yaml b/Documentation/devicetree/bindings/loongarch/cpus.yaml
new file mode 100644
index 000000000000..57dd41058056
--- /dev/null
+++ b/Documentation/devicetree/bindings/loongarch/cpus.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/loongarch/cpus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LoongArch CPUs
+
+maintainers:
+  - Binbin Zhou <zhoubinbin@loongson.cn>
+
+description:
+  This document describes the list of LoongArch CPU cores that support FDT,
+  it describe the layout of CPUs in a system through the "cpus" node.
+
+allOf:
+  - $ref: /schemas/cpu.yaml#
+
+properties:
+  compatible:
+    enum:
+      - loongson,la264
+      - loongson,la364
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  device_type: true
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/loongson,ls2k-clk.h>
+
+    cpus {
+        #size-cells = <0>;
+        #address-cells = <1>;
+
+        cpu@0 {
+            compatible = "loongson,la264";
+            device_type = "cpu";
+            reg = <0>;
+            clocks = <&clk LOONGSON2_NODE_CLK>;
+        };
+
+        cpu@1 {
+            compatible = "loongson,la264";
+            device_type = "cpu";
+            reg = <1>;
+            clocks = <&clk LOONGSON2_NODE_CLK>;
+        };
+    };
+
+...
-- 
2.39.3

