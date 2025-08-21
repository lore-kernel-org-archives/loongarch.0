Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEE962853EE
	for <loongarch@lists.linux.dev>; Thu, 21 Aug 2025 06:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755758406; cv=none; b=QTcSiFvlSfACHUC5VltEKbEPy5JdsKXuwzZ2KRNXDcvclE0aut03C198vzrVFmBgdMvdddeLYM5n0+VrzcDgktKZN4mZOiYYAzn1rv1sfScN33UHAsXdM376kz2MSGGbRBUN8XIhE5mBYnNiXXmEVuZ7SHjgXfasqBC/FaNR1zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755758406; c=relaxed/simple;
	bh=XRY6xVK2vyBEDQo2juPLvUD6poNLRhV4ZmGowSJal1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nYxaHpOJ/8IunI8U2PBlkrnyfGH34dV3Ye7NaOaKOkImxL2SCq2p/NVnW7ovtpUSA/Rf1tfVL/z/qOJbzTSKLWX6o8BUmtupj1EH5Dkbls9zJMXr4quvSn57CS+ctD+DbpHVgAeJh9YDQx4ygHDdE1/K8VWpVbOc4JpfqCHmBuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.45])
	by gateway (Coremail) with SMTP id _____8DxN9Erv6Zo+E0BAA--.2441S3;
	Thu, 21 Aug 2025 14:39:39 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.45])
	by front1 (Coremail) with SMTP id qMiowJDxrcEhv6ZowvRcAA--.65049S4;
	Thu, 21 Aug 2025 14:39:38 +0800 (CST)
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
	Binbin Zhou <zhoubinbin@loongson.cn>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH v3 6/7] dt-bindings: mtd: loongson,ls1b-nand-controller: Document the Loongson-2K1000 NAND controller
Date: Thu, 21 Aug 2025 14:39:20 +0800
Message-ID: <9466d5875cc026c961298ed0d90d104f9841a9e4.1755757841.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1755757841.git.zhoubinbin@loongson.cn>
References: <cover.1755757841.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxrcEhv6ZowvRcAA--.65049S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7uFy3Ar1fCr43Ww1kGryrZrc_yoW8ury5pF
	9xAayfKF12yF13uFZ8Ka48Gr13ZFyktw1DJFZrJryxG39xXa4UZryakr1rtFsxtr12qry5
	ZFy0gF48G3ZFyrbCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Wrv_
	ZF1lYx0Ex4A2jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Ar0_tr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIEc7Cj
	xVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jxhL8UUUUU=

Add new compatible for the Loongson-2K NAND controller used for
Loongson-2K1000 SoC.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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

