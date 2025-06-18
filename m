Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51D1221A447
	for <loongarch@lists.linux.dev>; Wed, 18 Jun 2025 08:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750234089; cv=none; b=WP41it5NCg1yKbk2To9H9HsU4q0y2c2jhkVUrHe8nM6xEynDBZR+9muOT05u3rwlgo/Q48M0sJfq8XYtr+90S9ltv/uk2PWCyoSFjSy/nN47sgAI3pWJnVOS+IxxmYtF9yh77Xo8Z/F0RZ5Ad+eIYvF1aIPCyY4jcPKFFOFfX88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750234089; c=relaxed/simple;
	bh=6yyNlj5vw6z0l2dJcNP/J8vslBLojEUWd2Uc3VcDO7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aLHVPaI5CkAQEL/J7EWbjeE3ImVBYs3aEP69G91OgwynIBL/j/bpKTy6hGG0tNe3DRT9F1NQKEbXj8omz7oCm6O7e2EGjSTJ4OGgNjKbne4zFroo469NlEGC+i+lfmggOUJUL8diPDfHQx1hWxUJwJKAjorklDRQgCw2tliKCog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.149])
	by gateway (Coremail) with SMTP id _____8DxCeHgc1JobvsYAQ--.16378S3;
	Wed, 18 Jun 2025 16:08:00 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.149])
	by front1 (Coremail) with SMTP id qMiowMDxH+XIc1JoikkfAQ--.28608S5;
	Wed, 18 Jun 2025 16:07:51 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	linux-mmc@vger.kernel.org,
	wanghongliang@loongson.cn,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 3/4] dt-bindings: mmc: loongson,ls2k0500-mmc: Add compatible for Loongson-2K2000
Date: Wed, 18 Jun 2025 16:07:27 +0800
Message-ID: <1c1c300515cc90bed3c95c2e7785b65eac96340f.1750216134.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1750216134.git.zhoubinbin@loongson.cn>
References: <cover.1750216134.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMDxH+XIc1JoikkfAQ--.28608S5
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7WryrZr15uF17Zw13CF45Jwc_yoW5Jr4rpa
	9xCwsrGr40qF13urZ8Ca48Cw15ZrykC3ZrJFsrJw1UGwsxW3yYq343KFyFqay3CrWIqFW7
	Zry8Cw45uasrCrcCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v2
	6r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07josjUUUUUU=

Add the devicetree compatible for Loongson-2K2000 EMMC/SD/SDIO controller.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../bindings/mmc/loongson,ls2k0500-mmc.yaml   | 47 ++++++++++++++++++-
 1 file changed, 45 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/loongson,ls2k0500-mmc.yaml b/Documentation/devicetree/bindings/mmc/loongson,ls2k0500-mmc.yaml
index f2f10b2c618c..c142421bc723 100644
--- a/Documentation/devicetree/bindings/mmc/loongson,ls2k0500-mmc.yaml
+++ b/Documentation/devicetree/bindings/mmc/loongson,ls2k0500-mmc.yaml
@@ -9,6 +9,9 @@ title: The SD/SDIO/eMMC host controller for Loongson-2K family SoCs
 description:
   The MMC host controller on the Loongson-2K0500/2K1000 (using an externally
   shared apbdma controller) provides the SD and SDIO device interfaces.
+  The two MMC host controllers on the Loongson-2K2000 are similar,
+  except that they use internal exclusive DMA. one controller provides
+  the eMMC interface and the other provides the SD/SDIO interface.
 
 maintainers:
   - Binbin Zhou <zhoubinbin@loongson.cn>
@@ -21,8 +24,10 @@ properties:
     enum:
       - loongson,ls2k0500-mmc
       - loongson,ls2k1000-mmc
+      - loongson,ls2k2000-mmc
 
   reg:
+    minItems: 1
     items:
       - description: Loongson-2K MMC controller registers.
       - description: APB DMA config register for Loongson-2K MMC controller.
@@ -44,11 +49,31 @@ required:
   - reg
   - interrupts
   - clocks
-  - dmas
-  - dma-names
 
 unevaluatedProperties: false
 
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - loongson,ls2k0500-mmc
+          - loongson,ls2k1000-mmc
+
+then:
+  properties:
+    reg:
+      minItems: 2
+
+  required:
+    - dmas
+    - dma-names
+
+else:
+  properties:
+    reg:
+      maxItems: 1
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
@@ -67,3 +92,21 @@ examples:
         bus-width = <4>;
         cd-gpios = <&gpio0 22 GPIO_ACTIVE_LOW>;
     };
+
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/loongson,ls2k-clk.h>
+
+    mmc@79990000 {
+        compatible = "loongson,ls2k2000-mmc";
+        reg = <0x79990000 0x1000>;
+        interrupt-parent = <&pic>;
+        interrupts = <51 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clk LOONGSON2_EMMC_CLK>;
+        bus-width = <8>;
+        non-removable;
+        cap-mmc-highspeed;
+        mmc-hs200-1_8v;
+        no-sd;
+        no-sdio;
+    };
-- 
2.47.1

