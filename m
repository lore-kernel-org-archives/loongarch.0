Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3FC418AE6
	for <loongarch@lists.linux.dev>; Thu,  7 Dec 2023 07:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.109.254])
	by gateway (Coremail) with SMTP id _____8Bx5fBydHFl2Y8_AA--.62320S3;
	Thu, 07 Dec 2023 15:29:54 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.254])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Dxnd5vdHFl7EhXAA--.63284S3;
	Thu, 07 Dec 2023 15:29:53 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	devicetree@vger.kernel.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	lvjianmin@loongson.cn,
	WANG Xuerui <git@xen0n.name>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v6 1/2] dt-bindings: interrupt-controller: loongson,liointc: Fix dtbs_check warning for reg-names
Date: Thu,  7 Dec 2023 15:29:38 +0800
Message-Id: <fde4d43ab25ad2a936c1b50ab7ed292345fcd32c.1701933946.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <cover.1701933946.git.zhoubinbin@loongson.cn>
References: <cover.1701933946.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Dxnd5vdHFl7EhXAA--.63284S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxZr18ZryxZFyDuryxCFy8WFX_yoW5AFykpa
	y7CwsrKF48KF13u3ykt340krnxZrn3AwnIyan7A3y7GFnFqw1UZr13tF95JF4fGrZ2qa4j
	vrWF9ayxKFyqyabCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2
	xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
	Jw0_WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x
	0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E74
	80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0
	I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04
	k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7Cj
	xVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j2MKZUUUUU=

As we know, the Loongson-2K0500 is a single-core CPU, and the
core1-related register (isr1) does not exist. So "reg" and "reg-names"
should be set to "minItems 2"(main nad isr0).

This fixes dtbs_check warning:

DTC_CHK arch/loongarch/boot/dts/loongson-2k0500-ref.dtb
arch/loongarch/boot/dts/loongson-2k0500-ref.dtb: interrupt-controller@1fe11400: reg-names: ['main', 'isr0'] is too short
        From schema: Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
arch/loongarch/boot/dts/loongson-2k0500-ref.dtb: interrupt-controller@1fe11400: Unevaluated properties are not allowed ('reg-names' was unexpected)
        From schema: Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
arch/loongarch/boot/dts/loongson-2k0500-ref.dtb: interrupt-controller@1fe11400: reg: [[0, 534844416, 0, 64], [0, 534843456, 0, 8]] is too short
        From schema: Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
arch/loongarch/boot/dts/loongson-2k0500-ref.dtb: interrupt-controller@1fe11440: reg-names: ['main', 'isr0'] is too short
        From schema: Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
Acked-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../interrupt-controller/loongson,liointc.yaml        | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
index 00b570c82903..a3276c1d9b59 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
@@ -11,8 +11,13 @@ maintainers:
 
 description: |
   This interrupt controller is found in the Loongson-3 family of chips and
-  Loongson-2K1000 chip, as the primary package interrupt controller which
+  Loongson-2K series chips, as the primary package interrupt controller which
   can route local I/O interrupt to interrupt lines of cores.
+  Be aware of the following points.
+  1.The Loongson-2K0500 is a single core CPU;
+  2.The Loongson-2K0500/2K1000 has 64 device interrupt sources as inputs, so we
+    need to define two nodes in dts{i} to describe the "0-31" and "32-61" interrupt
+    sources respectively.
 
 allOf:
   - $ref: /schemas/interrupt-controller.yaml#
@@ -33,6 +38,7 @@ properties:
       - const: main
       - const: isr0
       - const: isr1
+    minItems: 2
 
   interrupt-controller: true
 
@@ -86,7 +92,8 @@ if:
 then:
   properties:
     reg:
-      minItems: 3
+      minItems: 2
+      maxItems: 3
 
   required:
     - reg-names
-- 
2.39.3

