Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794211759;
	b=hpZ+8CsXVm8YBMjunP7H+N9QD9MjsGPRjom7G6UbiNa4CFcn41KaikUGWyllBhiub87n
	 pwO18C1EqIS4NDvBozTkYPXPM7/c8WXMArWIDKchf/EsAp3cz3CTp0Wa3QfY8e8CX23pg
	 HmFNlGbb/zO90+t36H6qbYMrZ2FcqBzes+AW2x3nEVojGjUleQRJRlI3ujfFIENam/Hzt
	 FqKHW99FCmaVshhV5U0PlVkPOTdBKqM5LbjQ3tO/9mZhTCueoiKeaD4m5CLQ46zMBWZEz
	 F5OiIbtOcU1m4LztGc/uvq/9ehEuAsPo2KViWtOWhfXu9iJbRtZ0WzgDA2jCXowebzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794211759;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=qnRqh7sNWPFUHnHx/xEf9u7XPCiSySAfPpWvNkItrI0=;
	b=f0VJhV1ZGJDknqIUilqCoVWitS/Wg6RSc/aIEkBCXPC4waG1GZW+ktftgAkyuOvnCiXz
	 63kcB3Ov3qAc1cuETDB+il9sfSuOC1jm7Relv72w9+6G2DwoSCg3ukc+6tfO9LQjIKfW1
	 Fibrj4r1SL/Cdo6aSOmLByzYkxg3DlRvcS6TMADxom8gzPiFQuZ+1cn94GyHHyGaMIkKr
	 qzMEI4uES2O6sNiA7M1XbI/4rqSd4M0VgC7gkp/D4RUwrbbDndbjHiEV3lrPFuyJwcoaJ
	 raCaK+iQOG0esP8DK4amvszvYHUDoY/HPZZqso0GGstbRx0ggXDriuohi6LCpCOPi+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69978606A334
	for <loongarch@lists.linux.dev>; Mon,  9 Nov 2026 08:09:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69978606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.17])
	by gateway (Coremail) with SMTP id _____8DxC9Ktf_Fqub8dAA--.20381S3;
	Mon, 09 Nov 2026 16:09:17 +0800 (CST)
Received: from kernelserver (unknown [223.64.69.17])
	by front1 (Coremail) with SMTP id qMiowJAxmM2lf_FqdCQzAA--.37921S5;
	Mon, 09 Nov 2026 16:09:16 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	zhanghongchen <zhanghongchen@loongson.cn>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v9 6/7] dt-bindings: thermal: loongson,ls2k-thermal: Add compatible for Loongson-2K0300
Date: Mon,  9 Nov 2026 16:09:02 +0800
Message-ID: <2a1852ad8091cde3c07b5b19f51ab35b1378a280.1794211535.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1794211535.git.zhoubinbin@loongson.cn>
References: <cover.1794211535.git.zhoubinbin@loongson.cn>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxmM2lf_FqdCQzAA--.37921S5
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEGCGrxKfoFZwAAsk
X-Coremail-Antispam: 1Uk129KBj93XoWxCr45Gw43Gr4fWF4rXrW7KFX_yoW5CFW7pF
	sxCw48Gr1kKF1UZ398tFy8CanYvF92yasrurs7Gr13Krs8K3yaq3y3K3WYvayfur10qFy7
	ur1vkr4UCF1DCrXCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBSb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1a6r1DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2
	xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
	Wrv_ZF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x
	0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E74
	80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0
	I7IYx2IY67AKxVW7JVWDJwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42
	xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF
	7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4xR6DUUUU

Add a new compatible string `loongson,ls2k0300-thermal` for the thermal
sensor found on the Loongson-2K0300 SoC.

The hardware differs from existing SoCs in that it requires a phandle to
a syscon node that provides the CHIP ID register, used as a compensation
source in the temperature calculation.

Update the binding to make `loongson,chipid` required for this new
compatible, and clarify the register region requirements for each
variant.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../thermal/loongson,ls2k-thermal.yaml        | 73 ++++++++++++++-----
 1 file changed, 55 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.yaml b/Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.yaml
index 79e691b08341..d312e27737a2 100644
--- a/Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.yaml
@@ -10,13 +10,11 @@ maintainers:
   - zhanghongchen <zhanghongchen@loongson.cn>
   - Yinbo Zhu <zhuyinbo@loongson.cn>
 
-allOf:
-  - $ref: /schemas/thermal/thermal-sensor.yaml#
-
 properties:
   compatible:
     oneOf:
       - enum:
+          - loongson,ls2k0300-thermal
           - loongson,ls2k1000-thermal
           - loongson,ls2k2000-thermal
       - items:
@@ -34,28 +32,56 @@ properties:
   '#thermal-sensor-cells':
     const: 1
 
+  loongson,chipid:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the syscon with the Loongson-2K0300 CHIP ID.
+
 required:
   - compatible
   - reg
   - interrupts
 
-if:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - loongson,ls2k2000-thermal
+allOf:
+  - $ref: /schemas/thermal/thermal-sensor.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: loongson,ls2k0300-thermal
+    then:
+      properties:
+        reg:
+          items:
+            - description: Thermal base register region
+      required:
+        - loongson,chipid
 
-then:
-  properties:
-    reg:
-      minItems: 2
-      maxItems: 2
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: loongson,ls2k1000-thermal
+    then:
+      properties:
+        loongson,chipid: false
+        reg:
+          items:
+            - description: Thermal base register region
 
-else:
-  properties:
-    reg:
-      maxItems: 1
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: loongson,ls2k2000-thermal
+    then:
+      properties:
+        loongson,chipid: false
+        reg:
+          items:
+            - description: Thermal base register region
+            - description: Thermal data output register region
 
 unevaluatedProperties: false
 
@@ -69,3 +95,14 @@ examples:
         interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
         #thermal-sensor-cells = <1>;
     };
+
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    thermal-sensor@16001500 {
+       compatible = "loongson,ls2k0300-thermal";
+       reg = <0x16001500 0x30>;
+       interrupt-parent = <&liointc1>;
+       interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
+       loongson,chipid = <&chipid>;
+       #thermal-sensor-cells = <1>;
+    };
-- 
2.52.0

