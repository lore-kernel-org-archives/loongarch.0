Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B70EE11CBB
	for <loongarch@lists.linux.dev>; Mon, 28 Aug 2023 12:39:03 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.109.102])
	by gateway (Coremail) with SMTP id _____8DxVuhmlexkJ4EcAA--.22670S3;
	Mon, 28 Aug 2023 20:39:02 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.102])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Ax98xllexkQrJlAA--.29412S2;
	Mon, 28 Aug 2023 20:39:02 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 4/5] dt-bindings: soc: loongson,ls2k-pmc: Allow syscon-reboot/syscon-poweroff as child
Date: Mon, 28 Aug 2023 20:38:59 +0800
Message-Id: <2bec39b1001732de60c1521d78e44a45ff94d6b6.1693218539.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <cover.1693218539.git.zhoubinbin@loongson.cn>
References: <cover.1693218539.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Ax98xllexkQrJlAA--.29412S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Kw1fXF1fJF13tw4fWryfGrX_yoW8Cw13pF
	ZrCwnxKw42vF13Zw1rtFyvkF4rJrWkCFsrGFZrJr1UCr9rX3WYqw43KFn0qa1UArWxXFyU
	XFWI9rWruFn2kwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AK
	xVWxJr0_GcWln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26rWY
	6Fy7McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_Jw0_GFylx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUneRRtUUUUU==

The reboot and poweroff features are actually part of the Power
Management Unit system controller, thus allow them as its children,
instead of specifying as separate device nodes with syscon phandle.

Without it, the reboot/poweroff feature becomes unavailable.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../soc/loongson/loongson,ls2k-pmc.yaml       | 29 ++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/loongson/loongson,ls2k-pmc.yaml b/Documentation/devicetree/bindings/soc/loongson/loongson,ls2k-pmc.yaml
index 7473c5659929..f9e72b43d10c 100644
--- a/Documentation/devicetree/bindings/soc/loongson/loongson,ls2k-pmc.yaml
+++ b/Documentation/devicetree/bindings/soc/loongson/loongson,ls2k-pmc.yaml
@@ -33,6 +33,18 @@ properties:
       addition, the PM need according to it to indicate that current
       SoC whether support Suspend To RAM.
 
+  syscon-poweroff:
+    $ref: /schemas/power/reset/syscon-poweroff.yaml#
+    type: object
+    description:
+      Node for power off method
+
+  syscon-reboot:
+    $ref: /schemas/power/reset/syscon-reboot.yaml#
+    type: object
+    description:
+      Node for reboot method
+
 required:
   - compatible
   - reg
@@ -44,10 +56,25 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
 
-    power-management@1fe27000 {
+    pmc: power-management@1fe27000 {
         compatible = "loongson,ls2k1000-pmc", "syscon";
         reg = <0x1fe27000 0x58>;
         interrupt-parent = <&liointc1>;
         interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
         loongson,suspend-address = <0x0 0x1c000500>;
+
+        syscon-reboot {
+            compatible ="syscon-reboot";
+            regmap = <&pmc>;
+            offset = <0x30>;
+            mask = <0x1>;
+        };
+
+        syscon-poweroff {
+            compatible ="syscon-poweroff";
+            regmap = <&pmc>;
+            offset = <0x14>;
+            mask = <0x3c00>;
+            value = <0x3c00>;
+        };
     };
-- 
2.39.3

