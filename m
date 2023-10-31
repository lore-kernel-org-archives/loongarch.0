Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49766182B5
	for <loongarch@lists.linux.dev>; Tue, 31 Oct 2023 11:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from loongson.cn (unknown [112.20.110.17])
	by gateway (Coremail) with SMTP id _____8AxZ+iZ30Bla+41AA--.4278S3;
	Tue, 31 Oct 2023 19:06:01 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.110.17])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxE+SU30BlHm03AA--.56085S2;
	Tue, 31 Oct 2023 19:05:58 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	WANG Xuerui <git@xen0n.name>,
	loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 1/2] dt-bindings: thermal: loongson,ls2k-thermal: Fix binding check issues
Date: Tue, 31 Oct 2023 19:05:49 +0800
Message-Id: <944559ea3bf7ba0a1540f831ccd7d33591622b22.1698743706.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <cover.1698743706.git.zhoubinbin@loongson.cn>
References: <cover.1698743706.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxE+SU30BlHm03AA--.56085S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Kr4DXw43uF4DZrW3Zry3KFX_yoW8XryDpF
	43CryDCr1kKF17Aws0yFy8CwsxtF9Yyasrurs2kw15tFZ8Ja4aq345Kr1qq3yrCr10qFy7
	urZ29r4UCFyDArXCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVWxJr0_GcWln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y
	6r17McIj6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIEc7Cj
	xVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j0OJ5UUUUU=

Add the missing 'thermal-sensor-cells' property which is required for
every thermal sensor as it's used when using phandles.
And add the thermal-sensor.yaml reference.

Fixes: 72684d99a854 ("thermal: dt-bindings: add loongson-2 thermal")
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../bindings/thermal/loongson,ls2k-thermal.yaml        | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.yaml b/Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.yaml
index 7538469997f9..b634f57cd011 100644
--- a/Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.yaml
@@ -10,6 +10,9 @@ maintainers:
   - zhanghongchen <zhanghongchen@loongson.cn>
   - Yinbo Zhu <zhuyinbo@loongson.cn>
 
+allOf:
+  - $ref: /schemas/thermal/thermal-sensor.yaml#
+
 properties:
   compatible:
     oneOf:
@@ -26,12 +29,16 @@ properties:
   interrupts:
     maxItems: 1
 
+  '#thermal-sensor-cells':
+    const: 1
+
 required:
   - compatible
   - reg
   - interrupts
+  - '#thermal-sensor-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
@@ -41,4 +48,5 @@ examples:
         reg = <0x1fe01500 0x30>;
         interrupt-parent = <&liointc0>;
         interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
+        #thermal-sensor-cells = <1>;
     };
-- 
2.39.3

