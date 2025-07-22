Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D740B2DA76A
	for <loongarch@lists.linux.dev>; Tue, 22 Jul 2025 09:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753175491; cv=none; b=ndF0mWTy6KgLW3+Gt6eNeHsf2e+562Xh1mjLbO0uoq1AjsVXK5JAI50vF35AI36L72smUGNIpmFszl6I7du7Ud7AsGO3/G64E7zYwfX+8SRybwGIGVEpnzVVUsOq9VdhK03TG1FF8/+CwhnLBAfI+5HjPWjDPdxqqdDjas1xIZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753175491; c=relaxed/simple;
	bh=x8K278/1NnMr5mPk6ZeObaCVzYsli/dQzq8mXWSq5J0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kDus3b+X7l5PRt2sFlEm6ZxaidNR9/IdDeP3KxTq8rAVqJkzWxPsocRP7VMdcoOWaxD2olVjrUUlQlpgAw77EwH67k6BSWmvihEVj2u40KuVMWfXbHwnl1Zpg1N+J+9Ll0N1nNTHg5dbkC/+TAwWCTUQmtrJU73BGM0Zbj9hUhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.193])
	by gateway (Coremail) with SMTP id _____8Bxjay_VX9oxH8vAQ--.63071S3;
	Tue, 22 Jul 2025 17:11:27 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.193])
	by front1 (Coremail) with SMTP id qMiowJDx_8OzVX9o7bIhAA--.43818S5;
	Tue, 22 Jul 2025 17:11:25 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v1 7/8] dt-bindings: mtd: loongson,ls1b-nand-controller: Document the Loongson-2K1000 NAND controller
Date: Tue, 22 Jul 2025 17:11:06 +0800
Message-ID: <ed625518c752738cb7e24f6d4b7fb9b62a609880.1753166096.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1753166096.git.zhoubinbin@loongson.cn>
References: <cover.1753166096.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDx_8OzVX9o7bIhAA--.43818S5
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7uFy3Jw4xJr47Zw13XF1fAFc_yoW8uF18pF
	nxAayxKF12yF13urZ8Ka48GF1fZFyktw1DAFZrXry7G39xXa4UZrWYkr1rtFsxtr12qry5
	ZFy0gFW8G3ZrArbCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBvb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Cr1j6rxdM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVW3
	AVW8Xw1lYx0Ex4A2jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2
	Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Y
	z7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
	8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE
	2Ix0cI8IcVAFwI0_Ar0_tr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6x
	AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIE
	c7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jsTmfUUUUU=

Add new compatible for the Loongson-2K NAND controller used for
Loongson-2K1000 SoC.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../mtd/loongson,ls1b-nand-controller.yaml    | 58 +++++++++++++++++--
 1 file changed, 54 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/loongson,ls1b-nand-controller.yaml b/Documentation/devicetree/bindings/mtd/loongson,ls1b-nand-controller.yaml
index 4ec2b5d1e89d..07a0d9b40fdd 100644
--- a/Documentation/devicetree/bindings/mtd/loongson,ls1b-nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/loongson,ls1b-nand-controller.yaml
@@ -26,18 +26,19 @@ properties:
           - loongson,ls1b-nand-controller
           - loongson,ls1c-nand-controller
           - loongson,ls2k0500-nand-controller
+          - loongson,ls2k1000-nand-controller
       - items:
           - enum:
               - loongson,ls1a-nand-controller
           - const: loongson,ls1b-nand-controller
 
   reg:
-    maxItems: 2
+    minItems: 2
+    maxItems: 3
 
   reg-names:
-    items:
-      - const: nand
-      - const: nand-dma
+    minItems: 2
+    maxItems: 3
 
   dmas:
     maxItems: 1
@@ -54,6 +55,32 @@ required:
 
 unevaluatedProperties: false
 
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - loongson,ls2k1000-nand-controller
+
+then:
+  properties:
+    reg:
+      minItems: 3
+    reg-names:
+      items:
+        - const: nand
+        - const: nand-dma
+        - const: dma-config
+
+else:
+  properties:
+    reg:
+      maxItems: 2
+    reg-names:
+      items:
+        - const: nand
+        - const: nand-dma
+
 examples:
   - |
     nand-controller@1fe78000 {
@@ -72,3 +99,26 @@ examples:
             nand-ecc-algo = "hamming";
         };
     };
+
+  - |
+    nand-controller@1fe26000 {
+        compatible = "loongson,ls2k1000-nand-controller";
+        reg = <0x1fe26000 0x24>,
+              <0x1fe26040 0x4>,
+              <0x1fe00438 0x8>;
+        reg-names = "nand", "nand-dma", "dma-config";
+        dmas = <&apbdma0 0>;
+        dma-names = "rxtx";
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        nand@0 {
+            reg = <0>;
+            label = "ls2k1000-nand";
+            nand-use-soft-ecc-engine;
+            nand-ecc-algo = "bch";
+            nand-ecc-strength = <8>;
+            nand-ecc-step-size = <512>;
+        };
+    };
-- 
2.47.3

