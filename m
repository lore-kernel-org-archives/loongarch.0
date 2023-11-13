Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 123B26ABC
	for <loongarch@lists.linux.dev>; Mon, 13 Nov 2023 02:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from loongson.cn (unknown [112.20.112.120])
	by gateway (Coremail) with SMTP id _____8Dx_+vCi1FlkG45AA--.46167S3;
	Mon, 13 Nov 2023 10:36:50 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.112.120])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Dxvi_Bi1Fly1JAAA--.9842S2;
	Mon, 13 Nov 2023 10:36:50 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn,
	devicetree@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-mips@vger.kernel.org,
	lvjianmin@loongson.cn,
	WANG Xuerui <git@xen0n.name>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v4 3/5] dt-bindings: interrupt-controller: loongson,liointc: Fix dtbs_check warning for interrupt-names
Date: Mon, 13 Nov 2023 10:36:45 +0800
Message-Id: <a162081f9b707580700a2b10719300511c6e6baf.1699521866.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <cover.1699521866.git.zhoubinbin@loongson.cn>
References: <cover.1699521866.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Dxvi_Bi1Fly1JAAA--.9842S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxCw43ZF4rKr1UAFWkGryxCrX_yoW5AFyfpF
	ZrC3ZrXr4UtF13Cw48tw10k3Z8Zrn5AwnI93Z7C3y7GFnFqa48Zr43tF95XF4rGrZ7Xa42
	qryFgayxWa47AabCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWr
	XVW3AwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0_WrPUUUUU==

The Loongson-2K0500/2K1000 CPUs have 64 interrupt sources as inputs, and
a route-mapped node handles up to 32 interrupt sources, so two liointc
nodes are defined in dts{i}.

Of course, we have to make sure that the routing outputs ("intx") of the
two nodes do not conflict, i.e. "int0" can only be used as a routing
output for one of them. Therefore, "interrupt-names" should be defined
as "pattern".

In addition, since "interrupt-names" and "interrupts" are one-to-one
correspondence, we pass it to get the corresponding interrupt number in
the driver. Setting it to "required" does not break ABI, because it
is already logically represented as "required".

This fixes dtbs_check warning:

DTC_CHK arch/loongarch/boot/dts/loongson-2k0500-ref.dtb
arch/loongarch/boot/dts/loongson-2k0500-ref.dtb: interrupt-controller@1fe11440: interrupt-names:0: 'int0' was expected
        From schema: Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
arch/loongarch/boot/dts/loongson-2k0500-ref.dtb: interrupt-controller@1fe11440: Unevaluated properties are not allowed ('interrupt-names' was unexpected)
        From schema: Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
DTC_CHK arch/loongarch/boot/dts/loongson-2k1000-ref.dtb
arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: interrupt-controller@1fe01440: interrupt-names:0: 'int0' was expected
        From schema: Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: interrupt-controller@1fe01440: Unevaluated properties are not allowed ('interrupt-names' was unexpected)
        From schema: Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml

Acked-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../bindings/interrupt-controller/loongson,liointc.yaml    | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
index 8e1292e6f3ff..896e2fef67f8 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
@@ -51,11 +51,9 @@ properties:
   interrupt-names:
     description: List of names for the parent interrupts.
     items:
-      - const: int0
-      - const: int1
-      - const: int2
-      - const: int3
+      pattern: int[0-3]
     minItems: 1
+    maxItems: 4
 
   '#interrupt-cells':
     const: 2
@@ -84,6 +82,7 @@ required:
   - compatible
   - reg
   - interrupts
+  - interrupt-names
   - interrupt-controller
   - '#interrupt-cells'
   - loongson,parent-int-map
-- 
2.39.3

