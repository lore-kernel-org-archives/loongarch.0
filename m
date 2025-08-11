Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD0F726E158
	for <loongarch@lists.linux.dev>; Mon, 11 Aug 2025 06:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754892225; cv=none; b=gvzLAbXNCGsb51I20KH0lRY3lkBew/P3KS20AL0FNGdLWXeV3i5KlrglIMZij6yt1vBfnz3aLq1XvdSGHbODpSumSKUrAU9jLxtMCc0JhOLjDg/iWsp3Q4Usw4VrMxb3awxt4zecTVKcGHRId4TY0GzRtSv3Vfau+YfjOn1IevI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754892225; c=relaxed/simple;
	bh=0wVviiyWpRTGwPwyz1H+d13LQrzM589Tl1MtkYHMZV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nBf38LW5gvnIa/IRW3ZvZqMuNlNsHC7N3aLF8rJRleRuMX8NcgwhyOvm3t3wHveqBuWU/KnWj9rXXrE+aQylZntV3PDvSQUDctHKVlFGfkkVMQw71aAmpFC5r+VzPzagGcRswUbCpHNkGpDrUYl8oOVdPrsJHVmsPoMVqJ51HWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.45])
	by gateway (Coremail) with SMTP id _____8BxYa+9h5lo+UI+AQ--.12959S3;
	Mon, 11 Aug 2025 14:03:41 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.45])
	by front1 (Coremail) with SMTP id qMiowJAxVOSrh5loVlVCAA--.52188S5;
	Mon, 11 Aug 2025 14:03:36 +0800 (CST)
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
Subject: [PATCH v2 7/8] dt-bindings: mtd: loongson,ls1b-nand-controller: Document the Loongson-2K1000 NAND controller
Date: Mon, 11 Aug 2025 14:03:14 +0800
Message-ID: <e6568dad8dfc1c2fba6b31a1fbb113e82f8c5da5.1754890670.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1754890670.git.zhoubinbin@loongson.cn>
References: <cover.1754890670.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxVOSrh5loVlVCAA--.52188S5
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7uFy3Ar1fCr43Ww1kGryrZrc_yoW8ZFWDpF
	nxAayfKF12yF13uFZ8Ka48Gr13ZFyktw1DJFZrXryxG39xXa4UZrWakr1rtFsxtr12qry5
	ZFy0gF48J3ZFyrbCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
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
 .../mtd/loongson,ls1b-nand-controller.yaml    | 50 ++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/loongson,ls1b-nand-controller.yaml b/Documentation/devicetree/bindings/mtd/loongson,ls1b-nand-controller.yaml
index 4ec2b5d1e89d..cf85d0cede00 100644
--- a/Documentation/devicetree/bindings/mtd/loongson,ls1b-nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/loongson,ls1b-nand-controller.yaml
@@ -26,18 +26,22 @@ properties:
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
+    minItems: 2
     items:
       - const: nand
       - const: nand-dma
+      - const: dma-config
 
   dmas:
     maxItems: 1
@@ -54,6 +58,27 @@ required:
 
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
+      minItems: 3
+
+else:
+  properties:
+    reg:
+      maxItems: 2
+    reg-names:
+      maxItems: 2
+
 examples:
   - |
     nand-controller@1fe78000 {
@@ -72,3 +97,26 @@ examples:
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

